/*
* Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
*
* This program is free software; you can redistribute it and/or modify it
* under the terms of the GNU General Public License as published by the
* Free Software Foundation; either version 2 of the License, or (at your
* option) any later version.
*
* This program is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
* more details.
*
* You should have received a copy of the GNU General Public License along
* with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "InstanceScript.h"
#include "ScriptedCreature.h"
#include "Map.h"
#include "PoolMgr.h"
#include "icecrown_citadel.h"

DoorData const doorData[] =
{
    {GO_LORD_MARROWGAR_S_ENTRANCE, DATA_LORD_MARROWGAR, DOOR_TYPE_ROOM, BOUNDARY_N },
    {GO_ICEWALL, DATA_LORD_MARROWGAR, DOOR_TYPE_PASSAGE, BOUNDARY_NONE},
    {GO_DOODAD_ICECROWN_ICEWALL02, DATA_LORD_MARROWGAR, DOOR_TYPE_PASSAGE, BOUNDARY_NONE},
    {GO_ORATORY_OF_THE_DAMNED_ENTRANCE, DATA_LADY_DEATHWHISPER, DOOR_TYPE_ROOM, BOUNDARY_N },
    {GO_SAURFANG_S_DOOR, DATA_DEATHBRINGER_SAURFANG, DOOR_TYPE_PASSAGE, BOUNDARY_NONE},
    {GO_ORANGE_PLAGUE_MONSTER_ENTRANCE, DATA_FESTERGUT, DOOR_TYPE_ROOM, BOUNDARY_E },
    {GO_GREEN_PLAGUE_MONSTER_ENTRANCE, DATA_ROTFACE, DOOR_TYPE_ROOM, BOUNDARY_E },
    {GO_SCIENTIST_ENTRANCE, DATA_PROFESSOR_PUTRICIDE, DOOR_TYPE_ROOM, BOUNDARY_E },
    {GO_CRIMSON_HALL_DOOR, DATA_BLOOD_PRINCE_COUNCIL, DOOR_TYPE_ROOM, BOUNDARY_S },
    {GO_BLOOD_ELF_COUNCIL_DOOR, DATA_BLOOD_PRINCE_COUNCIL, DOOR_TYPE_PASSAGE, BOUNDARY_W },
    {GO_BLOOD_ELF_COUNCIL_DOOR_RIGHT, DATA_BLOOD_PRINCE_COUNCIL, DOOR_TYPE_PASSAGE, BOUNDARY_E },
    {GO_DOODAD_ICECROWN_BLOODPRINCE_DOOR_01, DATA_BLOOD_QUEEN_LANA_THEL, DOOR_TYPE_ROOM, BOUNDARY_S },
    {GO_DOODAD_ICECROWN_GRATE_01, DATA_BLOOD_QUEEN_LANA_THEL, DOOR_TYPE_PASSAGE, BOUNDARY_NONE},
    {GO_GREEN_DRAGON_BOSS_ENTRANCE, DATA_VALITHRIA_DREAMWALKER, DOOR_TYPE_ROOM, BOUNDARY_N },
    {GO_GREEN_DRAGON_BOSS_EXIT, DATA_VALITHRIA_DREAMWALKER, DOOR_TYPE_PASSAGE, BOUNDARY_S },
    {GO_SINDRAGOSA_ENTRANCE_DOOR, DATA_SINDRAGOSA, DOOR_TYPE_ROOM, BOUNDARY_S },
    {GO_SINDRAGOSA_SHORTCUT_ENTRANCE_DOOR, DATA_SINDRAGOSA, DOOR_TYPE_PASSAGE, BOUNDARY_E },
    {GO_SINDRAGOSA_SHORTCUT_EXIT_DOOR, DATA_SINDRAGOSA, DOOR_TYPE_PASSAGE, BOUNDARY_NONE},
    {GO_ICE_WALL, DATA_SINDRAGOSA, DOOR_TYPE_ROOM, BOUNDARY_SE },
    {GO_ICE_WALL, DATA_SINDRAGOSA, DOOR_TYPE_ROOM, BOUNDARY_SW },
    {0, 0, DOOR_TYPE_ROOM, BOUNDARY_NONE} // END
};

// this doesnt have to only store questgivers, also can be used for related quest spawns
struct WeeklyQuest
{
    uint32 creatureEntry;
    uint32 questId[2]; // 10 and 25 man versions
};

// when changing the content, remember to update SetData, DATA_BLOOD_QUICKENING_STATE case for NPC_ALRIN_THE_AGILE index
WeeklyQuest const WeeklyQuestData[WeeklyNPCs] =
{
    {NPC_INFILTRATOR_MINCHAR, {QUEST_DEPROGRAMMING_10, QUEST_DEPROGRAMMING_25 }}, // Deprogramming
    {NPC_KOR_KRON_LIEUTENANT, {QUEST_SECURING_THE_RAMPARTS_10, QUEST_SECURING_THE_RAMPARTS_25 }}, // Securing the Ramparts
    {NPC_ROTTING_FROST_GIANT_10, {QUEST_SECURING_THE_RAMPARTS_10, QUEST_SECURING_THE_RAMPARTS_25 }}, // Securing the Ramparts
    {NPC_ROTTING_FROST_GIANT_25, {QUEST_SECURING_THE_RAMPARTS_10, QUEST_SECURING_THE_RAMPARTS_25 }}, // Securing the Ramparts
    {NPC_ALCHEMIST_ADRIANNA, {QUEST_RESIDUE_RENDEZVOUS_10, QUEST_RESIDUE_RENDEZVOUS_25 }}, // Residue Rendezvous
    {NPC_ALRIN_THE_AGILE, {QUEST_BLOOD_QUICKENING_10, QUEST_BLOOD_QUICKENING_25 }}, // Blood Quickening
    {NPC_INFILTRATOR_MINCHAR_BQ, {QUEST_BLOOD_QUICKENING_10, QUEST_BLOOD_QUICKENING_25 }}, // Blood Quickening
    {NPC_MINCHAR_BEAM_STALKER, {QUEST_BLOOD_QUICKENING_10, QUEST_BLOOD_QUICKENING_25 }}, // Blood Quickening
    {NPC_VALITHRIA_DREAMWALKER_QUEST, {QUEST_RESPITE_FOR_A_TORNMENTED_SOUL_10, QUEST_RESPITE_FOR_A_TORNMENTED_SOUL_25}}, // Respite for a Tormented Soul
};

class instance_icecrown_citadel : public InstanceMapScript
{
    public:
        instance_icecrown_citadel() : InstanceMapScript(ICCScriptName, 631) { }

        struct instance_icecrown_citadel_InstanceMapScript : public InstanceScript
        {
            instance_icecrown_citadel_InstanceMapScript(InstanceMap* map) : InstanceScript(map)
            {
                SetBossNumber(EncounterCount);
                LoadDoorData(doorData);
                teamInInstance = 0;
                heroicAttempts = MaxHeroicAttempts;
                ladyDeathwisperElevator = 0;
                deathbringerSaurfang = 0;
                saurfangDoor = 0;
                saurfangEventNPC = 0;
                deathbringersCache = 0;
                saurfangTeleport = 0;
                plagueSigil = 0;
                bloodwingSigil = 0;
                frostwingSigil = 0;
                memset(putricidePipes, 0, 2*sizeof(uint64));
                memset(putricideGates, 0, 2*sizeof(uint64));
                putricideCollision = 0;
                festergut = 0;
                rotface = 0;
                professorPutricide = 0;
                putricideTable = 0;
                memset(bloodCouncil, 0, 3*sizeof(uint64));
                bloodCouncilController = 0;
                bloodQueenLanaThel = 0;
                sindragosa = 0;
                spinestalker = 0;
                rimefang = 0;
                frostwyrms = 0;
                spinestalkerTrash = 0;
                rimefangTrash = 0;
                isBonedEligible = true;
                isOozeDanceEligible = true;
                isNauseaEligible = true;
                isOrbWhispererEligible = true;
                coldflameJetsState = NOT_STARTED;
                bloodQuickeningState = NOT_STARTED;
                bloodQuickeningTimer = 0;
                bloodQuickeningMinutes = 0;
                ValithriaDreamwalker = 0;
                ValithriaAlternative = 0;
                ValithriaCombatTrigger = 0;
                LichKing = 0;
                Tirion = 0;
                TerenasFighter = 0;
                SpiritWarden = 0;
                NecroticStack = 0;
                BeenWaiting = 0;
                NeckDeep = 0;
                RoostDoor1 = 0;
                RoostDoor2 = 0;
                RoostDoor3 = 0;
                RoostDoor4 = 0;
                ValithriaTransporter = 0;
                SpiritAlarm1 = 0;
                SpiritAlarm2 = 0;
                SpiritAlarm3 = 0;
                SpiritAlarm4 = 0;
                isPortalJockeyEligible = 0;
                IceShard1 = 0;
                IceShard2 = 0;
                IceShard3 = 0;
                IceShard4 = 0;
                FrostyEdgeInner = 0;
                FrostyEdgeOuter = 0;
                EdgeDestroyWarning = 0;
                lavaman = 0;
                hangingman = 0;
            }

            void FillInitialWorldStates(WorldPacket& data)
            {
                data << uint32(WORLDSTATE_SHOW_TIMER) << uint32(bloodQuickeningState == IN_PROGRESS);
                data << uint32(WORLDSTATE_EXECUTION_TIME) << uint32(bloodQuickeningMinutes);
                data << uint32(WORLDSTATE_SHOW_ATTEMPTS) << uint32(instance->IsHeroic());
                data << uint32(WORLDSTATE_ATTEMPTS_REMAINING) << uint32(heroicAttempts);
                data << uint32(WORLDSTATE_ATTEMPTS_MAX) << uint32(MaxHeroicAttempts);
            }

            void OnPlayerEnter(Player* player)
            {
                if (!teamInInstance)
                    teamInInstance = player->GetTeam();
            }

            void OnCreatureCreate(Creature* creature)
            {
                if (!teamInInstance)
                {
                    Map::PlayerList const &players = instance->GetPlayers();
                    if (!players.isEmpty())
                        if (Player* player = players.begin()->getSource())
                            teamInInstance = player->GetTeam();
                }

                switch (creature->GetEntry())
                {
                    case NPC_KOR_KRON_GENERAL:
                        if (teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_ALLIANCE_COMMANDER, ALLIANCE);
                        break;
                    case NPC_KOR_KRON_LIEUTENANT:
                        if (teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_SKYBREAKER_LIEUTENANT, ALLIANCE);
                        break;
                    case NPC_TORTUNOK:
                        if (teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_ALANA_MOONSTRIKE, ALLIANCE);
                        break;
                    case NPC_GERARDO_THE_SUAVE:
                        if (teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_TALAN_MOONSTRIKE, ALLIANCE);
                        break;
                    case NPC_UVLUS_BANEFIRE:
                        if (teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_MALFUS_GRIMFROST, ALLIANCE);
                        break;
                    case NPC_IKFIRUS_THE_VILE:
                        if (teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_YILI, ALLIANCE);
                        break;
                    case NPC_VOL_GUK:
                        if (teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_JEDEBIA, ALLIANCE);
                        break;
                    case NPC_HARAGG_THE_UNSEEN:
                        if (teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_NIBY_THE_ALMIGHTY, ALLIANCE);
                        break;
                    case NPC_GARROSH_HELLSCREAM:
                        if (teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_KING_VARIAN_WRYNN, ALLIANCE);
                        break;
                    case NPC_DEATHBRINGER_SAURFANG:
                        deathbringerSaurfang = creature->GetGUID();
                        break;
                    case NPC_SE_HIGH_OVERLORD_SAURFANG:
                        if (teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_SE_MURADIN_BRONZEBEARD, ALLIANCE, creature->GetCreatureData());
                    case NPC_SE_MURADIN_BRONZEBEARD:
                        saurfangEventNPC = creature->GetGUID();
                        creature->LastUsedScriptID = creature->GetScriptId();
                        break;
                    case NPC_SE_KOR_KRON_REAVER:
                        if (teamInInstance == ALLIANCE)
                            creature->UpdateEntry(NPC_SE_SKYBREAKER_MARINE, ALLIANCE);
                        break;
                    case NPC_FROST_FREEZE_TRAP:
                        coldflameJets.insert(creature->GetGUID());
                        break;
                    case NPC_FESTERGUT:
                        festergut = creature->GetGUID();
                        break;
                    case NPC_ROTFACE:
                        rotface = creature->GetGUID();
                        break;
                    case NPC_PROFESSOR_PUTRICIDE:
                        professorPutricide = creature->GetGUID();
                        break;
                    case NPC_PRINCE_KELESETH:
                        bloodCouncil[0] = creature->GetGUID();
                        break;
                    case NPC_PRINCE_TALDARAM:
                        bloodCouncil[1] = creature->GetGUID();
                        break;
                    case NPC_PRINCE_VALANAR:
                        bloodCouncil[2] = creature->GetGUID();
                        break;
                    case NPC_BLOOD_ORB_CONTROLLER:
                        bloodCouncilController = creature->GetGUID();
                        break;
                    case NPC_BLOOD_QUEEN_LANA_THEL:
                        bloodQueenLanaThel = creature->GetGUID();
                        break;
                    case NPC_SINDRAGOSA:
                        sindragosa = creature->GetGUID();
                        break;
                    case NPC_SPINESTALKER:
                        spinestalker = creature->GetGUID();
                        if (!creature->isDead())
                            ++frostwyrms;
                        break;
                    case NPC_RIMEFANG:
                        rimefang = creature->GetGUID();
                        if (!creature->isDead())
                            ++frostwyrms;
                        break;
                    case NPC_VALITHRIA_DREAMWALKER:
                        ValithriaDreamwalker = creature->GetGUID();
                        break;
                    case NPC_VALITHRIA_ALTERNATIVE:
                        ValithriaAlternative = creature->GetGUID();
                        break;
                    case NPC_COMBAT_TRIGGER:
                        ValithriaCombatTrigger = creature->GetGUID();
                        creature->SetReactState(REACT_AGGRESSIVE);
                        creature->SetSpeed(MOVE_RUN, 0.0f, true);
                        creature->SetSpeed(MOVE_WALK, 0.0f, true);
                        creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NOT_SELECTABLE);
                        creature->SetVisible(false);
                        break;
                    case NPC_LICH_KING:
                        LichKing = creature->GetGUID();
                        break;
                    case NPC_TIRION_ICC:
                        Tirion = creature->GetGUID();
                        break;
                    case NPC_TERENAS_FIGHTER:
                        TerenasFighter = creature->GetGUID();
                        break;
                    case NPC_SPIRIT_WARDEN:
                        SpiritWarden = creature->GetGUID();
                        break;
                    default:
                        break;
                }
            }

            // Weekly quest spawn prevention
            uint32 GetCreatureEntry(uint32 /*guidLow*/, CreatureData const* data)
            {
                uint32 entry = data->id;
                switch (entry)
                {
                    case NPC_INFILTRATOR_MINCHAR:
                    case NPC_KOR_KRON_LIEUTENANT:
                    case NPC_ALCHEMIST_ADRIANNA:
                    case NPC_ALRIN_THE_AGILE:
                    case NPC_INFILTRATOR_MINCHAR_BQ:
                    case NPC_MINCHAR_BEAM_STALKER:
                    case NPC_VALITHRIA_DREAMWALKER_QUEST:
                    {
                        for (uint8 questIndex = 0; questIndex < WeeklyNPCs; ++questIndex)
                        {
                            if (WeeklyQuestData[questIndex].creatureEntry == entry)
                            {
                                uint8 diffIndex = uint8(instance->GetSpawnMode() & 1);
                                if (!sPoolMgr->IsSpawnedObject<Quest>(WeeklyQuestData[questIndex].questId[diffIndex]))
                                    entry = 0;
                                break;
                            }
                        }
                        break;
                    }
                    default:
                        break;
                }

                return entry;
            }

            void OnCreatureRemove(Creature* creature)
            {
                if (creature->GetEntry() == NPC_FROST_FREEZE_TRAP)
                    coldflameJets.erase(creature->GetGUID());
            }

            void OnGameObjectCreate(GameObject* go)
            {
                switch (go->GetEntry())
                {
                    case GO_DOODAD_ICECROWN_ICEWALL02:
                    case GO_ICEWALL:
                    case GO_LORD_MARROWGAR_S_ENTRANCE:
                    case GO_ORATORY_OF_THE_DAMNED_ENTRANCE:
                    case GO_ORANGE_PLAGUE_MONSTER_ENTRANCE:
                    case GO_GREEN_PLAGUE_MONSTER_ENTRANCE:
                    case GO_SCIENTIST_ENTRANCE:
                    case GO_CRIMSON_HALL_DOOR:
                    case GO_BLOOD_ELF_COUNCIL_DOOR:
                    case GO_BLOOD_ELF_COUNCIL_DOOR_RIGHT:
                    case GO_DOODAD_ICECROWN_BLOODPRINCE_DOOR_01:
                    case GO_DOODAD_ICECROWN_GRATE_01:
                    case GO_GREEN_DRAGON_BOSS_ENTRANCE:
                    case GO_GREEN_DRAGON_BOSS_EXIT:
                    case GO_SINDRAGOSA_ENTRANCE_DOOR:
                    case GO_SINDRAGOSA_SHORTCUT_ENTRANCE_DOOR:
                    case GO_SINDRAGOSA_SHORTCUT_EXIT_DOOR:
                    case GO_ICE_WALL:
                        AddDoor(go, true);
                        break;
                    case GO_LADY_DEATHWHISPER_ELEVATOR:
                        ladyDeathwisperElevator = go->GetGUID();
                        if (GetBossState(DATA_LADY_DEATHWHISPER) == DONE)
                        {
                            go->SetUInt32Value(GAMEOBJECT_LEVEL, 0);
                            go->SetGoState(GO_STATE_READY);
                        }
                        break;
                    case GO_SAURFANG_S_DOOR:
                        saurfangDoor = go->GetGUID();
                        AddDoor(go, true);
                        break;
                    case GO_DEATHBRINGER_S_CACHE_10N:
                    case GO_DEATHBRINGER_S_CACHE_25N:
                    case GO_DEATHBRINGER_S_CACHE_10H:
                    case GO_DEATHBRINGER_S_CACHE_25H:
                        deathbringersCache = go->GetGUID();
                        break;
                    case GO_SCOURGE_TRANSPORTER_SAURFANG:
                        saurfangTeleport = go->GetGUID();
                        break;
                    case GO_PLAGUE_SIGIL:
                        plagueSigil = go->GetGUID();
                        if (GetBossState(DATA_PROFESSOR_PUTRICIDE) == DONE)
                            HandleGameObject(plagueSigil, false, go);
                        break;
                    case GO_BLOODWING_SIGIL:
                        bloodwingSigil = go->GetGUID();
                        if (GetBossState(DATA_BLOOD_QUEEN_LANA_THEL) == DONE)
                            HandleGameObject(bloodwingSigil, false, go);
                        break;
                    case GO_SIGIL_OF_THE_FROSTWING:
                        frostwingSigil = go->GetGUID();
                        if (GetBossState(DATA_SINDRAGOSA) == DONE)
                            HandleGameObject(frostwingSigil, false, go);
                        break;
                    case GO_SCIENTIST_AIRLOCK_DOOR_COLLISION:
                        putricideCollision = go->GetGUID();
                        if (GetBossState(DATA_FESTERGUT) == DONE && GetBossState(DATA_ROTFACE) == DONE)
                            HandleGameObject(putricideCollision, true, go);
                        break;
                    case GO_SCIENTIST_AIRLOCK_DOOR_ORANGE:
                        putricideGates[0] = go->GetGUID();
                        if (GetBossState(DATA_FESTERGUT) == DONE && GetBossState(DATA_ROTFACE) == DONE)
                            go->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                        else if (GetBossState(DATA_FESTERGUT) == DONE)
                            HandleGameObject(putricideGates[1], false, go);
                        break;
                    case GO_SCIENTIST_AIRLOCK_DOOR_GREEN:
                        putricideGates[1] = go->GetGUID();
                        if (GetBossState(DATA_ROTFACE) == DONE && GetBossState(DATA_FESTERGUT) == DONE)
                            go->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                        else if (GetBossState(DATA_ROTFACE) == DONE)
                            HandleGameObject(putricideGates[1], false, go);
                        break;
                    case GO_DOODAD_ICECROWN_ORANGETUBES02:
                        putricidePipes[0] = go->GetGUID();
                        if (GetBossState(DATA_FESTERGUT) == DONE)
                            HandleGameObject(putricidePipes[0], true, go);
                        break;
                    case GO_DOODAD_ICECROWN_GREENTUBES02:
                        putricidePipes[1] = go->GetGUID();
                        if (GetBossState(DATA_ROTFACE) == DONE)
                            HandleGameObject(putricidePipes[1], true, go);
                        break;
                    case GO_DRINK_ME:
                        putricideTable = go->GetGUID();
                        break;
                    case GO_SPIRIT_ALARM1:
                        SpiritAlarm1 = go->GetGUID();
                        break;
                    case GO_SPIRIT_ALARM2:
                        SpiritAlarm2 = go->GetGUID();
                        break;
                    case GO_SPIRIT_ALARM3:
                        SpiritAlarm3 = go->GetGUID();
                        go->SetPhaseMask(2, true);
                        break;
                    case GO_SPIRIT_ALARM4:
                        SpiritAlarm4 = go->GetGUID();
                        go->SetPhaseMask(2, true);
                        break;
                    case GO_DREAMWALKER_CACHE_10_N:
                        if(instance->GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL)
                            DreamwalkerCache = go->GetGUID();
                        break;
                    case GO_DREAMWALKER_CACHE_25_N:
                        if(instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL)
                            DreamwalkerCache = go->GetGUID();
                        break;
                    case GO_DREAMWALKER_CACHE_10_H:
                        if(instance->GetDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC)
                            DreamwalkerCache = go->GetGUID();
                        break;
                    case GO_DREAMWALKER_CACHE_25_H:
                        if(instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
                            DreamwalkerCache = go->GetGUID();
                        break;
                    case GO_DREAMWALKER_DOOR_1:
                        RoostDoor1 = go->GetGUID();
                        break;
                    case GO_DREAMWALKER_DOOR_2:
                        RoostDoor2 = go->GetGUID();
                        break;
                    case GO_DREAMWALKER_DOOR_3:
                        RoostDoor3 = go->GetGUID();
                        break;
                    case GO_DREAMWALKER_DOOR_4:
                        RoostDoor4 = go->GetGUID();
                        break;
                    case GO_VALITHRIA_ELEVATOR:
                        ValithriaTransporter = go->GetGUID();
                        if (GetBossState(DATA_VALITHRIA_DREAMWALKER) == DONE)
                        {
                            go->SetUInt32Value(GAMEOBJECT_LEVEL, 0);
                            go->SetGoState(GO_STATE_READY);
                        }
                        break;
                    //Lich King
                    case GO_LAVAMAN:
                        lavaman = go->GetGUID();
                        break;
                    case GO_HANGINGMAN:
                        hangingman = go->GetGUID();
                        break;
                    case GO_ICE_SHARD_1:
                        IceShard1 = go->GetGUID();
                        if(GetBossState(DATA_THE_LICH_KING) == DONE)
                            go->SetGoState(GO_STATE_ACTIVE);
                        else
                            go->SetGoState(GO_STATE_READY);
                        break;
                    case GO_ICE_SHARD_2:
                        IceShard2 = go->GetGUID();
                        if(GetBossState(DATA_THE_LICH_KING) == DONE)
                            go->SetGoState(GO_STATE_ACTIVE);
                        else
                            go->SetGoState(GO_STATE_READY);
                        break;
                    case GO_ICE_SHARD_3:
                        IceShard3 = go->GetGUID();
                        if(GetBossState(DATA_THE_LICH_KING) == DONE)
                            go->SetGoState(GO_STATE_ACTIVE);
                        else
                            go->SetGoState(GO_STATE_READY);
                        break;
                    case GO_ICE_SHARD_4:
                        IceShard4 = go->GetGUID();
                        if(GetBossState(DATA_THE_LICH_KING) == DONE)
                            go->SetGoState(GO_STATE_ACTIVE);
                        else
                            go->SetGoState(GO_STATE_READY);
                        break;
                    case GO_FROSTY_EDGE_OUTER:
                        FrostyEdgeOuter = go->GetGUID();
                        go->SetGoState(GO_STATE_ACTIVE);
                        break;
                    case GO_FROSTY_EDGE_INNER:
                        FrostyEdgeInner = go->GetGUID();
                        go->SetGoState(GO_STATE_READY);
                        break;
                    case GO_EDGE_DESTROY_WARNING:
                        EdgeDestroyWarning = go->GetGUID();
                        go->SetGoState(GO_STATE_READY);
                        break;
                    default:
                        break;
                }
            }

            void OnGameObjectRemove(GameObject* go)
            {
                switch (go->GetEntry())
                {
                    case GO_DOODAD_ICECROWN_ICEWALL02:
                    case GO_ICEWALL:
                    case GO_LORD_MARROWGAR_S_ENTRANCE:
                    case GO_ORATORY_OF_THE_DAMNED_ENTRANCE:
                    case GO_SAURFANG_S_DOOR:
                    case GO_ORANGE_PLAGUE_MONSTER_ENTRANCE:
                    case GO_GREEN_PLAGUE_MONSTER_ENTRANCE:
                    case GO_SCIENTIST_ENTRANCE:
                    case GO_CRIMSON_HALL_DOOR:
                    case GO_BLOOD_ELF_COUNCIL_DOOR:
                    case GO_BLOOD_ELF_COUNCIL_DOOR_RIGHT:
                    case GO_DOODAD_ICECROWN_BLOODPRINCE_DOOR_01:
                    case GO_DOODAD_ICECROWN_GRATE_01:
                    case GO_GREEN_DRAGON_BOSS_ENTRANCE:
                    case GO_GREEN_DRAGON_BOSS_EXIT:
                    case GO_SINDRAGOSA_ENTRANCE_DOOR:
                    case GO_SINDRAGOSA_SHORTCUT_ENTRANCE_DOOR:
                    case GO_SINDRAGOSA_SHORTCUT_EXIT_DOOR:
                    case GO_ICE_WALL:
                        AddDoor(go, false);
                        break;
                    default:
                        break;
                }
            }

            uint32 GetData(uint32 type)
            {
                switch (type)
                {
                    case DATA_SINDRAGOSA_FROSTWYRMS:
                        return frostwyrms;
                    case DATA_SPINESTALKER:
                        return spinestalkerTrash;
                    case DATA_RIMEFANG:
                        return rimefangTrash;
                    case DATA_COLDFLAME_JETS:
                        return coldflameJetsState;
                    case DATA_TEAM_IN_INSTANCE:
                        return teamInInstance;
                    case DATA_BLOOD_QUICKENING_STATE:
                        return bloodQuickeningState;
                    case DATA_NECK_DEEP_ACHIEVEMENT:
                        return NeckDeep;
                    case DATA_BEEN_WAITING_ACHIEVEMENT:
                        return NecroticStack;
                    case DATA_PORTAL_JOCKEY_ACHIEVEMENT:
                        return isPortalJockeyEligible ? true : false;
                    case DATA_HEROIC_ATTEMPTS:
                        return heroicAttempts;
                    default:
                        break;
                }

                return 0;
            }

            uint64 GetData64(uint32 type)
            {
                switch (type)
                {
                    case DATA_DEATHBRINGER_SAURFANG:
                        return deathbringerSaurfang;
                    case DATA_SAURFANG_EVENT_NPC:
                        return saurfangEventNPC;
                    case GO_SAURFANG_S_DOOR:
                        return saurfangDoor;
                    case GO_SCOURGE_TRANSPORTER_SAURFANG:
                        return saurfangTeleport;
                    case DATA_FESTERGUT:
                        return festergut;
                    case DATA_ROTFACE:
                        return rotface;
                    case DATA_PROFESSOR_PUTRICIDE:
                        return professorPutricide;
                    case DATA_PUTRICIDE_TABLE:
                        return putricideTable;
                    case DATA_PRINCE_KELESETH_GUID:
                        return bloodCouncil[0];
                    case DATA_PRINCE_TALDARAM_GUID:
                        return bloodCouncil[1];
                    case DATA_PRINCE_VALANAR_GUID:
                        return bloodCouncil[2];
                    case DATA_BLOOD_PRINCES_CONTROL:
                        return bloodCouncilController;
                    case DATA_BLOOD_QUEEN_LANA_THEL:
                        return bloodQueenLanaThel;
                    case DATA_SINDRAGOSA:
                        return sindragosa;
                    case DATA_SPINESTALKER:
                        return spinestalker;
                    case DATA_RIMEFANG:
                        return rimefang;
                    case DATA_VALITHRIA_DREAMWALKER:
                        return ValithriaDreamwalker;
                    case DATA_VALITHRIA_ALTERNATIVE:
                        return ValithriaAlternative;
                    case DATA_VALITHRIA_COMBAT_TRIGGER: 
                        return ValithriaCombatTrigger;
                    case DATA_THE_LICH_KING:
                    {
                        if (!LichKing || !instance->GetCreature(LichKing))
                            instance->LoadGrid(428.6f, -2123.88f);
                        return LichKing;
                    }
                    case DATA_TIRION:
                        return Tirion;
                    case DATA_SPIRIT_ALARM1:
						return SpiritAlarm1;
                    case DATA_SPIRIT_ALARM2:
						return SpiritAlarm2;
                    case DATA_SPIRIT_ALARM3:
						return SpiritAlarm3;
                    case DATA_SPIRIT_ALARM4:
						return SpiritAlarm4;
                    case DATA_LAVAMAN:
						return lavaman;
                    case DATA_HANGINGMAN:
						return hangingman;
                    case DATA_DEATHBOUND_WARD1:
						return DeathboundWard1;
                    case DATA_DEATHBOUND_WARD2:
						return DeathboundWard2;
                    case DATA_DEATHBOUND_WARD3:
						return DeathboundWard3;
                    case DATA_DEATHBOUND_WARD4:
						return DeathboundWard4;
                    case DATA_ICE_SHARD_1:
                        return IceShard1;
                    case DATA_ICE_SHARD_2:
                        return IceShard2;
                    case DATA_ICE_SHARD_3:
                        return IceShard3;
                    case DATA_ICE_SHARD_4:
                        return IceShard4;
                    case DATA_FROSTY_EDGE_OUTER:
                        return FrostyEdgeOuter;
                    case DATA_FROSTY_EDGE_INNER:
                        return FrostyEdgeInner;
                    case DATA_EDGE_DESTROY_WARNING:
                        return EdgeDestroyWarning;
                    case DATA_TERENAS_FIGHTER:
                        return TerenasFighter;
                    case DATA_SPIRIT_WARDEN:
                        return SpiritWarden;
                    default:
                        break;
                }

                return 0;
            }

            bool SetBossState(uint32 type, EncounterState state)
            {
                if (!InstanceScript::SetBossState(type, state))
                    return false;

                switch (type)
                {
                    case DATA_LADY_DEATHWHISPER:
                        SetBossState(DATA_GUNSHIP_EVENT, state); // TEMP HACK UNTIL GUNSHIP SCRIPTED
                        if (state == DONE)
                        {
                            if (GameObject* elevator = instance->GetGameObject(ladyDeathwisperElevator))
                            {
                                elevator->SetUInt32Value(GAMEOBJECT_LEVEL, 0);
                                elevator->SetGoState(GO_STATE_READY);
                            }
                        }
                        break;
                    case DATA_DEATHBRINGER_SAURFANG:
                        switch (state)
                        {
                            case DONE:
                                DoRespawnGameObject(deathbringersCache, 7*DAY);
                            case NOT_STARTED:
                                if (GameObject* teleporter = instance->GetGameObject(saurfangTeleport))
                                {
                                    HandleGameObject(saurfangTeleport, true, teleporter);
                                    teleporter->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
                                }
                                break;
                            default:
                                break;
                        }
                        break;
                    case DATA_FESTERGUT:
                        if (state == DONE)
                        {
                            if (GetBossState(DATA_ROTFACE) == DONE)
                            {
                                HandleGameObject(putricideCollision, true);
                                if (GameObject* go = instance->GetGameObject(putricideGates[0]))
                                    go->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                                if (GameObject* go = instance->GetGameObject(putricideGates[1]))
                                    go->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                            }
                            else
                                HandleGameObject(putricideGates[0], false);
                            HandleGameObject(putricidePipes[0], true);
                        }
                        break;
                    case DATA_ROTFACE:
                        if (state == DONE)
                        {
                            if (GetBossState(DATA_FESTERGUT) == DONE)
                            {
                                HandleGameObject(putricideCollision, true);
                                if (GameObject* go = instance->GetGameObject(putricideGates[0]))
                                    go->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                                if (GameObject* go = instance->GetGameObject(putricideGates[1]))
                                    go->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                            }
                            else
                                HandleGameObject(putricideGates[1], false);
                            HandleGameObject(putricidePipes[1], true);
                        }
                        break;
                    case DATA_PROFESSOR_PUTRICIDE:
                        HandleGameObject(plagueSigil, state != DONE);
                        if (instance->IsHeroic())
                        {
                            if (state == FAIL && heroicAttempts)
                            {
                                --heroicAttempts;
                                DoUpdateWorldState(WORLDSTATE_ATTEMPTS_REMAINING, heroicAttempts);
                                if (!heroicAttempts)
                                    if (Creature* putricide = instance->GetCreature(professorPutricide))
                                        putricide->DespawnOrUnsummon();
                            }
                        }
                        break;
                    case DATA_BLOOD_QUEEN_LANA_THEL:
                        HandleGameObject(bloodwingSigil, state != DONE);
                        if (instance->IsHeroic())
                        {
                            if (state == FAIL && heroicAttempts)
                            {
                                --heroicAttempts;
                                DoUpdateWorldState(WORLDSTATE_ATTEMPTS_REMAINING, heroicAttempts);
                                if (!heroicAttempts)
                                    if (Creature* bq = instance->GetCreature(bloodQueenLanaThel))
                                        bq->DespawnOrUnsummon();
                            }
                        }
                        break;
                    case DATA_VALITHRIA_DREAMWALKER:
                        if(state == DONE)
                        {
                            if (GameObject* pChest = instance->GetGameObject(DreamwalkerCache))
                                pChest->SetRespawnTime(pChest->GetRespawnDelay());
                            if (GameObject* go = instance->GetGameObject(ValithriaTransporter))
                            {
                                go->SetUInt32Value(GAMEOBJECT_LEVEL, 0);
                                go->SetGoState(GO_STATE_READY);
                            }
                        }
                        if(state == NOT_STARTED || state == FAIL)
                        {
                            HandleGameObject(RoostDoor3, false);
                            HandleGameObject(RoostDoor2, false);
                            HandleGameObject(RoostDoor1, false);
                            HandleGameObject(RoostDoor4, false);
                        }
                        if(state == IN_PROGRESS)
                        {
                            HandleGameObject(RoostDoor3, true);
                            HandleGameObject(RoostDoor2, true);
                            if (instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL || instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
                            {
                                HandleGameObject(RoostDoor1, true);
                                HandleGameObject(RoostDoor4, true);
                            }
                        }
                        break;
                    case DATA_SINDRAGOSA:
                        HandleGameObject(frostwingSigil, state != DONE);
                        if (instance->IsHeroic())
                        {
                            if (state == FAIL && heroicAttempts)
                            {
                                --heroicAttempts;
                                DoUpdateWorldState(WORLDSTATE_ATTEMPTS_REMAINING, heroicAttempts);
                                if (!heroicAttempts)
                                    if (Creature* sindra = instance->GetCreature(sindragosa))
                                        sindra->DespawnOrUnsummon();
                            }
                        }
                        break;
                    case DATA_THE_LICH_KING:
                        if(state == NOT_STARTED)
                        {
                            if (GameObject *go = instance->GetGameObject(lavaman))
                                go->SetPhaseMask(2,true);
                        }
                        if (state == DONE)
                        {
                            if (GameObject *go = instance->GetGameObject(lavaman))
                                go->SetPhaseMask(1,true);
                            if (GameObject *go = instance->GetGameObject(hangingman))
                                go->SetPhaseMask(2,true);
                        }
                        break;
                    default:
                        break;
                 }

                 return true;
            }

            void SetData(uint32 type, uint32 data)
            {
                switch (type)
                {
                    case DATA_BONED_ACHIEVEMENT:
                        isBonedEligible = data ? true : false;
                        break;
                    case DATA_OOZE_DANCE_ACHIEVEMENT:
                        isOozeDanceEligible = data ? true : false;
                        break;
                    case DATA_NAUSEA_ACHIEVEMENT:
                        isNauseaEligible = data ? true : false;
                        break;
                    case DATA_ORB_WHISPERER_ACHIEVEMENT:
                        isOrbWhispererEligible = data ? true : false;
                        break;
                    case DATA_SINDRAGOSA_FROSTWYRMS:
                    {
                        if (frostwyrms == 255)
                            return;

                        if (instance->IsHeroic() && !heroicAttempts)
                            return;

                        if (GetBossState(DATA_SINDRAGOSA) != DONE)
                            return;

                        switch (data)
                        {
                            case 0:
                                if (frostwyrms)
                                {
                                    --frostwyrms;
                                    if (!frostwyrms)
                                    {
                                        instance->LoadGrid(SindragosaSpawnPos.GetPositionX(), SindragosaSpawnPos.GetPositionY());
                                        if (Creature* boss = instance->SummonCreature(NPC_SINDRAGOSA, SindragosaSpawnPos))
                                            boss->AI()->DoAction(ACTION_START_FROSTWYRM);
                                    }
                                }
                                break;
                            case 1:
                                ++frostwyrms;
                                break;
                            default:
                                frostwyrms = data;
                                break;
                        }
                        break;
                    }
                    case DATA_SPINESTALKER:
                    {
                        if (spinestalkerTrash == 255)
                            return;

                        switch (data)
                        {
                            case 0:
                                if (spinestalkerTrash)
                                {
                                    --spinestalkerTrash;
                                    if (!spinestalkerTrash)
                                        if (Creature* spinestalk = instance->GetCreature(spinestalker))
                                            spinestalk->AI()->DoAction(ACTION_START_FROSTWYRM);
                                }
                                break;
                            case 1:
                                ++spinestalkerTrash;
                                break;
                            default:
                                spinestalkerTrash = data;
                                break;
                        }
                        break;
                    }
                    case DATA_RIMEFANG:
                    {
                        if (rimefangTrash == 255)
                            return;

                        switch (data)
                        {
                            case 0:
                                if (rimefangTrash)
                                {
                                    --rimefangTrash;
                                    if (!rimefangTrash)
                                        if (Creature* rime = instance->GetCreature(rimefang))
                                            rime->AI()->DoAction(ACTION_START_FROSTWYRM);
                                }
                                break;
                            case 1:
                                ++rimefangTrash;
                                break;
                            default:
                                rimefangTrash = data;
                                break;
                        }
                        break;
                    }
                    case DATA_COLDFLAME_JETS:
                        coldflameJetsState = data;
                        if (coldflameJetsState == DONE)
                        {
                            SaveToDB();
                            for (std::set<uint64>::iterator itr = coldflameJets.begin(); itr != coldflameJets.end(); ++itr)
                                if (Creature* trap = instance->GetCreature(*itr))
                                    trap->AI()->DoAction(ACTION_STOP_TRAPS);
                        }
                        break;
                    case DATA_BLOOD_QUICKENING_STATE:
                    {
                        // skip if nothing changes
                        if (bloodQuickeningState == data)
                            break;

                        // 5 is the index of Blood Quickening
                        if (!sPoolMgr->IsSpawnedObject<Quest>(WeeklyQuestData[5].questId[instance->GetSpawnMode() & 1]))
                            break;

                        switch (data)
                        {
                            case IN_PROGRESS:
                                bloodQuickeningTimer = 60000;
                                bloodQuickeningMinutes = 30;
                                DoUpdateWorldState(WORLDSTATE_SHOW_TIMER, 1);
                                DoUpdateWorldState(WORLDSTATE_EXECUTION_TIME, bloodQuickeningMinutes);
                                break;
                            case DONE:
                                bloodQuickeningTimer = 0;
                                bloodQuickeningMinutes = 0;
                                DoUpdateWorldState(WORLDSTATE_SHOW_TIMER, 0);
                                break;
                            default:
                                break;
                        }

                        bloodQuickeningState = data;
                        SaveToDB();
                        break;
                    }
                    case DATA_PORTAL_JOCKEY_ACHIEVEMENT:
                        isPortalJockeyEligible = data ? true : false;
                        break;
                    case DATA_NECK_DEEP_ACHIEVEMENT:
                        NeckDeep = data;
                    case DATA_BEEN_WAITING_ACHIEVEMENT:
                        NecroticStack = data;
                    default:
                        break;
                }
            }

            bool CheckAchievementCriteriaMeet(uint32 criteria_id, Player const* /*source*/, Unit const* /*target*/, uint32 /*miscvalue1*/)
            {
                switch (criteria_id)
                {
                    case CRITERIA_BONED_10N:
                        return (isBonedEligible && instance->GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL);
                    case CRITERIA_BONED_25N:
                        return (isBonedEligible && instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL);
                    case CRITERIA_BONED_10H:
                        return (isBonedEligible && instance->GetDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC);
                    case CRITERIA_BONED_25H:
                        return (isBonedEligible && instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC);
                    case CRITERIA_DANCES_WITH_OOZES_10N:
                        return (isOozeDanceEligible && instance->GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL);
                    case CRITERIA_DANCES_WITH_OOZES_25N:
                        return (isOozeDanceEligible && instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL);
                    case CRITERIA_DANCES_WITH_OOZES_10H:
                        return (isOozeDanceEligible && instance->GetDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC);
                    case CRITERIA_DANCES_WITH_OOZES_25H:
                        return (isOozeDanceEligible && instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC);
                    case CRITERIA_NAUSEA_10N:
                        return (isNauseaEligible && instance->GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL);
                    case CRITERIA_NAUSEA_25N:
                        return (isNauseaEligible && instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL);
                    case CRITERIA_NAUSEA_10H:
                        return (isNauseaEligible && instance->GetDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC);
                    case CRITERIA_NAUSEA_25H:
                        return (isNauseaEligible && instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC);
                    case CRITERIA_ORB_WHISPERER_10N:
                        return (isOrbWhispererEligible && instance->GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL);
                    case CRITERIA_ORB_WHISPERER_25N:
                        return (isOrbWhispererEligible && instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL);
                    case CRITERIA_ORB_WHISPERER_10H:
                        return (isOrbWhispererEligible && instance->GetDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC);
                    case CRITERIA_ORB_WHISPERER_25H:
                        return (isOrbWhispererEligible && instance->GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC);
                    // Only one criteria for both modes, need to do it like this
                    case CRITERIA_KILL_LANA_THEL_10M:
                    case CRITERIA_ONCE_BITTEN_TWICE_SHY_10N:
                    case CRITERIA_ONCE_BITTEN_TWICE_SHY_10V:
                        return CAST_INST(InstanceMap, instance)->GetMaxPlayers() == 10;
                    case CRITERIA_KILL_LANA_THEL_25M:
                    case CRITERIA_ONCE_BITTEN_TWICE_SHY_25N:
                    case CRITERIA_ONCE_BITTEN_TWICE_SHY_25V:
                        return CAST_INST(InstanceMap, instance)->GetMaxPlayers() == 25;
                    default:
                        break;
                }

                return false;
            }

            bool CheckRequiredBosses(uint32 bossId, Player const* player = NULL) const
            {
                if (player && player->isGameMaster())
                    return true;

                switch (bossId)
                {
                    case DATA_THE_LICH_KING:
                        if (!CheckPlagueworks(bossId))
                            return false;
                        if (!CheckCrimsonHalls(bossId))
                            return false;
                        if (!CheckFrostwingHalls(bossId))
                            return false;
                        break;
                    case DATA_SINDRAGOSA:
                    case DATA_VALITHRIA_DREAMWALKER:
                        if (!CheckFrostwingHalls(bossId))
                            return false;
                        break;
                    case DATA_BLOOD_QUEEN_LANA_THEL:
                    case DATA_BLOOD_PRINCE_COUNCIL:
                        if (!CheckCrimsonHalls(bossId))
                            return false;
                        break;
                    case DATA_FESTERGUT:
                    case DATA_ROTFACE:
                    case DATA_PROFESSOR_PUTRICIDE:
                        if (!CheckPlagueworks(bossId))
                            return false;
                        break;
                    default:
                        break;
                }

                if (!CheckLowerSpire(bossId))
                    return false;

                return true;
            }

            bool CheckPlagueworks(uint32 bossId) const
            {
                switch (bossId)
                {
                    case DATA_THE_LICH_KING:
                        if (GetBossState(DATA_PROFESSOR_PUTRICIDE) != DONE)
                            return false;
                        // no break
                    case DATA_PROFESSOR_PUTRICIDE:
                        if (GetBossState(DATA_FESTERGUT) != DONE || GetBossState(DATA_ROTFACE) != DONE)
                            return false;
                        break;
                    default:
                        break;
                }

                return true;
            }

            bool CheckCrimsonHalls(uint32 bossId) const
            {
                switch (bossId)
                {
                    case DATA_THE_LICH_KING:
                        if (GetBossState(DATA_BLOOD_QUEEN_LANA_THEL) != DONE)
                            return false;
                        // no break
                    case DATA_BLOOD_QUEEN_LANA_THEL:
                        if (GetBossState(DATA_BLOOD_PRINCE_COUNCIL) != DONE)
                            return false;
                        break;
                    default:
                        break;
                }

                return true;
            }

            bool CheckFrostwingHalls(uint32 bossId) const
            {
                switch (bossId)
                {
                    case DATA_THE_LICH_KING:
                        if (GetBossState(DATA_SINDRAGOSA) != DONE)
                            return false;
                        // no break
                    case DATA_SINDRAGOSA:
                        //if (GetBossState(DATA_VALITHRIA_DREAMWALKER) != DONE)
                        // return false;
                        break;
                    default:
                        break;
                }

                return true;
            }

            bool CheckLowerSpire(uint32 bossId) const
            {
                switch (bossId)
                {
                    case DATA_THE_LICH_KING:
                    case DATA_SINDRAGOSA:
                    case DATA_BLOOD_QUEEN_LANA_THEL:
                    case DATA_PROFESSOR_PUTRICIDE:
                    case DATA_VALITHRIA_DREAMWALKER:
                    case DATA_BLOOD_PRINCE_COUNCIL:
                    case DATA_ROTFACE:
                    case DATA_FESTERGUT:
                        if (GetBossState(DATA_DEATHBRINGER_SAURFANG) != DONE)
                            return false;
                        // no break
                    case DATA_DEATHBRINGER_SAURFANG:
                        if (GetBossState(DATA_GUNSHIP_EVENT) != DONE)
                            return false;
                        // no break
                    case DATA_GUNSHIP_EVENT:
                        if (GetBossState(DATA_LADY_DEATHWHISPER) != DONE)
                            return false;
                        // no break
                    case DATA_LADY_DEATHWHISPER:
                        if (GetBossState(DATA_LORD_MARROWGAR) != DONE)
                            return false;
                        // no break
                    case DATA_LORD_MARROWGAR:
                    default:
                        break;
                }

                return true;
            }

            std::string GetSaveData()
            {
                OUT_SAVE_INST_DATA;

                std::ostringstream saveStream;
                saveStream << "I C " << GetBossSaveData() << coldflameJetsState
                    << " " << bloodQuickeningState << " " << bloodQuickeningMinutes;

                OUT_SAVE_INST_DATA_COMPLETE;
                return saveStream.str();
            }

            void Load(const char* str)
            {
                if (!str)
                {
                    OUT_LOAD_INST_DATA_FAIL;
                    return;
                }

                OUT_LOAD_INST_DATA(str);

                char dataHead1, dataHead2;

                std::istringstream loadStream(str);
                loadStream >> dataHead1 >> dataHead2;

                if (dataHead1 == 'I' && dataHead2 == 'C')
                {
                    for (uint32 i = 0; i < EncounterCount; ++i)
                    {
                        uint32 tmpState;
                        loadStream >> tmpState;
                        if (tmpState == IN_PROGRESS || tmpState > SPECIAL)
                            tmpState = NOT_STARTED;
                        SetBossState(i, EncounterState(tmpState));
                    }

                    uint32 temp = 0;
                    loadStream >> temp;
                    coldflameJetsState = temp ? DONE : NOT_STARTED;
                    temp = 0;
                    loadStream >> temp;
                    bloodQuickeningState = temp ? DONE : NOT_STARTED; // DONE means finished (not success/fail)
                    loadStream >> bloodQuickeningMinutes;
                }
                else
                    OUT_LOAD_INST_DATA_FAIL;

                OUT_LOAD_INST_DATA_COMPLETE;
            }

            void Update(uint32 diff)
            {
                if (bloodQuickeningState == IN_PROGRESS)
                {
                    if (bloodQuickeningTimer <= diff)
                    {
                        --bloodQuickeningMinutes;
                        bloodQuickeningTimer = 60000;
                        if (bloodQuickeningMinutes)
                        {
                            DoUpdateWorldState(WORLDSTATE_SHOW_TIMER, 1);
                            DoUpdateWorldState(WORLDSTATE_EXECUTION_TIME, bloodQuickeningMinutes);
                        }
                        else
                        {
                            bloodQuickeningState = DONE;
                            DoUpdateWorldState(WORLDSTATE_SHOW_TIMER, 0);
                            if (Creature* bq = instance->GetCreature(bloodQueenLanaThel))
                                bq->AI()->DoAction(ACTION_KILL_MINCHAR);
                        }
                        SaveToDB();
                    }
                    else
                        bloodQuickeningTimer -= diff;
                }
            }

        private:
            std::set<uint64> coldflameJets;
            uint64 ladyDeathwisperElevator;
            uint64 deathbringerSaurfang;
            uint64 saurfangDoor;
            uint64 saurfangEventNPC; // Muradin Bronzebeard or High Overlord Saurfang
            uint64 deathbringersCache;
            uint64 saurfangTeleport;
            uint64 plagueSigil;
            uint64 bloodwingSigil;
            uint64 frostwingSigil;
            uint64 putricidePipes[2];
            uint64 putricideGates[2];
            uint64 putricideCollision;
            uint64 festergut;
            uint64 rotface;
            uint64 professorPutricide;
            uint64 putricideTable;
            uint64 bloodCouncil[3];
            uint64 bloodCouncilController;
            uint64 bloodQueenLanaThel;
            uint64 sindragosa;
            uint64 spinestalker;
            uint64 rimefang;
            uint32 teamInInstance;
            uint32 bloodQuickeningTimer;
            uint32 coldflameJetsState;
            uint32 frostwyrms;
            uint32 spinestalkerTrash;
            uint32 rimefangTrash;
            uint32 bloodQuickeningState;
            uint16 heroicAttempts;
            uint16 bloodQuickeningMinutes;
            bool isBonedEligible;
            bool isOozeDanceEligible;
            bool isNauseaEligible;
            bool isOrbWhispererEligible;
            bool isPortalJockeyEligible;
            uint64 ValithriaDreamwalker;
            uint64 ValithriaAlternative;
            uint64 ValithriaCombatTrigger;
            uint64 LichKing;
            uint64 Tirion;
            uint64 TerenasFighter;
            uint64 SpiritWarden;
            uint64 RoostDoor1;
            uint64 RoostDoor2;
            uint64 RoostDoor3;
            uint64 RoostDoor4;
            uint64 ValithriaTransporter;
            uint64 SindragosaTransporter;
            uint64 DreamwalkerCache;
            uint64 SpiritAlarm1;
            uint64 SpiritAlarm2;
            uint64 SpiritAlarm3;
            uint64 SpiritAlarm4;
            uint64 lavaman;
            uint64 hangingman;
            uint64 DeathboundWard1;
            uint64 DeathboundWard2;
            uint64 DeathboundWard3;
            uint64 DeathboundWard4;
            uint64 UpperSpireLever;
            uint64 IceShard1;
            uint64 IceShard2;
            uint64 IceShard3;
            uint64 IceShard4;
            uint64 FrostyEdgeInner;
            uint64 FrostyEdgeOuter;
            uint64 EdgeDestroyWarning;
            uint8 BeenWaiting;
            uint8 NeckDeep;
            uint8 NecroticStack;
        };

        InstanceScript* GetInstanceScript(InstanceMap* map) const
        {
            return new instance_icecrown_citadel_InstanceMapScript(map);
        }
};

void DespawnAllCreaturesAround(Creature *ref, uint32 entry)
{
    while (Unit *unit = ref->FindNearestCreature(entry, 80.0f, true))
        if (Creature *creature = unit->ToCreature())
            creature->DespawnOrUnsummon();
}
void UnsummonSpecificCreaturesNearby(Creature *ref, uint32 entry, float radius)
{
    std::list<Creature*> allCreaturesWithEntry;
    GetCreatureListWithEntryInGrid(allCreaturesWithEntry, ref, entry, radius);
    for(std::list<Creature*>::iterator itr = allCreaturesWithEntry.begin(); itr != allCreaturesWithEntry.end(); ++itr)
    {
        Creature *candidate = *itr;

        if (!candidate)
            continue;
        if (TempSummon* summon = candidate->ToTempSummon())
            summon->DespawnOrUnsummon();
    }
}
uint32 GetPhase(const EventMap &em)
{
    switch (em.GetPhaseMask())
    {
        case 0x01: return 0;
        case 0x02: return 1;
        case 0x04: return 2;
        case 0x08: return 3;
        case 0x10: return 4;
        case 0x20: return 5;
        case 0x40: return 6;
        case 0x80: return 7;
        default:
            return 0;
    }
}
void LeaveOnlyPlayers(std::list<Unit*> &unitList)
{
    for (std::list<Unit*>::iterator itr = unitList.begin(); itr != unitList.end();)
    {
        if ((*itr)->GetTypeId() != TYPEID_PLAYER)
            unitList.erase(itr++);
        else
            ++itr;
    }

    std::list<Unit*>::iterator itr = unitList.begin();
    std::advance(itr, urand(0, unitList.size()-1));
    Unit* target = *itr;
    unitList.clear();
    unitList.push_back(target);
}
class TeleportToFrozenThrone : public BasicEvent
{
    public:
        TeleportToFrozenThrone(Player *player, uint8 attempts): pPlayer(player), attemptsLeft(attempts) { }

        bool Execute(uint64 /*eventTime*/, uint32 /*updateTime*/)
        {
            pPlayer->CastSpell(pPlayer, FROZEN_THRONE_TELEPORT, true);
            if (--attemptsLeft)
                pPlayer->m_Events.AddEvent(new TeleportToFrozenThrone(pPlayer, attemptsLeft), pPlayer->m_Events.CalculateTime(uint64(1500)));
            return true;
        }
    private:
        Player *pPlayer;
        uint8 attemptsLeft;
};
void TeleportPlayerToFrozenThrone(Player *player)
{
    player->m_Events.AddEvent(new TeleportToFrozenThrone(player, 2), player->m_Events.CalculateTime(uint64(5000)));
}

TPlayerList GetPlayersInTheMap(Map *pMap)
{
    TPlayerList players;
    const Map::PlayerList &PlayerList = pMap->GetPlayers();
    if (!PlayerList.isEmpty())
        for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            if (Player* player = i->getSource())
                players.push_back(player);
    return players;
}
TPlayerList GetAttackablePlayersInTheMap(Map *pMap)
{
    TPlayerList players = GetPlayersInTheMap(pMap);
    for (TPlayerList::iterator it = players.begin(); it != players.end();)
        if (!(*it)->isTargetableForAttack())
            players.erase(it++);
        else
            ++it;
    return players;
}

void AddSC_instance_icecrown_citadel()
{
    new instance_icecrown_citadel();
}