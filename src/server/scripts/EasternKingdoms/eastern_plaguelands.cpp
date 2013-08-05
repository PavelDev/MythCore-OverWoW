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

//id8530 - cannibal ghoul
//id8531 - gibbering ghoul
//id8532 - diseased flayer

class mobs_ghoul_flayer : public CreatureScript
{
public:
    mobs_ghoul_flayer() : CreatureScript("mobs_ghoul_flayer") {}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mobs_ghoul_flayerAI (pCreature);
    }

    struct mobs_ghoul_flayerAI : public ScriptedAI
    {
        mobs_ghoul_flayerAI(Creature *c) : ScriptedAI(c) {}

        void Reset() {}

        void EnterCombat(Unit* /*who*/) {}

        void JustDied(Unit* Killer)
        {
            if (Killer->GetTypeId() == TYPEID_PLAYER)
                me->SummonCreature(11064, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 60000);
        }
    };
};

/*######
## npc_augustus_the_touched
######*/

class npc_augustus_the_touched : public CreatureScript
{
public:
    npc_augustus_the_touched() : CreatureScript("npc_augustus_the_touched") {}

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_TRADE)
            pPlayer->SEND_VENDORLIST(pCreature->GetGUID());
        return true;
    }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pCreature->isQuestGiver())
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        if (pCreature->isVendor() && pPlayer->GetQuestRewardStatus(6164))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
        return true;
    }
};

/*######
## npc_darrowshire_spirit
######*/

#define SPELL_SPIRIT_SPAWNIN    17321

class npc_darrowshire_spirit : public CreatureScript
{
public:
    npc_darrowshire_spirit() : CreatureScript("npc_darrowshire_spirit") {}

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        pPlayer->SEND_GOSSIP_MENU(3873, pCreature->GetGUID());
        pPlayer->TalkedToCreature(pCreature->GetEntry(), pCreature->GetGUID());
        pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        return true;
    }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_darrowshire_spiritAI (pCreature);
    }

    struct npc_darrowshire_spiritAI : public ScriptedAI
    {
        npc_darrowshire_spiritAI(Creature *c) : ScriptedAI(c) {}

        void Reset()
        {
            DoCast(me, SPELL_SPIRIT_SPAWNIN);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        }

        void EnterCombat(Unit * /*who*/) {}

    };
};

/*######
## npc_tirion_fordring
######*/

#define GOSSIP_HELLO    "I am ready to hear your tale, Tirion."
#define GOSSIP_SELECT1  "Thank you, Tirion.  What of your identity?"
#define GOSSIP_SELECT2  "That is terrible."
#define GOSSIP_SELECT3  "I will, Tirion."

class npc_tirion_fordring : public CreatureScript
{
public:
    npc_tirion_fordring() : CreatureScript("npc_tirion_fordring") {}

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        switch (uiAction)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                pPlayer->SEND_GOSSIP_MENU(4493, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                pPlayer->SEND_GOSSIP_MENU(4494, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+3:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
                pPlayer->SEND_GOSSIP_MENU(4495, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                pPlayer->CLOSE_GOSSIP_MENU();
                pPlayer->AreaExploredOrEventHappens(5742);
                break;
        }
        return true;
    }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pCreature->isQuestGiver())
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        if (pPlayer->GetQuestStatus(5742) == QUEST_STATUS_INCOMPLETE && pPlayer->getStandState() == UNIT_STAND_STATE_SIT)
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

        return true;
    }
};

void AddSC_eastern_plaguelands()
{
    new mobs_ghoul_flayer();
    new npc_augustus_the_touched();
    new npc_darrowshire_spirit();
    new npc_tirion_fordring();
}
