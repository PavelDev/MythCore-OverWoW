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

#define SAY_AGGRO               -1469007
#define SAY_XHEALTH             -1469008
#define SAY_SHADOWFLAME         -1469009
#define SAY_RAISE_SKELETONS     -1469010
#define SAY_SLAY                -1469011
#define SAY_DEATH               -1469012

#define SAY_MAGE                -1469013
#define SAY_WARRIOR             -1469014
#define SAY_DRUID               -1469015
#define SAY_PRIEST              -1469016
#define SAY_PALADIN             -1469017
#define SAY_SHAMAN              -1469018
#define SAY_WARLOCK             -1469019
#define SAY_HUNTER              -1469020
#define SAY_ROGUE               -1469021

#define SPELL_SHADOWFLAME_INITIAL   22972
#define SPELL_SHADOWFLAME           22539
#define SPELL_BELLOWINGROAR         22686
#define SPELL_VEILOFSHADOW          7068
#define SPELL_CLEAVE                20691
#define SPELL_TAILLASH              23364
#define SPELL_BONECONTRUST          23363

#define SPELL_MAGE                  23410
#define SPELL_WARRIOR               23397
#define SPELL_DRUID                 23398
#define SPELL_PRIEST                23401
#define SPELL_PALADIN               23418
#define SPELL_SHAMAN                23425
#define SPELL_WARLOCK               23427
#define SPELL_HUNTER                23436
#define SPELL_ROGUE                 23414

class boss_nefarian : public CreatureScript
{
public:
    boss_nefarian() : CreatureScript("boss_nefarian") {}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_nefarianAI (pCreature);
    }

    struct boss_nefarianAI : public ScriptedAI
    {
        boss_nefarianAI(Creature *c) : ScriptedAI(c) {}

        uint32 ShadowFlame_Timer;
        uint32 BellowingRoar_Timer;
        uint32 VeilOfShadow_Timer;
        uint32 Cleave_Timer;
        uint32 TailLash_Timer;
        uint32 ClassCall_Timer;
        bool Phase3;

        uint32 DespawnTimer;

        void Reset()
        {
            ShadowFlame_Timer = 12000;
            BellowingRoar_Timer = 30000;
            VeilOfShadow_Timer = 15000;
            Cleave_Timer = 7000;
            TailLash_Timer = 10000;
            ClassCall_Timer = 35000;
            Phase3 = false;

            DespawnTimer = 5000;
        }

        void KilledUnit(Unit* Victim)
        {
            if (rand()%5)
                return;

            DoScriptText(SAY_SLAY, me, Victim);
        }

        void JustDied(Unit* /*Killer*/)
        {
            DoScriptText(SAY_DEATH, me);
        }

        void EnterCombat(Unit * who)
        {
            DoScriptText(RAND(SAY_XHEALTH,SAY_AGGRO,SAY_SHADOWFLAME), me);

            DoCast(who, SPELL_SHADOWFLAME_INITIAL);
            DoZoneInCombat();
        }

        void UpdateAI(const uint32 diff)
        {
            if (DespawnTimer <= diff)
            {
                if (!UpdateVictim())
                    me->DespawnOrUnsummon();
                DespawnTimer = 5000;
            } else DespawnTimer -= diff;

            if (!UpdateVictim())
                return;

            if (ShadowFlame_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_SHADOWFLAME);
                ShadowFlame_Timer = 12000;
            } else ShadowFlame_Timer -= diff;

            if (BellowingRoar_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_BELLOWINGROAR);
                BellowingRoar_Timer = 30000;
            } else BellowingRoar_Timer -= diff;

            if (VeilOfShadow_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_VEILOFSHADOW);
                VeilOfShadow_Timer = 15000;
            } else VeilOfShadow_Timer -= diff;

            if (Cleave_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_CLEAVE);
                Cleave_Timer = 7000;
            } else Cleave_Timer -= diff;

            if (TailLash_Timer <= diff)
            {
                TailLash_Timer = 10000;
            } else TailLash_Timer -= diff;

            if (ClassCall_Timer <= diff)
            {
                switch (urand(0,8))
                {
                    case 0:
                        DoScriptText(SAY_MAGE, me);
                        DoCast(me, SPELL_MAGE);
                        break;
                    case 1:
                        DoScriptText(SAY_WARRIOR, me);
                        DoCast(me, SPELL_WARRIOR);
                        break;
                    case 2:
                        DoScriptText(SAY_DRUID, me);
                        DoCast(me, SPELL_DRUID);
                        break;
                    case 3:
                        DoScriptText(SAY_PRIEST, me);
                        DoCast(me, SPELL_PRIEST);
                        break;
                    case 4:
                        DoScriptText(SAY_PALADIN, me);
                        DoCast(me, SPELL_PALADIN);
                        break;
                    case 5:
                        DoScriptText(SAY_SHAMAN, me);
                        DoCast(me, SPELL_SHAMAN);
                        break;
                    case 6:
                        DoScriptText(SAY_WARLOCK, me);
                        DoCast(me, SPELL_WARLOCK);
                        break;
                    case 7:
                        DoScriptText(SAY_HUNTER, me);
                        DoCast(me, SPELL_HUNTER);
                        break;
                    case 8:
                        DoScriptText(SAY_ROGUE, me);
                        DoCast(me, SPELL_ROGUE);
                        break;
                }

                ClassCall_Timer = 35000 + (rand() % 5000);
            } else ClassCall_Timer -= diff;

            if (!Phase3 && HealthBelowPct(20))
            {
                Phase3 = true;
                DoScriptText(SAY_RAISE_SKELETONS, me);
            }

            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_boss_nefarian()
{
    new boss_nefarian();
}
