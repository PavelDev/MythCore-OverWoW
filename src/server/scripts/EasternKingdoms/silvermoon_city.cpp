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

/*#######
# npc_blood_knight_stillblade
#######*/
enum eStillbladeData
{
    SAY_HEAL                    = -1000193,

    QUEST_REDEEMING_THE_DEAD    = 9685,
    SPELL_SHIMMERING_VESSEL     = 31225,
    SPELL_REVIVE_SELF           = 32343,
};

class npc_blood_knight_stillblade : public CreatureScript
{
public:
    npc_blood_knight_stillblade() : CreatureScript("npc_blood_knight_stillblade") {}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_blood_knight_stillbladeAI (pCreature);
    }

    struct npc_blood_knight_stillbladeAI : public ScriptedAI
    {
        npc_blood_knight_stillbladeAI(Creature *c) : ScriptedAI(c) {}

        uint32 lifeTimer;
        bool spellHit;

        void Reset()
        {
            lifeTimer = 120000;
            me->SetStandState(UNIT_STAND_STATE_DEAD);
            me->SetUInt32Value(UNIT_FIELD_BYTES_1,7);   // lay down
            spellHit = false;
        }

        void EnterCombat(Unit * /*who*/)
        {
        }

        void MoveInLineOfSight(Unit * /*who*/)
        {
        }

        void UpdateAI(const uint32 diff)
        {
            if (me->IsStandState())
            {
                if (lifeTimer <= diff)
                    me->AI()->EnterEvadeMode();
                else
                    lifeTimer -= diff;
            }
        }

        void SpellHit(Unit *Hitter, const SpellEntry *Spellkind)
        {
            if ((Spellkind->Id == SPELL_SHIMMERING_VESSEL) && !spellHit &&
                (Hitter->GetTypeId() == TYPEID_PLAYER) && (CAST_PLR(Hitter)->IsActiveQuest(QUEST_REDEEMING_THE_DEAD)))
            {
                CAST_PLR(Hitter)->AreaExploredOrEventHappens(QUEST_REDEEMING_THE_DEAD);
                DoCast(me, SPELL_REVIVE_SELF);
                me->SetStandState(UNIT_STAND_STATE_STAND);
                me->SetUInt32Value(UNIT_DYNAMIC_FLAGS, 0);
                //me->RemoveAllAuras();
                DoScriptText(SAY_HEAL, me);
                spellHit = true;
            }
        }
    };
};

void AddSC_silvermoon_city()
{
    new npc_blood_knight_stillblade();
}
