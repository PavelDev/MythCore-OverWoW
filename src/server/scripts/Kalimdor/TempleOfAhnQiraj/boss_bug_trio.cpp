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

#define SPELL_CLEAVE        26350
#define SPELL_TOXIC_VOLLEY  25812
#define SPELL_POISON_CLOUD  38718
#define SPELL_ENRAGE        34624

#define SPELL_CHARGE        26561
#define SPELL_KNOCKBACK     26027

#define SPELL_HEAL      25807
#define SPELL_FEAR      19408

class boss_kri : public CreatureScript
{
public:
    boss_kri() : CreatureScript("boss_kri") {
}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_kriAI (pCreature);
    }

    struct boss_kriAI : public ScriptedAI
    {
        boss_kriAI(Creature *c) : ScriptedAI(c)
        {
            pInstance = c->GetInstanceScript();
        }

        InstanceScript *pInstance;

        uint32 Cleave_Timer;
        uint32 ToxicVolley_Timer;
        uint32 Check_Timer;

        bool VemDead;
        bool Death;

        void Reset()
        {
            Cleave_Timer = 4000 + rand()%4000;
            ToxicVolley_Timer = 6000 + rand()%6000;
            Check_Timer = 2000;

            VemDead = false;
            Death = false;
        }

        void EnterCombat(Unit * /*who*/)
        {
        }

        void JustDied(Unit* /*killer*/)
        {
            if (pInstance)
            {
                if (pInstance->GetData(DATA_BUG_TRIO_DEATH) < 2)

                    me->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);

                pInstance->SetData(DATA_BUG_TRIO_DEATH, 1);
            }
        }
        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (Cleave_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_CLEAVE);
                Cleave_Timer = 5000 + rand()%7000;
            } else Cleave_Timer -= diff;

            if (ToxicVolley_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_TOXIC_VOLLEY);
                ToxicVolley_Timer = 10000 + rand()%5000;
            } else ToxicVolley_Timer -= diff;

            if (!HealthAbovePct(5) && !Death)
            {
                DoCast(me->getVictim(), SPELL_POISON_CLOUD);
                Death = true;
            }

            if (!VemDead)
            {
                if (Check_Timer <= diff)
                {
                    if (pInstance && pInstance->GetData(DATA_VEMISDEAD))
                    {
                        DoCast(me, SPELL_ENRAGE);
                        VemDead = true;
                    }
                    Check_Timer = 2000;
                } else Check_Timer -=diff;
            }

            DoMeleeAttackIfReady();
        }
    };
};

class boss_vem : public CreatureScript
{
public:
    boss_vem() : CreatureScript("boss_vem") {
}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_vemAI (pCreature);
    }

    struct boss_vemAI : public ScriptedAI
    {
        boss_vemAI(Creature *c) : ScriptedAI(c)
        {
            pInstance = c->GetInstanceScript();
        }

        InstanceScript *pInstance;

        uint32 Charge_Timer;
        uint32 KnockBack_Timer;
        uint32 Enrage_Timer;

        bool Enraged;

        void Reset()
        {
            Charge_Timer = 15000 + rand()%12000;
            KnockBack_Timer = 8000 + rand()%12000;
            Enrage_Timer = 120000;

            Enraged = false;
        }

        void JustDied(Unit* /*Killer*/)
        {
            if (pInstance)
            {
                pInstance->SetData(DATA_VEM_DEATH, 0);
                if (pInstance->GetData(DATA_BUG_TRIO_DEATH) < 2)

                    me->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);
                pInstance->SetData(DATA_BUG_TRIO_DEATH, 1);
            }
        }

        void EnterCombat(Unit * /*who*/)
        {
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (Charge_Timer <= diff)
            {
                Unit *pTarget = NULL;
                pTarget = SelectTarget(SELECT_TARGET_RANDOM,0);
                if (pTarget)
                {
                    DoCast(pTarget, SPELL_CHARGE);

                    AttackStart(pTarget);
                }

                Charge_Timer = 8000 + rand()%8000;
            } else Charge_Timer -= diff;

            if (KnockBack_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_KNOCKBACK);
                if (DoGetThreat(me->getVictim()))
                    DoModifyThreatPercent(me->getVictim(),-80);
                KnockBack_Timer = 15000 + rand()%10000;
            } else KnockBack_Timer -= diff;

            if (!Enraged && Enrage_Timer <= diff)
            {
                DoCast(me, SPELL_ENRAGE);
                Enraged = true;
            } else Charge_Timer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

class boss_yauj : public CreatureScript
{
public:
    boss_yauj() : CreatureScript("boss_yauj") {
}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_yaujAI (pCreature);
    }

    struct boss_yaujAI : public ScriptedAI
    {
        boss_yaujAI(Creature *c) : ScriptedAI(c)
        {
            pInstance = c->GetInstanceScript();
        }

        InstanceScript *pInstance;

        uint32 Heal_Timer;
        uint32 Fear_Timer;
        uint32 Check_Timer;

        bool VemDead;

        void Reset()
        {
            Heal_Timer = 25000 + rand()%15000;
            Fear_Timer = 12000 + rand()%12000;
            Check_Timer = 2000;

            VemDead = false;
        }

        void JustDied(Unit* /*Killer*/)
        {
            if (pInstance)
            {
                if (pInstance->GetData(DATA_BUG_TRIO_DEATH) < 2)

                    me->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);
                pInstance->SetData(DATA_BUG_TRIO_DEATH, 1);
            }

            for (uint8 i = 0; i < 10; ++i)
            {
                Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0);
                Creature* Summoned = me->SummonCreature(15621,me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(),0,TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN,90000);
                if (Summoned && pTarget)
                    Summoned->AI()->AttackStart(pTarget);
            }
        }

        void EnterCombat(Unit * /*who*/)
        {
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (Fear_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_FEAR);
                DoResetThreat();
                Fear_Timer = 20000;
            } else Fear_Timer -= diff;

            if (Heal_Timer <= diff)
            {
                if (pInstance)
                {
                    Unit *pKri = Unit::GetUnit((*me), pInstance->GetData64(DATA_KRI));
                    Unit *pVem = Unit::GetUnit((*me), pInstance->GetData64(DATA_VEM));

                    switch (urand(0,2))
                    {
                        case 0:
                            if (pKri)
                                DoCast(pKri, SPELL_HEAL);
                            break;
                        case 1:
                            if (pVem)
                                DoCast(pVem, SPELL_HEAL);
                            break;
                        case 2:
                            DoCast(me, SPELL_HEAL);
                            break;
                    }
                }

                Heal_Timer = 15000+rand()%15000;
            } else Heal_Timer -= diff;

            if (Check_Timer <= diff)
            {
                if (!VemDead)
                {
                    if (pInstance)
                    {
                        if (pInstance->GetData(DATA_VEMISDEAD))
                        {
                            DoCast(me, SPELL_ENRAGE);
                            VemDead = true;
                        }
                    }
                }
                Check_Timer = 2000;
            } else Check_Timer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_bug_trio()
{
    new boss_kri();
    new boss_vem();
    new boss_yauj();
}
