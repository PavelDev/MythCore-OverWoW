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
    SPELL_FIRENOVA                  = 23462,
    SPELL_FLAMEBUFFET               = 23341,
    SPELL_PYROBLAST                 = 17274,
};

enum Events
{
    EVENT_FIRENOVA                  = 1,
    EVENT_FLAMEBUFFET               = 2,
    EVENT_PYROBLAST                 = 3,
};

class boss_pyroguard_emberseer : public CreatureScript
{
public:
    boss_pyroguard_emberseer() : CreatureScript("boss_pyroguard_emberseer") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_pyroguard_emberseerAI(creature);
    }

    struct boss_pyroguard_emberseerAI : public BossAI
    {
        boss_pyroguard_emberseerAI(Creature* creature) : BossAI(creature, DATA_PYROGAURD_EMBERSEER) {}

        void Reset()
        {
            _Reset();
        }

        void EnterCombat(Unit* /*who*/)
        {
            _EnterCombat();
            events.ScheduleEvent(EVENT_FIRENOVA, 6*IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_FLAMEBUFFET, 3*IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_PYROBLAST, 14*IN_MILLISECONDS);
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
                    case EVENT_FIRENOVA:
                        DoCast(me->getVictim(), SPELL_FIRENOVA);
                        events.ScheduleEvent(EVENT_FIRENOVA, 6*IN_MILLISECONDS);
                        break;
                    case EVENT_FLAMEBUFFET:
                        DoCast(me->getVictim(), SPELL_FLAMEBUFFET);
                        events.ScheduleEvent(EVENT_FLAMEBUFFET, 14*IN_MILLISECONDS);
                        break;
                    case EVENT_PYROBLAST:
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                            DoCast(target, SPELL_PYROBLAST);
                        events.ScheduleEvent(EVENT_PYROBLAST, 15*IN_MILLISECONDS);
                        break;
                }
            }
            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_boss_pyroguard_emberseer()
{
    new boss_pyroguard_emberseer();
}
