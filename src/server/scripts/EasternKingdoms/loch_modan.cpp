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
## npc_mountaineer_pebblebitty
######*/

#define GOSSIP_MP "Open the gate please, i need to get to Searing Gorge"

#define GOSSIP_MP1 "But i need to get there, now open the gate!"
#define GOSSIP_MP2 "Ok, so what is this other way?"
#define GOSSIP_MP3 "Doesn't matter, i'm invulnerable."
#define GOSSIP_MP4 "Yes..."
#define GOSSIP_MP5 "Ok, i'll try to remember that."
#define GOSSIP_MP6 "A key? Ok!"

class npc_mountaineer_pebblebitty : public CreatureScript
{
public:
    npc_mountaineer_pebblebitty() : CreatureScript("npc_mountaineer_pebblebitty") {}

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        switch (uiAction)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_MP1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                pPlayer->SEND_GOSSIP_MENU(1833, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_MP2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                pPlayer->SEND_GOSSIP_MENU(1834, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+3:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_MP3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
                pPlayer->SEND_GOSSIP_MENU(1835, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_MP4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
                pPlayer->SEND_GOSSIP_MENU(1836, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+5:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_MP5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
                pPlayer->SEND_GOSSIP_MENU(1837, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+6:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_MP6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
                pPlayer->SEND_GOSSIP_MENU(1838, pCreature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+7:
                pPlayer->CLOSE_GOSSIP_MENU();
                break;
        }
        return true;
    }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pCreature->isQuestGiver())
            pPlayer->PrepareQuestMenu(pCreature->GetGUID());

        if (!pPlayer->GetQuestRewardStatus(3181) == 1)
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_MP, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

        return true;
    }
};

void AddSC_loch_modan()
{
    new npc_mountaineer_pebblebitty();
}
