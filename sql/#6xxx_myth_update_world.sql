-- ------ --
-- FINDER --
-- ------ --
-- ------------- --
-- Miscellaneous --
-- ------------- --
-- Auto Complete Not Working Quests

-- --------------- --
-- WotLK Instances --
-- --------------- --
-- Trial Of the Crusader
-- Trial of the Champion (spellss)
-- Icecrown Citadel
-- Pit of Saron
-- Halls Of Reflection
-- Ulduar
-- Halls Of Stone
-- Halls Of Lightning
-- Obsidian Sanctum
-- Ruby Sanctum
-- Nexus
-- Oculus
-- Violet Hold
-- Utgarde Keep
-- Utgarde Pinnacle
-- Gundrak

-- ----------- --
-- Outdoor PvP --
-- ----------- --
-- Wintergrasp
-- Isle Of Conquest (maybe not necessary)

-- ------ --
-- Spells --
-- ------ --
-- Dampening Spells
-- Myth Project "Game Mechanic" Update

-- -------------------------------------------------------------------------
-- ----------------------- Myth Project DB Update --------------------------
-- -------------------------------------------------------------------------
-- Auto Complete Not Working Quests
UPDATE `quest_template` SET `QuestFlags` = 0 WHERE `entry` IN (
12921, 24476, 20439, 12967, 13396, 12607, 13242, 12644, 12645, 12589, 12921,
12671, 13011, 12987, 11690, 12663, 12664, 12673, 12676, 12630, 12713, 12512,
24507, 24498, 13396, 12644, 24815, 11337, 14163, 11335, 24426, 10866, 10163,
8336, 8326, 8472, 8468, 12887, 13829, 12843, 13679, 7481, 24820, 11071, 747,
11070, 11069, 11064, 10772, 12701, 12717, 13221, 12896, 13418, 13839, 13838,
10866, 20439, 49698, 12685, 12665, 12647, 24507, 10057, 10087, 24498, 24451,
24559, 24560, 11711, 24712, 13343, 12150, 12261, 24557, 24556, 24451, 24558,
8309, 3376, 9303, 8730, 24562, 24564, 13663);

TRUNCATE `version`;
INSERT INTO `version` VALUES (null,'6xxx','MythDB v6.2','MythAI v6.2',1601);
-- -------------------------------------------------------------------------
-- ------------------------ Trial Of the Crusader --------------------------
-- -------------------------------------------------------------------------
DELETE FROM `spelldifficulty_dbc` WHERE `id` IN (6000,6001,6002,6003,6004,6005,6006,6007,6020,6021,6022,6023,6024,6025);
INSERT INTO `spelldifficulty_dbc` VALUES
('6000', '66331', '67478', '67477', '67479'), -- Gormok Impale
('6001', '66330', '67647', '67648', '67649'), -- Gormok Staggering Stomp
('6002', '66689', '67650', '67651', '67652'), -- Icehowl Artic Breath
('6003', '66683', '67660', '67660', '67662'), -- Icehowl Massic Crash
('6004', '67345', '67663', '67663', '67665'), -- Icehowl Whirl
('6005', '66770', '67655', '67654', '67656'), -- Icehowl Ferocious Butt
('6006', '66879', '67624', '67625', '67626'), -- Dreadscale Burning Bite
('6007', '66820', '67636', '67635', '67637'), -- Dreadscale Molten Spew
('6020', '66237', '67049', '67050', '67051'), -- Jaraxxus Incinerate Flesh
('6021', '66528', '67029', '67030', '67031'), -- Jaraxxus Fel Lighting
('6022', '68124', '68126', '68127', '68128'), -- Jaraxxus Legion Flame
('6023', '66532', '66963', '66964', '66965'), -- Jaraxxus Fel Fireball
('6024', '66258', '66258', '67903', '67903'), -- Jaraxxus Summon Volcan
('6025', '67103', '67103', '67104', '67105'); -- Portal Summon Guardian

UPDATE `creature_template` SET `scale` = '2' WHERE `entry` = 34825;
DELETE FROM `creature_template` WHERE `entry` = 41000;
INSERT INTO `creature_template` VALUES
('41000','0','0','0','0','0','169','11686','169','0','Wilfred Portal Trigger','','','0','81','81','0','14','14','0','1','1','0','1','2','0','0','1','2000','2000','1','1','0','0','0','0','0','0','1','2','0','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','1','1','0','0','0','0','0','0','0','0','1','0','0','2','0','','12340');

UPDATE `creature_template` SET `scale`='1.5', `faction_A`='16', `faction_H`='16' WHERE (`entry`='34854');
UPDATE `creature_template` SET unit_flags= 33554434 WHERE `entry` IN (34628, 35353, 35354, 35355, 34630, 35356, 35357, 35358);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (34567, 34568 );
INSERT INTO `npc_spellclick_spells` VALUES
(34567, 65684, 0, 0, 0, 1, 0, 0, 0),
(34568, 65686, 0, 0, 0, 1, 0, 0, 0);

UPDATE `creature_template` SET `modelid1`=11686,`modelid2`=11686,`modelid3`=11686,`modelid4`=11686 WHERE `entry`=34784;
UPDATE `creature_template` SET `modelid1`=11686,`modelid2`=11686,`modelid3`=11686,`modelid4`=11686 WHERE `entry`=34781;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16  WHERE `creature_template`.`entry` IN ( 34458,34451,34459,34448,34449,34445,34456,34447,34441,34454,34455,34444,34450,34453,3445801,3445101,3445901,3444801,3444901,3444501,3445601,3444701,3444101,3445401,3445501,3444401,3445001,3445301,3445802,3445102,3445902,3444802,3444902,3444502,3445602,3444702,3444102,3445402,3445502,3444402,3445002,3445302,3445803,3445103,3445903,3444803,3444903,3444503,3445603,3444703,3444103,3445403,3445503,3444403,3445003,3445303);
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16  WHERE `creature_template`.`entry` IN ( 34461,34460,34469,34467,34468,34465,34471,34466,34473,34472,34463,34470,34474,34475,3446101,3446001,3446901,3446701,3446801,3446501,3447101,3446601,3447301,3447201,3446301,3447001,3447401,3447501,3446102,3446002,3446902,3446702,3446802,3446502,3447102,3446602,3447302,3447202,3446302,3447002,3447402,3447502,3446103,3446003,3446903,3446703,3446803,3446503,3447103,3446603,3447303,3447203,3446303,3447003,3447403,3447503);
UPDATE `creature_template` SET `mindmg`=388,`maxdmg`=583,`attackpower`=146,`dmg_multiplier`=12 WHERE `entry`=34454;
UPDATE `creature_template` SET `mindmg`=468,`maxdmg`=702,`attackpower`=175,`dmg_multiplier`=10 WHERE `entry`=34472;
UPDATE `creature_template` SET `npcflag`=1,`unit_flags`=258 WHERE `entry` IN (34567,34568);
UPDATE `creature_template` SET `faction_A`=14,`minlevel`=82,`maxlevel`=82,`faction_H`=14 WHERE entry IN (34628,34630);

DELETE FROM creature_template WHERE `entry` IN (34606,34649,3460602,3460603);
INSERT INTO `creature_template` VALUES
('34606','34649','3460602','3460603','0','0','1126','25144','0','0','Frost Sphere','','','0','79','80','2','1925','1925','0','1','1.14286','1','0','422','586','0','642','1','0','0','1','32768','8','0','0','0','0','0','345','509','103','8','64','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0.238095','1','1','0','0','0','0','0','0','0','721','1','0','0','0','mob_frost_sphere','12340'),
('34649','0','0','0','0','0','1126','25144','0','0','Frost Sphere (1)','','','0','79','80','2','1925','1925','0','1','1.14286','1','0','422','586','0','642','1','0','0','1','32768','8','0','0','0','0','0','345','509','103','8','64','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0.238095','1','1','0','0','0','0','0','0','0','721','1','0','0','0','','12340'),
('3460602','0','0','0','0','0','1126','25144','0','0','Frost Sphere (2)','','','0','79','80','2','1925','1925','0','1','1.14286','1','0','422','586','0','642','1','0','0','1','32768','8','0','0','0','0','0','345','509','103','8','64','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0.238095','1','1','0','0','0','0','0','0','0','721','1','0','0','0','','1'), -- provisional
('3460603','0','0','0','0','0','1126','25144','0','0','Frost Sphere (3)','','','0','79','80','2','1925','1925','0','1','1.14286','1','0','422','586','0','642','1','0','0','1','32768','8','0','0','0','0','0','345','509','103','8','64','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0.238095','1','1','0','0','0','0','0','0','0','721','1','0','0','0','','1'); -- provisional

UPDATE `creature_template` SET  `faction_A`=1770,`faction_H`=1770 WHERE `entry`=35458;
UPDATE `creature_template` SET unit_flags = 0, type_flags= 8, dynamicflags = 0, flags_extra = 2 WHERE entry IN (34564, 34566, 33615, 36616);

-- Fix Dalaran teleport location
DELETE FROM `spell_target_position` WHERE `id`=71512;
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(71512,571,5804.15,624.77,647.77,1.64);

-- Twin Valkyr spell_powering_up
DELETE FROM `spell_script_names` WHERE `spell_id` IN (67590,67602,67603,67604,66316,67100,67101,67102);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(67590, 'spell_powering_up'),
(67602, 'spell_powering_up'),
(67603, 'spell_powering_up'),
(67604, 'spell_powering_up'),
(66316, 'spell_spinning_pain_strike'),
(67100, 'spell_spinning_pain_strike'),
(67101, 'spell_spinning_pain_strike'),
(67102, 'spell_spinning_pain_strike');
-- -------------------------------------------------------------------------
-- ----------------------- Trial of the Champion ---------------------------
-- -------------------------------------------------------------------------
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62575,63010,68504,66515);
INSERT INTO `spell_script_names` VALUES
('62575', 'spell_gen_shieldbreaker'),
('63010', 'spell_gen_atcharge'),
('68504', 'spell_gen_npcshieldbreaker'),
('66515', 'spell_gen_reflective_shield');
-- -------------------------------------------------------------------------
-- --------------------------- Icecrown Citadel ----------------------------
-- -------------------------------------------------------------------------
-- Spawn Arthas Platform
DELETE FROM `gameobject` WHERE `id`=202161;
INSERT INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(202161, 631, 15, 1, 495.708, -2523.75, 1045.95, 3.14159, 7.7568, 0, 0, 0, 604800, 100, 1);
UPDATE `gameobject_template` SET `ScriptName` = 'icecrown_citadel_teleport' WHERE `entry` IN (202223,202235,202242,202243,202244,202245,202246);
UPDATE `gameobject_template` SET `flags` = 0 WHERE `entry` IN (202235,202242,202243,202244,202245,202246,202223);
UPDATE `gameobject_template` SET `ScriptName` = '', `data10` = 70308 WHERE `entry` = 201584;
UPDATE `gameobject` SET `phaseMask` = '1' WHERE `id` IN (202242,202243,202244,202245,202235,202223,202246);
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (201614,201613);
UPDATE `gameobject` SET `state` = '0' WHERE `id` IN (201375);
UPDATE gameobject SET phaseMask = 17 WHERE id IN (201375,201374);
-- test platform destruction
UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` = 202161;
UPDATE `gameobject` SET `state` = '1' WHERE `id` IN (202161);
-- Profesors doors
UPDATE `gameobject` SET `state` = '0' WHERE `id` IN (201613, 201614);
-- Rotface dummy for flood
DELETE FROM `creature` WHERE `id`=37013;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(null, 37013, 631, 15, 1, 0, 0, 4421.9, 3092.42, 372.456, 0.994838, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4472.55, 3110.78, 360.469, 2.35619, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4244.04, 3092.66, 372.97, 0.977384, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4463.86, 3101.57, 360.469, 2.04204, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4291.45, 3181.25, 372.97, 4.10152, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4411.07, 3154.75, 360.469, 5.81195, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4312.36, 3160.84, 372.97, 3.80482, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4490.33, 3113.29, 372.411, 2.53073, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4481.93, 3153.87, 360.469, 3.57792, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4291.18, 3092.92, 372.97, 2.33874, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4409.69, 3119.34, 360.469, 0.471239, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4419.42, 3164.15, 360.469, 5.46288, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4401.28, 3112.96, 372.431, 0.785398, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4471.93, 3163.9, 360.469, 3.92699, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4243.89, 3181.74, 372.97, 5.44543, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4419.03, 3109.9, 360.469, 0.767945, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4469.67, 3181.77, 372.311, 4.11898, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4480.85, 3118.98, 360.469, 2.67035, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4463.88, 3172.66, 360.469, 4.24115, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4222.44, 3161.69, 372.97, 5.53269, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4428.15, 3101.17, 360.469, 1.11701, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4421.79, 3181.76, 372.29, 5.46288, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4469.68, 3092.91, 372.325, 2.35619, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4223.47, 3113.58, 372.97, 0.767945, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4401.32, 3160.83, 372.316, 5.55015, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4490.13, 3160.97, 372.312, 3.82227, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4428.96, 3173.66, 360.469, 5.13127, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0),
(null, 37013, 631, 15, 1, 0, 0, 4312.14, 3112.98, 372.97, 2.51327, 86400, 0, 0, 25200, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `ScriptName` = 'boss_lord_marrowgar' WHERE `entry` = 36612;
-- Boss
UPDATE `creature_template` SET `ScriptName` = 'boss_lord_marrowgar' WHERE `entry` = 36612;
UPDATE `creature_template` SET `ScriptName` = 'boss_lady_deathwhisper' WHERE `entry` = 36855;
UPDATE `creature_template` SET `ScriptName` = 'boss_festergut' WHERE `entry` = 36626;
UPDATE `creature_template` SET `ScriptName` = 'boss_rotface' WHERE `entry` = 36627;
UPDATE `creature_template` SET `ScriptName` = 'boss_professor_putricide' WHERE `entry` = 36678;
UPDATE `creature_template` SET `ScriptName` = 'boss_valithria' WHERE `entry` = 36789;
UPDATE `creature_template` SET `ScriptName` = 'boss_the_lich_king' WHERE `entry` = 36597;

-- Mobs
UPDATE `creature_template` SET `ScriptName` = 'npc_tirion_icc' WHERE `entry` = 38995;
UPDATE `creature_template` SET `ScriptName` = 'npc_swarming_shadows' WHERE `entry` = 38163;
UPDATE `creature_template` SET `ScriptName` = 'npc_bone_spike' WHERE `entry` = 36619;
UPDATE `creature_template` SET `ScriptName` = 'npc_volatile_ooze' WHERE `entry` = 37697;
UPDATE `creature_template` SET `ScriptName` = 'npc_valkyr_icc' WHERE `entry` = 36609;
UPDATE `creature_template` SET `ScriptName` = 'npc_vile_spirit_icc' WHERE `entry` = 37799;
UPDATE `creature_template` SET `ScriptName` = 'npc_little_ooze' WHERE `entry` = 36897;
UPDATE `creature_template` SET `ScriptName` = 'npc_big_ooze' WHERE `entry` = 36899;
UPDATE `creature_template` SET `ScriptName` = 'npc_dreamcloud_icc' WHERE `entry` = 37985;
UPDATE `creature_template` SET `ScriptName` = 'npc_dreamportal_icc' WHERE `entry` IN (38186,37945,38429,38430);
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_puddle_stalker' WHERE `entry` = 37824;
UPDATE `creature_template` SET `ScriptName` = 'npc_ooze_explode_stalker' WHERE `entry` = 38107;
UPDATE `creature_template` SET `ScriptName` = 'npc_gas_cloud_icc' WHERE `entry` = 37562;
UPDATE `creature_template` SET `ScriptName` = 'npc_bomb_icc' WHERE `entry` = 38159;
UPDATE `creature_template` SET `ScriptName` = 'npc_stinky_icc' WHERE `entry` = 37025;
UPDATE `creature_template` SET `ScriptName` = 'npc_precious_icc' WHERE `entry` = 37217;
UPDATE `creature_template` SET `ScriptName` = 'npc_valithria_alternative' WHERE `entry` = 37950;
UPDATE `creature_template` SET `ScriptName` = 'boss_blood_council_controller' WHERE `entry` = 38008;
UPDATE `creature_template` SET `ScriptName` = 'npc_blood_queen_lana_thel' WHERE `entry` = 38004;
UPDATE `creature_template` SET `ScriptName` = 'npc_kinetic_bomb' WHERE `entry` = 38454;
UPDATE `creature_template` SET `ScriptName` = 'npc_dark_nucleus' WHERE `entry` = 38369;
UPDATE `creature_template` SET `ScriptName` = 'npc_ball_of_flame' WHERE `entry` IN (38332,38451);
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `minlevel` = 80, `maxlevel` = 80, `flags_extra` = 128, `unit_flags` = 0 WHERE `entry` IN (37013);
-- Other
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14, `unit_flags` = 33554434, `type_flags` = 1024 WHERE `entry` = 36672;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 37950;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `faction_A` = 14, `faction_H` = 14, `unit_flags` = 0, type_flags = 0, `VehicleId` = 533 WHERE `entry` IN (36619,38233,38459,38460);
UPDATE `creature_template` SET `faction_A` = 21, `faction_H` = 21, `unit_flags` = 33600, `vehicleId` = 639 WHERE `entry` IN (37813,38402,38582,38583);
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `type_flags` = 67113036 WHERE `entry` IN (36789,38174);
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `minlevel` = 80, `maxlevel` = 80 WHERE `entry` IN (37006,37986,38107,38548,36659,37690,37562,38159);
UPDATE `creature_model_info` SET `bounding_radius` = 5,`combat_reach` = 5 WHERE `modelid` = 31119;
UPDATE `creature_template` SET `mechanic_immune_mask` = 634339327 WHERE `entry` IN (36855,38106,38296,38297);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (37007,38301);
UPDATE `creature_template` SET `spell1` = 70360, `spell2` = 70539, `spell3` = 70542, `VehicleId` = 591 WHERE `entry` = 37672;
UPDATE `creature_template` SET `spell1` = 72527, `spell2` = 72457, `spell3` = 70542, `VehicleId` = 591 WHERE `entry` = 38285;
UPDATE `creature_template` SET `dynamicflags` = 8, `npcflag` = 0, `unit_flags` = 32832 WHERE `entry` = 38995;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14 WHERE `entry` IN (36899,38123);
UPDATE `creature_template` SET `MovementType` = 1 WHERE `entry` IN(37985,37799,39284,39285,39286);
UPDATE `creature_template` SET `InhabitType` = 5,`flags_extra` = `flags_extra`|0x80 WHERE `entry` = 30298;
UPDATE `creature_template` SET `InhabitType` = 5,`minlevel` = 82,`maxlevel` = 82,`faction_A` = 14,`faction_H` = 14,`speed_walk` = 0.142857 WHERE `entry` IN (38454,38775,38776,38777); -- Kinetic Bomb
UPDATE `creature_template` SET `minlevel` = 82,`maxlevel` = 82,`flags_extra` = `flags_extra`|0x80 WHERE `entry` = 38458; -- Kinetic Bomb Target
UPDATE `creature_template` SET `minlevel` = 82,`maxlevel` = 82,`exp` = 2,`flags_extra` = `flags_extra`|0x80 WHERE `entry` = 38422; -- Shock Vortex
UPDATE `creature_template` SET `minlevel` = 82,`maxlevel` = 82,`exp` = 2,`speed_walk` = 1.57143,`unit_flags` = 33554432,`flags_extra` = `flags_extra`|0x80 WHERE `entry` = 38332; -- Ball of Flame
UPDATE `creature_template` SET `minlevel` = 82,`maxlevel` = 82,`exp` = 2,`speed_walk` = 1.57143,`unit_flags` = 33554432,`flags_extra` = `flags_extra`|0x80 WHERE `entry` = 38451; -- Ball of Inferno Flame
UPDATE `creature_template` SET `unit_flags` = 536904000,`RegenHealth` = 0,`speed_run` = 1.428571,`speed_walk` = 1.6 WHERE `entry` IN (37970,38401,38784,38785); -- Prince Valanar
UPDATE `creature_template` SET `unit_flags` = 536904000,`RegenHealth` = 0,`speed_run` = 1.428571,`speed_walk` = 1.6 WHERE `entry` IN (37972,38399,38769,38770); -- Prince Keleseth
UPDATE `creature_template` SET `unit_flags` = 536904000,`RegenHealth` = 0,`speed_run` = 1.428571,`speed_walk` = 1.6 WHERE `entry` IN (37973,38400,38771,38772); -- Prince Taldaram

UPDATE `creature_model_info` SET `bounding_radius` = 0.5425,`combat_reach` = 1.75 WHERE `modelid` IN (30856,30857,30858);
UPDATE `creature_template` SET `RegenHealth` = 0 WHERE `entry` = 38369; -- Dark Nucleus
UPDATE `creature_template` SET `dynamicflags` = 8 WHERE entry IN (37970, 38401, 38784, 38785);
UPDATE `creature_template` SET `RegenHealth` = '0' WHERE `entry` = 38174;
UPDATE `creature_template` SET `vehicleId` = 531 WHERE `entry` IN (36609,39120,39121,39122);

-- Not attackable and disable move flag
UPDATE `creature_template` SET `unit_flags` = 33555204 WHERE `entry` IN (37986,37824,38234,38317,36659,38548,37186,37006,37918,37690,38068,38163,38584,38752);
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` IN (37986,38234,38317,36659,38548,37186);
UPDATE `creature_template` SET `flags_extra` = 128 WHERE `entry` = 38234;
UPDATE `creature_template` SET `flags_extra` = 130 WHERE `entry` = 38569;

-- Instance
UPDATE `instance_template` SET `script` = 'instance_icecrown_citadel' WHERE `map` = 631;

-- Creature addon template
DELETE FROM `creature_addon` WHERE `guid` IN (136107,104365);
DELETE FROM `creature_template_addon` WHERE `entry` IN (37690,37672,36659,38186,37945,38429,38430,37918,37006,37186);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(136107, 0, 0, 0, 1, 0, '18950 0 18950 1 72242 0');
INSERT INTO `creature_addon` (`guid`, `bytes1`) VALUES
(104365,0x03000000); -- Blood Queen Lana'Thel
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(37690, 0, 0, 0, 0, 0, '70345 0 70343 0'),
(37672, 0, 0, 0, 0, 0, '70385 0 70405 0'),
(38186, 0, 0, 0, 0, 0, '71304 0'),
(37945, 0, 0, 0, 0, 0, '70763 0'),
(38429, 0, 0, 0, 0, 0, '71986 0'),
(38430, 0, 0, 0, 0, 0, '71994 0'),
(37918, 0, 0, 0, 0, 0, '70715 0'),
(37186, 0, 0, 0, 0, 0, '70022 0'),
(37006, 0, 0, 0, 0, 0, '69776 0');

-- Conditions
DELETE FROM `conditions` WHERE `SourceEntry` IN (69508,70881,70360,36659,70781,70856,70857,70858,70859,70860,70861,69157,71614,70588,74074,69782, 69796, 69798, 69801, 69782, 69796, 69798, 69783, 69797, 69799, 69802, 69782, 69796, 69798, 69801, 70079, 69801);
DELETE FROM `conditions` WHERE `ConditionValue2` IN (SELECT `id` FROM `creature` WHERE `map` = 631);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (70952,70982,70981,70983,71070,71081,71080);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 21 AND `SourceGroup` IN (37672,38285);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,70360,0,18,1,37690,0,0, '', ''),
(13,0,69157,0,18,1,36659,0,0, '', 'Festergut - Gaseous Blight'),
(13,0,69162,0,18,1,36659,0,0, '', 'Festergut - Gaseous Blight'),
(13,0,69164,0,18,1,36659,0,0, '', 'Festergut - Gaseous Blight'),
(13,0,71614,0,18,1,38995,0,0, '', 'LichKing - Ice Lock'),
(13,0,70588,0,18,1,36789,0,0, '', 'Valithria - Suppression'),
(13,0,70588,0,18,1,38174,0,0, '', 'Valithria - Suppression'),
(13,0,71617,0,18,1,38317,0,0, '', 'Putricide - Tear Gas'),
(13,0,69125,0,18,1,37013,0,0, '', ''),
(21,37672,71516,0,3,49888,0,0,0, '', 'Mutated Abomination - Unholy Infusion'),
(21,38285,71516,0,3,49888,0,0,0, '', 'Mutated Abomination - Unholy Infusion'),
(13,0,70952,0,18,1,37970,0,0, '', 'Valanar - Invocation of Blood'),
(13,0,70982,0,18,1,37973,0,0, '', 'Taldaram - Invocation of Blood'),
(13,0,70981,0,18,1,37972,0,0, '', 'Keleseth - Invocation of Blood'),
(13,0,70983,0,18,1,37970,0,0, '', 'Valanar - Invocation of Blood beam'),
(13,0,70983,0,18,1,37973,0,0, '', 'Taldaram - Invocation of Blood beam'),
(13,0,70983,0,18,1,37972,0,0, '', 'Keleseth - Invocation of Blood beam'),
(13,0,71070,0,18,1,37970,0,0, '', 'Valanar - Invocation of Blood visual'),
(13,0,71081,0,18,1,37973,0,0, '', 'Taldaram - Invocation of Blood visual'),
(13,0,71080,0,18,1,37972,0,0, '', 'Keleseth - Invocation of Blood visual'),
(13,0,74074,0,18,1,36597,0,0, '', 'The Lich King - Plague Siphon'),
(13,0,69783,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69797,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69799,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69802,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69782,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69796,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69798,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69801,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,70079,0,18,1,36678,0,0, '', 'Rotface - Ooze Flood');
-- creature
DELETE FROM `creature` WHERE `id` IN (37813, 36659, 37950);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(null,36659,631,15,1,11686,0,4267.87,3137.33,360.469,0,300,0,0,25200,0,0,0,0,0,0),
(null,37813,631,15,1,30790,0,-493.905,2211.35,541.114,3.18037,604800,0,0,12299490,0,0,0,0,0,0), -- saurfang
(null,37950,631,15,16,0,0,4203.65,2483.89,390.961,5.51524,604800,0,0,6000003,0,0,0,0,33540,8);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (72202,70117);
DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN (72202,69166,70347,72380,69706,70702,70311, 69291, 70338,72846,69201,74074);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(70360,70347,0,'Eat Ooze'),
(72379,72380,0,'Blood Nova'),
(72380,72202,0,'Blood Nova 10N'),
(72438,72202,0,'Blood Nova 25N'),
(72439,72202,0,'Blood Nova 10H'),
(72440,72202,0,'Blood Nova 25H'),
(72409,72202,0,'Rune of Blood 25N'),
(72447,72202,0,'Rune of Blood 10H'),
(72448,72202,0,'Rune of Blood 25H'),
(72449,72202,0,'Rune of Blood 25H'),
(69195,69166,0,'Pungent Blight 10N'),
(71279,69166,0,'Pungent Blight 25N'),
(73031,69166,0,'Pungent Blight 10H'),
(73032,69166,0,'Pungent Blight 25H'),
(70715,70702,0,'?'),
(-69674,69706,0, 'Rotface: Mutated Infection Summon'),
(-71224,69706,0, 'Rotface: Mutated Infection Summon'),
(-73022,69706,0, 'Rotface: Mutated Infection Summon'),
(-73023,69706,0, 'Rotface: Mutated Infection Summon'),
(-70337,70338,0, 'The Lich King: Necrotic plague initial cast'),
(-70337,72846,0, 'The Lich King: Necrotic plague immun'),
(-70338,70338,0, 'The Lich King: Necrotic jump'),
(-69200,69201,0, 'The Lich King: Raging Spirit'),
(-70338,74074,0, 'The Licg King: Plague Siphon');

-- Npc spell click spell
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (37945,38430);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`, `aura_required`, `aura_forbidden`, `user_type`) VALUES
(37945,70766,0,0,0,3,0,0,0),
(38430,70766,0,0,0,3,0,0,0);

DELETE FROM `spell_script_names` where `spell_id` IN ( 69783, -- <-- Not tested!
71412, 71415, 72510, 72509, 72508, 70405, 70308, 70311,
70541, 73779, 73780, 73781, 70337, 73912, 73913, 73914,
69075, 70834, 70835, 70836, 70126, 70127, 72528, 72529, 
72219, 72551, 72552, 72553, 69558, 68981, 74270, 74271,
74272, 70534, 69110, 72262, 73159, 74506, 71598, 71806,
71718, 72040, 55891, 55947, 71756, 72782, 72783, 72784,
72080, 72087, 73001, 72999, 69538, 69553, 69290, 71222,
73033, 73034, 69675, 70117, 69057, 70826, 72088, 73032,
73031, 71219, 69195, 72530, 69766, 71503, 74361, 72089);

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(70117,'spell_sindragosa_icy_grip'),
(71412,'spell_putricide_ooze_summon'),
(71415,'spell_putricide_ooze_summon'),
(72510,'spell_putricide_mutated_transformation_dismiss'),
(72509,'spell_putricide_mutated_transformation_dismiss'),
(72508,'spell_putricide_mutated_transformation_dismiss'),
(70405,'spell_putricide_mutated_transformation_dismiss'),
(70308,'spell_putricide_mutation_init'),
(70311,'spell_putricide_mutated_transformation'),
(71503,'spell_putricide_mutated_transformation'),
(74361,'spell_lich_king_valkyr_summon'),
(70541,'spell_lich_king_infection'),
(73779,'spell_lich_king_infection'),
(73780,'spell_lich_king_infection'),
(73781,'spell_lich_king_infection'),
(70337,'spell_lich_king_necrotic_plague'),
(73912,'spell_lich_king_necrotic_plague'),
(73913,'spell_lich_king_necrotic_plague'),
(73914,'spell_lich_king_necrotic_plague'),
(69075,'spell_lord_marrowgar_bone_storm'),
(70834,'spell_lord_marrowgar_bone_storm'),
(70835,'spell_lord_marrowgar_bone_storm'),
(70836,'spell_lord_marrowgar_bone_storm'),
(70126,'spell_sindragosa_ice_tomb'),
(70127,'spell_sindragosa_mystic_buffet'),
(72528,'spell_sindragosa_mystic_buffet'),
(72529,'spell_sindragosa_mystic_buffet'),
(72530,'spell_sindragosa_mystic_buffet'),
(69766,'spell_sindragosa_unchained_magic'),
(72219,'spell_festergut_gastric_bloat'),
(72551,'spell_festergut_gastric_bloat'),
(72552,'spell_festergut_gastric_bloat'),
(72553,'spell_festergut_gastric_bloat'),
(69558,'spell_rotface_unstable_explosion'),
(68981,'spell_lich_king_winter'),
(74270,'spell_lich_king_winter'),
(74271,'spell_lich_king_winter'),
(74272,'spell_lich_king_winter'),
(70534,'spell_vile_spirit_distance_check'),
(69110,'spell_ice_burst_distance_check'),
(72262,'spell_lich_king_quake'),
(73159,'spell_lich_king_play_movie'),
(74506,'spell_valkyr_carry_can_cast'),
(71598,'spell_creature_permanent_feign_death'),
(71806,'spell_taldaram_glittering_sparks'),
(71718,'spell_taldaram_summon_flame_ball'),
(72040,'spell_taldaram_summon_flame_ball'),
(55891,'spell_taldaram_flame_ball_visual'),
(55947,'spell_taldaram_flame_ball_visual'),
(71756,'spell_taldaram_ball_of_inferno_flame'),
(72782,'spell_taldaram_ball_of_inferno_flame'),
(72783,'spell_taldaram_ball_of_inferno_flame'),
(72784,'spell_taldaram_ball_of_inferno_flame'),
(72080,'spell_valanar_kinetic_bomb'),
(72087,'spell_valanar_kinetic_bomb_knockback'),
(73001,'spell_blood_council_shadow_prison'),
(72999,'spell_blood_council_shadow_prison_damage'),
(69538,'spell_rotface_little_ooze_combine'),
(69553,'spell_rotface_large_ooze_combine'),
(69290,'spell_festergut_blighted_spores'),
(71222,'spell_festergut_blighted_spores'),
(73033,'spell_festergut_blighted_spores'),
(73034,'spell_festergut_blighted_spores'),
(69675,'spell_sindragosa_ice_tomb_effect'),
(70117,'spell_sindragosa_blistering_cold'),
(69057,'spell_marrowgar_bone_spike_graveyard'),
(70826,'spell_marrowgar_bone_spike_graveyard'),
(72088,'spell_marrowgar_bone_spike_graveyard'),
(73032,'spell_festergut_pungent_blight'),
(73031,'spell_festergut_pungent_blight'),
(71219,'spell_festergut_pungent_blight'),
(69195,'spell_festergut_pungent_blight'),
(72089,'spell_marrowgar_bone_spike_graveyard');

-- ***_scripts table

UPDATE waypoint_scripts SET delay = 3 WHERE dataint = 38879 AND command = 15;
DELETE FROM `spell_scripts` WHERE id = 72429 AND command = 15;
INSERT INTO `spell_scripts` VALUE
('72429','0','3','15','72423','0','0','0','0','0','0');

SET @LIGHT_S_HAMMER := 70781;
SET @ORATORY_OF_THE_DAMNED := 70856;
SET @RAMPART_OF_SKULLS := 70857;
SET @DEATHBRINGER_S_RISE := 70858;
SET @UPPER_SPIRE := 70859;
SET @SINDRAGOSA_S_LAIR := 70861;
SET @FROZEN_THRONE := 70860;

-- Delete conditions (no longer valid)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (@LIGHT_S_HAMMER,@ORATORY_OF_THE_DAMNED,@RAMPART_OF_SKULLS,@DEATHBRINGER_S_RISE,@UPPER_SPIRE,@SINDRAGOSA_S_LAIR,@FROZEN_THRONE);

-- Add target coords
DELETE FROM `spell_target_position` WHERE `id` IN (@LIGHT_S_HAMMER,@ORATORY_OF_THE_DAMNED,@RAMPART_OF_SKULLS,@DEATHBRINGER_S_RISE,@UPPER_SPIRE,@SINDRAGOSA_S_LAIR,@FROZEN_THRONE);
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(@LIGHT_S_HAMMER,631,-17.0711,2211.47,30.0546,3.14159),
(@ORATORY_OF_THE_DAMNED,631,-503.593,2211.47,62.7621,3.14159),
(@RAMPART_OF_SKULLS,631,-615.146,2211.47,199.909,0.0),
(@DEATHBRINGER_S_RISE,631,-549.073,2211.29,539.223,0.0),
(@UPPER_SPIRE,631,4199.484,2769.323,351.3722,3.124139),
(@SINDRAGOSA_S_LAIR,631,4356.580,2565.75,220.402,4.71238),
(@FROZEN_THRONE,631,529.3969,-2124.66,1041.37,3.14159);

-- Event AI Thanks Heisei Project!
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (37868,36791,37863,37886,37934,38068,37698,36701);
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` IN (37868,36791,37863,37886,37934,38068,37698,36701);
INSERT INTO `creature_ai_scripts` VALUES
('85021059','37868','0','0','100','7','15000','15000','27000','27000','11','71179','4','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Mana Void'),
('85021060','37868','0','0','100','25','15000','15000','27000','27000','11','71741','4','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Mana Void'),
('85021061','37868','0','0','100','3','10000','10000','18000','22000','11','70759','0','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Frostbolt Volley'),
('85021062','37868','0','0','100','9','10000','10000','18000','22000','11','71889','0','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Frostbolt Volley'),
('85021063','37868','0','0','100','5','10000','10000','18000','22000','11','72015','0','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Frostbolt Volley'),
('85021064','37868','0','0','100','17','10000','10000','18000','22000','11','72016','0','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Frostbolt Volley'),
('85021065','37868','0','0','100','31','18000','18000','28000','28000','11','70602','4','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Corruption'),
('85021066','38068','0','0','100','30','30000','30000','0','0','37','0','0','1','0','0','0','0','0','0','0','0', 'Mana Void - Self Destruct'),
('80021007','36791','0','0','100','7','8000','8000','22000','25000','11','69325','0','1','0','0','0','0','0','0','0','0','Blazing Skeleton - Casts Lay Waste'),
('80021008','36791','0','0','100','25','8000','8000','22000','25000','11','71730','0','1','0','0','0','0','0','0','0','0','Blazing Skeleton - Casts Lay Waste'),
('80021009','36791','0','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Stop Movement on Aggro'),
('80021010','36791','4','0','100','6','0','0','0','0','11','70754','1','0','22','6','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball and Set Phase 1 on Aggro'),
('80021011','36791','3','0','100','6','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Blazing Skeleton - Start Movement and Set Phase 2 when Mana is at 15%'),
('80021012','36791','0','6','100','7','0','0','1500','3000','11','70754','1','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball above 15% Mana (Phase 1)'),
('80021013','36791','3','5','100','6','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Blazing Skeleton - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('80021014','36791','9','0','100','7','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Start Movement Beyond 30 Yards'),
('80021015','36791','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - On Evade set Phase to 0'),
('80021016','36791','0','0','100','24','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Stop Movement on Aggro'),
('80021017','36791','4','0','100','24','0','0','0','0','11','71748','1','0','22','6','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball and Set Phase 1 on Aggro'),
('80021018','36791','3','0','100','24','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Blazing Skeleton - Start Movement and Set Phase 2 when Mana is at 15%'),
('80021019','36791','0','6','100','25','0','0','1500','3000','11','71748','1','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball above 15% Mana (Phase 1)'),
('80021020','36791','3','5','100','24','100','28','0','0','21','0','0','0','22','6','0','0','0','0','0','0','Blazing Skeleton - Set Ranged Movement and Set Phase 1 when Mana is above 28% (Phase 2)'),
('80021021','36791','9','0','100','25','30','50','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Start Movement Beyond 30 Yards'),
('80021022','36791','7','0','100','24','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - On Evade set Phase to 0'),
('86021086','37863','4','0','100','30','0','0','0','0','11','70588','1','0','0','0','0','0','0','0','0','0','Suppresser - Cast Suppression'),
('82021033','37886','0','0','100','7','10000','11000','22000','28000','11','70633','4','0','0','0','0','0','0','0','0','0','Gluttonous Abomination - Casts Gut Spray'),
('82021034','37886','0','0','100','25','10000','11000','22000','28000','11','71283','4','0','0','0','0','0','0','0','0','0','Gluttonous Abomination - Casts Gut Spray'),
('82021035','37886','6','0','100','30','0','0','0','0','11','70675','0','2','0','0','0','0','0','0','0','0', 'Gluttonous Abomination - Casts on death Summon Rot Worm'),
('80021026','37934','2','0','100','7','10','0','12300','14900','11','70744','0','0','0','0','0','0','0','0','0','0','Blistering Zombie - Casts Acid Burst at 10% HP'),
('80021027','37934','2','0','100','25','10','0','12300','14900','11','71733','0','0','0','0','0','0','0','0','0','0','Blistering Zombie - Casts Acid Burst at 10% HP'),
('85021075','37698','2','0','100','6','25','0','0','0','11','72143','0','0','1','-106','0','0','0','0','0','0','Shambling Horror - Casts Enrage at 25% HP'),
('85021076','37698','2','0','100','24','25','0','0','0','11','72146','0','0','1','-106','0','0','0','0','0','0','Shambling Horror - Casts Enrage at 25% HP'),
('85021077','37698','0','0','100','7','7000','9000','15000','17000','11','72149','0','0','0','0','0','0','0','0','0','0','Shambling Horror - Casts Shockwave'),
('85021078','37698','0','0','100','25','7000','9000','15000','17000','11','73794','0','0','0','0','0','0','0','0','0','0','Shambling Horror - Casts Shockwave'),
('85021054','36701','0','0','100','7','10000','10000','25000','35000','11','69242','0','0','0','0','0','0','0','0','0','0','Raging Spirit - Cast Soul Shriek'),
('85021055','36701','0','0','100','25','10000','10000','25000','35000','11','73800','0','0','0','0','0','0','0','0','0','0','Raging Spirit - Cast Soul Shriek');

DELETE FROM script_texts WHERE entry <= -1665902 AND entry >= -1666080;
DELETE FROM script_texts WHERE entry <= -1810001 AND entry >= -1810032;
# 3
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1665919,'Thank the spirits for you, brothers and sisters. The Skybreaker has already left. Quickly now, to Orgrim''s Hammer! If you leave soon, you may be able to catch them.',null,null,null,null,null,null,null,null,0,0,0,0,''),
(0,-1665920,'This should be helpin''ya!',null,null,null,null,null,null,null,null,0,0,0,0,''),
(0,-1665921,'Aka''Magosh, brave warriors. The alliance is in great number here.',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665922,'Captain Saurfang will be pleased to see you aboard Orgrim''s Hammer. Make haste, we will secure the area until you are ready for take-off.',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665923,'A screeching cry pierces the air above!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665924,'A Spire Frostwyrm lands just before Orgrim''s Hammer.',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665925,'Rise up, sons and daughters of the Horde! Today we battle a hated enemy of the Horde! LOK''TAR OGAR! Kor''kron, take us out!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665926,'What is that?! Something approaching in the distance!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665927,'ALLIANCE GUNSHIP! ALL HANDS ON DECK!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665928,'Move yer jalopy or we''ll blow it out of the sky, orc! The Horde''s got no business here!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665929,'You will know our business soon! KOR''KRON, ANNIHILATE THEM!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665930,'Marines, Sergeants, attack!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665931,'You DARE board my ship? Your death will come swiftly.',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665932,'Riflemen, shoot faster!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665933,'Mortar team, reload!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665934,'We''re taking hull damage, get a sorcerer out here to shut down those cannons!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665935,'The Alliance falter. Onward to the Lich King!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665936,'Damage control! Put those fires out! You haven''t seen the last of the Horde!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665937,'Thank goodness you arrived when you did, heroes. Orgrim''s Hammer has already left. Quickly now, to The Skybreaker! If you leave soon, you may be able to catch them.',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665938,'This ought to help!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665939,'Skybreaker Sorcerer summons a Skybreaker Battle Standard.',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665940,'You have my thanks. We were outnumbered until you arrived.',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665941,'Captain Muradin is waiting aboard The Skybreaker. We''ll secure the area until you are ready for take off.',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665942,'Skybreaker infantry, hold position!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665943,'A screeching cry pierces the air above!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665944,'A Spire Frostwyrm lands just before The Skybreaker. ',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665945,'Fire up the engines! We got a meetin with destiny, lads!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665946,'Hold on to yer hats!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665947,'What in the world is that? Grab me spyglass, crewman!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665948,'By me own beard! HORDE SAILIN IN FAST N HOT!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665949,'EVASIVE ACTION! MAN THE GUNS!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665950,'Cowardly dogs! Ye blindsighted us!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665951,'This is not your battle, dwarf. Back down or we will be forced to destroy your ship.',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665952,'Not me battle? I dunnae who ye? think ye are, mister, but I got a score to settle with Arthas and yer not gettin in me way! FIRE ALL GUNS! FIRE! FIRE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,''),
(0,-1665953,'Reavers, Sergeants, attack!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665954,'What''s this then?! Ye won''t be takin this son o Ironforge''s vessel without a fight!.',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665955,'Axethrowers, hurl faster!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665956,'Rocketeers, reload!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665957,'We''re taking hull damage, get a battle-mage out here to shut down those cannons!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665958,'Don''t say I didn''t warn ya, scoundrels! Onward, brothers and sisters!',null,null,null,null,null,null,null,null,0,1,0,0,''),
(0,-1665959,'Captain Bartlett, get us out of here! We''re taken too much damage to stay afloat!',null,null,null,null,null,null,null,null,0,1,0,0,'');

# 9
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(37955,-1666053,'Is that all you got?',null,null,null,null,null,null,null,null,16791,1,0,0,''),
(37955,-1666054,'You have made an... unwise... decision.',null,null,null,null,null,null,null,null,16782,1,0,0,''),
(37955,-1666055,'Just a taste...',null,null,null,null,null,null,null,null,16783,1,0,0,''),
(37955,-1666056,'Know my hunger!',null,null,null,null,null,null,null,null,16784,1,0,0,''),
(37955,-1666057,'SUFFER!',null,null,null,null,null,null,null,null,16786,1,0,0,''),
(37955,-1666058,'Can you handle this?',null,null,null,null,null,null,null,null,16787,1,0,0,''),
(37955,-1666059,'Yes... feed my precious one! You''re mine now! ',null,null,null,null,null,null,null,null,16790,1,0,0,''),
(37955,-1666060,'Here it comes.',null,null,null,null,null,null,null,null,16788,1,0,0,''),
(37955,-1666061,'THIS ENDS NOW!',null,null,null,null,null,null,null,null,16793,1,0,0,''),
(37955,-1666062,'But... we were getting along... so well...',null,null,null,null,null,null,null,null,16794,1,0,0,'');

# 10
INSERT INTO `script_texts`(`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(36789,-1666063,'Heroes, lend me your aid! I... I cannot hold them off much longer! You must heal my wounds!',null,null,null,null,null,null,null,null,17064,1,0,0,''),
(36789,-1666064,'I have opened a portal into the Emerald Dream. Your salvation lies within, heroes.',null,null,null,null,null,null,null,null,17068,1,0,0,''),
(36789,-1666065,'My strength is returning! Press on, heroes!',null,null,null,null,null,null,null,null,17070,1,0,0,''),
(36789,-1666066,'I will not last much longer!',null,null,null,null,null,null,null,null,17069,1,0,0,''),
(36789,-1666067,'Forgive me for what I do! I... cannot... stop... ONLY NIGHTMARES REMAIN!',null,null,null,null,null,null,null,null,17072,1,0,0,''),
(36789,-1666068,'A tragic loss...',null,null,null,null,null,null,null,null,17066,1,0,0,''),
(36789,-1666069,'FAILURES!',null,null,null,null,null,null,null,null,17067,1,0,0,''),
(36789,-1666070,'I am renewed! Ysera grants me the favor to lay these foul creatures to rest!',null,null,null,null,null,null,null,null,17071,1,0,0,'');

# 12
INSERT INTO script_texts (npc_entry,entry,content_default,content_loc1,content_loc2,content_loc3,content_loc4,content_loc5,content_loc6,content_loc7,content_loc8,sound,type,language,emote,comment)VALUES
(36597,-1810001, 'So...the Light''s vaunted justice has finally arrived. Shall I lay down Frostmourne and throw myself at your mercy, Fordring?',null,null,null,null,null,null,null,null,17349,1,0,0,''),
(38995,-1810002, 'We will grant you a swift death, Arthas. More than can be said for the thousands you''ve tortured and slain.',null,null,null,null,null,null,null,null,17390,1,0,0,''),
(36597,-1810003, 'You will learn of that first hand. When my work is complete, you will beg for mercy -- and I will deny you. Your anguished cries will be testament to my unbridled power.',null,null,null,null,null,null,null,null,17350,1,0,0,''),
(38995,-1810004, 'So be it. Champions, attack!',null,null,null,null,null,null,null,null,17391,1,0,0,''),
(36597,-1810005, 'I''ll keep you alive to witness the end, Fordring. I would not want the Light''s greatest champion to miss seeing this wretched world remade in my image.',null,null,null,null,null,null,null,null,17351,1,0,0,''),
(38995,-1810006, 'Come then champions, feed me your rage!',null,null,null,null,null,null,null,null,17352,1,0,0,''),
(36597,-1810007, 'I will freeze you from within until all that remains is an icy husk!',null,null,null,null,null,null,null,null,17369,1,0,0,''),
(36597,-1810008, 'Apocalypse!',null,null,null,null,null,null,null,null,17371,1,0,0,''),
(36597,-1810009, 'Bow down before your lord and master!',null,null,null,null,null,null,null,null,17372,1,0,0,''),
(36597,-1810010, 'Hope wanes!',null,null,null,null,null,null,null,null,17363,1,0,0,''),
(36597,-1810011, 'The end has come!',null,null,null,null,null,null,null,null,17364,1,0,0,''),
(36597,-1810012, 'Face now your tragic end!',null,null,null,null,null,null,null,null,17365,1,0,0,''),
(36597,-1810013, 'No question remains unanswered. No doubts linger. You are Azeroth''s greatest champions! You overcame every challenge I laid before you. My mightiest servants have fallen before your relentless onslaught, your unbridled fury... Is it truly righteousness that drives you? I wonder.',null,null,null,null,null,null,null,null,17353,1,0,0,''),
(36597,-1810014, 'You trained them well, Fordring. You delivered the greatest fighting force this world has ever known... right into my hands -- exactly as I intended. You shall be rewarded for your unwitting sacrifice.',null,null,null,null,null,null,null,null,17355,1,0,0,''),
(36597,-1810015, 'Watch now as I raise them from the dead to become masters of the Scourge. They will shroud this world in chaos and destruction. Azeroth''s fall will come at their hands -- and you will be the first to die.',null,null,null,null,null,null,null,null,17356,1,0,0,''),
(36597,-1810016, 'I delight in the irony.',null,null,null,null,null,null,null,null,17357,1,0,0,''),
(38995,-1810017, 'LIGHT, GRANT ME ONE FINAL BLESSING. GIVE ME THE STRENGTH... TO SHATTER THESE BONDS!',null,null,null,null,null,null,null,null,17392,1,0,0,''),
(36597,-1810018, 'Impossible...',null,null,null,null,null,null,null,null,17358,1,0,0,''),
(38995,-1810020, 'No more, Arthas! No more lives will be consumed by your hatred!',null,null,null,null,null,null,null,null,17393,1,0,0,''),
(38579,-1810021, 'Free at last! It is over, my son. This is the moment of reckoning.',null,null,null,null,null,null,null,null,17397,1,0,0,''),
(38995,-1810022, 'The Lich King must fall!',null,null,null,null,null,null,null,null,17389,1,0,0,''),
(38579,-1810023, 'Rise up, champions of the Light!',null,null,null,null,null,null,null,null,17398,1,0,0,''),
(36597,-1810024, 'Now I stand, the lion before the lambs... and they do not fear.',null,null,null,null,null,null,null,null,17361,1,0,0,''),
(36597,-1810025, 'They cannot fear.',null,null,null,null,null,null,null,null,17362,1,0,0,''),
(0,-1810026, 'Argh... Frostmourne, obey me!',null,null,null,null,null,null,null,null,17367,1,0,0,''),
(36597,-1810027, 'Frostmourne hungers...',null,null,null,null,null,null,null,null,17366,1,0,0,''),
(0,-1810028, 'Frostmourne feeds on the soul of your fallen ally!',null,null,null,null,null,null,null,null,17368,1,0,0,''),
(36597,-1810029, 'Val''kyr, your master calls!',null,null,null,null,null,null,null,null,17373,1,0,0,''),
(36597,-1810030, 'Watch as the world around you collapses!',null,null,null,null,null,null,null,null,17370,1,0,0,''),
(36597,-1810031, 'You gnats actually hurt me! Perhaps I''ve toyed with you long enough, now taste the vengeance of the grave!',null,null,null,null,null,null,null,null,17359,1,0,0,''),
(36597,-1810032, 'The Lich King begins to cast Defile',null,null,null,null,null,null,null,null,0,3,0,0,'');

DELETE FROM `spell_proc_event` WHERE `entry` IN (
70602, 72178, 69762, 70107, 72176, 71604, 72833, 70904,
72832, 72455, 70672, 72408, 72256, 71971, 70001, 71494);
INSERT INTO `spell_proc_event` VALUES
(70107, 0x08, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000054, 0x00000000, 0, 20, 0),
(69762, 0x00, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00014000, 0x00000000, 0, 101, 0),
(72176, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00051154, 0x00000000, 0, 100, 0),
(70602, 0x20, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x000AAA20, 0x00000000, 0, 100, 0),
(71494, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0, 101, 0),
(72178, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00055510, 0x00000000, 0, 100, 0),
(71604, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0, 100, 0),
(70001, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0, 100, 0),
(71971, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0, 100, 0),
(72256, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0, 100, 0),
(72408, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0, 100, 0),
(70672, 0x28, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000000, 0, 100, 0),
(72455, 0x28, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000000, 0, 100, 0),
(72832, 0x28, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000000, 0, 100, 0),
(72833, 0x28, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000000, 0, 100, 0),
(70904, 0x10, 0x06, 0x00000000, 0x00000000, 0x00000000, 0x00008000, 0x00000000, 0, 100, 0);

DELETE FROM `creature_template` WHERE `entry` = 36672;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `Ainame`, `MovementType`, `inhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
('36672','0','0','0','0','0','1126','11686','0','0','Coldflame','','','0','80','80','0','21','21','0','1','1.14286','1','0','2','2','0','24','1','0','0','1','33554432','8','0','0','0','0','0','1','1','0','10','1024','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','0','0','0','0','0','0','0','0','1','0','0','128','npc_coldflame','12340');

DELETE FROM `spell_script_names` WHERE `spell_id` IN (72705, 69147, 69140, 69075, 70834, 70835, 70836);
INSERT INTO `spell_script_names` VALUES
(72705, 'spell_marrowgar_coldflame'),
(69147, 'spell_marrowgar_coldflame_trigger'),
(69140, 'spell_marrowgar_coldflame'),
(69075, 'spell_marrowgar_bone_storm'),
(70834, 'spell_marrowgar_bone_storm'),
(70835, 'spell_marrowgar_bone_storm'),
(70836, 'spell_marrowgar_bone_storm');

-- UPDATEs for Lady Deathwhisper

UPDATE `creature_template` SET `ScriptName`='boss_lady_deathwhisper' WHERE `entry`=36855;
UPDATE `creature_template` SET `ScriptName` = 'npc_cult_fanatic' WHERE `entry` IN (37890,38009,38135);
UPDATE `creature_template` SET `ScriptName` = 'npc_cult_adherent' WHERE `entry` IN (37949,38010,38136);
UPDATE `creature_template` SET `ScriptName` = 'npc_vengeful_shade' WHERE `entry` = 38222;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (70903,71236) AND `ScriptName` = 'spell_cultist_dark_martyrdom';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(70903,'spell_cultist_dark_martyrdom'),
(71236,'spell_cultist_dark_martyrdom');

DELETE FROM `creature` WHERE `id` = 37824;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(null,'37824','631','15','1','0','0','4388.1','3213.29','408.74','3.83972','86400','0','0','25200','0','0','0','0','0','0'),
(null,'37824','631','15','1','11686','0','4388.1','3213.29','408.74','3.83972','86400','0','0','25200','0','0','0','0','0','0'),
(null,'37824','631','15','1','11686','0','4324.28','3215.04','408.705','5.58505','86400','0','0','25200','0','0','0','0','0','0');

-- Correct script names for Blood prince council event IN Icecrown Citadel
UPDATE `creature_template` SET `ScriptName` = 'boss_prince_keleseth_icc' WHERE `entry` = 37972;
UPDATE `creature_template` SET `ScriptName` = 'boss_prince_valanar_icc' WHERE `entry` = 37970;
UPDATE `creature_template` SET `ScriptName` = 'boss_prince_taldaram_icc' WHERE `entry` = 37973;

-- Fix Blood Prince Council immunities
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854399 WHERE `entry` IN (37970, 37972, 37973, 38401, 38784, 38785, 38399, 38769, 38770, 38400, 38771, 38772);

-- Blood Prince Council update
UPDATE `creature_template` SET `ScriptName` = 'npc_shock_vortex' WHERE `entry` = 38422;
DELETE FROM `creature` WHERE `id` = 38557;
DELETE FROM smart_scripts WHERE entryorguid IN (/*93949, 93948, 93947, 93946,*/ -93949, -93948, -93947, -93946);
UPDATE `creature_template` SET `ScriptName` = 'npc_kinetic_bomb_target' WHERE `entry` = 38458;
UPDATE `creature_template` SET `lootid` = '37970' WHERE `entry` = 37973;
UPDATE `creature_template` SET `lootid` = '37970' WHERE `entry` = 37972;
UPDATE `creature_template` SET `lootid` = '38401' WHERE `entry` = 38400;
UPDATE `creature_template` SET `lootid` = '38401' WHERE `entry` = 38399;
UPDATE `creature_template` SET `lootid` = '38784' WHERE `entry` = 38771;
UPDATE `creature_template` SET `lootid` = '38784' WHERE `entry` = 38769;
UPDATE `creature_template` SET `lootid` = '38785' WHERE `entry` = 38772;
UPDATE `creature_template` SET `lootid` = '38785' WHERE `entry` = 38770;
UPDATE `creature_template` SET `dynamicflags` = '9' WHERE `entry` IN (37973, 37972, 38400, 38399, 38771, 38769, 38772, 38770);

-- Blood Queen Lana'thel
UPDATE `creature_template` SET `ScriptName` = 'boss_blood_queen_lana_thel' WHERE `entry` = 37955;

-- Valithria Dreamwalker
UPDATE `creature_template` SET `unit_flags` = 33554432 WHERE `entry` IN (38186, 38429);
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 38429;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 37985;
UPDATE `creature_template` SET `ScriptName` = 'npc_dreamcloud_icc' WHERE `entry` = 38421;
DELETE FROM `spell_script_names` WHERE `spell_id` IN (71301, 71977);
INSERT INTO `spell_script_names` VALUES (71301, 'spell_valithria_summon_portal'), (71977, 'spell_valithria_summon_portal');
DELETE FROM `spell_script_names` WHERE `spell_id` IN (70873, 71941);
INSERT INTO `spell_script_names` VALUES (70873, 'spell_valithria_vigor'), (71941, 'spell_valithria_vigor');
DELETE FROM `spell_script_names` WHERE `spell_id` IN (71157, 29306);
INSERT INTO `spell_script_names` VALUES (71157, 'spell_rotface_plagued_zombie_infected_wound'), (29306, 'spell_rotface_plagued_zombie_infected_wound');
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` IN (38008, 38752);
-- DELETE FROM `creature` WHERE `id` = 38752 AND NOT (`guid` = 10718);
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `guid` = 10718;
DELETE FROM `creature_template` WHERE `entry` = 38752;
INSERT INTO `creature_template` VALUES (38752, 0, 0, 0, 0, 0, 26623, 0, 0, 0, 'Green Dragon Combat Trigger', '', '', 0, 80,
80, 2, 16, 16, 0, 1, 1.14286, 1, 1, 1, 2, 0, 1, 1, 2000, 2000, 1, 32832, 8, 0, 0, 0, 0, 0, 1, 2, 126, 7, 8, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 358, 803160063, 0, 'npc_icc_combat_stalker', 12340);
REPLACE INTO `spell_script_names` VALUES (70766, 'spell_dream_state');

-- Valithria Dreamwalker UPDATEs
UPDATE `creature_template` SET `ScriptName` = 'npc_column_of_frost_icc' WHERE `entry` = 37918;
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_valithria_gluttonous_abomination' WHERE `entry` = 37886;
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_valithria_rot_worm' WHERE `entry` = 37907;
DELETE FROM `spell_script_names` WHERE `spell_id` IN (70912, 70913, 70914, 70915, 70916);
INSERT INTO `spell_script_names` VALUES
(70912,'spell_valithria_summon_adds'),
(70913,'spell_valithria_summon_adds'),
(70914,'spell_valithria_summon_adds'),
(70915,'spell_valithria_summon_adds'),
(70916,'spell_valithria_summon_adds');
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_valithria_blistering_zombie' WHERE `entry` = 37934;
UPDATE `creature_template` SET `Scriptname` = 'npc_icc_valithria_supressor' WHERE `entry` = 37863;
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_valithria_risen_archmage' WHERE `entry` = 37868;
UPDATE `creature_template` SET `spell1` = 0, `spell2` = 0, `Ainame` = '' WHERE `entry` IN (37868, 37863, 37934);
UPDATE `creature_template` SET `Ainame` = '' WHERE `entry` IN (37868, 37934, 37886, 37863);
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_valithria_blazing_skeleton' WHERE `entry` = 36791;

-- Valithria Dreamwalker UPDATEs
UPDATE `creature_template` SET `ScriptName` = 'npc_column_of_frost_icc' WHERE `entry` = 37918;
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_valithria_gluttonous_abomination' WHERE `entry` = 37886;
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_valithria_mana_void' WHERE `entry` = 38068;
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_valithria_rot_worm' WHERE `entry` = 37907;
DELETE FROM `spell_script_names` WHERE `spell_id` IN (70912, 70913, 70914, 70915, 70916);
INSERT INTO `spell_script_names` VALUES
(70912,'spell_valithria_summon_adds'),
(70913,'spell_valithria_summon_adds'),
(70914,'spell_valithria_summon_adds'),
(70915,'spell_valithria_summon_adds'),
(70916,'spell_valithria_summon_adds');
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_valithria_blistering_zombie' WHERE `entry` = 37934;
UPDATE `creature_template` SET `Scriptname` = 'npc_icc_valithria_supressor' WHERE `entry` = 37863;
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_valithria_risen_archmage' WHERE `entry` = 37868;
UPDATE `creature_template` SET `spell1` = 0, `spell2` = 0, `Ainame` = '' WHERE `entry` IN (37868, 37863, 37934);
UPDATE `creature_template` SET `Ainame` = '' WHERE `entry` IN (37868, 37934, 37886, 37863);
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_valithria_blazing_skeleton' WHERE `entry` = 36791;

-- Sindragosa
UPDATE `creature_template` SET `difficulty_entry_1` = 38139 WHERE `entry` = 37531;
UPDATE `creature_template` SET `difficulty_entry_1` = 38151 WHERE `entry` = 37532;
UPDATE `creature_template` SET `difficulty_entry_2` = 0,`difficulty_entry_3` = 0 WHERE `entry` = 37533;
UPDATE `creature_template` SET `difficulty_entry_2` = 0,`difficulty_entry_3` = 0 WHERE `entry` = 37534;
UPDATE `creature_template` SET `difficulty_entry_1` = 38320,`difficulty_entry_2` = 38321,`difficulty_entry_3` = 38322 WHERE `entry` = 36980;
UPDATE `creature_template` SET `minlevel` = 82,`maxlevel` = 82,`unit_class` = 1,`faction_A` = 14,`faction_H` = 14,`unit_flags` = `unit_flags`|33554432,`baseattacktime` = 2000,`flags_extra` = `flags_extra`|128 WHERE `entry` = 38223; -- Icy Blast
UPDATE `creature_template` SET `minlevel` = 80,`maxlevel` = 80,`unit_class` = 1,`faction_A` = 2209,`faction_H` = 2209,`dynamicflags` = 8,`baseattacktime` = 2000,`equipment_id` = 523,`speed_walk` = 1,`speed_run` = 1.42857 WHERE `entry` IN (37531,38139); -- Frostwarden Handler
UPDATE `creature_template` SET `minlevel` = 80,`maxlevel` = 80,`unit_class` = 2,`faction_A` = 16,`faction_H` = 16,`dynamicflags` = 8,`baseattacktime` = 2000,`speed_run` = 1 WHERE `entry` IN (37532,38151); -- Frostwing Whelp
UPDATE `creature_template` SET `minlevel` = 82,`maxlevel` = 82,`unit_class` = 2,`faction_A` = 21,`faction_H` = 21,`unit_flags` = `unit_flags`|64,`baseattacktime` = 2000,`speed_walk` = 2,`speed_run` = 1.5873,`MovementType` = 2,`InhabitType` = 5 WHERE `entry` IN (37533,38220); -- Rimefang
UPDATE `creature_template` SET `minlevel` = 82,`maxlevel` = 82,`unit_class` = 2,`faction_A` = 21,`faction_H` = 21,`unit_flags` = `unit_flags`|64,`baseattacktime` = 2000,`speed_walk` = 2,`speed_run` = 1.5873,`MovementType` = 2,`InhabitType` = 5 WHERE `entry` IN (37534,38219); -- Spinestalker
UPDATE `creature_template` SET `minlevel` = 83,`maxlevel` = 83,`unit_class` = 1,`faction_A` = 2068,`faction_H` = 2068,`unit_flags` = 0,`baseattacktime` = 1500,`speed_walk` = 4.8,`speed_run` = 4.28571 WHERE `entry` IN (36853,38265,38266,38267); -- Sindragosa
UPDATE `creature_template` SET `minlevel` = 80,`maxlevel` = 80,`unit_class` = 2,`faction_A` = 14,`faction_H` = 14,`unit_flags` = `unit_flags`|33554944,`baseattacktime` = 2000,`flags_extra` = `flags_extra`|128 WHERE `entry` = 37186; -- Frost Bomb
UPDATE `creature_template` SET `minlevel` = 80,`maxlevel` = 80,`unit_class` = 1,`faction_A` = 14,`faction_H` = 14,`baseattacktime` = 2000,`speed_run` = 1 WHERE `entry` IN (36980,38320,38321,38322); -- Ice Tomb
UPDATE `creature_template` SET `RegenHealth` = 0 WHERE `entry` IN (36980,38320,38321,38322); -- Ice Tomb health regen

-- Creature addon
UPDATE `creature_addon` SET `bytes1` = 0 WHERE `guid` IN (@SPINESTALKER,@RIMEFANG);

-- Creature model data
UPDATE `creature_model_info` SET `gender` = 1 WHERE `modelid` = 30362;

-- Gameobject templates
UPDATE `gameobject_template` SET `flags` = 33,`faction` = 114 WHERE `entry` = 202396; -- Ice Wall
UPDATE `gameobject_template` SET `flags` = 32,`faction` = 114 WHERE `entry` = 201722; -- Ice Block

-- Gameobject spawns
DELETE FROM `gameobject` WHERE `id` = 202396;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(121712,202396,631,15,1,4309.686,2491.27441,211.170792,0.209439442,0,0,0,0,120,0,0); -- Ice Wall

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 70598;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`Comment`) VALUES
(13,70598,18,1, 'Sindragosa''s Fury - player targets');
-- Fragment of the Nightmare's Corruption drops 100% as of patch 3.0.2
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -100 WHERE `item` IN (21146,21147,21148,21149);
-- Insert loot for Gently Shaken Gift
DELETE FROM `item_loot_template` WHERE `entry` = 21271;
INSERT INTO `item_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(21271,21241,100,1,0,5,5);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12822,12996,12972,12989,12758,12955,13049,13060,13102,13133,13134,13135);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(12822,11,0,0, 'achievement_all_you_can_eat'), -- All You Can Eat (10 player)
(12822,12,0,0, ''), -- All You Can Eat (10 player)
(12996,11,0,0, 'achievement_all_you_can_eat'), -- All You Can Eat (10 player) Heroic
(12996,12,2,0, ''), -- All You Can Eat (10 player) Heroic
(12972,11,0,0, 'achievement_all_you_can_eat'), -- All You Can Eat (25 player)
(12972,12,1,0, ''), -- All You Can Eat (25 player)
(12989,11,0,0, 'achievement_all_you_can_eat'), -- All You Can Eat (25 player) Heroic
(12989,12,3,0, ''), -- All You Can Eat (25 player) Heroic
(12758,12,0,0, ''), -- The Frostwing Halls (10 player) Sindragosa
(12955,12,1,0, ''), -- The Frostwing Halls (25 player) Sindragosa
(13049,12,2,0, ''), -- Heroic: The Frostwing Halls (10 player) Sindragosa
(13060,12,3,0, ''), -- Heroic: The Frostwing Halls (25 player) Sindragosa
(13102,12,0,0, ''), -- Sindragosa kills (Icecrown 10 player)
(13133,12,1,0, ''), -- Sindragosa kills (Icecrown 25 player)
(13134,12,2,0, ''), -- Sindragosa kills (Heroic Icecrown 10 player)
(13135,12,3,0, ''); -- Sindragosa kills (Heroic Icecrown 25 player)
DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5604,5698,5649);
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(5604,'at_sindragosa_lair'),
(5698, 'at_icc_saurfang_portal'),
(5649, 'at_icc_shutdown_traps');

DELETE FROM `creature_text` WHERE `entry` = 36853;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(36853,0,0, 'You are fools to have come to this place! The icy winds of Northrend will consume your souls!',1,0,0,0,0,17007, 'Sindragosa - SAY_AGGRO'),
(36853,1,0, 'Suffer, mortals, as your pathetic magic betrays you!',1,0,0,0,0,17014, 'Sindragosa - SAY_UNCHAINED_MAGIC'),
(36853,2,0, '%s prepares to unleash a wave of blistering cold!',3,0,0,0,0,0, 'Sindragosa - EMOTE_WARN_BLISTERING_COLD'),
(36853,3,0, 'Can you feel the cold hand of death upon your heart?',1,0,0,0,0,17013, 'Sindragosa - SAY_BLISTERING_COLD'),
(36853,4,0, 'Aaah! It burns! What sorcery is this?!',1,0,0,0,0,17015, 'Sindragosa - SAY_RESPITE_FOR_A_TORMENTED_SOUL'),
(36853,5,0, 'Your incursion ends here! None shall survive!',1,0,0,0,0,17012, 'Sindragosa - SAY_AIR_PHASE'),
(36853,6,0, 'Now feel my master''s limitless power and despair!',1,0,0,0,0,17016, 'Sindragosa - SAY_PHASE_2'),
(36853,7,0, '%s fires a frozen orb towards $N!',3,0,0,0,0,0, 'Sindragosa - EMOTE_WARN_FROZEN_ORB'),
(36853,8,0, 'Perish!',1,0,0,0,0,17008, 'Sindragosa - SAY_KILL 1'),
(36853,8,1, 'A flaw of mortality...',1,0,0,0,0,17009, 'Sindragosa - SAY_KILL 2'),
(36853,9,0, 'Enough! I tire of these games!',1,0,0,0,0,17011, 'Sindragosa - SAY_BERSERK'),
(36853,10,0, 'Free...at last...',1,0,0,0,0,17010, 'Sindragosa - SAY_DEATH');
UPDATE `creature_template` SET `ScriptName` = 'boss_sindragosa' WHERE `entry` = 36853;
UPDATE `creature_template` SET `ScriptName` = 'npc_ice_tomb' WHERE `entry` = 36980;
UPDATE `creature_template` SET `ScriptName` = 'npc_spinestalker' WHERE `entry` = 37534;
UPDATE `creature_template` SET `ScriptName` = 'npc_rimefang_icc' WHERE `entry` = 37533;
UPDATE `creature_template` SET `ScriptName` = 'npc_sindragosa_trash' WHERE `entry` IN (37531,37532);
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (70117,70157);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(70117,70122,1, 'Sindragosa - Icy Grip'),
(70157,69700,2, 'Sindragosa - Ice Tomb resistance');
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_frostwarden_handler_order_whelp';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_frostwarden_handler_focus_fire';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_rimefang_icy_blast';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_sindragosa_s_fury';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_sindragosa_unchained_magic';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_sindragosa_instability';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_sindragosa_frost_beacon';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_sindragosa_ice_tomb';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_sindragosa_ice_tomb_dummy';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_sindragosa_ice_tomb_trap';
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_sindragosa_collision_filter';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(71357,'spell_frostwarden_handler_order_whelp'),
(71350,'spell_frostwarden_handler_focus_fire'),
(71376,'spell_rimefang_icy_blast'),
(70598,'spell_sindragosa_s_fury'),
(69762,'spell_sindragosa_unchained_magic'),
(69766,'spell_sindragosa_instability'),
(70126,'spell_sindragosa_frost_beacon'),
(69712,'spell_sindragosa_ice_tomb'),
(69675,'spell_sindragosa_ice_tomb_dummy'),
(70157,'spell_sindragosa_ice_tomb_trap'),
(69845,'spell_sindragosa_collision_filter'),
(71053,'spell_sindragosa_collision_filter'),
(71054,'spell_sindragosa_collision_filter'),
(71055,'spell_sindragosa_collision_filter'),
(70127,'spell_sindragosa_collision_filter'),
(72528,'spell_sindragosa_collision_filter'),
(72529,'spell_sindragosa_collision_filter'),
(72530,'spell_sindragosa_collision_filter'),
(70117,'spell_sindragosa_collision_filter');

-- Teleports
DELETE FROM `npc_text` WHERE `id` BETWEEN 800000 AND 800006;
INSERT INTO `npc_text` (`id`, `text0_0`) VALUES
(800000, 'Teleport to the Light\'s Hammer'),
(800001, 'Teleport to the Oratory of the Damned.'),
(800002, 'Teleport to the Rampart of Skulls.'),
(800003, 'Teleport to the Deathbringer\'s Rise.'),
(800004, 'Teleport to the Upper Spire.'),
(800005, 'Teleport to the Sindragosa\'s Lair'),
(800006, 'Teleport to The Frozen Throne');

-- Traps
UPDATE `gameobject_template` SET `ScriptName` = 'go_icc_spirit_alarm' WHERE `entry` IN (201814, 201815, 201816, 201817);
DELETE FROM `creature_addon` WHERE `guid` IN (93950, 101906, 101936, 101937, 101939, 101951, 101995, 101996, 115554, 115555, 115742, 115743);
DELETE FROM `waypoint_scripts` WHERE `dataint` = 38879;
DELETE FROM `waypoint_data` WHERE `action` IN (716, 717, 718, 719, 70, 721, 722, 747, 748, 749, 750);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (70536, 70545, 70546, 70547);
INSERT INTO `spell_script_names` VALUES
(70546, 'spell_icc_spirit_alarm'),
(70536, 'spell_icc_spirit_alarm'),
(70545, 'spell_icc_spirit_alarm'),
(70547, 'spell_icc_spirit_alarm');
REPLACE INTO `spell_script_names` VALUES (70461, 'spell_coldflame_trap');
UPDATE `gameobject_template` SET `ScriptName` = 'go_icc_plagueworks_valve' WHERE `entry` IN (201615, 201616);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (70536, 70545, 70546, 70547);
INSERT INTO `spell_script_names` VALUES
(70546, 'spell_icc_spirit_alarm'),
(70536, 'spell_icc_spirit_alarm'),
(70545, 'spell_icc_spirit_alarm'),
(70547, 'spell_icc_spirit_alarm');
REPLACE INTO `spell_script_names` VALUES (70461, 'spell_coldflame_trap');
UPDATE `gameobject_template` SET `ScriptName` = 'go_icc_plagueworks_valve' WHERE `entry` IN (201615, 201616);

-- The Lich King
DELETE FROM `areatrigger_teleport` WHERE `id` = 5718;
UPDATE `creature_template` SET `ScriptName` = 'npc_shambling_horror_icc' WHERE `entry` = 37698;
UPDATE `creature_template` SET `ScriptName` = 'npc_raging_spirit_icc' WHERE `entry` = 36701;
REPLACE INTO `spell_script_names` VALUES
(72743, 'spell_lich_king_defile'),
(72429, 'spell_lich_king_tirion_mass_resurrection'),
(74115, 'spell_lich_king_pain_and_suffering'),
(70501, 'spell_vile_spirit_target_search'),
(68576, 'spell_valkyr_eject_passenger'),
(69030, 'spell_valkyr_target_search'),
(72133, 'spell_lich_king_pain_and_suffering_effect'),
(73789, 'spell_lich_king_pain_and_suffering_effect'),
(73788, 'spell_lich_king_pain_and_suffering_effect'),
(73790, 'spell_lich_king_pain_and_suffering_effect'),
(70498, 'spell_lich_king_vile_spirit_summon'),
(70500, 'spell_lich_king_vile_spirit_summon_visual'),
(68980, 'spell_lich_king_harvest_soul'),
(74325, 'spell_lich_king_harvest_soul');
UPDATE `creature_template` SET `ScriptName` = 'npc_ice_sphere_icc' WHERE `entry` = 36633;
UPDATE `creature_template` SET `ScriptName` = 'npc_defile_icc' WHERE `entry` = 38757;
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` IN (36609, 39120, 39121, 39122);
UPDATE `creature_template` SET `vehicleid` = 533 WHERE `entry` IN (36609, 39120, 39121, 39122);
UPDATE `creature` SET `position_z` = 1040 WHERE `id` = 22515 AND `map` = 631;
UPDATE `creature_template` SET `modelid1` = 11686 WHERE `entry` IN (36633, 39305, 39306, 39307);
-- Make Invisible Stalker really invisible
UPDATE `creature_template` SET `modelid1` = 11686 WHERE `entry` = 15214;
-- Add Frostmourne platform
DELETE FROM `gameobject` WHERE id = 202161;
INSERT INTO `gameobject` VALUES
(null,202161,631,15,1, 495.708,-2523.75,1045.95, 3.14159, 7.7568, 0,0,0,604800,100,1);
UPDATE `creature` SET `id` = 36823, `modelid` = 0, `curhealth` = 0, `spawntimesecs` = '604800' WHERE `guid` = 86812;
UPDATE `creature` SET `id` = 36824, `modelid` = 0, `curhealth` = 0, `spawntimesecs` = '604800' WHERE `guid` = 86813;
UPDATE `creature_template` SET `ScriptName` = 'npc_terenas_fighter_icc' WHERE `entry` = 36823;
UPDATE `creature_template` SET `ScriptName` = 'npc_spirit_warden_icc' WHERE `entry` = 36824;
UPDATE `creature_template` SET `dmg_multiplier` = 52 WHERE `entry` = 36824; -- Spirit Warden
UPDATE `creature_template` SET `dmg_multiplier` = 35 WHERE `entry` = 36823; -- Terenas Menethil
-- Achievement criteria for The Lich King
-- Bane of the Fallen King (10 player heroic)
-- Realm First! Fall of the Lich King (25 player heroic)
-- The Frozen Throne (10 player)
-- The Frozen Throne (25 player)
-- The Light of Dawn (25 player heroic)
DELETE FROM `achievement_criteria_data` where `criteria_id` IN (12825,12818,12764,12909,12826);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(12825, 12, 2, 0, ''),
(12818, 12, 3, 0, ''),
(12764, 12, 0, 0, ''),
(12909, 12, 1, 0, ''),
(12826, 12, 3, 0, '');

-- Blood Prince entries FROM TrinityCore
DELETE FROM `creature_template` WHERE `entry` IN (37970, 37972, 37973, 38401, 38784, 38785, 38399, 38769, 38770, 38400, 38771, 38772);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `Ainame`, `MovementType`, `inhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) values
('37970','38401','38784','38785','0','0','30858','0','0','0','Prince Valanar','','','0','83','83','2','16','16','0','1.6','1.42857','1','3','509','683','0','805','35','0','0','1','536904000','8','0','0','0','0','0','371','535','135','6','108','37970','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','405','1','1','0','0','0','0','0','0','0','150','0','10092','0','1','boss_prince_valanar_icc','12340'),
('37972','38399','38769','38770','0','0','30857','0','0','0','Prince Keleseth','','','0','83','83','2','16','16','0','1.6','1.42857','1','3','509','683','0','805','35','0','0','1','536904000','8','0','0','0','0','0','371','535','135','6','108','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','405','1','1','0','0','0','0','0','0','0','150','0','10077','0','1','boss_prince_keleseth_icc','12340'),
('37973','38400','38771','38772','0','0','30856','0','0','0','Prince Taldaram','','','0','83','83','2','16','16','0','1.6','1.42857','1','3','509','683','0','805','35','0','0','1','536904000','8','0','0','0','0','0','371','535','135','6','108','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','405','1','1','0','0','0','0','0','0','0','150','0','10091','0','1','boss_prince_taldaram_icc','12340'),
('38399','0','0','0','0','0','30857','0','0','0','Prince Keleseth (1)','','','0','83','83','2','16','16','0','1.6','1.42857','1','3','509','683','0','805','70','0','0','1','536904000','8','0','0','0','0','0','371','535','135','6','108','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1620','1','1','0','0','0','0','0','0','0','150','0','10077','0','1','','12340'),
('38400','0','0','0','0','0','30856','0','0','0','Prince Taldaram (1)','','','0','83','83','2','16','16','0','1.6','1.42857','1','3','509','683','0','805','70','0','0','1','536904000','8','0','0','0','0','0','371','535','135','6','108','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1620','1','1','0','0','0','0','0','0','0','150','0','10091','0','1','','12340'),
('38401','0','0','0','0','0','30858','0','0','0','Prince Valanar (1)','','','0','83','83','2','16','16','0','1.6','1.42857','1','3','509','683','0','805','35','2000','2000','1','536904000','8','0','0','0','0','0','371','535','100','6','108','38401','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1620','1','1','0','0','0','0','0','0','0','150','0','10092','0','1','','12340'),
('38769','0','0','0','0','0','30857','0','0','0','Prince Keleseth (2)','','','0','83','83','2','16','16','0','1.6','1.42857','1','3','509','683','0','805','35','0','0','1','536904000','8','0','0','0','0','0','371','535','135','6','108','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','546.75','1','1','0','0','0','0','0','0','0','150','0','10077','0','1','','12340'),
('38770','0','0','0','0','0','30857','0','0','0','Prince Keleseth (3)','','','0','83','83','2','16','16','0','1.6','1.42857','1','3','509','683','0','805','35','0','0','1','536904000','8','0','0','0','0','0','371','535','135','6','108','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','2187','1','1','0','0','0','0','0','0','0','150','0','10077','0','1','','12340'),
('38771','0','0','0','0','0','30856','0','0','0','Prince Taldaram (2)','','','0','83','83','2','16','16','0','1.6','1.42857','1','3','509','683','0','805','35','0','0','1','536904000','8','0','0','0','0','0','371','535','135','6','108','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','546.75','1','1','0','0','0','0','0','0','0','150','0','10091','0','1','','12340'),
('38772','0','0','0','0','0','30856','0','0','0','Prince Taldaram (3)','','','0','83','83','2','16','16','0','1.6','1.42857','1','3','509','683','0','805','35','0','0','1','536904000','8','0','0','0','0','0','371','535','135','6','108','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','2187','1','1','0','0','0','0','0','0','0','150','0','10091','0','1','','12340'),
('38784','0','0','0','0','0','30858','0','0','0','Prince Valanar (2)','','','0','83','83','2','16','16','0','1.6','1.42857','1','3','509','683','0','805','35','2000','2000','1','536904000','8','0','0','0','0','0','371','535','100','6','108','38784','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','546.75','1','1','0','0','0','0','0','0','0','150','0','10092','0','1','','12340'),
('38785','0','0','0','0','0','30858','0','0','0','Prince Valanar (3)','','','0','83','83','2','16','16','0','1.6','1.42857','1','3','509','683','0','805','35','2000','2000','1','536904000','8','0','0','0','0','0','371','535','100','6','108','38785','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','2187','1','1','0','0','0','0','0','0','0','150','0','10092','0','1','','12340');

DELETE FROM `creature` WHERE `id` IN (37970, 37972, 37973);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values
(null,'37970','631','15','1','0','0','4680.29','2769.24','364.17','3.14159','86400','0','0','1','0','0','0','0','0','0'),
(null,'37972','631','15','1','0','0','4682.73','2783.42','364.17','3.14159','86400','0','0','1','0','0','0','0','0','0'),
(null,'37973','631','15','1','0','0','4682.89','2755.11','364.17','3.14159','86400','0','0','1','0','0','0','0','0','0');

-- Implement equipment_id fixes
UPDATE `creature_template` set `equipment_id` = 0 WHERE `Entry` IN (37970,37972,37973,38399,38400,38401,38769,38770,38771,38772,38784,38785);
-- DELETE FROM `creature_addon` WHERE `GUID` IN (82289,88387,95000,138237,13828,138239,138287,138288,138289);
-- DELETE FROM `conditions` WHERE `SourceEntry` IN (62912,62910,62297,62907,65667,63475,62549,62546);

-- Icecrown Citadel trash
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_high_priest' WHERE `entry` = 36829;
UPDATE `creature_template` SET `ScriptName` = 'npc_val_kyr_herald' WHERE `entry` = 37098;
UPDATE `creature_template` SET `ScriptName` = 'npc_severed_essence' WHERE `entry` = 38410;
REPLACE INTO `spell_script_names` VALUES (69483, 'spell_icc_dark_reckoning');
UPDATE `creature_template` SET `ScriptName` = 'npc_the_damned' WHERE `entry` = 37011;
UPDATE `creature_template` SET `ScriptName` = 'npc_servant_of_the_throne' WHERE `entry` = 36724;
UPDATE `creature_template` SET `ScriptName` = 'npc_blighted_abomination' WHERE `entry` = 37022;
UPDATE `creature_template` SET `ScriptName` = 'npc_plague_scientist' WHERE `entry` = 37023;
UPDATE `creature_template` SET `ScriptName` = 'npc_decaying_colossus' WHERE `entry` = 36880;
UPDATE `creature_template` SET `ScriptName` = 'npc_pustulating_horror' WHERE `entry` = 10404;
UPDATE `creature_template` SET `ScriptName` = 'npc_ancient_skeletal_soldier' WHERE `entry` = 37012;
REPLACE INTO `spell_script_names` VALUES (70964, 'spell_valithria_vigor'); -- Just to ensure that auras stack
-- Set immunes on Spinestalker, Rimefang, Stinky, Precious, Decaying Colossus, Sister Svalna, Deathbound Ward
UPDATE `creature_template` SET `mechanic_immune_mask` = 667631615 WHERE `entry` IN (37533, 37534, 38219, 38220, 37217, 38103, 37025, 38064, 36880, 37655, 37126, 38258, 37007, 38031);
-- Setting current health of Princes
UPDATE `creature` SET `curhealth` = 1 WHERE `id` IN (37970, 38401, 38784, 38785, 37972, 38399, 38769, 37973, 38400, 38771);

-- Putricide Mutated Abomination spell fix for 10h, 25n and 25h modes
UPDATE `creature_template` SET `spell1` = 70360, `spell2` = 72457, `spell3` = 70542, `VehicleId` = 591 WHERE `entry` = 38788;
UPDATE `creature_template` SET `spell1` = 70360, `spell2` = 72875, `spell3` = 70542, `VehicleId` = 591 WHERE `entry` = 38789;
UPDATE `creature_template` SET `spell1` = 70360, `spell2` = 72876, `spell3` = 70542, `VehicleId` = 591 WHERE `entry` = 38790;

-- Deathbringer Saurfang from TrinityCore
REPLACE INTO `spell_script_names` VALUES
(72202, 'spell_deathbringer_blood_link'),
(72178, 'spell_deathbringer_blood_link_aura'),
(72371, 'spell_deathbringer_blood_power'),
(72409, 'spell_deathbringer_rune_of_blood'),
(72447, 'spell_deathbringer_rune_of_blood'),
(72448, 'spell_deathbringer_rune_of_blood'),
(72449, 'spell_deathbringer_rune_of_blood'),
(72380, 'spell_deathbringer_blood_nova'),
(72438, 'spell_deathbringer_blood_nova'),
(72439, 'spell_deathbringer_blood_nova'),
(72440, 'spell_deathbringer_blood_nova');
UPDATE `creature_template` SET `ScriptName` = 'boss_deathbringer_saurfang' WHERE `entry` = 37813;
UPDATE `creature_template` SET `ScriptName` = 'npc_high_overlord_saurfang_icc' WHERE `entry` = 37187;
UPDATE `creature_template` SET `ScriptName` = 'npc_muradin_bronzebeard_icc' WHERE `entry` = 37200;
UPDATE `creature_template` SET `ScriptName` = 'npc_saurfang_event' WHERE `entry` IN (37920,37830);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12778,13036,13035,13037) AND `type` IN (0,11);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12778,13036,13035,13037) AND `type` IN (0,11);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(12778,11,0,0, 'achievement_ive_gone_and_made_a_mess'),
(13036,11,0,0, 'achievement_ive_gone_and_made_a_mess'),
(13035,11,0,0, 'achievement_ive_gone_and_made_a_mess'),
(13037,11,0,0, 'achievement_ive_gone_and_made_a_mess');
-- [10468] ICC texts (Shauren)
DELETE FROM `creature_text` WHERE `entry` IN (36612,36626,36627,36678,36855,37187,37188,37200,37813,37879,37970,37972,37973,38004);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`sound`,`language`,`probability`,`emote`,`duration`,`comment`) VALUES
(36612,0,0,'This is the beginning AND the end, mortals. None may enter the master''s sanctum!',1,16950,0,0,0,0,'Lord Marrowgar - SAY_ENTER_ZONE'),
(36612,1,0,'The Scourge will wash over this world as a swarm of death and destruction!',1,16941,0,0,0,0,'Lord Marrowgar - SAY_AGGRO'),
(36612,2,0,'BONE STORM!',1,16946,0,0,0,0,'Lord Marrowgar - SAY_BONE_STORM'),
(36612,3,0,'Bound by bone!',1,16947,0,0,0,0,'Lord Marrowgar - SAY_BONESPIKE_1'),
(36612,3,1,'Stick Around!',1,16948,0,0,0,0,'Lord Marrowgar - SAY_BONESPIKE_2'),
(36612,3,2,'The only escape is death!',1,16949,0,0,0,0,'Lord Marrowgar - SAY_BONESPIKE_3'),
(36612,4,0,'More bones for the offering!',1,16942,0,0,0,0,'Lord Marrowgar - SAY_KILL_1'),
(36612,4,1,'Languish in damnation!',1,16943,0,0,0,0,'Lord Marrowgar - SAY_KILL_2'),
(36612,5,0,'I see... only darkness...',1,16944,0,0,0,0,'Lord Marrowgar - SAY_DEATH'),
(36612,6,0,'THE MASTER''S RAGE COURSES THROUGH ME!',1,16945,0,0,0,0,'Lord Marrowgar - SAY_BERSERK'),
(36612,7,0,'Lord Marrowgar creates a whirling storm of bone!',3,0,0,0,0,0,'Lord Marrowgar - SAY_BONE_STORM_EMOTE'),
(36626,0,0,'NOOOO! You kill Stinky! You pay!',1,16907,0,0,0,0,'Festergut - SAY_STINKY_DEAD'),
(36626,1,0,'Fun time!',1,16901,0,0,0,0,'Festergut - SAY_AGGRO'),
(36626,2,0,'%s farts.',2,16911,0,0,0,0,'Festergut - EMOTE_GAS_SPORE'),
(36626,3,0,'%s releases Gas Spores!',3,0,0,0,0,0,'Festergut - EMOTE_WARN_GAS_SPORE'),
(36626,4,0,'Gyah! Uhhh, I not feel so good...',1,16906,0,0,0,0,'Festergut - SAY_PUNGENT_BLIGHT'),
(36626,5,0,'%s begins to cast |cFFFF7F00Pungent Blight!|r',3,0,0,0,0,0,'Festergut - EMOTE_WARN_PUNGENT_BLIGHT'),
(36626,6,0,'%s vomits.',2,0,0,0,0,0,'Festergut - EMOTE_PUNGENT_BLIGHT'),
(36626,7,0,'Daddy, I did it!',1,16902,0,0,0,0,'Festergut - SAY_KILL_1'),
(36626,7,1,'Dead, dead, dead!',1,16903,0,0,0,0,'Festergut - SAY_KILL_2'),
(36626,8,0,'Fun time over!',1,16905,0,0,0,0,'Festergut - SAY_BERSERK'),
(36626,9,0,'Da ... Ddy...',1,16904,0,0,0,0,'Festergut - SAY_DEATH'),
(36627,0,0,'What? Precious? Noooooooooo!!!',1,16993,0,0,0,0,'Rotface - SAY_PRECIOUS_DIES'),
(36627,1,0,'WEEEEEE!',1,16986,0,0,0,0,'Rotface - SAY_AGGRO'),
(36627,2,0,'%s begins to cast Slime Spray!',3,0,0,0,0,0,'Rotface - EMOTE_SLIME_SPRAY'),
(36627,3,0,'Icky sticky.',1,16991,0,0,0,0,'Rotface - SAY_SLIME_SPRAY'),
(36627,4,0,'|TInterfaceIconsspell_shadow_unstableaffliction_2.blp:16|t%s begins to cast |cFFFF0000Unstable Ooze Explosion!|r',3,0,0,0,0,0,'Rotface - EMOTE_UNSTABLE_EXPLOSION'),
(36627,5,0,'I think I made an angry poo-poo. It gonna blow!',1,16992,0,0,0,0,'Rotface - SAY_UNSTABLE_EXPLOSION'),
(36627,6,0,'Daddy make toys out of you!',1,16988,0,0,0,0,'Rotface - SAY_KILL_1'),
(36627,6,1,'I brokes-ded it...',1,16987,0,0,0,0,'Rotface - SAY_KILL_2'),
(36627,7,0,'Sleepy Time!',1,16990,0,0,0,0,'Rotface - SAY_BERSERK'),
(36627,8,0,'Bad news daddy...',1,16989,0,0,0,0,'Rotface - SAY_DEATH'),
(36678,0,0,'Just an ordinary gas cloud. But watch out, because that''s no ordinary gas cloud!',1,17119,0,0,432,0,'Professor Putricide - SAY_GASEOUS_BLIGHT'),
(36678,1,0,'Oh, Festergut. You were always my favorite. Next to Rotface. The good news is you left behind so much gas, I can practically taste it!',1,17124,0,0,0,0,'Professor Putricide - SAY_FESTERGUT_DEATH'),
(36678,2,0,'Great news, everyone! The slime is flowing again!',1,17126,0,0,1,0,'Professor Putricide - SAY_ROTFACE_OOZE_FLOOD1'),
(36678,2,1,'Good news, everyone! I''ve fixed the poison slime pipes!',1,17123,0,0,1,0,'Professor Putricide - SAY_ROTFACE_OOZE_FLOOD2'),
(36678,3,0,'Terrible news, everyone, Rotface is dead! But great news everyone, he left behind plenty of ooze for me to use! Whaa...? I''m a poet, and I didn''t know it? Astounding!',1,17146,0,0,0,0,'Professor Putricide - SAY_ROTFACE_DEATH'),
(36678,4,0,'Good news, everyone! I think I perfected a plague that will destroy all life on Azeroth!',1,17114,0,0,0,0,'Professor Putricide - SAY_AGGRO'),
(36678,5,0,'%s begins to cast Unstable Experiment!',3,0,0,0,0,0,'Professor Putricide - EMOTE_UNSTABLE_EXPERIMENT'),
(36678,6,0,'Two oozes, one room! So many delightful possibilities...',1,17122,0,0,0,0,'Professor Putricide - SAY_PHASE_TRANSITION_HEROIC'),
(36678,7,0,'Hmm. I don''t feel a thing. Whaa...? Where''d those come from?',1,17120,0,0,15,0,'Professor Putricide - SAY_TRANSFORM_1'),
(36678,8,0,'Tastes like... Cherry! Oh! Excuse me!',1,17121,0,0,15,0,'Professor Putricide - SAY_TRANSFORM_2'),
(36678,9,0,'|TInterfaceIconsinv_misc_herb_evergreenmoss.blp:16|t%s cast |cFF00FF00Malleable Goo!|r',3,0,0,0,0,0,'Professor Putricide - EMOTE_MALLEABLE_GOO'),
(36678,10,0,'%s cast |cFFFF7F00Choking Gas Bomb!|r',3,0,0,0,0,0,'Professor Putricide - EMOTE_CHOKING_GAS_BOMB'),
(36678,11,0,'Hmm... Interesting...',1,17115,0,0,0,0,'Professor Putricide - SAY_KILL_1'),
(36678,11,1,'That was unexpected!',1,17116,0,0,0,0,'Professor Putricide - SAY_KILL_2'),
(36678,12,0,'Great news, everyone!',1,17118,0,0,0,0,'Professor Putricide - SAY_BERSERK'),
(36678,13,0,'Bad news, everyone! I don''t think I''m going to make it.',1,17117,0,0,0,0,'Professor Putricide - SAY_DEATH'),
(36855,0,0,'You have found your way here, because you are among the few gifted with true vision in a world cursed with blindness.',1,17272,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_1'),
(36855,1,0,'You can see through the fog that hangs over this world like a shroud, and grasp where true power lies.',1,17273,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_2'),
(36855,2,0,'Fix your eyes upon your crude hands: the sinew, the soft meat, the dark blood coursing within.',1,16878,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_3'),
(36855,3,0,'It is a weakness; a crippling flaw.... A joke played by the Creators upon their own creations.',1,17268,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_4'),
(36855,4,0,'The sooner you come to accept your condition as a defect, the sooner you will find yourselves in a position to transcend it.',1,17269,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_5'),
(36855,5,0,'Through our Master, all things are possible. His power is without limit, and his will unbending.',1,17270,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_6'),
(36855,6,0,'Those who oppose him will be destroyed utterly, and those who serve -- who serve wholly, unquestioningly, with utter devotion of mind and soul -- elevated to heights beyond your ken.',1,17271,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_7'),
(36855,7,0,'What is this disturbance?! You dare trespass upon this hallowed ground? This shall be your final resting place.',1,16868,0,0,0,0,'Lady Deathwhisper - SAY_AGGRO'),
(36855,8,0,'Enough! I see I must take matters into my own hands!',1,16877,0,0,0,0,'Lady Deathwhisper - SAY_PHASE_2'),
(36855,9,0,'%s''s Mana Barrier shimmers and fades away!',3,0,0,0,0,0,'Lady Deathwhisper - SAY_PHASE_2_EMOTE'),
(36855,10,0,'You are weak, powerless to resist my will!',1,16876,0,0,0,0,'Lady Deathwhisper - SAY_DOMINATE_MIND'),
(36855,11,0,'Take this blessing and show these intruders a taste of our master''s power.',1,16873,0,0,0,0,'Lady Deathwhisper - SAY_DARK_EMPOWERMENT'),
(36855,12,0,'I release you from the curse of flesh!',1,16874,0,0,0,0,'Lady Deathwhisper - SAY_DARK_TRANSFORMATION'),
(36855,13,0,'Arise and exult in your pure form!',1,16875,0,0,0,0,'Lady Deathwhisper - SAY_ANIMATE_DEAD'),
(36855,14,0,'Do you yet grasp of the futility of your actions?',1,16869,0,0,0,0,'Lady Deathwhisper - SAY_KILL_1'),
(36855,14,1,'Embrace the darkness... Darkness eternal!',1,16870,0,0,0,0,'Lady Deathwhisper - SAY_KILL_2'),
(36855,15,0,'This charade has gone on long enough.',1,16872,0,0,0,0,'Lady Deathwhisper - SAY_BERSERK'),
(36855,16,0,'All part of the masters plan! Your end is... inevitable!',1,16871,0,0,0,0,'Lady Deathwhisper - SAY_DEATH'),
(37187,0,0,'Kor''kron, move out! Champions, watch your backs. The Scourge have been...',1,17103,0,0,22,0,'High Overlord Saurfang - SAY_INTRO_HORDE_1'),
(37187,1,0,'My boy died at the Wrath Gate. I am here only to collect his body.',0,17097,0,0,397,0,'High Overlord Saurfang - SAY_INTRO_HORDE_3'),
(37187,2,0,'We named him Dranosh. It means \"Heart of Draenor\" in orcish. I would not let the warlocks take him. My boy would be safe, hidden away by the elders of Garadar.',0,17098,0,0,1,0,'High Overlord Saurfang - SAY_INTRO_HORDE_5'),
(37187,3,0,'I made a promise to his mother before she died; that I would cross the Dark Portal alone - whether I lived or died, my son would be safe. Untainted...',0,17099,0,0,1,0,'High Overlord Saurfang - SAY_INTRO_HORDE_6'),
(37187,4,0,'Today, I fulfill that promise.',0,17100,0,0,397,0,'High Overlord Saurfang - SAY_INTRO_HORDE_7'),
(37187,5,0,'High Overlord Saurfang charges!',2,17104,0,0,53,0,'High Overlord Saurfang - SAY_INTRO_HORDE_8'),
(37187,6,0,'Behind you lies the body of my only son. Nothing will keep me from him.',0,17094,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_ALLIANCE_8'),
(37187,7,0,'High Overlord Saurfang walks over to his son and kneels before his son''s body.',2,0,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_ALLIANCE_12'),
(37187,8,0,'[Orcish] No''ku kil zil''nok ha tar.',0,17096,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_ALLIANCE_13'),
(37187,9,0,'Higher Overlord Saurfang picks up the body of his son and walks over towards Varian',2,0,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_ALLIANCE_14'),
(37187,10,0,'I will not forget this... kindness. I thank you, Highness',0,17095,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_ALLIANCE_15'),
(37187,11,0,'%s coughs.',2,17105,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_HORDE_1'),
(37187,12,0,'%s weeps over the corpse of his son.',2,17106,0,0,15,0,'High Overlord Saurfang - SAY_OUTRO_HORDE_2'),
(37187,13,0,'You will have a proper ceremony in Nagrand next to the pyres of your mother and ancestors.',0,17101,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_HORDE_3'),
(37187,14,0,'Honor, young heroes... no matter how dire the battle... Never forsake it!',0,17102,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_HORDE_4'),
(37188,0,0,'%s cries.',2,16651,0,0,18,0,'Lady Jaina Proudmoore - SAY_OUTRO_ALLIANCE_17'),
(37188,1,0,'It was nothing, your majesty. Just... I''m proud of my king.',0,16652,0,0,0,0,'Lady Jaina Proudmoore - SAY_OUTRO_ALLIANCE_19'),
(37200,0,0,'Let''s get a move on then! Move ou...',1,16974,0,0,0,0,'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_1'),
(37200,1,0,'A lone orc against the might of the Alliance???',1,16970,0,0,0,0,'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_4'),
(37200,2,0,'Charge!!!',1,16971,0,0,0,0,'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_5'),
(37200,3,0,'%s gasps for air.',2,16975,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_1'),
(37200,4,0,'That was Saurfang''s boy - the Horde commander at the Wrath Gate. Such a tragic end...',0,16976,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_2'),
(37200,5,0,'What in the... There, in the distance!',0,16977,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_3'),
(37200,6,0,'A Horde Zeppelin flies up to the rise.',2,0,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_4'),
(37200,7,0,'Soldiers, fall in! Looks like the Horde are comin'' to take another shot!',1,16978,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_5'),
(37200,8,0,'The Zeppelin docks, and High Overlord Saurfang hops out, confronting the Alliance soldiers and Muradin',2,0,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_6'),
(37200,9,0,'Don''t force me hand, orc. We can''t let ye pass.',0,16972,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_7'),
(37200,10,0,'I... I can''t do it. Get back on yer ship and we''ll spare yer life.',0,16973,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_9'),
(37200,11,0,'A mage portal from Stormwind appears between the two and Varian Wrynn and Jaina Proudmoore emerge.',2,0,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_10'),
(37200,12,0,'Right away, yer majesty!',0,16979,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_21'),
(37813,0,0,'For every Horde soldier that you killed -- for every Alliance dog that fell, the Lich King''s armies grew. Even now the val''kyr work to raise your fallen as Scourge.',1,16701,0,0,0,0,'Deathbringer Saurfang - SAY_INTRO_ALLIANCE_2'),
(37813,1,0,'Things are about to get much worse. Come, taste the power that the Lich King has bestowed upon me!',1,16702,0,0,0,0,'Deathbringer Saurfang - SAY_INTRO_ALLIANCE_3'),
(37813,2,0,'Dwarves...',1,16703,0,0,0,0,'Deathbringer Saurfang - SAY_INTRO_ALLIANCE_6'),
(37813,3,0,'%s immobilizes Muradin and his guards.',2,0,0,0,0,0,'Deathbringer Saurfang - SAY_INTRO_ALLIANCE_7'),
(37813,4,0,'Join me, father. Join me and we will crush this world in the name of the Scourge -- for the glory of the Lich King!',1,16704,0,0,0,0,'Deathbringer Saurfang - SAY_INTRO_HORDE_2'),
(37813,5,0,'Stubborn and old. What chance do you have? I am stronger, and more powerful than you ever were.',1,16705,0,0,5,0,'Deathbringer Saurfang - SAY_INTRO_HORDE_4'),
(37813,6,0,'Pathetic old orc. Come then heroes. Come and face the might of the Scourge!',1,16706,0,0,15,0,'Deathbringer Saurfang - SAY_INTRO_HORDE_9'),
(37813,7,0,'BY THE MIGHT OF THE LICH KING!',1,16694,0,0,0,0,'Deathbringer Saurfang - SAY_AGGRO'),
(37813,8,0,'The ground runs red with your blood!',1,16699,0,0,0,0,'Deathbringer Saurfang - SAY_MARK_OF_THE_FALLEN_CHAMPION'),
(37813,9,0,'Feast, my minions!',1,16700,0,0,0,0,'Deathbringer Saurfang - SAY_BLOOD_BEASTS'),
(37813,10,0,'You are nothing!',1,16695,0,0,0,0,'Deathbringer Saurfang - SAY_KILL_1'),
(37813,10,1,'Your soul will find no redemption here!',1,16696,0,0,0,0,'Deathbringer Saurfang - SAY_KILL_2'),
(37813,11,0,'%s goes into frenzy!',3,0,0,0,0,0,'Deathbringer Saurfang - SAY_FRENZY'),
(37813,12,0,'I have become...DEATH!',1,16698,0,0,0,0,'Deathbringer Saurfang - SAY_BERSERK'),
(37813,13,0,'I... Am... Released.',1,16697,0,0,0,0,'Deathbringer Saurfang - SAY_DEATH'),
(37879,0,0,'Stand down, Muradin. Let a grieving father pass.',0,16690,0,0,0,0,'King Varian Wrynn - SAY_OUTRO_ALLIANCE_11'),
(37879,1,0,'I... I was not at the Wrath Gate, but the soldiers who survived told me much of what happened. Your son fought with honor. He died a hero''s death. He deserves a hero''s burial.',0,16691,0,0,0,0,'King Varian Wrynn - SAY_OUTRO_ALLIANCE_16'),
(37879,2,0,'Jaina? Why are you crying?',0,16692,0,0,0,0,'King Varian Wrynn - SAY_OUTRO_ALLIANCE_18'),
(37879,3,0,'Bah! Muradin, secure the deck and prepare our soldiers for an assault on the upper citadel. I''ll send out another regiment from Stormwind.',0,16693,0,0,0,0,'King Varian Wrynn - SAY_OUTRO_ALLIANCE_20'),
(37970,0,0,'Naxxanar was merely a setback! With the power of the orb, Valanar will have his vengeance!',1,16685,0,0,0,0,'Prince Valanar - SAY_VALANAR_INVOCATION'),
(37970,1,0,'Invocation of Blood jumps to Prince Valanar!',3,0,0,0,0,0,'Prince Valanar - EMOTE_VALANAR_INVOCATION'),
(37970,2,0,'My cup runneth over.',1,16686,0,0,0,0,'Prince Valanar - SAY_VALANAR_SPECIAL'),
(37970,3,0,'%s begins casting Empowered Schock Vortex!',3,0,0,0,0,0,'Prince Valanar - EMOTE_VALANAR_SHOCK_VORTEX'),
(37970,4,0,'Dinner... is served.',1,16681,0,0,0,0,'Prince Valanar - SAY_VALANAR_KILL_1'),
(37970,4,1,'Do you see NOW the power of the Darkfallen?',1,16682,0,0,0,0,'Prince Valanar - SAY_VALANAR_KILL_2'),
(37970,5,0,'BOW DOWN BEFORE THE SAN''LAYN!',1,16684,0,0,0,0,'Prince Valanar - SAY_VALANAR_BERSERK'),
(37970,6,0,'...why...?',1,16683,0,0,0,0,'Prince Valanar - SAY_VALANAR_DEATH'),
(37972,0,0,'Such wondrous power! The Darkfallen Orb has made me INVINCIBLE!',1,16727,0,0,0,0,'Prince Keleseth - SAY_KELESETH_INVOCATION'),
(37972,1,0,'Invocation of Blood jumps to Prince Keleseth!',3,0,0,0,0,0,'Prince Keleseth - EMOTE_KELESETH_INVOCATION'),
(37972,2,0,'Blood will flow!',1,16728,0,0,0,0,'Prince Keleseth - SAY_KELESETH_SPECIAL'),
(37972,3,0,'Were you ever a threat?',1,16723,0,0,0,0,'Prince Keleseth - SAY_KELESETH_KILL_1'),
(37972,3,1,'Truth is found in death.',1,16724,0,0,0,0,'Prince Keleseth - SAY_KELESETH_KILL_2'),
(37972,4,0,'%s cackles maniacally!',2,16726,0,0,0,0,'Prince Keleseth - EMOTE_KELESETH_BERSERK'),
(37972,5,0,'My queen... they come...',1,16725,0,0,0,0,'Prince Keleseth - SAY_KELESETH_DEATH'),
(37973,0,0,'Tremble before Taldaram, mortals, for the power of the orb flows through me!',1,16857,0,0,0,0,'Prince Taldaram - SAY_TALDARAM_INVOCATION'),
(37973,1,0,'Invocation of Blood jumps to Prince Taldaram!',3,0,0,0,0,0,'Prince Taldaram - EMOTE_TALDARAM_INVOCATION'),
(37973,2,0,'Delight in the pain!',1,16858,0,0,0,0,'Prince Taldaram - SAY_TALDARAM_SPECIAL'),
(37973,3,0,'Inferno Flames speed toward $N!',3,0,0,0,0,0,'Prince Taldaram - EMOTE_TALDARAM_FLAME'),
(37973,4,0,'Worm food.',1,16853,0,0,0,0,'Prince Taldaram - SAY_TALDARAM_KILL_1'),
(37973,4,1,'Beg for mercy!',1,16854,0,0,0,0,'Prince Taldaram - SAY_TALDARAM_KILL_2'),
(37973,5,0,'%s laughs.',2,16856,0,0,0,0,'Prince Taldaram - EMOTE_TALDARAM_BERSERK'),
(37973,6,0,'%s gurgles and dies.',2,16855,0,0,0,0,'Prince Taldaram - EMOTE_TALDARAM_DEATH'),
(38004,0,0,'Foolish mortals. You thought us defeated so easily? The San''layn are the Lich King''s immortal soldiers! Now you shall face their might combined!',1,16795,0,0,1,0,'Blood-Queen Lana''thel - SAY_INTRO_1'),
(38004,1,0,'Rise up, brothers, and destroy our enemies.',1,16796,0,0,0,0,'Blood-Queen Lana''thel - SAY_INTRO_2');

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (70572,72202,72260);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,70572,0,18,1,37920,0,0, '', 'Deathbringer Saurfang - Grip of Agony'),
(13,0,70572,0,18,1,37200,0,0, '', 'Deathbringer Saurfang - Grip of Agony'),
(13,0,70572,0,18,1,37187,0,0, '', 'Deathbringer Saurfang - Grip of Agony'),
(13,0,70572,0,18,1,37830,0,0, '', 'Deathbringer Saurfang - Grip of Agony'),
(13,0,72202,0,18,1,37813,0,0, '', 'Deathbringer Saurfang - Blood Link'),
(13,0,72260,0,18,1,37920,0,0, '', 'Deathbringer Saurfang - Mark of the Fallen Champion heal');

-- [9607] Deathbringer Saurfang (By Shauren)
-- Deathbringer Saurfang
SET @NPCSaurfang10N := 37813;
SET @NPCSaurfang25N := 3781301;
SET @NPCSaurfang10H := 3781302;
SET @NPCSaurfang25H := 3781302;

-- High Overlord Saurfang
SET @NPCOverlord10N := 37187;
SET @NPCOverlord25N := 38156;
SET @NPCOverlord10H := 38637;
SET @NPCOverlord25H := 38638;

-- Fix factions
UPDATE `creature_template` SET `faction_A` = 974, `faction_H` = 974 WHERE `entry` IN (@NPCSaurfang10N,@NPCSaurfang25N,@NPCSaurfang10H,@NPCSaurfang25H); -- Deathbringer Saurfang
UPDATE `creature_template` SET `faction_A` = 1735, `faction_H` = 1735 WHERE `entry` IN (@NPCOverlord10N,@NPCOverlord25N,@NPCOverlord10H,@NPCOverlord25H); -- High Overlord Saurfang
UPDATE `creature_template` SET `faction_A` = 1735, `faction_H` = 1735 WHERE `entry` = 37920; -- Kor'kron Reaver
UPDATE `creature_template` SET `faction_A` = 894, `faction_H` = 894 WHERE `entry` = 37188; -- Jaina Proudmoore
UPDATE `creature_template` SET `faction_A` = 1732, `faction_H` = 1732 WHERE `entry` = 37830; -- Skybreaker Marine
UPDATE `creature_template` SET `faction_A` = 1732, `faction_H` = 1732 WHERE `entry` = 37200; -- Muradin Bronzebeard

-- Saurfang Event Fix.
DELETE FROM `creature` WHERE `id` IN (37187,37200);
INSERT INTO `creature`(`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(null,'37187','631','15','64','0','2021','-542.014','2211.24','539.291','6.27645','720000','0','0','4183500','0','0','0','0','0','0'),
(null,'37200','631','15','128','0','2022','-542.014','2211.24','539.291','6.27645','720000','0','0','4183500','0','0','0','0','0','0');
-- NPC 37007
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 37007;
-- Lich King Event Fix.
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(null,'38995','631','15','1','0','0','505.212','-2124.35','1040.94','3.14159','604800','0','0','13945000','4258000','0','0','0','0','0');
-- -------------------------------------------------------------------------
-- ----------------------------- Pit of Saron ------------------------------
-- -------------------------------------------------------------------------
DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (36794);
DELETE FROM script_texts WHERE entry IN (-1658074, -1658075, -1658076, -1658077, -1658078, -1658080, -1658081, -1658082, -1658084, -1658085, -1658086, -1658087, -1658088);
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES 
('0', '-1658074', 'Intruders have entered the masters domain. Signal the alarms!', 16747, 1, 0, 0, 'Tyrannus Opening'),
('0', '-1658075', 'Hmph fodder Not even fit to labor in the quarry. Relish these final moments for soon you will be nothing more than mindless undead', 16748, 1, 0, 0, 'Tyrannus Opening'),
('0', '-1658076', 'Soldiers of the Horde, attack!', 17045, 1, 0, 0, 'Sylvanas Opening'),
('0', '-1658077', 'Heroes of the Alliance, attack!', 16626, 1, 0, 0, 'Jaina Opening'),
('0', '-1658078', 'Your last waking memory will be of agonizing pain', 16749, 1, 0, 0, 'Tyrannus Opening'),
('0', '-1658080', 'Pathetic weaklings', 17046, 1, 0, 0, 'Sylvanas Opening'),
('0', '-1658081', 'NO! YOU MONSTER!', 16627, 1, 0, 0, 'Jaina Opening'),
('0', '-1658082', 'Minions, destroy these interlopers!', 16751, 1, 0, 0, 'Tyrannus Opening'),
('0', '-1658084', 'I do what i must. Please forgive me noble soldiers', 16628, 1, 0, 0, 'Jaina Opening'),
('0', '-1658085', 'You will have to battle your way through this cesspit on your own.', 17047, 0, 0, 0, 'Sylvanas Opening'),
('0', '-1658086', 'You will have to make your way across this quarry on your own.', 16629, 0, 0, 0, 'Jaina Opening'),
('0', '-1658087', 'Free any horde slaves that you come across. We will most certainly need there assistance in battling Tyrannus. I will gather reinforcements and join you on the other side of the quarry.', 17048, 0, 0, 0, 'Sylvanas Opening'),
('0', '-1658088', 'Free any Alliance slaves that you come across. We will most certainly need there assistance in battling Tyrannus. I will gather reinforcements and join you on the other side of the quarry.', 16630, 0, 0, 0, 'Jaina Opening');
UPDATE creature_template SET scriptname = "npc_jaina_or_sylvanas_intro" WHERE entry IN (36990, 36993);
UPDATE creature_template SET scriptname = "npc_jaina_or_sylvanas_outro" WHERE entry IN (38189, 38188);
DELETE FROM `creature` WHERE `id`=38189;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(38189, 658, 1, 64, 0, 1290, 1071.58, 89.0826, 631.493, 1.93394, 300, 0, 0, 6972500, 85160, 0, 0, 0, 0, 0);
UPDATE creature_template SET scriptname = "npc_tyrannus_icicle" WHERE entry IN (32780);
-- -------------------------------------------------------------------------
-- -------------------------- Halls Of Reflection --------------------------
-- -------------------------------------------------------------------------
UPDATE `creature_template` SET `speed_walk` = '1.5', `speed_run` = '2.0' WHERE `entry` in (36954, 37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRintro' WHERE `entry` in (37221, 37223);
UPDATE `creature_template` SET `AIName` = '', `Scriptname` = 'boss_falric' WHERE `entry` = 38112;
UPDATE `creature_template` SET `AIName` = '', `Scriptname` = 'boss_marwyn' WHERE `entry` = 38113;
UPDATE `creature_template` SET `AIName` = '', `Scriptname` = 'npc_lich_king_hr' WHERE `entry` = 36954;
UPDATE `creature_template` SET `AIName` = '', `Scriptname` = 'boss_lich_king_hor' WHERE `entry` = 37226;
UPDATE `creature_template` SET `AIName` = '', `Scriptname` = 'npc_jaina_and_sylvana_HRextro' WHERE `entry` in (36955, 37554);
UPDATE `creature_template` SET `AIName` = '', `Scriptname` = 'npc_raging_gnoul' WHERE `entry` = 36940;
UPDATE `creature_template` SET `AIName` = '', `Scriptname` = 'npc_risen_witch_doctor' WHERE `entry` = 36941;
UPDATE `creature_template` SET `AIName` = '', `Scriptname` = 'npc_abon' WHERE `entry` = 37069;
UPDATE `creature_template` SET `scale` = '0.8', `equipment_id` = '1221' WHERE `entry` in (37221, 36955);
UPDATE `creature_template` SET `equipment_id` = '1290' WHERE `entry` in (37223, 37554);
UPDATE `creature_template` SET `equipment_id` = '0' WHERE `entry` = 36954;
UPDATE `creature_template` SET `scale` = '1' WHERE `entry` = 37223;
UPDATE `creature_template` SET `scale` = '0.8' WHERE `entry` in (36658, 37225, 37223, 37226, 37554);
UPDATE `creature_template` SET `unit_flags`='768', `type_flags`='268435564' WHERE `entry` in (38177, 38176, 38173, 38172, 38567, 38175);
UPDATE `creature_template` SET `AIName` = '', `Scriptname` = 'npc_frostworn_general' WHERE `entry` = 36723;
UPDATE `creature_template` set `scale`='1' where `entry` in (37223);
UPDATE `instance_template` SET `script` = 'instance_hall_of_reflection' WHERE map=668;
UPDATE `gameobject_template` SET `faction`='1375' WHERE `entry` in (197341, 202302, 201385, 201596);
UPDATE `creature` SET `phaseMask` = 128 WHERE `id` = 36993;
UPDATE `creature` SET `phaseMask` = 64 WHERE `id` = 36990;
UPDATE `instance_template` SET `script` = 'instance_halls_of_reflection' WHERE map=668;
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1594540 AND -1594430;
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc6`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(-1594473, 'Foolish girl. You seek that, which I killed long ago. He is nearly a ghost now. A fate ago in my mind.', NULL, 17229,1,0,0, '67234'),
(-1594474, 'I will not make the same mistake again. This time there will be no escape. You fail to serve me in undead. Now, all that remains for you is oblivion!', NULL, 17228,1,0,0, '67234'),
-- SCENE - Hall Of Reflection (Extro) - PreEscape
(-1594477, 'Your allies have arrived, Jaina, just as you promised. You will all become powerful agents of the Scourge.', NULL, 17212,1,0,0, '67234'),
(-1594478, 'I will not make the same mistake again, Sylvanas. This time there will be no escape. You will all serve me in death!', NULL, 17213,1,0,0, '67234'),
(-1594479, 'He is too powerful, we must leave this place at once! My magic will hold him in place for only a short time! Come quickly, heroes!', NULL, 16644,0,0,1, '67234'),
(-1594480, 'He\'s too powerful! Heroes, quickly, come to me! We must leave this place immediately! I will do what I can do hold him in place while we flee.', NULL, 17058,0,0,1, '67234'),
-- SCENE - Hall Of Reflection (Extro) - Escape
(-1594481, 'Death\'s cold embrace awaits.', NULL, 17221,1,0,0, '67234'),
(-1594482, 'Rise minions, do not left them us!', NULL, 17216,1,0,0, '67234'),
(-1594483, 'Minions sees them. Bring their corpses back to me!', NULL, 17222,1,0,0, '67234'),
(-1594484, 'No...', NULL, 17214,1,0,0, '67234'),
(-1594485, 'All is lost!', NULL, 17215,1,0,0, '67234'),
(-1594486, 'There is no escape!', NULL, 17217,1,0,0, '67234'),
(-1594487, 'I will destroy this barrier. You must hold the undead back!', NULL, 16607,1,0,0, '67234'),
(-1594488, 'No wall can hold the Banshee Queen! Keep the undead at bay, heroes! I will tear this barrier down!', NULL, 17029,1,0,0, '67234'),
(-1594489, 'Another ice wall! Keep the undead from interrupting my incantation so that I may bring this wall down!', NULL, 16608,1,0,0, '67234'),
(-1594490, 'Another barrier? Stand strong, champions! I will bring the wall down!', NULL, 17030,1,0,0, '67234'),
(-1594491, 'Succumb to the chill of the grave.', NULL, 17218,1,0,0, '67234'),
(-1594492, 'Another dead end.', NULL, 17219,1,0,0, '67234'),
(-1594493, 'How long can you fight it?', NULL, 17220,1,0,0, '67234'),
(-1594494, '<need translate>', NULL, 16609,0,0,0, '67234'),
(-1594495, 'Your barriers can\'t hold us back much longer, monster. I will shatter them all!', NULL, 16610,1,0,0, '67234'),
(-1594496, 'I grow tired of these games, Arthas! Your walls can\'t stop me!', NULL, 17031,1,0,0, '67234'),
(-1594497, 'You won\'t impede our escape, fiend. Keep the undead off me while I bring this barrier down!', NULL, 17032,1,0,0, '67234'),
(-1594498, 'There\'s an opening up ahead. GO NOW!', NULL, 16645,1,0,0, '67234'),
(-1594499, 'We\'re almost there... Don\'t give up!', NULL, 16646,1,0,0, '67234'),
(-1594500, 'There\'s an opening up ahead. GO NOW!', NULL, 17059,1,0,0, '67234'),
(-1594501, 'We\'re almost there! Don\'t give up!', NULL, 17060,1,0,0, '67234'),
(-1594502, 'It... It\'s a dead end. We have no choice but to fight. Steel yourself heroes, for this is our last stand!', NULL, 16647,1,0,0, '67234'),
(-1594503, 'BLASTED DEAD END! So this is how it ends. Prepare yourselves, heroes, for today we make our final stand!', NULL, 17061,1,0,0, '67234'),
(-1594504, 'Nowhere to run! You\'re mine now...', NULL, 17223,1,0,0, '67234'),
(-1594505, 'Soldiers of Lordaeron, rise to meet your master\'s call!', NULL, 16714,1,0,0, '67234'),
(-1594506, 'The master surveyed his kingdom and found it... lacking. His judgement was swift and without mercy. Death to all!', NULL, 16738,1,0,0, '67234'),
-- FrostWorn General
(-1594519, 'You are not worthy to face the Lich King!', NULL, 16921,1,0,0, '67234'),
(-1594520, 'Master, I have failed...', NULL, 16922,1,0,0, '67234');

-- Waipoints to escort event on Halls of reflection
DELETE FROM script_waypoint WHERE entry IN (36955,37226,37554);
INSERT INTO script_waypoint VALUES
-- Jaina
(36955, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
(36955, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
(36955, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
(36955, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'),
(36955, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
(36955, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
(36955, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
(36955, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
(36955, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
(36955, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
(36955, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
(36955, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
(36955, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
(36955, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
(36955, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
(36955, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
(36955, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
(36955, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
(36955, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
(36955, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
(36955, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
(36955, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Sylvana
(37554, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
(37554, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
(37554, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
(37554, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'),
(37554, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
(37554, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
(37554, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
(37554, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
(37554, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
(37554, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
(37554, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
(37554, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
(37554, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
(37554, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
(37554, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
(37554, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
(37554, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
(37554, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
(37554, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
(37554, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
(37554, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
(37554, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Lich King
(37226, 0, 5577.187,2236.003,733.012, 0, 'WP1'),
(37226, 1, 5587.682,2228.586,733.011, 0, 'WP2'),
(37226, 2, 5600.715,2209.058,731.618, 0, 'WP3'),
(37226, 3, 5606.417,2193.029,731.129, 0, 'WP4'),
(37226, 4, 5598.562,2167.806,730.918, 0, 'WP5'),
(37226, 5, 5559.218,2106.802,731.229, 0, 'WP6'),
(37226, 6, 5543.498,2071.234,731.702, 0, 'WP7'),
(37226, 7, 5528.969,2036.121,731.407, 0, 'WP8'),
(37226, 8, 5512.045,1996.702,735.122, 0, 'WP9'),
(37226, 9, 5504.490,1988.789,735.886, 0, 'WP10'),
(37226, 10, 5489.645,1966.389,737.653, 0, 'WP10'),
(37226, 11, 5475.517,1943.176,741.146, 0, 'WP11'),
(37226, 12, 5466.930,1926.049,743.536, 0, 'WP12'),
(37226, 13, 5445.157,1894.955,748.757, 0, 'WP13'),
(37226, 14, 5425.907,1869.708,753.237, 0, 'WP14'),
(37226, 15, 5405.118,1833.937,757.486, 0, 'WP15'),
(37226, 16, 5370.324,1799.375,761.007, 0, 'WP16'),
(37226, 17, 5335.422,1766.951,767.635, 0, 'WP17'),
(37226, 18, 5311.438,1739.390,774.165, 0, 'WP18'),
(37226, 19, 5283.589,1703.755,784.176, 0, 'WP19'),
(37226, 20, 5278.694,1697.912,785.692, 0, 'WP20'),
(37226, 21, 5283.589,1703.755,784.176, 0, 'WP19');

-- Fixed Halls of Reflection
DELETE FROM `gameobject_template` WHERE `entry` = 500001;
INSERT INTO `gameobject_template` VALUES ('500001', '0', '9214', 'Ice Wall', '', '', '', '1375', '0', '2.5', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '1');
DELETE FROM `creature` WHERE `id` IN (38112,37223,37221,36723,36955,37158,38113,37554,37226) AND `map` = 668;
INSERT INTO `creature` (`guid`, `id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`)
VALUES
-- Falric & Marwyn
('135341', '38112', '668', '3', '1', '0', '0', '5276.81', '2037.45', '709.32', '5.58779', '604800', '0', '0', '377468', '0', '0', '0', '0', '0', '0'),
('135342', '38113', '668', '3', '1', '0', '0', '5341.72', '1975.74', '709.32', '2.40694', '604800', '0', '0', '539240', '0', '0', '0', '0', '0', '0'),
-- Lady Jaina Proudmoore & Lady Sylvanas Windrunner <Banshee Queen>
('117106', '37221', '668', '3', '128', '0', '0', '5266.78', '1953.42', '707.697', '0.740877', '7200', '0', '0', '5040000', '881400', '0', '0', '0', '0', '0'),
('117460', '37223', '668', '3', '64', '0', '0', '5266.78', '1953.42', '707.697', '0.740877', '7200', '0', '0', '6972500', '85160', '0', '0', '0', '0', '0'),
-- Frostsworn General
('135343', '36723', '668', '3', '1', '0', '0', '5413.84', '2116.44', '707.695', '3.88117', '7200', '0', '0', '315000', '0', '0', '0', '0', '0', '0'),
-- Quel'Delar
('78183', '37158', '668', '3', '2', '0', '0', '5304.5', '2001.35', '709.341', '4.15073', '7200', '0', '0', '214200', '0', '0', '0', '0', '0', '0'),
-- Lady Jaina Proudmoore & Lady Sylvanas Windrunner    (final way)
(NULL, '36955', '668', '3', '128', '0', '0', '5547.27', '2256.95', '733.011', '0.835987', '7200', '0', '0', '252000', '881400', '0', '0', '0', '0', '0'),
(NULL, '37554', '668', '3', '64', '0', '0', '5547.27', '2256.95', '733.011', '0.835987', '7200', '0', '0', '252000', '881400', '0', '0', '0', '0', '0'),
-- The Lich King
(NULL, '37226', '668', '3', '1', '0', '0', '5551.29', '2261.33', '733.012', '4.0452', '604800', '0', '0', '27890000', '0', '0', '0', '0', '0', '0');

DELETE FROM `gameobject` WHERE `id` IN (202302,202236,201596,500001,196391,196392,202396,201885,197341,201976,197342,197343,201385,202212,201710,202337,202336,202079) AND `map` = 668;
INSERT INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`)
VALUES
('202302', '668', '3', '1', '5309.51', '2006.64', '709.341', '5.50041', '0', '0', '0.381473', '-0.92438', '604800', '100', '1'),
('202236', '668', '3', '1', '5309.51', '2006.64', '709.341', '5.53575', '0', '0', '0.365077', '-0.930977', '604800', '100', '1'),
('201596', '668', '3', '1', '5275.28', '1694.23', '786.147', '0.981225', '0', '0', '0.471166', '0.882044', '25', '0', '1'),
('500001', '668', '3', '1', '5323.61', '1755.85', '770.305', '0.784186', '0', '0', '0.382124', '0.924111', '604800', '100', '1'),
('196391', '668', '3', '1', '5232.31', '1925.57', '707.695', '0.815481', '0', '0', '0.396536', '0.918019', '300', '0', '1'),
('196392', '668', '3', '1', '5232.31', '1925.57', '707.695', '0.815481', '0', '0', '0.396536', '0.918019', '300', '0', '1'),
('202396', '668', '3', '1', '5434.27', '1881.12', '751.303', '0.923328', '0', '0', '0.445439', '0.895312', '604800', '100', '1'),
('201885', '668', '3', '1', '5494.3', '1978.27', '736.689', '1.0885', '0', '0', '0.517777', '0.855516', '604800', '100', '1'),
('197341', '668', '3', '1', '5359.24', '2058.35', '707.695', '3.96022', '0', '0', '0.917394', '-0.397981', '300', '100', '1'),
('201976', '668', '3', '1', '5264.6', '1959.55', '707.695', '0.736951', '0', '0', '0.360194', '0.932877', '300', '100', '0'),
('197342', '668', '3', '1', '5520.72', '2228.89', '733.011', '0.778581', '0', '0', '0.379532', '0.925179', '300', '100', '1'),
('197343', '668', '3', '1', '5582.96', '2230.59', '733.011', '5.49098', '0', '0', '0.385827', '-0.922571', '300', '100', '1'),
('201385', '668', '3', '1', '5540.39', '2086.48', '731.066', '1.00057', '0', '0', '0.479677', '0.877445', '604800', '100', '1'),
('202212', '668', '1', '65535', '5241.05', '1663.44', '784.295', '0.54', '0', '0', '0', '0', '-604800', '100', '1'),
('201710', '668', '1', '65535', '5241.05', '1663.44', '784.295', '0.54', '0', '0', '0', '0', '-604800', '100', '1'),
('202337', '668', '2', '65535', '5241.05', '1663.44', '784.295', '0.54', '0', '0', '0', '0', '-604800', '100', '1'),
('202336', '668', '2', '65535', '5241.05', '1663.44', '784.295', '0.54', '0', '0', '0', '0', '-604800', '100', '1'),
('202079', '668', '3', '1', '5250.96', '1639.36', '784.302', '0', '0', '0', '0', '0', '-604800', '100', '1');

-- rey exánime http://es.wowhead.com/npc=37226
DELETE FROM creature WHERE guid = 135344;
-- autocompletar la quest
UPDATE quest_template SET ReqCreatureOrGOId1 = 0, ReqCreatureOrGOCount1 = 0, Method = 2 WHERE entry IN (24500,24802);
-- paredes de hielo, aqui las borra pero es mejor hacerlas targteables.
-- delete from gameobject where id = 201385;
-- borrar Frostmourne Altar Bunny que pega constantemente, esta invisible y saca 1-2 de hp.
DELETE FROM creature WHERE id = 37704;
-- eliminar a Uther, es spawneado por core
DELETE FROM creature WHERE id =37225;

-- Delete Portal to Dalaran (entry 202079)
-- hay dos y se deja el de guid "5689" porque pertenece a otro mapa
DELETE FROM gameobject WHERE guid = 5479;

-- Delete NPC Spawns by CTDB in the scape hall way area
DELETE FROM creature WHERE id IN (37069,36940,36941);

-- Invisible triggers Ice Wall Target summon by Lady Jaina Proudmoore or Lady Sylvanas Windrunner, it must be not visible for players
UPDATE `creature_template` SET `flags_extra`='130' WHERE `entry`= 37014;

-- Gunship
INSERT IGNORE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('1000000','14','9001','Horde Gunship','','','','0','40','1','0','0','0','0','0','0','1252','20','10','0','0','0','642','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','11403');
INSERT IGNORE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('1000001','14','9002','Alliance Gunship','','','','0','40','1','0','0','0','0','0','0','1248','20','10','0','0','0','641','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','11723');
-- -------------------------------------------------------------------------
-- ------------------------------ Wintergrasp ------------------------------
-- -------------------------------------------------------------------------
DELETE FROM `trinity_string` WHERE `entry` IN (756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,780,781,782,783);
INSERT INTO `trinity_string` VALUES
('756', 'Battle begins!', null, null, null, null, null, null, null, null),
('757', '%s has successfully defended the fortress!', null, null, null, null, null, null, null, null),
('758', '%s has taken over the fortress!', null, null, null, null, null, null, null, null),
('759', 'The %s siege workshop has been damaged by the %s!', null, null, null, null, null, null, null, null),
('760', 'The %s siege workshop has been destroyed by the %s!', null, null, null, null, null, null, null, null),
('761', 'The %s tower has been damaged!', null, null, null, null, null, null, null, null),
('762', 'The %s tower has been destroyed!', null, null, null, null, null, null, null, null),
('763', 'Wintergrasp fortress is under attack!', null, null, null, null, null, null, null, null),
('764', 'Wintergrasp is now under the control of the %s.', null, null, null, null, null, null, null, null),
('765', 'Wintergrasp timer SET to %s.', null, null, null, null, null, null, null, null),
('766', 'Wintergrasp battle started.', null, null, null, null, null, null, null, null),
('767', 'Wintergrasp battle finished.', null, null, null, null, null, null, null, null),
('768', 'Wintergrasp info: %s controlled. Timer: %s. Wartime: %s. Number of Players: (Horde: %u, Alliance: %u)', null, null, null, null, null, null, null, null),
('769', 'Wintergrasp outdoorPvP is disabled.', null, null, null, null, null, null, null, null),
('770', 'Wintergrasp outdoorPvP is enabled.', null, null, null, null, null, null, null, null),
('771', 'You have reached Rank 1: Corporal', null, null, null, null, null, null, null, null),
('772', 'You have reached Rank 2: First Lieutenant', null, null, null, null, null, null, null, null),
('780', '30 Minutes before the battle for Wintergrasp begins!', null, null, null, null, null, null, null, null),
('781', '10 Minutes before the battle for Wintergrasp begins!', null, null, null, null, null, null, null, null),
('782', 'The battle for Wintergrasp has stopped! Not enough defenders. Wintergrasp Fortress remains Attackers.', null, null, null, null, null, null, null, null),
('783', 'The battle for Wintergrasp has stopped! Not enough attackers. Wintergrasp Fortress remains Defenders.', null, null, null, null, null, null, null, null);

DELETE FROM `command` WHERE name IN ('wg','wg enable','wg start','wg status','wg stop','wg switch','wg timer');
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('wg', '3', 'Syntax: .wg $subcommand.'),
('wg enable', '3', 'Syntax: .wg enable [on/off] Enable/Disable Wintergrasp outdoorPvP.'),
('wg start', '3', 'Syntax: .wg start\r\nForce Wintergrasp battle start.'),
('wg status', '3', 'Syntax: .wg status\r\nWintergrasp info, defender, timer, wartime.'),
('wg stop', '3', 'Syntax: .wg stop\r\nForce Wintergrasp battle stop (No rewards).'),
('wg switch', '3', 'Syntax: .wg switch\r\nSwitchs Wintergrasp defender team.'),
('wg timer', '3', 'Syntax: .wg timer $minutes\r\nChange the current timer. Min value = 1, Max value 60 (Wartime), 1440 (Not Wartime)');

-- WG ScriptName
DELETE FROM `outdoorpvp_template` WHERE TypeId=7;
INSERT INTO `outdoorpvp_template` (`TypeId`, `ScriptName`, `comment`) VALUES
('7', 'outdoorpvp_wg', 'Wintergrasp');
UPDATE `creature_template` SET `ScriptName` = 'npc_demolisher_engineerer' WHERE `entry` IN (30400,30499);

-- Teleport WG SPELLs
DELETE FROM `spell_target_position` WHERE `id` IN ('59096', '58632', '58633');
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
('59096', '571', '5325.06', '2843.36', '409.285', '3.20278'),
('58632', '571', '5097.79', '2180.29', '365.61', '2.41'),
('58633', '571', '5026.80', '3676.69', '362.58', '3.94');

-- Defender's Portal Activate Proper Spell
DELETE FROM `spell_linked_spell` WHERE spell_trigger=54640;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('54640','54643','0','Defender`s Portal Activate Proper Spell');

-- Temp removed gameobject stopping you getting to the relic
-- 194323 - [Wintergrasp Keep Collision Wall X:5396.209961 Y:2840.010010 Z:432.268005 MapId:571
-- 194162 - [Doodad_WG_Keep_Door01_collision01 X:5397.109863 Y:2841.540039 Z:425.901001 MapId:571]
DELETE FROM `gameobject` WHERE `id` IN ('194323', '194162');

-- Titan Relic remove
DELETE FROM `gameobject` WHERE `id` = 192829;
-- Towers
UPDATE `gameobject_template` SET `faction` = 0, `flags` = 6553632 WHERE `entry` IN (190356,190357,190358);
-- Spirit Healer
UPDATE `creature_template` SET `npcflag` = npcflag|32768 WHERE `entry` IN (31841,31842);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (31841,31842);
-- Creature template
UPDATE `creature_template` SET faction_A = '1802', faction_H = '1802' WHERE `entry` IN (30499,28312,28319);
UPDATE `creature_template` SET faction_A = '1801', faction_H = '1801' WHERE `entry` IN (30400,32629,32627);
-- spell target for build vehicles
DELETE FROM `conditions` WHERE ConditionValue2 = 27852;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 49899, 0, 18, 1, 27852, 0, 0, '', null),
(13, 0, 56575, 0, 18, 1, 27852, 0, 0, '', null),
(13, 0, 56661, 0, 18, 1, 27852, 0, 0, '', null),
(13, 0, 56663, 0, 18, 1, 27852, 0, 0, '', null),
(13, 0, 56665, 0, 18, 1, 27852, 0, 0, '', null),
(13, 0, 56667, 0, 18, 1, 27852, 0, 0, '', null),
(13, 0, 56669, 0, 18, 1, 27852, 0, 0, '', null),
(13, 0, 61408, 0, 18, 1, 27852, 0, 0, '', null);
-- Workshop
UPDATE `gameobject_template` SET `faction` = 35 WHERE `entry` IN (192028,192029,192030,192031,192032,192033);
-- WG Spell area Data
DELETE FROM `spell_area` WHERE spell IN (58730, 57940, 58045);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES
(58730, 4197, 0, 0, 0, 0, 0, 2, 1),
(58730, 4584, 0, 0, 0, 0, 0, 2, 1),
(58730, 4581, 0, 0, 0, 0, 0, 2, 1),
(58730, 4585, 0, 0, 0, 0, 0, 2, 1),
(58730, 4612, 0, 0, 0, 0, 0, 2, 1),
(58730, 4582, 0, 0, 0, 0, 0, 2, 1),
(58730, 4611, 0, 0, 0, 0, 0, 2, 1),
(58730, 4578, 0, 0, 0, 0, 0, 2, 1),
(58730, 4576, 0, 0, 0, 0, 0, 2, 1),
(58730, 4538, 0, 0, 0, 0, 0, 2, 1),
(57940, 65, 0, 0, 0, 0, 0, 2, 1),
(57940, 66, 0, 0, 0, 0, 0, 2, 1),
(57940, 67, 0, 0, 0, 0, 0, 2, 1),
(57940, 206, 0, 0, 0, 0, 0, 2, 1),
(57940, 210, 0, 0, 0, 0, 0, 2, 1),
(57940, 394, 0, 0, 0, 0, 0, 2, 1),
(57940, 395, 0, 0, 0, 0, 0, 2, 1),
(57940, 1196, 0, 0, 0, 0, 0, 2, 1),
(57940, 2817, 0, 0, 0, 0, 0, 2, 1),
(57940, 3456, 0, 0, 0, 0, 0, 2, 1),
(57940, 3477, 0, 0, 0, 0, 0, 2, 1),
(57940, 3537, 0, 0, 0, 0, 0, 2, 1),
(57940, 3711, 0, 0, 0, 0, 0, 2, 1),
(57940, 4100, 0, 0, 0, 0, 0, 2, 1),
(57940, 4196, 0, 0, 0, 0, 0, 2, 1),
(57940, 4228, 0, 0, 0, 0, 0, 2, 1),
(57940, 4264, 0, 0, 0, 0, 0, 2, 1),
(57940, 4265, 0, 0, 0, 0, 0, 2, 1),
(57940, 4272, 0, 0, 0, 0, 0, 2, 1),
(57940, 4273, 0, 0, 0, 0, 0, 2, 1),
(57940, 4395, 0, 0, 0, 0, 0, 2, 1),
(57940, 4415, 0, 0, 0, 0, 0, 2, 1),
(57940, 4416, 0, 0, 0, 0, 0, 2, 1),
(57940, 4493, 0, 0, 0, 0, 0, 2, 1),
(57940, 4494, 0, 0, 0, 0, 0, 2, 1),
(57940, 4603, 0, 0, 0, 0, 0, 2, 1),
(58045, 4197, 0, 0, 0, 0, 0, 2, 1);

/* Portal Dalaran->WG */
DELETE FROM `gameobject` WHERE `id` = 193772;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(null, 193772, 571, 1, 64, 5924.11, 573.387, 661.087, 4.43208, 0, 0, 0.798953, -0.601393, 300, 0, 1),
(null, 193772, 571, 1, 65535, 5686.57, 772.921, 647.754, 5.62225, 0, 0, 0.324484, -0.945891, 600, 0, 1),
(null, 193772, 571, 1, 65535, 5930.82, 548.961, 640.632, 1.88506, 0, 0, 0.809047, 0.587744, 300, 0, 1);

/* Wintergrasp Battle-Mage */
DELETE FROM `creature` WHERE `id` = 32170;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(null, 32170, 571, 1, 65535, 27801, 0, 5925.34, 573.71, 661.087, 4.06662, 300, 0, 0, 504000, 440700, 0, 0, 0, 0, 0),
(null, 32170, 571, 1, 64, 0, 918, 5932.96, 549.906, 641.595, 2.09189, 300, 0, 0, 504000, 440700, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `ScriptName` = 'npc_wg_ally_battle_mage' WHERE `entry` = 32169;
UPDATE `creature_template` SET `ScriptName` = 'npc_wg_horde_battle_mage' WHERE `entry` = 32170;
UPDATE `gameobject_template` SET `type` = 6, `faction` = 0, `data2` = 10, `data3` = 54643, `ScriptName` = 'go_wg_veh_teleporter' WHERE `entry` = 192951;

DELETE FROM `gameobject` WHERE `id` IN (
192317, 192335, 192313, 192316, 192332, 192331, 192330,
192329, 192487, 192310, 192314, 192308, 192309, 192324,
192326, 192312, 192325, 192304, 187433, 193984, 193983,
192377, 192321, 192318, 192322, 192320, 192269, 192273,
192274, 192277, 192278, 192280, 192283, 192284, 192285,
192289, 192290, 192336, 192338, 192339, 192349, 192350,
192351, 192352, 192353, 192354, 192355, 192356, 192357,
192358, 192359, 192360, 192361, 192362, 192363, 192364,
192366, 192367, 192368, 192369, 192370, 192371, 192372,
192373, 192374, 192375, 192378, 192379, 192406, 192407,
192414, 192416, 192417, 192418, 192429, 192433, 192434,
192435, 192458, 192459, 192460, 192461, 192488, 192501,
192254, 192255, 192688, 192686, 180398, 193764, 193762,
192319, 192287, 192323, 192305, 192286, 192334, 192307,
192306, 192328, 192252, 192253, 192292, 192299, 192327,
192267, 192449, 192450) AND `map` = 571;

INSERT INTO `gameobject` VALUES
(null, 192317, 571, 1, 385, 5363.39, 2781.28, 435.634, 1.58825, 0, 0, 0, 1, 300, 255, 1),
(null, 192335, 571, 1, 385, 5363.72, 2763.25, 445.023, -1.54462, 0, 0, 0, 1, 300, 255, 1),
(null, 192313, 571, 1, 1, 5392.65, 3037.11, 433.713, -1.52716, 0, 0, -0.691512, 0.722365, 300, 0, 1),
(null, 192316, 571, 1, 385, 5322.01, 2781.13, 435.673, 1.57952, 0, 0, 0, 1, 300, 255, 1),
(null, 192332, 571, 1, 1, 5289.46, 2704.68, 435.875, -0.017451, 0, 0, -0.00872539, 0.999962, 300, 0, 1),
(null, 192331, 571, 1, 1, 5350.95, 2640.36, 435.408, 1.5708, 0, 0, 0.707108, 0.707106, 300, 0, 1),
(null, 192330, 571, 1, 1, 5392.27, 2639.74, 435.331, 1.50971, 0, 0, 0.685183, 0.728371, 300, 0, 1),
(null, 192329, 571, 1, 1, 5350.88, 2622.72, 444.686, -1.5708, 0, 0, -0.707108, 0.707106, 300, 0, 1),
(null, 192487, 571, 1, 1, 5278.38, 2613.83, 432.721, -1.58825, 0, 0, -0.713251, 0.700909, 300, 0, 1),
(null, 192487, 571, 1, 1, 5260.82, 2631.8, 433.324, 3.05433, 0, 0, 0.999048, 0.0436174, 300, 0, 1),
(null, 192310, 571, 1, 1, 5271.8, 2704.87, 445.183, -3.13286, 0, 0, -0.99999, 0.00436634, 300, 0, 1),
(null, 192314, 571, 1, 1, 5236.27, 2739.46, 444.992, -1.59698, 0, 0, -0.716303, 0.697789, 300, 0, 1),
(null, 192487, 571, 1, 1, 5163.78, 2729.68, 432.009, -1.58825, 0, 0, -0.713251, 0.700909, 300, 0, 1),
(null, 192308, 571, 1, 1, 5237.07, 2757.03, 435.796, 1.51844, 0, 0, 0.688356, 0.725373, 300, 0, 1),
(null, 192309, 571, 1, 1, 5235.34, 2924.34, 435.04, -1.5708, 0, 0, -0.707108, 0.707106, 300, 0, 1),
(null, 192487, 571, 1, 1, 5262.54, 3047.95, 430.979, 3.10665, 0, 0, 0.999847, 0.0174704, 300, 0, 1),
(null, 192487, 571, 1, 1, 5163.13, 2952.59, 433.503, 1.53589, 0, 0, 0.694658, 0.71934, 300, 0, 1),
(null, 192324, 571, 1, 1, 5235.19, 2942, 443.948, 1.58825, 0, 0, 0.713251, 0.700909, 300, 0, 1),
(null, 192326, 571, 1, 1, 5272.73, 2976.55, 443.81, 3.12412, 0, 0, 0.999962, 0.00873622, 300, 0, 1),
(null, 192312, 571, 1, 1, 5352.37, 3037.09, 435.252, -1.5708, 0, 0, -0.707108, 0.707106, 300, 0, 1),
(null, 192325, 571, 1, 1, 5290.35, 2976.56, 435.221, 0.017452, 0, 0, 0.00872589, 0.999962, 300, 0, 1),
(null, 192304, 571, 1, 385, 5397.76, 2873.08, 455.321, 3.10665, 0, 0, 0.999847, 0.0174704, 300, 0, 1),
(null, 187433, 571, 1, 1, 2832.84, 6184.45, 84.6827, -2.58308, 0, 0, 0, 0, 300, 100, 1),
(null, 187433, 571, 1, 1, 2835.96, 6180.37, 84.6827, 1.50098, 0, 0, 0, 0, 180, 100, 1),
(null, 187433, 571, 1, 1, 2830.12, 6188.96, 84.6827, -0.855211, 0, 0, 0, 0, 300, 100, 1),
(null, 187433, 571, 1, 1, 2831.88, 6188.72, 84.6827, -1.65806, 0, 0, 0, 0, 300, 100, 1),
(null, 193984, 571, 1, 1, 7647.47, 2055.55, 599.399, -0.279252, 0, 0, 0, 0, 300, 0, 1),
(null, 193984, 571, 1, 1, 7647.42, 2065.23, 599.308, 0.279252, 0, 0, 0, 0, 300, 0, 1),
(null, 193984, 571, 1, 1, 7609.86, 2055.53, 599.494, -2.86234, 0, 0, 0, 0, 300, 0, 1),
(null, 193984, 571, 1, 1, 7610.18, 2065.31, 599.426, 2.87979, 0, 0, 0, 0, 300, 0, 1),
(null, 193983, 571, 1, 1, 7906.95, 2053.04, 599.626, -0.296705, 0, 0, 0, 0, 300, 0, 1),
(null, 193983, 571, 1, 1, 7907.01, 2063.02, 599.587, 0.261798, 0, 0, 0, 0, 300, 0, 1),
(null, 193983, 571, 1, 1, 7870.43, 2053.35, 599.669, -2.87979, 0, 0, 0, 0, 180, 0, 1),
(null, 193983, 571, 1, 1, 7870.36, 2063.25, 599.628, 2.86234, 0, 0, 0, 0, 300, 0, 1),
(null, 192377, 571, 1, 1, 5414.19, 3069.8, 415.187, 1.64061, 0, 0, 0, 0, 5, 100, 1),
(null, 192321, 571, 1, 385, 5288.85, 2861.82, 435.591, 0.026179, 0, 0, 0, 1, 300, 255, 1),
(null, 192318, 571, 1, 385, 5322.25, 2898.95, 435.643, -1.57952, 0, 0, 0, 1, 300, 255, 1),
(null, 192322, 571, 1, 385, 5322.89, 2917.14, 445.154, 1.56207, 0, 0, 0, 1, 300, 255, 1),
(null, 192320, 571, 1, 385, 5289.05, 2820.23, 435.674, 0, 0, 0, 0, 1, 300, 255, 1),
(null, 192269, 571, 1, 1, 4526.46, 2810.18, 391.2, -2.99322, 0, 0, 0, 1, 180, 0, 1),
(null, 192273, 571, 1, 1, 4417.94, 2324.81, 371.577, 3.08051, 0, 0, 0, 1, 180, 0, 1),
(null, 192274, 571, 1, 1, 4424.15, 3286.54, 371.546, 3.12412, 0, 0, 0, 1, 180, 0, 1),
(null, 192277, 571, 1, 1, 4572.93, 3475.52, 363.009, 1.42244, 0, 0, 0, 1, 180, 0, 1),
(null, 192278, 571, 1, 1, 4433.9, 3534.14, 360.275, -1.85005, 0, 0, 0, 1, 180, 0, 1),
(null, 192280, 571, 1, 1, 4857.97, 3335.44, 368.881, -2.94959, 0, 0, 0, 1, 180, 0, 1),
(null, 192283, 571, 1, 1, 5006.34, 3280.4, 371.163, 2.22529, 0, 0, 0, 1, 180, 0, 1),
(null, 192284, 571, 1, 65, 5372.48, 2862.5, 409.049, 3.14159, 0, 0, 0, 1, 180, 0, 1),
(null, 192285, 571, 1, 65, 5371.49, 2820.8, 409.177, 3.14159, 0, 0, 0, 1, 180, 0, 1),
(null, 192289, 571, 1, 1, 4778.19, 2438.06, 345.644, -2.94088, 0, 0, 0, 1, 180, 0, 1),
(null, 192290, 571, 1, 1, 5024.57, 2532.75, 344.023, -1.93732, 0, 0, 0, 1, 180, 0, 1),
(null, 192336, 571, 1, 1, 5154.49, 2862.15, 445.012, 3.14159, 0, 0, 0, 1, 180, 0, 1),
(null, 192338, 571, 1, 65, 5397.76, 2873.08, 455.461, 3.10665, 0, 0, 0, 1, 180, 0, 1),
(null, 192339, 571, 1, 65, 5397.39, 2809.33, 455.344, 3.10665, 0, 0, 0, 1, 180, 0, 1),
(null, 192349, 571, 1, 1, 5155.31, 2820.74, 444.979, -3.13286, 0, 0, 0, 1, 180, 0, 1),
(null, 192350, 571, 1, 1, 5270.69, 2861.78, 445.058, -3.11539, 0, 0, 0, 1, 180, 0, 1),
(null, 192351, 571, 1, 1, 5271.28, 2820.16, 445.201, -3.13286, 0, 0, 0, 1, 180, 0, 1),
(null, 192352, 571, 1, 1, 5173.02, 2820.93, 435.72, 0.017452, 0, 0, 0, 1, 180, 0, 1),
(null, 192353, 571, 1, 1, 5172.11, 2862.57, 435.721, 0.017452, 0, 0, 0, 1, 180, 0, 1),
(null, 192354, 571, 1, 1, 5288.41, 2861.79, 435.721, 0.017452, 0, 0, 0, 1, 180, 0, 1),
(null, 192355, 571, 1, 1, 5288.92, 2820.22, 435.721, 0.017452, 0, 0, 0, 1, 180, 0, 1),
(null, 192356, 571, 1, 1, 5237.07, 2757.03, 435.796, 1.51844, 0, 0, 0, 1, 180, 0, 1),
(null, 192357, 571, 1, 1, 5235.34, 2924.34, 435.04, -1.5708, 0, 0, 0, 1, 180, 0, 1),
(null, 192358, 571, 1, 65, 5322.23, 2899.43, 435.808, -1.58825, 0, 0, 0, 1, 180, 0, 1),
(null, 192359, 571, 1, 65, 5364.35, 2899.4, 435.839, -1.5708, 0, 0, 0, 1, 180, 0, 1),
(null, 192360, 571, 1, 65, 5352.37, 3037.09, 435.252, -1.5708, 0, 0, 0, 1, 180, 0, 1),
(null, 192361, 571, 1, 65, 5392.65, 3037.11, 433.713, -1.52716, 0, 0, 0, 1, 180, 0, 1),
(null, 192362, 571, 1, 65, 5322.12, 2763.61, 444.974, -1.55334, 0, 0, 0, 1, 180, 0, 1),
(null, 192363, 571, 1, 65, 5363.61, 2763.39, 445.024, -1.54462, 0, 0, 0, 1, 180, 0, 1),
(null, 192364, 571, 1, 1, 5350.88, 2622.72, 444.686, -1.5708, 0, 0, 0, 1, 180, 0, 1),
(null, 192366, 571, 1, 1, 5236.27, 2739.46, 444.992, -1.59698, 0, 0, 0, 1, 180, 0, 1),
(null, 192367, 571, 1, 1, 5271.8, 2704.87, 445.183, -3.13286, 0, 0, 0, 1, 180, 0, 1),
(null, 192368, 571, 1, 65, 5289.46, 2704.68, 435.875, -0.017451, 0, 0, 0, 1, 180, 0, 1),
(null, 192369, 571, 1, 1, 5350.95, 2640.36, 435.408, 1.5708, 0, 0, 0, 1, 180, 0, 1),
(null, 192370, 571, 1, 1, 5392.27, 2639.74, 435.331, 1.50971, 0, 0, 0, 1, 180, 0, 1),
(null, 192371, 571, 1, 65, 5364.29, 2916.94, 445.331, 1.57952, 0, 0, 0, 1, 180, 0, 1),
(null, 192372, 571, 1, 65, 5322.86, 2916.95, 445.154, 1.56207, 0, 0, 0, 1, 180, 0, 1),
(null, 192373, 571, 1, 1, 5290.35, 2976.56, 435.221, 0.017452, 0, 0, 0, 1, 180, 0, 1),
(null, 192374, 571, 1, 1, 5272.94, 2976.55, 444.492, 3.12412, 0, 0, 0, 1, 180, 0, 1),
(null, 192375, 571, 1, 1, 5235.19, 2941.9, 444.278, 1.58825, 0, 0, 0, 1, 180, 0, 1),
(null, 192378, 571, 1, 65, 5322.02, 2781.13, 435.811, 1.5708, 0, 0, 0, 1, 180, 0, 1),
(null, 192379, 571, 1, 65, 5363.42, 2781.03, 435.763, 1.5708, 0, 0, 0, 1, 180, 0, 1),
(null, 192406, 571, 1, 1, 4438.3, 3361.08, 371.568, -0.017451, 0, 0, 0, 1, 180, 0, 1),
(null, 192407, 571, 1, 1, 4448.17, 3235.63, 370.412, -1.56207, 0, 0, 0, 1, 180, 0, 1),
(null, 192414, 571, 1, 1, 4387.62, 2719.57, 389.935, -1.54462, 0, 0, 0, 1, 180, 0, 1),
(null, 192416, 571, 1, 1, 4408.57, 2422.61, 377.179, 1.58825, 0, 0, 0, 1, 180, 0, 1),
(null, 192417, 571, 1, 1, 4416.59, 2414.08, 377.196, 0, 0, 0, 0, 1, 180, 0, 1),
(null, 192418, 571, 1, 1, 4417.25, 2301.14, 377.214, 0.026179, 0, 0, 0, 1, 180, 0, 1),
(null, 192429, 571, 1, 1, 4464.12, 2855.45, 406.111, 0.829032, 0, 0, 0, 1, 180, 0, 1),
(null, 192433, 571, 1, 1, 4401.63, 3377.46, 363.365, 1.55334, 0, 0, 0, 1, 180, 0, 1),
(null, 192434, 571, 1, 1, 5041.61, 3294.4, 382.15, -1.63188, 0, 0, 0, 1, 180, 0, 1),
(null, 192435, 571, 1, 1, 4855.63, 3297.62, 376.739, -3.13286, 0, 0, 0, 1, 180, 0, 1),
(null, 192458, 571, 1, 1, 4811.4, 2441.9, 358.207, -2.0333, 0, 0, 0, 1, 180, 0, 1),
(null, 192459, 571, 1, 1, 4805.67, 2407.48, 358.191, 1.78023, 0, 0, 0, 1, 180, 0, 1),
(null, 192460, 571, 1, 1, 5004.35, 2486.36, 358.449, 2.17294, 0, 0, 0, 1, 180, 0, 1),
(null, 192461, 571, 1, 1, 4983.28, 2503.09, 358.177, -0.427603, 0, 0, 0, 1, 180, 0, 1),
(null, 192488, 571, 1, 1, 5160.34, 2798.61, 430.769, 3.14159, 0, 0, 0, 1, 180, 0, 1),
(null, 192488, 571, 1, 1, 5158.81, 2883.13, 431.618, 3.14159, 0, 0, 0, 1, 180, 0, 1),
(null, 192488, 571, 1, 1, 5278.38, 2613.83, 433.409, -1.58825, 0, 0, 0, 1, 180, 0, 1),
(null, 192488, 571, 1, 1, 5260.82, 2631.8, 433.324, 3.05433, 0, 0, 0, 1, 180, 0, 1),
(null, 192488, 571, 1, 1, 5163.13, 2952.59, 433.503, 1.53589, 0, 0, 0, 1, 180, 0, 1),
(null, 192488, 571, 1, 1, 5145.11, 2935, 433.386, 3.14159, 0, 0, 0, 1, 180, 0, 1),
(null, 192488, 571, 1, 1, 5262.54, 3047.95, 432.055, 3.10665, 0, 0, 0, 1, 180, 0, 1),
(null, 192488, 571, 1, 1, 5146.04, 2747.21, 433.584, 3.07177, 0, 0, 0, 1, 180, 0, 1),
(null, 192488, 571, 1, 1, 5163.78, 2729.68, 433.394, -1.58825, 0, 0, 0, 1, 180, 0, 1),
(null, 192501, 571, 1, 1, 4398.82, 2804.7, 429.792, -1.58825, 0, 0, 0, 1, 180, 0, 1),
(null, 192501, 571, 1, 1, 4416, 2822.67, 429.851, -0.017452, 0, 0, 0, 1, 180, 0, 1),
(null, 192501, 571, 1, 1, 4559.11, 3606.22, 419.999, -1.48353, 0, 0, 0, 1, 180, 0, 1),
(null, 192501, 571, 1, 1, 4539.42, 3622.49, 420.034, -3.07177, 0, 0, 0, 1, 180, 0, 1),
(null, 192501, 571, 1, 1, 4555.26, 3641.65, 419.974, 1.67551, 0, 0, 0, 1, 180, 0, 1),
(null, 192501, 571, 1, 1, 4574.87, 3625.91, 420.079, 0.087266, 0, 0, 0, 1, 180, 0, 1),
(null, 192501, 571, 1, 1, 4466.79, 1960.42, 459.144, 1.15192, 0, 0, 0, 1, 180, 0, 1),
(null, 192501, 571, 1, 1, 4475.35, 1937.03, 459.07, -0.436332, 0, 0, 0, 1, 180, 0, 1),
(null, 192501, 571, 1, 1, 4451.76, 1928.1, 459.076, -2.00713, 0, 0, 0, 1, 180, 0, 1),
(null, 192501, 571, 1, 1, 4442.99, 1951.9, 459.093, 2.74016, 0, 0, 0, 1, 180, 0, 1),
(null, 192254, 571, 1, 1, 5154.46, 2828.94, 409.189, 3.14159, 0, 0, 0, 1, 180, 0, 1),
(null, 192255, 571, 1, 1, 5154.52, 2853.31, 409.183, 3.14159, 0, 0, 0, 1, 180, 0, 1),
(null, 192688, 571, 1, 1, 5916.1, 566.209, 639.625, -2.72271, 0, 0, 0, 1, 180, 100, 1),
(null, 192686, 571, 1, 1, 5664.81, 791.002, 653.698, -0.663223, 0, 0, 0, 1, 180, 100, 1),
(null, 180398, 571, 1, 1, 5665.02, 790.2, 653.698, -0.610864, 0, 0, 0, 1, 180, 100, 1),
(null, 192487, 571, 1, 256, 4855.63, 3297.62, 376.281, -3.13286, 0, 0, -0.99999, 0.00436634, 300, 0, 1),
(null, 192290, 571, 1, 256, 4526.46, 2810.18, 391.2, -2.99322, 0, 0, -0.997249, 0.0741182, 300, 0, 1),
(null, 192487, 571, 1, 256, 4517.75, 2717.23, 387.812, -1.53589, 0, 0, -0.694658, 0.71934, 300, 0, 1),
(null, 192488, 571, 1, 256, 4475.35, 1937.03, 459.07, -0.436332, 0, 0, -0.216439, 0.976296, 300, 0, 1),
(null, 192488, 571, 1, 256, 4451.76, 1928.1, 459.076, -2.00713, 0, 0, -0.843392, 0.537299, 300, 0, 1),
(null, 192488, 571, 1, 256, 4442.99, 1951.9, 459.093, 2.74016, 0, 0, 0.979924, 0.199371, 300, 0, 1),
(null, 192488, 571, 1, 256, 4466.8, 1960.44, 459.841, 1.15192, 0, 0, 0.54464, 0.83867, 300, 0, 1),
(null, 192487, 571, 1, 256, 5041.61, 3294.4, 382.15, -1.63188, 0, 0, -0.72837, 0.685184, 300, 0, 1),
(null, 192278, 571, 1, 256, 5006.34, 3280.4, 371.163, 2.22529, 0, 0, 0.896872, 0.442291, 300, 0, 1),
(null, 192278, 571, 1, 256, 4857.97, 3335.44, 368.881, -2.94959, 0, 0, -0.995395, 0.0958539, 300, 0, 1),
(null, 192290, 571, 1, 256, 4433.9, 3534.14, 360.275, -1.85005, 0, 0, -0.798636, 0.601815, 300, 0, 1),
(null, 192290, 571, 1, 256, 4572.93, 3475.52, 363.009, 1.42244, 0, 0, 0.652758, 0.757566, 300, 0, 1),
(null, 192488, 571, 1, 256, 4555.26, 3641.65, 419.974, 1.67551, 0, 0, 0.743143, 0.669133, 300, 0, 1),
(null, 192488, 571, 1, 256, 4574.87, 3625.91, 420.079, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 0, 1),
(null, 192488, 571, 1, 256, 4559.11, 3606.22, 419.999, -1.48353, 0, 0, -0.67559, 0.737277, 300, 0, 1),
(null, 192488, 571, 1, 256, 4539.42, 3622.49, 420.034, -3.07177, 0, 0, -0.999391, 0.0349043, 300, 0, 1),
(null, 192290, 571, 1, 256, 4401.63, 3377.46, 363.365, 1.55334, 0, 0, 0.700908, 0.713252, 300, 0, 1),
(null, 192488, 571, 1, 256, 4448.17, 3235.63, 370.412, -1.56207, 0, 0, -0.704015, 0.710185, 300, 0, 1),
(null, 192488, 571, 1, 256, 4438.3, 3361.08, 371.299, -0.017451, 0, 0, -0.00872539, 0.999962, 300, 0, 1),
(null, 192290, 571, 1, 256, 4424.15, 3286.54, 371.546, 3.12412, 0, 0, 0.999962, 0.00873622, 300, 0, 1),
(null, 192461, 571, 1, 1, 4416.03, 2822.68, 430.475, -0.017452, 0, 0, -0.00872589, 0.999962, 300, 0, 1),
(null, 192461, 571, 1, 1, 4464.12, 2855.45, 406.111, 0.829032, 0, 0, 0.402747, 0.915311, 300, 0, 1),
(null, 192461, 571, 1, 1, 4398.82, 2804.7, 429.792, -1.58825, 0, 0, -0.713251, 0.700909, 300, 0, 1),
(null, 192461, 571, 1, 1, 4408.57, 2422.61, 377.179, 1.58825, 0, 0, 0.713251, 0.700909, 300, 0, 1),
(null, 192461, 571, 1, 1, 4416.59, 2414.08, 377.13, 0, 0, 0, 0, 1, 300, 0, 1),
(null, 192461, 571, 1, 1, 4417.25, 2301.14, 377.214, 0.026179, 0, 0, 0.0130891, 0.999914, 300, 0, 1),
(null, 192418, 571, 1, 1, 4805.67, 2407.48, 358.191, 1.78023, 0, 0, 0.777144, 0.629323, 300, 0, 1),
(null, 192418, 571, 1, 1, 4811.4, 2441.9, 358.207, -2.0333, 0, 0, -0.85035, 0.526218, 300, 0, 1),
(null, 192273, 571, 1, 1, 4778.19, 2438.06, 345.644, -2.94088, 0, 0, -0.994969, 0.100188, 300, 0, 1),
(null, 192273, 571, 1, 1, 5024.57, 2532.75, 344.023, -1.93732, 0, 0, -0.824127, 0.566404, 300, 0, 1),
(null, 192418, 571, 1, 1, 5004.35, 2486.36, 358.449, 2.17294, 0, 0, 0.884989, 0.465612, 300, 0, 1),
(null, 192418, 571, 1, 1, 4983.28, 2503.09, 358.177, -0.427603, 0, 0, -0.212176, 0.977231, 300, 0, 1),
(null, 192290, 571, 1, 1, 4417.94, 2324.81, 371.577, 3.08051, 0, 0, 0.999534, 0.0305366, 300, 0, 1),
(null, 193764, 571, 1, 1, 7625.87, 2060.05, 604.27, 0.07854, 0, 0, 0.99999, 0.004363, 180, 255, 1),
(null, 193762, 571, 1, 1, 7625.66, 2060.04, 604.195, -3.05428, 0, 0, 0.99999, 0.004363, 180, 255, 1),
(null, 192319, 571, 1, 385, 5364.3, 2899.22, 435.691, -1.55334, 0, 0, 0, 1, 300, 255, 1),
(null, 192287, 571, 1, 385, 5372.42, 2862.48, 409.366, 3.14159, 0, 0, 0, 1, 300, 255, 1),
(null, 192323, 571, 1, 385, 5364.28, 2917.26, 445.332, 1.58825, 0, 0, 0, 1, 300, 255, 1),
(null, 192305, 571, 1, 385, 5397.31, 2809.26, 455.102, 3.13286, 0, 0, 0, 1, 300, 255, 1),
(null, 192286, 571, 1, 385, 5371.45, 2820.79, 409.427, 3.12412, 0, 0, 0, 1, 300, 255, 1),
(null, 192334, 571, 1, 385, 5322.17, 2763.2, 444.974, -1.56207, 0, 0, 0, 1, 300, 255, 1),
(null, 192307, 571, 1, 385, 5271.16, 2820.11, 445.109, -3.13286, 0, 0, 0, 1, 300, 255, 1),
(null, 192306, 571, 1, 385, 5270.56, 2861.68, 444.917, -3.12412, 0, 0, 0, 1, 300, 255, 1),
(null, 192487, 571, 1, 385, 5160.28, 2798.6, 430.604, -3.12412, 0, 0, 0, 1, 300, 255, 1),
(null, 192487, 571, 1, 385, 5146.04, 2747.3, 433.527, 3.12412, 0, 0, 0, 1, 300, 255, 1),
(null, 192328, 571, 1, 385, 5173.13, 2820.96, 435.658, 0.026179, 0, 0, 0, 1, 300, 255, 1),
(null, 192252, 571, 1, 385, 5154.37, 2853.23, 409.183, 3.14159, 0, 0, 0, 1, 300, 255, 1),
(null, 192253, 571, 1, 385, 5154.42, 2828.93, 409.189, 3.14159, 0, 0, 0, 1, 300, 255, 1),
(null, 192292, 571, 1, 385, 5154.35, 2862.08, 445.01, 3.14159, 0, 0, 0, 1, 300, 255, 1),
(null, 192299, 571, 1, 385, 5155.22, 2820.63, 444.979, -3.11539, 0, 0, 0, 1, 300, 255, 1),
(null, 192327, 571, 1, 385, 5172.34, 2862.57, 435.658, 0, 0, 0, 0, 1, 300, 255, 1),
(null, 192487, 571, 1, 385, 5158.71, 2882.9, 431.274, 3.14159, 0, 0, 0, 1, 300, 255, 1),
(null, 192487, 571, 1, 385, 5145.11, 2934.95, 433.255, -3.10665, 0, 0, 0, 1, 300, 255, 1),
(null, 192267, 571, 1, 385, 4452.76, 2639.14, 358.444, 1.67552, 0, 0, 0, 1, 300, 255, 1),
(null, 192449, 571, 1, 385, 4517.75, 2717.23, 387.812, -1.53589, 0, 0, 0, 1, 300, 255, 1),
(null, 192450, 571, 1, 385, 4387.59, 2719.9, 390.201, -1.51843, 0, 0, 0, 1, 300, 255, 1);

-- Protect players from catching by Druid Cyclone at graveyard which removes immunity after disappear
DELETE FROM `spell_linked_spell` WHERE spell_trigger = 58729;
INSERT INTO `spell_linked_spell` VALUES
(58729, -33786, 2, 'Spiritual Immunity: Protect From Cyclone (now Immune always)');

-- -------------------------------------------------------------------------
-- --------------------------- Isle Of Conquest ----------------------------
-- -------------------------------------------------------------------------
-- Alliance Gunship Cannon
UPDATE `creature_template` SET `spell1` = 69495,`VehicleId` = 452 WHERE `entry` = 34929;
-- Horde Gunship Cannon
UPDATE `creature_template` SET `spell1` = 68825,`VehicleId` = 453 WHERE `entry` = 34935;
-- Keep Cannon
UPDATE `creature_template` SET `VehicleId` = 160,`spell1` = 67452,`spell2` = 68169 WHERE `entry` = 34944;
-- Catapult
UPDATE `creature_template` SET `VehicleId` = 438,`spell1` = 66218,`spell2` = 66296 WHERE `entry` = 34793;
-- Demolisher
UPDATE `creature_template` SET `VehicleId` = 509,`spell1` = 67442,`spell2` = 68068 WHERE `entry` = 34775;
-- Siege Engine
UPDATE `creature_template` SET `VehicleId` = 447,`spell1` = 67816,`spell2` = 69502 WHERE `entry` = 34776;
-- Siege Engine
UPDATE `creature_template` SET `VehicleId` = 436,`spell1` = 67816,`spell2` = 69502 WHERE `entry` = 35069;
-- Glaive Thrower
UPDATE `creature_template` SET `VehicleId` = 447,`spell1` = 68827,`spell2` = 69515 WHERE `entry` = 34802;
-- Glaive Thrower
UPDATE `creature_template` SET `VehicleId` = 447,`spell1` = 68827,`spell2` = 69515 WHERE `entry` = 35273;
-- Flame Turret
UPDATE `creature_template` SET `spell1` = 68832 WHERE `entry` = 34778;
-- Flame Turret
UPDATE `creature_template` SET `spell1` = 68832 WHERE `entry` = 36356;
-- Siege Turret
UPDATE `creature_template` SET `spell1` = 67462,`spell2` = 69505 WHERE `entry` = 34777;
-- Siege Turret
UPDATE `creature_template` SET `spell1` = 67462,`spell2` = 69505 WHERE `entry` = 36355;
-- Catapult speed
UPDATE `creature_template` SET `speed_run` = 2.428571,`speed_walk` = 2.8 WHERE `entry` = 34793;
-- Update alliance boss faction
UPDATE `creature_template` SET `faction_A` = 84, `faction_H` = 84 WHERE `entry` = 34924;
-- Update horde boss faction
UPDATE `creature_template` SET `faction_A` = 83, `faction_H` = 83 WHERE `entry` = 34922;
-- Update Kor Kron Guard faction
UPDATE `creature_template` SET `faction_A` = 83, `faction_H` = 83 WHERE `entry` = 34918;
-- Update Npc Seven TH Legion Infantry faction
UPDATE `creature_template` SET `faction_A` = 84, `faction_H` = 84 WHERE `entry` = 34919;
-- those doors are not selectables
UPDATE `gameobject_template` SET `flags` = 0x00000021 WHERE `entry` IN (195223,195703,195491,195451,195452,195437,195436);
-- alliance bombs, they can be only used by the horde
UPDATE `gameobject_template` SET `faction` = 1995 WHERE `entry` = 195332;
-- horde bombs, they can be only used by the alliance
UPDATE `gameobject_template` SET `faction` = 1997 WHERE `entry` = 195333;
-- horde teleporters
UPDATE `gameobject_template` SET `faction` = 1995 WHERE `entry` IN (195314,195313);
-- alliance teleporters
UPDATE `gameobject_template` SET `faction` = 1997 WHERE `entry` IN (195315,195316);
-- Achievement Glaive Grave
DELETE FROM `disables` WHERE `sourceType` = 4 AND `entry` = 12183;
-- Achievement Mowed Down
DELETE FROM `disables` WHERE `sourceType` = 4 AND `entry` IN (12068,12114);
-- Refinery's and Quarry's spells.
DELETE FROM `spell_area` WHERE `spell` IN (68719,68720);
INSERT INTO `spell_area` (`spell`,`area`) VALUES
(68719,4741),
(68719,4747),
(68719,4748),
(68719,4749),
(68719,4750),
(68719,4751),
(68719,4752),
(68719,4753),
(68719,4710),
(68720,4741),
(68720,4747),
(68720,4748),
(68720,4749),
(68720,4750),
(68720,4751),
(68720,4752),
(68720,4710),
(68720,4753);
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (35413, 35419, 35431, 35433);
INSERT INTO npc_spellclick_spells (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`, `aura_required`, `aura_forbidden`, `user_type`) VALUES
(35413, 60968, 0, 0, 0, 1, 0, 0, 0),
(35419, 68503, 0, 0, 0, 1, 0, 0, 0),
(35431, 46598, 0, 0, 0, 1, 0, 0, 0),
(35433, 46598, 0, 0, 0, 1, 0, 0, 0);
-- -------------------------------------------------------------------------
-- --------------------------- Dampening Spells ----------------------------
-- -------------------------------------------------------------------------
DELETE FROM `spell_area` WHERE `spell` IN (74411);
INSERT INTO `spell_area` VALUES
-- Eye of The Storm (map 566)
(74411,3820,0,0,0,0,0,2,1), -- Eye of the storm (general)
(74411,3869,0,0,0,0,0,2,1), -- Mage Tower
(74411,3870,0,0,0,0,0,2,1), -- BE Tower
(74411,3871,0,0,0,0,0,2,1), -- Draenei Ruins
(74411,3872,0,0,0,0,0,2,1), -- Fel Reaver Ruins
-- Arathi Basin (map 529)
(74411,3358,0,0,0,0,0,2,1), -- Arathi Basin (general)
(74411,3317,0,0,0,0,0,2,1), -- Trollbane Hall
(74411,3418,0,0,0,0,0,2,1), -- Defilers Den
(74411,3420,0,0,0,0,0,2,1), -- Farm
(74411,3421,0,0,0,0,0,2,1), -- Blacksmith
(74411,3422,0,0,0,0,0,2,1), -- Lumber Mill
(74411,3424,0,0,0,0,0,2,1), -- Stables
(74411,3423,0,0,0,0,0,2,1), -- Gold Mine
-- Warsong Gulch (map 489)
(74411,3277,0,0,0,0,0,2,1), -- Warsong Gulch (general)
(74411,3320,0,0,0,0,0,2,1), -- Warsong Luber Mill
(74411,3321,0,0,0,0,0,2,1), -- Silverwing Hold
(74411,4571,0,0,0,0,0,2,1), -- Silverwing Flag Room
(74411,4572,0,0,0,0,0,2,1), -- Warsong Flag Room
-- Alterac Valley (map 30)
(74411,2597,0,0,0,0,0,2,1), -- Alterac Valley (general)
(74411,2957,0,0,0,0,0,2,1), -- Irondeep Mine
(74411,2958,0,0,0,0,0,2,1), -- Stonehearth Outpost
(74411,2959,0,0,0,0,0,2,1), -- Dun Baldar
(74411,2960,0,0,0,0,0,2,1), -- Icewing Pass
(74411,2961,0,0,0,0,0,2,1), -- Frostwolf Willage
(74411,2962,0,0,0,0,0,2,1), -- Tower Point
(74411,2963,0,0,0,0,0,2,1), -- Coldtooth Mine
(74411,2964,0,0,0,0,0,2,1), -- Winterax Hold
(74411,2977,0,0,0,0,0,2,1), -- Iceblood Garrison
(74411,2978,0,0,0,0,0,2,1), -- Frostwolf Keep
(74411,3017,0,0,0,0,0,2,1), -- Frost Dagger Pass
(74411,3057,0,0,0,0,0,2,1), -- Field of Strife
(74411,3058,0,0,0,0,0,2,1), -- Icewing Cavern
(74411,3297,0,0,0,0,0,2,1), -- Frostwolf Graveyard
(74411,3298,0,0,0,0,0,2,1), -- Frostwolf Pass
(74411,3299,0,0,0,0,0,2,1), -- Dun Baldar Pass
(74411,3300,0,0,0,0,0,2,1), -- Iceblood Graveyard
(74411,3301,0,0,0,0,0,2,1), -- Snowfall Graveyard
(74411,3302,0,0,0,0,0,2,1), -- Stonehearth Graveyard
(74411,3303,0,0,0,0,0,2,1), -- Stormpike Graveyard
(74411,3304,0,0,0,0,0,2,1), -- Icewing Bunker
(74411,3305,0,0,0,0,0,2,1), -- Stonhearth Bunker
(74411,3306,0,0,0,0,0,2,1), -- Wildpaw Ridge
(74411,3318,0,0,0,0,0,2,1), -- Rock of Durotan
(74411,3337,0,0,0,0,0,2,1), -- Wildpaw Cavern
(74411,3338,0,0,0,0,0,2,1), -- The Vieled Cleft
(74411,4407,0,0,0,0,0,2,1), -- Hall of the Frostwolf
(74411,4408,0,0,0,0,0,2,1), -- Hall of the Stormpike
-- Stand of the Ancients (map 607)
(74411,4384,0,0,0,0,0,2,1), -- Strand of the Ancients (general)
(74411,4604,0,0,0,0,0,2,1), -- Gate of the Red Sun
(74411,4605,0,0,0,0,0,2,1), -- Gate of the Blue Sapphire
(74411,4606,0,0,0,0,0,2,1), -- Gate of the Green Emerald
(74411,4607,0,0,0,0,0,2,1), -- Gate of the Purple Amethyst
(74411,4608,0,0,0,0,0,2,1), -- Gate of the Yellow Moon
(74411,4609,0,0,0,0,0,2,1), -- Courtyard of the Ancients
(74411,4610,0,0,0,0,0,2,1), -- Landing Beach
-- Isle of Conquest (map 628)
(74411,4710,0,0,0,0,0,2,1), -- Isle of Conquest (general)
(74411,4741,0,0,0,0,0,2,1), -- Isle of Conquest - No Man's Land
(74411,4747,0,0,0,0,0,2,1), -- Workshop
(74411,4748,0,0,0,0,0,2,1), -- Quarry
(74411,4749,0,0,0,0,0,2,1), -- Docks
(74411,4750,0,0,0,0,0,2,1), -- Hangar
(74411,4751,0,0,0,0,0,2,1), -- Refinery
(74411,4752,0,0,0,0,0,2,1), -- Horde Keep
(74411,4753,0,0,0,0,0,2,1); -- Alliance Keep

DELETE FROM `spell_area` WHERE spell IN (74410);
INSERT INTO `spell_area` VALUES
(74410,4406,0,0,0,0,0,2,1), -- Ring of Valor (map 618)
(74410,3968,0,0,0,0,0,2,1), -- Ruins of Loraeron (map 572)
(74410,3638,0,0,0,0,0,2,1), -- Ring of Trials (map 572)
(74410,3698,0,0,0,0,0,2,1), -- Nagrand Arena (map 559)
(74410,3702,0,0,0,0,0,2,1), -- BEM Arena (map 562)
(74410,4378,0,0,0,0,0,2,1); -- Dalaran Arena (map 617)

DELETE FROM `spell_area` WHERE `spell` IN (72293,73001);
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_start_active`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`) VALUES
(72293,4812,0,0,0,0,0,2,0), -- Mark of the Fallen Champion
(73001,4892,0,0,0,0,0,2,0); -- Shadow Prison
-- -------------------------------------------------------------------------
-- ------------------------------- Ulduar ----------------------------------
-- -------------------------------------------------------------------------
-- Rapid Burst (63382) Spell Script
DELETE FROM `spell_script_names` WHERE `spell_id` = 63382;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('63382', 'spell_gen_rapid_burst');
-- Biting Cold Spell Scripts
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62038, 62039);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('62038', 'spell_gen_biting_cold'),
('62039', 'spell_gen_biting_cold_dot');
-- GameObjects
DELETE FROM `gameobject_template` WHERE `entry` = 194264;
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` IN (194316);
UPDATE `gameobject_template` SET `flags` = 34, faction = 0 WHERE `entry` IN (194255);
UPDATE `gameobject_template` SET `flags` = 32, faction = 114 WHERE `entry` IN (194416, 194905, 194631, 194554, 194556, 194553, 194441, 194634, 194442, 194559, 194774, 194775, 194776, 194750, 194773, 194557, 194558, 194560);
-- Ignis
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 9, `vehicleId` = 342 WHERE `entry` = 33118;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 9 WHERE `entry` = 33190;
DELETE FROM creature WHERE id = 33121;
DELETE FROM conditions WHERE SourceEntry = 62343;
INSERT INTO `conditions` VALUES
('13','0','62343','0','18','1','33121','0','0','',NULL);
-- Ignis constructors
UPDATE `creature_template` SET `unit_flags` = 33554434, `flags_extra` = 0 WHERE `entry` IN (33121, 33191);
-- Razorscale
UPDATE `creature_template` SET `speed_run` = 0.00001 WHERE `entry` IN (34188, 34189);

-- XT-002
UPDATE `creature_template` SET `VehicleId` = 335 WHERE `entry` = 33293;

-- Assembly of Iron
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (32867, 32927, 33693, 33692);
UPDATE `creature_template` SET `mechanic_immune_mask` = 617297499 WHERE `entry` IN (32857, 33694);
UPDATE `creature_template` SET `ScriptName` = 'npc_rune_of_power' WHERE `entry` = 33705;
UPDATE `creature_template` SET `difficulty_entry_1` = 33691, `ScriptName` = 'npc_rune_of_summoning' WHERE `entry` = 33051;
UPDATE `creature_template` SET `ScriptName` = 'npc_lightning_elemental' WHERE `entry` = 32958;
-- Loot fix
-- 10 man
UPDATE `creature_template` SET `lootid` = 32857 WHERE `entry` = 32857;
DELETE FROM `creature_loot_template` WHERE (`entry`=32857);
INSERT INTO `creature_loot_template` VALUES 
(32857, 45322, 20, 1, 2, 1, 1),
(32857, 45324, 20, 1, 1, 1, 1),
(32857, 45329, 20, 1, 2, 1, 1),
(32857, 45330, 20, 1, 1, 1, 1),
(32857, 45331, 20, 1, 2, 1, 1),
(32857, 45332, 20, 1, 1, 1, 1),
(32857, 45333, 20, 1, 2, 1, 1),
(32857, 45378, 20, 1, 2, 1, 1),
(32857, 45418, 20, 1, 1, 1, 1),
(32857, 45423, 20, 1, 1, 1, 1),
(32857, 45447, 20, 1, 3, 1, 1),
(32857, 45448, 20, 1, 3, 1, 1),
(32857, 45449, 20, 1, 3, 1, 1),
(32857, 45455, 20, 1, 3, 1, 1),
(32857, 45456, 20, 1, 3, 1, 1),
(32857, 45506, 100, 1, 0, 1, 1),
(32857, 47241, 100, 1, 0, 1, 1);
UPDATE `creature_template` SET `lootid` = 32927 WHERE `entry` = 32927;
DELETE FROM `creature_loot_template` WHERE (`entry`=32927);
INSERT INTO `creature_loot_template` VALUES 
(32927, 45322, 20, 1, 2, 1, 1),
(32927, 45324, 20, 1, 1, 1, 1),
(32927, 45329, 20, 1, 2, 1, 1),
(32927, 45330, 20, 1, 1, 1, 1),
(32927, 45331, 20, 1, 2, 1, 1),
(32927, 45332, 20, 1, 1, 1, 1),
(32927, 45333, 20, 1, 2, 1, 1),
(32927, 45378, 20, 1, 2, 1, 1),
(32927, 45418, 20, 1, 1, 1, 1),
(32927, 45423, 20, 1, 1, 1, 1),
(32927, 45447, 20, 1, 3, 1, 1),
(32927, 45448, 20, 1, 3, 1, 1),
(32927, 45449, 20, 1, 3, 1, 1),
(32927, 45455, 20, 1, 3, 1, 1),
(32927, 45456, 20, 1, 3, 1, 1),
(32927, 45506, 100, 1, 0, 1, 1),
(32927, 47241, 100, 1, 0, 1, 1);
-- 25 man
UPDATE `creature_template` SET `lootid` = 33694 WHERE `entry` = 33694;
DELETE FROM `creature_loot_template` WHERE (`entry`=33694);
INSERT INTO `creature_loot_template` VALUES 
(33694, 45038, 10, 1, 0, 1, 1),
(33694, 45087, 33, 1, 0, 1, 3),
(33694, 45089, 1.3, 1, 0, -45089, 1),
(33694, 45193, 20, 1, 1, 1, 1),
(33694, 45224, 20, 1, 3, 1, 1),
(33694, 45225, 20, 1, 1, 1, 1),
(33694, 45226, 20, 1, 2, 1, 1),
(33694, 45227, 20, 1, 1, 1, 1),
(33694, 45228, 20, 1, 3, 1, 1),
(33694, 45232, 20, 1, 1, 1, 1),
(33694, 45233, 20, 1, 3, 1, 1),
(33694, 45234, 20, 1, 3, 1, 1),
(33694, 45235, 20, 1, 2, 1, 1),
(33694, 45236, 20, 1, 3, 1, 1),
(33694, 45237, 20, 1, 2, 1, 1),
(33694, 45238, 20, 1, 2, 1, 1),
(33694, 45239, 20, 1, 2, 1, 1),
(33694, 45240, 20, 1, 1, 1, 1),
(33694, 45241, 16.666, 1, 4, 1, 1),
(33694, 45242, 16.666, 1, 4, 1, 1),
(33694, 45243, 16.666, 1, 4, 1, 1),
(33694, 45244, 16.666, 1, 4, 1, 1),
(33694, 45245, 16.666, 1, 4, 1, 1),
(33694, 45607, 16.666, 1, 4, 1, 1),
(33694, 45857, 100, 1, 0, 1, 1),
(33694, 46027, 1.3, 1, 5, 1, 1),
(33694, 46348, 1.3, 1, 5, 1, 1),
(33694, 47241, 100, 1, 0, 1, 1);
UPDATE `creature_template` SET `lootid` = 33692 WHERE `entry` = 33692;
DELETE FROM `creature_loot_template` WHERE (`entry`=33692);
INSERT INTO `creature_loot_template` VALUES 
(33692, 45038, 10, 1, 0, 1, 1),
(33692, 45087, 33, 1, 0, 1, 3),
(33692, 45089, 1.3, 1, 0, -45089, 1),
(33692, 45193, 20, 1, 1, 1, 1),
(33692, 45224, 20, 1, 3, 1, 1),
(33692, 45225, 20, 1, 1, 1, 1),
(33692, 45226, 20, 1, 2, 1, 1),
(33692, 45227, 20, 1, 1, 1, 1),
(33692, 45228, 20, 1, 3, 1, 1),
(33692, 45232, 20, 1, 1, 1, 1),
(33692, 45233, 20, 1, 3, 1, 1),
(33692, 45234, 20, 1, 3, 1, 1),
(33692, 45235, 20, 1, 2, 1, 1),
(33692, 45236, 20, 1, 3, 1, 1),
(33692, 45237, 20, 1, 2, 1, 1),
(33692, 45238, 20, 1, 2, 1, 1),
(33692, 45239, 20, 1, 2, 1, 1),
(33692, 45240, 20, 1, 1, 1, 1),
(33692, 45241, 16.666, 1, 4, 1, 1),
(33692, 45242, 16.666, 1, 4, 1, 1),
(33692, 45243, 16.666, 1, 4, 1, 1),
(33692, 45244, 16.666, 1, 4, 1, 1),
(33692, 45245, 16.666, 1, 4, 1, 1),
(33692, 45607, 16.666, 1, 4, 1, 1),
(33692, 45857, 100, 1, 0, 1, 1),
(33692, 46027, 1.3, 1, 5, 1, 1),
(33692, 46348, 1.3, 1, 5, 1, 1),
(33692, 47241, 100, 1, 0, 1, 1);
-- Runemaster Molgeim
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 4 WHERE `modelid` = 28381;
-- Steelbreaker
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 8 WHERE `modelid` = 28344;

-- Kologarn
UPDATE `creature_template` SET `baseattacktime` = 1800, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (32930, 33909);
UPDATE `creature_model_info` SET `bounding_radius` = 1, `combat_reach` = 15 WHERE `modelid` = 28638;
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 15 WHERE `modelid` = 28821;
-- Left Arm
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_left_arm' WHERE `entry` = 32933;
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 15 WHERE `modelid` = 28821;
-- Right Arm
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_right_arm' WHERE `entry` = 32934;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (33910, 33911);
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 15 WHERE `modelid` = 28822;
-- Focused Eyebeam
UPDATE `creature_template` SET `ScriptName` = 'npc_focused_eyebeam' WHERE `entry` IN (33632, 33802);
DELETE FROM conditions WHERE SourceEntry IN (63676, 63702);
INSERT INTO `conditions` VALUES
('13','0','63676','0','18','1','32930','0','0','',"Focused Eyebeam (Kologarn)"),
('13','0','63702','0','18','1','32930','0','0','',"Focused Eyebeam (Kologarn)");
-- Cleanup
DELETE FROM `creature` WHERE `id` IN (33632, 33802, 34297, 32933, 32934, 33809, 33661, 33742);
# DELETE FROM vehicle_accessory WHERE entry = 32930;


-- Auriaya
DELETE FROM `creature` WHERE `id` IN (33515, 34014);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(94378, 33515, 603, 3, 65535, 0, 0, 1938.97, 43.0634, 411.356, 4.17477, 604800, 0, 0, 3137625, 234190, 0, 2, 0, 0, 0);
UPDATE `creature_template` SET `baseattacktime` = 1500, `equipment_id` = 2422, `mechanic_immune_mask` = 617299807, `flags_extra` = 1 WHERE `entry` = 33515;
UPDATE `creature_template` SET `baseattacktime` = 1500, `equipment_id` = 2422, `mechanic_immune_mask` = 617299807, `flags_extra` = 1 WHERE `entry` = 34175;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 5 WHERE `modelid` = 28651;
-- Sanctum Sentry
UPDATE `creature_template` SET `speed_walk` = 1.66667, `mechanic_immune_mask` = 536870912, `flags_extra` = 1, `ScriptName` = 'npc_sanctum_sentry' WHERE `entry` = 34014;
UPDATE `creature_template` SET `baseattacktime` = 1500, `speed_walk` = 1.66667, `mechanic_immune_mask` = 536870912, `flags_extra` = 1 WHERE `entry` = 34166;
-- Feral Defender
UPDATE `creature_template` SET `speed_walk` = 2, `dmg_multiplier` = 3.5, `flags_extra` = 1, `ScriptName` = 'npc_feral_defender' WHERE `entry` = 34035;
UPDATE `creature_template` SET `speed_walk` = 2, `dmg_multiplier` = 5, `flags_extra` = 1, `baseattacktime` = 1500 WHERE `entry` = 34171;
UPDATE `creature_template` SET `unit_flags` = 33554432, `ScriptName` = 'npc_seeping_trigger' WHERE `entry` = 34098;
UPDATE `creature_template` SET `unit_flags` = 33554432 WHERE `entry` = 34174;
UPDATE `creature_template` SET `dmg_multiplier` = 1.5, `baseattacktime` = 1500 WHERE `entry` = 34169;
UPDATE `creature_template` SET `ScriptName` = 'npc_feral_defender_trigger' WHERE `entry` = 34096;
-- Mace equip
DELETE FROM `creature_equip_template` WHERE entry = 2422;
INSERT INTO `creature_equip_template` VALUES ('2422','45315','0','0');
-- Cleanup
DELETE FROM `creature` WHERE `id` = 34014;
-- Auriaya movement path
DELETE FROM `creature_addon` WHERE guid = 94378;
INSERT INTO `creature_addon` VALUES ('94378','1033515','0','0','0','0',null);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 137496;
DELETE FROM `waypoint_data` WHERE id = 1033515;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES
('1033515','1','1968.46','51.75','417.72','0','0','0','100','0'),
('1033515','2','1956.75','49.22','411.35','0','0','0','100','0'),
('1033515','3','1938.90','42.09','411.35','3000','0','0','100','0'),
('1033515','4','1956.75','49.22','411.35','0','0','0','100','0'),
('1033515','5','1968.46','51.75','417.72','0','0','0','100','0'),
('1033515','6','2011.43','44.91','417.72','0','0','0','100','0'),
('1033515','7','2022.65','37.74','411.36','0','0','0','100','0'),
('1033515','8','2046.65','9.61','411.36','0','0','0','100','0'),
('1033515','9','2053.4','-8.65','421.68','0','0','0','100','0'),
('1033515','10','2053.14','-39.8','421.66','0','0','0','100','0'),
('1033515','11','2046.26','-57.96','411.35','0','0','0','100','0'),
('1033515','12','2022.42','-86.39','411.35','0','0','0','100','0'),
('1033515','13','2011.26','-92.95','417.71','0','0','0','100','0'),
('1033515','14','1969.43','-100.02','417.72','0','0','0','100','0'),
('1033515','15','1956.66','-97.4','411.35','0','0','0','100','0'),
('1033515','16','1939.18','-90.90','411.35','3000','0','0','100','0'),
('1033515','17','1956.66','-97.4','411.35','0','0','0','100','0'),
('1033515','18','1969.43','-100.02','417.72','0','0','0','100','0'),
('1033515','19','2011.26','-92.95','417.71','0','0','0','100','0'),
('1033515','20','2022.42','-86.39','411.35','0','0','0','100','0'),
('1033515','21','2046.26','-57.96','411.35','0','0','0','100','0'),
('1033515','22','2053.14','-39.8','421.66','0','0','0','100','0'),
('1033515','23','2053.4','-8.65','421.68','0','0','0','100','0'),
('1033515','24','2046.65','9.61','411.36','0','0','0','100','0'),
('1033515','25','2022.65','37.74','411.36','0','0','0','100','0'),
('1033515','26','2011.43','44.91','417.72','0','0','0','100','0');



-- Hodir
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'boss_hodir' WHERE `entry` = 32845;
UPDATE `creature_template` SET `equipment_id` = 1843, `mechanic_immune_mask` = 650854239, `flags_extra` = 1 WHERE `entry` = 32846;
-- Hodir npcs
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_priest' WHERE `entry` IN (32897, 33326, 32948, 33330);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_shaman' WHERE `entry` IN (33328, 32901, 33332, 32950);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_druid' WHERE `entry` IN (33325, 32900, 32941, 33333);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_mage' WHERE `entry` IN (32893, 33327, 33331, 32946);
UPDATE `creature_template` SET `ScriptName` = 'npc_toasty_fire' WHERE `entry` = 33342;
UPDATE `creature_template` SET `ScriptName` = 'npc_icicle' WHERE `entry` = 33169;
UPDATE `creature_template` SET `ScriptName` = 'npc_icicle_snowdrift' WHERE `entry` = 33173;
UPDATE `creature_template` SET `ScriptName` = 'npc_snowpacked_icicle' WHERE `entry` = 33174;
UPDATE `creature_template` SET `difficulty_entry_1` = 33352, `mechanic_immune_mask` = 612597599, `ScriptName` = 'npc_flash_freeze' WHERE `entry` = 32926;
UPDATE `creature_template` SET `difficulty_entry_1` = 33353, `mechanic_immune_mask` = 612597599, `ScriptName` = 'npc_flash_freeze' WHERE `entry` = 32938;
UPDATE `creature_template` SET `mechanic_immune_mask` = 612597599 WHERE `entry` IN (33352, 33353);
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 194173;
-- Cleanup
DELETE FROM `creature` WHERE `id` IN (32950, 32941, 32948, 32946, 32938);

-- Mimiron Tram
UPDATE `gameobject_template` SET `flags` = 32, `data2` = 3000, `ScriptName` = 'go_call_tram' WHERE `entry` IN (194914, 194912, 194437);
DELETE FROM gameobject WHERE id = '194437';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('194437','603','1','1','2306.87','274.237','424.288','1.52255','0','0','0.689847','0.723956','300','0','1');
DELETE FROM gameobject_template WHERE entry = '194438';
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194438','1','8504','Activate Tram','','','','0','32','1','0','0','0','0','0','0','0','0','3000','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_call_tram','11159');
DELETE FROM gameobject WHERE id = '194438';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(194438, 603, 1,1,2306.99, 2589.35, 424.382, 4.71676, 0, 0, 0.705559, -0.708651, 300, 0, 1);

-- Mimiron
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_mimiron' WHERE `entry` = 33350;
-- Leviathan MKII
UPDATE `creature_template` SET `vehicleid` = 370, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk' WHERE `entry` = 33432;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34106;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk_turret' WHERE `entry` = 34071;
DELETE FROM vehicle_template_accessory WHERE entry = 33432;
INSERT INTO vehicle_template_accessory VALUE (33432, 34071, 3, 1, 'Leviathan Mk II turret', 8, 0);
UPDATE creature_template SET ScriptName = 'npc_proximity_mine' WHERE entry = 34362;
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0.5, 7, 2, 0);
-- VX-001
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `vehicleid` = 371, `ScriptName` = 'boss_vx_001' WHERE `entry` = 33651;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34108;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 34050;
UPDATE `creature_template` SET `unit_flags` = 33686020, `flags_extra` = 2 WHERE `entry` = 34211;
UPDATE `creature_template` SET `ScriptName` = 'npc_rocket_strike' WHERE `entry` = 34047;
-- Aerial Command Unit
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'boss_aerial_unit' WHERE `entry` = 33670;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34109;
UPDATE `creature_template` SET `ScriptName` = 'npc_magnetic_core' WHERE `entry` = 34068;
UPDATE `creature_template` SET `ScriptName` = 'npc_assault_bot' WHERE `entry` = 34057;
UPDATE `creature_template` SET `difficulty_entry_1` = 34148, `ScriptName` = 'npc_emergency_bot' WHERE `entry` = 34147;
-- HardMode
UPDATE `gameobject_template` SET `flags` = 32, `ScriptName` = 'go_not_push_button' WHERE `entry` = 194739;
UPDATE `creature_template` SET `difficulty_entry_1` = 34361, `ScriptName` = 'npc_frost_bomb' WHERE `entry` = 34149;
UPDATE `creature_template` SET `speed_walk` = 0.15, `speed_run` = 0.15, `ScriptName` = 'npc_mimiron_flame_trigger' WHERE `entry` = 34363;
UPDATE `creature_template` SET `ScriptName` = 'npc_mimiron_flame_spread' WHERE `entry` = 34121;
-- CleanUp
DELETE FROM creature WHERE id IN (34071, 33856);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 34143;

-- Freya
UPDATE `creature_template` SET `baseattacktime` = 1500, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_freya' WHERE `entry` = 32906;
UPDATE `creature_template` SET `speed_walk` = 1.6, `baseattacktime` = 1500, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33360;
-- Elders
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'npc_elder_brightleaf' WHERE `entry` = 32915;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'npc_elder_ironbranch' WHERE `entry` = 32913;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'npc_elder_stonebark' WHERE `entry` = 32914;
UPDATE `creature_template` SET `speed_walk` = 1.66666, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (33393, 33392, 33391);
-- Iron roots
UPDATE `creature_template` SET `difficulty_entry_1` = 33397, `mechanic_immune_mask` = 650854239, `ScriptName` = 'npc_iron_roots' WHERE `entry` = 33168;
UPDATE `creature_template` SET `difficulty_entry_1` = 33396, `mechanic_immune_mask` = 650854239, `ScriptName` = 'npc_iron_roots' WHERE `entry` = 33088;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239 WHERE `entry` IN (33396, 33397);
-- Eonar Gift
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'npc_eonars_gift' WHERE `entry` = 33228;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33385;
-- Unstable Sun Beam
UPDATE `creature_template` SET `ScriptName` = 'npc_unstable_sun_beam' WHERE `entry` = 33050;
-- Sun Beam
UPDATE `creature_template` SET `ScriptName` = 'npc_sun_beam' WHERE `entry` = 33170;
-- Nature Bomb
UPDATE `creature_template` SET `ScriptName` = 'npc_nature_bomb' WHERE `entry` = 34129;
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 194902;
-- Detonating Lasher
UPDATE `creature_template` SET `flags_extra` = 256, `ScriptName` = 'npc_detonating_lasher' WHERE `entry` = 32918;
UPDATE `creature_template` SET `flags_extra` = 256 WHERE `entry` = 33399;
-- Ancient Conservator
UPDATE `creature_template` SET `mechanic_immune_mask` = 650853979, `ScriptName` = 'npc_ancient_conservator' WHERE `entry` = 33203;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650853979 WHERE `entry` = 33376;
-- Healthy Spore
UPDATE `creature_template` SET `ScriptName` = 'npc_healthy_spore' WHERE `entry` = 33215;
-- Storm Lasher
UPDATE `creature_template` SET `ScriptName` = 'npc_storm_lasher' WHERE `entry` = 32919;
-- Snaplasher
UPDATE `creature_template` SET `ScriptName` = 'npc_snaplasher' WHERE `entry` = 32916;
-- Ancient Water Spirit
UPDATE `creature_template` SET `ScriptName` = 'npc_ancient_water_spirit' WHERE `entry` = 33202;
-- Cleanup
DELETE FROM `creature` WHERE `guid` = 136607 OR id = 33575;



-- Thorim
UPDATE `creature_template` SET `speed_walk` = 1.66667, `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;
UPDATE `creature_template` SET `speed_walk` = 1.66667, `baseattacktime` = 1500, `equipment_id` = 1844, `mechanic_immune_mask` = 650854239 WHERE `entry` = 33147;
DELETE FROM `creature` WHERE `id`=32865;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(32865, 603, 3, 1, 28977, 0, 2134.967, -298.962, 438.331, 1.57, 604800, 0, 0, 4183500, 425800, 0, 0);
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62042','62470','1','Thorim: Deafening Thunder');
-- Charge Orb
DELETE FROM conditions WHERE SourceEntry = 62016;
INSERT INTO `conditions` VALUES
('13','0','62016','0','18','1','33378','0','0','',NULL);
UPDATE `creature_template` SET `unit_flags` = 33685508 WHERE `entry` = 33378;
-- Gate
DELETE FROM `gameobject` WHERE `id`=194265;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(1000000, 194265, 603, 3, 1, 2173.24, -252.985, 420.146, 5.27078, 0, 0, 1, 0, 7200, 100, 1);
DELETE FROM `gameobject_scripts` WHERE `id` = 1000000;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(1000000, 0, 11, 8151, 15, 0, 0, 0, 0, 0);
DELETE FROM `gameobject_template` WHERE `entry`=194265;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194265','1','295','Lever','','','','0','16','3','0','0','0','0','0','0','0','0','6000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0');
UPDATE `gameobject` SET `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `id` = 194265;
-- Cleanup
DELETE FROM `creature` WHERE `id` IN (32885, 32883, 32908, 32907, 32882, 33110, 32886, 32879, 32892, 33140, 33141, 33378, 32874, 32875);
-- Pre adds
UPDATE `creature_template` SET `equipment_id` = 1849, `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 33153;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32883;
UPDATE `creature_template` SET `equipment_id` = 1847 WHERE `entry` = 33152;
UPDATE `creature_template` SET `equipment_id` = 1850, `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32908;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 33151;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32907;
UPDATE `creature_template` SET `equipment_id` = 1852 WHERE `entry` = 33150;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32882;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32886;
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0 WHERE `entry`IN (33378, 32892);
DELETE FROM `creature` WHERE `id`=32885;
DELETE FROM `creature` WHERE `id`=32908;
DELETE FROM `creature` WHERE `id`=32882;
DELETE FROM `creature` WHERE `id`=32886;
DELETE FROM `creature` WHERE `id`=33378;
DELETE FROM `creature` WHERE `id`=32892;
-- Thorim Mini bosses
UPDATE `creature` SET `phaseMask` = 1 WHERE `id` IN (32872, 32873, 33196);
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_runic_colossus' WHERE `entry` = 32872;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_ancient_rune_giant' WHERE `entry` = 32873;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_sif' WHERE `entry` = 33196;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_arena_phase' WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875, 33110);
DELETE FROM `creature_addon` WHERE `guid`IN (136059, 136816);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('136059','0','0','0','1','0','40775 0'),
('136816','0','0','0','1','0','40775 0');


-- General Vezax
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803, `flags_extra` = 257, `ScriptName` = 'boss_general_vezax' WHERE `entry` = 33271;
UPDATE `creature_template` SET `baseattacktime` = 1500, `mechanic_immune_mask` = 617299803, `flags_extra` = 257 WHERE `entry` = 33449;
UPDATE `creature_model_info` SET `bounding_radius` = 0.62, `combat_reach` = 12 WHERE `modelid` = 28548;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_saronite_vapors' WHERE `entry` = 33488;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_saronite_animus' WHERE `entry` = 33524;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `mechanic_immune_mask` = 650854235 WHERE `entry` IN (33789, 34152);
UPDATE `creature_model_info` SET `bounding_radius` = 0.62, `combat_reach` = 10 WHERE `modelid` = 28992;
-- CleanUp
DELETE FROM creature WHERE id = 33500;
-- Creatures and Gameobjects 25 man spawn
UPDATE `creature` SET `spawnMask` = 3 WHERE `map` = 603;
UPDATE `gameobject` SET `spawnMask` = 3 WHERE `map` = 603;
-- Sara
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'boss_sara' WHERE `entry` IN (33134);
UPDATE creature_model_info SET bounding_radius = 0.465, combat_reach = 45 WHERE modelid = 29117;
UPDATE `creature` SET `spawndist` = 0 WHERE `id` = 33134;
-- Ominous cloud
DELETE FROM `creature` WHERE `id`=33292;
UPDATE `creature_template` SET `ScriptName` = 'npc_ominous_cloud' WHERE `entry` = 33292;
-- Guardian of Yogg-Saron
UPDATE `creature_template` SET `difficulty_entry_1` = 33968, `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'npc_guardian_yoggsaron' WHERE `entry` = 33136;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 33968;
UPDATE creature_model_info SET bounding_radius = 0.62, combat_reach = 1.5 WHERE modelid = 28465;
-- Yogg-Saron
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_yoggsaron' WHERE `entry` = 33288;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33955;
UPDATE creature_model_info SET bounding_radius = 0.755, combat_reach = 18 WHERE modelid = 28817;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `speed_walk` = 2, `ScriptName` = 'npc_death_orb' WHERE `entry` = 33882;
-- Brain of Yogg-Saron
UPDATE `creature_template` SET `difficulty_entry_1` = 33954, `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_brain_yoggsaron' WHERE `entry` = 33890;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33954;
UPDATE creature_model_info SET bounding_radius = 0.755, combat_reach = 30 WHERE modelid = 28951;
-- Illusions
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'npc_laughing_skull' WHERE `entry` = 33990;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 7, `faction_H` = 7, `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_illusion' WHERE `entry` IN (33433, 33716, 33717, 33719, 33720, 33567);
UPDATE creature_model_info SET bounding_radius = 0.306, combat_reach = 1.5 WHERE modelid = 28621;
UPDATE creature_model_info SET bounding_radius = 1, combat_reach = 10 WHERE modelid IN (2718, 1687, 2717, 12869);
-- Influence Tentacle
UPDATE `creature_template` SET `difficulty_entry_1` = 33959, `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 33943;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 33959;
UPDATE creature_model_info SET bounding_radius = 0.306, combat_reach = 1.5 WHERE modelid = 28813;
-- Fake npcs
UPDATE `creature_template` SET ScriptName = "npc_passive_illusion" WHERE `entry` IN (33436, 33437, 33536, 33535, 33495, 33523, 33441, 33442);
-- Whispers
UPDATE `script_texts` SET `type` = 4 WHERE `entry` IN (-1603317, -1603340, -1603339);
-- Descend into madness portal
UPDATE `creature_template` SET `npcflag` = 16777216, `unit_flags` = 2, `type_flags` = 0, `ScriptName` = 'npc_descend_into_madness' WHERE `entry` = 34072;
DELETE FROM `creature_template` WHERE entry IN (34122, 34123);
INSERT INTO `creature_template` VALUES
('34122','0','0','0','0','0','29074','0','0','0','Descend Into Madness','','Interact','0','81','81','0','35','35','16777216','1','1.14286','1','0','0','0','0','0','1','2000','0','1','2','0','0','0','0','0','0','0','0','0','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_descend_into_madness','11159'),
('34123','0','0','0','0','0','29074','0','0','0','Descend Into Madness','','Interact','0','81','81','0','35','35','16777216','1','1.14286','1','0','0','0','0','0','1','2000','0','1','2','0','0','0','0','0','0','0','0','0','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_descend_into_madness','11159');
-- Flee to the Surface
UPDATE `gameobject_template` SET `data10` = 63992 WHERE `entry` = 194625;
DELETE FROM `gameobject` WHERE `id` = 194625;
INSERT INTO `gameobject` VALUES
(NULL, 194625, 603, 3, 1, 1996.41, -0.070, 240.59, 0, 0, 0, 1, 0, 300, 0, 1),
(NULL, 194625, 603, 3, 1, 1949.63, -26.07, 241.25, 0, 0, 0, 1, 0, 300, 0, 1),
(NULL, 194625, 603, 3, 1, 1995.03, -52.98, 241.02, 0, 0, 0, 1, 0, 300, 0, 1);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (34072, 34122, 34123);
INSERT INTO `npc_spellclick_spells` VALUES
(34072, 63989, 0, 0, 0, 3, 0, 0, 0), -- Stormwind
(34122, 63997, 0, 0, 0, 3, 0, 0, 0), -- Chamber
(34123, 63998, 0, 0, 0, 3, 0, 0, 0); -- Icecrown
-- Cancel Illusion Room Aura
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 63992;
INSERT INTO `spell_linked_spell` VALUES
(63992, -63988, 0, "Cancel Illusion Room Aura");
-- Dragon blood
DELETE FROM gameobject WHERE id = 194462;
INSERT INTO gameobject VALUES (NULL, 194462, 603, 3, 1, 2104.35, -25.3753, 242.647, 0, 0, 0, 0, -1, 300, 0, 1);
-- Remove spawned mobs
-- DELETE FROM `creature` WHERE `id`=34137 AND position_x = 1921.84;
-- Portals coordinates
DELETE FROM `spell_target_position` WHERE `id` IN (63989, 63992, 63997, 63998);
INSERT INTO `spell_target_position` VALUES
(63989, 603, 1953.91, 21.91, 239.71, 2.08),
(63992, 603, 1980.28, -25.59, 329.40, 3.14),
(63997, 603, 2042.02, -25.54, 239.72, 0),
(63998, 603, 1948.44, -82.04, 239.99, 4.18);
-- Tentacles
UPDATE `creature_template` SET `difficulty_entry_1` = 33984, `faction_A` = 14, `faction_H` = 14, `ScriptName` = "npc_constrictor_tentacle" WHERE `entry` = 33983;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14, `VehicleId` = 385 WHERE `entry` = 33984;
UPDATE creature_model_info SET bounding_radius = 0.306, combat_reach = 1.5 WHERE modelid = 28815;
-- Constrictor vehicle
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 33983;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(33983,46598,0,0,0,0,0,0,0);
UPDATE `creature_template` SET `difficulty_entry_1` = 33967, `faction_A` = 14, `faction_H` = 14, `baseattacktime` = 1800, `ScriptName` = 'npc_crusher_tentacle' WHERE `entry` = 33966;
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `faction_A` = 14, `faction_H` = 14, `baseattacktime` = 1800 WHERE `entry` = 33967;
UPDATE creature_model_info SET bounding_radius = 0.985, combat_reach = 5 WHERE modelid = 28814;
UPDATE `creature_template` SET `difficulty_entry_1` = 33986, `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'npc_corruptor_tentacle' WHERE `entry` = 33985;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 33986;
-- Immortal Guardian
UPDATE `creature_template` SET `difficulty_entry_1` = 33989, `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_immortal_guardian' WHERE `entry` = 33988;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33989;
UPDATE creature_model_info SET bounding_radius = 0.92, combat_reach = 4 WHERE modelid = 29024;
-- Remove area stun
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (64059, 65238);
INSERT INTO `spell_linked_spell` VALUES
(64059, 65238, 0, "Shattered illusion remove"),
(65238, -64173, 1, "Shattered illusion remove");
-- Yogg-Saron emotes
DELETE FROM script_texts WHERE entry IN (-1603342, -1603343, -1603344);
INSERT INTO script_texts VALUES
(33288, -1603342, "Portals open into Yogg-Saron's mind!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 0, 0, "YoggSaron EMOTE_PORTALS"),
(33288, -1603343, "The Illusion shatters and a path to the central chamber opens!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 0, 0, "YoggSaron EMOTE_OPEN_CHAMBER"),
(33288, -1603344, "Yogg-Saron prepares to unleash Empowering Shadows!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 0, 0, "YoggSaron EMOTE_EMPOWERING");
-- Ulduar Keepers Images
DELETE FROM `creature` WHERE `id` IN (33213, 33241, 33242, 33244);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33241, 603, 3, 1, 0, 0, 2057.81, -24.0768, 421.532, 3.12904, 604800, 0, 0, 14433075, 0, 0, 0),
(33242, 603, 3, 1, 0, 0, 2036.81, -73.7053, 411.353, 2.43575, 604800, 0, 0, 14433075, 0, 0, 0),
(33244, 603, 3, 1, 0, 0, 2036.74, 25.4642, 411.357, 3.81412, 604800, 0, 0, 14433075, 0, 0, 0),
(33213, 603, 3, 1, 0, 0, 1939.29, -90.6994, 411.357, 1.02595, 604800, 0, 0, 14433075, 0, 0, 0);

UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `npcflag` = 1, `flags_extra` = 2, `ScriptName` = 'npc_keeper_image' WHERE `entry` IN (33213, 33241, 33242, 33244);

-- Keepers (Yogg Saron Encounter)
DELETE FROM `creature` WHERE `id` IN (33410, 33411, 33412, 33413);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33410, 603, 3, 1, 0, 0, 2036.739, 25.464, 338.296, 3.814, 604800, 0, 0, 14433075, 0, 0, 0),
(33411, 603, 3, 1, 0, 0, 1939.094, -90.699, 338.296, 1.026, 604800, 0, 0, 14433075, 0, 0, 0),
(33412, 603, 3, 1, 0, 0, 1939.094, 42.534, 338.296, 5.321, 604800, 0, 0, 14433075, 0, 0, 0),
(33413, 603, 3, 1, 0, 0, 2036.739, -73.705, 338.296, 2.435, 604800, 0, 0, 14433075, 0, 0, 0);

UPDATE `creature_template` SET `ScriptName` = 'npc_ys_freya' WHERE `entry` = 33410;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_hodir' WHERE `entry` = 33411;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_mimiron' WHERE `entry` = 33412;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_thorim' WHERE `entry` = 33413;
UPDATE `creature_template` SET `ScriptName` = 'npc_sanity_well' WHERE `entry` = 33991;

-- Death Ray Target
DELETE FROM conditions WHERE SourceEntry IN (63882, 63886);
INSERT INTO conditions VALUES
(13, 0, 63882, 0, 18, 1, 33134, 0, 0, '', 'Death Ray Warning (Yogg-Saron)'),
(13, 0, 63886, 0, 18, 1, 33134, 0, 0, '', 'Death Ray Damage (Yogg-Saron)');

-- Shattered Illusion Targets
DELETE FROM conditions WHERE SourceEntry = 64173;
INSERT INTO conditions VALUES
(13, 0, 64173, 0, 18, 1, 33966, 0, 0, '', 'Shattered Illusion (Yogg-Saron)'),
(13, 0, 64173, 0, 18, 1, 33983, 0, 0, '', 'Shattered Illusion (Yogg-Saron)'),
(13, 0, 64173, 0, 18, 1, 33985, 0, 0, '', 'Shattered Illusion (Yogg-Saron)');

-- Thorim's Titanic Storm
DELETE FROM conditions WHERE SourceEntry = 64172;
INSERT INTO conditions VALUES
(13, 0, 64172, 0, 18, 1, 33988, 0, 0, '', 'Thorim''s Titanic Storm (Yogg-Saron)');

-- Empowering Shadows
DELETE FROM conditions WHERE SourceEntry = 64468;
INSERT INTO conditions VALUES
(13, 0, 64468, 0, 18, 1, 33288, 0, 0, '', 'Empowering Shadows (Yogg-Saron)'),
(13, 0, 64468, 0, 18, 1, 33988, 0, 0, '', 'Empowering Shadows (Yogg-Saron)');

-- Shadow Nova Target
DELETE FROM conditions WHERE SourceEntry IN (62714, 65209);
INSERT INTO conditions VALUES
(13, 0, 62714, 0, 18, 1, 33134, 0, 0, '', 'Shadow Nova (Yogg-Saron)'),
(13, 0, 65209, 0, 18, 1, 33134, 0, 0, '', 'Shadow Nova (Yogg-Saron)');

-- Spell Scripts
DELETE FROM spell_script_names WHERE spell_id IN (64164, 64168, 64059);
INSERT INTO spell_script_names VALUES
(64164, "spell_yoggsaron_lunatic_gaze"),
(64168, "spell_yoggsaron_lunatic_gaze"),
(64059, "spell_yoggsaron_induce_madness");
-- DELETE DOUBLE CACHE SPAWN, THEY ARE SPAWN BY CORE.
-- ------
-- HODIR
-- ------
-- La caja se spanwea con el core, no sé necesita tener una spanwneada.
DELETE FROM `gameobject` WHERE `id` = 194307; -- Alijo normal
DELETE FROM `gameobject` WHERE `id` = 194308; -- Alijo normal 25 jugadores
DELETE FROM `gameobject` WHERE `id` = 194200; -- Alijo poco comund
DELETE FROM `gameobject` WHERE `id` = 194201; -- Alijo poco comun 25 jugadores
-- ---------
-- KOLOGARN
-- ---------
-- No es necesario que este spanwneada, la saca el core.
DELETE FROM `gameobject` WHERE `id` = 195046; -- Alijo de 10 jugadores
DELETE FROM `gameobject` WHERE `id` = 195047; -- Alijo de 25 jugadores
-- Algalon

REPLACE INTO script_texts (entry,content_default,sound,type,language,emote,comment) VALUES
(-1603106,'Trans-location complete. Commencing planetary analysis of Azeroth.',15405,1,0,0,'algalon SAY_INTRO_1'),
(-1603107,'Stand back, mortals. I am not here to fight you.',15406,1,0,0,'algalon SAY_INTRO_2'),
(-1603108,'It is in the universe\'s best interest to re-originate this planet should my analysis find systemic corruption. Do not interfere.',15407,1,0,0,'algalon SAY_INTRO_3'),

(-1603109,'See your world through my eyes. A universe so vast as to be immeasurable. Incomprehensible even to your greatest minds.',15390,1,0,0,'algalon SAY_ENGAGE'),
(-1603110,'Your actions are illogical. All possible results for this encounter have been calculated. The pantheon will receive the observer\'s message regardless outcome.',15386,1,0,0,'algalon SAY_AGGRO'),
(-1603111,'Loss of life, unavoidable.',15387,1,0,0,'algalon SAY_SLAY_1'),
(-1603112,'I do what I must.',15388,1,0,0,'algalon SAY_SLAY_2'),
(-1603113,'The stars come to my aid.',15392,1,0,0,'algalon SAY_SUMMON_STAR'),
(-1603114,'Witness the fury of cosmos!',15396,1,0,0,'algalon SAY_BIG_BANG_1'),
(-1603115,'Behold the tools of creation!',15397,1,0,0,'algalon SAY_BIG_BANG_2'),
(-1603116,'Beware!',15391,1,0,0,'algalon SAY_PHASE_2'),
(-1603117,'You are... out of time.',15394,1,0,0,'algalon SAY_BERSERK'),

(-1603118,'Analysis complete. There is partial corruption in the plane\'s life-support systems as well as complete corruption in most of the planet\'s defense mechanisms.',15398,1,0,0,'algalon SAY_DESPAWN_1'),
(-1603119,'Begin uplink: Reply Code: \'Omega\'. Planetary re-origination requested.',15399,1,0,0,'algalon SAY_DESPAWN_2'),
(-1603120,'Farewell, mortals. Your bravery is admirable, for such flawed creatures.',15400,1,0,0,'algalon SAY_DESPAWN_3'),

(-1603121,'I have seen worlds bathed in the Makers\' flames. Their denizens fading without so much as a whimper. Entire planetary systems born and raised in the time that it takes your mortal hearts to beat once. Yet all throughout, my own heart, devoid of emotion... of empathy. I... have... felt... NOTHING! A million, million lives wasted. Had they all held within them your tenacity? Had they all loved life as you do?',15393,1,0,0,'algalon SAY_OUTRO_1'),
(-1603122,'Perhaps it is your imperfection that which grants you free will. That allows you to persevere against cosmically calculated odds. You prevailed where the Titans\' own perfect creations have failed.',15401,1,0,0,'algalon SAY_OUTRO_2'),
(-1603123,'I\'ve rearranged the reply code. Your planet will be spared. I cannot be certain of my own calculations anymore.',15402,1,0,0,'algalon SAY_OUTRO_3'),
(-1603124,'I lack the strength to transmit this signal. You must hurry. Find a place of power, close to the skies.',15403,1,0,0,'algalon SAY_OUTRO_4'),
(-1603125,'Do not worry about my fate $n. If the signal is not transmitted in time re-origination will proceed regardless. Save. Your. World.',15404,1,0,0,'algalon SAY_OUTRO_5');

UPDATE creature_template SET ScriptName = 'boss_algalon' WHERE entry = 32871;
UPDATE creature_template SET ScriptName = 'mob_collapsing_star' WHERE entry = 32955;
UPDATE creature_template SET ScriptName = 'mob_living_constellation' WHERE entry = 33052;
UPDATE creature_template SET ScriptName = 'mob_black_hole' WHERE entry = 32953;
UPDATE creature_template SET ScriptName = 'mob_cosmic_smash_target' WHERE entry IN (33105, 33104);
UPDATE gameobject_template SET flags= 6553632, ScriptName='go_celestial_acces' WHERE entry IN (194628, 194752);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (33113, 33114, 33118, 33293, 33432, 33651);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(33113,46598,0,0,0,0,0,0,0), -- Flame Leviathan
(33114,46598,0,0,0,0,0,0,0), -- Flame Leviathan Seat
(33118,46598,0,0,0,0,0,0,0), -- Ignis
(33293,46598,0,0,0,0,0,0,0), -- XT-002
(33432,46598,0,0,0,0,0,0,0), -- Leviathan MK II
(33651,46598,0,0,0,0,0,0,0); -- VX-001

DELETE FROM creature WHERE id = 33167;
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0 WHERE `entry` IN (33364, 33369, 33108, 33366);

DELETE FROM vehicle_template_accessory WHERE entry = 33113 AND seat_id IN (0, 1);
INSERT INTO vehicle_template_accessory VALUES
(33113, 33114, 0, 1, "Flame Leviathan", 6, 30000),
(33113, 33114, 1, 1, "Flame Leviathan", 6, 30000);

UPDATE creature_model_info SET bounding_radius = 15, combat_reach = 10 WHERE modelid IN (29158, 29159, 29160);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33264; -- TODO
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'boss_flame_leviathan_defense_cannon' WHERE `entry` = 33139;

-- Mimiron modelids
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 7 WHERE `modelid` = 28831;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 5 WHERE `modelid` = 28841;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 4 WHERE `modelid` = 28979;

-- Boom Bot
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33836);
INSERT INTO `smart_scripts` VALUES
(33836, 0, 0, 1, 9, 0, 100, 1, 0, 2, 0, 0, 11, 63801, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Boom Bot - Explode'),
(33836, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Boom Bot - despawn');

-- Leviathan Doors
DELETE FROM `gameobject` WHERE `id` = '194905';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('194905','603','1','1','401.308','-13.8236','409.524','3.14159','0','0','0','1','180','255','0');

-- Thorim's Hammer
DELETE FROM `conditions` WHERE `SourceEntry` = 62911;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
('13','0','62911','0','18','1','33365','0','0','',"Thorim Hammer");

-- Mimiron's Inferno
DELETE FROM `conditions` WHERE `SourceEntry` = 62909;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
('13','0','62909','0','18','1','33370','0','0','',"Mimiron Inferno");

-- Hodir's Fury
DELETE FROM `conditions` WHERE `SourceEntry` = 62533;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
('13','0','62533','0','18','1','33212','0','0','',"Hodirs Fury");

-- Freya's Ward
DELETE FROM `conditions` WHERE `SourceEntry` = 62906;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
('13','0','62906','0','18','1','33367','0','0','',"Freya Ward");


UPDATE `creature_template` SET `speed_walk` = 2 WHERE `entry` IN (33370, 33212);
DELETE FROM creature WHERE guid IN (137479, 137480);

UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` = 34114;
-- XT-002 correct vehicle id
UPDATE `creature_template` SET `VehicleId` = 353 WHERE `entry` = 33293;
-- XT-002 Hearth
DELETE FROM `vehicle_template_accessory` WHERE `entry` = 33293;
INSERT INTO `vehicle_template_accessory` VALUES
(33293, 33329, 0, 1, "XT-002 Hearth", 6, 30000);
-- Gravity Bomb
DELETE FROM spell_script_names WHERE spell_id IN (63025, 64233);
INSERT INTO spell_script_names VALUES
(63025, "spell_xt002_gravity_bomb"),
(64233, "spell_xt002_gravity_bomb");

-- Salvaged Chopper has faction dependent modelid
UPDATE `creature_template` SET `modelid2` = 0 WHERE `entry` = 33062;
-- Sanctum Sentry 25 damage nerf
UPDATE `creature_template` SET `dmg_multiplier` = 35 WHERE `entry` = 34166;

DELETE FROM vehicle_template_accessory WHERE entry = 32930;
INSERT INTO vehicle_template_accessory VALUES
(32930, 32933, 0, 1, "Kologarn - Left Arm", 6, 30000),
(32930, 32934, 1, 1, "Kologarn - Right Arm", 6, 30000);

-- For Achievement Champion/Conqueror of Ulduar
DELETE FROM achievement_criteria_data WHERE `type` = 18 AND criteria_id IN
(10042,10342,10340,10341,10598,10348,10351,10439,
10403,10582,10347,10349,10350,
10352,10355,10353,10354,10599,10357,10363,10719,
10404,10583,10361,10362,10364);
INSERT INTO achievement_criteria_data (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10042,18,0,0,''),
(10342,18,0,0,''),
(10340,18,0,0,''),
(10341,18,0,0,''),
(10598,18,0,0,''),
(10348,18,0,0,''),
(10351,18,0,0,''),
(10439,18,0,0,''),
(10403,18,0,0,''),
(10582,18,0,0,''),
(10347,18,0,0,''),
(10349,18,0,0,''),
(10350,18,0,0,''),
(10352,18,0,0,''),
(10355,18,0,0,''),
(10353,18,0,0,''),
(10354,18,0,0,''),
(10599,18,0,0,''),
(10357,18,0,0,''),
(10363,18,0,0,''),
(10719,18,0,0,''),
(10404,18,0,0,''),
(10583,18,0,0,''),
(10361,18,0,0,''),
(10362,18,0,0,''),
(10364,18,0,0,'');
-- delete from disables, now is working
DELETE FROM disables WHERE sourceType = 4 AND entry IN
(10042,10342,10340,10341,10598,10348,10351,10439,
10403,10582,10347,10349,10350,
10352,10355,10353,10354,10599,10357,10363,10719,
10404,10583,10361,10362,10364);

-- For Achievement In his House he waits dreaming
DELETE FROM achievement_criteria_data WHERE `type` = 18 AND criteria_id IN
(10321,10322,10323,10324,10325,10326);
INSERT INTO achievement_criteria_data (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10321,18,0,0,''),(10322,18,0,0,''),
(10323,18,0,0,''),(10324,18,0,0,''),
(10325,18,0,0,''),(10326,18,0,0,'');
-- delete from disables, now is working
DELETE FROM disables WHERE sourceType = 4 AND entry IN
(10321,10322,10323,10324,10325,10326);

-- For Achievement He Feeds on your Tears
DELETE FROM achievement_criteria_data WHERE `type` = 18 AND criteria_id IN
(10568,10570);
INSERT INTO achievement_criteria_data (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10568,18,0,0,''),
(10570,18,0,0,'');
-- delete from disables, now is working
DELETE FROM disables WHERE sourceType = 4 AND entry IN
(10568,10570);

-- Provisional SmarAI, later will be add in Full DataBase.
-- ulduar_smartai.sql
-- Runeforged Sentry
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `AIName` = 'SmartAI' WHERE `entry` = 34234;
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847 WHERE `entry` = 34235;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34234);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34234);
INSERT INTO `smart_scripts` VALUES
(34234, 0, 0, 0, 0, 0, 100, 0, 2000, 2000, 10000, 10000, 11, 64852, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Runeforged Sentry - Cast Flaming Rune'),
(34234, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 5000, 7000, 11, 64870, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Runeforged Sentry - Cast Lava Burst'),
(34234, 0, 2, 0, 0, 0, 100, 0, 2500, 3000, 12000, 12000, 11, 64847, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Runeforged Sentry - Cast Runed Flame Jets');

-- Steelforged Defender
UPDATE `creature_template` SET `spell1` = 62845, `spell2` = 57780, `spell3` = 50370, `AIName` = 'SmartAI' WHERE `entry` = 33236;
UPDATE `creature_template` SET `spell1` = 62845, `spell2` = 57780, `spell3` = 50370 WHERE `entry` = 34113;
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` IN (33236, 33838);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33236);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33236);
INSERT INTO `smart_scripts` VALUES
(33236, 0, 0, 0, 0, 0, 100, 0, 4000, 6000, 15000, 20000, 11, 62845, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Steelforged Defender - Cast Hamstring'),
(33236, 0, 1, 0, 0, 0, 100, 0, 2000, 4000, 6000, 8000, 11, 57780, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Steelforged Defender - Cast Lightning Bolt'),
(33236, 0, 2, 0, 0, 0, 100, 0, 5000, 6000, 4000, 6000, 11, 50370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Steelforged Defender - Cast Sunder Armor');

-- Mechagnome Battletank
UPDATE `creature_template` SET `spell1` = 64693, `spell2` = 64953, `AIName` = 'SmartAI' WHERE `entry` = 34164;
UPDATE `creature_template` SET `spell1` = 64693, `spell2` = 64953 WHERE `entry` = 34165;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34164);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34164);
INSERT INTO `smart_scripts` VALUES
(34164, 0, 0, 0, 0, 0, 100, 0, 3000, 4000, 6000, 8000, 11, 64693, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Mechagnome Battletank - Cast Flame Cannon'),
(34164, 0, 1, 0, 0, 0, 100, 0, 10000, 10000, 15000, 20000, 11, 64953, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0,'Mechagnome Battletank - Cast Jump Attack');

-- Ulduar Colossus
UPDATE `creature_template` SET `spell1` = 62625, `AIName` = 'SmartAI' WHERE `entry` = 33237;
UPDATE `creature_template` SET `spell1` = 62625 WHERE `entry` = 34105;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33237);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33237);
INSERT INTO `smart_scripts` VALUES
(33237, 0, 0, 0, 0, 0, 100, 0, 8000, 10000, 15000, 20000, 11, 62625, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Ulduar Colossus - Cast Ground Slam');

-- invisible triggers
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33377, 33742, 34286, 33500, 33406, 33575);

-- Molten Colossus
UPDATE `creature_template` SET `spell1` = 64697, `spell2` = 64698, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34069;
UPDATE `creature_template` SET `spell1` = 64697, `spell2` = 64698, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34185;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34069);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34069);
INSERT INTO `smart_scripts` VALUES
(34069, 0, 0, 0, 0, 0, 100, 0, 6000, 10000, 10000, 12000, 11, 64697, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Molten Colossus - Cast Earthquake'),
(34069, 0, 1, 0, 0, 0, 100, 0, 10000, 10000, 15000, 20000, 11, 64698, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Molten Colossus - Cast Pyroblast');

-- Magma Rager
UPDATE `creature_template` SET `spell1` = 64773, `spell2` = 64746, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34086;
UPDATE `creature_template` SET `spell1` = 64773, `spell2` = 64746, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34201;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34086);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34086);
INSERT INTO `smart_scripts` VALUES
(34086, 0, 0, 0, 0, 0, 100, 0, 2000, 4000, 6000, 8000, 11, 64773, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Magma Rager - Cast Fire Blast'),
(34086, 0, 1, 0, 0, 0, 100, 0, 8000, 16000, 15000, 25000, 11, 64746, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Magma Rager - Cast Superheated winds');
UPDATE `creature_template` SET `unit_flags` = 33718790, modelid1 = 11686, modelid2 = 0, `spell1` = 64724, `AIName` = 'SmartAI' WHERE `entry` = 34194;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34194);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34194);
INSERT INTO `smart_scripts` VALUES
(34194, 0, 0, 0, 0, 0, 100, 0, 1000, 2000, 10000, 10000, 11, 64724, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Superheated Winds');

-- Forge Construct
UPDATE `creature_template` SET `spell1` = 64719, `spell2` = 64720, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34085;
UPDATE `creature_template` SET `spell1` = 64719, `spell2` = 64721, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34186;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34085);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34085);
INSERT INTO `smart_scripts` VALUES
(34085, 0, 0, 0, 0, 0, 100, 0, 8000, 12000, 10000, 16000, 11, 64719, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0,'Forge Construct - Cast Charge'),
(34085, 0, 1, 0, 0, 0, 100, 2, 2000, 6000, 6000, 8000, 11, 64720, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Forge Construct - Cast Flame Emission 10'),
(34085, 0, 2, 0, 0, 0, 100, 4, 2000, 6000, 6000, 8000, 11, 64721, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Forge Construct - Cast Flame Emission 25');

-- XB-488 Disposalbot
UPDATE `creature_template` SET `spell1` = 65080, `spell2` = 65084, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34273;
UPDATE `creature_template` SET `spell1` = 65104, `spell2` = 65084, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34274;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34273);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34273);
INSERT INTO `smart_scripts` VALUES
-- (34273, 0, 0, 0, 2, 0, 100, 0, 30, 20, 0, 0, 11, 65084, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'XB-488 Disposalbot - Cast Self Destruct'),
(34273, 0, 1, 0, 0, 0, 100, 2, 2000, 6000, 10000, 15000, 11, 65080, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'XB-488 Disposalbot - Cast Cut Scrap Metal 10'),
(34273, 0, 2, 0, 0, 0, 100, 4, 2000, 6000, 10000, 15000, 11, 65104, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'XB-488 Disposalbot - Cast Cut Scrap Metal 25');

-- Parts Recovery Technician
UPDATE `creature_template` SET `spell1` = 65071, `spell2` = 65070, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554432, `AIName` = 'SmartAI' WHERE `entry` = 34267;
UPDATE `creature_template` SET `spell1` = 65071, `spell2` = 65070, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554432 WHERE `entry` = 34268;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34267);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34267);
INSERT INTO `smart_scripts` VALUES
(34267, 0, 0, 0, 0, 0, 100, 0, 8000, 12000, 10000, 15000, 11, 65071, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0,'Parts Recovery Technician - Cast Mechano Kick'),
(34267, 0, 1, 0, 0, 0, 100, 0, 6000, 8000, 20000, 25000, 11, 65070, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Parts Recovery Technician - Cast Defense Matrix');

-- XD-175 Compactobot
UPDATE `creature_template` SET `spell1` = 65073, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34271;
UPDATE `creature_template` SET `spell1` = 65106, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34272;
UPDATE `creature_template` SET `mingold` = 7100, `maxgold` = 7600 WHERE `entry` = 34269;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34271);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34271);
INSERT INTO `smart_scripts` VALUES
(34271, 0, 0, 0, 0, 0, 100, 2, 8000, 12000, 15000, 20000, 11, 65073, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0,'XD-175 Compactobot - Cast Trash Compactor 10'),
(34271, 0, 1, 0, 0, 0, 100, 4, 8000, 12000, 15000, 20000, 11, 65106, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0,'XD-175 Compactobot - Cast Trash Compactor 25');

-- Lightning Charged Iron Dwarf
UPDATE `creature_template` SET `spell1` = 64889, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34199;
UPDATE `creature_template` SET `spell1` = 64975, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34237;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34199);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34199);
INSERT INTO `smart_scripts` VALUES
(34199, 0, 0, 0, 0, 0, 100, 2, 1000, 2000, 10000, 15000, 11, 64889, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Lightning Charged Iron Dwarf - Cast Lightning Charged 10'),
(34199, 0, 1, 0, 0, 0, 100, 4, 1000, 2000, 10000, 15000, 11, 64975, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Lightning Charged Iron Dwarf - Cast Lightning Charged 25');

-- Hardened Iron Golem
UPDATE `creature_template` SET `spell1` = 64877, `spell2` = 64874, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 34190;
UPDATE `creature_template` SET `spell1` = 64877, `spell2` = 64967, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34229;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34190);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34190);
INSERT INTO `smart_scripts` VALUES
(34190, 0, 0, 0, 0, 0, 100, 0, 4000, 8000, 25000, 30000, 11, 64877, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Hardened Iron Golem - Cast Harden Fists'),
(34190, 0, 1, 0, 0, 0, 100, 2, 5000, 7000, 20000, 30000, 11, 64874, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Hardened Iron Golem - Cast Rune Punch 10'),
(34190, 0, 2, 0, 0, 0, 100, 4, 5000, 7000, 20000, 30000, 11, 64967, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Hardened Iron Golem - Cast Rune Punch 25');

-- Iron Mender
UPDATE `creature_template` SET `spell1` = 64918, `spell2` = 64903, `spell3` = 64897, `mechanic_immune_mask` = 33554496, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34198;
UPDATE `creature_template` SET `spell1` = 64971, `spell2` = 64970, `spell3` = 64968, `mechanic_immune_mask` = 33554496, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34236;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34198);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34198);
INSERT INTO `smart_scripts` VALUES
(34198, 0, 0, 0, 0, 0, 100, 2, 2000, 4000, 4000, 6000, 11, 64918, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Iron Mender - Cast Electro Shock 10'),
(34198, 0, 1, 0, 0, 0, 100, 4, 2000, 4000, 4000, 6000, 11, 64971, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Iron Mender - Cast Electro Shock 25'),
(34198, 0, 2, 0, 0, 0, 100, 2, 3000, 6000, 10000, 15000, 11, 64903, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Iron Mender - Cast Fuse Lightning 10'),
(34198, 0, 3, 0, 0, 0, 100, 4, 3000, 6000, 10000, 15000, 11, 64970, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Iron Mender - Cast Fuse Lightning 25'),
(34198, 0, 4, 0, 0, 0, 100, 2, 10000, 25000, 30000, 45000, 11, 64897, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Iron Mender - Cast Fuse Metal 10'),
(34198, 0, 5, 0, 0, 0, 100, 4, 10000, 25000, 30000, 45000, 11, 64968, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Iron Mender - Cast Fuse Metal 25');

-- Rune Etched Sentry
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `mechanic_immune_mask` = 33554496, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34196;
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `mechanic_immune_mask` = 33554496, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34245;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34196);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34196);
INSERT INTO `smart_scripts` VALUES
(34196, 0, 0, 0, 0, 0, 100, 0, 2000, 2000, 10000, 10000, 11, 64852, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Rune Etched Sentry - Cast Flaming Rune'),
(34196, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 5000, 7000, 11, 64870, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Rune Etched Sentry - Cast Lava Burst'),
(34196, 0, 2, 0, 0, 0, 100, 0, 2500, 3000, 12000, 15000, 11, 64847, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Rune Etched Sentry - Cast Runed Flame Jets');

-- Chamber Overseer
UPDATE `creature_template` SET `spell1` = 64820, `spell2` = 64825, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 34197;
UPDATE `creature_template` SET `spell1` = 64943, `spell2` = 64944, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34226;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34197);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34197);
INSERT INTO `smart_scripts` VALUES
(34197, 0, 0, 0, 0, 0, 100, 2, 4000, 8000, 6000, 8000, 11, 64820, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Chamber Overseer - Cast Devastating Leap 10'),
(34197, 0, 1, 0, 0, 0, 100, 4, 4000, 8000, 6000, 8000, 11, 64943, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Chamber Overseer - Cast Devastating Leap 25'),
(34197, 0, 2, 0, 0, 0, 100, 2, 10000, 12000, 8000, 12000, 11, 64825, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Chamber Overseer - Cast Staggering Roar 10'),
(34197, 0, 3, 0, 0, 0, 100, 4, 10000, 12000, 8000, 12000, 11, 64944, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Chamber Overseer - Cast Staggering Roar 25');

-- Storm Tempered Keeper
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` IN (33722, 33699);
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` IN (33723, 33700);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (33722, 33699);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (33722, 33699);
INSERT INTO `smart_scripts` VALUES
(33722, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 75, 63630, 33699, 0, 0, 0, 0, 11, 33699, 50, 0, 0, 0, 0, 0,'Storm Tempered Keeper - Cast Vengeful Surge on death'),
(33722, 0, 1, 0, 0, 0, 100, 0, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Storm Tempered Keeper - Cast Forked Lightning'),
(33722, 0, 2, 0, 0, 0, 100, 0, 3000, 3000, 3000, 3000, 11, 63539, 0, 0, 0, 0, 0, 9, 33699, 15, 50, 0, 0, 0, 0,'Storm Tempered Keeper - Cast Separation Anxiety if separated'),
(33699, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 75, 63630, 33722, 0, 0, 0, 0, 11, 33722, 50, 0, 0, 0, 0, 0,'Storm Tempered Keeper - Cast Vengeful Surge on death'),
(33699, 0, 1, 0, 0, 0, 100, 0, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Storm Tempered Keeper - Cast Forked Lightning'),
(33699, 0, 2, 0, 0, 0, 100, 0, 3000, 3000, 3000, 3000, 11, 63539, 0, 0, 0, 0, 0, 9, 33722, 15, 50, 0, 0, 0, 0,'Storm Tempered Keeper - Cast Separation Anxiety if separated');

-- Champion of Hodir
UPDATE `creature_template` SET `spell1` = 64639, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34133;
UPDATE `creature_template` SET `spell1` = 64652, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34139;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34133);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34133);
INSERT INTO `smart_scripts` VALUES
(34133, 0, 0, 0, 0, 0, 100, 2, 3000, 6000, 12000, 16000, 11, 64639, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Champion of Hodir - Cast Stomp 10'),
(34133, 0, 1, 0, 0, 0, 100, 4, 3000, 6000, 12000, 16000, 11, 64652, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Champion of Hodir - Cast Stomp 25');

-- Winter Jormungar
UPDATE `creature_template` SET `spell1` = 64638, `AIName` = 'SmartAI' WHERE `entry` = 34137;
UPDATE `creature_template` SET `spell1` = 64638 WHERE `entry` = 34140;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34137);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34137);
INSERT INTO `smart_scripts` VALUES
(34137, 0, 0, 0, 0, 0, 100, 0, 3000, 6000, 6000, 9000, 11, 64638, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Winter Jormungar - Cast Acidic Bite');

-- Winter Revenant
UPDATE `creature_template` SET `spell1` = 64642, `spell2` = 64643, `spell3` = 64644, `mechanic_immune_mask` = 33554496, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34134;
UPDATE `creature_template` SET `spell1` = 64653, `spell2` = 64643, `spell3` = 64644, `mechanic_immune_mask` = 33554496, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34141;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34134);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34134);
INSERT INTO `smart_scripts` VALUES
(34134, 0, 0, 0, 0, 0, 100, 2, 8000, 12000, 15000, 20000, 11, 64642, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Winter Revenant - Cast Blizzard 10'),
(34134, 0, 1, 0, 0, 0, 100, 4, 8000, 12000, 15000, 20000, 11, 64653, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Winter Revenant - Cast Blizzard 25'),
(34134, 0, 2, 0, 0, 0, 100, 0, 3000, 5000, 10000, 12000, 11, 64643, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Winter Revenant - Cast Whirling Strike'),
(34134, 0, 3, 0, 0, 0, 100, 0, 15000, 20000, 60000, 75000, 11, 64644, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Winter Revenant - Cast Shield of the Winter Revenant');

-- Winter Rumbler
UPDATE `creature_template` SET `spell1` = 64645, `spell2` = 64647, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 34135;
UPDATE `creature_template` SET `spell1` = 64645, `spell2` = 64654, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34142;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34135);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34135);
INSERT INTO `smart_scripts` VALUES
(34135, 0, 0, 0, 0, 0, 100, 0, 6000, 12000, 10000, 16000, 11, 64645, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Winter Rumbler - Cast Cone of Cold'),
(34135, 0, 1, 0, 0, 0, 100, 2, 3000, 6000, 8000, 12000, 11, 64647, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Winter Rumbler - Cast Snow Blindness 10'),
(34135, 0, 2, 0, 0, 0, 100, 4, 3000, 6000, 8000, 12000, 11, 64654, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Winter Rumbler - Cast Snow Blindness 25');

-- Guardian Lasher
UPDATE `creature_template` SET `spell1` = 63007, `spell2` = 63047, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 33430;
UPDATE `creature_template` SET `spell1` = 63007, `spell2` = 63550, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 33732;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33430);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33430);
INSERT INTO `smart_scripts` VALUES
(33430, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 75, 63007, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Guardian Lasher - Cast Guardian Pheromones on aggro'),
(33430, 0, 1, 0, 0, 0, 100, 2, 3000, 6000, 8000, 12000, 11, 63047, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Guardian Lasher - Cast Guardian''s Lash 10'),
(33430, 0, 2, 0, 0, 0, 100, 4, 3000, 6000, 8000, 12000, 11, 63550, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Guardian Lasher - Cast Guardian''s Lash 25');

-- Forest Swarmer
UPDATE `creature_template` SET `spell1` = 63059, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33431;
UPDATE `creature_template` SET `spell1` = 63059, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33731;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33431);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33431);
INSERT INTO `smart_scripts` VALUES
(33431, 0, 0, 0, 0, 0, 100, 0, 3000, 9000, 10000, 20000, 11, 63059, 0, 0, 0, 0, 0, 11, 33430, 40, 0, 0, 0, 0, 0,'Forest Swarmer - Cast Pollinate');
DELETE FROM conditions WHERE SourceEntry = 63059;

-- Guardian of Life
UPDATE `creature_template` SET `spell1` = 63226, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33528;
UPDATE `creature_template` SET `spell1` = 63551, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33733;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33528);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33528);
INSERT INTO `smart_scripts` VALUES
(33528, 0, 0, 0, 0, 0, 100, 2, 3000, 9000, 15000, 20000, 11, 63226, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Guardian of Life - Cast Poison Breath 10'),
(33528, 0, 1, 0, 0, 0, 100, 4, 3000, 9000, 15000, 20000, 11, 63551, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Guardian of Life - Cast Poison Breath 25');

-- Nature's Blade
UPDATE `creature_template` SET `spell1` = 63247, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33527;
UPDATE `creature_template` SET `spell1` = 63568, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33741;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33527);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33527);
INSERT INTO `smart_scripts` VALUES
(33527, 0, 0, 0, 0, 0, 100, 2, 3000, 9000, 18000, 24000, 11, 63247, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Nature Blade - Cast Living Tsunami 10'),
(33527, 0, 1, 0, 0, 0, 100, 4, 3000, 9000, 18000, 24000, 11, 63568, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Nature Blade - Cast Living Tsunami 25');

-- Ironroot Lasher
UPDATE `creature_template` SET `spell1` = 63240, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33526;
UPDATE `creature_template` SET `spell1` = 63553, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33734;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33526);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33526);
INSERT INTO `smart_scripts` VALUES
(33526, 0, 0, 0, 0, 0, 100, 2, 3000, 8000, 12000, 16000, 11, 63240, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Ironroot Lasher - Cast Ironroot Thorns 10'),
(33526, 0, 1, 0, 0, 0, 100, 4, 3000, 8000, 12000, 16000, 11, 63553, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Ironroot Lasher - Cast Ironroot Thorns 25');

-- Mangrove Ent
UPDATE `creature_template` SET `spell1` = 63272, `spell2` = 63242, `spell3` = 63241, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33525;
UPDATE `creature_template` SET `spell1` = 63272, `spell2` = 63556, `spell3` = 63554, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33735;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33525);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33525);
INSERT INTO `smart_scripts` VALUES
(33525, 0, 0, 0, 0, 0, 100, 0, 8000, 12000, 16000, 20000, 11, 63272, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Mangrove Ent - Cast Hurricane'),
(33525, 0, 1, 0, 0, 0, 100, 2, 4000, 6000, 12000, 16000, 11, 63242, 0, 0, 0, 0, 0, 11, 0, 30, 0, 0, 0, 0, 0,'Mangrove Ent - Cast Nourish 10'),
(33525, 0, 2, 0, 0, 0, 100, 4, 4000, 6000, 12000, 16000, 11, 63556, 0, 0, 0, 0, 0, 11, 0, 30, 0, 0, 0, 0, 0,'Mangrove Ent - Cast Nourish 25'),
(33525, 0, 3, 0, 0, 0, 100, 2, 20000, 25000, 20000, 25000, 11, 63241, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Mangrove Ent - Cast Tranquility 10'),
(33525, 0, 4, 0, 0, 0, 100, 4, 20000, 25000, 20000, 25000, 11, 63554, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Mangrove Ent - Cast Tranquility 25');

-- Misguided Nymph
UPDATE `creature_template` SET `spell1` = 63082, `spell2` = 63111, `spell3` = 63136, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33355;
UPDATE `creature_template` SET `spell1` = 63559, `spell2` = 63562, `spell3` = 63564, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33737;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33355);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33355);
INSERT INTO `smart_scripts` VALUES
(33355, 0, 0, 0, 0, 0, 100, 2, 8000, 12000, 16000, 20000, 11, 63082, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Misguided Nymph - Cast Bind Life 10'),
(33355, 0, 1, 0, 0, 0, 100, 4, 8000, 12000, 16000, 20000, 11, 63559, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Misguided Nymph - Cast Bind Life 25'),
(33355, 0, 2, 0, 0, 0, 100, 2, 4000, 6000, 12000, 16000, 11, 63111, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Misguided Nymph - Cast Frost Spear 10'),
(33355, 0, 3, 0, 0, 0, 100, 4, 4000, 6000, 12000, 16000, 11, 63562, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Misguided Nymph - Cast Frost Spear 25'),
(33355, 0, 4, 0, 0, 0, 100, 2, 15000, 20000, 15000, 20000, 11, 63136, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Misguided Nymph - Cast Winter''s Embrace 10'),
(33355, 0, 5, 0, 0, 0, 100, 4, 15000, 20000, 15000, 20000, 11, 63564, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Misguided Nymph - Cast Winter''s Embrace 25');

-- Corrupted Servitor
UPDATE `creature_template` SET `spell1` = 63169, `spell2` = 63149, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 33354;
UPDATE `creature_template` SET `spell1` = 63549, `spell2` = 63149, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 33729;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33354);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33354);
INSERT INTO `smart_scripts` VALUES
(33354, 0, 0, 0, 0, 0, 100, 2, 2000, 4000, 16000, 20000, 11, 63169, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Corrupted Servitor - Cast Petrify Joints 10'),
(33354, 0, 1, 0, 0, 0, 100, 4, 2000, 4000, 16000, 20000, 11, 63549, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Corrupted Servitor - Cast Petrify Joints 25'),
(33354, 0, 2, 0, 0, 0, 100, 0, 6000, 8000, 12000, 16000, 11, 63149, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Corrupted Servitor - Cast Violent Earth');

-- Arachnopod Destroyer
UPDATE `creature_template` SET `spell1` = 64717, `spell2` = 64776, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 34183;
UPDATE `creature_template` SET `spell1` = 64717, `spell2` = 64776, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34214;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34183);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34183);
INSERT INTO `smart_scripts` VALUES
(34183, 0, 0, 0, 0, 0, 100, 0, 2000, 4000, 12000, 16000, 11, 64717, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Arachnopod Destroyer - Cast Flame Spray'),
(34183, 0, 1, 0, 0, 0, 100, 0, 8000, 10000, 12000, 16000, 11, 64776, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Arachnopod Destroyer - Cast Machine Gun');

-- Boomer XP-500
UPDATE `creature_template` SET `spell1` = 55714, `AIName` = 'SmartAI' WHERE `entry` = 34192;
UPDATE `creature_template` SET `spell1` = 55714 WHERE `entry` = 34216;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34192);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34192);
INSERT INTO `smart_scripts` VALUES
(34192, 0, 0, 0, 9, 0, 100, 0, 0, 2, 1000, 1000, 11, 55714, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Boomer XP-500 - Explode');

-- Clockwork Sapper
UPDATE `creature_template` SET `spell1` = 64740, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 34193;
UPDATE `creature_template` SET `spell1` = 64740, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34220;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 34193);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 34193);
INSERT INTO `smart_scripts` VALUES
(34193, 0, 0, 0, 0, 0, 100, 0, 2000, 6000, 12000, 16000, 11, 64740, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Clockwork Sapper - Cast Energy Sap');

-- Twilight Adherent
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63760, `spell3` = 13704, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33818;
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63760, `spell3` = 13704, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33827;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33818);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33818);
INSERT INTO `smart_scripts` VALUES
(33818, 0, 0, 0, 0, 0, 100, 0, 10000, 16000, 16000, 20000, 11, 64663, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Adherent - Cast Arcane Burst'),
(33818, 0, 1, 0, 0, 0, 100, 0, 8000, 10000, 16000, 20000, 11, 63760, 0, 0, 0, 0, 0, 11, 0, 30, 0, 0, 0, 0, 0,'Twilight Adherent - Cast Greater Heal'),
(33818, 0, 2, 0, 0, 0, 100, 0, 2000, 4000, 15000, 18000, 11, 13704, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Adherent - Cast Psychic Scream');

-- Twilight Guardian
UPDATE `creature_template` SET `spell1` = 52719, `spell2` = 62317, `spell3` = 63757, `mechanic_immune_mask` = 33554513, `equipment_id` = 1852, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33822;
UPDATE `creature_template` SET `spell1` = 52719, `spell2` = 62317, `spell3` = 63757, `mechanic_immune_mask` = 33554513, `equipment_id` = 1852, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33828;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33822);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33822);
INSERT INTO `smart_scripts` VALUES
(33822, 0, 0, 0, 0, 0, 100, 0, 6000, 10000, 8000, 10000, 11, 52719, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Twilight Guardian - Cast Concussion Blow'),
(33822, 0, 1, 0, 0, 0, 100, 0, 2000, 3000, 3000, 6000, 11, 62317, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Twilight Guardian - Cast Devastate'),
(33822, 0, 2, 0, 0, 0, 100, 0, 8000, 10000, 14000, 16000, 11, 63757, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Guardian - Cast Thunderclap');

-- Twilight Shadowblade
UPDATE `creature_template` SET `spell1` = 63753, `mechanic_immune_mask` = 33554513, `equipment_id` = 1862, `baseattacktime` = 1000, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33824;
UPDATE `creature_template` SET `spell1` = 63753, `mechanic_immune_mask` = 33554513, `equipment_id` = 1862, `baseattacktime` = 1000, `mingold` = 7100, `maxgold` = 7600 WHERE `entry` = 33831;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33824);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33824);
INSERT INTO `smart_scripts` VALUES
(33824, 0, 0, 0, 0, 0, 100, 0, 6000, 8000, 12000, 16000, 11, 63753, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Shadowblade - Cast Fan of Knives');

-- Twilight Slayer
UPDATE `creature_template` SET `spell1` = 63784, `spell2` = 35054, `mechanic_immune_mask` = 33554513, `equipment_id` = 1847, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33823;
UPDATE `creature_template` SET `spell1` = 63784, `spell2` = 35054, `mechanic_immune_mask` = 33554513, `equipment_id` = 1847, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33832;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33823);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33823);
INSERT INTO `smart_scripts` VALUES
(33823, 0, 0, 0, 0, 0, 100, 0, 3000, 6000, 12000, 16000, 11, 35054, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Twilight Slayer - Cast Mortal Strike'),
(33823, 0, 1, 0, 0, 0, 100, 0, 8000, 12000, 20000, 25000, 11, 63784, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Slayer - Cast Bladestorm');

UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 32908;

-- Faceless Horror
UPDATE `creature_template` SET `spell1` = 64429, `spell2` = 63722, `spell3` = 63710, `spell4` = 63703, `mechanic_immune_mask` = 33554513, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33772;
UPDATE `creature_template` SET `spell1` = 64429, `spell2` = 63722, `spell3` = 63710, `spell4` = 63703, `mechanic_immune_mask` = 33554513, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33773;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33772);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33772);
INSERT INTO `smart_scripts` VALUES
(33772, 0, 0, 0, 0, 0, 100, 0, 18000, 20000, 16000, 20000, 11, 64429, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0,'Faceless Horror - Cast Death Grip'),
(33772, 0, 1, 0, 0, 0, 100, 0, 2000, 4000, 10000, 12000, 11, 63722, 0, 0, 0, 0, 0, 17, 10, 40, 0, 0, 0, 0, 0,'Faceless Horror - Cast Shadow Crash'),
(33772, 0, 2, 0, 4, 0, 100, 0, 0, 0, 0, 0, 75, 63703, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Faceless Horror - add aura Void Wave on aggro');

-- Twilight Frost Mage
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63758, `spell3` = 63912, `spell4` = 63913, `equipment_id` = 1849, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33819;
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63758, `spell3` = 63912, `spell4` = 63913, `equipment_id` = 1849, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33829;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33819);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33819);
INSERT INTO `smart_scripts` VALUES
(33819, 0, 0, 0, 0, 0, 100, 0, 10000, 16000, 16000, 20000, 11, 64663, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Frost Mage - Cast Arcane Burst'),
(33819, 0, 1, 0, 0, 0, 100, 0, 1000, 2000, 6000, 8000, 11, 63913, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Twilight Frost Mage - Cast Frostbolt'),
(33819, 0, 2, 0, 0, 0, 100, 0, 2000, 4000, 10000, 16000, 11, 63758, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Frost Mage - Cast Frost Bolt Volley'),
(33819, 0, 3, 0, 0, 0, 100, 0, 8000, 10000, 12000, 16000, 11, 63912, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Frost Mage - Cast Frost Nova');

-- Twilight Pyromancer
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63789, `spell3` = 63775, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33820;
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63789, `spell3` = 63775, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33830;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33820);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33820);
INSERT INTO `smart_scripts` VALUES
(33820, 0, 0, 0, 0, 0, 100, 0, 10000, 16000, 16000, 20000, 11, 64663, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Pyromancer - Cast Arcane Burst'),
(33820, 0, 1, 0, 0, 0, 100, 0, 1000, 2000, 6000, 8000, 11, 63789, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Twilight Pyromancer - Cast Fireball'),
(33820, 0, 2, 0, 0, 0, 100, 0, 2000, 4000, 10000, 16000, 11, 63775, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Twilight Pyromancer - Cast Flamestrike');

-- Enslaved Fire Elemental
UPDATE `creature_template` SET `spell1` = 38064, `spell2` = 63778, `mechanic_immune_mask` = 33554513, `AIName` = 'SmartAI' WHERE `entry` = 33838;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = 33838);
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33838);
INSERT INTO `smart_scripts` VALUES
(33838, 0, 0, 0, 0, 0, 100, 0, 4000, 8000, 10000, 14000, 11, 38064, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Enslaved Fire Elemental - Cast Blast Wave'),
(33838, 0, 1, 0, 4, 0, 100, 0, 0, 0, 0, 0, 75, 63778, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Enslaved Fire Elemental - Cast Fire Shield on aggro');

-- Boom Bot
UPDATE `creature_template` SET `spell1` = 63801, `AIName` = 'SmartAI' WHERE `entry` = 33836;
UPDATE `creature_template` SET `spell1` = 63801 WHERE `entry` = 34218;
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33836);
INSERT INTO `smart_scripts` VALUES
(33836, 0, 0, 0, 9, 0, 100, 0, 0, 2, 1000, 1000, 11, 63801, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Boom Bot - Explode');

-- Rubble
UPDATE `creature_template` SET `spell1` = 38064, `AIName` = 'SmartAI' WHERE `entry` = 33768;
UPDATE `creature_template` SET `spell1` = 63978 WHERE `entry` = 33908;
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33768);
INSERT INTO `smart_scripts` VALUES
(33768, 0, 0, 0, 0, 0, 100, 2, 4000, 8000, 10000, 12000, 11, 38064, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Rubble - Cast Stone Nova 10'),
(33768, 0, 1, 0, 0, 0, 100, 4, 4000, 8000, 10000, 12000, 11, 63978, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Rubble - Cast Stone Nova 25');

-- Boom Bot
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 33836);
INSERT INTO `smart_scripts` VALUES
(33836, 0, 0, 1, 9, 0, 100, 1, 0, 2, 0, 0, 11, 63801, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Boom Bot - Explode'),
(33836, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Boom Bot - despawn');
-- -------------------------------------------------------------------------
-- ----------------------------- Halls Of Stone ----------------------------
-- -------------------------------------------------------------------------
-- Make looteable when event finish.
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` IN (190586,193996);
-- Respawn each 24h
UPDATE `gameobject` SET `spawntimesecs` = 86400 WHERE `id` IN (190586,193996);

-- Ignore faction and aggroof "Channel Target" http://www.wowhead.com/npc=28055
UPDATE `creature_template` SET `flags_extra` = `flags_extra`|2 , `unit_flags` = `unit_flags`|2 WHERE `entry` = 28055;

-- Flags_extra for tribunal npcs.
UPDATE `creature_template` SET `flags_extra` = `flags_extra`|2|128 , `InhabitType` = 4 WHERE `entry` IN (28234,28235,28237,28265,30897,30898,30899,31874,31875,31878);

-- kleines model für dunkle materie
UPDATE `creature_template` SET `modelid1` = 17200, `modelid2` = 17200 WHERE `entry` IN (28235,31874);

-- Dark Matter http://www.wowhead.com/npc=28235
UPDATE `creature` SET `spawnMask` = 0 WHERE `guid` = 123473;

-- Inmunidad for all bosses
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (27975,27977,27978,31384,31381,31386);

-- Door for last boss Sjonnir The Ironshaper need to be open by Brann Bronzebeard http://www.wowhead.com/npc=28070 after event finish and not for players.
UPDATE gameobject_template SET flags=flags|0x1 WHERE entry=191296;

-- Scriptnamen for Dark Matter http://www.wowhead.com/npc=28235 and Searing Gaze http://www.wowhead.com/npc=28265
UPDATE `creature_template` SET `ScriptName` = 'mob_dark_matter' WHERE `entry` = 28235;
UPDATE `creature_template` SET `ScriptName` = 'mob_searing_gaze' WHERE `entry` = 28265;

-- Spells
UPDATE `creature_template` SET `spell1` = 22120, `spell2` = 42724 WHERE `entry` = 27983;
UPDATE `creature_template` SET `spell1` = 22120, `spell2` = 42724 WHERE `entry` = 31876; --
UPDATE `creature_template` SET `spell1` = 12167, `spell2` = 15654 WHERE `entry` = 27984;
UPDATE `creature_template` SET `spell1` = 59863, `spell2` = 59864 WHERE `entry` = 31877; --
UPDATE `creature_template` SET `spell1` = 33661, `spell2` = 12734 WHERE `entry` = 27985;
UPDATE `creature_template` SET `spell1` = 33661, `spell2` = 59865 WHERE `entry` = 31380; --

-- http://www.wowhead.com/npc=27979
-- http://www.wowhead.com/npc=27982
-- http://www.wowhead.com/npc=27983
-- http://www.wowhead.com/npc=27984
-- http://www.wowhead.com/npc=27985
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` IN (27979,27982,27983,27984,27985);
-- Hero mode
-- http://www.wowhead.com/npc=27983
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 31876;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(3187601, 31876, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 22120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spell'),
(3187602, 31876, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 42724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spell');
-- http://www.wowhead.com/npc=27984
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 31877;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(3187701, 31877, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 59863, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spell'),
(3187702, 31877, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 59864, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spell');
-- http://www.wowhead.com/npc=27985
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 31380;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(3138001, 31380, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 33661, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spell'),
(3138002, 31380, 0, 0, 100, 5, 1000, 3000, 3000, 6000, 11, 59865, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spell');

UPDATE `gameobject_template` SET flags=flags|0x1 WHERE entry=191296;
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = 53561;
-- -------------------------------------------------------------------------
-- ------------------------- Halls Of Lightning ----------------------------
-- -------------------------------------------------------------------------
-- Update Molten Golem faction so they attack.
UPDATE `creature_template` SET faction_A:=16, faction_H:=16 WHERE `entry` IN (28695,30969);
-- Update Brittle Golem faction and flags
UPDATE `creature_template` SET faction_A:=16, faction_H:=16, unit_flags:=262146 WHERE `entry` = 28681;
-- Update Volkhan Anvil beacuse a script is no longer needed
UPDATE `creature_template` SET `ScriptName` ='' WHERE `entry` = 28823;
-- Update Spark of Ionar to correct faction so they attack players
UPDATE `creature_template` SET faction_A:=14, faction_H:=14 WHERE `entry` IN (28926,31867);
-- -------------------------------------------------------------------------
-- -------------------------- Obsidian Sanctum -----------------------------
-- -------------------------------------------------------------------------
/*-- Twilight Welp
UPDATE `creature_template` SET `minlevel` = 81 , `maxlevel` = 81, `Health_mod` = 12 WHERE `entry` = 31214;
UPDATE `creature_template` SET `Health_mod` = 29 WHERE `entry` = 31548;
-- Twilight Egg
UPDATE `creature_template` SET `minlevel` = 80 , `maxlevel` = 80, `Health_mod` = 5 WHERE `entry` IN (30882,31204);
UPDATE `creature_template` SET `Health_mod` = 15 WHERE `entry` IN (31539,31547);
UPDATE `creature_template` SET `ScriptName` = 'mob_twilight_eggs' WHERE `entry` = 31204;
-- Delete Portals
DELETE FROM `gameobject` WHERE `id` = 193988;
-- Delete Trigger
DELETE FROM `creature` WHERE `id` = 31138;
-- Add Script to Portal
UPDATE `gameobject_template` SET ScriptName = 'go_twilight_portal' WHERE `entry` = 193988;
-- Fix some Immunitys
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (30451,31520);*/
-- -------------------------------------------------------------------------
-- ----------------------------- Ruby Sanctum ------------------------------
-- -------------------------------------------------------------------------
-- Baltharus
UPDATE `creature_template` SET `ScriptName` = 'boss_baltharus', `AIName` ='', `dmg_multiplier` = 80 WHERE `entry` = 39751;
UPDATE `creature_template` SET `ScriptName` = 'mob_baltharus_clone', `AIName` ='', `dmg_multiplier` = 80 WHERE `entry` = 39899;
-- Zarithrian
UPDATE `creature_template` SET `ScriptName` = 'boss_zarithrian', `AIName` ='' WHERE `entry` = 39746;
UPDATE `creature` SET `position_x` = '3008.552734',`position_y` = '530.471680',`position_z` = '89.195290',`orientation` = '6.16' WHERE `id` = 39746;
UPDATE `creature_template` SET `ScriptName` = 'mob_flamecaller_ruby', `AIName` ='' WHERE `entry` = 39814;
-- Saviana Ragefire
UPDATE `creature_template` SET `ScriptName` = 'boss_ragefire', `AIName` ='' WHERE `entry` = 39747;
DELETE FROM `conditions` WHERE `SourceEntry` = 74455;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,74455,0,18,1,39747,0,0, '', 'Ragefire - Conflagration');
-- Xerestrasza
UPDATE `creature_template` SET `ScriptName` = 'mob_xerestrasza', `AIName` ='' WHERE `entry` = 40429;
-- Halion
UPDATE `creature_template` SET `ScriptName` = 'boss_halion_real', `AIName` ='' WHERE `entry` = 39863;
UPDATE `creature_template` SET `ScriptName` = 'boss_halion_twilight', `AIName` ='' WHERE `entry` = 40142;
UPDATE `creature_template` SET `ScriptName` = 'mob_halion_meteor', `AIName` ='' WHERE `entry` = 40029;
UPDATE `creature_template` SET `ScriptName` = 'mob_halion_flame', `AIName` ='' WHERE `entry` IN (40041);
UPDATE `creature_template` SET `ScriptName` = 'mob_halion_control', `AIName` ='' WHERE `entry` IN (40146);
UPDATE `creature_template` SET `ScriptName` = 'mob_halion_orb', `AIName` ='' WHERE `entry` IN (40083,40100);
UPDATE `creature_template` SET `ScriptName` = 'mob_orb_rotation_focus', `AIName` ='' WHERE `entry` = 40091;
UPDATE `creature_template` SET `ScriptName` = 'mob_orb_carrier', `AIName` ='' WHERE `entry` = 40081;
UPDATE `creature_template` SET `ScriptName` = 'mob_fiery_combustion', `AIName` ='' WHERE `entry` = 40001;
UPDATE `creature_template` SET `ScriptName` = 'mob_soul_consumption', `AIName` ='' WHERE `entry` = 40135;
UPDATE `creature_template` SET `ScriptName` = '', `AIName` ='' WHERE `entry` IN (40143, 40144, 40145);
-- spell_halion_fiery_combustion 74562
DELETE FROM `spell_script_names` WHERE `spell_id` = 74562 AND `ScriptName` = 'spell_halion_fiery_combustion';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (74562,'spell_halion_fiery_combustion');
-- spell_halion_soul_consumption 74792
DELETE FROM `spell_script_names` WHERE `spell_id` = 74792 AND `ScriptName` = 'spell_halion_soul_consumption';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES (74792,'spell_halion_soul_consumption');
-- spell_twilight_cutter 74768
DELETE FROM `spell_script_names` WHERE `spell_id` = 74768 AND `ScriptName` = 'spell_twilight_cutter_channel';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES (74768,'spell_twilight_cutter_channel');
-- Gameobjects
UPDATE `gameobject_template` SET `data10` = 74807, `faction` = '0', `ScriptName` = 'go_halion_portal_twilight' WHERE `gameobject_template`.`entry` IN (202794,202795);
UPDATE `gameobject_template` SET `faction` = '0', `ScriptName` = 'go_halion_portal_real' WHERE `gameobject_template`.`entry` IN (202796);
-- sound / text
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1666008 AND -1666000;
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1666113 AND -1666100;
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1666204 AND -1666200;
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1666305 AND -1666300;
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1666405 AND -1666400;
-- Xerestrasza
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(40429, '-1666000','Help! I am trapped within this tree! I require aid!','17490','6','0','0','SAY_XERESTRASZA_YELL_1'),
(40429, '-1666001','Thank you! I could have not held out for much longer. A terrible thing has happened here.','17491','0','0','0','SAY_XERESTRASZA_YELL_2'),
(40429, '-1666002','We believed that the Sanctum was well fortified, but we were not prepareted for the nature of this assault.','17492','0','0','0','SAY_XERESTRASZA_SAY_1'),
(40429, '-1666003','The Black Dragonkin materialized from thin air, and SET upon us before we could react.','17493','0','0','0','SAY_XERESTRASZA_SAY_2'),
(40429, '-1666004','We did not stand a chance. As my brethren perished around me, I managed to retreat here and bar the entrance.','17494','0','0','0','SAY_XERESTRASZA_SAY_3'),
(40429, '-1666005','They slaughtered us with cold efficiency, but the true focus of their interest seemed to be the eggs kept here in the sanctum.','17495','0','0','0','SAY_XERESTRASZA_SAY_4'),
(40429, '-1666006','The commander of the forces on the ground here is a cruel brute named Zarithrian. But I fear there are greater powers at work.','17496','0','0','0','SAY_XERESTRASZA_SAY_5'),
(40429, '-1666007','In their initial assault I caught a glimpse of their true leader, a fearsome full-grown Twilight Dragon.','17497','0','0','0','SAY_XERESTRASZA_SAY_6'),
(40429, '-1666008','I know not the extent of their plans heroes, but I know this: they cannot be allowed to succeed!','17498','0','0','0','SAY_XERESTRASZA_SAY_7'),
-- Halion
(39863, '-1666100','Meddlesome insects, you`re too late! The Ruby Sanctum is lost.','17499','6','0','0','SAY_HALION_SPAWN'),
(39863, '-1666101','Your world teeters on the brink of annihilation. You will all bear witness to the coming of a new age of destruction!','17500','6','0','0','SAY_HALION_AGGRO'),
(39863, '-1666102','Another hero falls.','17501','6','0','0','SAY_HALION_SLAY_1'),
(39863, '-1666103','Ha Ha Ha!','17502','6','0','0','SAY_HALION_SLAY_2'),
(39863, '-1666104','Relish this victory mortals, for it will be your last. This world will burn with the Master`s return!','17503','6','0','0','SAY_HALION_DEATH'),
(39863, '-1666105','Not good enough!','17504','6','0','0','SAY_HALION_BERSERK'),
(39863, '-1666106','The heavens burn!','17505','6','0','0','SAY_HALION_SPECIAL_1'),
(39863, '-1666107','Beware the shadow!','17506','6','0','0','SAY_HALION_SPECIAL_2'),
(39863, '-1666108','You will find only suffering within the realm of Twilight. Enter if you dare.','17507','6','0','0','SAY_HALION_PHASE_2'),
(39863, '-1666109','I am the light AND the darkness! Cower mortals before the Herald of Deathwing!','17508','6','0','0','SAY_HALION_PHASE_3'),
(39863, '-1666110','In rotating spheres pulsating with dark energy!','0','3','0','0',''),
(39863, '-1666111','Your allies pushed Halion further into the physical world!','0','3','0','0',''),
(39863, '-1666112','Your allies pushed Halion further into the real world!','0','3','0','0',''),
(39863, '-1666113','Being alone in one of the worlds, Halion restores vitality','0','3','0','0',''),
-- Zarthrian
(39746, '-1666200','Alexstrasza has chosen capable allies. A pity that I must end you!','17512','6','0','0','SAY_ZARITHRIAN_AGGRO'),
(39746, '-1666201','You thought you stood a chance?','17513','6','0','0','SAY_ZARITHRIAN_SLAY_1'),
(39746, '-1666202','It`s for the best.','17514','6','0','0','SAY_ZARITHRIAN_SLAY_2'),
(39746, '-1666203','Halion! I`m...aah!','17515','6','0','0','SAY_ZARITHRIAN_DEATH'),
(39746, '-1666204','Turn them to ash, minions!','17516','6','0','0','SAY_ZARITHRIAN_SPECIAL_1'),
-- baltharus
(39751, '-1666300','Ah, the entertainment has arrived...','17520','6','0','0','SAY_BALTHARUS_AGGRO'),
(39751, '-1666301','Baltharus leaves no survivors!','17521','6','0','0','SAY_BALTHARUS_SLAY_1'),
(39751, '-1666302','This world has enough heroes!','17522','6','0','0','SAY_BALTHARUS_SLAY_2'),
(39751, '-1666303','I...didn`t see that coming...','17523','1','0','0','SAY_BALTHARUS_DEATH'),
(39751, '-1666304','Twice the pain and half the fun!','17524','6','0','0','SAY_BALTHARUS_SPECIAL_1'),
(39751, '-1666305','Your power wanes, ancient one! Soon, you will join your friends!','17525','6','0','0','SAY_BALTHARUS_YELL'),
-- Saviana
(39747, '-1666400','You will suffer for this intrusion...','17528','6','0','0','SAY_SAVIANA_AGGRO'),
(39747, '-1666401','As it should be!','17529','6','0','0','SAY_SAVIANA_SLAY_1'),
(39747, '-1666402','Halion will be pleased...','17530','6','0','0','SAY_SAVIANA_SLAY_2'),
(39747, '-1666403','<screaming>','17531','6','0','0','SAY_SAVIANA_DEATH'),
(39747, '-1666404','Burn in the master`s flame!','17532','6','0','0','SAY_SAVIANA_SPECIAL_1'),
(39747, '-1666405','RAGE!!!','0','3','0','0','');
-- spell_twilight_cutter 74769
DELETE FROM `spell_script_names` WHERE `spell_id` = 74769 AND `ScriptName` = 'spell_twilight_cutter';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (74769,'spell_twilight_cutter');
-- Instance Map
UPDATE `instance_template` SET `Script` = 'instance_ruby_sanctum' WHERE `map` = 724;
-- -------------------------------------------------------------------------
-- ---------------------------- Eye of Eternity ----------------------------
-- -------------------------------------------------------------------------
-- CONTAIN ALL NEEDED DATA INTO FULL BD DUMP!
-- -------------------------------------------------------------------------
-- --------------------------------- Nexus ---------------------------------
-- -------------------------------------------------------------------------
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN ('26796','26798', '26801', '26802', '26803', '26805');

-- Update their templates
UPDATE `creature_template` SET `ScriptName` = 'boss_commander_kolurg', AIName = '' WHERE `entry` = '26798';
UPDATE `creature_template` SET `ScriptName` = 'mob_horde_cleric', AIName = '' WHERE `entry` = '26803';
UPDATE `creature_template` SET `ScriptName` = 'mob_horde_ranger', AIName = '' WHERE `entry` = '26801';
UPDATE `creature_template` SET `ScriptName` = 'mob_horde_berserker', AIName = '' WHERE `entry` = '26799';
UPDATE `creature_template` SET `ScriptName` = 'boss_commander_stoutbeard', AIName = '' WHERE `entry` = '26796';
UPDATE `creature_template` SET `ScriptName` = 'mob_alliance_cleric', AIName = '' WHERE `entry` = '26805';
UPDATE `creature_template` SET `ScriptName` = 'mob_alliance_ranger', AIName = '' WHERE `entry` = '26802';
UPDATE `creature_template` SET `ScriptName` = 'mob_alliance_berserker', AIName = '' WHERE `entry` = '26800';
UPDATE `creature_template` SET `AIName` = '', ScriptName = 'boss_magus_telestra_arcane' WHERE `entry` = '26929';

DELETE FROM `spell_script_names` WHERE `spell_id`=47731;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(47731, 'spell_nexus_critter_targeting');

-- Yells
DELETE FROM `script_texts` WHERE `entry` IN ('-1576021', '-1576022', '-1576023', '-1576024', '-1576025', '-1576026');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES
('20885', '-1576021', 'What? Where in the...don''t just stand around, lads! Kill somebody!', null, null, null, null, null, null, null, null, '13193', '1', '0', '0', 'Commander Stoutbeard - Aggro'),
('20885', '-1576022', 'Now we''re gettin'' somewhere!', null, null, null, null, null, null, null, null, '13195', '1', '0', '0', 'Commander Stoutbeard - Kill'),
('20885', '-1576023', 'Is that all you...got...', null, null, null, null, null, null, null, null, '13194', '1', '0', '0', 'Commander Stoutbeard - Death'),
('20885', '-1576024', 'What is this? Mok-thorin ka! Kill them!', null, null, null, null, null, null, null, null, '13458', '1', '0', '0', 'Commander Kolurg - Aggro'),
('20885', '-1576025', 'Our task is not yet done!', null, null, null, null, null, null, null, null, '13459', '1', '0', '0', 'Commander Kolurg - Kill'),
('20885', '-1576026', 'Gaagh...', null, null, null, null, null, null, null, null, '13460', '1', '0', '0', 'Commander Kolurg - Death');
-- -------------------------------------------------------------------------
-- -------------------------------- Oculus ---------------------------------
-- -------------------------------------------------------------------------
-- Ruby drake
UPDATE `creature_template` SET spell1 = 50232, spell2 = 50248, spell3 = 50240, spell4 = 50253, spell5 = 53112, VehicleId = 70 WHERE `entry` = 27756;
-- Amber Drake
UPDATE `creature_template` SET spell1 = 49840, spell2 = 49838, spell3 = 49592, spell4 = 0, spell5 = 53112, VehicleId = 70 WHERE `entry` = 27755;
-- Emerald Drake
UPDATE `creature_template` SET spell1 = 50328, spell2 = 50341, spell3 = 50344, spell4 = 0, spell5 = 53112, VehicleId = 70 WHERE `entry` = 27692;
/*
UPDATE `creature_template` SET npcflag=1 WHERE entry IN (27657,27658,27659);
*/

-- Unstable Sphere
UPDATE `creature_template` SET minlevel = 80, maxlevel = 80, mindmg = 422, maxdmg = 586, faction_A = 16, faction_H = 16, attackpower = 642, dmg_multiplier = 1, minrangedmg = 345, maxrangedmg = 509, rangedattackpower = 103 WHERE `entry` = 28166;
/*
-- Scriptnames
-- Zona
UPDATE `instance_template` SET `script` = 'instance_oculus' WHERE `map` = 578;
-- Bosses
UPDATE `creature_template` SET `ScriptName` = 'boss_drakos' WHERE `entry` = 27654;
UPDATE `creature_template` SET `ScriptName` = 'boss_urom' WHERE `entry` = 27655;
UPDATE `creature_template` SET `ScriptName` = 'boss_varos' WHERE `entry` = 27447;
UPDATE `creature_template` SET `ScriptName` = 'boss_eregos' WHERE `entry` = 27656;
-- NPCs
UPDATE `creature_template` SET `ScriptName` = 'npc_unstable_sphere' WHERE `entry` = 28166;
UPDATE `creature_template` SET `ScriptName` = 'npc_oculus_drake' WHERE `entry` IN (27657,27658,27659);
UPDATE `creature_template` SET `ScriptName` = 'mob_centrifige_construct' WHERE `entry` = 27641;
UPDATE `creature_template` SET `ScriptName` = 'npc_planar_anomaly' WHERE `entry` = 30879; -- Planar Anomlay di Eregos

-- Drakos the Interrogator
DELETE FROM `script_texts` WHERE npc_entry='27654';
REPLACE INTO `script_texts` VALUES ('27654', -1578000, 'The prisoners shall not go free. The word of Malygos is law!','', '', '', '', '', '', '', '', 13594,1,0,0, 'drakos SAY_AGGRO');
REPLACE INTO `script_texts` VALUES ('27654', -1578001, 'A fitting punishment!','', '', '', '', '', '', '', '', 13602, 1,0,0, 'drakos SAY_KILL_1');
REPLACE INTO `script_texts` VALUES ('27654', -1578002, 'Sentence: executed!','', '', '', '', '', '', '', '', 13603,1,0,0, 'drakos SAY_KILL_2');
REPLACE INTO `script_texts` VALUES ('27654', -1578003, 'Another casualty of war!','', '', '', '', '', '', '', '', 13604, 1,0,0, 'drakos SAY_KILL_3');
REPLACE INTO `script_texts` VALUES ('27654', -1578004, 'The war... goes on.','', '', '', '', '', '', '', '', 13605,1,0,0, 'drakos SPELL_DEATH');
REPLACE INTO `script_texts` VALUES ('27654', -1578005, 'It is too late to run!','', '', '', '', '', '', '', '', 13598, 1,0,0, 'drakos SAY_PULL_1');
REPLACE INTO `script_texts` VALUES ('27654', -1578006, 'Gather `round! ','', '', '', '', '', '', '', '', 13599, 1,0,0, 'drakos SAY_PULL_2');
REPLACE INTO `script_texts` VALUES ('27654', -1578007, 'None shall escape!','', '', '', '', '', '', '', '', 13600, 1,0,0, 'drakos SAY_PULL_3');
REPLACE INTO `script_texts` VALUES ('27654', -1578008, 'I condemn you to death!','', '', '', '', '', '', '', '', 13601,1,0,0, 'drakos SAY_PULL_4');
REPLACE INTO `script_texts` VALUES ('27654', -1578009, 'Tremble, worms!','', '', '', '', '', '', '', '', 13595,1,0,0, 'drakos SAY_STOMP_1');
REPLACE INTO `script_texts` VALUES ('27654', -1578010, 'I will crush you!', '', '', '', '', '', '', '', '', 13596, 1,0,0, 'drakos SAY_STOMP_2');
REPLACE INTO `script_texts` VALUES ('27654', -1578011, 'Can you fly?', '', '', '', '', '', '', '', '', 13597, 1,0,0, 'drakos SAY_STOMP_3');

-- Mage-Lord Urom
DELETE FROM `script_texts` WHERE npc_entry= '27655';
REPLACE INTO `script_texts` VALUES ('27655', -1578012, 'Poor blind fools!','', '', '', '', '', '', '', '', 13638,1,0,0, 'urom SAY_AGGRO');
REPLACE INTO `script_texts` VALUES ('27655', -1578013, 'If only you understood!','', '', '', '', '', '', '', '', 13641,1,0,0, 'urom SAY_KILL_1');
REPLACE INTO `script_texts` VALUES ('27655', -1578014, 'Now, do you see? DO YOU?!','', '', '', '', '', '', '', '', 13642,1,0,0, 'urom SAY_KILL_2');
REPLACE INTO `script_texts` VALUES ('27655', -1578015, 'Unfortunate, but necessary.','', '', '', '', '', '', '', '', 13643,1,0,0, 'urom SAY_KILL_3');
REPLACE INTO `script_texts` VALUES ('27655', -1578016, 'Everything I`ve done... has been for Azeroth...','', '', '', '', '', '', '', '', 13644,1,0,0, 'urom SAY_DEATH');
REPLACE INTO `script_texts` VALUES ('27655', -1578017, 'A taste... just a small taste... of the Spell-Weaver`s power!','', '', '', '', '', '', '', '', 13639,1,0,0, 'urom SAY_EXPLOSION_1');
REPLACE INTO `script_texts` VALUES ('27655', -1578018, 'So much unstable energy... but worth the risk to destroy you!','', '', '', '', '', '', '', '', 13640,1,0,0, 'urom SAY_EXPLOSION_2');
REPLACE INTO `script_texts` VALUES ('27655', -1578019, 'What do we have here... those would defy the Spell-Weaver? Those without foresight or understanding. How could I make you see? Malygos is saving the world from itself! Bah! You are hardly worth my time!','', '', '', '', '', '', '', '', 13635,1,0,0, 'urom SAY_SUMMON_1');
REPLACE INTO `script_texts` VALUES ('27655', -1578020, 'Clearly my pets failed. Perhaps another demonstration is in order.','', '', '', '', '', '', '', '', 13636,1,0,0, 'urom SAY_SUMMON_2');
REPLACE INTO `script_texts` VALUES ('27655', -1578021, 'Still you fight. Still you cling to misguided principles. If you survive, you`ll find me in the center ring.','', '', '', '', '', '', '', '', 13637,1,0,0, 'urom SAY_SUMMON_3');

-- Varos Cloudstrider
DELETE FROM `script_texts` WHERE npc_entry = '27447';
REPLACE INTO `script_texts` VALUES ('27447', -1578022, 'There will be no mercy!','', '', '', '', '', '', '', '', 13649,1,0,0, 'varos SAY_AGGRO');
REPLACE INTO `script_texts` VALUES ('27447', -1578023, 'You were warned.','', '', '', '', '', '', '', '', 13653,1,0,0, 'varos SAY_KILL_1');
REPLACE INTO `script_texts` VALUES ('27447', -1578024, 'The Oculus is ours.','', '', '', '', '', '', '', '', 13654,1,0,0, 'varos SAY_KILL_2');
REPLACE INTO `script_texts` VALUES ('27447', -1578025, 'They are... too strong! Underestimated their... fortitude.','', '', '', '', '', '', '', '', 13655,1,0,0, 'varos SAY_DEATH');
REPLACE INTO `script_texts` VALUES ('27447', -1578026, 'Blast them! Destroy them!','', '', '', '', '', '', '', '', 13650,1,0,0, 'varos SAY_STRIKE_1');
REPLACE INTO `script_texts` VALUES ('27447', -1578027, 'Take no prisoners! Attack!','', '', '', '', '', '', '', '', 13651,1,0,0, 'varos SAY_STRIKE_2');
REPLACE INTO `script_texts` VALUES ('27447', -1578028, 'Strike now! Obliterate them!','', '', '', '', '', '', '', '', 13652,1,0,0, 'varos SAY_STRIKE_3');

-- Varos says when Drakos dies
REPLACE INTO `script_texts` VALUES ('27447', -1578029, 'Intruders, your victory will be short-lived. I am Commander Varos Cloudstrider. My drakes control the skies and protest this conduit. I will see to it personally that the Oculus does not fall into your hands!','', '', '', '', '', '', '', '', 13648,1,0,0, 'varos SAY_SPAWN');
*/

UPDATE `gameobject_template` SET flags=4 where entry IN (189986,193995);

-- Fix Arcane Beam npc
UPDATE creature SET phaseMask = 0 WHERE `id` = 28239;
-- Fix Centrifuge Core npc
UPDATE creature SET phaseMask = 1 WHERE `id` = 28183;
-- Fix fazione Arcane beam
UPDATE `creature_template` SET faction_A = 35, faction_H = 35 WHERE `entry` = 28239;
-- Planar Anomaly
UPDATE `creature_template` SET InhabitType = 5, modelid1 = 28107, modelid3 = 28107 WHERE `entry` = 30879;

-- Exit portal
UPDATE `gameobject_template` SET data17 = 0 WHERE `entry` = 193908;

-- Reputazione a Oculus
DELETE FROM `creature_onkill_reputation` WHERE creature_id IN (27654, 27656, 27655, 27447, 27633, 27636, 28236, 27638, 27635, 27641, 28276, 27650, 27645, 27651, 27642, 27649, 27648, 27647, 27653, 27644, 30879, 27640, 27639, 28153);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES
(27654, 1037, 1052, 7, 0, 50, 7, 0, 50, 1), -- Drakos the interrogator
(27656, 1037, 1052, 7, 0, 50, 7, 0, 50, 1), -- Ley Guardian Eregos
(27655, 1037, 1052, 7, 0, 50, 7, 0, 50, 1), -- Mage lord urom
(27447, 1037, 1052, 7, 0, 50, 7, 0, 50, 1), -- Varos cloudstrider
-- Trash
(27633, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27636, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(28236, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27638, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27635, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27641, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(28276, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27650, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27645, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27651, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27642, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27649, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27648, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27647, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27653, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27644, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(30879, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27640, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(27639, 1037, 1052, 7, 0, 5, 7, 0, 5, 1),
(28153, 1037, 1052, 7, 0, 5, 7, 0, 5, 1);

-- Arcane beam
DELETE FROM `creature` WHERE `id` = 28239;
UPDATE `creature_template` SET modelid3 = 0 WHERE `entry` = 30879;

-- Orb of the Nexus
UPDATE `gameobject_template` SET TYPE = 10,flags=32,data0=0,data2=1887150,data3=0,data6=1 WHERE entry=188715;
DELETE FROM event_scripts WHERE id = 1887150;
INSERT INTO event_scripts (id,delay,command,datalong,datalong2,dataint,x,y,z,o) VALUES
(1887150,0,6,571,0,0,3877.953125,6984.460449,106.320236,0.023581);
-- Nexus Portal
UPDATE `gameobject_template` SET TYPE = 10,flags=32,data0=0,data2=1899850,data3=0,data6=1 WHERE entry=189985;
DELETE FROM event_scripts WHERE id = 1899850;
INSERT INTO event_scripts (id,delay,command,datalong,datalong2,dataint,x,y,z,o) VALUES
(1899850,0,6,578,0,0,996.837646,1061.329834,359.476685,3.490091);

-- Vehicle: npc_spellclick_spell for Oculus Drakes
-- Emerald Drake, Amber Drake, Ruby Drake Ride Vehicle Hardcoded
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (27692, 27756, 27755);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(27692,46598,0,0,0,1,0,0,0),
(27756,46598,0,0,0,1,0,0,0),
(27755,46598,0,0,0,1,0,0,0);
-- -------------------------------------------------------------------------
-- ----------------------------- Violet Hold -------------------------------
-- -------------------------------------------------------------------------
UPDATE `creature_template` SET `ScriptName` = 'npc_void_sentry' WHERE `entry` = '29364';
-- -------------------------------------------------------------------------
-- ------------------------------ Naxxramas --------------------------------
-- -------------------------------------------------------------------------
-- Teleport in Shappion Lair
UPDATE `areatrigger_teleport` SET target_map = 533, target_position_x = 3497.689941, target_position_y = -5349.750977 , target_position_z = 144.968903, target_orientation = 4.1361 WHERE `id` = 4156;
-- -------------------------------------------------------------------------
-- ----------------------------- Onyxia Lair -------------------------------
-- -------------------------------------------------------------------------
-- Remove Inncorect drop item (Cooking Pot) from NPC (Onyxian Warder)
DELETE FROM `creature_loot_template` WHERE `entry` = 12129 AND `item` = 33852;
DELETE FROM `creature_loot_template` WHERE `entry` = 36572 AND `item` = 33852;
-- -------------------------------------------------------------------------
-- --------------------------- Utgarde Keep --------------------------------
-- -------------------------------------------------------------------------
UPDATE `creature_template` SET `ScriptName` = 'npc_dark_ranger_marrah' WHERE `entry` = 24137; -- Forestal oscura Marrah http://wowhead.com/npc=24137
UPDATE `creature_template` SET `ScriptName` = 'npc_savage_worg' WHERE `entry` = 29735; -- Huargo salvaje http://wowhead.com/npc=29735*/
-- -------------------------------------------------------------------------
-- ------------------------- Utgarde Pinnacle ------------------------------
-- -------------------------------------------------------------------------
-- Delete double spawn Grauf, it is spawn by core.
DELETE FROM `creature` WHERE `guid` = 81815;
DELETE FROM `linked_respawn` WHERE `guid` = 81815;
-- No aparece en modo heroico.
UPDATE `creature` SET `spawnMask` = '3' WHERE `guid` = 127882 && `id` = 29281;*
-- -------------------------------------------------------------------------
-- ------------------------------ Gundrak ----------------------------------
-- -------------------------------------------------------------------------
-- Modify some factions.
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry` IN (29573, 31367, 29680, 29713, 30940, 30943);
UPDATE `creature_template` SET `faction_A`=7, `faction_H`=7 WHERE `entry`=29932;

-- DB spawn eck (serverdown issues, in case of crash do not appear again).
DELETE FROM `creature` WHERE `id`=29932;
INSERT INTO `creature` (`guid`,`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('81823','29932','604','2','1','26644','0','1640.008423','931.781738','107.357620','0.668432','86400','0','0','431392','0','0','0');

-- dont spawn drakkari colossus related living mojo, remove respawn links
-- UPDATE `creature` SET `spawnMask` = '0' WHERE `guid` IN ('85542','85543','85544','85545','85555');
-- DELETE FROM `linked_respawn` WHERE `guid` IN ('85542','85543','85544','85545','85555');

-- Scriptname Gal'darah <High Prophet of Akali> summon
update `creature_template` set `ScriptName` = 'mob_rhino_spirit' where `entry` = '29791';
-- Experimental vehicle id for Impaling Charge http://www.wowhead.com/spell=54958
update `creature_template` set `VehicleId` = '169' where `entry` in ('29306','31368');

-- Trigger Eck residue: Eck Spit http://www.wowhead.com/spell=55814 to Eck Residue http://www.wowhead.com/spell=55817
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = '55814';
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('55814','55817','1','Eck Spit - Apply Eck Residue');

-- Gundrak script text data (sd2)
-- Cleaning
DELETE FROM `script_texts` WHERE `entry` BETWEEN '-1604030' AND '-1604000';
-- -1 604 000 GUNDRAK
-- Slad Ram
INSERT INTO script_texts (npc_entry,entry,content_default,sound,TYPE,LANGUAGE,emote,COMMENT) VALUES
(29304,-1604000,'Drakkari gonna kill anybody who trespass on these lands!',14443,1,0,0,'sladran SAY_AGGRO'),
(29304,-1604001,'Minions of the scale, heed my call!',14444,1,0,0,'sladran SAY_SUMMON_SNAKE'),
(29304,-1604002,'Our thousand fangs gonna rend your flesh! ',14445,1,0,0,'sladran SAY_SUMMON_CONSTRICTOR'),
(29304,-1604003,'Ye not breathin\'! Good.',14446,1,0,0,'sladran SAY_SLAY_1'),
(29304,-1604004,'You scared now?',14447,1,0,0,'sladran SAY_SLAY_2'),
(29304,-1604005,'I\'ll eat you next, mon!',14448,1,0,0,'sladran SAY_SLAY_3'),
(29304,-1604006,'I sssee now... Ssscourge wasss not... our greatessst enemy...',14449,1,0,0,'sladran SAY_DEATH'),
(29304,-1604007,'%s begins to cast Poison Nova!',0,3,0,0,'sladran EMOTE_NOVA'),
-- Drakkari Colossus
(29307,-1604008,'%s surges forward!',0,2,0,0,'colossus EMOTE_SURGE'),
(29307,-1604009,'%s seep into the ground.',0,2,0,0,'colossus EMOTE_SEEP'),
(29307,-1604010,'%s begins to glow faintly.',0,2,0,0,'colossus EMOTE_GLOW'),
-- Moorabi
(29305,-1604011,'We fought back da Scourge. What chance joo be thinkin\' JOO got?',14721,1,0,0,'moorabi SAY_AGGRO'),
(29305,-1604012,'Da ground gonna swallow you up! ',14723,1,0,0,'moorabi SAY_QUAKE'),
(29305,-1604013,'Get ready for somethin\'... much... BIGGAH!',14722,1,0,0,'moorabi SAY_TRANSFORM'),
(29305,-1604014,'I crush you, cockroaches!',14725,1,0,0,'moorabi SAY_SLAY_1'),
(29305,-1604015,'Who gonna stop me; you?',14726,1,0,0,'moorabi SAY_SLAY_2'),
(29305,-1604016,'Not so tough now.',14727,1,0,0,'moorabi SAY_SLAY_3'),
(29305,-1604017,'If our gods can die... den so can we...',14728,1,0,0,'moorabi SAY_DEATH'),
(29305,-1604018,'%s begins to transform!',0,3,0,0,'moorabi EMOTE_TRANSFORM'),
-- Gal Darah
(29306,-1604019,'I\'m gonna spill your guts, mon!',14430,1,0,0,'galdarah SAY_AGGRO'),
(29306,-1604020,'Ain\'t gonna be nottin\' left after this!',14431,1,0,0,'galdarah SAY_TRANSFORM_1'),
(29306,-1604021,'You wanna see power? I\'m gonna show you power!',14432,1,0,0,'galdarah SAY_TRANSFORM_2'),
(29306,-1604022,'Gut them! Impale them!',14433,1,0,0,'galdarah SAY_SUMMON_1'),
(29306,-1604023,'Kill them all!',14434,1,0,0,'galdarah SAY_SUMMON_2'),
(29306,-1604024,'Say hello to my BIG friend!',14435,1,0,0,'galdarah SAY_SUMMON_3'),
(29306,-1604025,'What a rush!',14436,1,0,0,'galdarah SAY_SLAY_1'),
(29306,-1604026,'Who needs gods, when WE ARE GODS!',14437,1,0,0,'galdarah SAY_SLAY_2'),
(29306,-1604027,'I told ya so!',14438,1,0,0,'galdarah SAY_SLAY_3'),
(29306,-1604028,'Even the mighty... can fall.',14439,1,0,0,'galdarah SAY_DEATH'),
(29305,-1604029,'%s transforms into a Mammoth!',14724,2,0,0,'moorabi EMOTE_TRANSFORMED');

-- Loot & Rep
-- Disable loot for Drakkari Colossus, add heroic skinloot
-- This need checking.
-- UPDATE `creature_template` SET `lootid` = '0', `skinloot` = '80103' WHERE `entry` IN ('29307','31365');

-- Disable rep for Drakkari Colossus
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` IN ('29307','31365');

-- Immunities ***/
-- All bosses
update `creature_template` set `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 where `entry` in (29304,31370,29307,31365,29573,31367,29306,31368,29932,29305,30530);
-- Moorabi
update `creature_template` set `mechanic_immune_mask` = `mechanic_immune_mask` &~ 256 &~ 2048 &~ 33554432 where `entry` in (29305,30530);
update `creature_template` set `mechanic_immune_mask` = `mechanic_immune_mask` &~ 2097152 where `entry` in (29304,31370,29307,31365,29573,31367,29306,31368,29932,29305,30530);

-- Modify snake wrap faction
update `creature_template` set `faction_A` = '16', `faction_H` = '16' where `entry` in ('29742','32218');
-- Set snake wrap scriptname
update `creature_template` set `ScriptName` = 'mob_snake_wrap' where `entry` = '29742';

-- Adjust rhino spirit npclevel
update `creature_template` set `minlevel` = '78', `maxlevel` = '82' where `entry` = '29791';

-- Creature_ai_scripts
-- Change spitting cobra events
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = '29774';
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`,
`event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`,
`action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('2977401','29774','1','0','100','6','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Spitting Cobra - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('2977402','29774','4','0','100','2','0','0','0','0','11','32860','1','0','23','1','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit and Set Phase 1 on Aggro'),
('2977403','29774','9','5','100','3','0','30','12000','15000','11','32860','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit (Phase 1)'),
('2977404','29774','4','0','100','4','0','0','0','0','11','38378','1','0','23','1','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit and Set Phase 1 on Aggro'),
('2977405','29774','9','5','100','5','0','30','12000','15000','11','38378','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit (Phase 1)'),
('2977406','29774','3','5','100','6','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Spitting Cobra - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('2977407','29774','9','5','100','6','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Spitting Cobra - Start Combat Movement at 35 Yards (Phase 1)'),
('2977408','29774','9','5','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Spitting Cobra - Prevent Combat Movement at 15 Yards (Phase 1)'),
('2977409','29774','9','5','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Spitting Cobra - Start Combat Movement Below 5 Yards'),
('2977410','29774','3','3','100','7','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Spitting Cobra - Set Phase 1 when Mana is above 15% (Phase 2)'),
('2977411','29774','0','0','100','3','5000','10000','17000','20000','11','55703','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Cobra Strike'),
('2977412','29774','0','0','100','5','5000','10000','17000','20000','11','59020','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Cobra Strike'),
('2977413','29774','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Spitting Cobra - Set Phase to 0 on Evade');
/*
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = '29774';
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('2977401','29774','4','0','100','2','0','0','0','0','11','55700','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('2977402','29774','4','0','100','4','0','0','0','0','11','59019','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('2977403','29774','9','0','100','3','5','30','2300','5000','11','55700','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('2977404','29774','9','0','100','5','5','30','2300','5000','11','59019','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('2977405','29774','9','0','100','3','0','5','5000','9000','11','55703','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Cobra Strike');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('2977406','29774','9','0','100','5','0','5','5000','9000','11','59020','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Cobra Strike');
*/
-- Add selfheal to drakkari medicine man
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = '29826';
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`,
`event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`,
`action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
('2982601','29826','14','0','100','7','10000','30','12000','15000','11','55598','6','0','0','0','0','0','0','0','0','0','Drakkari Medecine Man - Cast Cleanse Magic on Friendlies'),
('2982602','29826','3','0','100','7','30','0','22000','29000','11','55582','4','1','0','0','0','0','0','0','0','0','Drakkari Medecine Man - Cast Mana Link at 30% MP'),
('2982603','29826','14','0','100','3','30000','40','14000','21000','11','55597','6','1','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Normal) - Cast Healing Wave on Friendlies'),
('2982604','29826','14','0','100','5','45000','40','14000','21000','11','58980','6','1','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Heroic) - Cast Healing Wave on Friendlies'),
('2982605','29826','2','0','100','2','50','0','0','0','11','55599','0','1','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Normal) - Cast Earth Shield at 50% HP'),
('2982606','29826','2','0','100','4','50','0','0','0','11','58981','0','1','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Heroic) - Cast Earth Shield at 50% HP'),
('2982607','29826','2','0','100','3','75','0','10000','16000','11','55597','0','0','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Normal) - Cast Healing Wave on Self'),
('2982608','29826','2','0','100','5','75','0','10000','16000','11','58980','0','0','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Heroic) - Cast Healing Wave on Self');
-- -------------------------------------------------------------------------
-- ------------------------- Vault Of Archavon -----------------------------
-- -------------------------------------------------------------------------
/*SET @EQUIP := 30000; -- Two equipment ids
DELETE FROM `creature_equip_template` WHERE `entry` = @EQUIP;
INSERT INTO `creature_equip_template` (`entry`,`equipentry1`) VALUES (@EQUIP,50757);
-- Toravon the Ice Watcher
UPDATE `creature_template` SET `equipment_id` = @EQUIP WHERE `entry` IN (38433,38462);
-- SET proper immunemask for Toravon and Frost Warder
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299835 WHERE `entry` = @ENTRY;
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|32 WHERE `entry` IN (38433,38462);
UPDATE `creature_template` SET `flags_extra` = `flags_extra`|130 WHERE `entry` = 38461;
-- Toravon the Ice Watcher
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299835 WHERE `entry` = 38433;
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299835 WHERE `entry` = 38462;
-- Empowering Orb Visual Stalker
UPDATE `creature_template` SET `ScriptName` = 'mob_frost_warder' WHERE `entry` = 38482;
-- SET proper immunemask for Toravon and Frost Warder
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299835 WHERE `entry` = 38482;
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|32 WHERE `entry` IN (38433,38462);
UPDATE `creature_template` SET `flags_extra` = `flags_extra`|130 WHERE `entry` = 38461;
-- Delete stalkers (spawned by script)
DELETE FROM `creature` WHERE `id` = 38461;*/
-- -------------------------------------------------------------------------
-- -------------------- Myth Project "Quests" Update -----------------------
-- -------------------------------------------------------------------------
-- 6433 Quest: Opening Ahn Quiraj
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -100 WHERE `entry` = 15625 AND `item` = 21149;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -49 WHERE `entry` = 12478 AND `item` = 21146;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -45 WHERE `entry` = 12479 AND `item` = 21146;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -44 WHERE `entry` = 12477 AND `item` = 21146;
DELETE FROM `creature_loot_template` WHERE `entry` IN (14888,12496,5718) AND `item` = 21146;
DELETE FROM `creature_loot_template` WHERE `entry` = 14890 AND `item` = 21149;
-- 6434 Quest: Massacre at Light's Hope
UPDATE `creature_template` SET `modelid1` = 25703, `modelid2` = 25703 WHERE `entry` = 28817;
-- 6443 Quest: Smoke 'Em Out, http://www.wowhead.com/quest=12324
DELETE FROM `conditions` WHERE `SourceEntry` = 49075;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,49075,0,18,1,27570,0,0,'', 'Smoke `Em Out`');
-- 6444 Quest: Scrying Goggles? No Problem!, http://www.wowhead.com/quest=8578
DELETE FROM `creature_questrelation` WHERE `quest` = 8578; -- Delete existing incorrect start point
DELETE FROM `gameobject_questrelation` WHERE `quest` = 8578; -- Delete any existing values for this quest
INSERT INTO `gameobject_questrelation` (`id`,`quest`) VALUES (180642,8578); -- Insert correct values for start point of quest
-- -------------------------------------------------------------------------
-- ----------------- Myth Project "Game Mechanic" Update -------------------
-- -------------------------------------------------------------------------
-- 6627 Items: Icecrown Citadel Items: 60487, 33648, 49622, 64786, 71640, 71562, 71637, 71545, 71634, 71606, 71406
UPDATE `spell_proc_event` SET cooldown = 45 WHERE `entry` IN (
60487, 33648, 49622, 64786, 71640, 71562, 71637, 71545, 71634, 71606, 71406 );
-- 3194 Paladin: Devine Storm
DELETE FROM `spell_dbc` WHERE `Id` IN ('199997');
INSERT INTO `spell_dbc` (`Id`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `Stances`, `StancesNot`, `Targets`, `CastingTimeIndex`, `AuraInterruptFlags`, `ProcFlags`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `RangeIndex`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect1`, `Effect2`, `Effect3`, `EffectDieSides1`, `EffectDieSides2`, `EffectDieSides3`, `EffectRealPointsPerLevel1`, `EffectRealPointsPerLevel2`, `EffectRealPointsPerLevel3`, `EffectBasePoints1`, `EffectBasePoints2`, `EffectBasePoints3`, `EffectMechanic1`, `EffectMechanic2`, `EffectMechanic3`, `EffectImplicitTargetA1`, `EffectImplicitTargetA2`, `EffectImplicitTargetA3`, `EffectImplicitTargetB1`, `EffectImplicitTargetB2`, `EffectImplicitTargetB3`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectRadiusIndex3`, `EffectApplyAuraName1`, `EffectApplyAuraName2`, `EffectApplyAuraName3`, `EffectAmplitude1`, `EffectAmplitude2`, `EffectAmplitude3`, `EffectMultipleValue1`, `EffectMultipleValue2`, `EffectMultipleValue3`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectMiscValue3`, `EffectMiscValueB1`, `EffectMiscValueB2`, `EffectMiscValueB3`, `EffectTriggerSpell1`, `EffectTriggerSpell2`, `EffectTriggerSpell3`, `EffectSpellClassMaskA1`, `EffectSpellClassMaskA2`, `EffectSpellClassMaskA3`, `EffectSpellClassMaskB1`, `EffectSpellClassMaskB2`, `EffectSpellClassMaskB3`, `EffectSpellClassMaskC1`, `EffectSpellClassMaskC2`, `EffectSpellClassMaskC3`, `MaxTargetLevel`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `MaxAffectedTargets`, `DmgClass`, `PreventionType`, `DmgMultiplier1`, `DmgMultiplier2`, `DmgMultiplier3`, `AreaGroupId`, `SchoolMask`, `Comment`) VALUES
('199997','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','1','0','-1','0','0','6','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','10','0','0','0','0','0','0','0','0','0','0','0','Divine Storm Helper (SERVERSIDE)');
DELETE FROM `spell_proc_event` WHERE `entry` IN ('199997');
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
('199997','0','10','0','131072','0','16','0','0','100','0');
DELETE FROM `spell_bonus_data` WHERE `entry` IN ('54172');
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
('54172','0','0','0','0','Paladin - Divine Storm');
-- 5088 Druid: Naturalist, http://www.wowhead.com/spell=17069
DELETE FROM `spell_bonus_data` WHERE `entry` IN (779,780,769,9754,9908,26997,48561,48562);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`,`ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(779,0,0,0.063,0,'Druid - Swipe (Bear) Rank 1'),
(780,0,0,0.063,0,'Druid - Swipe (Bear) Rank 2'),
(769,0,0,0.063,0,'Druid - Swipe (Bear) Rank 3'),
(9754,0,0,0.063,0,'Druid - Swipe (Bear) Rank 4'),
(9908,0,0,0.063,0,'Druid - Swipe (Bear) Rank 5'),
(26997,0,0,0.063,0,'Druid - Swipe (Bear) Rank 6'),
(48561,0,0,0.063,0,'Druid - Swipe (Bear) Rank 7'),
(48562,0,0,0.063,0,'Druid - Swipe (Bear) Rank 8');
-- 5094 Hunter: Explosive Shot, http://www.wowhead.com/spell=53301
UPDATE `spell_bonus_data` SET `direct_bonus` = '0',`dot_bonus` = '0',`ap_dot_bonus` = '0' WHERE `entry` =53352;
-- 5095 Hunter: The Beast Within & Bestial Wrath, http://www.wowhead.com/spell=34692 & http://www.wowhead.com/spell=19574
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 19574;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(19574, -68766, 2, 'Bestial Wrath immune at Desecration'),
(19574, -58617, 2, 'Bestial Wrath immune at Glyph of Heart Strike'),
(19574, -51514, 2, 'Bestial Wrath immune at Hex'),
(19574, -45524, 2, 'Bestial Wrath immune at Chains of Ice'),
(19574, -118, 2, 'Bestial Wrath immune at Polymorph'),
(19574, -49012, 2, 'Bestial Wrath immune at Wyvern Sting'),
(19574, -1499, 2, 'Bestial Wrath immune at Freezing Trap'),
(19574, -6358, 2, 'Bestial Wrath immune at Seduction'),
(19574, -51209, 2, 'Bestial Wrath immune at Hungering Cold'),
(19574, -13810, 2, 'Bestial Wrath immune at Frost Trap'),
(19574, -33786, 2, 'Bestial Wrath immune at Cyclone'),
(19574, -64058, 2, 'Bestial Wrath immune at Psychic Horror'),
(19574, -51724, 2, 'Bestial Wrath immune at Sap'),
(19574, -2094, 2, 'Bestial Wrath immune at Blind'),
(19574, -19503, 2, 'Bestial Wrath immune at Scatter Shot'),
(19574, -66940, 2, 'Bestial Wrath immune at Hammer of Justice'),
(19574, -32416, 2, 'Bestial Wrath immune at Hammer of Justice'),
(19574, -20066, 2, 'Bestial Wrath immune at Repentance');
-- 5544 Paladin: Improved Concentration Aura
DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN (-63510, 63510);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('465', '63510', '2', 'Improved Concentration Aura linked spell'),
('643', '63510', '2', 'Improved Concentration Aura linked spell'),
('1032', '63510', '2', 'Improved Concentration Aura linked spell'),
('7294', '63510', '2', 'Improved Concentration Aura linked spell'),
('10290', '63510', '2', 'Improved Concentration Aura linked spell'),
('10291', '63510', '2', 'Improved Concentration Aura linked spell'),
('10292', '63510', '2', 'Improved Concentration Aura linked spell'),
('10293', '63510', '2', 'Improved Concentration Aura linked spell'),
('10298', '63510', '2', 'Improved Concentration Aura linked spell'),
('10299', '63510', '2', 'Improved Concentration Aura linked spell'),
('10300', '63510', '2', 'Improved Concentration Aura linked spell'),
('10301', '63510', '2', 'Improved Concentration Aura linked spell'),
('19746', '63510', '2', 'Improved Concentration Aura linked spell'),
('19876', '63510', '2', 'Improved Concentration Aura linked spell'),
('19888', '63510', '2', 'Improved Concentration Aura linked spell'),
('19891', '63510', '2', 'Improved Concentration Aura linked spell'),
('19895', '63510', '2', 'Improved Concentration Aura linked spell'),
('19896', '63510', '2', 'Improved Concentration Aura linked spell'),
('19897', '63510', '2', 'Improved Concentration Aura linked spell'),
('19898', '63510', '2', 'Improved Concentration Aura linked spell'),
('19899', '63510', '2', 'Improved Concentration Aura linked spell'),
('19900', '63510', '2', 'Improved Concentration Aura linked spell'),
('27149', '63510', '2', 'Improved Concentration Aura linked spell'),
('27150', '63510', '2', 'Improved Concentration Aura linked spell'),
('27151', '63510', '2', 'Improved Concentration Aura linked spell'),
('27152', '63510', '2', 'Improved Concentration Aura linked spell'),
('27153', '63510', '2', 'Improved Concentration Aura linked spell'),
('32223', '63510', '2', 'Improved Concentration Aura linked spell'),
('48941', '63510', '2', 'Improved Concentration Aura linked spell'),
('48942', '63510', '2', 'Improved Concentration Aura linked spell'),
('48943', '63510', '2', 'Improved Concentration Aura linked spell'),
('48945', '63510', '2', 'Improved Concentration Aura linked spell'),
('48947', '63510', '2', 'Improved Concentration Aura linked spell'),
('54043', '63510', '2', 'Improved Concentration Aura linked spell');
-- 5579 Death Knight: Risen Ghoul & Gargoyle: Fear Immunity
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 0x00000010 WHERE `entry` IN (27829, 26125);
-- 5907 Mage: Frostbolt
DELETE FROM `spell_bonus_data` WHERE `entry` IN ('116');
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
('116','0.857','0','0','0','Mage - Frostbolt');
-- 5966 Mage: Arcane Concentration
DELETE FROM `spell_proc_event` WHERE `entry` IN (11213,12574,12575,12576,12577);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(11213,0x00,3,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0), -- Arcane Concentration (Rank 1)
(12574,0x00,3,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0), -- Arcane Concentration (Rank 2)
(12575,0x00,3,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0), -- Arcane Concentration (Rank 3)
(12576,0x00,3,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0), -- Arcane Concentration (Rank 4)
(12577,0x00,3,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0); -- Arcane Concentration (Rank 5)
-- 5971 Warlock: Shadow Bite, http://www.wowhead.com/spell=54049
DELETE FROM spell_script_names WHERE spell_id IN (-54049,54049,54050,54051,54052,54053);
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES (-54049, 'spell_warl_shadow_bite');
-- 6017 Event: Love in the Air
-- Apothecary Hummel http://www.wowhead.com/npc=36296
UPDATE `creature_template` SET `ScriptName` = 'npc_apothecary_hummel' WHERE `entry` = 36296;
-- Apothecary Baxter http://www.wowhead.com/npc=36565
UPDATE `creature_template` SET `ScriptName` = 'npc_apothecary_baxter' WHERE `entry` = 36565;
-- Apothecary Frye http://www.wowhead.com/npc=36272
UPDATE `creature_template` SET `ScriptName` = 'npc_apothecary_frye' WHERE `entry` = 36272;
-- 6018 NPC: 30431
DELETE FROM `creature` WHERE `id` = 30431;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values
(null,'30431','571','1','135','27020','0','6266.74','-44.569','421.498','3.83972','300','0','0','23310','11982','0','0','0','0','0');
-- 6022 Druid: Starfall
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.13 WHERE `entry` = 50294; -- Starfall AOE Rank 1
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.13 WHERE `entry` = 53188; -- Starfall AOE Rank 2
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.13 WHERE `entry` = 53189; -- Starfall AOE Rank 3
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.13 WHERE `entry` = 53190; -- Starfall AOE Rank 4
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.3 WHERE `entry` = 50288; -- Starfall Rank 1
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.3 WHERE `entry` = 53191; -- Starfall Rank 2
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.3 WHERE `entry` = 53194; -- Starfall Rank 3
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.3 WHERE `entry` = 53195; -- Starfall Rank 4
-- 6023 Death Knight: Desolation, http://wowdata.ru/spell.html?id=66817
DELETE FROM spell_proc_event WHERE entry IN (66799,66814,66815,66816,66817);
INSERT INTO spell_proc_event (entry, SchoolMask, SpellFamilyName, SpellFamilyMask0, SpellFamilyMask1, SpellFamilyMask2, procFlags, procEx, ppmRate, CustomChance, Cooldown) VALUES 
(66799, 5, 15, 4194304, 0, 0, 0, 0, 0, 100, 0),
(66814, 5, 15, 4194304, 0, 0, 0, 0, 0, 100, 0),
(66815, 5, 15, 4194304, 0, 0, 0, 0, 0, 100, 0),
(66816, 5, 15, 4194304, 0, 0, 0, 0, 0, 100, 0),
(66817, 5, 15, 4194304, 0, 0, 0, 0, 0, 100, 0); 
-- 6023 Item: Tears of the Vanquished
-- http://www.wowhead.com/item=47215#comments
UPDATE spell_proc_event SET cooldown = 45 WHERE `entry` = 67667;
-- 6024 NPC: Silithid Swarm, http://www.wowhead.com/npc=4196
UPDATE `creature_template` SET `flags_extra` = `flags_extra`|64 WHERE `entry` = 4196;
-- 6143 Quest: Shadowmourne Questline
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (72934,72928);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,72934,0,18,1,0,0,0, '', 'Blood-Queen - Blood Infusion Quest Credit'),
(13,0,72928,0,18,1,0,0,0, '', 'Deathbringer Saurfang - achievement');
UPDATE `quest_template` SET `PrevQuestId` = 24749 WHERE `entry` = 24756; -- correct quest chain (Blood Infusion)
-- 6144 Spell: Flying Carpet
UPDATE `npc_trainer` SET `reqskillvalue` = 300 WHERE `spell` = 60969; -- SET correct required skill value 300 from the previous 410
-- 6145 Item: Book of Glyph Mastery
DELETE FROM skill_discovery_template WHERE spellId IN (64295, 64268, 64309) AND reqSpell = 64323;
INSERT INTO `skill_discovery_template` (`spellId`,`reqSpell`,`reqSkillValue`,`chance`) VALUES
(64268,64323,425,100), -- Glyph of Berserk
(64295,64323,425,100), -- Glyph of Bladestorm
(64309,64323,425,100); -- Glyph of Spirit Tap
-- 6146 Profession: Engineering: Quest line
UPDATE `quest_template` SET `ZoneOrSort` = 0 WHERE `entry` = 8249;
-- 6147 Warrior: Taste for Blood
UPDATE `spell_proc_event` SET `procEx` = 0x00040000 WHERE `entry` IN (56636, 56637, 56638);
-- 6148 Death Knight: Glyph of Raise Dead
UPDATE `item_template` SET `AllowableClass` = 32 WHERE `entry` = 44432;
-- 6149 Death Knight: Threat of Thassarian
DELETE FROM `spell_proc_event` WHERE `entry` IN (65661,66191,66192);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`) VALUES
(65661,0,15,0x00400011,0x20020004,0x00000000,16,0,0,100,0), -- Threat of Thassarian - Rank 1
(66191,0,15,0x00400011,0x20020004,0x00000000,16,0,0,100,0), -- Threat of Thassarian - Rank 2
(66192,0,15,0x00400011,0x20020004,0x00000000,16,0,0,100,0); -- Threat of Thassarian - Rank 3
-- 6307 Shaman: Elemental Focus, http://www.wowhead.com/spell=16164
UPDATE `spell_proc_event` SET `SpellFamilyMask0` = `SpellFamilyMask0` &~ 192 WHERE `entry` = 16164;
-- 6309 Priest: Mind Flay, http://www.wowhead.com/spell=15407
UPDATE `spell_proc_event` SET `SpellFamilyMask0`=0|0x00008000,`SpellFamilyMask2`=`SpellFamilyMask2`|0x00000040 WHERE `entry` IN (33191,33192,33193);
-- 6310 Warrior: Safeguard, http://www.wowhead.com/spell=46945
UPDATE `spell_proc_event` SET `Cooldown` = 1 WHERE `entry` IN (46945,46949);
-- 6311 Priest: Prayer of Healing, http://www.wowhead.com/spell=596
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.526 WHERE `entry` = 596;
-- 6312 Priest: Holy Concentration, http://www.wowhead.com/spell=34753
DELETE FROM `spell_proc_event` WHERE `entry` IN (34753, 34859, 34860);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(34753, 0, 6, 6144, 4, 4096, 0, 2, 0, 0, 0), -- rank1
(34859, 0, 6, 6144, 4, 4096, 0, 2, 0, 0, 0), -- rank2
(34860, 0, 6, 6144, 4, 4096, 0, 2, 0, 0, 0); -- rank3
UPDATE `spell_proc_event` SET `SpellFamilyMask2`=0x00001000 WHERE `entry` IN (34753,34859,34860);
-- 6313 Warrior: Bloodsurge, http://www.wowhead.com/spell=46916
DELETE FROM `spell_proc_event` WHERE `entry` = 46916;
-- 6314 Rogue: Blade Twisting, http://www.wowhead.com/spell=31126
UPDATE `spell_proc_event` SET `SpellFamilyMask0` = 0 WHERE `entry` IN (31124,31126);
-- 6335 Paladin: Blessed Life, http://www.wowhead.com/spell=31828
DELETE FROM `spell_dbc` WHERE `id` = 31934;
INSERT INTO `spell_dbc` (`Id`,`CastingTimeIndex`,`ProcFlags`,`ProcChance`,`ProcCharges`,`DurationIndex`,`RangeIndex`,`Effect1`,`EffectBasePoints1`,`EffectImplicitTargetA1`,`EffectApplyAuraName1`,`EffectMiscValue1`,`SpellFamilyName`,`Comment`) VALUES
(31934,1,1048576,100,1,21,1,6,-50,1,87,127,10,'Blessed Life Helper (SERVERSIDE)');
-- 6340 Hunter: Frenzy, http://www.wowhead.com/spell=19621
DELETE FROM `spell_proc_event` WHERE `entry` = 20784;
INSERT INTO `spell_proc_event` (`entry`,`procEx`) VALUES (20784,2);
-- 6358 Rogue: Killing Spree, http://www.wowhead.com/spell=51690
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 51690;
INSERT INTO `spell_linked_spell` VALUES (51690,61851,0,'Killing Spree');
-- 6359 Paladin: Improved Devotion Aura, http://www.wowhead.com/spell=63514
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (-31869,-20138,-20139,-20140,-20254,-20255,-20256);
INSERT INTO `spell_linked_spell` VALUES
(-31869,-63531,0,'Sanctified Retribution at talent reset'),
(-20138,-63514,0,'Improved Devotion Aura at talent reset'),
(-20139,-63514,0,'Improved Devotion Aura at talent reset'),
(-20140,-63514,0,'Improved Devotion Aura at talent reset'),
(-20254,-63510,0,'Improved Concentration Aura at talent reset'),
(-20255,-63510,0,'Improved Concentration Aura at talent reset'),
(-20256,-63510,0,'Improved Concentration Aura at talent reset');
UPDATE `spell_group` SET `spell_id` = 63514 WHERE `id` = 1095;
-- 6362 Warrior: Vigilance, http://www.wowhead.com/spell=50720
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (59665,-50720);
INSERT INTO `spell_linked_spell` VALUES
(59665,68066,0,'Vigilance - apply damage reduction'),
(-50720,-68066,0,'Vigilance - remove damage reduction');
-- 6435 NPC: Scarlet Miner, http://www.wowhead.com/npc=28841
UPDATE `creature_template` SET `speed_run` = '1.22' WHERE `entry` = 28841;
-- 6436 NPC: Scarlet Infantryman, http://www.wowhead.com/npc=28609
UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35' WHERE `entry` = 28896;
-- 6437 NPC: Warden MoI`bff Jill, http://www.wowhead.com/npc=18408
UPDATE `creature_template` SET faction_A=1802, faction_H=1802 WHERE `entry` = 18408;
-- 6438 Quest: An Improper Burial, http://www.wowhead.com/quest=10913
UPDATE `quest_template` SET `ReqSpellCast1` = 39189, `ReqSpellCast2` = 39189 WHERE `entry` = 10913;
-- 6439 NPC: Unliving Initiate, http://www.wowhead.com/npc=21870
UPDATE `creature_template` SET `unit_flags` = 33554434 WHERE `entry` = 21870;
-- 6440 NPC: Slain Auchenai Warrior, http://www.wowhead.com/npc=21846
UPDATE `creature_template` SET `unit_flags` = 256 WHERE `entry` = 21846;
-- 6441 Zone: Start Death Knight Start Zone
UPDATE `creature_template` SET `flags_extra` = 128 WHERE `entry` = 28481;
UPDATE `creature_template` SET `flags_extra` = 192 WHERE `entry` = 28367;
UPDATE `creature_template` SET `modelid1` = 26320, `modelid2` = 26320 WHERE `entry` = 28511;
UPDATE `creature_model_info` SET `modelid_other_gender` = 0 WHERE `modelid` = 26320;
-- 6442 Mage: T7 P2 Bonus
REPLACE INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`) VALUES
(37447, 0, 3, 0, 0x00000100, 0, 0x04000, 0, 0, 0, 0), -- Serpent-Coil Braid
(61062, 0, 3, 0, 0x00000100, 0, 0x04000, 0, 0, 0, 0); -- 2/5 Frostfire Garb
-- 6445 NPC: Lorelae Wintersong, http://www.wowhead.com/npc=12022
UPDATE npc_vendor SET incrtime = 900 WHERE `item` IN (16243) AND `entry` = 12022; -- Formula: Runed Arcanite Rod
UPDATE npc_vendor SET incrtime = 2400 WHERE `item` IN (14483) AND `entry` = 12022; -- Pattern: Felcloth Pants
UPDATE npc_vendor SET incrtime = 900 WHERE `item` IN (16224) AND `entry` = 12022; -- Formula: Enchant Cloak - Superior Defense
-- 6446 NPC: Flesh Eating Worm, http://www.wowhead.com/npc=2462
UPDATE `creature_template` SET `flags_extra` = `flags_extra`|64 WHERE `entry` = 2462;
-- 6447 Mage: Brain Freeze, http://www.wowhead.com/spell=44546
DELETE FROM `spell_proc_event` WHERE `entry` IN ('44546', '44548', '44549');
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
('44546','0','3','544','0','0','0','0','0','0','0'), -- Brain Freeze (Rank 1)
('44548','0','3','544','0','0','0','0','0','0','0'), -- Brain Freeze (Rank 2)
('44549','0','3','544','0','0','0','0','0','0','0'); -- Brain Freeze (Rank 3)
-- 6454 Event: Feast of Winter Veil, http://www.wowhead.com/event=141
UPDATE `game_event` SET `length` = 11700 WHERE `eventEntry` = 54;
-- 6466 Item: Dertrok's Wand Case, http://www.wowhead.com/item=30650
DELETE FROM `item_loot_template` WHERE `entry` = 30650;
INSERT INTO `item_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(30650,30651,100,1,1,1,1), -- Dertrok's First Wand
(30650,30652,100,1,2,1,1), -- Dertrok's Second Wand
(30650,30653,100,1,3,1,1), -- Dertrok's Third Wand
(30650,30654,100,1,4,1,1); -- Dertrok's Fourth Wand
-- 6467 Game. Mech: Client Crash on NPC 36896,12412
UPDATE `creature_template` SET `InhabitType` = 3, `mechanic_immune_mask` = 0 WHERE `entry` IN (36896,12412);
-- 6468 NPC: Some level and HP
UPDATE `creature_template` SET `minlevel` = 50, `maxlevel` = 50 WHERE `entry` IN (
40437, -- Battered Brewer <Dungeonmaster>
40441, -- Battered Brewmaster <Dungeonmaster>
40435); -- Headless Ghost <Dungeonmaster>
UPDATE `creature_template` SET `minlevel` = 60, `maxlevel` = 76, `exp` = 2 WHERE `entry` = 30881; -- Servant of Hodir
UPDATE `creature_template` SET `minlevel` = 75, `maxlevel` = 78, `exp` = 2 WHERE `entry` = 30900; -- Argent Mason
UPDATE `creature_template` SET `minlevel` = 78, `maxlevel` = 78, `exp` = 2 WHERE `entry` = 30851; -- Melt
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `exp` = 2 WHERE `entry` = 30890; -- Twilight Whelp
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `exp` = 2 WHERE `entry` IN (
39759, -- Tankbuster Cannon
30719, -- Spitzpatrick's Bomber
30882, -- Twilight Egg
30891, -- Blessed Banner of the Crusade
30924, -- Possessed Iskalder <The Ancient Hero>
30987, -- Hideous Plaguebringer
31015, -- Intrepid Ghoul
31029, -- Possessed Vardmadra
31030, -- Balargarde Elite
31161, -- Sapph <Rider of Frost>
31192, -- Masud
31193, -- Geness Half-Soul
31194, -- Talla
31196); -- Rith
-- 6469 NPC: Jeeves, http://www.wowhead.com/npc=35642
SET @Jeeves = 35642;
UPDATE `creature_template` SET `faction_A` = 35,`faction_H` = 35,`npcflag` = `npcflag`|4225|131072,`unit_flags` = `unit_flags`|768,`gossip_menu_id` = 10667,`AIName` = '' WHERE `entry` = @Jeeves; -- template updates
-- Jeeves gets the (player) faction of its summoner, 35 by default
UPDATE `creature_model_info` SET `bounding_radius` = 0.31,`combat_reach` = 0,`gender` = 2 WHERE `modelid` = 30076; -- addon data
DELETE FROM `creature_template_addon` WHERE `entry` = @Jeeves;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Jeeves,0,33554432,1,0, '68054 0'); -- Aura: Pressing Engagement, bytes1: hover mode
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 10667 AND `SourceEntry` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,10667,0,0,7,202,350,0,0, '', 'Jeeves: Bank requires Engineering 350');
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10667 AND `id` IN (0,1);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`) VALUES
(10667,0,6,'I would like to check my deposit box.',9,131072), -- banker
(10667,1,1,'Let me browse your goods.',3,128); -- vendor
DELETE FROM `npc_vendor` WHERE `entry` = @Jeeves;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`) VALUES
(@Jeeves,1,41584,0,0,0), -- Frostbite Bullets
(@Jeeves,2,41586,0,0,0), -- Terrorshaft Arrow
(@Jeeves,3,44605,0,0,0), -- Wild Spineleaf
(@Jeeves,4,44614,0,0,0), -- Starleaf Seed
(@Jeeves,5,44615,0,0,0), -- Devout Candle
(@Jeeves,6,16583,0,0,0), -- Demonic Figurine
(@Jeeves,7,21177,0,0,0), -- Symbol of Kings
(@Jeeves,8,17020,0,0,0), -- Arcane Powder
(@Jeeves,9,37201,0,0,0), -- Corpse Dust
(@Jeeves,10,5565,0,0,0), -- Infernal Stone
(@Jeeves,11,17032,0,0,0), -- Rune of Portals
(@Jeeves,12,17030,0,0,0), -- Ankh
(@Jeeves,13,17033,0,0,0), -- Symbol of Divinity
(@Jeeves,14,17031,0,0,0); -- Rune of Teleportation
-- 6542 Warlock: prevent summon spell on battkegrounds
DELETE FROM `disables` WHERE `sourceType`=0 and `entry` = 698;
INSERT INTO `disables` VALUES (0, 698, (1+16+32), "489,529,529,566", "4572,4571,3417,3418,3820", "Ritual of Summoning spell on BG");
-- 6546 Warlock: Fear - Poly - Seduction Break Spell Instantaneamente.
DELETE FROM `spell_script_names` WHERE `spell_id`=-5138 AND `ScriptName`='spell_warl_drainmana_drainlife';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(-5138,'spell_warl_drainmana_drainlife');
-- 6616 Warlock: Empowered Imp, http://www.wowhead.com/spell=47221
UPDATE `spell_proc_event` set `procFlags` = 0x00010004 WHERE `entry` = 54278;
-- 6623 Mage: Hot Steak, http://www.wowhead.com/spell=57470
UPDATE `spell_proc_event` SET `SpellFamilyMask1`=`SpellFamilyMask1`|0x00010000 WHERE `entry` IN (44445,44446,44448);
-- 6624 MythDB: Achievements: additional data for BG achievements
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (1820,1821,1822,1823,3826,3827,3828,3829,3882,5492,5493,5494,5495,5499,5500,5501,5502,5503,5507,5508,5509,5510,5511,12579,13260,13261) AND `type`!=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(1820,20,529,0), -- 30 hks in arathi
(1821,20,30,0), -- 30 hks in av
(1822,20,566,0), -- 30 hks in eots
(1823,20,489,0), -- 30 hks in wsg
(3826,5,26157,0), -- 26157
(3827,5,26272,0), -- 26272
(3828,5,26273,0), -- 26273
(3829,5,26274,0), -- 26274
(3882,5,48890,0), -- 50 Honorable Kills with the G.N.E.R.D. buff
(5492,20,0,0), -- Eastern Kingdoms
(5493,20,1,0), -- Kalimdor
(5494,20,530,0), -- Outland
(5495,20,571,0), -- Northrend
(5499,20,529,0), -- Arathi Basin
(5500,20,30,0), -- Alterac Valley
(5501,20,489,0), -- Warsong Gulch
(5502,20,566,0), -- Eye of the Storm
(5503,20,607,0), -- Strand of the Ancients
(5507,20,30,0), -- Alterac Valley Honorable Kills
(5508,20,529,0), -- Arathi Basin Honorable Kills
(5509,20,489,0), -- Warsong Gulch Honorable Kills
(5510,20,566,0), -- Eye of the Storm Honorable Kills
(5511,20,607,0), -- Strand of the Ancients Honorable Kills
(12579,20,628,0), -- 30 hks in ioc
(13260,20,628,0), -- Isle of Conquest
(13261,20,628,0); -- Isle of Conquest Honorable Kills
-- 6625 MytDB: Proffession: Inscription
UPDATE `skill_discovery_template` SET `reqSkillValue` = 0 WHERE `reqSkillValue`<=425 AND `reqSpell` = 64323;
-- 6630 Death Knight: Anti-Magic Zone, http://www.wowhead.com/spell=51052
UPDATE `creature_template` SET `modelid1` = 11686, `unit_flags` = 33554432 WHERE `modelid1` = 4590 AND `entry` = 28306;
-- 6645 NPC: Havenshire Stalion, http://www.wowhead.com/npc=28605
UPDATE `creature_template` SET `VehicleId` = '123' WHERE `entry` = 28605;
-- 6646 NPC: Acherus Deathcharger, http://www.wowhead.com/npc=28782
UPDATE `creature_template` SET `VehicleId` = '123' WHERE `entry` = 28782;
-- 6661 Druid: Omen of Clarity, http://www.wowhead.com/spell=16864
UPDATE `spell_proc_event` SET `procEx`=0x0010000 WHERE `entry` = 16864;
-- 6662 Hunter: Lock and Load, http://www.wowhead.com/spell=56453
DELETE FROM `conditions` WHERE `SourceEntry` = 56453;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`Comment`) VALUES
(17,56453,11,67544,'Lock and Load - Lock and Load Marker');
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 56453;
INSERT INTO `spell_linked_spell` VALUES
(56453,67544,0,'Lock and Load Marker');
-- 6663 Druid: Nature's Grasp, http://www.wowhead.com/spell=16689
DELETE FROM `spell_proc_event` WHERE `entry` IN (16689,16810,16811,16812,16813,17329,27009,53312);
INSERT INTO `spell_proc_event` (`entry`,`cooldown`) VALUES
(16689,2),(16810,2),(16811,2),(16812,2),(16813,2),(17329,2),(27009,2),(53312,2);
-- 6665 Paladin: Blessing of Sanctuary, http://www.wowhead.com/spell=67480
DELETE FROM `spell_dbc` WHERE `id` = 20912;
INSERT INTO `spell_dbc` (`Id`,`CastingTimeIndex`,`DurationIndex`,`RangeIndex`,`Effect1`,`EffectBasePoints1`,`EffectImplicitTargetA1`,`EffectApplyAuraName1`,`EffectMiscValue1`,`SpellFamilyName`,`Comment`) VALUES
(20912,1,21,1,6,-3,1,87,127,10,'Blessing of Sanctuary Helper (SERVERSIDE)');
UPDATE `spell_group` SET `spell_id` = 68066 WHERE `id` = 1091 AND `spell_id` = 47930;
UPDATE `spell_group` SET `spell_id` = 20912 WHERE `id` = 1092 AND `spell_id` = 20911;
-- -------------------------------------------------------------------------
-- ------------ Myth Project "World" Database "Lite" Cleaner ---------------
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
-- CONDITIONS
TRUNCATE `cleanup_data`;
INSERT IGNORE INTO `cleanup_data`(`entry1`) SELECT `entry` FROM `gossip_menu`;
 DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14, 15)
AND `SourceGroup` NOT IN (SELECT `entry1` FROM `cleanup_data`);                                                 -- Dinamic // "conditions" table 
 
DROP TABLE IF EXISTS `cleanup_data`;            -- DEPRICATED TABLE
-- -------------------------------------------------------------------------
-- -------------- Myth Project "Runtime" Console errors FIX ----------------
-- -------------------------------------------------------------------------
DELETE FROM `creature_equip_template` WHERE entry = 10000 AND equipentry1 = 0 AND equipentry2 = 0 AND equipentry3 = 0;
INSERT INTO `creature_equip_template` VALUES
('10000','0','0','0');
DELETE FROM `conditions` WHERE `SourceEntry` IN (64468, 66665);
/*
DELETE FROM gossip_scripts WHERE id = 37715;
DELETE FROM waypoint_scripts WHERE id = 70;
DELETE FROM `db_script_string` WHERE entry = 2000005175;
*/
-- -------------------------------------------------------------------------
-- ----------------- Myth Project "Anti - Cheating" System -----------------
-- -------------------------------------------------------------------------
DELETE FROM `trinity_string` WHERE `entry` IN (11002,11003);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('11002','|cffff0000[GM]:|r %s was banned by %s for %s. Reason: %s.',NULL,NULL,NULL,NULL,NULL /*'|cffff0000[GM]:|r %s ha sido baneado por %s por %s. La Razón es: %s.'*/,NULL,NULL,NULL),
('11003','|cffff0000[GM]:|r %s was banned by %s for eternity. Reason: %s.',NULL,NULL,NULL,NULL,NULL /*'|cffff0000[GM]:|r %s ha sido baneado por %s etermente. La Razón es: %s.'*/,NULL,NULL,NULL);