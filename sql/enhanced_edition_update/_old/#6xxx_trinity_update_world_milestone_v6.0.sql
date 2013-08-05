-- If someone have problem with Char updates:
-- Query: SELECT guid FROM character_inventory AS a WHERE (SELECT COUNT(*) FROM character_inventory AS b WHERE a.guid = b.guid AND a.bag = b.bag AND a.slot = b.slot) > 1;
-- Trinity SQLs, unil they are not included into Next DB Release.

-- Zidormi SAI
SET @ENTRY  := 31848;
SET @GOSSIP := 10131;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,0,0,0,85,46343,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Zidormi - On gossip option select - Player Cast Teleport to Caverns of Time on self');
-- Cleanup gossip
UPDATE `gossip_menu_option` SET `action_script_id`=0 WHERE `menu_id`=@GOSSIP;
DELETE FROM `gossip_scripts` WHERE `id`=@GOSSIP;

-- Darrok SAI
SET @ENTRY  := 27425;
SET @GOSSIP := 21250;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,@GOSSIP,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Darrok - On gossip option select - Close gossip'),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,85,48960,3,0,0,0,0,1,0,0,0,0,0,0,0, 'Darrok - On gossip option select - Cast Horde Log Ride 01 Begin on player'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,85,48961,3,0,0,0,0,1,0,0,0,0,0,0,0, 'Darrok - On gossip option select - Cast Log Ride Horde 00 on player');
-- Cleanup gossip
UPDATE `gossip_menu_option` SET `action_script_id`=0 WHERE `menu_id`=@GOSSIP;
DELETE FROM `gossip_scripts` WHERE `id`=2125100;

-- Stabled Argent Hippogryph SAI
SET @ENTRY  := 35117;
SET @GOSSIP := 10616;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,0,0,0,11,66777,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Stabled Argent Hippogryph - On gossip option select - Cast Mount Up on player');
-- Cleanup gossip
UPDATE `gossip_menu_option` SET `action_script_id`=0 WHERE `menu_id`=@GOSSIP;
DELETE FROM `gossip_scripts` WHERE `id`=1061600;

-- Arch Druid Lilliandra SAI
SET @ENTRY  := 30630;
SET @GOSSIP := 9991;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,0,0,0,85,57536,0,0,0,0,0,19,30630,0,0,0,0,0,0, 'Arch Druid Lilliandra - On gossip option select - Player Cast Forcecast Portal: Moonglade on Arch Druid Lilliandra');
-- Cleanup gossip
UPDATE `gossip_menu_option` SET `action_script_id`=0 WHERE `menu_id`=@GOSSIP;
DELETE FROM `gossip_scripts` WHERE `id`=999200;

-- Librarian Tiare SAI
SET @ENTRY  := 30051;
SET @GOSSIP := 9626;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,0,0,0,11,50135,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Librarian Tiare - On gossip option select - Cast Teleport - Coldarra, Transitus Shield to Amber Ledge on player');
-- Cleanup gossip
UPDATE `gossip_menu_option` SET `action_script_id`=0 WHERE `menu_id`=@GOSSIP;
DELETE FROM `gossip_scripts` WHERE `id`=962600;

-- Surristrasz SAI
SET @ENTRY  := 24795;
SET @GOSSIP := 9472;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,@GOSSIP,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Surristrasz - On gossip option select - Close gossip'),
(@ENTRY,0,1,0,61,0,100,0,@GOSSIP,0,0,0,85,46064,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Surristrasz - On gossip option select - Player Cast Amber Ledge to Coldarra on self');
-- Cleanup gossip
UPDATE `gossip_menu_option` SET `action_script_id`=0 WHERE `menu_id`=@GOSSIP;
DELETE FROM `gossip_scripts` WHERE `id`=947200;

-- Jero'me SAI
SET @ENTRY  := 19882;
SET @GOSSIP := 8060;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Jero''me - On gossip option select - Close gossip');
-- Cleanup gossip
UPDATE `gossip_menu_option` SET `action_script_id`=0 WHERE `menu_id`=@GOSSIP;
DELETE FROM `gossip_scripts` WHERE `id`=806000;

-- Greer Orehammer SAI
SET @ENTRY  := 23859;
SET @GOSSIP := 9546;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,80,2385900,0,2,0,0,0,1,0,0,0,0,0,0,0, 'Greer Orehammer - On aggro - Run Script'),
(@ENTRY,0,1,2,62,0,100,0,@GOSSIP,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Greer Orehammer - On gossip option select - Close gossip'),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,56,33634,10,0,0,0,0,7,0,0,0,0,0,0,0, 'Greer Orehammer - On gossip option select - give player 10 Orehammer''s Precision Bombs'),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,52,745,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Greer Orehammer - On gossip option select - Plague This Taxi Start');
-- Cleanup gossip
UPDATE `gossip_menu_option` SET `action_script_id`=0 WHERE `menu_id`=@GOSSIP;
DELETE FROM `gossip_scripts` WHERE `id`=954601;


DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (7608,7609);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (7608,7609);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7608,12,0,0, ''),
(7608,13,8,0, ''),
(7609,12,1,0, ''),
(7609,13,20,0, '');

/*
SET @GUID := 152021 ; -- Set GUID

SET @BG_Zar := 32832;
SET @Moonstrike := 32834;
SET @ZomBocom := 31865;
SET @Xazi := 31864;
SET @Nargle := 31863;
SET @Krezzik := 32405;
SET @Argex := 32407;
SET @Thunderhorn := 32383;
SET @Doris := 32385;
SET @Tristia := 32380;
SET @Dirgehammer := 32381;

DELETE FROM `creature` WHERE `id` IN (@BG_Zar,@Moonstrike,@ZomBocom,@Xazi,@Nargle,@Krezzik,@Argex,@Thunderhorn,@Doris,@Tristia,@Dirgehammer);
INSERT INTO creature
(`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`)
VALUES
(@GUID,@Nargle,571,1,1,26463,0,5753.74,585.413,615.052,0,180,0,0,1,0,0,0,0,0,0), -- Nargle Lashcord
(@GUID+1,@Argex,1,1,1,27953,0,-7123.33,-3766.68,9.40339,0,180,0,0,1,0,0,0,0,0,0), -- Argex Irongut
(@GUID+2,@Krezzik,530,1,1,0,0,3066.45,3638.87,145.218,0.875901,120,0,0,1,0,0,0,0,0,0), -- Krezzik the Striker
(@GUID+3,@Xazi,571,1,1,26464,0,5751.54,584.66,615.052,0,180,0,0,1,0,0,0,0,0,0), -- Xazi Smolderpipe
(@GUID+4,@ZomBocom,571,1,1,26465,0,5751.73,582.943,615.052,0,180,0,0,1,0,0,0,0,0,0), -- Zom Bocom
(@GUID+5,@Doris,1,1,1,0,0,1673.07,-4201.89,56.3826,3.62927,25,0,0,55888,0,0,0,0,0,0), -- Doris
(@GUID+6,@BG_Zar,1,1,1,0,0,1670.17,-4199.26,56.3827,3.98664,25,0,0,11828,0,0,0,0,0,0), -- BG_Zar
(@GUID+7,@Thunderhorn,1,1,1,0,0,1669.09,-4196.78,56.3827,4.10416,25,0,0,11828,0,0,0,0,0,0), -- Thunderhorn
(@GUID+8,@Moonstrike,0,1,1,28301,0,-8775.85,423.96,105.233,5.73298,180,0,0,11828,0,0,0,0,0,0), -- Moonstrike
(@GUID+9,@Tristia,0,1,1,21512,0,-8773.78,425.804,105.233,4.80621,180,0,0,11828,0,0,0,0,0,0), -- Tristia
(@GUID+10,@Dirgehammer,0,1,1,12917,0,-8781.18,419.883,105.233,6.18459,180,0,0,7048,0,0,0,0,0,0); -- Dirgehammer

DELETE FROM `game_event_creature` WHERE `eventEntry`=57;
INSERT INTO `game_event_creature` (`guid`,`eventEntry`) VALUES
(@GUID,57), -- Nargle Lashcord (31863)
(@GUID+1,57), -- Argex Irongut (32407)
(@GUID+2,57), -- Krezzik the Striker (32405)
(@GUID+3,57), -- Xazi Smolderpipe (31864)
(@GUID+4,57), -- Zom Bocom (31865)
(@GUID+5,57), -- Doris Volanthius (32385)
(@GUID+6,57), -- Blood Guard Zar'shi (32832)
(@GUID+7,57), -- Sergeant Thunderhorn (32383)
(@GUID+8,57), -- Knight Lieutenant Moonstrike (32834)
(@GUID+9,57), -- Lieutenant Tristia (32380)
(@GUID+10,57); -- Captain Dirgehammer (32381)
-- ----------------------
-- -- Vendor Templates --
-- ---------------------- 
SET @31600HP := 2560;
SET @38000HP := 2561;
SET @1660RT_39400HP := 2564;
SET @1750RT_47400HP := 2565;
SET @1600RT_47400HP := 2566;
SET @1690RT_47400HP := 2567;
SET @49600HP := 2559;
SET @50000HP := 2570;
SET @60000HP := 2569;
SET @1800RT_62000HP := 2568;
SET @1720RT_62000HP := 2563;
SET @1630RT_62000HP := 2562;
SET @7200HP_200AP := 2443;
SET @9600HP_275AP := 2445;
SET @12000HP_350AP := 2440;
SET @1615RT_7200HP_400AP := 2452;
SET @1775RT_9600HP_550AP := 2459;
SET @1645RT_12000HP_700AP := 2454;
SET @1735RT_12000HP_700AP := 2453;
SET @1675RT_12000HP_700AP := 2451;
SET @1930RT_2250AP := 2469;
SET @1930RT_1200AP := 2468;
SET @1930RT_4500AP := 2460;
SET @1930RT_3150AP := 2466;
SET @1750RT_1350AP := 2463;
SET @2050RT_1750AP := 2470;
SET @1810RT_2250AP := 2465;
SET @1870RT_2250AP := 2462;
SET @1990RT_2250AP := 2464;

-- Vendor Defines:
SET @BG_Zar := 32832; -- (34061/34062/34063) as s6/s7/s8?
SET @Moonstrike := 32834; -- (34082/34083/34084) as s6/s7/s8?
SET @ZomBocom := 31865; -- (or 29541 or 40205)
SET @Xazi := 31864; -- (or 29540 or 40210)
SET @Nargle := 31863; -- (or 29539 or 40211)
SET @Kezzik := 32405; -- (or 32356 or 40207)
SET @Argex := 32407; -- (or 32359 or 40215)
SET @Thunderhorn := 32383; -- (most likely) (34036/34037/34038) as s6/s7/s8?
SET @Doris := 32385; -- (most likely) (34058/34059/34060) as s6/s7/s8?
SET @Tristia := 32380; -- (most likely) (34076,34077,34078) as s6/s7/s8?

DELETE FROM `npc_vendor` WHERE `entry` IN (@BG_Zar,@Moonstrike,@ZomBocom,@Xazi,@Nargle,@Kezzik,@Argex,@Thunderhorn,@Doris,@Tristia);
INSERT INTO `npc_vendor` 
(`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`)
VALUES 
-- Spacer
(@BG_Zar,0,40779,0,0,@60000HP), -- Savage Gladiator Chest DK
(@BG_Zar,0,40799,0,0,@50000HP), -- Savage Gladiator Gloves DK
(@BG_Zar,0,40817,0,0,@60000HP), -- Savage Gladiator Helm DK
(@BG_Zar,0,40837,0,0,@60000HP), -- Savage Gladiator Legs DK
(@BG_Zar,0,40857,0,0,@50000HP), -- Savage Gladiator Shoulders DK
(@BG_Zar,0,41272,0,0,@60000HP), -- Savage Gladiator Chest Druid1
(@BG_Zar,0,41268,0,0,@50000HP), -- Savage Gladiator Gloves Druid1
(@BG_Zar,0,41269,0,0,@60000HP), -- Savage Gladiator Helm Druid1
(@BG_Zar,0,41270,0,0,@60000HP), -- Savage Gladiator Legs Druid1
(@BG_Zar,0,41271,0,0,@50000HP), -- Savage Gladiator Shoulders Druid1
(@BG_Zar,0,41658,0,0,@60000HP), -- Savage Gladiator Chest Druid2
(@BG_Zar,0,41770,0,0,@50000HP), -- Savage Gladiator Gloves Druid2
(@BG_Zar,0,41675,0,0,@60000HP), -- Savage Gladiator Helm Druid2
(@BG_Zar,0,41664,0,0,@60000HP), -- Savage Gladiator Legs Druid2
(@BG_Zar,0,41712,0,0,@50000HP), -- Savage Gladiator Shoulders Druid2
(@BG_Zar,0,41313,0,0,@60000HP), -- Savage Gladiator Chest Druid3
(@BG_Zar,0,41290,0,0,@50000HP), -- Savage Gladiator Gloves Druid3
(@BG_Zar,0,41324,0,0,@60000HP), -- Savage Gladiator Helm Druid3
(@BG_Zar,0,41301,0,0,@60000HP), -- Savage Gladiator Legs Druid3
(@BG_Zar,0,41278,0,0,@50000HP), -- Savage Gladiator Shoulders Druid3
(@BG_Zar,0,41084,0,0,@60000HP), -- Savage Gladiator Chest Hunter
(@BG_Zar,0,41140,0,0,@50000HP), -- Savage Gladiator Gloves Hunter
(@BG_Zar,0,41154,0,0,@60000HP), -- Savage Gladiator Helm Hunter
(@BG_Zar,0,41202,0,0,@60000HP), -- Savage Gladiator Legs Hunter
(@BG_Zar,0,41214,0,0,@50000HP), -- Savage Gladiator Shoulders Hunter
(@BG_Zar,0,41949,0,0,@60000HP), -- Savage Gladiator Chest Mage
(@BG_Zar,0,41968,0,0,@50000HP), -- Savage Gladiator Gloves Mage
(@BG_Zar,0,41943,0,0,@60000HP), -- Savage Gladiator Helm Mage
(@BG_Zar,0,41956,0,0,@60000HP), -- Savage Gladiator Legs Mage
(@BG_Zar,0,41962,0,0,@50000HP), -- Savage Gladiator Shoulders Mage
(@BG_Zar,0,40898,0,0,@60000HP), -- Savage Gladiator Chest Paladin1
(@BG_Zar,0,40918,0,0,@50000HP), -- Savage Gladiator Gloves Paladin1
(@BG_Zar,0,40930,0,0,@60000HP), -- Savage Gladiator Helm Paladin1
(@BG_Zar,0,40936,0,0,@60000HP), -- Savage Gladiator Legs Paladin1
(@BG_Zar,0,40960,0,0,@50000HP), -- Savage Gladiator Shoulders Paladin1
(@BG_Zar,0,40780,0,0,@60000HP), -- Savage Gladiator Chest Paladin2
(@BG_Zar,0,40798,0,0,@50000HP), -- Savage Gladiator Gloves Paladin2
(@BG_Zar,0,40818,0,0,@60000HP), -- Savage Gladiator Helm Paladin2
(@BG_Zar,0,40838,0,0,@60000HP), -- Savage Gladiator Legs Paladin2
(@BG_Zar,0,40858,0,0,@50000HP), -- Savage Gladiator Shoulders Paladin2
(@BG_Zar,0,41851,0,0,@60000HP), -- Savage Gladiator Chest Priest1
(@BG_Zar,0,41847,0,0,@50000HP), -- Savage Gladiator Gloves Priest1
(@BG_Zar,0,41848,0,0,@60000HP), -- Savage Gladiator Helm Priest1
(@BG_Zar,0,41849,0,0,@60000HP), -- Savage Gladiator Legs Priest1
(@BG_Zar,0,41850,0,0,@50000HP), -- Savage Gladiator Shoulders Priest1
(@BG_Zar,0,41918,0,0,@60000HP), -- Savage Gladiator Chest Priest2
(@BG_Zar,0,41937,0,0,@50000HP), -- Savage Gladiator Gloves Priest2
(@BG_Zar,0,41912,0,0,@60000HP), -- Savage Gladiator Helm Priest2
(@BG_Zar,0,41924,0,0,@60000HP), -- Savage Gladiator Legs Priest2
(@BG_Zar,0,41930,0,0,@50000HP), -- Savage Gladiator Shoulders Priest2
(@BG_Zar,0,41647,0,0,@60000HP), -- Savage Gladiator Chest Rogue
(@BG_Zar,0,41643,0,0,@50000HP), -- Savage Gladiator Gloves Rogue
(@BG_Zar,0,41644,0,0,@60000HP), -- Savage Gladiator Helm Rogue
(@BG_Zar,0,41645,0,0,@60000HP), -- Savage Gladiator Legs Rogue
(@BG_Zar,0,41646,0,0,@50000HP), -- Savage Gladiator Shoulders Rogue
(@BG_Zar,0,41078,0,0,@60000HP), -- Savage Gladiator Chest Shaman1
(@BG_Zar,0,41134,0,0,@50000HP), -- Savage Gladiator Gloves Shaman1
(@BG_Zar,0,41148,0,0,@60000HP), -- Savage Gladiator Helm Shaman1
(@BG_Zar,0,41160,0,0,@60000HP), -- Savage Gladiator Legs Shaman1
(@BG_Zar,0,41208,0,0,@50000HP), -- Savage Gladiator Shoulders Shaman1
(@BG_Zar,0,40987,0,0,@60000HP), -- Savage Gladiator Chest Shaman2
(@BG_Zar,0,41004,0,0,@50000HP), -- Savage Gladiator Gloves Shaman2
(@BG_Zar,0,41016,0,0,@60000HP), -- Savage Gladiator Helm Shaman2
(@BG_Zar,0,41030,0,0,@60000HP), -- Savage Gladiator Legs Shaman2
(@BG_Zar,0,41041,0,0,@50000HP), -- Savage Gladiator Shoulders Shaman2
(@BG_Zar,0,40986,0,0,@60000HP), -- Savage Gladiator Chest Shaman3
(@BG_Zar,0,40998,0,0,@50000HP), -- Savage Gladiator Gloves Shaman3
(@BG_Zar,0,41010,0,0,@60000HP), -- Savage Gladiator Helm Shaman3
(@BG_Zar,0,41023,0,0,@60000HP), -- Savage Gladiator Legs Shaman3
(@BG_Zar,0,41024,0,0,@50000HP), -- Savage Gladiator Shoulders Shaman3
(@BG_Zar,0,41996,0,0,@60000HP), -- Savage Gladiator Chest Warlock
(@BG_Zar,0,42014,0,0,@50000HP), -- Savage Gladiator Gloves Warlock
(@BG_Zar,0,41990,0,0,@60000HP), -- Savage Gladiator Helm Warlock
(@BG_Zar,0,42002,0,0,@60000HP), -- Savage Gladiator Legs Warlock
(@BG_Zar,0,42008,0,0,@50000HP), -- Savage Gladiator Shoulders Warlock
(@BG_Zar,0,40778,0,0,@60000HP), -- Savage Gladiator Chest Warrior
(@BG_Zar,0,40797,0,0,@50000HP), -- Savage Gladiator Gloves Warrior
(@BG_Zar,0,40816,0,0,@60000HP), -- Savage Gladiator Helm Warrior
(@BG_Zar,0,40836,0,0,@60000HP), -- Savage Gladiator Legs Warrior
(@BG_Zar,0,40856,0,0,@50000HP), -- Savage Gladiator Shoulders Warrior
-- Spacer
(@Moonstrike,0,40779,0,0,@60000HP), -- Savage Gladiator Chest DK
(@Moonstrike,0,40799,0,0,@50000HP), -- Savage Gladiator Gloves DK
(@Moonstrike,0,40817,0,0,@60000HP), -- Savage Gladiator Helm DK
(@Moonstrike,0,40837,0,0,@60000HP), -- Savage Gladiator Legs DK
(@Moonstrike,0,40857,0,0,@50000HP), -- Savage Gladiator Shoulders DK
(@Moonstrike,0,41272,0,0,@60000HP), -- Savage Gladiator Chest Druid1
(@Moonstrike,0,41268,0,0,@50000HP), -- Savage Gladiator Gloves Druid1
(@Moonstrike,0,41269,0,0,@60000HP), -- Savage Gladiator Helm Druid1
(@Moonstrike,0,41270,0,0,@60000HP), -- Savage Gladiator Legs Druid1
(@Moonstrike,0,41271,0,0,@50000HP), -- Savage Gladiator Shoulders Druid1
(@Moonstrike,0,41658,0,0,@60000HP), -- Savage Gladiator Chest Druid2
(@Moonstrike,0,41770,0,0,@50000HP), -- Savage Gladiator Gloves Druid2
(@Moonstrike,0,41675,0,0,@60000HP), -- Savage Gladiator Helm Druid2
(@Moonstrike,0,41664,0,0,@60000HP), -- Savage Gladiator Legs Druid2
(@Moonstrike,0,41712,0,0,@50000HP), -- Savage Gladiator Shoulders Druid2
(@Moonstrike,0,41313,0,0,@60000HP), -- Savage Gladiator Chest Druid3
(@Moonstrike,0,41290,0,0,@50000HP), -- Savage Gladiator Gloves Druid3
(@Moonstrike,0,41324,0,0,@60000HP), -- Savage Gladiator Helm Druid3
(@Moonstrike,0,41301,0,0,@60000HP), -- Savage Gladiator Legs Druid3
(@Moonstrike,0,41278,0,0,@50000HP), -- Savage Gladiator Shoulders Druid3
(@Moonstrike,0,41084,0,0,@60000HP), -- Savage Gladiator Chest Hunter
(@Moonstrike,0,41140,0,0,@50000HP), -- Savage Gladiator Gloves Hunter
(@Moonstrike,0,41154,0,0,@60000HP), -- Savage Gladiator Helm Hunter
(@Moonstrike,0,41202,0,0,@60000HP), -- Savage Gladiator Legs Hunter
(@Moonstrike,0,41214,0,0,@50000HP), -- Savage Gladiator Shoulders Hunter
(@Moonstrike,0,41949,0,0,@60000HP), -- Savage Gladiator Chest Mage
(@Moonstrike,0,41968,0,0,@50000HP), -- Savage Gladiator Gloves Mage
(@Moonstrike,0,41943,0,0,@60000HP), -- Savage Gladiator Helm Mage
(@Moonstrike,0,41956,0,0,@60000HP), -- Savage Gladiator Legs Mage
(@Moonstrike,0,41962,0,0,@50000HP), -- Savage Gladiator Shoulders Mage
(@Moonstrike,0,40898,0,0,@60000HP), -- Savage Gladiator Chest Paladin1
(@Moonstrike,0,40918,0,0,@50000HP), -- Savage Gladiator Gloves Paladin1
(@Moonstrike,0,40930,0,0,@60000HP), -- Savage Gladiator Helm Paladin1
(@Moonstrike,0,40936,0,0,@60000HP), -- Savage Gladiator Legs Paladin1
(@Moonstrike,0,40960,0,0,@50000HP), -- Savage Gladiator Shoulders Paladin1
(@Moonstrike,0,40780,0,0,@60000HP), -- Savage Gladiator Chest Paladin2
(@Moonstrike,0,40798,0,0,@50000HP), -- Savage Gladiator Gloves Paladin2
(@Moonstrike,0,40818,0,0,@60000HP), -- Savage Gladiator Helm Paladin2
(@Moonstrike,0,40838,0,0,@60000HP), -- Savage Gladiator Legs Paladin2
(@Moonstrike,0,40858,0,0,@50000HP), -- Savage Gladiator Shoulders Paladin2
(@Moonstrike,0,41851,0,0,@60000HP), -- Savage Gladiator Chest Priest1
(@Moonstrike,0,41847,0,0,@50000HP), -- Savage Gladiator Gloves Priest1
(@Moonstrike,0,41848,0,0,@60000HP), -- Savage Gladiator Helm Priest1
(@Moonstrike,0,41849,0,0,@60000HP), -- Savage Gladiator Legs Priest1
(@Moonstrike,0,41850,0,0,@50000HP), -- Savage Gladiator Shoulders Priest1
(@Moonstrike,0,41918,0,0,@60000HP), -- Savage Gladiator Chest Priest2
(@Moonstrike,0,41937,0,0,@50000HP), -- Savage Gladiator Gloves Priest2
(@Moonstrike,0,41912,0,0,@60000HP), -- Savage Gladiator Helm Priest2
(@Moonstrike,0,41924,0,0,@60000HP), -- Savage Gladiator Legs Priest2
(@Moonstrike,0,41930,0,0,@50000HP), -- Savage Gladiator Shoulders Priest2
(@Moonstrike,0,41647,0,0,@60000HP), -- Savage Gladiator Chest Rogue
(@Moonstrike,0,41643,0,0,@50000HP), -- Savage Gladiator Gloves Rogue
(@Moonstrike,0,41644,0,0,@60000HP), -- Savage Gladiator Helm Rogue
(@Moonstrike,0,41645,0,0,@60000HP), -- Savage Gladiator Legs Rogue
(@Moonstrike,0,41646,0,0,@50000HP), -- Savage Gladiator Shoulders Rogue
(@Moonstrike,0,41078,0,0,@60000HP), -- Savage Gladiator Chest Shaman1
(@Moonstrike,0,41134,0,0,@50000HP), -- Savage Gladiator Gloves Shaman1
(@Moonstrike,0,41148,0,0,@60000HP), -- Savage Gladiator Helm Shaman1
(@Moonstrike,0,41160,0,0,@60000HP), -- Savage Gladiator Legs Shaman1
(@Moonstrike,0,41208,0,0,@50000HP), -- Savage Gladiator Shoulders Shaman1
(@Moonstrike,0,40987,0,0,@60000HP), -- Savage Gladiator Chest Shaman2
(@Moonstrike,0,41004,0,0,@50000HP), -- Savage Gladiator Gloves Shaman2
(@Moonstrike,0,41016,0,0,@60000HP), -- Savage Gladiator Helm Shaman2
(@Moonstrike,0,41030,0,0,@60000HP), -- Savage Gladiator Legs Shaman2
(@Moonstrike,0,41041,0,0,@50000HP), -- Savage Gladiator Shoulders Shaman2
(@Moonstrike,0,40986,0,0,@60000HP), -- Savage Gladiator Chest Shaman3
(@Moonstrike,0,40998,0,0,@50000HP), -- Savage Gladiator Gloves Shaman3
(@Moonstrike,0,41010,0,0,@60000HP), -- Savage Gladiator Helm Shaman3
(@Moonstrike,0,41023,0,0,@60000HP), -- Savage Gladiator Legs Shaman3
(@Moonstrike,0,41024,0,0,@50000HP), -- Savage Gladiator Shoulders Shaman3
(@Moonstrike,0,41996,0,0,@60000HP), -- Savage Gladiator Chest Warlock
(@Moonstrike,0,42014,0,0,@50000HP), -- Savage Gladiator Gloves Warlock
(@Moonstrike,0,41990,0,0,@60000HP), -- Savage Gladiator Helm Warlock
(@Moonstrike,0,42002,0,0,@60000HP), -- Savage Gladiator Legs Warlock
(@Moonstrike,0,42008,0,0,@50000HP), -- Savage Gladiator Shoulders Warlock
(@Moonstrike,0,40778,0,0,@60000HP), -- Savage Gladiator Chest Warrior
(@Moonstrike,0,40797,0,0,@50000HP), -- Savage Gladiator Gloves Warrior
(@Moonstrike,0,40816,0,0,@60000HP), -- Savage Gladiator Helm Warrior
(@Moonstrike,0,40836,0,0,@60000HP), -- Savage Gladiator Legs Warrior
(@Moonstrike,0,40856,0,0,@50000HP), -- Savage Gladiator Shoulders Warrior
-- Double Spacer
-- Double Spacer
(@ZomBocom,0,40779,0,0,@12000HP_350AP), -- Savage Gladiator Chest DK
(@ZomBocom,0,40799,0,0,@7200HP_200AP), -- Savage Gladiator Gloves DK
(@ZomBocom,0,40817,0,0,@12000HP_350AP), -- Savage Gladiator Helm DK
(@ZomBocom,0,40837,0,0,@12000HP_350AP), -- Savage Gladiator Legs DK
(@ZomBocom,0,40857,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders DK
(@ZomBocom,0,41272,0,0,@12000HP_350AP), -- Savage Gladiator Chest Druid1
(@ZomBocom,0,41268,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Druid1
(@ZomBocom,0,41269,0,0,@12000HP_350AP), -- Savage Gladiator Helm Druid1
(@ZomBocom,0,41270,0,0,@12000HP_350AP), -- Savage Gladiator Legs Druid1
(@ZomBocom,0,41271,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Druid1
(@ZomBocom,0,41658,0,0,@12000HP_350AP), -- Savage Gladiator Chest Druid2
(@ZomBocom,0,41770,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Druid2
(@ZomBocom,0,41675,0,0,@12000HP_350AP), -- Savage Gladiator Helm Druid2
(@ZomBocom,0,41664,0,0,@12000HP_350AP), -- Savage Gladiator Legs Druid2
(@ZomBocom,0,41712,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Druid2
(@ZomBocom,0,41313,0,0,@12000HP_350AP), -- Savage Gladiator Chest Druid3
(@ZomBocom,0,41290,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Druid3
(@ZomBocom,0,41324,0,0,@12000HP_350AP), -- Savage Gladiator Helm Druid3
(@ZomBocom,0,41301,0,0,@12000HP_350AP), -- Savage Gladiator Legs Druid3
(@ZomBocom,0,41278,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Druid3
(@ZomBocom,0,41084,0,0,@12000HP_350AP), -- Savage Gladiator Chest Hunter
(@ZomBocom,0,41140,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Hunter
(@ZomBocom,0,41154,0,0,@12000HP_350AP), -- Savage Gladiator Helm Hunter
(@ZomBocom,0,41202,0,0,@12000HP_350AP), -- Savage Gladiator Legs Hunter
(@ZomBocom,0,41214,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Hunter
(@ZomBocom,0,41949,0,0,@12000HP_350AP), -- Savage Gladiator Chest Mage
(@ZomBocom,0,41968,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Mage
(@ZomBocom,0,41943,0,0,@12000HP_350AP), -- Savage Gladiator Helm Mage
(@ZomBocom,0,41956,0,0,@12000HP_350AP), -- Savage Gladiator Legs Mage
(@ZomBocom,0,41962,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Mage
(@ZomBocom,0,40898,0,0,@12000HP_350AP), -- Savage Gladiator Chest Paladin1
(@ZomBocom,0,40918,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Paladin1
(@ZomBocom,0,40930,0,0,@12000HP_350AP), -- Savage Gladiator Helm Paladin1
(@ZomBocom,0,40936,0,0,@12000HP_350AP), -- Savage Gladiator Legs Paladin1
(@ZomBocom,0,40960,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Paladin1
(@ZomBocom,0,40780,0,0,@12000HP_350AP), -- Savage Gladiator Chest Paladin2
(@ZomBocom,0,40798,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Paladin2
(@ZomBocom,0,40818,0,0,@12000HP_350AP), -- Savage Gladiator Helm Paladin2
(@ZomBocom,0,40838,0,0,@12000HP_350AP), -- Savage Gladiator Legs Paladin2
(@ZomBocom,0,40858,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Paladin2
(@ZomBocom,0,41851,0,0,@12000HP_350AP), -- Savage Gladiator Chest Priest1
(@ZomBocom,0,41847,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Priest1
(@ZomBocom,0,41848,0,0,@12000HP_350AP), -- Savage Gladiator Helm Priest1
(@ZomBocom,0,41849,0,0,@12000HP_350AP), -- Savage Gladiator Legs Priest1
(@ZomBocom,0,41850,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Priest1
(@ZomBocom,0,41918,0,0,@12000HP_350AP), -- Savage Gladiator Chest Priest2
(@ZomBocom,0,41937,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Priest2
(@ZomBocom,0,41912,0,0,@12000HP_350AP), -- Savage Gladiator Helm Priest2
(@ZomBocom,0,41924,0,0,@12000HP_350AP), -- Savage Gladiator Legs Priest2
(@ZomBocom,0,41930,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Priest2
(@ZomBocom,0,41647,0,0,@12000HP_350AP), -- Savage Gladiator Chest Rogue
(@ZomBocom,0,41643,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Rogue
(@ZomBocom,0,41644,0,0,@12000HP_350AP), -- Savage Gladiator Helm Rogue
(@ZomBocom,0,41645,0,0,@12000HP_350AP), -- Savage Gladiator Legs Rogue
(@ZomBocom,0,41646,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Rogue
(@ZomBocom,0,41078,0,0,@12000HP_350AP), -- Savage Gladiator Chest Shaman1
(@ZomBocom,0,41134,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Shaman1
(@ZomBocom,0,41148,0,0,@12000HP_350AP), -- Savage Gladiator Helm Shaman1
(@ZomBocom,0,41160,0,0,@12000HP_350AP), -- Savage Gladiator Legs Shaman1
(@ZomBocom,0,41208,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Shaman1
(@ZomBocom,0,40987,0,0,@12000HP_350AP), -- Savage Gladiator Chest Shaman2
(@ZomBocom,0,41004,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Shaman2
(@ZomBocom,0,41016,0,0,@12000HP_350AP), -- Savage Gladiator Helm Shaman2
(@ZomBocom,0,41030,0,0,@12000HP_350AP), -- Savage Gladiator Legs Shaman2
(@ZomBocom,0,41041,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Shaman2
(@ZomBocom,0,40986,0,0,@12000HP_350AP), -- Savage Gladiator Chest Shaman3
(@ZomBocom,0,40998,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Shaman3
(@ZomBocom,0,41010,0,0,@12000HP_350AP), -- Savage Gladiator Helm Shaman3
(@ZomBocom,0,41023,0,0,@12000HP_350AP), -- Savage Gladiator Legs Shaman3
(@ZomBocom,0,41024,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Shaman3
(@ZomBocom,0,41996,0,0,@12000HP_350AP), -- Savage Gladiator Chest Warlock
(@ZomBocom,0,42014,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Warlock
(@ZomBocom,0,41990,0,0,@12000HP_350AP), -- Savage Gladiator Helm Warlock
(@ZomBocom,0,42002,0,0,@12000HP_350AP), -- Savage Gladiator Legs Warlock
(@ZomBocom,0,42008,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Warlock
(@ZomBocom,0,40778,0,0,@12000HP_350AP), -- Savage Gladiator Chest Warrior
(@ZomBocom,0,40797,0,0,@7200HP_200AP), -- Savage Gladiator Gloves Warrior
(@ZomBocom,0,40816,0,0,@12000HP_350AP), -- Savage Gladiator Helm Warrior
(@ZomBocom,0,40836,0,0,@12000HP_350AP), -- Savage Gladiator Legs Warrior
(@ZomBocom,0,40856,0,0,@9600HP_275AP), -- Savage Gladiator Shoulders Warrior
-- NEXT SET SPACER
-- NEXT SET SPACER
-- NEXT SET SPACER
(@Xazi,0,40781,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest DK
(@Xazi,0,40803,0,0,@1615RT_7200HP_400AP),  -- Hateful Gladiator Gloves DK
(@Xazi,0,40820,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm DK
(@Xazi,0,40841,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs DK
(@Xazi,0,40860,0,0,@1775RT_9600HP_550AP),  -- Hateful Gladiator Shoulders DK
(@Xazi,0,41308,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Druid1
(@Xazi,0,41284,0,0,@1615RT_7200HP_400AP),  -- Hateful Gladiator Gloves Druid1
(@Xazi,0,41319,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Druid1
(@Xazi,0,41296,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Druid1
(@Xazi,0,41273,0,0,@1775RT_9600HP_550AP),  -- Hateful Gladiator Shoulders Druid1
(@Xazi,0,41659,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Druid2
(@Xazi,0,41771,0,0,@1615RT_7200HP_400AP),  -- Hateful Gladiator Gloves Druid2
(@Xazi,0,41676,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Druid2
(@Xazi,0,41665,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Druid2
(@Xazi,0,41713,0,0,@1775RT_9600HP_550AP),  -- Hateful Gladiator Shoulders Druid2
(@Xazi,0,41314,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Druid3
(@Xazi,0,41291,0,0,@1615RT_7200HP_400AP),  -- Hateful Gladiator Gloves Druid3
(@Xazi,0,41325,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Druid3
(@Xazi,0,41302,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Druid3
(@Xazi,0,41279,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Druid3
(@Xazi,0,41085,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Hunter
(@Xazi,0,41141,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Hunter
(@Xazi,0,41155,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Hunter
(@Xazi,0,41203,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Hunter
(@Xazi,0,41215,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Hunter
(@Xazi,0,41950,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Mage
(@Xazi,0,41969,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Mage
(@Xazi,0,41944,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Mage
(@Xazi,0,41957,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Mage
(@Xazi,0,41963,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Mage
(@Xazi,0,40904,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Paladin1
(@Xazi,0,40925,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Paladin1
(@Xazi,0,40931,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Paladin1
(@Xazi,0,40937,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Paladin1
(@Xazi,0,40961,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Paladin1
(@Xazi,0,40782,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Paladin2
(@Xazi,0,40802,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Paladin2
(@Xazi,0,40821,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Paladin2
(@Xazi,0,40842,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Paladin2
(@Xazi,0,40861,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Paladin2
(@Xazi,0,41857,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Priest1
(@Xazi,0,41872,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Priest1
(@Xazi,0,41852,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Priest1
(@Xazi,0,41862,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Priest1
(@Xazi,0,41867,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Priest1
(@Xazi,0,41919,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Priest2
(@Xazi,0,41938,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Priest2
(@Xazi,0,41913,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Priest2
(@Xazi,0,41925,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Priest2
(@Xazi,0,41931,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Priest2
(@Xazi,0,41648,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Rogue
(@Xazi,0,41765,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Rogue
(@Xazi,0,41670,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Rogue
(@Xazi,0,41653,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Rogue
(@Xazi,0,41681,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Rogue
(@Xazi,0,41079,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Shaman1
(@Xazi,0,41135,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Shaman1
(@Xazi,0,41149,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Shaman1
(@Xazi,0,41162,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Shaman1
(@Xazi,0,41209,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Shaman1
(@Xazi,0,40989,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Shaman2
(@Xazi,0,41005,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Shaman2
(@Xazi,0,41017,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Shaman2
(@Xazi,0,41031,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Shaman2
(@Xazi,0,41042,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Shaman2
(@Xazi,0,40988,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Shaman3
(@Xazi,0,40999,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Shaman3
(@Xazi,0,41011,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Shaman3
(@Xazi,0,41025,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Shaman3
(@Xazi,0,41036,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Shaman3
(@Xazi,0,42001,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Warlock
(@Xazi,0,42015,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Warlock
(@Xazi,0,41991,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Warlock
(@Xazi,0,42003,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Warlock
(@Xazi,0,42009,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Warlock
(@Xazi,0,40783,0,0,@1675RT_12000HP_700AP), -- Hateful Gladiator Chest Warrior
(@Xazi,0,40801,0,0,@1615RT_7200HP_400AP), -- Hateful Gladiator Gloves Warrior
(@Xazi,0,40819,0,0,@1735RT_12000HP_700AP), -- Hateful Gladiator Helm Warrior
(@Xazi,0,40840,0,0,@1645RT_12000HP_700AP), -- Hateful Gladiator Legs Warrior
(@Xazi,0,40859,0,0,@1775RT_9600HP_550AP), -- Hateful Gladiator Shoulders Warrior
-- NEXT SET SPACER
-- NEXT SET SPACER
-- NEXT SET SPACER
(@Nargle,0,40784,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest DK
(@Nargle,0,40806,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves DK
(@Nargle,0,40824,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm DK
(@Nargle,0,40845,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs DK
(@Nargle,0,40863,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders DK
(@Nargle,0,41309,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid1
(@Nargle,0,41286,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid1
(@Nargle,0,41320,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid1
(@Nargle,0,41297,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid1
(@Nargle,0,41274,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid1
(@Nargle,0,41660,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid2
(@Nargle,0,41772,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid2
(@Nargle,0,41677,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid2
(@Nargle,0,41666,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid2
(@Nargle,0,41714,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid2
(@Nargle,0,41315,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid3
(@Nargle,0,41292,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid3
(@Nargle,0,41326,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid3
(@Nargle,0,41303,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid3
(@Nargle,0,41280,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid3
(@Nargle,0,41086,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Hunter
(@Nargle,0,41142,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Hunter
(@Nargle,0,41156,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Hunter
(@Nargle,0,41204,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Hunter
(@Nargle,0,41216,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Hunter
(@Nargle,0,41951,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Mage
(@Nargle,0,41970,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Mage
(@Nargle,0,41945,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Mage
(@Nargle,0,41958,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Mage
(@Nargle,0,41964,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Mage
(@Nargle,0,40905,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Paladin1
(@Nargle,0,40926,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Paladin1
(@Nargle,0,40932,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Paladin1
(@Nargle,0,40938,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Paladin1
(@Nargle,0,40962,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Paladin1
(@Nargle,0,40785,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Paladin2
(@Nargle,0,40805,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Paladin2
(@Nargle,0,40825,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Paladin2
(@Nargle,0,40846,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Paladin2
(@Nargle,0,40864,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Paladin2
(@Nargle,0,41858,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Priest1
(@Nargle,0,41873,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Priest1
(@Nargle,0,41853,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Priest1
(@Nargle,0,41863,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Priest1
(@Nargle,0,41868,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Priest1
(@Nargle,0,41920,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Priest2
(@Nargle,0,41939,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Priest2
(@Nargle,0,41914,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Priest2
(@Nargle,0,41926,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Priest2
(@Nargle,0,41933,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Priest2
(@Nargle,0,41649,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Rogue
(@Nargle,0,41766,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Rogue
(@Nargle,0,41671,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Rogue
(@Nargle,0,41654,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Rogue
(@Nargle,0,41682,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Rogue
(@Nargle,0,41080,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman1
(@Nargle,0,41136,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman1
(@Nargle,0,41150,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman1
(@Nargle,0,41198,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman1
(@Nargle,0,41210,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman1
(@Nargle,0,40991,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman2
(@Nargle,0,41006,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman2
(@Nargle,0,41018,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman2
(@Nargle,0,41032,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman2
(@Nargle,0,41043,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman2
(@Nargle,0,40990,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman3
(@Nargle,0,41000,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman3
(@Nargle,0,41012,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman3
(@Nargle,0,41026,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman3
(@Nargle,0,41037,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman3
(@Nargle,0,41997,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Warlock
(@Nargle,0,42016,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Warlock
(@Nargle,0,41992,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Warlock
(@Nargle,0,42004,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Warlock
(@Nargle,0,42010,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Warlock
(@Nargle,0,40786,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Warrior
(@Nargle,0,40804,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Warrior
(@Nargle,0,40823,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Warrior
(@Nargle,0,40844,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Warrior
(@Nargle,0,40862,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Warrior
-- Weapons
(@Nargle,0,42490,0,0,@1930RT_4500AP),-- Deadly Gladiator Longbow (bow)
(@Nargle,0,42495,0,0,@1930RT_4500AP),-- Deadly Gladiator Heavy Crossbow (crossbow)
(@Nargle,0,42255,0,0,@1930RT_3150AP),-- Deadly Gladiator Mutilator (dagger) offhand
(@Nargle,0,42242,0,0,@1930RT_3150AP),-- Deadly Gladiator Shanker (dagger) One Hand
(@Nargle,0,42248,0,0,@1930RT_3150AP),-- Deadly Gladiator Shiv (dagger) offhand
(@Nargle,0,42346,0,0,@1930RT_3150AP),-- Deadly Gladiator Spellblade (dagger) Main Hand
(@Nargle,0,42265,0,0,@1930RT_3150AP),-- Deadly Gladiator Left Render (Fist Weapon) offhand
(@Nargle,0,42270,0,0,@1930RT_3150AP),-- Deadly Gladiator Left Ripper (Fist Weapon) offhand
(@Nargle,0,42260,0,0,@1930RT_3150AP),-- Deadly Gladiator Right Ripper (Fist Weapon) main hand
(@Nargle,0,42485,0,0,@1930RT_4500AP),-- Deadly Gladiator Rifle (Gun)
(@Nargle,0,42232,0,0,@1930RT_3150AP),-- Deadly Gladiator Chopper (1haxe) offhand
(@Nargle,0,42208,0,0,@1930RT_3150AP),-- Deadly Gladiator Cleaver (1haxe) mainhand
(@Nargle,0,42227,0,0,@1930RT_3150AP),-- Deadly Gladiator Hacker (1haxe) offhand
(@Nargle,0,42237,0,0,@1930RT_3150AP),-- Deadly Gladiator Waraxe (1haxe) one hand
(@Nargle,0,42280,0,0,@1930RT_3150AP),-- Deadly Gladiator Bonecracker (1hmace) offhand
(@Nargle,0,42352,0,0,@1930RT_3150AP),-- Deadly Gladiator Gavel (1h mace) main hand
(@Nargle,0,42275,0,0,@1930RT_3150AP),-- Deadly Gladiator Pummeler (1h mace) one hand
(@Nargle,0,42290,0,0,@1930RT_3150AP),-- Deadly Gladiator Quickblade (1h sword) off hand
(@Nargle,0,42285,0,0,@1930RT_3150AP),-- Deadly Gladiator Slicer (1h sword) one hand
(@Nargle,0,42327,0,0,@1930RT_4500AP),-- Deadly Gladiator Pike (polearm)
(@Nargle,0,42362,0,0,@1930RT_4500AP),-- Deadly Gladiator Battle Staff (staff)
(@Nargle,0,42384,0,0,@1930RT_4500AP),-- Deadly Gladiator Energy Staff (staff)
(@Nargle,0,44420,0,0,@1930RT_4500AP),-- Deadly Gladiator Focus Staff (staff)
(@Nargle,0,42390,0,0,@1930RT_4500AP),-- Deadly Gladiator Staff (staff)
(@Nargle,0,44419,0,0,@1930RT_4500AP),-- Deadly Gladiator War Staff (staff)
(@Nargle,0,42450,0,0,@1930RT_2250AP),-- Deadly Gladiator War Edge (Thrown)
(@Nargle,0,42317,0,0,@1930RT_4500AP),-- Deadly Gladiator Decapitator (2haxe)
(@Nargle,0,42322,0,0,@1930RT_4500AP),-- Deadly Gladiator Bonegrinder (2hmace)
(@Nargle,0,42332,0,0,@1930RT_4500AP),-- Deadly Gladiator Greatsword (2h Sword)
(@Nargle,0,42513,0,0,@1930RT_2250AP),-- Deadly Gladiator Baton of Light (wand)
(@Nargle,0,42519,0,0,@1930RT_2250AP),-- Deadly Gladiator Piercing Touch (wand)
(@Nargle,0,42502,0,0,@1930RT_2250AP),-- Deadly Gladiator Touch of Defeat (wand)
(@Nargle,0,42564,0,0,@1930RT_2250AP),-- Deadly Gladiator Barrier (shield)
(@Nargle,0,42570,0,0,@1930RT_2250AP),-- Deadly Gladiator Redoubt (shield)
(@Nargle,0,42559,0,0,@1930RT_2250AP),-- Deadly Gladiator Shield Wall (shield)
(@Nargle,0,42588,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Resolve (Relic)
(@Nargle,0,42583,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Steadfastness (Relic)
(@Nargle,0,42578,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Tenacity (Relic)
(@Nargle,0,42852,0,0,@1930RT_1200AP),-- Deadly Gladiator Libram of Fortitude (Relic)
(@Nargle,0,42614,0,0,@1930RT_1200AP),-- Deadly Gladiator Libram of Justice (Relic)
(@Nargle,0,42620,0,0,@1930RT_1200AP),-- Deadly Gladiator Sigil of Strife (Relic)
(@Nargle,0,42607,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of Indomitability (Relic)
(@Nargle,0,42602,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of Survival (Relic)
(@Nargle,0,42597,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of the Third Wind (Relic)
-- Spacer
(@Kezzik,0,40784,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest DK
(@Kezzik,0,40806,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves DK
(@Kezzik,0,40824,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm DK
(@Kezzik,0,40845,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs DK
(@Kezzik,0,40863,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders DK
(@Kezzik,0,41309,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid1
(@Kezzik,0,41286,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid1
(@Kezzik,0,41320,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid1
(@Kezzik,0,41297,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid1
(@Kezzik,0,41274,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid1
(@Kezzik,0,41660,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid2
(@Kezzik,0,41772,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid2
(@Kezzik,0,41677,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid2
(@Kezzik,0,41666,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid2
(@Kezzik,0,41714,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid2
(@Kezzik,0,41315,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid3
(@Kezzik,0,41292,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid3
(@Kezzik,0,41326,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid3
(@Kezzik,0,41303,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid3
(@Kezzik,0,41280,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid3
(@Kezzik,0,41086,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Hunter
(@Kezzik,0,41142,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Hunter
(@Kezzik,0,41156,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Hunter
(@Kezzik,0,41204,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Hunter
(@Kezzik,0,41216,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Hunter
(@Kezzik,0,41951,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Mage
(@Kezzik,0,41970,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Mage
(@Kezzik,0,41945,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Mage
(@Kezzik,0,41958,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Mage
(@Kezzik,0,41964,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Mage
(@Kezzik,0,40905,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Paladin1
(@Kezzik,0,40926,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Paladin1
(@Kezzik,0,40932,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Paladin1
(@Kezzik,0,40938,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Paladin1
(@Kezzik,0,40962,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Paladin1
(@Kezzik,0,40785,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Paladin2
(@Kezzik,0,40805,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Paladin2
(@Kezzik,0,40825,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Paladin2
(@Kezzik,0,40846,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Paladin2
(@Kezzik,0,40864,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Paladin2
(@Kezzik,0,41858,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Priest1
(@Kezzik,0,41873,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Priest1
(@Kezzik,0,41853,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Priest1
(@Kezzik,0,41863,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Priest1
(@Kezzik,0,41868,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Priest1
(@Kezzik,0,41920,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Priest2
(@Kezzik,0,41939,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Priest2
(@Kezzik,0,41914,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Priest2
(@Kezzik,0,41926,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Priest2
(@Kezzik,0,41933,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Priest2
(@Kezzik,0,41649,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Rogue
(@Kezzik,0,41766,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Rogue
(@Kezzik,0,41671,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Rogue
(@Kezzik,0,41654,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Rogue
(@Kezzik,0,41682,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Rogue
(@Kezzik,0,41080,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman1
(@Kezzik,0,41136,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman1
(@Kezzik,0,41150,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman1
(@Kezzik,0,41198,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman1
(@Kezzik,0,41210,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman1
(@Kezzik,0,40991,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman2
(@Kezzik,0,41006,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman2
(@Kezzik,0,41018,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman2
(@Kezzik,0,41032,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman2
(@Kezzik,0,41043,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman2
(@Kezzik,0,40990,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman3
(@Kezzik,0,41000,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman3
(@Kezzik,0,41012,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman3
(@Kezzik,0,41026,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman3
(@Kezzik,0,41037,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman3
(@Kezzik,0,41997,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Warlock
(@Kezzik,0,42016,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Warlock
(@Kezzik,0,41992,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Warlock
(@Kezzik,0,42004,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Warlock
(@Kezzik,0,42010,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Warlock
(@Kezzik,0,40786,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Warrior
(@Kezzik,0,40804,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Warrior
(@Kezzik,0,40823,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Warrior
(@Kezzik,0,40844,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Warrior
(@Kezzik,0,40862,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Warrior
-- Weapons
(@Kezzik,0,42490,0,0,@1930RT_4500AP),-- Deadly Gladiator Longbow (bow)
(@Kezzik,0,42495,0,0,@1930RT_4500AP),-- Deadly Gladiator Heavy Crossbow (crossbow)
(@Kezzik,0,42255,0,0,@1930RT_3150AP),-- Deadly Gladiator Mutilator (dagger) offhand
(@Kezzik,0,42242,0,0,@1930RT_3150AP),-- Deadly Gladiator Shanker (dagger) One Hand
(@Kezzik,0,42248,0,0,@1930RT_3150AP),-- Deadly Gladiator Shiv (dagger) offhand
(@Kezzik,0,42346,0,0,@1930RT_3150AP),-- Deadly Gladiator Spellblade (dagger) Main Hand
(@Kezzik,0,42265,0,0,@1930RT_3150AP),-- Deadly Gladiator Left Render (Fist Weapon) offhand
(@Kezzik,0,42270,0,0,@1930RT_3150AP),-- Deadly Gladiator Left Ripper (Fist Weapon) offhand
(@Kezzik,0,42260,0,0,@1930RT_3150AP),-- Deadly Gladiator Right Ripper (Fist Weapon) main hand
(@Kezzik,0,42485,0,0,@1930RT_4500AP),-- Deadly Gladiator Rifle (Gun)
(@Kezzik,0,42232,0,0,@1930RT_3150AP),-- Deadly Gladiator Chopper (1haxe) offhand
(@Kezzik,0,42208,0,0,@1930RT_3150AP),-- Deadly Gladiator Cleaver (1haxe) mainhand
(@Kezzik,0,42227,0,0,@1930RT_3150AP),-- Deadly Gladiator Hacker (1haxe) offhand
(@Kezzik,0,42237,0,0,@1930RT_3150AP),-- Deadly Gladiator Waraxe (1haxe) one hand
(@Kezzik,0,42280,0,0,@1930RT_3150AP),-- Deadly Gladiator Bonecracker (1hmace) offhand
(@Kezzik,0,42352,0,0,@1930RT_3150AP),-- Deadly Gladiator Gavel (1h mace) main hand
(@Kezzik,0,42275,0,0,@1930RT_3150AP),-- Deadly Gladiator Pummeler (1h mace) one hand
(@Kezzik,0,42290,0,0,@1930RT_3150AP),-- Deadly Gladiator Quickblade (1h sword) off hand
(@Kezzik,0,42285,0,0,@1930RT_3150AP),-- Deadly Gladiator Slicer (1h sword) one hand
(@Kezzik,0,42327,0,0,@1930RT_4500AP),-- Deadly Gladiator Pike (polearm)
(@Kezzik,0,42362,0,0,@1930RT_4500AP),-- Deadly Gladiator Battle Staff (staff)
(@Kezzik,0,42384,0,0,@1930RT_4500AP),-- Deadly Gladiator Energy Staff (staff)
(@Kezzik,0,44420,0,0,@1930RT_4500AP),-- Deadly Gladiator Focus Staff (staff)
(@Kezzik,0,42390,0,0,@1930RT_4500AP),-- Deadly Gladiator Staff (staff)
(@Kezzik,0,44419,0,0,@1930RT_4500AP),-- Deadly Gladiator War Staff (staff)
(@Kezzik,0,42450,0,0,@1930RT_2250AP),-- Deadly Gladiator War Edge (Thrown)
(@Kezzik,0,42317,0,0,@1930RT_4500AP),-- Deadly Gladiator Decapitator (2haxe)
(@Kezzik,0,42322,0,0,@1930RT_4500AP),-- Deadly Gladiator Bonegrinder (2hmace)
(@Kezzik,0,42332,0,0,@1930RT_4500AP),-- Deadly Gladiator Greatsword (2h Sword)
(@Kezzik,0,42513,0,0,@1930RT_2250AP),-- Deadly Gladiator Baton of Light (wand)
(@Kezzik,0,42519,0,0,@1930RT_2250AP),-- Deadly Gladiator Piercing Touch (wand)
(@Kezzik,0,42502,0,0,@1930RT_2250AP),-- Deadly Gladiator Touch of Defeat (wand)
(@Kezzik,0,42564,0,0,@1930RT_2250AP),-- Deadly Gladiator Barrier (shield)
(@Kezzik,0,42570,0,0,@1930RT_2250AP),-- Deadly Gladiator Redoubt (shield)
(@Kezzik,0,42559,0,0,@1930RT_2250AP),-- Deadly Gladiator Shield Wall (shield)
(@Kezzik,0,42588,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Resolve (Relic)
(@Kezzik,0,42583,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Steadfastness (Relic)
(@Kezzik,0,42578,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Tenacity (Relic)
(@Kezzik,0,42852,0,0,@1930RT_1200AP),-- Deadly Gladiator Libram of Fortitude (Relic)
(@Kezzik,0,42614,0,0,@1930RT_1200AP),-- Deadly Gladiator Libram of Justice (Relic)
(@Kezzik,0,42620,0,0,@1930RT_1200AP),-- Deadly Gladiator Sigil of Strife (Relic)
(@Kezzik,0,42607,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of Indomitability (Relic)
(@Kezzik,0,42602,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of Survival (Relic)
(@Kezzik,0,42597,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of the Third Wind (Relic)
-- Spacer
(@Argex,0,40784,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest DK
(@Argex,0,40806,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves DK
(@Argex,0,40824,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm DK
(@Argex,0,40845,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs DK
(@Argex,0,40863,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders DK
(@Argex,0,41309,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid1
(@Argex,0,41286,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid1
(@Argex,0,41320,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid1
(@Argex,0,41297,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid1
(@Argex,0,41274,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid1
(@Argex,0,41660,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid2
(@Argex,0,41772,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid2
(@Argex,0,41677,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid2
(@Argex,0,41666,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid2
(@Argex,0,41714,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid2
(@Argex,0,41315,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Druid3
(@Argex,0,41292,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Druid3
(@Argex,0,41326,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Druid3
(@Argex,0,41303,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Druid3
(@Argex,0,41280,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Druid3
(@Argex,0,41086,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Hunter
(@Argex,0,41142,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Hunter
(@Argex,0,41156,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Hunter
(@Argex,0,41204,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Hunter
(@Argex,0,41216,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Hunter
(@Argex,0,41951,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Mage
(@Argex,0,41970,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Mage
(@Argex,0,41945,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Mage
(@Argex,0,41958,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Mage
(@Argex,0,41964,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Mage
(@Argex,0,40905,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Paladin1
(@Argex,0,40926,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Paladin1
(@Argex,0,40932,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Paladin1
(@Argex,0,40938,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Paladin1
(@Argex,0,40962,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Paladin1
(@Argex,0,40785,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Paladin2
(@Argex,0,40805,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Paladin2
(@Argex,0,40825,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Paladin2
(@Argex,0,40846,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Paladin2
(@Argex,0,40864,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Paladin2
(@Argex,0,41858,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Priest1
(@Argex,0,41873,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Priest1
(@Argex,0,41853,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Priest1
(@Argex,0,41863,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Priest1
(@Argex,0,41868,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Priest1
(@Argex,0,41920,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Priest2
(@Argex,0,41939,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Priest2
(@Argex,0,41914,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Priest2
(@Argex,0,41926,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Priest2
(@Argex,0,41933,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Priest2
(@Argex,0,41649,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Rogue
(@Argex,0,41766,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Rogue
(@Argex,0,41671,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Rogue
(@Argex,0,41654,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Rogue
(@Argex,0,41682,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Rogue
(@Argex,0,41080,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman1
(@Argex,0,41136,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman1
(@Argex,0,41150,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman1
(@Argex,0,41198,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman1
(@Argex,0,41210,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman1
(@Argex,0,40991,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman2
(@Argex,0,41006,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman2
(@Argex,0,41018,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman2
(@Argex,0,41032,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman2
(@Argex,0,41043,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman2
(@Argex,0,40990,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Shaman3
(@Argex,0,41000,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Shaman3
(@Argex,0,41012,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Shaman3
(@Argex,0,41026,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Shaman3
(@Argex,0,41037,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Shaman3
(@Argex,0,41997,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Warlock
(@Argex,0,42016,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Warlock
(@Argex,0,41992,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Warlock
(@Argex,0,42004,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Warlock
(@Argex,0,42010,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Warlock
(@Argex,0,40786,0,0,@1870RT_2250AP), -- Deadly Gladiator Chest Warrior
(@Argex,0,40804,0,0,@1750RT_1350AP), -- Deadly Gladiator Gloves Warrior
(@Argex,0,40823,0,0,@1990RT_2250AP), -- Deadly Gladiator Helm Warrior
(@Argex,0,40844,0,0,@1810RT_2250AP), -- Deadly Gladiator Legs Warrior
(@Argex,0,40862,0,0,@2050RT_1750AP), -- Deadly Gladiator Shoulders Warrior
-- Weapons
(@Argex,0,42490,0,0,@1930RT_4500AP),-- Deadly Gladiator Longbow (bow)
(@Argex,0,42495,0,0,@1930RT_4500AP),-- Deadly Gladiator Heavy Crossbow (crossbow)
(@Argex,0,42255,0,0,@1930RT_3150AP),-- Deadly Gladiator Mutilator (dagger) offhand
(@Argex,0,42242,0,0,@1930RT_3150AP),-- Deadly Gladiator Shanker (dagger) One Hand
(@Argex,0,42248,0,0,@1930RT_3150AP),-- Deadly Gladiator Shiv (dagger) offhand
(@Argex,0,42346,0,0,@1930RT_3150AP),-- Deadly Gladiator Spellblade (dagger) Main Hand
(@Argex,0,42265,0,0,@1930RT_3150AP),-- Deadly Gladiator Left Render (Fist Weapon) offhand
(@Argex,0,42270,0,0,@1930RT_3150AP),-- Deadly Gladiator Left Ripper (Fist Weapon) offhand
(@Argex,0,42260,0,0,@1930RT_3150AP),-- Deadly Gladiator Right Ripper (Fist Weapon) main hand
(@Argex,0,42485,0,0,@1930RT_4500AP),-- Deadly Gladiator Rifle (Gun)
(@Argex,0,42232,0,0,@1930RT_3150AP),-- Deadly Gladiator Chopper (1haxe) offhand
(@Argex,0,42208,0,0,@1930RT_3150AP),-- Deadly Gladiator Cleaver (1haxe) mainhand
(@Argex,0,42227,0,0,@1930RT_3150AP),-- Deadly Gladiator Hacker (1haxe) offhand
(@Argex,0,42237,0,0,@1930RT_3150AP),-- Deadly Gladiator Waraxe (1haxe) one hand
(@Argex,0,42280,0,0,@1930RT_3150AP),-- Deadly Gladiator Bonecracker (1hmace) offhand
(@Argex,0,42352,0,0,@1930RT_3150AP),-- Deadly Gladiator Gavel (1h mace) main hand
(@Argex,0,42275,0,0,@1930RT_3150AP),-- Deadly Gladiator Pummeler (1h mace) one hand
(@Argex,0,42290,0,0,@1930RT_3150AP),-- Deadly Gladiator Quickblade (1h sword) off hand
(@Argex,0,42285,0,0,@1930RT_3150AP),-- Deadly Gladiator Slicer (1h sword) one hand
(@Argex,0,42327,0,0,@1930RT_4500AP),-- Deadly Gladiator Pike (polearm)
(@Argex,0,42362,0,0,@1930RT_4500AP),-- Deadly Gladiator Battle Staff (staff)
(@Argex,0,42384,0,0,@1930RT_4500AP),-- Deadly Gladiator Energy Staff (staff)
(@Argex,0,44420,0,0,@1930RT_4500AP),-- Deadly Gladiator Focus Staff (staff)
(@Argex,0,42390,0,0,@1930RT_4500AP),-- Deadly Gladiator Staff (staff)
(@Argex,0,44419,0,0,@1930RT_4500AP),-- Deadly Gladiator War Staff (staff)
(@Argex,0,42450,0,0,@1930RT_2250AP),-- Deadly Gladiator War Edge (Thrown)
(@Argex,0,42317,0,0,@1930RT_4500AP),-- Deadly Gladiator Decapitator (2haxe)
(@Argex,0,42322,0,0,@1930RT_4500AP),-- Deadly Gladiator Bonegrinder (2hmace)
(@Argex,0,42332,0,0,@1930RT_4500AP),-- Deadly Gladiator Greatsword (2h Sword)
(@Argex,0,42513,0,0,@1930RT_2250AP),-- Deadly Gladiator Baton of Light (wand)
(@Argex,0,42519,0,0,@1930RT_2250AP),-- Deadly Gladiator Piercing Touch (wand)
(@Argex,0,42502,0,0,@1930RT_2250AP),-- Deadly Gladiator Touch of Defeat (wand)
(@Argex,0,42564,0,0,@1930RT_2250AP),-- Deadly Gladiator Barrier (shield)
(@Argex,0,42570,0,0,@1930RT_2250AP),-- Deadly Gladiator Redoubt (shield)
(@Argex,0,42559,0,0,@1930RT_2250AP),-- Deadly Gladiator Shield Wall (shield)
(@Argex,0,42588,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Resolve (Relic)
(@Argex,0,42583,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Steadfastness (Relic)
(@Argex,0,42578,0,0,@1930RT_1200AP),-- Deadly Gladiator Idol of Tenacity (Relic)
(@Argex,0,42852,0,0,@1930RT_1200AP),-- Deadly Gladiator Libram of Fortitude (Relic)
(@Argex,0,42614,0,0,@1930RT_1200AP),-- Deadly Gladiator Libram of Justice (Relic)
(@Argex,0,42620,0,0,@1930RT_1200AP),-- Deadly Gladiator Sigil of Strife (Relic)
(@Argex,0,42607,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of Indomitability (Relic)
(@Argex,0,42602,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of Survival (Relic)
(@Argex,0,42597,0,0,@1930RT_1200AP),-- Deadly Gladiator Totem of the Third Wind (Relic)
-- NEXT SET SPACER
-- NEXT SET SPACER
-- NEXT SET SPACER
(@Thunderhorn,0,42110,0,0,@38000HP), -- Hateful Gladiator Band of Dominance
(@Thunderhorn,0,42112,0,0,@38000HP), -- Hateful Gladiator Band of Triumph
(@Thunderhorn,0,42057,0,0,@38000HP), -- Hateful Gladiator's Cloak of Ascendancy
(@Thunderhorn,0,42059,0,0,@38000HP), -- Hateful Gladiator's Cloak of Deliverance
(@Thunderhorn,0,42055,0,0,@38000HP), -- Hateful Gladiator's Cloak of Dominance
(@Thunderhorn,0,42058,0,0,@38000HP), -- Hateful Gladiator's Cloak of Salvation
(@Thunderhorn,0,42056,0,0,@38000HP), -- Hateful Gladiator's Cloak of Subjugation
(@Thunderhorn,0,42060,0,0,@38000HP), -- Hateful Gladiator's Cloak of Triumph
(@Thunderhorn,0,42061,0,0,@38000HP), -- Hateful Gladiator's Cloak of Victory
(@Thunderhorn,0,42024,0,0,@38000HP), -- Hateful Gladiator's Pendant of Ascendancy
(@Thunderhorn,0,42025,0,0,@38000HP), -- Hateful Gladiator's Pendant of Deliverance
(@Thunderhorn,0,42022,0,0,@38000HP), -- Hateful Gladiator's Pendant of Dominance
(@Thunderhorn,0,42026,0,0,@38000HP), -- Hateful Gladiator's Pendant of Salvation
(@Thunderhorn,0,42023,0,0,@38000HP), -- Hateful Gladiator's Pendant of Subjugation
(@Thunderhorn,0,42020,0,0,@38000HP), -- Hateful Gladiator's Pendant of Triumph
(@Thunderhorn,0,42021,0,0,@38000HP), -- Hateful Gladiator's Pendant of Victory
(@Thunderhorn,0,41638,0,0,@31600HP), -- Hateful Gladiator's Armwraps of Dominance
(@Thunderhorn,0,41332,0,0,@31600HP), -- Hateful Gladiator's Armwraps of Salvation
(@Thunderhorn,0,41830,0,0,@31600HP), -- Hateful Gladiator's Armwraps of Triumph
(@Thunderhorn,0,40972,0,0,@31600HP), -- Hateful Gladiator's Bracers of Salvation
(@Thunderhorn,0,40887,0,0,@31600HP), -- Hateful Gladiator's Bracers of Triumph
(@Thunderhorn,0,41907,0,0,@31600HP), -- Hateful Gladiator's Cuffs of Dominance
(@Thunderhorn,0,41878,0,0,@31600HP), -- Hateful Gladiator's Cuffs of Salvation
(@Thunderhorn,0,41063,0,0,@31600HP), -- Hateful Gladiator's Wristguards of Dominance
(@Thunderhorn,0,41047,0,0,@31600HP), -- Hateful Gladiator's Wristguards of Salvation
(@Thunderhorn,0,41223,0,0,@31600HP), -- Hateful Gladiator's Wristguards of Triumph
(@Thunderhorn,0,41633,0,0,@49600HP), -- Hateful Gladiator's Boots of Dominance
(@Thunderhorn,0,41331,0,0,@49600HP), -- Hateful Gladiator's Boots of Salvation
(@Thunderhorn,0,41828,0,0,@49600HP), -- Hateful Gladiator's Boots of Triumph
(@Thunderhorn,0,40973,0,0,@49600HP), -- Hateful Gladiator's Greaves of Salvation
(@Thunderhorn,0,40878,0,0,@49600HP), -- Hateful Gladiator's Greaves of Triumph
(@Thunderhorn,0,41073,0,0,@49600HP), -- Hateful Gladiator's Sabatons of Dominance
(@Thunderhorn,0,41049,0,0,@49600HP), -- Hateful Gladiator's Sabatons of Salvation
(@Thunderhorn,0,41228,0,0,@49600HP), -- Hateful Gladiator's Sabatons of Triumph
(@Thunderhorn,0,41901,0,0,@49600HP), -- Hateful Gladiator's Slippers of Dominance
(@Thunderhorn,0,41879,0,0,@49600HP), -- Hateful Gladiator's Slippers of Salvation
(@Thunderhorn,0,41628,0,0,@49600HP), -- Hateful Gladiator's Belt of Dominance
(@Thunderhorn,0,41330,0,0,@49600HP), -- Hateful Gladiator's Belt of Salvation
(@Thunderhorn,0,41827,0,0,@49600HP), -- Hateful Gladiator's Belt of Triumph
(@Thunderhorn,0,41896,0,0,@49600HP), -- Hateful Gladiator's Cord of Dominance
(@Thunderhorn,0,41877,0,0,@49600HP), -- Hateful Gladiator's Cord of Salvation
(@Thunderhorn,0,40966,0,0,@49600HP), -- Hateful Gladiator's Girdle of Salvation
(@Thunderhorn,0,40877,0,0,@49600HP), -- Hateful Gladiator's Girdle of Triumph
(@Thunderhorn,0,41068,0,0,@49600HP), -- Hateful Gladiator's Waistguard of Dominance
(@Thunderhorn,0,41050,0,0,@49600HP), -- Hateful Gladiator's Waistguard of Salvation
(@Thunderhorn,0,41233,0,0,@49600HP), -- Hateful Gladiator's Waistguard of Triumph
(@Thunderhorn,0,42122,0,0,@49600HP), -- Medallion of the Horde
-- NEXT SET SPACER
-- NEXT SET SPACER
-- NEXT SET SPACER
(@Doris,0,42129,0,0,@1800RT_62000HP), -- Battlemasters Accuracy   213
(@Doris,0,42130,0,0,@1800RT_62000HP), -- Battlemasters Avidity    213
(@Doris,0,42132,0,0,@1800RT_62000HP), -- Battlemasters Bravery    213
(@Doris,0,42131,0,0,@1800RT_62000HP), -- Battlemasters Conviction 213
(@Doris,0,42128,0,0,@1800RT_62000HP), -- Battlemasters Hostility  213
(@Doris,0,42064,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Ascendancy
(@Doris,0,42066,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Deliverance
(@Doris,0,42062,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Dominance
(@Doris,0,42065,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Salvation
(@Doris,0,42063,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Subjugation
(@Doris,0,42067,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Triumph
(@Doris,0,42068,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Victory
(@Doris,0,41634,0,0,@1720RT_62000HP), -- Deadly Gladiator Boots of Dominance
(@Doris,0,41620,0,0,@1720RT_62000HP), -- Deadly Gladiator Boots of Salvation
(@Doris,0,41835,0,0,@1720RT_62000HP), -- Deadly Gladiator Boots of Triumph
(@Doris,0,40975,0,0,@1720RT_62000HP), -- Deadly Gladiator Greaves of Salvation
(@Doris,0,40880,0,0,@1720RT_62000HP), -- Deadly Gladiator Greaves of Triumph
(@Doris,0,41074,0,0,@1720RT_62000HP), -- Deadly Gladiator Sabatons of Dominance
(@Doris,0,41054,0,0,@1720RT_62000HP), -- Deadly Gladiator Sabatons of Salvation
(@Doris,0,41229,0,0,@1720RT_62000HP), -- Deadly Gladiator Sabatons of Triumph
(@Doris,0,41902,0,0,@1720RT_62000HP), -- Deadly Gladiator Treads of Dominance
(@Doris,0,41884,0,0,@1720RT_62000HP), -- Deadly Gladiator Treads of Salvation
(@Doris,0,42114,0,0,@1690RT_47400HP), -- Deadly Gladiator Band of Ascendancy
(@Doris,0,42115,0,0,@1690RT_47400HP), -- Deadly Gladiator Band of Victory
(@Doris,0,41639,0,0,@1660RT_39400HP), -- Deadly Gladiator Armwraps of Dominance
(@Doris,0,41624,0,0,@1660RT_39400HP), -- Deadly Gladiator Armwraps of Salvation
(@Doris,0,41839,0,0,@1660RT_39400HP), -- Deadly Gladiator Armwraps of Triumph
(@Doris,0,40982,0,0,@1660RT_39400HP), -- Deadly Gladiator Bracers of Salvation
(@Doris,0,40888,0,0,@1660RT_39400HP), -- Deadly Gladiator Bracers of Triumph
(@Doris,0,41908,0,0,@1660RT_39400HP), -- Deadly Gladiator Cuffs of Dominance
(@Doris,0,41892,0,0,@1660RT_39400HP), -- Deadly Gladiator Cuffs of Salvation
(@Doris,0,41064,0,0,@1660RT_39400HP), -- Deadly Gladiator Wristguards of Dominance
(@Doris,0,41059,0,0,@1660RT_39400HP), -- Deadly Gladiator Wristguards of Salvation
(@Doris,0,41224,0,0,@1660RT_39400HP), -- Deadly Gladiator Wristguards of Triumph
(@Doris,0,41629,0,0,@1630RT_62000HP), -- Deadly Gladiator Belt of Dominance
(@Doris,0,41616,0,0,@1630RT_62000HP), -- Deadly Gladiator Belt of Salvation
(@Doris,0,41831,0,0,@1630RT_62000HP), -- Deadly Gladiator Belt of Triumph
(@Doris,0,41897,0,0,@1630RT_62000HP), -- Deadly Gladiator Cord of Dominance
(@Doris,0,41880,0,0,@1630RT_62000HP), -- Deadly Gladiator Cord of Salvation
(@Doris,0,40974,0,0,@1630RT_62000HP), -- Deadly Gladiator Girdle of Salvation
(@Doris,0,40879,0,0,@1630RT_62000HP), -- Deadly Gladiator Girdle of Triumph
(@Doris,0,41069,0,0,@1630RT_62000HP), -- Deadly Gladiator Waistguard of Dominance
(@Doris,0,41048,0,0,@1630RT_62000HP), -- Deadly Gladiator Waistguard of Salvation
(@Doris,0,41234,0,0,@1630RT_62000HP), -- Deadly Gladiator Waistguard of Triumph
(@Doris,0,42030,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Ascendancy
(@Doris,0,42032,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Deliverance
(@Doris,0,42029,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Dominance
(@Doris,0,42033,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Salvation
(@Doris,0,42031,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Subjugation
(@Doris,0,42027,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Triumph
(@Doris,0,42028,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Victory
-- Spacer
(@Tristia,0,42129,0,0,@1800RT_62000HP), -- Battlemasters Accuracy   213
(@Tristia,0,42130,0,0,@1800RT_62000HP), -- Battlemasters Avidity    213
(@Tristia,0,42132,0,0,@1800RT_62000HP), -- Battlemasters Bravery    213
(@Tristia,0,42131,0,0,@1800RT_62000HP), -- Battlemasters Conviction 213
(@Tristia,0,42128,0,0,@1800RT_62000HP), -- Battlemasters Hostility  213
(@Tristia,0,42064,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Ascendancy
(@Tristia,0,42066,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Deliverance
(@Tristia,0,42062,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Dominance
(@Tristia,0,42065,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Salvation
(@Tristia,0,42063,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Subjugation
(@Tristia,0,42067,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Triumph
(@Tristia,0,42068,0,0,@1750RT_47400HP), -- Deadly Gladiator Cloack of Victory
(@Tristia,0,41634,0,0,@1720RT_62000HP), -- Deadly Gladiator Boots of Dominance
(@Tristia,0,41620,0,0,@1720RT_62000HP), -- Deadly Gladiator Boots of Salvation
(@Tristia,0,41835,0,0,@1720RT_62000HP), -- Deadly Gladiator Boots of Triumph
(@Tristia,0,40975,0,0,@1720RT_62000HP), -- Deadly Gladiator Greaves of Salvation
(@Tristia,0,40880,0,0,@1720RT_62000HP), -- Deadly Gladiator Greaves of Triumph
(@Tristia,0,41074,0,0,@1720RT_62000HP), -- Deadly Gladiator Sabatons of Dominance
(@Tristia,0,41054,0,0,@1720RT_62000HP), -- Deadly Gladiator Sabatons of Salvation
(@Tristia,0,41229,0,0,@1720RT_62000HP), -- Deadly Gladiator Sabatons of Triumph
(@Tristia,0,41902,0,0,@1720RT_62000HP), -- Deadly Gladiator Treads of Dominance
(@Tristia,0,41884,0,0,@1720RT_62000HP), -- Deadly Gladiator Treads of Salvation
(@Tristia,0,42114,0,0,@1690RT_47400HP), -- Deadly Gladiator Band of Ascendancy
(@Tristia,0,42115,0,0,@1690RT_47400HP), -- Deadly Gladiator Band of Victory
(@Tristia,0,41639,0,0,@1660RT_39400HP), -- Deadly Gladiator Armwraps of Dominance
(@Tristia,0,41624,0,0,@1660RT_39400HP), -- Deadly Gladiator Armwraps of Salvation
(@Tristia,0,41839,0,0,@1660RT_39400HP), -- Deadly Gladiator Armwraps of Triumph
(@Tristia,0,40982,0,0,@1660RT_39400HP), -- Deadly Gladiator Bracers of Salvation
(@Tristia,0,40888,0,0,@1660RT_39400HP), -- Deadly Gladiator Bracers of Triumph
(@Tristia,0,41908,0,0,@1660RT_39400HP), -- Deadly Gladiator Cuffs of Dominance
(@Tristia,0,41892,0,0,@1660RT_39400HP), -- Deadly Gladiator Cuffs of Salvation
(@Tristia,0,41064,0,0,@1660RT_39400HP), -- Deadly Gladiator Wristguards of Dominance
(@Tristia,0,41059,0,0,@1660RT_39400HP), -- Deadly Gladiator Wristguards of Salvation
(@Tristia,0,41224,0,0,@1660RT_39400HP), -- Deadly Gladiator Wristguards of Triumph
(@Tristia,0,41629,0,0,@1630RT_62000HP), -- Deadly Gladiator Belt of Dominance
(@Tristia,0,41616,0,0,@1630RT_62000HP), -- Deadly Gladiator Belt of Salvation
(@Tristia,0,41831,0,0,@1630RT_62000HP), -- Deadly Gladiator Belt of Triumph
(@Tristia,0,41897,0,0,@1630RT_62000HP), -- Deadly Gladiator Cord of Dominance
(@Tristia,0,41880,0,0,@1630RT_62000HP), -- Deadly Gladiator Cord of Salvation
(@Tristia,0,40974,0,0,@1630RT_62000HP), -- Deadly Gladiator Girdle of Salvation
(@Tristia,0,40879,0,0,@1630RT_62000HP), -- Deadly Gladiator Girdle of Triumph
(@Tristia,0,41069,0,0,@1630RT_62000HP), -- Deadly Gladiator Waistguard of Dominance
(@Tristia,0,41048,0,0,@1630RT_62000HP), -- Deadly Gladiator Waistguard of Salvation
(@Tristia,0,41234,0,0,@1630RT_62000HP), -- Deadly Gladiator Waistguard of Triumph
(@Tristia,0,42030,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Ascendancy
(@Tristia,0,42032,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Deliverance
(@Tristia,0,42029,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Dominance
(@Tristia,0,42033,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Salvation
(@Tristia,0,42031,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Subjugation
(@Tristia,0,42027,0,0,@1600RT_47400HP), -- Deadly Gladiator Pendant of Triumph
(@Tristia,0,42028,0,0,@1600RT_47400HP); -- Deadly Gladiator Pendant of Victory
*/

-- Add Spectral Gyphron to Wintergrasp
DELETE FROM `spell_area` WHERE `spell`=55164 AND `area`=4197;
INSERT INTO `spell_area` 
(`spell`,`area`,`quest_start`,`quest_start_active`,`aura_spell`,`racemask`,`gender`,`autocast`) 
VALUES
(55164,4197,0,0,8326,65527,2,1);

-- Missing database loot entries for Mature Lasher
SET @lasher := 34300;
DELETE FROM `creature_loot_template` WHERE `entry`=@lasher;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(@lasher,37704,100,1,0,1,3), -- Crystalised Life
(@lasher,43324,-75,1,0,1,1), -- Alliance Herb Pouch
(@lasher,44809,-75,1,0,1,1), -- Horde Herb Pouch 
(@lasher,44774,80,1,0,1,1), -- Ice-Piercing Thorn
(@lasher,44775,20,1,0,1,1); -- Revolting Flower
/*
-- Missing database harvest loot entries for Mature and Living Lasher
UPDATE `creature_template` SET `skinloot`=80007 WHERE `entry` IN (34300,30845);
*/





-- increase the static 15 to 10-25% of maxpoolsize to hopefully get more blizzlike spawncounts
UPDATE `pool_template` SET `max_limit`=20 WHERE `entry`=948; -- increase pool: MASTER Herbs Silithus zone 1377 ( by 5)
UPDATE `pool_template` SET `max_limit`=75 WHERE `entry`=949; -- increase pool: MASTER Herbs Stonetalon Mountains zone 406 ( by 60)
UPDATE `pool_template` SET `max_limit`=55 WHERE `entry`=950; -- increase pool: MASTER Herbs Redridge Mountains zone 44 ( by 40)
UPDATE `pool_template` SET `max_limit`=80 WHERE `entry`=951; -- increase pool: MASTER Herbs Westfall zone 40 ( by 65)
UPDATE `pool_template` SET `max_limit`=55 WHERE `entry`=952; -- increase pool: MASTER Herbs Loch Modan zone 38 ( by 40)
UPDATE `pool_template` SET `max_limit`=45 WHERE `entry`=953; -- increase pool: MASTER Herbs Tirisfal Glades zone 85 ( by 30)
UPDATE `pool_template` SET `max_limit`=60 WHERE `entry`=954; -- increase pool: MASTER Herbs Western Plaguelands zone 28 ( by 45)
UPDATE `pool_template` SET `max_limit`=45 WHERE `entry`=955; -- increase pool: MASTER Herbs Mulgore zone 215 ( by 30)
UPDATE `pool_template` SET `max_limit`=60 WHERE `entry`=956; -- increase pool: MASTER Herbs Silverpine Forest zone 130 ( by 45)
UPDATE `pool_template` SET `max_limit`=35 WHERE `entry`=957; -- increase pool: MASTER Herbs Teldrassil zone 141 ( by 20)
UPDATE `pool_template` SET `max_limit`=70 WHERE `entry`=958; -- increase pool: MASTER Herbs Hillsbrad Foothills zone 267 ( by 55)
UPDATE `pool_template` SET `max_limit`=85 WHERE `entry`=959; -- increase pool: MASTER Herbs Arathi Highlands zone 45 ( by 120)
UPDATE `pool_template` SET `max_limit`=95 WHERE `entry`=960; -- increase pool: MASTER Herbs Ashenvale zone 331 ( by 105)
UPDATE `pool_template` SET `max_limit`=85 WHERE `entry`=961; -- increase pool: MASTER Herbs Darkshore zone 148 ( by 85)
UPDATE `pool_template` SET `max_limit`=35 WHERE `entry`=962; -- increase pool: MASTER Herbs Thousand Needles zone 400 ( by 20)
UPDATE `pool_template` SET `max_limit`=35 WHERE `entry`=963; -- increase pool: MASTER Herbs Tanaris zone 440 ( by 20)
UPDATE `pool_template` SET `max_limit`=65 WHERE `entry`=964; -- increase pool: MASTER Herbs Feralas zone 357 ( by 50)
UPDATE `pool_template` SET `max_limit`=90 WHERE `entry`=965; -- increase pool: MASTER Herbs Hinterlands zone 47 ( by 75)
UPDATE `pool_template` SET `max_limit`=75 WHERE `entry`=966; -- increase pool: MASTER Herbs Un'Goro Crater zone 490 ( by 60)
UPDATE `pool_template` SET `max_limit`=75 WHERE `entry`=967; -- increase pool: MASTER Herbs Winterspring zone 618 ( by 60)
UPDATE `pool_template` SET `max_limit`=90 WHERE `entry`=968; -- increase pool: MASTER Herbs Eastern Plaguelands zone 139 ( by 110)
UPDATE `pool_template` SET `max_limit`=30 WHERE `entry`=969; -- increase pool: MASTER Herbs Ghostlands zone 3433 ( by 15)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=970; -- increase pool: MASTER Herbs Eversong Woods zone 3430 ( by 25)
UPDATE `pool_template` SET `max_limit`=30 WHERE `entry`=971; -- increase pool: MASTER Herbs Azuremyst Isle zone 3524 ( by 15)
UPDATE `pool_template` SET `max_limit`=60 WHERE `entry`=972; -- increase pool: MASTER Herbs Hellfire Peninsula zone 3483 ( by 45)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=973; -- increase pool: MASTER Herbs Nagrand zone 3518 ( by 25)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=974; -- increase pool: MASTER Herbs Netherstorm zone 3523 ( by 25)
UPDATE `pool_template` SET `max_limit`=95 WHERE `entry`=975; -- increase pool: MASTER Herbs Zangarmarsh zone 3521 ( by 80)
UPDATE `pool_template` SET `max_limit`=45 WHERE `entry`=976; -- increase pool: MASTER Herbs Shadowmoon Valley zone 3520 ( by 30)
UPDATE `pool_template` SET `max_limit`=65 WHERE `entry`=977; -- increase pool: MASTER Herbs Terokkar Forest zone 3519 ( by 50)
UPDATE `pool_template` SET `max_limit`=35 WHERE `entry`=978; -- increase pool: MASTER Herbs Blade's Edge Mountains zone 3522 ( by 20)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=980; -- increase pool: MASTER Herbs Icecrown zone 210 ( by 25)
UPDATE `pool_template` SET `max_limit`=35 WHERE `entry`=981; -- increase pool: MASTER Herbs Storm Peaks zone 67 ( by 20)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=982; -- increase pool: MASTER Herbs Sholazar Basin zone 3711 ( by 25)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=983; -- increase pool: MASTER Herbs Zul'drak zone 66 ( by 25)
UPDATE `pool_template` SET `max_limit`=20 WHERE `entry`=984; -- increase pool: MASTER Herbs Grizzly Hills zone 394 ( by 5)
UPDATE `pool_template` SET `max_limit`=35 WHERE `entry`=985; -- increase pool: MASTER Herbs Dragonblight zone 65 ( by 20)
UPDATE `pool_template` SET `max_limit`=30 WHERE `entry`=986; -- increase pool: MASTER Herbs Howling Fjord zone 495 ( by 15)
UPDATE `pool_template` SET `max_limit`=25 WHERE `entry`=987; -- increase pool: MASTER Herbs Borean Tundra zone 3537 ( by 10)
UPDATE `pool_template` SET `max_limit`=100 WHERE `entry`=988; -- increase pool: MASTER Herbs Stranglethorn Vale zone 33 ( by 165)
UPDATE `pool_template` SET `max_limit`=85 WHERE `entry`=990; -- increase pool: MASTER Herbs Azshara zone 16 ( by 115)
UPDATE `pool_template` SET `max_limit`=25 WHERE `entry`=991; -- increase pool: MASTER Herbs Dustwallow Marsh zone 15 ( by 10)
UPDATE `pool_template` SET `max_limit`=75 WHERE `entry`=992; -- increase pool: MASTER Herbs Durotar zone 14 ( by 60)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=993; -- increase pool: MASTER Herbs Elwynn Forest zone 12 ( by 25)
UPDATE `pool_template` SET `max_limit`=90 WHERE `entry`=994; -- increase pool: MASTER Herbs Wetlands zone 11 ( by 85)
UPDATE `pool_template` SET `max_limit`=80 WHERE `entry`=995; -- increase pool: MASTER Herbs Duskwood zone 10 ( by 65)
UPDATE `pool_template` SET `max_limit`=85 WHERE `entry`=996; -- increase pool: MASTER Herbs Swamp of Sorrows zone 8 ( by 85)
UPDATE `pool_template` SET `max_limit`=30 WHERE `entry`=997; -- increase pool: MASTER Herbs Blasted Lands zone 4 ( by 15)
UPDATE `pool_template` SET `max_limit`=45 WHERE `entry`=998; -- increase pool: MASTER Herbs Badlands zone 3 ( by 30)
UPDATE `pool_template` SET `max_limit`=40 WHERE `entry`=999; -- increase pool: MASTER Herbs Dun Morogh zone 1 ( by 25)

-- Deletes old script
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=732;

-- Implements AI for Murloc Lurker
-- Timers were got from eventAI script (ACID)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=732;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=732 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(732, 0, 0, 0, 67, 0, 100, 0, 3900, 6900, 0, 0, 11, 7159, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Murloc Lurker - Casts Backstab');


-- Chain the Black Knight Quest Series
UPDATE `quest_template` SET `PrevQuestId`=0,`NextQuestId`=13641 WHERE `entry`=13633; -- The Black Knight of Westfall? (Ally)
UPDATE `quest_template` SET `PrevQuestId`=0,`NextQuestId`=13641 WHERE `entry`=13634; -- The Black Knight of Silverpine (Horde)
UPDATE `quest_template` SET `PrevQuestId`=0,`NextQuestId`=13643 WHERE `entry`=13641; -- The Seer's Crystal
UPDATE `quest_template` SET `PrevQuestId`=13641,`NextQuestId`=0 WHERE `entry`=13643; -- The Stories Dead Men Tell
UPDATE `quest_template` SET `PrevQuestId`=13643,`NextQuestId`=0 WHERE `entry`=13654; -- There's Something About the Squire
UPDATE `quest_template` SET `PrevQuestId`=13654,`NextQuestId`=0 WHERE `entry`=13663; -- The Black Knight's Orders
UPDATE `quest_template` SET `PrevQuestId`=13663,`NextQuestId`=0 WHERE `entry`=13664; -- The Black Knight's Fall
UPDATE `quest_template` SET `PrevQuestId`=13664,`NextQuestId`=0 WHERE `entry`=14016; -- The Black Knight's Curse
UPDATE `quest_template` SET `PrevQuestId`=14016,`NextQuestId`=0 WHERE `entry`=14017; -- The Black Knight's Fate
-- Thread from Above only after The Black Knight's Fall
UPDATE `quest_template` SET `PrevQuestId`=13664 WHERE `entry`=13682; -- Thread from Above only after The Black Knights Fall
UPDATE `quest_template` SET `PrevQuestId`=13664 WHERE `entry`=13788; -- Thread from Above only after The Black Knights Fall
UPDATE `quest_template` SET `PrevQuestId`=13664 WHERE `entry`=13809; -- Thread from Above only after The Black Knights Fall
UPDATE `quest_template` SET `PrevQuestId`=13664 WHERE `entry`=13812; -- Thread from Above only after The Black Knights Fall
-- Fix some startuperrors:
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry` IN (32405,32407); 

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=6652 AND `text_id`=9190;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6652,9190);
DELETE FROM `gossip_menu` WHERE `entry`=7146 AND `text_id`=8410;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7146,8410);
DELETE FROM `gossip_menu` WHERE `entry`=7153 AND `text_id`=8417;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7153,8417);
DELETE FROM `gossip_menu` WHERE `entry`=7158 AND `text_id`=8423;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7158,8423);
DELETE FROM `gossip_menu` WHERE `entry`=7159 AND `text_id`=8424;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7159,8424);
DELETE FROM `gossip_menu` WHERE `entry`=7160 AND `text_id`=8429;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7160,8429);
DELETE FROM `gossip_menu` WHERE `entry`=7162 AND `text_id`=8431;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7162,8431);
DELETE FROM `gossip_menu` WHERE `entry`=7163 AND `text_id`=8433;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7163,8433);
DELETE FROM `gossip_menu` WHERE `entry`=7171 AND `text_id`=8445;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7171,8445);
DELETE FROM `gossip_menu` WHERE `entry`=7172 AND `text_id`=8447;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7172,8447);
DELETE FROM `gossip_menu` WHERE `entry`=7188 AND `text_id`=8466;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7188,8466);
DELETE FROM `gossip_menu` WHERE `entry`=7192 AND `text_id`=8472;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7192,8472);
DELETE FROM `gossip_menu` WHERE `entry`=7195 AND `text_id`=8476;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7195,8476);
DELETE FROM `gossip_menu` WHERE `entry`=7204 AND `text_id`=8485;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7204,8485);
DELETE FROM `gossip_menu` WHERE `entry`=7205 AND `text_id`=8487;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7205,8487);
DELETE FROM `gossip_menu` WHERE `entry`=7206 AND `text_id`=8488;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7206,8488);
DELETE FROM `gossip_menu` WHERE `entry`=7207 AND `text_id`=8489;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7207,8489);
DELETE FROM `gossip_menu` WHERE `entry`=7211 AND `text_id`=8501;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7211,8501);
DELETE FROM `gossip_menu` WHERE `entry`=7250 AND `text_id`=8564;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7250,8564);
DELETE FROM `gossip_menu` WHERE `entry`=7251 AND `text_id`=8565;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7251,8565);
DELETE FROM `gossip_menu` WHERE `entry`=7253 AND `text_id`=8569;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7253,8569);
DELETE FROM `gossip_menu` WHERE `entry`=7259 AND `text_id`=8580;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7259,8580);
DELETE FROM `gossip_menu` WHERE `entry`=7287 AND `text_id`=8617;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7287,8617);
DELETE FROM `gossip_menu` WHERE `entry`=7289 AND `text_id`=8620;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7289,8620);
DELETE FROM `gossip_menu` WHERE `entry`=7291 AND `text_id`=8638;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7291,8638);
DELETE FROM `gossip_menu` WHERE `entry`=7446 AND `text_id`=9019;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7446,9019);
DELETE FROM `gossip_menu` WHERE `entry`=7447 AND `text_id`=9020;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7447,9020);
DELETE FROM `gossip_menu` WHERE `entry`=7451 AND `text_id`=9024;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7451,9024);
DELETE FROM `gossip_menu` WHERE `entry`=8775 AND `text_id`=11354;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8775,11354);
DELETE FROM `gossip_menu` WHERE `entry`=8789 AND `text_id`=11256;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8789,11256);
DELETE FROM `gossip_menu` WHERE `entry`=8790 AND `text_id`=11257;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8790,11257);
DELETE FROM `gossip_menu` WHERE `entry`=8791 AND `text_id`=11258;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8791,11258);
DELETE FROM `gossip_menu` WHERE `entry`=8792 AND `text_id`=11259;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8792,11259);
DELETE FROM `gossip_menu` WHERE `entry`=8825 AND `text_id`=11372;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8825,11372);

-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=7146 WHERE `entry`=16187;
UPDATE `creature_template` SET `gossip_menu_id`=7153 WHERE `entry`=16197;
UPDATE `creature_template` SET `gossip_menu_id`=7158 WHERE `entry`=16213;
UPDATE `creature_template` SET `gossip_menu_id`=7159 WHERE `entry`=16219;
UPDATE `creature_template` SET `gossip_menu_id`=7160 WHERE `entry`=16220;
UPDATE `creature_template` SET `gossip_menu_id`=7162 WHERE `entry`=16224;
UPDATE `creature_template` SET `gossip_menu_id`=7163 WHERE `entry`=16231;
UPDATE `creature_template` SET `gossip_menu_id`=7171 WHERE `entry`=16253;
UPDATE `creature_template` SET `gossip_menu_id`=7172 WHERE `entry`=16252;
UPDATE `creature_template` SET `gossip_menu_id`=7188 WHERE `entry`=16289;
UPDATE `creature_template` SET `gossip_menu_id`=7192 WHERE `entry`=16293;
UPDATE `creature_template` SET `gossip_menu_id`=7195 WHERE `entry`=16203;
UPDATE `creature_template` SET `gossip_menu_id`=7204 WHERE `entry`=16205;
UPDATE `creature_template` SET `gossip_menu_id`=7205 WHERE `entry`=16202;
UPDATE `creature_template` SET `gossip_menu_id`=7206 WHERE `entry`=16201;
UPDATE `creature_template` SET `gossip_menu_id`=7207 WHERE `entry`=16251;
UPDATE `creature_template` SET `gossip_menu_id`=7250 WHERE `entry`=16462;
UPDATE `creature_template` SET `gossip_menu_id`=7251 WHERE `entry`=16464;
UPDATE `creature_template` SET `gossip_menu_id`=7253 WHERE `entry`=16463;
UPDATE `creature_template` SET `gossip_menu_id`=7259 WHERE `entry`=16480;
UPDATE `creature_template` SET `gossip_menu_id`=7287 WHERE `entry`=16528;
UPDATE `creature_template` SET `gossip_menu_id`=7288 WHERE `entry`=16542;
UPDATE `creature_template` SET `gossip_menu_id`=7289 WHERE `entry`=16217;
UPDATE `creature_template` SET `gossip_menu_id`=7291 WHERE `entry`=16603;
UPDATE `creature_template` SET `gossip_menu_id`=7446 WHERE `entry`=17655;
UPDATE `creature_template` SET `gossip_menu_id`=7447 WHERE `entry`=17656;
UPDATE `creature_template` SET `gossip_menu_id`=7451 WHERE `entry`=16665;
UPDATE `creature_template` SET `gossip_menu_id`=8775 WHERE `entry`=23559;
UPDATE `creature_template` SET `gossip_menu_id`=8789 WHERE `entry`=23718;

-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6652,7287,7146,7171,7451,7446,7153,7447,8789) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6652,7171,8789) AND `id` IN (1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8789) AND `id` IN (2);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8775) AND `id` IN (6);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(6652,0,3, 'I seek training in the ways of the Hunter.',5,16,0,0,0,0,0, ''),
(6652,1,0, 'I wish to unlearn my talents.',16,16,0,0,0,0,0, ''),
(7287,0,1, 'Show me what I have access to, Vredigar.',3,128,0,0,0,0,0, ''),
(7146,0,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(7171,0,3, 'Master chef, can you train me in the culinary arts?',5,16,0,0,0,0,0, ''),
(7171,1,1, 'Have you any cooking supplies?',3,128,0,0,0,0,0, ''),
(7451,0,12, 'I wish to make use of the stables.',14,4194304,0,0,0,0,0, ''),
(7446,0,1, 'I want to browse your goods.',3,128,0,0,0,0,0, ''),
(7153,0,0, 'Arcanist Vandril, what are the Forsaken doing here?',1,1,7211,0,0,0,0, ''),
(7447,0,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(8789,0,0, 'Who is this Budd fellow?',1,1,8790,0,0,0,0, ''),
(8789,1,0, 'Interesting crew you''ve got here....',1,1,8791,0,0,0,0, ''),
(8789,2,0, 'Whew! What''s that smell?',1,1,8792,0,0,0,0, ''),
(8775,6,0, 'Are you suggesting I provide you with people for Zul''jin''s sacrifices?',1,1,8825,0,0,0,0, '');

-- Insert npc_text from sniff
DELETE FROM `npc_text` WHERE `ID` IN (11354,11372);
INSERT INTO `npc_text` (`ID`,`prob0`,`text0_0`,`text0_1`,`lang0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`prob1`,`text1_0`,`text1_1`,`lang1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`prob2`,`text2_0`,`text2_1`,`lang2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`prob3`,`text3_0`,`text3_1`,`lang3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`prob4`,`text4_0`,`text4_1`,`lang4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`prob5`,`text5_0`,`text5_1`,`lang5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`prob6`,`text6_0`,`text6_1`,`lang6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`prob7`,`text7_0`,`text7_1`,`lang7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(11354,1,'Listen, $c, it''s clear that you and your friends know your way around Azeroth. Surely you''ve come across certain folks who hunger for fame and fortune. $b$bSend me anyone who might be willing to enter Zul''Aman and I''ll make it worth your while.','',0,0,1,1000,1,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(11372,1,'Perish the thought!$b$bI''m simply trying to rid the world of a horrible menace, and that type of thing rarely comes without a price, as I''m sure you know.$b$bThink of it like this, $n. You''ll be offering ordinary folks the chance to become heroes! A rare opportunity indeed!$b$bYou just send them my way and I''ll handle the rest....','',0,0,1,1000,1,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1);

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=10921 AND `text_id`=15170;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10921,15170);
DELETE FROM `gossip_menu` WHERE `entry`=10948 AND `text_id`=15212;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10948,15212);
DELETE FROM `gossip_menu` WHERE `entry`=7925 AND `text_id`=9704;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7925,9704);
DELETE FROM `gossip_menu` WHERE `entry`=10976 AND `text_id`=15256;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10976,15256);
DELETE FROM `gossip_menu` WHERE `entry`=12024 AND `text_id`=16850;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12024,16850);
DELETE FROM `gossip_menu` WHERE `entry`=11983 AND `text_id`=16801;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11983,16801);
DELETE FROM `gossip_menu` WHERE `entry`=11979 AND `text_id`=16796;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11979,16796);
DELETE FROM `gossip_menu` WHERE `entry`=11952 AND `text_id`=16779;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11952,16779);
DELETE FROM `gossip_menu` WHERE `entry`=6647 AND `text_id`=7904;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6647,7904);/* --- CHECK IT!
DELETE FROM `gossip_menu` WHERE `entry`=11793 AND `text_id`=16540;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11793,16540);*/

-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=10921 WHERE `entry`=37675;
UPDATE `creature_template` SET `gossip_menu_id`=10948 WHERE `entry`=38042;
UPDATE `creature_template` SET `gossip_menu_id`=7925 WHERE `entry`=19175;
UPDATE `creature_template` SET `gossip_menu_id`=10976 WHERE `entry`=37172;

-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6647) AND `id` IN (0,1);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(6647,0,3, 'I would like to train further in the ways of the Light.',5,16,0,0,0,0,0, ''),
(6647,1,0, 'I wish to unlearn my talents.',16,16,0,0,0,0,0, '');

-- Insert npc_text from sniff
DELETE FROM `npc_text` WHERE `ID` IN (9704,16850,16801,16796,16779);
INSERT INTO `npc_text` (`ID`,`prob0`,`text0_0`,`text0_1`,`lang0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`prob1`,`text1_0`,`text1_1`,`lang1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`prob2`,`text2_0`,`text2_1`,`lang2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`prob3`,`text3_0`,`text3_1`,`lang3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`prob4`,`text4_0`,`text4_1`,`lang4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`prob5`,`text5_0`,`text5_1`,`lang5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`prob6`,`text6_0`,`text6_1`,`lang6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`prob7`,`text7_0`,`text7_1`,`lang7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(9704,1,'The largest celebration of the Lunar Festival is taking place in Moonglade. If that''s too far to travel to, there are druids offering transport from the Valley of Wisdom.','The largest celebration of the Lunar Festival is taking place in Moonglade. If that''s too far to travel to, there are druids offering transport from the Valley of Wisdom.',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16850,1,'Never underestimate the power of proper supply management. The warriors may win the battles, but it''s the supplies that win the war. ','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16801,1,'There are no emotions. There are no morals. There are no zealots.$B$BThere is only the Brotherhood.$B$BHere, in the very chapel where Uther the Lightbringer joined the Order of the Silver Hand, I, Korfax, Champion of the Light, will inspire fear into the fearless.$B$BNothing will curb my fury - not the Scarlet Crusade, not the Argent Dawn, not my brothers, not even you.','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16796,1,'The Brotherhood of the Light transcends the ability of any other group to eradicate affronts to the Light. We will take any actions necessary to rid the world of foul beasts like these undead. Nothing will stand in our way.$B$BAre you with us, or against us?','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16779,1,'Weapons...armor...these are the keys to victory. Any warrior, no matter how strong, is essentially defenseless without them.$B$BI have crafted many a legend in my day, $r. You will find nothing like them in all of Azeroth. They are the key to my brethren''s success.','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1);


-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=141 AND `text_id`=4793;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (141,4793);
DELETE FROM `gossip_menu` WHERE `entry`=523 AND `text_id`=4985;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (523,4985);
DELETE FROM `gossip_menu` WHERE `entry`=1582 AND `text_id`=938;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (1582,938);
DELETE FROM `gossip_menu` WHERE `entry`=2384 AND `text_id`=2193;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (2384,2193);
DELETE FROM `gossip_menu` WHERE `entry`=2782 AND `text_id`=3466;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (2782,3466);
DELETE FROM `gossip_menu` WHERE `entry`=3062 AND `text_id`=3794;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (3062,3794);
DELETE FROM `gossip_menu` WHERE `entry`=3162 AND `text_id`=3896;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (3162,3896);
DELETE FROM `gossip_menu` WHERE `entry`=3187 AND `text_id`=3954;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (3187,3954);
DELETE FROM `gossip_menu` WHERE `entry`=4017 AND `text_id`=4888;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4017,4888);
DELETE FROM `gossip_menu` WHERE `entry`=4104 AND `text_id`=5006;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4104,5006);
DELETE FROM `gossip_menu` WHERE `entry`=4105 AND `text_id`=5008;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4105,5008);
DELETE FROM `gossip_menu` WHERE `entry`=4509 AND `text_id`=4985;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4509,4985);
DELETE FROM `gossip_menu` WHERE `entry`=4511 AND `text_id`=4985;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4511,4985);
DELETE FROM `gossip_menu` WHERE `entry`=4603 AND `text_id`=5715;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4603,5715);
DELETE FROM `gossip_menu` WHERE `entry`=4604 AND `text_id`=5715;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4604,5715);
DELETE FROM `gossip_menu` WHERE `entry`=4643 AND `text_id`=5715;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4643,5715);
DELETE FROM `gossip_menu` WHERE `entry`=4741 AND `text_id`=5793;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4741,5793);
DELETE FROM `gossip_menu` WHERE `entry`=4747 AND `text_id`=5799;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4747,5799);
DELETE FROM `gossip_menu` WHERE `entry`=5848 AND `text_id`=7010;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5848,7010);
DELETE FROM `gossip_menu` WHERE `entry`=6815 AND `text_id`=7935;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6815,7935);
DELETE FROM `gossip_menu` WHERE `entry`=6899 AND `text_id`=7935;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6899,7935);
DELETE FROM `gossip_menu` WHERE `entry`=6918 AND `text_id`=8205;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6918,8205);
DELETE FROM `gossip_menu` WHERE `entry`=7935 AND `text_id`=9716;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7935,9716);
DELETE FROM `gossip_menu` WHERE `entry`=10031 AND `text_id`=13911;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10031,13911);
DELETE FROM `gossip_menu` WHERE `entry`=10181 AND `text_id`=14126;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10181,14126);
DELETE FROM `gossip_menu` WHERE `entry`=10638 AND `text_id`=14736;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10638,14736);
DELETE FROM `gossip_menu` WHERE `entry`=11185 AND `text_id`=5002;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11185,5002);
DELETE FROM `gossip_menu` WHERE `entry`=11189 AND `text_id`=15572;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11189,15572);
DELETE FROM `gossip_menu` WHERE `entry`=11653 AND `text_id`=16283;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11653,16283);
DELETE FROM `gossip_menu` WHERE `entry`=11681 AND `text_id`=16344;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11681,16344);
DELETE FROM `gossip_menu` WHERE `entry`=11726 AND `text_id`=16413;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11726,16413);
DELETE FROM `gossip_menu` WHERE `entry`=11766 AND `text_id`=16489;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11766,16489);
DELETE FROM `gossip_menu` WHERE `entry`=11767 AND `text_id`=16490;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11767,16490);
DELETE FROM `gossip_menu` WHERE `entry`=11790 AND `text_id`=16535;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11790,16535);
DELETE FROM `gossip_menu` WHERE `entry`=11824 AND `text_id`=16578;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11824,16578);
DELETE FROM `gossip_menu` WHERE `entry`=11875 AND `text_id`=4973;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11875,4973);
DELETE FROM `gossip_menu` WHERE `entry`=11877 AND `text_id`=5717;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11877,5717);
DELETE FROM `gossip_menu` WHERE `entry`=11878 AND `text_id`=5006;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11878,5006);
DELETE FROM `gossip_menu` WHERE `entry`=11879 AND `text_id`=4998;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11879,4998);
DELETE FROM `gossip_menu` WHERE `entry`=11906 AND `text_id`=16715;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11906,16715);
DELETE FROM `gossip_menu` WHERE `entry`=11912 AND `text_id`=4986;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11912,4986);
DELETE FROM `gossip_menu` WHERE `entry`=11913 AND `text_id`=5004;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11913,5004);
DELETE FROM `gossip_menu` WHERE `entry`=11919 AND `text_id`=16734;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11919,16734);
DELETE FROM `gossip_menu` WHERE `entry`=11932 AND `text_id`=16749;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11932,16749);
DELETE FROM `gossip_menu` WHERE `entry`=11933 AND `text_id`=565;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11933,565);
DELETE FROM `gossip_menu` WHERE `entry`=11951 AND `text_id`=16778;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11951,16778);
DELETE FROM `gossip_menu` WHERE `entry`=11969 AND `text_id`=16783;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11969,16783);
DELETE FROM `gossip_menu` WHERE `entry`=11971 AND `text_id`=16789;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11971,16789);
DELETE FROM `gossip_menu` WHERE `entry`=12050 AND `text_id`=16882;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12050,16882);
DELETE FROM `gossip_menu` WHERE `entry`=12094 AND `text_id`=16982;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12094,16982);
DELETE FROM `gossip_menu` WHERE `entry`=12095 AND `text_id`=16983;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12095,16983);
DELETE FROM `gossip_menu` WHERE `entry`=12151 AND `text_id`=17085;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12151,17085);
DELETE FROM `gossip_menu` WHERE `entry`=12233 AND `text_id`=17176;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12233,17176);
DELETE FROM `gossip_menu` WHERE `entry`=12235 AND `text_id`=17180;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12235,17180);
DELETE FROM `gossip_menu` WHERE `entry`=12443 AND `text_id`=17499;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12443,17499);
DELETE FROM `gossip_menu` WHERE `entry`=12563 AND `text_id`=17647;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12563,17647);
DELETE FROM `gossip_menu` WHERE `entry`=12670 AND `text_id`=12549;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12670,12549);

-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=64 WHERE `entry`=5880;
UPDATE `creature_template` SET `gossip_menu_id`=141 WHERE `entry`=3170;
UPDATE `creature_template` SET `gossip_menu_id`=141 WHERE `entry`=3155;
UPDATE `creature_template` SET `gossip_menu_id`=523 WHERE `entry`=3169;
UPDATE `creature_template` SET `gossip_menu_id`=2384 WHERE `entry`=3326;
UPDATE `creature_template` SET `gossip_menu_id`=2782 WHERE `entry`=1383;
UPDATE `creature_template` SET `gossip_menu_id`=3062 WHERE `entry`=10578;
UPDATE `creature_template` SET `gossip_menu_id`=3162 WHERE `entry`=7952;
UPDATE `creature_template` SET `gossip_menu_id`=3187 WHERE `entry`=11176;
UPDATE `creature_template` SET `gossip_menu_id`=3644 WHERE `entry`=3706;
UPDATE `creature_template` SET `gossip_menu_id`=4017 WHERE `entry`=3171;
UPDATE `creature_template` SET `gossip_menu_id`=4104 WHERE `entry`=3173;
UPDATE `creature_template` SET `gossip_menu_id`=4509 WHERE `entry`=3353;
UPDATE `creature_template` SET `gossip_menu_id`=4511 WHERE `entry`=3354;
UPDATE `creature_template` SET `gossip_menu_id`=4603 WHERE `entry`=3324;
UPDATE `creature_template` SET `gossip_menu_id`=4604 WHERE `entry`=3325;
UPDATE `creature_template` SET `gossip_menu_id`=4643 WHERE `entry`=3156;
UPDATE `creature_template` SET `gossip_menu_id`=4741 WHERE `entry`=3332;
UPDATE `creature_template` SET `gossip_menu_id`=4747 WHERE `entry`=3399;
UPDATE `creature_template` SET `gossip_menu_id`=5848 WHERE `entry`=14451;
UPDATE `creature_template` SET `gossip_menu_id`=5856 WHERE `entry`=5943;
UPDATE `creature_template` SET `gossip_menu_id`=6565 WHERE `entry`=7951;
UPDATE `creature_template` SET `gossip_menu_id`=6815 WHERE `entry`=15572;
UPDATE `creature_template` SET `gossip_menu_id`=6899 WHERE `entry`=15579;
UPDATE `creature_template` SET `gossip_menu_id`=6918 WHERE `entry`=15895;
UPDATE `creature_template` SET `gossip_menu_id`=7935 WHERE `entry`=19177;
UPDATE `creature_template` SET `gossip_menu_id`=10031 WHERE `entry`=5875;
UPDATE `creature_template` SET `gossip_menu_id`=10181 WHERE `entry`=3881;
UPDATE `creature_template` SET `gossip_menu_id`=10638 WHERE `entry`=35364;
UPDATE `creature_template` SET `gossip_menu_id`=11189 WHERE `entry`=10676;
UPDATE `creature_template` SET `gossip_menu_id`=11790 WHERE `entry`=3139;
UPDATE `creature_template` SET `gossip_menu_id`=11971 WHERE `entry`=9988;
UPDATE `creature_template` SET `gossip_menu_id`=12670 WHERE `entry`=12776;
UPDATE `creature_template` SET `gossip_menu_id`=12670 WHERE `entry`=6027;
UPDATE `creature_template` SET `gossip_menu_id`=12670 WHERE `entry`=5815;

-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (1012,6899,12443,2746,10181,4142,4741,4747,11767,10638,7034,6918) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (12443,11767,6899,3162,6815) AND `id` IN (1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6815,1582,11919) AND `id` IN (2);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (1582,11919,6815,6899) AND `id` IN (3);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6899) AND `id` IN (4);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(1012,0,3, 'Train me.',5,16,0,0,0,0,0, ''),
(6899,0,0, 'Where is Elder Darkcore?',1,1,0,0,0,0,0, ''),
(12443,0,3, 'Train me.',5,16,0,0,0,0,0, ''),
(2746,0,3, 'Train me.',5,16,0,0,0,0,0, ''),
(10181,0,1, 'I want to browse your goods.',3,128,0,0,0,0,0, ''),
(4142,0,3, 'Train me.',5,16,0,0,0,0,0, ''),
(4741,0,3, 'I require training, Lumak.',5,16,0,0,0,0,0, ''),
(4747,0,3, 'I require training, Zamja.',5,16,0,0,0,0,0, ''),
(11767,0,3, 'I would like to train.',5,16,0,0,0,0,0, ''),
(10638,0,0, 'I no longer wish to gain experience.',1,1,0,0,0,0,0, ''),
(7034,0,0, 'I would like to enter the secret code to receive my Murloc pet.',1,1,0,0,0,0,0, ''),
(6918,0,0, 'I''d like a new invitation to the Lunar Festival.',1,1,0,0,0,0,0, ''),
(12443,1,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(11767,1,0, 'I wish to unlearn my talents.',16,16,0,0,0,0,0, ''),
(6899,1,0, 'Where is Elder Ironband?',1,1,0,0,0,0,0, ''),
(3162,1,1, 'I would like to buy from you.',3,128,0,0,0,0,0, ''),
(6815,1,0, 'Where is Elder High Mountain?',1,1,0,0,0,0,0, ''),
(6815,2,0, 'Where is Elder Moonwarden?',1,1,0,0,0,0,0, ''),
(1582,2,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(11919,2,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(1582,3,1, 'I want to browse your goods.',3,128,0,0,0,0,0, ''),
(11919,3,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(6815,3,0, 'Where is Elder Windtotem?',1,1,0,0,0,0,0, ''),
(6899,3,0, 'Where is Elder Runetotem?',1,1,0,0,0,0,0, ''),
(6899,4,0, 'Where is Elder Windtotem?',1,1,0,0,0,0,0, '');

-- Insert npc_text from sniff
DELETE FROM `npc_text` WHERE `ID` IN (14126,15572,16283,16344,16413,16489,16490,16535,16578,16715,16734,16749,16778,16783,16789,16882,16982,16983,17085,17125,17176,17180,17499,17647);
INSERT INTO `npc_text` (`ID`,`prob0`,`text0_0`,`text0_1`,`lang0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`prob1`,`text1_0`,`text1_1`,`lang1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`prob2`,`text2_0`,`text2_1`,`lang2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`prob3`,`text3_0`,`text3_1`,`lang3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`prob4`,`text4_0`,`text4_1`,`lang4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`prob5`,`text5_0`,`text5_1`,`lang5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`prob6`,`text6_0`,`text6_1`,`lang6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`prob7`,`text7_0`,`text7_1`,`lang7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(14126,1,'How may I help you?','How may I help you?',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(15572,1,'Need something?','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16283,1,'Leave this old Dragonmaw to his drink, $c.$B$BI''ve fought creatures that would curl your spine and I''ve seen my people all but slaughtered in the swamps of the wetlands and amidst the ruins of Outland.$B$BGet. Lost.','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16344,1,'You ever been to the jungle, $r?$b$bIt''s real nice.','',0,0,0,0,0,0,0,1,'Stranglethorn, $g man: babe;.  That''s where it''s AT!','',0,0,0,0,0,0,0,1,'Hi.','',0,0,0,0,0,0,0,1,'Ah, to be back in Stranglethorn.  The screeching raptors, the troll wars, jungle creatures as far as the eye see, just ASKING to be killed...$b$b<Bort sighs.>','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16413,1,'Fishing has always come naturally to my family.  You look like you could use a little help though.  How about running a few errands for a Master Angler?','',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16489,1,'The Light protect you, $c.','The Light protect you, $c.',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16490,1,'The light of the Sun illuminates the path to wisdom.  Where shall we walk today, friend?','The light of the Sun illuminates the path to wisdom.  Where shall we walk today, friend?',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16535,1,'Keep your eyes open, $c. Even Durotar is not safe from our enemies.','',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16578,1,'Ya''ll need to find a different trainer, $c. I cannot help ya.','',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16715,1,'Dark is de jungle, but fertile is its soil.$B$BMay de spirits of de earth watch over ya, $c.','Dark is de jungle, but fertile is its soil.$B$BMay de spirits of de earth watch over ya, $c.',1,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16734,100,'Come in, mon... forget yer cares for a while!$B$BRest de body, rest de soul.','Come in, mon... forget yer cares for a while!$B$BRest de body, rest de soul.',1,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16749,1,'De secrets I have ta share would blast your soul apart, $c.$B$BTrust me: You be wantin'' ta talk ta someone else about trainin''.','De secrets I have ta share would blast your soul apart, $c.$B$BTrust me: You be wantin'' ta talk ta someone else about trainin''.',1,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16778,1,'I can''t see a thing with this mask on, but I''m not about to tell HER that.','',1,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16783,1,'You take a wrong turn, mon? Heh heh heh.$B$BWhat can I be helpin'' ya find?','You take a wrong turn, mon? Heh heh heh.$B$BWhat can I be helpin'' ya find?',1,0,153,3,396,0,0,1,'Don''t see many a'' your kind ''round here, mon.$B$BWhat can I be helpin'' ya find?','Don''t see many a'' your kind ''round here, mon.$B$BWhat can I be helpin'' ya find?',1,0,396,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16789,1,'Hey der, mon.$B$BDid ya need help recoverin'' a lost companion?','Hey der, mon.$B$BDid ya need help recoverin'' a lost companion?',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16882,1,'Nothin'' ta see here, mon.  Be on yer way, why don''cha?','Nothin'' ta see here, mon.  Be on yer way, why don''cha?',1,0,274,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16982,1,'The Highborne have returned, and with them spellcraft lost to the world for centuries.$B$BDo you have something for me to examine?','The Highborne have returned, and with them spellcraft lost to the world for centuries.$B$BDo you have something for me to examine?',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16983,1,'Arcane Reforgers can modify the magical effects of a item; this magically complex process is known simply as reforging.$B$BThrough reforging, a secondary attribute of any piece of weaponry, armor, or jewelry may be reduced in order to add an additional secondary attribute. In this manner one may customize their equipment to best match their role and skills.$B$BFor example, if an item afforded you a bonus to strike your enemies but you''d rather it made you attack more quickly, an Arcane Reforger could, for a price, reforge the item to have less Hit Rating but increase your Haste Rating.','Arcane Reforgers can modify the magical effects of a item; this magically complex process is known simply as reforging.$B$BThrough reforging, a secondary attribute of any piece of weaponry, armor, or jewelry may be reduced in order to add an additional secondary attribute. In this manner one may customize their equipment to best match their role and skills.$B$BFor example, if an item afforded you a bonus to strike your enemies but you''d rather it made you attack more quickly, an Arcane Reforger could, for a price, reforge the item to have less Hit Rating but increase your Haste Rating.',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(17085,1,'After the fall of the Burning Blade Clan, we blademasters swore to free ourselves and our people from demonic control.$B$BThis may be done, but my honor remains unsatisfied.$B$BI shall fight for the Horde - and train other warriors to do so - until I die gloriously in battle. This is the only path I may tread.','After the fall of the Burning Blade Clan, we blademasters swore to free ourselves and our people from demonic control.$B$BThis may be done, but my honor remains unsatisfied.$B$BI shall fight for the Horde - and train other warriors to do so - until I die gloriously in battle. This is the only path I may tread.',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(17125,1,'I can teach you the basics of any gathering or production profession, but that''s all.$B$BTo learn more than an apprentice''s skills, you''ll need to visit a specialist dedicated to only one profession.$B$BYou can learn up to two professions: Two gathering, two production, or one of each.$B$BSecondary skills like Archaeology, Cooking, First Aid, and Fishing don''t count towards your two professions; you can learn as many of those as you like.','I can teach you the basics of any gathering or production profession, but that''s all.$B$BTo learn more than an apprentice''s skills, you''ll need to visit a specialist dedicated to only one profession.$B$BYou can learn up to two professions: Two gathering, two production, or one of each.$B$BSecondary skills like Archaeology, Cooking, First Aid, and Fishing don''t count towards your two professions; you can learn as many of those as you like.',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(17176,1,'For too long we have ignored the secrets of the Arcane.$B$BSadly, they will remain a secret to you.','For too long we have ignored the secrets of the Arcane.$B$BSadly, they will remain a secret to you.',1,0,274,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(17180,1,'Sorry, $c. $B$BYour grasp of the arcane isn''t strong enough to understand portal magic.','Sorry, $c. $B$BYour grasp of the arcane isn''t strong enough to understand portal magic.',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(17499,1,'You be here ta learn fishin'', mon? Or maybe ta buy some tings for it?','You be here ta learn fishin'', mon? Or maybe ta buy some tings for it?',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(17647,1,'Hail, $N.  We''re in need of your assistance.','',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1);

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=5854 AND `text_id`=7017;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5854,7017);
DELETE FROM `gossip_menu` WHERE `entry`=6573 AND `text_id`=7821;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6573,7821);
DELETE FROM `gossip_menu` WHERE `entry`=6570 AND `text_id`=7869;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6570,7869);
DELETE FROM `gossip_menu` WHERE `entry`=7437 AND `text_id`=7903;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7437,7903);
DELETE FROM `gossip_menu` WHERE `entry`=6939 AND `text_id`=8228;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6939,8228);
DELETE FROM `gossip_menu` WHERE `entry`=6940 AND `text_id`=8229;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6940,8229);
DELETE FROM `gossip_menu` WHERE `entry`=6942 AND `text_id`=8232;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6942,8232);
DELETE FROM `gossip_menu` WHERE `entry`=7116 AND `text_id`=8374;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7116,8374);
DELETE FROM `gossip_menu` WHERE `entry`=7117 AND `text_id`=8378;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7117,8378);
DELETE FROM `gossip_menu` WHERE `entry`=7141 AND `text_id`=8403;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7141,8403);
DELETE FROM `gossip_menu` WHERE `entry`=7154 AND `text_id`=8418;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7154,8418);
DELETE FROM `gossip_menu` WHERE `entry`=7155 AND `text_id`=8419;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7155,8419);
DELETE FROM `gossip_menu` WHERE `entry`=7156 AND `text_id`=8421;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7156,8421);
DELETE FROM `gossip_menu` WHERE `entry`=7214 AND `text_id`=8504;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7214,8504);
DELETE FROM `gossip_menu` WHERE `entry`=7235 AND `text_id`=8535;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7235,8535);
DELETE FROM `gossip_menu` WHERE `entry`=7244 AND `text_id`=8552;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7244,8552);
DELETE FROM `gossip_menu` WHERE `entry`=7245 AND `text_id`=8556;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7245,8556);
DELETE FROM `gossip_menu` WHERE `entry`=7247 AND `text_id`=8558;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7247,8558);
DELETE FROM `gossip_menu` WHERE `entry`=7255 AND `text_id`=8575;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7255,8575);
DELETE FROM `gossip_menu` WHERE `entry`=7256 AND `text_id`=8576;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7256,8576);
DELETE FROM `gossip_menu` WHERE `entry`=7311 AND `text_id`=8678;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7311,8678);
DELETE FROM `gossip_menu` WHERE `entry`=7313 AND `text_id`=8682;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7313,8682);
DELETE FROM `gossip_menu` WHERE `entry`=7316 AND `text_id`=8684;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7316,8684);
DELETE FROM `gossip_menu` WHERE `entry`=7323 AND `text_id`=8698;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7323,8698);
DELETE FROM `gossip_menu` WHERE `entry`=7324 AND `text_id`=8699;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7324,8699);
DELETE FROM `gossip_menu` WHERE `entry`=7325 AND `text_id`=8700;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7325,8700);
DELETE FROM `gossip_menu` WHERE `entry`=7344 AND `text_id`=8755;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7344,8755);
DELETE FROM `gossip_menu` WHERE `entry`=7864 AND `text_id`=9630;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7864,9630);
DELETE FROM `gossip_menu` WHERE `entry`=7921 AND `text_id`=9700;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7921,9700);
DELETE FROM `gossip_menu` WHERE `entry`=8098 AND `text_id`=10011;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8098,10011);
DELETE FROM `gossip_menu` WHERE `entry`=8376 AND `text_id`=10451;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8376,10451);
DELETE FROM `gossip_menu` WHERE `entry`=8380 AND `text_id`=10456;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8380,10456);
DELETE FROM `gossip_menu` WHERE `entry`=8732 AND `text_id`=11049;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8732,11049);
DELETE FROM `gossip_menu` WHERE `entry`=8733 AND `text_id`=11055;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8733,11055);
DELETE FROM `gossip_menu` WHERE `entry`=9142 AND `text_id`=12370;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9142,12370);
DELETE FROM `gossip_menu` WHERE `entry`=10991 AND `text_id`=15284;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10991,15284);
DELETE FROM `gossip_menu` WHERE `entry`=11902 AND `text_id`=16703;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11902,16703);
DELETE FROM `gossip_menu` WHERE `entry`=9420 AND `text_id`=12666;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9420,12666);

-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=16271;
UPDATE `creature_template` SET `gossip_menu_id`=5854 WHERE `entry`=16676;
UPDATE `creature_template` SET `gossip_menu_id`=6570 WHERE `entry`=15281;
UPDATE `creature_template` SET `gossip_menu_id`=6573 WHERE `entry`=15301;
UPDATE `creature_template` SET `gossip_menu_id`=6647 WHERE `entry`=16275;
UPDATE `creature_template` SET `gossip_menu_id`=6650 WHERE `entry`=16279;
UPDATE `creature_template` SET `gossip_menu_id`=6652 WHERE `entry`=16270;
UPDATE `creature_template` SET `gossip_menu_id`=6939 WHERE `entry`=15924;
UPDATE `creature_template` SET `gossip_menu_id`=6940 WHERE `entry`=15403;
UPDATE `creature_template` SET `gossip_menu_id`=6942 WHERE `entry`=15951;
UPDATE `creature_template` SET `gossip_menu_id`=7116 WHERE `entry`=16144;
UPDATE `creature_template` SET `gossip_menu_id`=7117 WHERE `entry`=16147;
UPDATE `creature_template` SET `gossip_menu_id`=7141 WHERE `entry`=15416;
UPDATE `creature_template` SET `gossip_menu_id`=7154 WHERE `entry`=16196;
UPDATE `creature_template` SET `gossip_menu_id`=7155 WHERE `entry`=16183;
UPDATE `creature_template` SET `gossip_menu_id`=7156 WHERE `entry`=16210;
UPDATE `creature_template` SET `gossip_menu_id`=7214 WHERE `entry`=16362;
UPDATE `creature_template` SET `gossip_menu_id`=7235 WHERE `entry`=16397;
UPDATE `creature_template` SET `gossip_menu_id`=7244 WHERE `entry`=16443;
UPDATE `creature_template` SET `gossip_menu_id`=7245 WHERE `entry`=16444;
UPDATE `creature_template` SET `gossip_menu_id`=7247 WHERE `entry`=15942;
UPDATE `creature_template` SET `gossip_menu_id`=7255 WHERE `entry`=15398;
UPDATE `creature_template` SET `gossip_menu_id`=7256 WHERE `entry`=15400;
UPDATE `creature_template` SET `gossip_menu_id`=7311 WHERE `entry`=16263;
UPDATE `creature_template` SET `gossip_menu_id`=7313 WHERE `entry`=16860;
UPDATE `creature_template` SET `gossip_menu_id`=7316 WHERE `entry`=16862;
UPDATE `creature_template` SET `gossip_menu_id`=7323 WHERE `entry`=16924;
UPDATE `creature_template` SET `gossip_menu_id`=7324 WHERE `entry`=15397;
UPDATE `creature_template` SET `gossip_menu_id`=7325 WHERE `entry`=15401;
UPDATE `creature_template` SET `gossip_menu_id`=7344 WHERE `entry`=15399;
UPDATE `creature_template` SET `gossip_menu_id`=7346 WHERE `entry`=17056;
UPDATE `creature_template` SET `gossip_menu_id`=7437 WHERE `entry`=16647;
UPDATE `creature_template` SET `gossip_menu_id`=7524 WHERE `entry`=16160;
UPDATE `creature_template` SET `gossip_menu_id`=7524 WHERE `entry`=16161;
UPDATE `creature_template` SET `gossip_menu_id`=7524 WHERE `entry`=16366;
UPDATE `creature_template` SET `gossip_menu_id`=7524 WHERE `entry`=16367;
UPDATE `creature_template` SET `gossip_menu_id`=7566 WHERE `entry`=16646;
UPDATE `creature_template` SET `gossip_menu_id`=7566 WHERE `entry`=16648;
UPDATE `creature_template` SET `gossip_menu_id`=7864 WHERE `entry`=18947;
UPDATE `creature_template` SET `gossip_menu_id`=7921 WHERE `entry`=19169;
UPDATE `creature_template` SET `gossip_menu_id`=8098 WHERE `entry`=16264;
UPDATE `creature_template` SET `gossip_menu_id`=8376 WHERE `entry`=15501;
UPDATE `creature_template` SET `gossip_menu_id`=8380 WHERE `entry`=19775;
UPDATE `creature_template` SET `gossip_menu_id`=8732 WHERE `entry`=16688;
UPDATE `creature_template` SET `gossip_menu_id`=8733 WHERE `entry`=16642;
UPDATE `creature_template` SET `gossip_menu_id`=9142 WHERE `entry`=17718;
UPDATE `creature_template` SET `gossip_menu_id`=9821 WHERE `entry`=16185;
UPDATE `creature_template` SET `gossip_menu_id`=10181 WHERE `entry`=16261;
UPDATE `creature_template` SET `gossip_menu_id`=10948 WHERE `entry`=38043;
UPDATE `creature_template` SET `gossip_menu_id`=10991 WHERE `entry`=38295;
UPDATE `creature_template` SET `gossip_menu_id`=11902 WHERE `entry`=15278;
UPDATE `creature_template` SET `gossip_menu_id`=12670 WHERE `entry`=16649;
UPDATE `creature_template` SET `gossip_menu_id`=9420 WHERE `entry`=26647;

-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7244,7245,7256,7311,7313,7524,7864,8098,8376,8380,8732,8733) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7256,7324,7524) AND `id` IN (1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7324) AND `id` IN (2);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(7244,0,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(7245,0,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(7256,0,3, 'I wish to learn more about blacksmithing.',5,16,0,0,0,0,0, ''),
(7256,1,1, 'May I see your wares?',3,128,0,0,0,0,0, ''),
(7311,0,1, 'May I see your wares?',3,128,0,0,0,0,0, ''),
(7313,0,1, 'Let me see what hatchlings you have for sale.',3,128,0,0,0,0,0, ''),
(7324,2,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(7324,1,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(7524,0,1, 'I want to browse your goods.',3,128,0,0,0,0,0, ''),
(7524,1,3, 'Train me.',5,16,0,0,0,0,0, ''),
(7864,0,1, 'I would like to buy from you.',3,128,0,0,0,0,0, ''),
(8098,0,1, 'I wish to purchase one of these creatures.',3,128,0,0,0,0,0, ''),
(8376,0,3, 'Train me.',5,16,0,0,0,0,0, ''),
(8380,0,3, 'Train me.',5,16,0,0,0,0,0, ''),
(8732,0,3, 'I would like to train.',5,16,0,0,0,0,0, ''),
(8733,0,3, 'I would like to train.',5,16,0,0,0,0,0, '');

-- Insert npc_text from sniff
DELETE FROM `npc_text` WHERE `ID` IN (7821,16703);
INSERT INTO `npc_text` (`ID`,`prob0`,`text0_0`,`text0_1`,`lang0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`prob1`,`text1_0`,`text1_1`,`lang1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`prob2`,`text2_0`,`text2_1`,`lang2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`prob3`,`text3_0`,`text3_1`,`lang3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`prob4`,`text4_0`,`text4_1`,`lang4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`prob5`,`text5_0`,`text5_1`,`lang5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`prob6`,`text6_0`,`text6_1`,`lang6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`prob7`,`text7_0`,`text7_1`,`lang7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(7821,1,'','Ah, $N - it is good to see you again.  I trust your affairs go well.',0,0,2,0,1,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16703,1,'','$N!  I hope you''re ready to get to work, because there is much for you to do here on Sunstrider Isle.$B$BEver since the destruction of the Sunwell by Arthas and the Scourge, we have been a race adrift on a sea of uncertainty.  We teeter on the edge of oblivion.  This will change, $c, and you will learn and aid our recovery at the same time.$B$BThe Outland awaits us!',0,0,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1);


-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=7436 AND `text_id`=9005;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7436,9005);
-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=7436 WHERE `entry`=16268;
-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7436 AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(7436,0,1, 'May I see your wares?',3,128,0,0,0,0,0, '');

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=9985 AND `text_id`=13839;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9985,13839);
-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=9985 WHERE `entry`=26905;
-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9985 AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9985,0,3, 'Train me.',5,16,0,0,0,0,0, '');

-- Conversation between Highlord Tirion Fordring & The Ebon Watcher minor text update from sniff
UPDATE `creature_text` SET `text`= 'The Lich King is unlike any foe that you have ever faced, Highlord. Though you bested him upon the holy ground of Light''s Hope Chapel, you tread now upon his domain.$B' WHERE `entry`=30377 AND `groupid`=1;
UPDATE `creature_text` SET `text`= 'You cannot win. Not like this...$B' WHERE `entry`=30377 AND `groupid`=2;
UPDATE `creature_text` SET `text`= 'The Lich King knows your boundaries, Highlord. He knows that you will not fire on your own men. Do you not understand? He has no boundaries. No rules to abide. $B' WHERE `entry`=30377 AND `groupid`=8;
UPDATE `creature_text` SET `text`= 'Then you have lost, Highlord.$B' WHERE `entry`=30377 AND `groupid`=9;

-- Fix some text for quest 9164 "Captives at Deatholme" now that I can properly parse the sniffs
UPDATE `creature_text` SET `text`= 'Th... thank you.  I thought I was going to die.' WHERE `entry`=16206;
UPDATE `gossip_menu_option` SET `option_text`= 'A bit ungrateful, aren''t we?  The way out is clear, flee quickly!' WHERE `menu_id`=7179;
UPDATE `gossip_menu_option` SET `option_text`= 'You''re free to go now.  The way out is safe.' WHERE `menu_id`=7176;
UPDATE `gossip_menu_option` SET `option_text`= 'You''re free to go now.  The way out is safe.' WHERE `menu_id`=7186;
DELETE FROM `disables` WHERE `sourceType` = 4 AND `entry` IN (7625,6446,7628);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (6446,7625) AND `type`=11;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7628 AND `type`!=0;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES 
(6446,11,0,0,'achievement_bg_sa_drop_it'),
(7625,11,0,0,'achievement_bg_sa_artillery_veteran'),
(7628,11,0,0,'achievement_bg_sa_artillery_expert'),
(7628,3,607,0,'');
DELETE FROM `spell_bonus_data` WHERE `entry`=31707;
INSERT INTO `spell_bonus_data` (`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES
(31707,0.8333,0,0,0, 'Mage - Water Elemental Waterbolt');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7628 AND `type`=3;
DELETE FROM `spell_script_names`  WHERE `ScriptName` IN ('spell_generic_clone', 'spell_generic_clone_weapon');
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(45785, 'spell_generic_clone'),
(49889, 'spell_generic_clone'),
(50218, 'spell_generic_clone'),
(51719, 'spell_generic_clone'),
(57528, 'spell_generic_clone'),
(69828, 'spell_generic_clone'),
(41055, 'spell_generic_clone_weapon'),
(63416, 'spell_generic_clone_weapon'),
(69891, 'spell_generic_clone_weapon'),
(45206, 'spell_generic_clone_weapon'),
(69892, 'spell_generic_clone_weapon'),
(57593, 'spell_generic_clone_weapon');




/*-- Spawns for Crystalweb Cavern
-- Snowblind Digger
SET @GUID=152040; -- Need 57
DELETE FROM `creature` WHERE `id` IN (29407,29409,29412,29413);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(117812,29413,571,1,1,0,0,6304.011,-1012.982,413.2471,2.827433,300,0,0,1,0,0,0,0,0,0), -- Updated Spawn with Sniffed Position
(117813,29413,571,1,1,0,0,6447,-1004.23,433.973,3.21141,300,0,0,11001,0,0,0,0,0,0),
(117814,29413,571,1,1,0,0,6694.82,-1049.95,408.713,4.79241,300,0,0,11001,0,0,0,0,0,0),
(@GUID+0,29413,571,1,1,0,0,6549.784,-1268.647,398.4628,4.380776,300,0,0,1,0,0,0,0,0,0),
(@GUID+1,29413,571,1,1,0,0,6594.707,-1254.841,396.956,0.1745329,300,0,0,1,0,0,0,0,0,0),
(@GUID+2,29413,571,1,1,0,0,6577.69,-1234.807,401.2381,1.919862,300,0,0,1,0,0,0,0,0,0),
(@GUID+3,29413,571,1,1,0,0,6505.765,-1010.692,437.3392,2.146755,300,0,0,1,0,0,0,0,0,0),
(@GUID+4,29413,571,1,1,0,0,6617.206,-1275.861,394.5572,0.03490658,300,0,0,1,0,0,0,0,0,0),
(@GUID+5,29413,571,1,1,0,0,6607.412,-1271.927,395.044,4.310963,300,0,0,1,0,0,0,0,0,0),
(@GUID+6,29413,571,1,1,0,0,6618.625,-1289.63,395.3728,0.2617994,300,0,0,1,0,0,0,0,0,0),
(@GUID+7,29413,571,1,1,0,0,6598.191,-1286.431,394.4492,0.3316126,300,0,0,1,0,0,0,0,0,0),
(@GUID+8,29413,571,1,1,0,0,6695.96,-1041.137,412.2228,-1.350969,300,0,0,1,0,0,0,0,0,0),
(@GUID+9,29413,571,1,1,0,0,6598.955,-1012.957,429.1754,6.230914,300,0,0,1,0,0,0,0,0,0),
(@GUID+10,29413,571,1,1,0,0,6550.22,-1296.998,395.8197,5.305801,300,0,0,1,0,0,0,0,0,0),
(@GUID+11,29413,571,1,1,0,0,6562.411,-1279.173,394.7112,4.572762,300,0,0,1,0,0,0,0,0,0),
(@GUID+12,29413,571,1,1,0,0,6582.667,-1295.584,396.0742,3.769911,300,0,0,1,0,0,0,0,0,0),
(@GUID+13,29413,571,1,1,0,0,6572.444,-1251.02 ,397.3442,1.40402,300,0,0,1,0,0,0,0,0,0),
(@GUID+14,29413,571,1,1,0,0,6554.481,-1243.797,398.5085,4.45059,300,0,0,1,0,0,0,0,0,0),
(@GUID+15,29413,571,1,1,0,0,6671.676,-1297.581,395.9203,0.1032045,300,0,0,1,0,0,0,0,0,0),
-- Crystalweb Spitter
(117781,29412,571,1,1,26223,0,6519.95,-1027.48,433.737,0.175263,300,0,0,11379,0,0,0,0,0,0),
(117782,29412,571,1,1,26223,0,6742.73,-1543.87,365.316,2.23402,300,0,0,11379,0,0,0,0,0,0),
(117783,29412,571,1,1,26223,0,6669.02,-1082.85,400.338,5.49205,300,5,0,11379,0,0,1,0,0,0),
(@GUID+16,29412,571,1,1,0,0,6685.524,-1304.507,395.6901,1.574838,300,0,0,1,0,0,0,0,0,0),
(@GUID+17,29412,571,1,1,0,0,6585.083,-1121.508,410.5753,5.966588,300,0,0,1,0,0,0,0,0,0),
(@GUID+18,29412,571,1,1,0,0,6691.913,-1491.667,377.6763,1.820203,300,0,0,1,0,0,0,0,0,0),
(@GUID+19,29412,571,1,1,0,0,6658.331,-1299.063,396.7297,2.80998,300,0,0,1,0,0,0,0,0,0),
(@GUID+20,29412,571,1,1,0,0,6645.377,-1164.97,399.7607,5.235988,300,0,0,1,0,0,0,0,0,0),
(@GUID+21,29412,571,1,1,0,0,6665.021,-1076.323,402.5284,4.24115,300,0,0,1,0,0,0,0,0,0),
(@GUID+22,29412,571,1,1,0,0,6706.143,-1073.628,391.6251,0.781437,300,0,0,1,0,0,0,0,0,0),
(@GUID+23,29412,571,1,1,0,0,6638.069,-1253.051,395.669,4.049164,300,0,0,1,0,0,0,0,0,0),
(@GUID+24,29412,571,1,1,0,0,6599.83,-1024.043,428.5868,3.237097,300,0,0,1,0,0,0,0,0,0),
(@GUID+25,29412,571,1,1,0,0,6538.664,-1043.781,428.86,0.1047198,300,0,0,1,0,0,0,0,0,0),
(@GUID+26,29412,571,1,1,0,0,6684.955,-1351.482,394.3488,6.021386,300,0,0,1,0,0,0,0,0,0),
(@GUID+27,29412,571,1,1,0,0,6712.782,-1482.948,377.3944,1.758111,300,0,0,1,0,0,0,0,0,0),
(@GUID+28,29412,571,1,1,0,0,6615.511,-1116.219,411.492,4.632286,300,0,0,1,0,0,0,0,0,0),
-- ---------------
-- -- Garm Cave --
-- ---------------
-- Snowblind Devotee
(117305,29407,571,1,1,27185,0,6297.12,-1425.6,426.168,2.28638,300,0,0,11001,3643,0,0,0,0,0),
(117306,29407,571,1,1,27174,0,6297.26,-1406.99,425.576,3.66519,300,0,0,11001,3643,0,0,0,0,0),
(117307,29407,571,1,1,27174,0,6278.49,-1425.38,425.555,1.02974,300,0,0,11001,3643,0,0,0,0,0),
(117308,29407,571,1,1,27174,0,6292.41,-1374.15,425.467,1.57504,300,5,0,11001,3643,0,1,0,0,0),
(117309,29407,571,1,1,27174,0,6293.24,-1367.46,425.361,3.45575,300,0,0,11001,3643,0,0,0,0,0),
(117310,29407,571,1,1,27185,0,6310.95,-1762.18,457.459,1.51755,300,5,0,11001,3643,0,1,0,0,0),
(@GUID+29,29407,571,1,1,0,0,6434.24,-1737.51,432.217,5.46288,300,0,0,1,0,0,0,0,0,0),
(@GUID+30,29407,571,1,1,0,0,6319.8,-1661.22,457.449,0.837758,300,0,0,1,0,0,0,0,0,0),
(@GUID+31,29407,571,1,1,0,0,6289.97,-1599.25,425.883,4.57276,300,0,0,1,0,0,0,0,0,0),
(@GUID+32,29407,571,1,1,0,0,6483.06,-1634.21,464.794,2.37365,300,0,0,1,0,0,0,0,0,0),
(@GUID+33,29407,571,1,1,0,0,6475.38,-1631.87,464.816,0.279253,300,0,0,1,0,0,0,0,0,0),
(@GUID+34,29407,571,1,1,0,0,6458.55,-1661.17,434.631,4.08083,300,0,0,1,0,0,0,0,0,0),
(@GUID+35,29407,571,1,1,0,0,6518.89,-1646.07,426.105,5.11381,300,0,0,1,0,0,0,0,0,0),
(@GUID+36,29407,571,1,1,0,0,6273.52,-1604.35,424.533,5.55015,300,0,0,1,0,0,0,0,0,0),
(@GUID+37,29407,571,1,1,0,0,6425.83,-1670.41,471.519,2.25148,300,0,0,1,0,0,0,0,0,0),
(@GUID+38,29407,571,1,1,0,0,6428.22,-1705.45,434.128,0.488692,300,0,0,1,0,0,0,0,0,0),
(@GUID+39,29407,571,1,1,0,0,6541.62,-1654.47,453.662,5.96903,300,0,0,1,0,0,0,0,0,0),
(@GUID+40,29407,571,1,1,0,0,6403.41,-1717.79,431.839,4.60767,300,0,0,1,0,0,0,0,0,0),
(@GUID+41,29407,571,1,1,0,0,6441.19,-1758.54,432.217,3.26377,300,0,0,1,0,0,0,0,0,0),
(@GUID+42,29407,571,1,1,0,0,6471.03,-1753.78,432.738,1.18682,300,0,0,1,0,0,0,0,0,0),
(@GUID+43,29407,571,1,1,0,0,6459.88,-1762.25,432.217,0.925025,300,0,0,1,0,0,0,0,0,0),
(@GUID+44,29407,571,1,1,0,0,6414.89,-1738.78,432.217,0.401426,300,0,0,1,0,0,0,0,0,0),
(@GUID+45,29407,571,1,1,0,0,6408.04,-1729.23,432.211,2.47837,300,0,0,1,0,0,0,0,0,0),
(@GUID+46,29407,571,1,1,0,0,6514.17,-1749.59,436.202,5.86431,300,0,0,1,0,0,0,0,0,0),
(@GUID+47,29407,571,1,1,0,0,6519.56,-1747.13,436.252,4.41568,300,0,0,1,0,0,0,0,0,0),
-- Garm Watcher
(117614,29409,571,1,1,24842,0,6381.32,-1648.28,420.067,1.16937,300,5,0,11770,0,0,1,0,0,0),
(@GUID+48,29409,571,1,1,0,0,6479.16,-1642.7,465.234,1.20397,300,0,0,1,0,0,0,0,0,0),
(@GUID+49,29409,571,1,1,0,0,6410.43,-1613.44,421.331,3.10776,300,0,0,1,0,0,0,0,0,0),
(@GUID+50,29409,571,1,1,0,0,6446.13,-1641.86,418.539,3.43956,300,0,0,1,0,0,0,0,0,0),
(@GUID+51,29409,571,1,1,0,0,6480.65,-1717.4,434.573,2.00713,300,0,0,1,0,0,0,0,0,0),
(@GUID+52,29409,571,1,1,0,0,6503.1,-1677.39,432.951,3.56047,300,0,0,1,0,0,0,0,0,0),
(@GUID+53,29409,571,1,1,0,0,6316.56,-1528.47,428.335,1.8326,300,0,0,1,0,0,0,0,0,0),
(@GUID+54,29409,571,1,1,0,0,6285.07,-1554.58,423.336,2.21657,300,0,0,1,0,0,0,0,0,0),
(@GUID+55,29409,571,1,1,0,0,6544.34,-1675.45,452.674,3.63029,300,0,0,1,0,0,0,0,0,0),
(@GUID+56,29409,571,1,1,0,0,6429.06,-1736.25,479.353,0.855211,300,0,0,1,0,0,0,0,0,0),
(@GUID+57,29409,571,1,1,0,0,6522.09,-1735.2,436.308,0.615843,300,0,0,1,0,0,0,0,0,0);
*/
-- Template updates
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry` IN (29413,29412); -- Snowblind Digger
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=29412; -- Crystalweb Spitter
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=29407; -- Snowblind Devotee
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|32,`speed_run`=1.19048 WHERE `entry`=29546; -- K3 Snow Runner
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=29618; -- Snowblind Follower
UPDATE `creature_template` SET `exp`=0,`unit_flags`=`unit_flags`|33554432,`speed_run`=1.19048 WHERE `entry`=29475; -- Improved Land Mine
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|32768,`speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=29409; -- Garm Watcher


-- Model data
UPDATE `creature_model_info` SET `bounding_radius`=0.372,`combat_reach`=0,`gender`=0 WHERE `modelid`=27183; -- Snowblind Digger
UPDATE `creature_model_info` SET `bounding_radius`=0.372,`combat_reach`=0,`gender`=0 WHERE `modelid`=27185; -- Snowblind Devotee
UPDATE `creature_model_info` SET `bounding_radius`=0.31,`combat_reach`=0,`gender`=0 WHERE `modelid`=27172; -- Snowblind Follower
UPDATE `creature_model_info` SET `bounding_radius`=0.372,`combat_reach`=0,`gender`=0 WHERE `modelid`=27181; -- Snowblind Follower
UPDATE `creature_model_info` SET `bounding_radius`=0.62,`combat_reach`=6,`gender`=0 WHERE `modelid`=24857; -- Garm Invader
UPDATE `creature_model_info` SET `bounding_radius`=0.62,`combat_reach`=6,`gender`=0 WHERE `modelid`=24842; -- Garm Watcher

-- Addon data for creature 29413 (Snowblind Digger)
DELETE FROM `creature_template_addon` WHERE `entry` IN (29413,29412,29407,29546,29618,29475,29619,29409);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29413,0,0,1,0, NULL), -- Snowblind Digger
(29412,0,0,1,0,NULL), -- Crystalweb Spitter
(29407,0,0,1,0, NULL), -- Snowblind Devotee
(29546,0,0,1,0, NULL), -- K3 Snow Runner.
(29618,0,0,1,0, NULL), -- Snowblind Follower
(29475,0,0,1,0, NULL), -- Improved Land Mine
(29619,0,0,1,0, NULL), -- Garm Invader
(29409,0,0,1,0, NULL); -- Garm Watcher

-- Camp Fires in the Cave
SET @OGUID=151892;
DELETE FROM `gameobject` WHERE `id` IN (192131,192130,192129);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@OGUID+0,192129,571,1,1,6601.13,-1285.09,394.554,-0.951203,0,0,-0.951203,0.889017,0,0,0),
(@OGUID+1,192130,571,1,1,6606.31,-1273.52,394.595,-0.854712,0.0864091,0.0250797,-0.416438,0.904701,0,0,0),
(@OGUID+2,192131,571,1,1,6562.62,-1285.12,394.856,-0.95405,-0.0144057,0.0048542,-0.459116,0.888246,0,0,0);







/*SET @GUID=152032; -- Need 8
DELETE FROM `creature` WHERE `id`=33429;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,33429,571,1,256,0,0,6253.47,2263.21,244.456,0.488692,120,0,0,1,0,0,0,0,0,0),
(@GUID+1,33429,571,1,256,0,0,6217.16,2252.59,496.038,0.488692,120,0,0,1,0,0,0,0,0,0),
(@GUID+2,33429,571,1,256,0,0,6234.1,2301.56,488.447,0.488692,120,0,0,1,0,0,0,0,0,0),
(@GUID+3,33429,571,1,256,0,0,6163.18,2231.77,506.981,0.488692,120,0,0,1,0,0,0,0,0,0),
(@GUID+4,33429,571,1,256,0,0,6172.18,2257.27,503.146,0.488692,120,0,0,1,0,0,0,0,0,0),
(@GUID+5,33429,571,1,256,0,0,6242.42,2246.47,491.941,0.56266,120,0,0,1,0,0,0,0,0,0),
(@GUID+6,33429,571,1,256,0,0,6202.35,2284.08,495.286,0.488692,120,0,0,1,0,0,0,0,0,0),
(@GUID+7,33429,571,1,256,0,0,6145.68,2208.17,512.426,0.488692,120,0,0,1,0,0,0,0,0,0);
*/
-- Template updates for creature 33429 (Boneguard Lieutenant)
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=33429; -- Boneguard Lieutenant
-- Model data 29098 (creature 33429 (Boneguard Lieutenant))
UPDATE `creature_model_info` SET `bounding_radius`=0.459,`combat_reach`=2.25,`gender`=0 WHERE `modelid`=29098; -- Boneguard Lieutenant
-- Addon data for creature 33429 (Boneguard Lieutenant)
DELETE FROM `creature_template_addon` WHERE `entry`=33429;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(33429,25678,0,1,0,NULL); -- Boneguard Lieutenant





/*SET @GUID := 152098; 

DELETE FROM `creature` WHERE `id` IN (33211,33499,24495,28602,26266,29563,29695,29719,29720,29747,29790,24910);
INSERT INTO creature (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES 
-- Lake Frog
(@GUID  ,33211,571,1,1,0,0,3714.916,-4303.659,182.632217,5.098984,120,0,0,1,0,0,0),
(@GUID+1,33211,571,1,1,0,0,3727.9043,-4302.23926,182.257217,3.08221,120,0,0,1,0,0,0),
(@GUID+2,33211,571,1,1,0,0,3745.24487,-4297.097,182.389908,2.715872,120,0,0,1,0,0,0),
(@GUID+3,33211,571,1,1,0,0,3756.47559,-4301.28857,182.095047,2.807836,120,0,0,1,0,0,0),
(@GUID+4,33211,571,1,1,0,0,3771.68848,-4302.969,185.325317,2.31952834,120,0,0,1,0,0,0),
(@GUID+5,33211,571,1,1,0,0,3772.791,-4310.51367,181.825317,0.8431596,120,0,0,1,0,0,0),
(@GUID+6,33211,571,1,1,0,0,3775.21948,-4321.11475,180.200317,3.22582984,120,0,0,1,0,0,0),
(@GUID+7,33211,571,1,1,0,0,3788.88062,-4324.47852,183.075317,5.38701057,120,0,0,1,0,0,0),
(@GUID+8,33211,571,1,1,0,0,3794.85938,-4332.317,181.450317,1.17659271,120,0,0,1,0,0,0),
(@GUID+9,33211,571,1,1,0,0,3802.84766,-4337.217,182.431076,6.150771,120,0,0,1,0,0,0),
(@GUID+10,33211,571,1,1,0,0,3806.70459,-4355.509,181.681076,1.17746329,120,0,0,1,0,0,0),
(@GUID+11,33211,571,1,1,0,0,3809.69434,-4349.24,182.556076,5.637143,120,0,0,1,0,0,0),
(@GUID+12,33211,571,1,1,0,0,3813.42139,-4361.893,181.931076,2.17208815,120,0,0,1,0,0,0),
(@GUID+13,33211,571,1,1,0,0,3814.98438,-4356.101,183.181076,2.89564323,120,0,0,1,0,0,0),
-- Skelettal Woodcutter
(@GUID+14,33499,571,1,1,0,0,5396.5166,375.7173,170.753632,2.53072739,120,0,0,1,0,0,0),
(@GUID+15,33499,571,1,1,0,0,5410.31152,369.325531,167.654877,3.26376557,120,0,0,1,0,0,0),
(@GUID+16,33499,571,1,1,0,0,5411.861,354.3646,166.12265,5.75958633,120,0,0,1,0,0,0),
(@GUID+17,33499,571,1,1,0,0,5416.46338,439.1525,170.43544,3.42084527,120,0,0,1,0,0,0),
(@GUID+18,33499,571,1,1,0,0,5426.99951,440.918182,169.2432,2.565634,120,0,0,1,0,0,0),
(@GUID+19,33499,571,1,1,0,0,5427.884,360.650848,163.194031,5.078908,120,0,0,1,0,0,0),
(@GUID+20,33499,571,1,1,0,0,5458.528,424.540039,163.886261,0.2268928,120,0,0,1,0,0,0),
(@GUID+21,33499,571,1,1,0,0,5469.51074,374.17688,158.1148,4.20624352,120,0,0,1,0,0,0),
-- Blix Fixwidget
(@GUID+22,24495,1,1,1,0,0,1174.58008,-4292.92139,21.3573341,6.24827862,120,0,0,1,0,0,0), -- Only during Brewfest!
-- Death's Hand Acolyte
(@GUID+23,28602,1,1,1,0,0,-6104.96533,-1243.60107,-143.192078,3.12413931,120,0,0,1,0,0,0),
(@GUID+24,28602,1,1,1,0,0,-6121.083,-1241.73962,-143.1921,3.19395256,120,0,0,1,0,0,0),
-- Heigarr the Horrible
(@GUID+25,26266,571,1,1,0,0,2711.477,4684.87061,2.576662,-2.87749,120,0,0,1,0,0,0), -- Spawns via script???
-- Injured Icemaw Matriarch
(@GUID+26,29563,571,1,2,0,0,7335.38135,-2055.097,764.358459,3.36848545,120,0,0,1,0,0,0), -- PHASEMASK = 0x00000002
-- Tracker Thulin
(@GUID+27,29695,571,1,1,0,0,7313.95752,-1611.87976,944.595459,1.79768908,120,0,0,1,0,0,0),
-- Morbid Carcass PHASEMASK '0x00000002'
(@GUID+28,29719,571,1,2,0,0,8249.877,2766.00684,641.9236,2.84488654,120,0,0,1,0,0,0), 
(@GUID+29,29719,571,1,2,0,0,8251.455,2788.82275,641.9236,3.159046,120,0,0,1,0,0,0),
(@GUID+30,29719,571,1,2,0,0,8277.752,2676.89429,689.776733,2.5395987,120,0,0,1,0,0,0),
(@GUID+31,29719,571,1,2,0,0,8312.651,2687.84644,689.776733,1.71902692,120,0,0,1,0,0,0),
(@GUID+32,29719,571,1,2,0,0,8333.677,2713.59741,658.5447,1.27409029,120,0,0,1,0,0,0),
(@GUID+33,29719,571,1,2,0,0,8347.788,2669.8252,689.776733,0.123821385,120,0,0,1,0,0,0),
(@GUID+34,29719,571,1,2,0,0,8353.299,2769.45532,656.0902,4.17133665,120,0,0,1,0,0,0),
(@GUID+35,29719,571,1,2,0,0,8373.952,2828.15039,717.741638,2.66342187,120,0,0,1,0,0,0),
(@GUID+36,29719,571,1,2,0,0,8419.114,2731.20874,656.828064,3.8397243,120,0,0,1,0,0,0),
(@GUID+37,29719,571,1,2,0,0,8419.519,2697.39771,760.0408,4.81710863,120,0,0,1,0,0,0),
(@GUID+38,29719,571,1,2,0,0,8424.577,2652.73364,759.9575,1.02128124,120,0,0,1,0,0,0),
(@GUID+39,29719,571,1,2,0,0,8439.591,2734.11157,759.9575,4.00091362,120,0,0,1,0,0,0),
(@GUID+40,29719,571,1,2,0,0,8481.104,2684.45435,652.436646,2.75762,120,0,0,1,0,0,0),
(@GUID+41,29719,571,1,2,0,0,8485.137,2563.694,759.9575,0.482697248,120,0,0,1,0,0,0),
(@GUID+42,29719,571,1,2,0,0,8551.035,2716.2085,652.3534,0.739110649,120,0,0,1,0,0,0),
(@GUID+43,29719,571,1,2,0,0,8576.94,2706.49927,652.3534,0.875271261,120,0,0,1,0,0,0),
(@GUID+44,29719,571,1,2,0,0,8603.393,2743.799,759.9575,2.06062126,120,0,0,1,0,0,0),
(@GUID+45,29719,571,1,2,0,0,8614.454,2711.10767,652.4367,3.52556515,120,0,0,1,0,0,0),
(@GUID+46,29719,571,1,2,0,0,8626.026,2682.54761,764.3245,3.37955,120,0,0,1,0,0,0),
-- Vault Geist PHASEMASK '0x00000002'
(@GUID+47,29720,571,1,2,0,0,8271.127,2722.98315,647.9443,4.702879,120,0,0,1,0,0,0),
(@GUID+48,29720,571,1,2,0,0,8313.714,2730.06567,666.274048,1.41371667,120,0,0,1,0,0,0),
(@GUID+49,29720,571,1,2,0,0,8323.991,2775.6377,655.4387,0.820304751,120,0,0,1,0,0,0),
(@GUID+50,29720,571,1,2,0,0,8332.92,2771.744,655.195068,4.373434,120,0,0,1,0,0,0),
(@GUID+51,29720,571,1,2,0,0,8357.752,2723.99731,662.515747,1.15191734,120,0,0,1,0,0,0),
(@GUID+52,29720,571,1,2,0,0,8404.075,2751.15625,666.435547,3.59537816,120,0,0,1,0,0,0),
(@GUID+53,29720,571,1,2,0,0,8405.231,2798.09473,717.7043,2.73629141,120,0,0,1,0,0,0),
(@GUID+54,29720,571,1,2,0,0,8413.143,2643.30151,760.040833,3.281219,120,0,0,1,0,0,0),
(@GUID+55,29720,571,1,2,0,0,8439.822,2744.45386,759.9607,5.875154,120,0,0,1,0,0,0),
(@GUID+56,29720,571,1,2,0,0,8477.97,2558.73364,759.9575,5.86126,120,0,0,1,0,0,0),
(@GUID+57,29720,571,1,2,0,0,8497.8,2665.35474,653.9178,1.16937053,120,0,0,1,0,0,0),
(@GUID+58,29720,571,1,2,0,0,8503.94,2690.78564,653.9437,2.72271371,120,0,0,1,0,0,0),
(@GUID+59,29720,571,1,2,0,0,8518.637,2650.9563,653.9734,2.72271371,120,0,0,1,0,0,0),
(@GUID+60,29720,571,1,2,0,0,8525.105,2553.115,759.9575,2.747424,120,0,0,1,0,0,0),
(@GUID+61,29720,571,1,2,0,0,8530.889,2679.33374,654.1611,2.72271371,120,0,0,1,0,0,0),
(@GUID+62,29720,571,1,2,0,0,8534.625,2547.15869,759.9575,0.228721559,120,0,0,1,0,0,0),
(@GUID+63,29720,571,1,2,0,0,8536.244,2602.14526,652.3534,1.24435687,120,0,0,1,0,0,0),
(@GUID+64,29720,571,1,2,0,0,8581.542,2581.62085,765.5597,2.29454422,120,0,0,1,0,0,0),
(@GUID+65,29720,571,1,2,0,0,8603.618,2744.43042,759.9575,5.913211,120,0,0,1,0,0,0),
(@GUID+66,29720,571,1,2,0,0,8640.634,2686.18237,760.040833,1.2566371,120,0,0,1,0,0,0),
-- The Ocular (Phase='0x00000002')
(@GUID+67,29747,571,1,2,0,0,8526.228,2665.08521,1045.03979,2.67035365,120,0,0,1,0,0,0),
-- The Ocular - Eye of Acherus Exterior Shell
(@GUID+68,29790,571,1,2,0,0,8526.228,2665.08521,1037.08838,2.67035365,120,0,0,1,0,0,0), 
-- Captain Ellis 
(@GUID+69,24910,571,1,1,0,0,101.368256,-3645.39087,21.6450329,4.067803,120,0,0,1,0,0,0);*/


UPDATE `creature_template` SET `baseattacktime`=2500,`faction_A`=974,`faction_H`=974,`rangeattacktime`= 1069547520,`scale`=1,`speed_run`=1.142857,`speed_walk`=1 WHERE entry = 29747;     -- The Ocular
UPDATE `creature_template` SET `baseattacktime`=2500,`faction_A`=974,`faction_H`=974,`rangeattacktime`=1073804739,`scale`=1,`speed_run`=1,`speed_walk`=1 WHERE entry = 29790; -- The Ocular - Eye of Archerus Exterior Shell
UPDATE `creature_template` SET `baseattacktime`=1000,`faction_A`=21,`faction_H`=21,`rangeattacktime`= 1055790203,`scale`=1,`speed_run`=1.428571,`speed_walk`=1 WHERE `entry`=29720; -- Vault Geist
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=21,`faction_H`=21,`rangeattacktime`= 1063256064,`scale`=1,`speed_run`=1.142857,`speed_walk`=1 WHERE `entry`=29719; -- Morbid Carcass
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=14,`faction_H`=14,`minlevel`=79,`maxlevel`=79,`scale`=1,`speed_run`=1.142857,`speed_walk`=1 WHERE `entry`=33499; -- Skelettal Woodcutter
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=35,`faction_H`=35,`minlevel`=1,`maxlevel`=1,`scale`=1,`speed_run`=1,`speed_walk`=1.6 WHERE `entry`= 33211; -- Lake Frog
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=775,`faction_H`=775,`minlevel`=65,`maxlevel`=65,`npcflag`=`npcflag`|1|2|128,`scale`=1,`speed_run`=1.142857,`speed_walk`=1,`unit_flags`=`unit_flags`|256|512|32768 WHERE `entry`=24495; -- Blix Fixwidget
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=2080,`faction_H`=2080,`minlevel`=77,`maxlevel`=78,`scale`=1,`speed_run`=1.142857,`speed_walk`=1 WHERE `entry`= 28602; -- Death's Hand Acolyte
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=1771,`faction_H`=1771,`minlevel`=70,`maxlevel`=70,`scale`=1,`speed_run`=1.071429,`speed_walk`=1 WHERE `entry`=26266; -- Heigarr the Horrible
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=35,`faction_H`=35,`minlevel`=80,`maxlevel`=80,`scale`=1,`speed_run`=1.142857,`speed_walk`=1 WHERE `entry`=29563; -- Injured Icemaw Matriarch
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=1954,`faction_H`=1954,`minlevel`=79,`maxlevel`=79,`scale`=1,`speed_run`=0.9920629,`speed_walk`=1 WHERE entry = 29695; -- Tracker Thulin
UPDATE `creature_template` SET `baseattacktime`=2000,`faction_A`=35,`faction_H`=35,`minlevel`=70,`maxlevel`=70,`npcflag`=`npcflag`|2,`scale`=1,`speed_run`=1.142857,`speed_walk`=1 WHERE entry = 24910; -- Captain Ellis







-- Obsidian Sanctum
-- Template updates for creature 31103 (Twilight Egg (Cosmetic))
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33554432 WHERE `entry`=31103; -- Twilight Egg (Cosmetic)
UPDATE `creature_template` SET `minlevel`=81,`maxlevel`=81 WHERE `entry`=30681; -- Onyx Blaze Mistress
UPDATE `creature_template` SET `minlevel`=81,`maxlevel`=81 WHERE `entry`=30453; -- Onyx Sanctum Guardian
UPDATE `creature_template` SET `exp`=0,`unit_flags`=`unit_flags`|33554432 WHERE `entry`=30648; -- Fire Cyclone
UPDATE `creature_model_info` SET `bounding_radius`=2.25,`combat_reach`=4.5,`gender`=0 WHERE `modelid`=27421; -- Shadron
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`exp`=2 WHERE `entry`=30616; -- Flame Tsunami

-- Model data
UPDATE `creature_model_info` SET `bounding_radius`=1.25,`combat_reach`=8.75,`gender`=0 WHERE `modelid`=27226; -- Onyx Brood General
UPDATE `creature_model_info` SET `bounding_radius`=3.75,`combat_reach`=3.75,`gender`=1 WHERE `modelid`=27227; -- Onyx Blaze Mistress
UPDATE `creature_model_info` SET `bounding_radius`=3.75,`combat_reach`=4.375,`gender`=0 WHERE `modelid`=12891; -- Onyx Flight Captain
UPDATE `creature_model_info` SET `bounding_radius`=2.25,`combat_reach`=4.5,`gender`=0 WHERE `modelid`=27039; -- Vesperon
UPDATE `creature_model_info` SET `bounding_radius`=3,`combat_reach`=1,`gender`=0 WHERE `modelid`=27225; -- Onyx Sanctum Guardian
UPDATE `creature_model_info` SET `bounding_radius`=1.8,`combat_reach`=1,`gender`=2 WHERE `modelid`=27035; -- Sartharion

-- Addon data
DELETE FROM `creature_template_addon` WHERE `entry` IN (31103,30680,30681,30682,30449,30453,30648,30451,28860,30616);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(31103,0,0,1,0, NULL), -- Twilight Egg (Cosmetic)
(30680,0,0,1,0, NULL), -- Onyx Brood General
(30681,0,0,1,0, NULL), -- Onyx Blaze Mistress
(30682,0,0,1,0, NULL), -- Onyx Flight Captain
(30449,0,0,1,0, NULL), -- Vesperon
(30453,0,0,1,0, NULL), -- Onyx Sanctum Guardian
(30648,0,0,1,0, NULL), -- Fire Cyclone
(30451,0,0,1,0, NULL), -- Shadron
(28860,0,0,1,0, NULL), -- Sartharion
(30616,0,0,1,0, NULL); -- Flame Tsunami







-- Koralon Burning breath Target
DELETE FROM `conditions` WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN (66665,67328);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,66665,0,18,1,35013,0,0, '','Koralon Burning Breath'), -- 10 man
(13,0,67328,0,18,1,35013,0,0, '','Koralon Burning Breath'); -- 25 man
