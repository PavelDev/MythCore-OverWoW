-- -------------------------------------------------------------------------
-- ---------------- Myth Project "World" Database Cleaner ------------------
-- -------------------------------------------------------------------------
DROP TABLE IF EXISTS `db_version_ytdb`;         -- DEPRICATED TABLE
DROP TABLE IF EXISTS `npc_gossip`;              -- DEPRICATED TABLE
DROP TABLE IF EXISTS `game_event_npc_gossip`;   -- DEPRICATED TABLE
DROP TABLE IF EXISTS `lfg_dungeon_encounters`;  -- DEPRICATED TABLE
DROP TABLE IF EXISTS `gameobject_respawn`;      -- DEPRICATED TABLE
DROP TABLE IF EXISTS `creature_respawn`;        -- DEPRICATED TABLE
DROP TABLE IF EXISTS `reserved_name`;           -- DEPRICATED TABLE
DROP TABLE IF EXISTS `custom_texts`;            -- DEPRICATED TABLE
-- -------------------------------------------------------------------------
DROP TABLE IF EXISTS `cleanup_data`;            -- DEPRICATED TABLE
CREATE TABLE `cleanup_data` (                   -- CLEANER TEMPORY TABLE
  `entry1` int(20) unsigned DEFAULT NULL COMMENT 'ID Stream for cleaning N1',
  `entry2` int(20) unsigned DEFAULT NULL COMMENT 'ID Stream for cleaning N2',
  PRIMARY KEY  (`entry1`,`entry2`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='CLEANER TEMPORY TABLE';
-- -------------------------------------------------------------------------
-- CREATURES
 DELETE FROM `creature` WHERE `id` NOT IN (SELECT `entry` FROM `creature_template`);                            -- Dinamic // "creature" table
 DELETE FROM `creature_template_addon` WHERE `entry` NOT IN (SELECT `entry` FROM `creature_template`);          -- Dinamic // "creature_template_addon" table
 DELETE FROM `creature_formations` WHERE `leaderGUID` NOT IN (SELECT `guid` FROM `creature`)
OR `memberGUID` NOT IN (SELECT `guid` FROM `creature`);                                                         -- Dinamic // "creature_formations" table
 DELETE FROM `creature_onkill_reputation` WHERE `creature_id` NOT IN (SELECT `entry` FROM `creature_template`); -- Dinamic // "creature_onkill_reputation" table
 DELETE FROM `linked_respawn` WHERE `linkedguid` NOT IN (SELECT `guid` FROM `creature`);                        -- Dinamic // "linked_respawn" table
 DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);                              -- Dinamic // "creature_addon" table
 DELETE FROM `battlemaster_entry` WHERE `entry` NOT IN (SELECT `entry` FROM `creature_template`);               -- Dinamic // "battlemaster_entry" table
-- -------------------------------------------------------------------------
-- GAMEOBJECTS
 DELETE FROM `gameobject` WHERE `id` NOT IN (SELECT `entry` FROM `gameobject_template`);                        -- Dinamic // "gameobject" table
 DELETE FROM `gameobject_scripts` WHERE `id` NOT IN (SELECT `guid` FROM `gameobject`);                          -- Dinamic // "gameobject_scripts" table
 DELETE FROM `gameobject_involvedrelation` WHERE `id` NOT IN (SELECT `entry` FROM `gameobject_template`);       -- Dinamic // "gameobject_involvedrelation" table
 DELETE FROM `gameobject_loot_template` WHERE `entry` NOT IN (SELECT `entry` FROM `gameobject_template`);       -- Dinamic // "gameobject_loot_template" table
 DELETE FROM `gameobject_questrelation` WHERE `id` NOT IN (SELECT `entry` FROM `gameobject_template`);          -- Dinamic // "gameobject_questrelation" table
-- -------------------------------------------------------------------------
-- GOSSIPS
TRUNCATE `cleanup_data`;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `gossip_menu_id` FROM `creature_template`;
 DELETE FROM `gossip_menu` WHERE `entry` NOT IN (SELECT `entry1` FROM `cleanup_data`);                          -- Dinamic // "gossip_menu" table
TRUNCATE `cleanup_data`;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `entry` FROM `gossip_menu`;
 DELETE FROM `gossip_menu_option` WHERE `menu_id` NOT IN (SELECT `entry1` FROM `cleanup_data`);                 -- Dinamic // "gossip_menu_option" table
TRUNCATE `cleanup_data`;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action_script_id` FROM `gossip_menu_option`;
INSERT IGNORE INTO `cleanup_data`(`entry2`) SELECT `dataint` FROM `gossip_scripts` WHERE `id` NOT IN (SELECT `entry1` FROM `cleanup_data`);
 DELETE FROM `db_script_string` WHERE `entry` IN (SELECT `entry2` FROM `cleanup_data`);                         -- Dinamic // "db_script_string" table
TRUNCATE `cleanup_data`;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action_script_id` FROM `gossip_menu_option`; 
 DELETE FROM `gossip_scripts` WHERE `id` NOT IN (SELECT `entry1` FROM `cleanup_data`);                          -- Dinamic // "gossip_scripts" table
-- -------------------------------------------------------------------------
-- CONDITIONS
TRUNCATE `cleanup_data`;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `entry` FROM `gossip_menu`;
 DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14, 15)
AND `SourceGroup` NOT IN (SELECT `entry1` FROM `cleanup_data`);                                                 -- Dinamic // "conditions" table
/*
-- -------------------------------------------------------------------------
-- WAYPOINTS
TRUNCATE `cleanup_data`;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `path_id` FROM `creature_addon`;
 DELETE FROM `waypoint_data` WHERE `id` NOT IN (SELECT `entry1` FROM `cleanup_data`);                           -- Dinamic // "waypoint_data" table
 DELETE FROM `waypoints` WHERE `entry` NOT IN (SELECT `entry1` FROM `cleanup_data`);                            -- Dinamic // "waypoints" table
TRUNCATE `cleanup_data`;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action` FROM `waypoint_data`; 
 DELETE FROM `script_waypoint` WHERE `entry` NOT IN (SELECT `entry1` FROM `cleanup_data`);                      -- Dinamic // "script_waypoint" table
 SELECT * FROM waypoints WHERE entry IN (SELECT `entry1` FROM `cleanup_data`);
*/
-- -------------------------------------------------------------------------
-- EVENT AI
/*
 DELETE FROM `creature_ai_scripts` WHERE `creature_id` NOT IN (
SELECT `entry` FROM `creature_template` WHERE `AIName` = 'EventAI');                                            -- Dinamic // "creature_ai_scripts" table
TRUNCATE `cleanup_data`;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action1_param3` FROM `creature_ai_scripts` WHERE
 `action1_type` = 32 OR `action2_type` = 32 OR `action3_type` = 32;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action2_param3` FROM `creature_ai_scripts` WHERE
 `action1_type` = 32 OR `action2_type` = 32 OR `action3_type` = 32;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action3_param3` FROM `creature_ai_scripts` WHERE
 `action1_type` = 32 OR `action2_type` = 32 OR `action3_type` = 32;
 DELETE FROM `creature_ai_summons` WHERE `id` NOT IN (SELECT `entry1` FROM `cleanup_data`);                     -- Dinamic // "creature_ai_summons" table
TRUNCATE `cleanup_data`;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action1_param1` FROM `creature_ai_scripts` WHERE
 `action1_type` = 1 OR `action2_type` = 1 OR `action3_type` = 1;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action1_param2` FROM `creature_ai_scripts` WHERE
 `action1_type` = 1 OR `action2_type` = 1 OR `action3_type` = 1;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action1_param3` FROM `creature_ai_scripts` WHERE
 `action1_type` = 1 OR `action2_type` = 1 OR `action3_type` = 1;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action2_param1` FROM `creature_ai_scripts` WHERE
 `action1_type` = 1 OR `action2_type` = 1 OR `action3_type` = 1;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action2_param2` FROM `creature_ai_scripts` WHERE
 `action1_type` = 1 OR `action2_type` = 1 OR `action3_type` = 1;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action2_param3` FROM `creature_ai_scripts` WHERE
 `action1_type` = 1 OR `action2_type` = 1 OR `action3_type` = 1;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action3_param1` FROM `creature_ai_scripts` WHERE
 `action1_type` = 1 OR `action2_type` = 1 OR `action3_type` = 1;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action3_param2` FROM `creature_ai_scripts` WHERE
 `action1_type` = 1 OR `action2_type` = 1 OR `action3_type` = 1;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `action3_param3` FROM `creature_ai_scripts` WHERE
 `action1_type` = 1 OR `action2_type` = 1 OR `action3_type` = 1;
DELETE FROM `creature_ai_texts` WHERE `entry` NOT IN (SELECT `entry1` FROM `cleanup_data`);                     -- Dinamic // "creature_ai_texts" table
*/
-- -------------------------------------------------------------------------
-- SMART AI
TRUNCATE `cleanup_data`;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `entry` FROM `creature_template` WHERE `AIName` = "SmartAI";
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `entry` FROM `gameobject_template` WHERE `AIName` = "SmartGameObjectAI";
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `guid` FROM `creature` WHERE `id` IN (SELECT `entry` FROM `creature_template` WHERE `AIName` = "SmartAI");
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `guid` FROM `gameobject` WHERE `id` IN (SELECT `entry` FROM `gameobject_template` WHERE `AIName` = "SmartGameObjectAI");
DELETE FROM `smart_scripts` WHERE `entryorguid` NOT IN (SELECT `entry1` FROM `cleanup_data`);

DROP TABLE IF EXISTS `cleanup_data`;            -- DEPRICATED TABLE