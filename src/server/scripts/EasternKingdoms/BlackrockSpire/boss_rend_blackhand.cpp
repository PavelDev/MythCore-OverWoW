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
    SPELL_WHIRLWIND                 = 26038,
    SPELL_CLEAVE                    = 20691,
    SPELL_THUNDERCLAP               = 23931, //Not sure if he cast this spell
};

enum Events
{
    EVENT_WHIRLWIND                 = 1,
    EVENT_CLEAVE                    = 2,
    EVENT_THUNDERCLAP               = 3,
};

class boss_rend_blackhand : public CreatureScript
{
public:
    boss_rend_blackhand() : CreatureScript("boss_rend_blackhand") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_rend_blackhandAI(creature);
    }

    struct boss_rend_blackhandAI : public BossAI
    {
        boss_rend_blackhandAI(Creature* creature) : BossAI(creature, DATA_WARCHIEF_REND_BLACKHAND) {}

        void Reset()
        {
            _Reset();
        }

        void EnterCombat(Unit* /*who*/)
        {
            _EnterCombat();
            events.ScheduleEvent(EVENT_WHIRLWIND, 20*IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_CLEAVE, 5*IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_THUNDERCLAP, 9*IN_MILLISECONDS);
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
                    case EVENT_WHIRLWIND:
                        DoCast(me->getVictim(), SPELL_WHIRLWIND);
                        events.ScheduleEvent(EVENT_WHIRLWIND, 18*IN_MILLISECONDS);
                        break;
                    case EVENT_CLEAVE:
                        DoCast(me->getVictim(), SPELL_CLEAVE);
                        events.ScheduleEvent(EVENT_CLEAVE, 10*IN_MILLISECONDS);
                        break;
                    case EVENT_THUNDERCLAP:
                        DoCast(me->getVictim(), SPELL_THUNDERCLAP);
                        events.ScheduleEvent(EVENT_THUNDERCLAP, 16*IN_MILLISECONDS);
                        break;
                }
            }
            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_boss_rend_blackhand()
{
    new boss_rend_blackhand();
}
