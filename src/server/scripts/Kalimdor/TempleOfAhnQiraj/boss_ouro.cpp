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

#define SPELL_SWEEP             26103
#define SPELL_SANDBLAST         26102
#define SPELL_GROUND_RUPTURE    26100
#define SPELL_BIRTH             26262

#define SPELL_DIRTMOUND_PASSIVE 26092

class boss_ouro : public CreatureScript
{
public:
    boss_ouro() : CreatureScript("boss_ouro") {
}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_ouroAI (pCreature);
    }

    struct boss_ouroAI : public ScriptedAI
    {
        boss_ouroAI(Creature *c) : ScriptedAI(c) {
}

        uint32 Sweep_Timer;
        uint32 SandBlast_Timer;
        uint32 Submerge_Timer;
        uint32 Back_Timer;
        uint32 ChangeTarget_Timer;
        uint32 Spawn_Timer;

        bool Enrage;
        bool Submerged;

        void Reset()
        {
            Sweep_Timer = 5000 + rand()%5000;
            SandBlast_Timer = 20000 + rand()%15000;
            Submerge_Timer = 90000 + rand()%60000;
            Back_Timer = 30000 + rand()%15000;
            ChangeTarget_Timer = 5000 + rand()%3000;
            Spawn_Timer = 10000 + rand()%10000;

            Enrage = false;
            Submerged = false;
        }

        void EnterCombat(Unit * /*who*/)
        {
            DoCast(me->getVictim(), SPELL_BIRTH);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (!Submerged && Sweep_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_SWEEP);
                Sweep_Timer = 15000 + rand()%15000;
            } else Sweep_Timer -= diff;

            if (!Submerged && SandBlast_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_SANDBLAST);
                SandBlast_Timer = 20000 + rand()%15000;
            } else SandBlast_Timer -= diff;

            if (!Submerged && Submerge_Timer <= diff)
            {
                me->HandleEmoteCommand(EMOTE_ONESHOT_SUBMERGE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->setFaction(35);
                DoCast(me, SPELL_DIRTMOUND_PASSIVE);

                Submerged = true;
                Back_Timer = 30000 + rand()%15000;
            } else Submerge_Timer -= diff;

            if (Submerged && ChangeTarget_Timer <= diff)
            {
                Unit *pTarget = NULL;
                pTarget = SelectTarget(SELECT_TARGET_RANDOM,0);

                if (pTarget)
                    DoTeleportTo(pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ());

                ChangeTarget_Timer = 10000 + rand()%10000;
            } else ChangeTarget_Timer -= diff;

            if (Submerged && Back_Timer <= diff)
            {
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->setFaction(14);

                DoCast(me->getVictim(), SPELL_GROUND_RUPTURE);

                Submerged = false;
                Submerge_Timer = 60000 + rand()%60000;
            } else Back_Timer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_boss_ouro()
{
    new boss_ouro();
}
