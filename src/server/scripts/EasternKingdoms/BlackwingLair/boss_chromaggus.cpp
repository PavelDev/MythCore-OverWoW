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

enum Emotes
{
    EMOTE_FRENZY                                           = -1469002,
    EMOTE_SHIMMER                                          = -1469003
};

enum Spells
{
    SPELL_FIRE_VULNERABILITY                               = 22277,
    SPELL_FROST_VULNERABILITY                              = 22278,
    SPELL_SHADOW_VULNERABILITY                             = 22279,
    SPELL_NATURE_VULNERABILITY                             = 22280,
    SPELL_ARCANE_VULNERABILITY                             = 22281,

    SPELL_INCINERATE                                       = 23308,
    SPELL_TIMELAPSE                                        = 23310,
    SPELL_CORROSIVEACID                                    = 23313,
    SPELL_IGNITEFLESH                                      = 23315,
    SPELL_FROSTBURN                                        = 23187,

    SPELL_BROODAF_BLUE                                     = 23153,
    SPELL_BROODAF_BLACK                                    = 23154,
    SPELL_BROODAF_RED                                      = 23155,
    SPELL_BROODAF_BRONZE                                   = 23170,
    SPELL_BROODAF_GREEN                                    = 23169,
    SPELL_CHROMATIC_MUT_1                                  = 23174,
    SPELL_FRENZY                                           = 28371,
    SPELL_ENRAGE                                           = 28747
};

class boss_chromaggus : public CreatureScript
{
public:
    boss_chromaggus() : CreatureScript("boss_chromaggus") {}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_chromaggusAI (pCreature);
    }

    struct boss_chromaggusAI : public ScriptedAI
    {
        boss_chromaggusAI(Creature *c) : ScriptedAI(c)
        {
            switch (urand(0,19))
            {
                case 0:
                    Breath1_Spell = SPELL_INCINERATE;
                    Breath2_Spell = SPELL_TIMELAPSE;
                    break;
                case 1:
                    Breath1_Spell = SPELL_INCINERATE;
                    Breath2_Spell = SPELL_CORROSIVEACID;
                    break;
                case 2:
                    Breath1_Spell = SPELL_INCINERATE;
                    Breath2_Spell = SPELL_IGNITEFLESH;
                    break;
                case 3:
                    Breath1_Spell = SPELL_INCINERATE;
                    Breath2_Spell = SPELL_FROSTBURN;
                    break;

                case 4:
                    Breath1_Spell = SPELL_TIMELAPSE;
                    Breath2_Spell = SPELL_INCINERATE;
                    break;
                case 5:
                    Breath1_Spell = SPELL_TIMELAPSE;
                    Breath2_Spell = SPELL_CORROSIVEACID;
                    break;
                case 6:
                    Breath1_Spell = SPELL_TIMELAPSE;
                    Breath2_Spell = SPELL_IGNITEFLESH;
                    break;
                case 7:
                    Breath1_Spell = SPELL_TIMELAPSE;
                    Breath2_Spell = SPELL_FROSTBURN;
                    break;

                case 8:
                    Breath1_Spell = SPELL_CORROSIVEACID;
                    Breath2_Spell = SPELL_INCINERATE;
                    break;
                case 9:
                    Breath1_Spell = SPELL_CORROSIVEACID;
                    Breath2_Spell = SPELL_TIMELAPSE;
                    break;
                case 10:
                    Breath1_Spell = SPELL_CORROSIVEACID;
                    Breath2_Spell = SPELL_IGNITEFLESH;
                    break;
                case 11:
                    Breath1_Spell = SPELL_CORROSIVEACID;
                    Breath2_Spell = SPELL_FROSTBURN;
                    break;

                case 12:
                    Breath1_Spell = SPELL_IGNITEFLESH;
                    Breath2_Spell = SPELL_INCINERATE;
                    break;
                case 13:
                    Breath1_Spell = SPELL_IGNITEFLESH;
                    Breath2_Spell = SPELL_CORROSIVEACID;
                    break;
                case 14:
                    Breath1_Spell = SPELL_IGNITEFLESH;
                    Breath2_Spell = SPELL_TIMELAPSE;
                    break;
                case 15:
                    Breath1_Spell = SPELL_IGNITEFLESH;
                    Breath2_Spell = SPELL_FROSTBURN;
                    break;

                case 16:
                    Breath1_Spell = SPELL_FROSTBURN;
                    Breath2_Spell = SPELL_INCINERATE;
                    break;
                case 17:
                    Breath1_Spell = SPELL_FROSTBURN;
                    Breath2_Spell = SPELL_TIMELAPSE;
                    break;
                case 18:
                    Breath1_Spell = SPELL_FROSTBURN;
                    Breath2_Spell = SPELL_CORROSIVEACID;
                    break;
                case 19:
                    Breath1_Spell = SPELL_FROSTBURN;
                    Breath2_Spell = SPELL_IGNITEFLESH;
                    break;
            };

            EnterEvadeMode();
        }

        uint32 Breath1_Spell;
        uint32 Breath2_Spell;
        uint32 CurrentVurln_Spell;

        uint32 Shimmer_Timer;
        uint32 Breath1_Timer;
        uint32 Breath2_Timer;
        uint32 Affliction_Timer;
        uint32 Frenzy_Timer;
        bool Enraged;

        void Reset()
        {
            CurrentVurln_Spell = 0;

            Shimmer_Timer = 0;
            Breath1_Timer = 30000;
            Breath2_Timer = 60000;
            Affliction_Timer = 10000;
            Frenzy_Timer = 15000;

            Enraged = false;
        }

        void EnterCombat(Unit * /*who*/)
        {
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (Shimmer_Timer <= diff)
            {
                if (CurrentVurln_Spell)
                    me->RemoveAurasDueToSpell(CurrentVurln_Spell);

                uint32 spell = RAND(SPELL_FIRE_VULNERABILITY, SPELL_FROST_VULNERABILITY,
                    SPELL_SHADOW_VULNERABILITY, SPELL_NATURE_VULNERABILITY, SPELL_ARCANE_VULNERABILITY);

                DoCast(me, spell);
                CurrentVurln_Spell = spell;

                DoScriptText(EMOTE_SHIMMER, me);
                Shimmer_Timer = 45000;
            } else Shimmer_Timer -= diff;

            if (Breath1_Timer <= diff)
            {
                DoCast(me->getVictim(), Breath1_Spell);
                Breath1_Timer = 60000;
            } else Breath1_Timer -= diff;

            if (Breath2_Timer <= diff)
            {
                DoCast(me->getVictim(), Breath2_Spell);
                Breath2_Timer = 60000;
            } else Breath2_Timer -= diff;

            if (Affliction_Timer <= diff)
            {
                std::list<HostileReference*> threatlist = me->getThreatManager().getThreatList();
                for (std::list<HostileReference*>::const_iterator i = threatlist.begin(); i != threatlist.end(); ++i)
                {
                    Unit* pUnit;
                    if ((*i) && (*i)->getSource())
                    {
                        pUnit = Unit::GetUnit((*me), (*i)->getUnitGuid());
                        if (pUnit)
                        {
                            DoCast(pUnit, RAND(SPELL_BROODAF_BLUE, SPELL_BROODAF_BLACK,
                                               SPELL_BROODAF_RED, SPELL_BROODAF_BRONZE, SPELL_BROODAF_GREEN), true);

                            if (pUnit->HasAura(SPELL_BROODAF_BLUE)
                                && pUnit->HasAura(SPELL_BROODAF_BLACK)
                                && pUnit->HasAura(SPELL_BROODAF_RED)
                                && pUnit->HasAura(SPELL_BROODAF_BRONZE)
                                && pUnit->HasAura(SPELL_BROODAF_GREEN))
                            {
                                if (pUnit->GetTypeId() == TYPEID_PLAYER)
                                    pUnit->CastSpell(pUnit, 5, false);
                            }
                        }
                    }
                }

                Affliction_Timer = 10000;
            } else Affliction_Timer -= diff;

            if (Frenzy_Timer <= diff)
            {
                DoCast(me, SPELL_FRENZY);
                DoScriptText(EMOTE_FRENZY, me);
                Frenzy_Timer = urand(10000,15000);
            } else Frenzy_Timer -= diff;

            if (!Enraged && HealthBelowPct(20))
            {
                DoCast(me, SPELL_ENRAGE);
                Enraged = true;
            }

            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_boss_chromaggus()
{
    new boss_chromaggus();
}
