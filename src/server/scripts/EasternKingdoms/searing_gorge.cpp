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

/*######
## npc_kalaran_windblade
######*/

#define GOSSIP_HELLO_KW    "Tell me what drives this vengance?"
#define GOSSIP_SELECT_KW1  "Continue please"
#define GOSSIP_SELECT_KW2  "Let me confer with my colleagues"

class npc_kalaran_windblade : public CreatureScript
{
public:
    npc_kalaran_windblade() : CreatureScript("npc_kalaran_windblade") {}

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        switch (uiAction)
        {
            case GOSSIP_ACTION_INFO_DEF:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT_KW1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                pPlayer->SEND_GOSSIP_MENU(1954, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+1:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT_KW2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                pPlayer->SEND_GOSSIP_MENU(1955, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                pPlayer->CLOSE_GOSSIP_MENU();
                pPlayer->AreaExploredOrEventHappens(3441);
                break;
        }
        return true;
    }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pCreature->isQuestGiver())
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        if (pPlayer->GetQuestStatus(3441) == QUEST_STATUS_INCOMPLETE)
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_KW, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

        return true;
    }
};

/*######
## npc_lothos_riftwaker
######*/

#define GOSSIP_HELLO_LR "Teleport me to the Molten Core"

class npc_lothos_riftwaker : public CreatureScript
{
public:
    npc_lothos_riftwaker() : CreatureScript("npc_lothos_riftwaker") {}

    bool OnGossipSelect(Player* pPlayer, Creature* /*pCreature*/, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
        {
            pPlayer->CLOSE_GOSSIP_MENU();
            pPlayer->TeleportTo(409, 1096, -467, -104.6f, 3.64f);
        }

        return true;
    }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pCreature->isQuestGiver())
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        if (pPlayer->GetQuestRewardStatus(7487) || pPlayer->GetQuestRewardStatus(7848))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_LR, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

        return true;
    }
};

/*######
## npc_zamael_lunthistle
######*/

#define GOSSIP_HELLO_ZL     "Tell me your story"
#define GOSSIP_SELECT_ZL1   "Please continue..."
#define GOSSIP_SELECT_ZL2   "Goodbye"

class npc_zamael_lunthistle : public CreatureScript
{
public:
    npc_zamael_lunthistle() : CreatureScript("npc_zamael_lunthistle") {}

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        switch (uiAction)
        {
            case GOSSIP_ACTION_INFO_DEF:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT_ZL1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                pPlayer->SEND_GOSSIP_MENU(1921, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+1:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT_ZL2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                pPlayer->SEND_GOSSIP_MENU(1922, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                pPlayer->CLOSE_GOSSIP_MENU();
                pPlayer->AreaExploredOrEventHappens(3377);
                break;
        }
        return true;
    }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pCreature->isQuestGiver())
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        if (pPlayer->GetQuestStatus(3377) == QUEST_STATUS_INCOMPLETE)
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_ZL, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

        pPlayer->SEND_GOSSIP_MENU(1920, pCreature->GetGUID());

        return true;
    }
};

/*######
##
######*/

void AddSC_searing_gorge()
{
    new npc_kalaran_windblade();
    new npc_lothos_riftwaker();
    new npc_zamael_lunthistle();
}
