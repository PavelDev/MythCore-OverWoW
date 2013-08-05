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

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "blackrock_spire.h"

enum Spells
{
    SPELL_SHOOT                     = 16496,
    SPELL_STUNBOMB                  = 16497,
    SPELL_HEALING_POTION            = 15504,
    SPELL_HOOKEDNET                 = 15609,
};

enum Events
{
    EVENT_SHOOT                     = 1,
    EVENT_STUN_BOMB                 = 2,
};

class quartermaster_zigris : public CreatureScript
{
public:
    quartermaster_zigris() : CreatureScript("quartermaster_zigris") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_quatermasterzigrisAI(creature);
    }

    struct boss_quatermasterzigrisAI : public BossAI
    {
        boss_quatermasterzigrisAI(Creature* creature) : BossAI(creature, DATA_QUARTERMASTER_ZIGRIS) {}

        void Reset()
        {
            _Reset();
        }

        void EnterCombat(Unit* /*who*/)
        {
            _EnterCombat();
            events.ScheduleEvent(EVENT_SHOOT, 1*IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_STUN_BOMB, 16*IN_MILLISECONDS);
        }

        void JustDied(Unit* /*who*/)
        {
            _JustDied();
        }

        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            if (me->HasUnitState(UNIT_STAT_CASTING))
                return;

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_SHOOT:
                        DoCast(me->getVictim(), SPELL_SHOOT);
                        events.ScheduleEvent(EVENT_SHOOT, 500);
                        break;
                    case EVENT_STUN_BOMB:
                        DoCast(me->getVictim(), SPELL_STUNBOMB);
                        events.ScheduleEvent(EVENT_STUN_BOMB, 14*IN_MILLISECONDS);
                        break;
                }
            }
            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_boss_quatermasterzigris()
{
    new quartermaster_zigris();
}
