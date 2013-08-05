/* Myth Custom Command Balance */
/* 4 - GM / Dev / Main GM */
/* 3 - Game Master */
/* 2 & 1 - Moderators / Event Makers */
/* Balance to prevent "drawing" and bullshits */
UPDATE `command` SET `security` = 0 WHERE `name` LIKE 'commands';
UPDATE `command` SET `security` = 0 WHERE `name` LIKE 'help';
UPDATE `command` SET `security` = 0 WHERE `name` LIKE 'start';

UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'aura';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'announce';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'combatstop';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'cooldown';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'demorph';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'dismount';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'freeze';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'groupsummon';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'distance';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'hover';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gps';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'kick';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'mute';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'nameannounce';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'summon';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'neargrave';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'notify';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'pinfo';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'playall';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'possess';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'recall';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'repairitems';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'respawn';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'revive';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'taxicheat';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'unaura';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'unbindsight';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'unfreeze';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'unmute';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'unpossess';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'waterwalk';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'whispers';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'channel set ownership';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'appear';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'character titles';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'modify';

UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'die';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'damage';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'cometome';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'bindsight';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'explorecheat';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'itemmove';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'levelup';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'linkgrave';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'maxskill';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'hidearea';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'guid';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'modify tp';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'movegens';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'setskill';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'showarea';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'additem';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'additemset';

UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'flusharenapoints';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wchange';

UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'titles%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'titles remove';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'titles current';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'titles add';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'titles set mask';

UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'pdump%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'pdump load';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'pdump write';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'pdump';

UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gm%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gm chat';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gm fly';
UPDATE `command` SET `security` = 0 WHERE `name` LIKE 'gm ingame';
UPDATE `command` SET `security` = 0 WHERE `name` LIKE 'gm list';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gm visible';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gm';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gmannounce';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gmnameannounce';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gmnotify';

UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'instance%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'instance listbinds';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'instance savedata';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'instance stats';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'instance unbind';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'instance';

UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'achievement%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'achievement add';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'achievement';

UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'list%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'list auras';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'list creature';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'list item';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'list object';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'list';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'listfreeze';

UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'tele%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'tele add';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'tele del';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'tele group';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'tele name';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'tele';

UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'quest%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'quest add';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'quest complete';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'quest remove';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'quest';

UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'guild%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'guild create';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'guild delete';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'guild invite';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'guild rank';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'guild uninvite';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'guild';

UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'pet%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'pet create';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'pet learn';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'pet tp';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'pet unlearn';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'pet';

UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'tele%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'tele add';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'tele del';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'tele group';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'tele name';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'tele';

UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'cast%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'cast back';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'cast dist';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'cast self';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'cast target';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'cast';

UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'go%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'go creature';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'go graveyard';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'go grid';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'go object';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'go taxinode';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'go ticket';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'go trigger';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'go xy';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'go xyz';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'go zonexy';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'go';

UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'event%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'event activelist';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'event start';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'event stop';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'event';

UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'honor%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'honor add';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'honor add kill';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'honor update';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'honor';

UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wp%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wp event';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wp load';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wp show';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wp unload';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wp add';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wp reload';

UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'debug%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'debug arena';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'debug bg';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'debug Mod32Value';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'debug play cinematic';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'debug play movie';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'debug play sound';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'debug areatriggers';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'debug';

UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'character%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'character customize';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'character erase';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'character level';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'character rename';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'character reputation';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'character deleted delete';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'character deleted list';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'character deleted old';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'character deleted restore';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'character changefaction';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'character changerace';

UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ban%';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'unban%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'unban account';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'unban character';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'unban ip';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'unban';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ban account';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ban character';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ban ip';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ban';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'baninfo account';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'baninfo character';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'baninfo ip';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'baninfo';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'bank';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ban playeraccount';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'banlist account';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'banlist character';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'banlist ip';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'banlist';

UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reset%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'reset honor';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'reset level';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'reset spells';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'reset stats';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'reset talents';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'reset';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'reset achievements';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'reset all';

UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'learn%';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE '%unlearn%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'learn all my talents';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'learn all my spells';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'learn all my pettalents';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'learn all my class';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'learn all gm';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'learn all lang';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'learn all default';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'learn';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'learn all';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'learn all recipes';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'learn all crafts';

UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'modify%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'modify';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'modify arena';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'modify aspeed';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'modify bit';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'modify bwalk';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'modify drunk';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'modify energy';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'modify faction';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'modify fly';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'modify gender';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'modify honor';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'modify hp';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'modify mana';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'modify money';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'modify morph';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'modify mount';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'modify phase';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'modify rage';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'modify rep';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'modify runicpower';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'modify scale';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'modify speed';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'modify spell';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'modify standstate';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'modify swim';

UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'gobject%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gobject activate';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gobject add';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gobject delete';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gobject move';
UPDATE `command` SET `security` = 8 WHERE `name` LIKE 'gobject near'; /* CrashFIX!!! */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gobject add temp';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gobject target';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gobject set phase';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gobject turn';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gobject info';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'gobject';

UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'send%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'send%';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'send items';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'send mail';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'send message';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'send money';

UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'save%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'save';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'saveall';

UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'npc%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'npc';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'npc add';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'npc set spawndist';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'npc set spawntime';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'npc add temp';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'npc textemote';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'npc whisper';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'npc yell';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'npc set phase';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'npc set movetype';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'npc set model';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'npc set link';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'npc set deathstate';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'npc say';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'npc move';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'npc playemote';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'npc follow stop';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'npc info';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'npc follow';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'npc set flag';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'npc set factionid';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'npc set level';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'npc delete';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'npc delete item';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'npc set allowmove';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'npc set entry';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'npc add move';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'npc add item';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'npc add formation';

UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'server%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'server corpses';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'server exit';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'server idlerestart cancel';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'server idlerestart';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'server idleshutdown cancel';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'server idleshutdown';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'server info';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'server motd';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'server plimit';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'server restart cancel';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'server restart';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'server set closed';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'server set loglevel';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'server set motd';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'server shutdown cancel';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'server shutdown';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'server';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'server togglequerylog';

UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup area';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup title';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup creature';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup event';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup faction';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup item';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup itemset';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup map';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup object';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup player account';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup player email';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup player ip';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup quest';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup skill';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup spell';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup taxinode';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup tele';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'lookup';

UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ticket%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ticket assign';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ticket close';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ticket closedlist';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ticket comment';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ticket delete';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ticket list';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ticket onlinelist';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ticket unassign';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ticket viewid';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ticket viewname';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'ticket';

UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'account%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 0 WHERE `name` LIKE 'account';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'account addon';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'account create';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'account delete';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'account lock';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'account onlinelist';
UPDATE `command` SET `security` = 0 WHERE `name` LIKE 'account password';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'account set addon';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'account set gmlevel';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'account set password';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'account set';

UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'reload';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload creature_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload creature_onkill_reputation';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload conditions';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload locales_item_set_name';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload gossip_scripts';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload gossip_menu_option';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload gossip_menu';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload all scripts';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload locales_gossip_menu_option';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload quest_poi';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload lfg_dungeon_encounters';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload lfg_dungeon_rewards';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload creature_text';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload all spell';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload auctions';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload all eventai';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload all area';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload all achievement';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload achievement_reward';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload achievement_criteria_data';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload access_requirement';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload mail_level_reward';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload smart_scripts';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload all quest';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload all npc';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload all loot';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload all item';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload all locales';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload all gossips';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload all';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload areatrigger_involvedrelation';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload areatrigger_tavern';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload areatrigger_teleport';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload autobroadcast';
UPDATE `command` SET `security` = 2 WHERE `name` LIKE 'reload command';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload config';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload creature_involvedrelation';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload creature_linked_respawn';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload creature_loot_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload creature_questrelation';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload disenchant_loot_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload event_scripts';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload fishing_loot_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload game_graveyard_zone';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload game_tele';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload gameobject_involvedrelation';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload gameobject_loot_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload gameobject_questrelation';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload gameobject_scripts';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'reload gm_tickets';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload item_enchantment_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload item_loot_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload locales_creature';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload locales_gameobject';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload locales_item';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload locales_npc_text';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload locales_page_text';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload locales_points_of_interest';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload locales_quest';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload milling_loot_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload npc_gossip';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload npc_trainer';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload npc_vendor';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload page_text';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload pickpocketing_loot_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload points_of_interest';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload prospecting_loot_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload quest_end_scripts';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload mail_loot_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload quest_start_scripts';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload quest_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload reference_loot_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload reserved_name';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload skill_discovery_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload skill_extra_item_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload skill_fishing_base_level';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload skinning_loot_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload spell_area';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload spell_bonus_data';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE 'reload disables';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload spell_group_stack_rules';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload spell_learn_spell';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload spell_linked_spell';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload spell_loot_template';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload spell_pet_auras';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload spell_proc_event';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload spell_required';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload item_set_names';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload spell_scripts';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload spell_target_position';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload spell_threats';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload trinity_string';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload waypoint_scripts';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'reload spell_group';

UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wg%';
/* If you want set security level to each command */
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wg';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wg enable';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wg start';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wg status';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wg stop';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wg switch';
UPDATE `command` SET `security` = 4 WHERE `name` LIKE 'wg timer';