/*
 * Copyright (C) 2008 - 2011 Trinity <http://www.trinitycore.org/>
 *
 * Copyright (C) 2010 - 2011 Myth Project <http://bitbucket.org/sun/myth-core/>
 *
 * Myth Project's source is based on the Trinity Project source, you can find the
 * link to that easily in Trinity Copyrights. Myth Project is a private community.
 * To get access, you either have to donate or pass a developer test.
 * You can't share Myth Project's sources! Only for personal use.
 */

#include "ScriptPCH.h"
#include "temple_of_ahnqiraj.h"

#define PI                          3.14

enum Phases
{
    PHASE_NOT_STARTED                           = 0,

    PHASE_EYE_GREEN_BEAM                        = 1,
    PHASE_EYE_RED_BEAM                          = 2,

    PHASE_CTHUN_TRANSITION                      = 3,
    PHASE_CTHUN_STOMACH                         = 4,
    PHASE_CTHUN_WEAK                            = 5,

    PHASE_CTHUN_DONE                            = 6,
};

enum Creatures
{
    MOB_CTHUN_PORTAL                            = 15896,

    BOSS_EYE_OF_CTHUN                           = 15589,
    MOB_CLAW_TENTACLE                           = 15725,
    MOB_EYE_TENTACLE                            = 15726,
    MOB_SMALL_PORTAL                            = 15904,

    MOB_BODY_OF_CTHUN                           = 15809,
    MOB_GIANT_CLAW_TENTACLE                     = 15728,
    MOB_GIANT_EYE_TENTACLE                      = 15334,
    MOB_FLESH_TENTACLE                          = 15802,
    MOB_GIANT_PORTAL                            = 15910,
};

enum Spells
{
    SPELL_FREEZE_ANIM                           = 16245,
    SPELL_GREEN_BEAM                            = 26134,
    SPELL_DARK_GLARE                            = 26029,
    SPELL_RED_COLORATION                        = 22518,

    SPELL_MIND_FLAY                             = 26143,

    SPELL_GROUND_RUPTURE                        = 26139,
    SPELL_HAMSTRING                             = 26141,

    SPELL_TRANSFORM                             = 26232,
    SPELL_PURPLE_COLORATION                     = 22581,

    SPELL_MASSIVE_GROUND_RUPTURE                = 26100,

    SPELL_THRASH                                = 3391,

    SPELL_MOUTH_TENTACLE                        = 26332,
    SPELL_EXIT_STOMACH_KNOCKBACK                = 25383,
    SPELL_DIGESTIVE_ACID                        = 26476,
};

enum Actions
{
    ACTION_FLESH_TENTACLE_KILLED                = 1,
};

enum Yells
{
    EMOTE_WEAKENED                             = -1531011,

    RANDOM_SOUND_WHISPER                        = 8663,
};

#define STOMACH_X                           -8562.0f
#define STOMACH_Y                           2037.0f
#define STOMACH_Z                           -70.0f
#define STOMACH_O                           5.05f

const Position FleshTentaclePos[2] =
{
    {
 -8571.0f, 1990.0f, -98.0f, 1.22f},
    {
 -8525.0f, 1994.0f, -98.0f, 2.12f},
};

const Position KickPos = {
 -8545.0f, 1984.0f, -96.0f, 0.0f};

class boss_eye_of_cthun : public CreatureScript
{
public:
    boss_eye_of_cthun() : CreatureScript("boss_eye_of_cthun") {
}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new eye_of_cthunAI (pCreature);
    }

    struct eye_of_cthunAI : public Scripted_NoMovementAI
    {
        eye_of_cthunAI(Creature *c) : Scripted_NoMovementAI(c)
        {
            pInst = c->GetInstanceScript();
            if (!pInst)
                sLog->outError("TSCR: No Instance eye_of_cthunAI");
        }

        InstanceScript* pInst;

        uint32 PhaseTimer;

        uint32 BeamTimer;
        uint32 EyeTentacleTimer;
        uint32 ClawTentacleTimer;

        uint32 DarkGlareTick;
        uint32 DarkGlareTickTimer;
        float DarkGlareAngle;
        bool ClockWise;

        void Reset()
        {
            PhaseTimer = 50000;

            BeamTimer = 3000;
            EyeTentacleTimer = 45000;
            ClawTentacleTimer = 12500;

            DarkGlareTick = 0;
            DarkGlareTickTimer = 1000;
            DarkGlareAngle = 0;
            ClockWise = false;

            me->RemoveAurasDueToSpell(SPELL_RED_COLORATION);
            me->RemoveAurasDueToSpell(SPELL_FREEZE_ANIM);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
            me->SetVisible(true);

            if (pInst)
                pInst->SetData(DATA_CTHUN_PHASE, PHASE_NOT_STARTED);

            Creature* pPortal= me->FindNearestCreature(MOB_CTHUN_PORTAL, 10);
            if (pPortal)
                pPortal->SetReactState(REACT_PASSIVE);
        }

        void EnterCombat(Unit * /*who*/)
        {
            DoZoneInCombat();
            if (pInst)
                pInst->SetData(DATA_CTHUN_PHASE, PHASE_EYE_GREEN_BEAM);
        }

        void SpawnEyeTentacle(float x, float y)
        {
            if (Creature* Spawned = DoSpawnCreature(MOB_EYE_TENTACLE, x, y, 0, 0, TEMPSUMMON_CORPSE_DESPAWN, 500))
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                    if (Spawned->AI())
                        Spawned->AI()->AttackStart(pTarget);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (!pInst)
                return;

            uint32 currentPhase = pInst->GetData(DATA_CTHUN_PHASE);
            if (currentPhase == PHASE_EYE_GREEN_BEAM || currentPhase == PHASE_EYE_RED_BEAM)
            {
                if (EyeTentacleTimer <= diff)
                {
                    SpawnEyeTentacle(0, 20);
                    SpawnEyeTentacle(10, 10);
                    SpawnEyeTentacle(20, 0);
                    SpawnEyeTentacle(10, -10);

                    SpawnEyeTentacle(0, -20);
                    SpawnEyeTentacle(-10, -10);
                    SpawnEyeTentacle(-20, 0);
                    SpawnEyeTentacle(-10, 10);

                    EyeTentacleTimer = 45000;
                } else EyeTentacleTimer -= diff;
            }

            switch (currentPhase)
            {
                case PHASE_EYE_GREEN_BEAM:

                    if (BeamTimer <= diff)
                    {
                        if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                        {
                            me->InterruptNonMeleeSpells(false);
                            DoCast(pTarget, SPELL_GREEN_BEAM);

                            me->SetUInt64Value(UNIT_FIELD_TARGET, pTarget->GetGUID());
                        }

                        BeamTimer = 3000;
                    } else BeamTimer -= diff;

                    if (ClawTentacleTimer <= diff)
                    {
                        if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                        {
                            Creature* Spawned = NULL;

                            Spawned = me->SummonCreature(MOB_CLAW_TENTACLE, *pTarget, TEMPSUMMON_CORPSE_DESPAWN, 500);

                            if (Spawned && Spawned->AI())
                                Spawned->AI()->AttackStart(pTarget);
                        }

                        ClawTentacleTimer = 12500;
                    } else ClawTentacleTimer -= diff;

                    if (PhaseTimer <= diff)
                    {
                        pInst->SetData(DATA_CTHUN_PHASE, PHASE_EYE_RED_BEAM);

                        me->InterruptNonMeleeSpells(false);
                        me->SetReactState(REACT_PASSIVE);

                        me->SetUInt64Value(UNIT_FIELD_TARGET, 0);

                        if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                        {
                            DarkGlareAngle = me->GetAngle(pTarget);
                            DarkGlareTickTimer = 1000;
                            DarkGlareTick = 0;
                            ClockWise = RAND(true, false);
                        }

                        DoCast(me, SPELL_RED_COLORATION, true);

                        DoCast(me, SPELL_FREEZE_ANIM);
                        me->SetOrientation(DarkGlareAngle);
                        me->StopMoving();

                        PhaseTimer = 35000;
                    } else PhaseTimer -= diff;

                    break;

                case PHASE_EYE_RED_BEAM:
                    if (DarkGlareTick < 35)
                    {
                        if (DarkGlareTickTimer <= diff)
                        {
                            if (ClockWise)
                                me->SetOrientation(DarkGlareAngle + DarkGlareTick * M_PI / 35);
                            else
                                me->SetOrientation(DarkGlareAngle - DarkGlareTick * M_PI / 35);

                            me->StopMoving();

                            DoCast(me, SPELL_DARK_GLARE, false);

                            ++DarkGlareTick;

                            DarkGlareTickTimer = 1000;
                        } else DarkGlareTickTimer -= diff;
                    }

                    if (PhaseTimer <= diff)
                    {
                        pInst->SetData(DATA_CTHUN_PHASE, PHASE_EYE_GREEN_BEAM);

                        BeamTimer = 3000;
                        ClawTentacleTimer = 12500;

                        me->InterruptNonMeleeSpells(false);

                        me->RemoveAurasDueToSpell(SPELL_RED_COLORATION);
                        me->RemoveAurasDueToSpell(SPELL_FREEZE_ANIM);

                        me->SetReactState(REACT_AGGRESSIVE);

                        PhaseTimer = 50000;
                    } else PhaseTimer -= diff;

                    break;

                case PHASE_CTHUN_TRANSITION:
                    me->SetUInt64Value(UNIT_FIELD_TARGET, 0);
                    me->SetHealth(0);
                    me->SetVisible(false);
                    break;

                case PHASE_CTHUN_DONE:
                    Creature* pPortal= me->FindNearestCreature(MOB_CTHUN_PORTAL, 10);
                    if (pPortal)
                        pPortal->DespawnOrUnsummon();

                    me->DespawnOrUnsummon();
                    break;
            }
        }

        void DamageTaken(Unit * /*done_by*/, uint32 &damage)
        {
            if (!pInst)
                return;

            switch (pInst->GetData(DATA_CTHUN_PHASE))
            {
                case PHASE_EYE_GREEN_BEAM:
                case PHASE_EYE_RED_BEAM:

                    if (damage < me->GetHealth())
                        return;

                    me->InterruptNonMeleeSpells(false);

                    me->RemoveAurasDueToSpell(SPELL_RED_COLORATION);

                    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);

                    me->SetUInt64Value(UNIT_FIELD_TARGET, 0);

                    pInst->SetData(DATA_CTHUN_PHASE, PHASE_CTHUN_TRANSITION);

                    me->SetHealth(0);
                    damage = 0;

                    me->InterruptNonMeleeSpells(true);
                    me->RemoveAllAuras();
                    break;

                case PHASE_CTHUN_DONE:

                    return;

                default:

                    damage = 0;
                    return;
            }
        }
    };
};

class boss_cthun : public CreatureScript
{
public:
    boss_cthun() : CreatureScript("boss_cthun") {
}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new cthunAI (pCreature);
    }

    struct cthunAI : public Scripted_NoMovementAI
    {
        cthunAI(Creature *c) : Scripted_NoMovementAI(c)
        {
            SetCombatMovement(false);

            pInst = c->GetInstanceScript();
            if (!pInst)
                sLog->outError("TSCR: No Instance eye_of_cthunAI");
        }

        InstanceScript* pInst;

        uint32 WisperTimer;

        uint32 PhaseTimer;

        uint64 HoldPlayer;

        uint32 EyeTentacleTimer;
        uint8 FleshTentaclesKilled;
        uint32 GiantClawTentacleTimer;
        uint32 GiantEyeTentacleTimer;
        uint32 StomachAcidTimer;
        uint32 StomachEnterTimer;
        uint32 StomachEnterVisTimer;
        uint64 StomachEnterTarget;

        UNORDERED_MAP<uint64, bool> Stomach_Map;

        void Reset()
        {
            WisperTimer = 90000;

            PhaseTimer = 10000;

            HoldPlayer = 0;

            EyeTentacleTimer = 30000;
            FleshTentaclesKilled = 0;
            GiantClawTentacleTimer = 15000;
            GiantEyeTentacleTimer = 45000;
            StomachAcidTimer = 4000;
            StomachEnterTimer = 10000;
            StomachEnterVisTimer = 0;
            StomachEnterTarget = 0;

            Stomach_Map.clear();

            me->RemoveAurasDueToSpell(SPELL_TRANSFORM);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
            me->SetVisible(false);

            if (pInst)
                pInst->SetData(DATA_CTHUN_PHASE, PHASE_NOT_STARTED);
        }

        void EnterCombat(Unit * /*who*/)
        {
            DoZoneInCombat();
        }

        void SpawnEyeTentacle(float x, float y)
        {
            Creature* Spawned;
            Spawned = DoSpawnCreature(MOB_EYE_TENTACLE, x, y, 0, 0, TEMPSUMMON_CORPSE_DESPAWN, 500);
            if (Spawned && Spawned->AI())
                if (Unit *pTarget = SelectRandomNotStomach())
                    Spawned->AI()->AttackStart(pTarget);
        }

        Unit* SelectRandomNotStomach()
        {
            if (Stomach_Map.empty())
                return NULL;

            UNORDERED_MAP<uint64, bool>::const_iterator i = Stomach_Map.begin();

            std::list<Unit*> temp;
            std::list<Unit*>::const_iterator j;

            while (i != Stomach_Map.end())
            {
                Unit* pUnit = Unit::GetUnit(*me, i->first);

                if (pUnit && i->second == false)
                    temp.push_back(pUnit);

                ++i;
            }

            if (temp.empty())
                return NULL;

            j = temp.begin();

            if (temp.size() > 1)
                advance (j , rand() % (temp.size() - 1));

            return (*j);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
            {
                if (WisperTimer <= diff)
                {
                    Map* pMap = me->GetMap();
                    if (!pMap->IsDungeon()) return;

                    Map::PlayerList const &PlayerList = pMap->GetPlayers();

                    if (!PlayerList.isEmpty())
                    {
                        for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
                        {
                            if (Player* pPlr = itr->getSource())
                                pPlr->PlayDirectSound(RANDOM_SOUND_WHISPER,pPlr);
                        }
                    }

                    WisperTimer = urand(90000,300000);
                } else WisperTimer -= diff;

                return;
            }

            me->SetUInt64Value(UNIT_FIELD_TARGET, 0);

            if (!pInst)
                return;

            uint32 currentPhase = pInst->GetData(DATA_CTHUN_PHASE);
            if (currentPhase == PHASE_CTHUN_STOMACH || currentPhase == PHASE_CTHUN_WEAK)
            {
                if (EyeTentacleTimer <= diff)
                {
                    SpawnEyeTentacle(0, 20);
                    SpawnEyeTentacle(10, 10);
                    SpawnEyeTentacle(20, 0);
                    SpawnEyeTentacle(10, -10);

                    SpawnEyeTentacle(0, -20);
                    SpawnEyeTentacle(-10, -10);
                    SpawnEyeTentacle(-20, 0);
                    SpawnEyeTentacle(-10, 10);

                    EyeTentacleTimer = 30000; // every 30sec in phase 2
                } else EyeTentacleTimer -= diff;
            }

            switch (currentPhase)
            {
                case PHASE_CTHUN_TRANSITION:

                    if (PhaseTimer <= diff)
                    {
                        pInst->SetData(DATA_CTHUN_PHASE, PHASE_CTHUN_STOMACH);

                        me->InterruptNonMeleeSpells(false);
                        DoCast(me, SPELL_TRANSFORM, false);
                        me->SetFullHealth();

                        me->SetVisible(true);
                        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);

                        DoZoneInCombat();

                        Stomach_Map.clear();

                        std::list<HostileReference*>::const_iterator i = me->getThreatManager().getThreatList().begin();
                        for (; i != me->getThreatManager().getThreatList().end(); ++i)
                        {
                            Stomach_Map[(*i)->getUnitGuid()] = false;
                        }

                        FleshTentaclesKilled = 0;

                        for (uint8 i = 0; i < 2; i++)
                        {
                            Creature* spawned = me->SummonCreature(MOB_FLESH_TENTACLE, FleshTentaclePos[i], TEMPSUMMON_CORPSE_DESPAWN);
                            if (!spawned)
                                ++FleshTentaclesKilled;
                        }

                        PhaseTimer = 0;
                    } else PhaseTimer -= diff;

                    break;

                case PHASE_CTHUN_STOMACH:

                    me->SetUInt64Value(UNIT_FIELD_TARGET, 0);

                    if (FleshTentaclesKilled > 1)
                    {
                        pInst->SetData(DATA_CTHUN_PHASE, PHASE_CTHUN_WEAK);

                        DoScriptText(EMOTE_WEAKENED, me);
                        PhaseTimer = 45000;

                        DoCast(me, SPELL_PURPLE_COLORATION, true);

                        UNORDERED_MAP<uint64, bool>::iterator i = Stomach_Map.begin();

                        while (i != Stomach_Map.end())
                        {
                            Unit* pUnit = Unit::GetUnit(*me, i->first);

                            if (pUnit && i->second == true)
                            {
                                DoTeleportPlayer(pUnit, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()+10, float(rand()%6));

                                DoCast(pUnit, SPELL_EXIT_STOMACH_KNOCKBACK, true);

                                pUnit->RemoveAurasDueToSpell(SPELL_DIGESTIVE_ACID);

                                i->second = false;
                            }
                            ++i;
                        }

                        return;
                    }

                    if (StomachAcidTimer <= diff)
                    {
                        UNORDERED_MAP<uint64, bool>::iterator i = Stomach_Map.begin();

                        while (i != Stomach_Map.end())
                        {
                            Unit* pUnit = Unit::GetUnit(*me, i->first);

                            if (pUnit && i->second == true)
                            {
                                DoCast(pUnit, SPELL_DIGESTIVE_ACID, true);

                                if (pUnit->IsWithinDist3d(&KickPos, 15.0f))
                                {
                                    DoTeleportPlayer(pUnit, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()+10, float(rand()%6));

                                    DoCast(pUnit, SPELL_EXIT_STOMACH_KNOCKBACK, true);

                                    pUnit->RemoveAurasDueToSpell(SPELL_DIGESTIVE_ACID);

                                    i->second = false;
                                }
                            }
                            ++i;
                        }

                        StomachAcidTimer = 4000;
                    } else StomachAcidTimer -= diff;

                    if (StomachEnterTimer <= diff)
                    {
                        if (Unit *pTarget = SelectRandomNotStomach())
                        {
                            Stomach_Map[pTarget->GetGUID()] = true;
                            pTarget->InterruptNonMeleeSpells(false);
                            pTarget->CastSpell(pTarget, SPELL_MOUTH_TENTACLE, true, NULL, NULL, me->GetGUID());
                            StomachEnterTarget = pTarget->GetGUID();
                            StomachEnterVisTimer = 3800;
                        }

                        StomachEnterTimer = 13800;
                    } else StomachEnterTimer -= diff;

                    if (StomachEnterVisTimer && StomachEnterTarget)
                    {
                        if (StomachEnterVisTimer <= diff)
                        {
                            Unit* pUnit = Unit::GetUnit(*me, StomachEnterTarget);

                            if (pUnit)
                            {
                                DoTeleportPlayer(pUnit, STOMACH_X, STOMACH_Y, STOMACH_Z, STOMACH_O);
                            }

                            StomachEnterTarget = 0;
                            StomachEnterVisTimer = 0;
                        } else StomachEnterVisTimer -= diff;
                    }

                    if (GiantClawTentacleTimer <= diff)
                    {
                        if (Unit *pTarget = SelectRandomNotStomach())
                        {
                            if (Creature* spawned = me->SummonCreature(MOB_GIANT_CLAW_TENTACLE, *pTarget, TEMPSUMMON_CORPSE_DESPAWN, 500))
                                if (spawned->AI())
                                    spawned->AI()->AttackStart(pTarget);
                        }

                        GiantClawTentacleTimer = 60000;
                    } else GiantClawTentacleTimer -= diff;

                    if (GiantEyeTentacleTimer <= diff)
                    {
                        if (Unit *pTarget = SelectRandomNotStomach())
                        {
                            if (Creature* spawned = me->SummonCreature(MOB_GIANT_EYE_TENTACLE, *pTarget, TEMPSUMMON_CORPSE_DESPAWN, 500))
                                if (spawned->AI())
                                    spawned->AI()->AttackStart(pTarget);
                        }

                        GiantEyeTentacleTimer = 60000;
                    } else GiantEyeTentacleTimer -= diff;

                    break;

                case PHASE_CTHUN_WEAK:

                    if (PhaseTimer <= diff)
                    {
                        pInst->SetData(DATA_CTHUN_PHASE, PHASE_CTHUN_STOMACH);

                        me->RemoveAurasDueToSpell(SPELL_PURPLE_COLORATION);

                        FleshTentaclesKilled = 0;

                        for (uint8 i = 0; i < 2; i++)
                        {
                            Creature* spawned = me->SummonCreature(MOB_FLESH_TENTACLE, FleshTentaclePos[i], TEMPSUMMON_CORPSE_DESPAWN);
                            if (!spawned)
                                ++FleshTentaclesKilled;
                        }

                        PhaseTimer = 0;
                    } else PhaseTimer -= diff;

                    break;
            }
        }

        void JustDied(Unit* /*pKiller*/)
        {
            if (pInst)
                pInst->SetData(DATA_CTHUN_PHASE, PHASE_CTHUN_DONE);
        }

        void DamageTaken(Unit * /*done_by*/, uint32 &damage)
        {
            if (!pInst)
                return;

            switch (pInst->GetData(DATA_CTHUN_PHASE))
            {
                case PHASE_CTHUN_STOMACH:

                    damage /= 100;
                    if (damage == 0)
                        damage = 1;

                    if (damage >= me->GetHealth())
                        damage = 0;

                    return;

                case PHASE_CTHUN_WEAK:

                    return;

                default:
                    damage = 0;
                    break;
            }
        }

        void DoAction(const int32 param)
        {
            switch(param)
            {
                case ACTION_FLESH_TENTACLE_KILLED:
                    ++FleshTentaclesKilled;
                    break;
            }
        }
    };
};

class mob_eye_tentacle : public CreatureScript
{
public:
    mob_eye_tentacle() : CreatureScript("mob_eye_tentacle") {
}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new eye_tentacleAI (pCreature);
    }

    struct eye_tentacleAI : public Scripted_NoMovementAI
    {
        eye_tentacleAI(Creature *c) : Scripted_NoMovementAI(c)
        {
            if (Creature* pPortal = me->SummonCreature(MOB_SMALL_PORTAL, *me, TEMPSUMMON_CORPSE_DESPAWN))
            {
                pPortal->SetReactState(REACT_PASSIVE);
                Portal = pPortal->GetGUID();
            }
        }

        uint32 MindflayTimer;
        uint32 KillSelfTimer;
        uint64 Portal;

        void JustDied(Unit* /*who*/)
        {
            if (Unit* p = Unit::GetUnit(*me, Portal))
                p->Kill(p);
        }

        void Reset()
        {
            MindflayTimer = 500;

            KillSelfTimer = 35000;
        }

        void EnterCombat(Unit * /*who*/)
        {
            DoZoneInCombat();
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (KillSelfTimer <= diff)
            {
                me->Kill(me);
                return;
            } else KillSelfTimer -= diff;

            if (MindflayTimer <= diff)
            {
                Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0);
                if (pTarget && !pTarget->HasAura(SPELL_DIGESTIVE_ACID))
                    DoCast(pTarget, SPELL_MIND_FLAY);

                MindflayTimer = 10000;
            } else MindflayTimer -= diff;
        }
    };
};

class mob_claw_tentacle : public CreatureScript
{
public:
    mob_claw_tentacle() : CreatureScript("mob_claw_tentacle") {
}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new claw_tentacleAI (pCreature);
    }

    struct claw_tentacleAI : public Scripted_NoMovementAI
    {
        claw_tentacleAI(Creature *c) : Scripted_NoMovementAI(c)
        {
            SetCombatMovement(false);

            if (Creature* pPortal = me->SummonCreature(MOB_SMALL_PORTAL, *me, TEMPSUMMON_CORPSE_DESPAWN))
            {
                pPortal->SetReactState(REACT_PASSIVE);
                Portal = pPortal->GetGUID();
            }
        }

        uint32 GroundRuptureTimer;
        uint32 HamstringTimer;
        uint32 EvadeTimer;
        uint64 Portal;

        void JustDied(Unit* /*who*/)
        {
            if (Unit* p = Unit::GetUnit(*me, Portal))
                p->Kill(p);
        }

        void Reset()
        {
            GroundRuptureTimer = 500;
            HamstringTimer = 2000;
            EvadeTimer = 5000;
        }

        void EnterCombat(Unit * /*who*/)
        {
            DoZoneInCombat();
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (!me->IsWithinMeleeRange(me->getVictim()))
            {
                if (EvadeTimer <= diff)
                {
                    if (Unit* p = Unit::GetUnit(*me, Portal))
                        p->Kill(p);

                    me->SetVisible(false);

                    Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0);
                    if (!pTarget)
                    {
                        me->Kill(me);
                        return;
                    }

                    if (!pTarget->HasAura(SPELL_DIGESTIVE_ACID))
                    {
                        me->GetMap()->CreatureRelocation(me, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0);
                        if (Creature* pPortal = me->SummonCreature(MOB_SMALL_PORTAL, *me, TEMPSUMMON_CORPSE_DESPAWN))
                        {
                            pPortal->SetReactState(REACT_PASSIVE);
                            Portal = pPortal->GetGUID();
                        }

                        GroundRuptureTimer = 500;
                        HamstringTimer = 2000;
                        EvadeTimer = 5000;
                        AttackStart(pTarget);
                    }

                    me->SetVisible(true);
                } else EvadeTimer -= diff;
            }

            if (GroundRuptureTimer <= diff)
            {
                DoCast(me->getVictim(), SPELL_GROUND_RUPTURE);
                GroundRuptureTimer = 30000;
            } else GroundRuptureTimer -= diff;

            if (HamstringTimer <= diff)
            {
                DoCast(me->getVictim(), SPELL_HAMSTRING);
                HamstringTimer = 5000;
            } else HamstringTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

class mob_giant_claw_tentacle : public CreatureScript
{
public:
    mob_giant_claw_tentacle() : CreatureScript("mob_giant_claw_tentacle") {
}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new giant_claw_tentacleAI (pCreature);
    }

    struct giant_claw_tentacleAI : public Scripted_NoMovementAI
    {
        giant_claw_tentacleAI(Creature *c) : Scripted_NoMovementAI(c)
        {
            SetCombatMovement(false);

            if (Creature* pPortal = me->SummonCreature(MOB_GIANT_PORTAL, *me, TEMPSUMMON_CORPSE_DESPAWN))
            {
                pPortal->SetReactState(REACT_PASSIVE);
                Portal = pPortal->GetGUID();
            }
        }

        uint32 GroundRuptureTimer;
        uint32 ThrashTimer;
        uint32 HamstringTimer;
        uint32 EvadeTimer;
        uint64 Portal;

        void JustDied(Unit* /*who*/)
        {
            if (Unit* p = Unit::GetUnit(*me, Portal))
                p->Kill(p);
        }

        void Reset()
        {
            GroundRuptureTimer = 500;
            HamstringTimer = 2000;
            ThrashTimer = 5000;
            EvadeTimer = 5000;
        }

        void EnterCombat(Unit * /*who*/)
        {
            DoZoneInCombat();
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (!me->IsWithinMeleeRange(me->getVictim()))
            {
                if (EvadeTimer <= diff)
                {
                    if (Unit* p = Unit::GetUnit(*me, Portal))
                        p->Kill(p);

                    me->SetVisible(false);

                    Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0);
                    if (!pTarget)
                    {
                        me->Kill(me);
                        return;
                    }

                    if (!pTarget->HasAura(SPELL_DIGESTIVE_ACID))
                    {
                        me->GetMap()->CreatureRelocation(me, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0);
                        if (Creature* pPortal = me->SummonCreature(MOB_GIANT_PORTAL, *me, TEMPSUMMON_CORPSE_DESPAWN))
                        {
                            pPortal->SetReactState(REACT_PASSIVE);
                            Portal = pPortal->GetGUID();
                        }

                        GroundRuptureTimer = 500;
                        HamstringTimer = 2000;
                        ThrashTimer = 5000;
                        EvadeTimer = 5000;
                        AttackStart(pTarget);
                    }
                    me->SetVisible(true);
                } else EvadeTimer -= diff;
            }

            if (GroundRuptureTimer <= diff)
            {
                DoCast(me->getVictim(), SPELL_GROUND_RUPTURE);
                GroundRuptureTimer = 30000;
            } else GroundRuptureTimer -= diff;

            if (ThrashTimer <= diff)
            {
                DoCast(me->getVictim(), SPELL_THRASH);
                ThrashTimer = 10000;
            } else ThrashTimer -= diff;

            if (HamstringTimer <= diff)
            {
                DoCast(me->getVictim(), SPELL_HAMSTRING);
                HamstringTimer = 10000;
            } else HamstringTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

class mob_giant_eye_tentacle : public CreatureScript
{
public:
    mob_giant_eye_tentacle() : CreatureScript("mob_giant_eye_tentacle") {
}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new giant_eye_tentacleAI (pCreature);
    }

    struct giant_eye_tentacleAI : public Scripted_NoMovementAI
    {
        giant_eye_tentacleAI(Creature *c) : Scripted_NoMovementAI(c)
        {
            SetCombatMovement(false);

            if (Creature* pPortal = me->SummonCreature(MOB_GIANT_PORTAL, *me, TEMPSUMMON_CORPSE_DESPAWN))
            {
                pPortal->SetReactState(REACT_PASSIVE);
                Portal = pPortal->GetGUID();
            }
        }

        uint32 BeamTimer;
        uint64 Portal;

        void JustDied(Unit* /*who*/)
        {
            if (Unit* p = Unit::GetUnit(*me, Portal))
                p->Kill(p);
        }

        void Reset()
        {
            BeamTimer = 500;
        }

        void EnterCombat(Unit * /*who*/)
        {
            DoZoneInCombat();
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (BeamTimer <= diff)
            {
                Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0);
                if (pTarget && !pTarget->HasAura(SPELL_DIGESTIVE_ACID))
                    DoCast(pTarget, SPELL_GREEN_BEAM);

                BeamTimer = 2100;
            } else BeamTimer -= diff;
        }
    };
};

class mob_giant_flesh_tentacle : public CreatureScript
{
public:
    mob_giant_flesh_tentacle() : CreatureScript("mob_giant_flesh_tentacle") {
}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new flesh_tentacleAI (pCreature);
    }

    struct flesh_tentacleAI : public Scripted_NoMovementAI
    {
        flesh_tentacleAI(Creature *c) : Scripted_NoMovementAI(c)
        {
            SetCombatMovement(false);
        }

        void JustDied(Unit* /*killer*/)
        {
            if (CAST_SUM(me))
                if (Creature* pSummoner = CAST_CRE(CAST_SUM(me)->GetSummoner()))
                    if (pSummoner->AI())
                        pSummoner->AI()->DoAction(ACTION_FLESH_TENTACLE_KILLED);
        }
    };
};

void AddSC_boss_cthun()
{
    new boss_eye_of_cthun();
    new boss_cthun();
    new mob_eye_tentacle();
    new mob_claw_tentacle();
    new mob_giant_claw_tentacle();
    new mob_giant_eye_tentacle();
    new mob_giant_flesh_tentacle();
}
