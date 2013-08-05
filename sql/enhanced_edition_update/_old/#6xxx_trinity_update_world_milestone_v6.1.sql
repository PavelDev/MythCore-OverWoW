-- If someone have problem with Char updates:
-- Query: SELECT guid FROM character_inventory AS a WHERE (SELECT COUNT(*) FROM character_inventory AS b WHERE a.guid = b.guid AND a.bag = b.bag AND a.slot = b.slot) > 1;
-- Trinity SQLs, unil they are not included into Next DB Release.
DELETE FROM `disables` WHERE `entry` IN (7631,7630,7629,6446,7625,7628,7626);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN(7631,7630,7629,6446,7625,7628,7626);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7631,6,4609,0, ''),
(7630,6,4609,0, ''),
(7629,7,52418,0, ''),
(6446,7,52418,0, ''),
(7626,0,0,0, ''),
(7625,11,0,0, 'achievement_bg_sa_artillery'),
(7628,11,0,0, 'achievement_bg_sa_artillery');

DELETE FROM `spell_dbc` WHERE `Id`=60937;
INSERT INTO `spell_dbc` (`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`AreaGroupId`,`SchoolMask`,`Comment`) VALUES
(60937,0,0,562036736,32,1,0,0,0,0,0,0,1,0,0,101,0,0,0,0,0,1,0,-1,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Seaforium charges damaging wall achievement credit');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_seaforium_blast';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(52408, 'spell_gen_seaforium_blast');

DELETE FROM `spell_script_names` WHERE `spell_id` IN (66862,67681);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(66862,'spell_eadric_radiance'),
(67681,'spell_eadric_radiance');

/*
-- Northrend Cloud spawns and pooling
SET @POOL := 4993; -- Set by TDB team (pool_template.entry -  need 6)
SET @GUID := 152168; -- Set by TDB team (creature.guid - need 91)

SET @Artic := 24879; -- Arctic Cloud
SET @Cinder := 32522; -- Cinder Cloud
SET @Steam := 32544; -- Steam Cloud

DELETE FROM `pool_template` WHERE `entry` BETWEEN @POOL+0 AND @POOL+5;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(@POOL+0,3, 'Arctic Cloud'),
(@POOL+1,3, 'Arctic Cloud'),
(@POOL+2,3, 'Arctic Cloud'),
(@POOL+3,4, 'Cinder Cloud'),
(@POOL+4,3, 'Steam Cloud'),
(@POOL+5,1, 'Steam Cloud');

DELETE FROM `pool_creature` WHERE (`guid` BETWEEN @GUID+0 AND @GUID+90) AND (`pool_entry` BETWEEN @POOL+0 AND @POOL+5);
INSERT INTO `pool_creature` (`guid`,`pool_entry`,`chance`,`description`) VALUES
(@GUID+0,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+1,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+2,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+3,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+4,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+5,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+6,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+7,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+8,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+9,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+10,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+11,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+12,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+13,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+14,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+15,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+16,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+17,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+18,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+19,@POOL+0,0, 'Arctic Cloud - Stormpikes'),
(@GUID+20,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+21,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+22,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+23,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+24,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+25,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+26,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+27,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+28,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+29,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+30,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+31,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+32,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+33,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+34,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+35,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+36,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+37,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+38,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+39,@POOL+1,0, 'Arctic Cloud - Dragonsblight'),
(@GUID+40,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+41,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+42,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+43,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+44,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+45,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+46,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+47,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+48,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+49,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+50,@POOL+2,0, 'Arctic Cloud - Icecrow'),
(@GUID+51,@POOL+3,0, 'Cinder Cloud'),
(@GUID+52,@POOL+3,0, 'Cinder Cloud'),
(@GUID+53,@POOL+3,0, 'Cinder Cloud'),
(@GUID+54,@POOL+3,0, 'Cinder Cloud'),
(@GUID+55,@POOL+3,0, 'Cinder Cloud'),
(@GUID+56,@POOL+3,0, 'Cinder Cloud'),
(@GUID+57,@POOL+3,0, 'Cinder Cloud'),
(@GUID+58,@POOL+3,0, 'Cinder Cloud'),
(@GUID+59,@POOL+3,0, 'Cinder Cloud'),
(@GUID+60,@POOL+3,0, 'Cinder Cloud'),
(@GUID+61,@POOL+3,0, 'Cinder Cloud'),
(@GUID+62,@POOL+3,0, 'Cinder Cloud'),
(@GUID+63,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+64,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+65,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+66,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+67,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+68,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+69,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+70,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+71,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+72,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+73,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+74,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+75,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+76,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+77,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+78,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+79,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+80,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+81,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+82,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+83,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+84,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+85,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+86,@POOL+4,0, 'Steam Cloud - Sholazar'),
(@GUID+87,@POOL+5,0, 'Steam Cloud - Borean Tundra'),
(@GUID+88,@POOL+5,0, 'Steam Cloud - Borean Tundra'),
(@GUID+89,@POOL+5,0, 'Steam Cloud - Borean Tundra'),
(@GUID+90,@POOL+5,0, 'Steam Cloud - Borean Tundra');

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (@Artic,@Cinder,@Steam));
DELETE FROM `creature` WHERE `id` IN (@Artic,@Cinder,@Steam);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,@Artic,571,1,1,0,0,8154.26,-50.2582,853.637,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+1,@Artic,571,1,1,0,0,7585.26,-292.083,1126.52,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+2,@Artic,571,1,1,0,0,8234.87,-690.383,927.345,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+3,@Artic,571,1,1,0,0,7419.3,-903.758,909.254,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+4,@Artic,571,1,1,0,0,6286.04,-576.583,424.563,2.5426,300,5,0,42,0,0,1,0,0,0),
(@GUID+5,@Artic,571,1,1,0,0,5925.67,-626.371,478.491,2.5426,300,5,0,42,0,0,1,0,0,0),
(@GUID+6,@Artic,571,1,1,0,0,6503.32,-1038.15,485.395,2.5426,300,5,0,42,0,0,1,0,0,0),
(@GUID+7,@Artic,571,1,1,0,0,6286.04,-1323.4,426.505,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+8,@Artic,571,1,1,0,0,6926.17,-2091.55,805.349,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+9,@Artic,571,1,1,0,0,6992.55,-2141.33,737.069,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+10,@Artic,571,1,1,0,0,7153.77,-2248.02,759.305,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+11,@Artic,571,1,1,0,0,7229.63,-3044.62,845.739,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+12,@Artic,571,1,1,0,0,7518.88,-3094.41,842.155,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+13,@Artic,571,1,1,0,0,7893.47,-3322.01,857.378,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+14,@Artic,571,1,1,0,0,2762.83,1406.18,131.607,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+15,@Artic,571,1,1,0,0,2845.1,1972.63,140.6,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+16,@Artic,571,1,1,0,0,3073.22,-214.625,93.7885,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+17,@Artic,571,1,1,0,0,3248.98,1187.46,134.375,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+18,@Artic,571,1,1,0,0,3260.2,-1218.52,78.6832,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+19,@Artic,571,1,1,0,0,3458.4,1804.38,75.0776,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+20,@Artic,571,1,1,0,0,3585.54,-1083.92,111.125,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+21,@Artic,571,1,1,0,0,3589.28,671.492,77.7206,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+22,@Artic,571,1,1,0,0,3611.72,-102.458,59.6765,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+23,@Artic,571,1,1,0,0,3708.95,1804.38,101.572,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+24,@Artic,571,1,1,0,0,3880.97,1187.46,55.4913,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+25,@Artic,571,1,1,0,0,4023.07,357.425,41.9114,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+26,@Artic,571,1,1,0,0,4116.56,26.5337,52.568,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+27,@Artic,571,1,1,0,0,4307.28,-820.325,147.814,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+28,@Artic,571,1,1,0,0,4486.78,-242.667,90.8629,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+29,@Artic,571,1,1,0,0,4561.57,-1280.21,159.549,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+30,@Artic,571,1,1,0,0,4576.53,1630.52,286.716,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+31,@Artic,571,1,1,0,0,4815.86,-309.966,229.377,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+32,@Artic,571,1,1,0,0,4924.31,845.35,178.601,0.00340319,300,5,0,42,0,0,1,0,0,0),
(@GUID+33,@Artic,571,1,1,0,0,5122.51,1047.25,223.784,3.4733,300,5,0,42,0,0,1,0,0,0),
(@GUID+34,@Artic,571,1,1,0,0,6019.36,2383.58,518.105,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+35,@Artic,571,1,1,0,0,6144.8,1580.92,620.674,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+36,@Artic,571,1,1,0,0,6393.17,-211.808,678.76,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+37,@Artic,571,1,1,0,0,6504.39,1474.31,437.27,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+38,@Artic,571,1,1,0,0,6717.53,184.454,626.635,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+39,@Artic,571,1,1,0,0,6845.56,-789.958,731.38,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+40,@Artic,571,1,1,0,0,7064.68,2860.17,418.75,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+41,@Artic,571,1,1,0,0,7273.74,721.812,482.114,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+42,@Artic,571,1,1,0,0,7390.81,1806.67,433.04,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+43,@Artic,571,1,1,0,0,7518.88,77.7668,801.405,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+44,@Artic,571,1,1,0,0,7670.96,2966.77,531.154,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+45,@Artic,571,1,1,0,0,7679.32,797.062,479.98,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+46,@Artic,571,1,1,0,0,7718.02,42.2043,1021.67,6.10438,300,5,0,42,0,0,1,0,0,0),
(@GUID+47,@Artic,571,1,1,0,0,7984.55,1568.38,460.722,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+48,@Artic,571,1,1,0,0,8016.75,-2916.6,1137.52,3.31622,300,5,0,42,0,0,1,0,0,0),
(@GUID+49,@Artic,571,1,1,0,0,8227.06,3280.31,655.771,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+50,@Artic,571,1,1,0,0,8306.51,960.104,582.006,4.83412,300,5,0,42,0,0,1,0,0,0),
(@GUID+51,@Cinder,571,1,1,0,0,4311.02,1495.92,133.764,1.42942,300,5,0,42,0,0,1,0,0,0),
(@GUID+52,@Cinder,571,1,1,0,0,4347.75,1395.21,134.203,1.42942,300,5,0,42,0,0,1,0,0,0),
(@GUID+53,@Cinder,571,1,1,0,0,4393.29,1490.31,123.673,4.82626,300,5,0,42,0,0,1,0,0,0),
(@GUID+54,@Cinder,571,1,1,0,0,4408.25,1406.18,132.796,4.82626,300,5,0,42,0,0,1,0,0,0),
(@GUID+55,@Cinder,571,1,1,0,0,6419.15,4981.92,-69.5219,1.81657,300,5,0,42,0,0,1,0,0,0),
(@GUID+56,@Cinder,571,1,1,0,0,6488.85,4942.72,-57.9343,1.81657,300,5,0,42,0,0,1,0,0,0),
(@GUID+57,@Cinder,571,1,1,0,0,6517.9,4859.95,-52.7975,1.81657,300,5,0,42,0,0,1,0,0,0),
(@GUID+58,@Cinder,571,1,1,0,0,4217.27,1770.67,352.922,6.2282,300,5,0,42,0,0,1,0,0,0),
(@GUID+59,@Cinder,571,1,1,0,0,4235.12,1883.72,355.337,6.2282,300,5,0,42,0,0,1,0,0,0),
(@GUID+60,@Cinder,571,1,1,0,0,4330.32,1723.07,366.032,6.2282,300,5,0,42,0,0,1,0,0,0),
(@GUID+61,@Cinder,571,1,1,0,0,4342.22,1868.84,356.522,6.2282,300,5,0,42,0,0,1,0,0,0),
(@GUID+62,@Cinder,571,1,1,0,0,4375.93,1782.57,356.84,6.2282,300,5,0,42,0,0,1,0,0,0),
(@GUID+63,@Steam,571,1,1,0,0,3452.67,4685.5,-12.9957,2.27993,300,5,0,4979,0,0,1,0,0,0),
(@GUID+64,@Steam,571,1,1,0,0,3698.67,4904.56,-13.6717,2.27993,300,5,0,4979,0,0,1,0,0,0),
(@GUID+65,@Steam,571,1,1,0,0,4033.07,4524.1,-1.63039,2.27993,300,5,0,4979,0,0,1,0,0,0),
(@GUID+66,@Steam,571,1,1,0,0,4079.2,5089.02,-1.50956,2.27993,300,5,0,4979,0,0,1,0,0,0),
(@GUID+67,@Steam,571,1,1,0,0,4740.55,5008.06,-55.5771,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+68,@Steam,571,1,1,0,0,4920.89,4070.89,-17.9628,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+69,@Steam,571,1,1,0,0,5112.28,5953.37,-61.9079,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+70,@Steam,571,1,1,0,0,5152.94,3810.09,-7.13058,0.803393,300,5,0,4979,0,0,1,0,0,0),
(@GUID+71,@Steam,571,1,1,0,0,5158.75,4184.73,-88.1236,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+72,@Steam,571,1,1,0,0,5179.07,5739.91,-83.8105,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+73,@Steam,571,1,1,0,0,5248.77,4707.48,-133.847,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+74,@Steam,571,1,1,0,0,5254.58,5008.06,-135.353,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+75,@Steam,571,1,1,0,0,5376.56,4433.04,-135.251,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+76,@Steam,571,1,1,0,0,5393.98,5940.3,-49.8372,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+77,@Steam,571,1,1,0,0,5501.44,3609.7,-17.8316,0.803393,300,5,0,4979,0,0,1,0,0,0),
(@GUID+78,@Steam,571,1,1,0,0,5585.66,3810.09,-15.5887,0.504939,300,5,0,4979,0,0,1,0,0,0),
(@GUID+79,@Steam,571,1,1,0,0,5588.23,3643.99,-23.6778,0.504939,300,5,0,4979,0,0,1,0,0,0),
(@GUID+80,@Steam,571,1,1,0,0,5608.89,6005.64,-39.6709,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+81,@Steam,571,1,1,0,0,5788.95,5744.27,-69.0541,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+82,@Steam,571,1,1,0,0,5817.99,4171.66,-101.138,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+83,@Steam,571,1,1,0,0,5931.25,4820.74,-110.276,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+84,@Steam,571,1,1,0,0,5980.62,4337.2,-85.2827,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+85,@Steam,571,1,1,0,0,6131.64,4568.08,-91.79,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+86,@Steam,571,1,1,0,0,6149.07,4297.99,-56.5222,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+87,@Steam,571,1,1,0,0,6231,5577.32,-27.9032,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+88,@Steam,571,1,1,0,0,6346.55,4258.79,-47.6791,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+89,@Steam,571,1,1,0,0,6436.58,5360.92,-33.6846,5.40584,300,5,0,4979,0,0,1,0,0,0),
(@GUID+90,@Steam,571,1,1,0,0,6459.81,4520.2,-62.7745,5.40584,300,5,0,4979,0,0,1,0,0,0);
*/

-- Biohazard
DELETE FROM `creature` WHERE `id`=21789; -- Nakansi / Shadowmoon Valley
INSERT INTO creature (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(null,21789,530,1,1,0,0,-2741.8,2719.07,123.584,0.603481,600,0,0,34930,0,0,0);

-- Tome
DELETE FROM `gameobject` WHERE `id`=187987; -- South Point Station Valve
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES 
(null,187987,571,1,1,3791.704,4808.966,-11.5618,1.483528,0,0,0.6755896,0.7372779,0,0,0);

-- Nay
UPDATE `creature_template` SET /*`npcflag`=`npcflag`|16777216,*/`speed_walk`=2.8 WHERE `entry`=30123; -- Snorri needs spellclick data
-- UPDATE `creature_template` SET `npcflag`=`npcflag`|16777216 WHERE `entry`=30272; -- Njorndar Proto-Drake needs spellclick data
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|32768,`speed_walk`=1.444444 WHERE `entry`=30500; -- Argent Skytalon
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070; -- Argent Skytalon
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`speed_walk`=1.2 WHERE `entry`=32370; -- Refurbished Demolisher
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`unit_flags`=`unit_flags`|8,`speed_walk`=1.2,`vehicleid`=512 WHERE `entry`=31830; -- Refurbished Demolisher
UPDATE `creature_template` SET `npcflag`=`npcflag`|16777216,`speed_run`=1.3857142857143 WHERE `entry`=34125; -- Stabled Campaign Warhorse
UPDATE `creature_template` SET `baseattacktime`=2000,`unit_flags`=`unit_flags`|16400,`unit_class`=4,`speed_run`=1 WHERE `entry` IN (36839/*,35427*/); -- Horde Gunship Cannon, Horde Gunship Cannon (1)
UPDATE `creature_template` SET `baseattacktime`=2000,/*`npcflag`=`npcflag`|16777216,*/`speed_run`=1.1428571428571 WHERE `entry`=37945; -- Dream Portal needs spellclick data
UPDATE `creature_template` SET `exp`=2,`minlevel`=80,`maxlevel`=80,`baseattacktime`=2000,/*`npcflag`=`npcflag`|16777216,*/`speed_run`=1.1428571428571 WHERE `entry`=38186; -- Dream Portal (Pre-effect)  needs spellclick data

UPDATE `creature_model_info` SET `bounding_radius`=3,`combat_reach`=2.25,`gender`=2 WHERE `modelid`=25092; -- Refurbished Demolisher
UPDATE `creature_model_info` SET `bounding_radius`=0.248,`combat_reach`=4.8,`gender`=0 WHERE `modelid`=26772; -- Snorri
UPDATE `creature_model_info` SET `bounding_radius`=1.085,`combat_reach`=3.5,`gender`=2 WHERE `modelid`=27703; -- Geargrinder's Jumpbot
UPDATE `creature_model_info` SET `bounding_radius`=3,`combat_reach`=2.25,`gender`=2 WHERE `modelid`=25092; -- Refurbished Demolisher
UPDATE `creature_model_info` SET `bounding_radius`=1.9,`combat_reach`=0,`gender`=2 WHERE `modelid`=29489; -- Horde Gunship Cannon
UPDATE `creature_model_info` SET `bounding_radius`=0.5,`combat_reach`=1,`gender`=2 WHERE `modelid`=30844; -- Dream Portal
UPDATE `creature_model_info` SET `bounding_radius`=0.5,`combat_reach`=1,`gender`=2 WHERE `modelid`=30844; -- Dream Portal (Pre-effect)

DELETE FROM `creature_template_addon` WHERE `entry` IN (30123,30272,31070,31736,31770,32370,31830,36839,37945,38186);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(30123,0,0,1,0, '61208 0'), -- Snorri; Aura: Fjorn's Anvil - Quest Invisibility 3
(30272,0,0,1,0, NULL), -- Njorndar Proto-Drake
(31070,0,0,1,0, NULL), -- Argent Skytalon
(31736,0,0,1,0, NULL), -- Geargrinder's Jumpbot
(31770,0,0,1,0, NULL), -- Thunderbomb's Jumpbot
(32370,0,65536,1,0, '49414 0'), -- Refurbished Demolisher; Auras: Generic Quest Invisibility 1
(31830,0,0,1,0, NULL), -- Refurbished Demolisher
(36839,0,0,1,0, '69470 0 69470 1'), -- Horde Gunship Cannon; Aura: Heat Drain
(37945,0,0,1,0, NULL), -- Dream Portal
(38186,0,0,1,0, NULL); -- Dream Portal (Pre-effect)


DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry`=13846;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`Comment`) VALUES
(19,0,13846,1,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,1,5,1106,0,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hated'),
(19,0,13846,2,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,2,5,1106,0,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hated'),
(19,0,13846,3,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,3,5,1106,1,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hostile'),
(19,0,13846,4,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,4,5,1106,1,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hostile'),
(19,0,13846,5,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,5,5,1106,2,0,'Quest Contributin'' To The Cause - Requires Argent Crusade unfriendly'),
(19,0,13846,6,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,6,5,1106,2,0,'Quest Contributin'' To The Cause - Requires Argent Crusade unfriendly'),
(19,0,13846,7,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,7,5,1106,3,0,'Quest Contributin'' To The Cause - Requires Argent Crusade neutral'),
(19,0,13846,8,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,8,5,1106,3,0,'Quest Contributin'' To The Cause - Requires Argent Crusade neutral'),
(19,0,13846,9,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,9,5,1106,4,0,'Quest Contributin'' To The Cause - Requires Argent Crusade friendly'),
(19,0,13846,10,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,10,5,1106,4,0,'Quest Contributin'' To The Cause - Requires Argent Crusade friendly'),
(19,0,13846,11,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,11,5,1106,5,0,'Quest Contributin'' To The Cause - Requires Argent Crusade honored'),
(19,0,13846,12,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,12,5,1106,5,0,'Quest Contributin'' To The Cause - Requires Argent Crusade honored'),
(19,0,13846,13,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(19,0,13846,13,5,1106,6,0,'Quest Contributin'' To The Cause - Requires Argent Crusade revered'),
(19,0,13846,14,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(19,0,13846,14,5,1106,6,0,'Quest Contributin'' To The Cause - Requires Argent Crusade revered'),
(20,0,13846,1,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,1,5,1106,0,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hated'),
(20,0,13846,2,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,2,5,1106,0,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hated'),
(20,0,13846,3,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,3,5,1106,1,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hostile'),
(20,0,13846,4,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,4,5,1106,1,0,'Quest Contributin'' To The Cause - Requires Argent Crusade hostile'),
(20,0,13846,5,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,5,5,1106,2,0,'Quest Contributin'' To The Cause - Requires Argent Crusade unfriendly'),
(20,0,13846,6,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,6,5,1106,2,0,'Quest Contributin'' To The Cause - Requires Argent Crusade unfriendly'),
(20,0,13846,7,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,7,5,1106,3,0,'Quest Contributin'' To The Cause - Requires Argent Crusade neutral'),
(20,0,13846,8,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,8,5,1106,3,0,'Quest Contributin'' To The Cause - Requires Argent Crusade neutral'),
(20,0,13846,9,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,9,5,1106,4,0,'Quest Contributin'' To The Cause - Requires Argent Crusade friendly'),
(20,0,13846,10,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,10,5,1106,4,0,'Quest Contributin'' To The Cause - Requires Argent Crusade friendly'),
(20,0,13846,11,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,11,5,1106,5,0,'Quest Contributin'' To The Cause - Requires Argent Crusade honored'),
(20,0,13846,12,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,12,5,1106,5,0,'Quest Contributin'' To The Cause - Requires Argent Crusade honored'),
(20,0,13846,13,8,13700,0,0,'Quest Contributin'' To The Cause - Requires quest Alliance Champion Marker'),
(20,0,13846,13,5,1106,6,0,'Quest Contributin'' To The Cause - Requires Argent Crusade revered'),
(20,0,13846,14,8,13701,0,0,'Quest Contributin'' To The Cause - Requires quest Horde Champion Marker'),
(20,0,13846,14,5,1106,6,0,'Quest Contributin'' To The Cause - Requires Argent Crusade revered');


-- Gossip Menu insert
DELETE FROM `gossip_menu` WHERE `entry`=7303 AND `text_id`=8662;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7303,8662);
DELETE FROM `gossip_menu` WHERE `entry`=7380 AND `text_id`=8835;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7380,8835);
DELETE FROM `gossip_menu` WHERE `entry`=7424 AND `text_id`=8973;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7424,8973);
DELETE FROM `gossip_menu` WHERE `entry`=7423 AND `text_id`=8972;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7423,8972);
DELETE FROM `gossip_menu` WHERE `entry`=7425 AND `text_id`=8974;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7425,8974);
DELETE FROM `gossip_menu` WHERE `entry`=11910 AND `text_id`=16726;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11910,16726);
DELETE FROM `gossip_menu` WHERE `entry`=5729 AND `text_id`=6896;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5729,6896);
DELETE FROM `gossip_menu` WHERE `entry`=5728 AND `text_id`=6897;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5728,6897);
DELETE FROM `gossip_menu` WHERE `entry`=5727 AND `text_id`=6898;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5727,6898);
DELETE FROM `gossip_menu` WHERE `entry`=5726 AND `text_id`=6899;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5726,6899);
DELETE FROM `gossip_menu` WHERE `entry`=5725 AND `text_id`=6900;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5725,6900);
DELETE FROM `gossip_menu` WHERE `entry`=5724 AND `text_id`=6901;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5724,6901);
DELETE FROM `gossip_menu` WHERE `entry`=5723 AND `text_id`=6902;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5723,6902);
DELETE FROM `gossip_menu` WHERE `entry`=5737 AND `text_id`=6911;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5737,6911);
DELETE FROM `gossip_menu` WHERE `entry`=7084 AND `text_id`=8336;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7084,8336);
DELETE FROM `gossip_menu` WHERE `entry`=5748 AND `text_id`=6927;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5748,6927);
DELETE FROM `gossip_menu` WHERE `entry`=5756 AND `text_id`=6940;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5756,6940);
DELETE FROM `gossip_menu` WHERE `entry`=5743 AND `text_id`=6919;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5743,6919);
DELETE FROM `gossip_menu` WHERE `entry`=5747 AND `text_id`=6925;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5747,6925);
DELETE FROM `gossip_menu` WHERE `entry`=5755 AND `text_id`=6939;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5755,6939);
DELETE FROM `gossip_menu` WHERE `entry`=10026 AND `text_id`=13902;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10026,13902);
DELETE FROM `gossip_menu` WHERE `entry`=9750 AND `text_id`=13375;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9750,13375);
DELETE FROM `gossip_menu` WHERE `entry`=7522 AND `text_id`=9122;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7522,9122);
DELETE FROM `gossip_menu` WHERE `entry`=9162 AND `text_id`=12756;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9162,12756);
DELETE FROM `gossip_menu` WHERE `entry`=9162 AND `text_id`=12417;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9162,12417);
DELETE FROM `gossip_menu` WHERE `entry`=9164 AND `text_id`=12422;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9164,12422);
DELETE FROM `gossip_menu` WHERE `entry`=9166 AND `text_id`=12424;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9166,12424);
DELETE FROM `gossip_menu` WHERE `entry`=9167 AND `text_id`=12426;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9167,12426);
DELETE FROM `gossip_menu` WHERE `entry`=9144 AND `text_id`=12373;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9144,12373);
DELETE FROM `gossip_menu` WHERE `entry`=9164 AND `text_id`=12422;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9164,12422);
DELETE FROM `gossip_menu` WHERE `entry`=9166 AND `text_id`=12424;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9166,12424);
DELETE FROM `gossip_menu` WHERE `entry`=21230 AND `text_id`=1237;
DELETE FROM `gossip_menu` WHERE `entry`=687 AND `text_id`=1237;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (687,1237);
DELETE FROM `gossip_menu` WHERE `entry`=689 AND `text_id`=1239;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (689,1239);
DELETE FROM `gossip_menu` WHERE `entry`=690 AND `text_id`=1240;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (690,1240);
DELETE FROM `gossip_menu` WHERE `entry`=701 AND `text_id`=1253;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (701,1253);
DELETE FROM `gossip_menu` WHERE `entry`=703 AND `text_id`=1255;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (703,1255);
DELETE FROM `gossip_menu` WHERE `entry`=10990 AND `text_id`=15282;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10990,15282);
DELETE FROM `gossip_menu` WHERE `entry`=10929 AND `text_id`=15188;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10929,15188);
DELETE FROM `gossip_menu` WHERE `entry`=10945 AND `text_id`=15209;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10945,15209);
DELETE FROM `gossip_menu` WHERE `entry`=10946 AND `text_id`=15210;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10946,15210);
DELETE FROM `gossip_menu` WHERE `entry`=10947 AND `text_id`=15211;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10947,15211);
DELETE FROM `gossip_menu` WHERE `entry`=9554 AND `text_id`=12869;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9554,12869);
DELETE FROM `gossip_menu` WHERE `entry`=10400 AND `text_id`=14455;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10400,14455);
DELETE FROM `gossip_menu` WHERE `entry`=10340 AND `text_id`=14408;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10340,14408);
DELETE FROM `gossip_menu` WHERE `entry`=10440 AND `text_id`=14476;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10440,14476);
DELETE FROM `gossip_menu` WHERE `entry`=9550 AND `text_id`=12865;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9550,12865);
DELETE FROM `gossip_menu` WHERE `entry`=9555 AND `text_id`=12868;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9555,12868);
DELETE FROM `gossip_menu` WHERE `entry`=9557 AND `text_id`=12871;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9557,12871);

-- Creature Gossip_menu_id Update
UPDATE `creature_template` SET `gossip_menu_id`=7303 WHERE `entry`=16554;
UPDATE `creature_template` SET `gossip_menu_id`=5729 WHERE `entry`=14358;
UPDATE `creature_template` SET `gossip_menu_id`=5737 WHERE `entry`=14369;
UPDATE `creature_template` SET `gossip_menu_id`=7084 WHERE `entry`=16032;
UPDATE `creature_template` SET `gossip_menu_id`=5748 WHERE `entry`=14383;
UPDATE `creature_template` SET `gossip_menu_id`=5756 WHERE `entry`=14382;
UPDATE `creature_template` SET `gossip_menu_id`=5747 WHERE `entry`=14368;
UPDATE `creature_template` SET `gossip_menu_id`=5755 WHERE `entry`=14381;
UPDATE `creature_template` SET `gossip_menu_id`=10026 WHERE `entry`=31085;
UPDATE `creature_template` SET `gossip_menu_id`=9740 WHERE `entry`=28082;
UPDATE `creature_template` SET `gossip_menu_id`=9741 WHERE `entry`=28138;
UPDATE `creature_template` SET `gossip_menu_id`=9162 WHERE `entry`=25459;
UPDATE `creature_template` SET `gossip_menu_id`=9164 WHERE `entry`=25475;
UPDATE `creature_template` SET `gossip_menu_id`=9166 WHERE `entry`=25476;
UPDATE `creature_template` SET `gossip_menu_id`=9167 WHERE `entry`=25503;
UPDATE `creature_template` SET `gossip_menu_id`=9144 WHERE `entry`=25237;
UPDATE `creature_template` SET `gossip_menu_id`=9164 WHERE `entry`=25475;
UPDATE `creature_template` SET `gossip_menu_id`=9166 WHERE `entry`=25476;
UPDATE `creature_template` SET `gossip_menu_id`=10990 WHERE `entry`=37671;/*
UPDATE `creature_template` SET `gossip_menu_id`=10929 WHERE `entry`=37715;*/
UPDATE `creature_template` SET `gossip_menu_id`=9549 WHERE `entry`=27810;
UPDATE `creature_template` SET `gossip_menu_id`=10948 WHERE `entry`=37887;
UPDATE `creature_template` SET `gossip_menu_id`=10948 WHERE `entry`=38041;
UPDATE `creature_template` SET `gossip_menu_id`=10948 WHERE `entry`=38040;
UPDATE `creature_template` SET `gossip_menu_id`=10948 WHERE `entry`=38039;
UPDATE `creature_template` SET `gossip_menu_id`=10470 WHERE `entry`=33382;
UPDATE `creature_template` SET `gossip_menu_id`=10400 WHERE `entry`=33972;
UPDATE `creature_template` SET `gossip_menu_id`=10340 WHERE `entry`=33447;
UPDATE `creature_template` SET `gossip_menu_id`=9550 WHERE `entry`=27495;

UPDATE `creature_template` SET `gossip_menu_id`=687 WHERE `gossip_menu_id`=21230;

-- Creature Gossip_menu_option Update
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7368) AND `id` IN (1,2);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7370,5729,5728,5727,5726,5725,5724,5723,7522,9162) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9550,9555) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (10340) AND `id` IN (1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (10976,10929,10945,10946) AND `id` IN (0);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(7368,1,0, 'Acteon, where is the best area to hunt for moongraze stags?',1,1,7423,0,0,0,0, ''),
(7368,2,0, 'Acteon, where is the best place to hunt moongraze bucks?',1,1,7424,0,0,0,0, ''),
(7370,0,0, 'Where can I find more infected nightstalker runts, Exarch?',1,1,7425,0,0,0,0, ''),
(5729,0,0, 'What happened here, spirit?',1,1,5728,0,0,0,0, ''),
(5728,0,0, 'I know very little of the Highborne and nothing of the Shen''dralar.',1,1,5727,0,0,0,0, ''),
(5727,0,0, 'Continue, please.',1,1,5726,0,0,0,0, ''),
(5726,0,0, 'Fascinating. Continue, please.',1,1,5725,0,0,0,0, ''),
(5725,0,0, 'I''m going to have to kill something, aren''t I?',1,1,5724,0,0,0,0, ''),
(5724,0,0, 'We live in a world of endless tragedy.',1,1,5723,0,0,0,0, ''),
(5723,0,0, 'A very sad tale. Thank you, spirit.',1,1,0,0,0,0,0, ''),
(7522,0,3, 'Teach me the ways of the spirits.',5,16,0,0,0,0,0, ''),
(9162,0,0, 'Send me to Garrosh''s Landing, Yanni.',1,1,0,0,0,0,0, ''),
(10976,0,0, 'I need another disguise.',1,1,0,0,0,0,0, ''),
(10929,0,0, 'I have a rocket here with your mark on it, Snivel.',1,1,10945,0,0,0,0, ''),
(10945,0,0, 'There''s a chemical inside the rocket. What is it?',1,1,10946,0,0,0,0, ''),
(10946,0,0, 'Where were they delivered?',1,1,10947,0,0,0,0, ''),
(9550,0,0, 'Why would I want to ride a shredder?',1,1,9555,0,0,0,0, ''),
(9555,0,0, 'Where can I get a Refurbished Shredder Key?',1,1,9557,0,0,0,0, ''),
(10340,1,0, 'How do the Argent Crusade riders fight?',1,1,10440,0,0,0,0, '');
/*
DELETE FROM `npc_text` WHERE `ID` IN (16540,8336,16726) AND `WDBVerified`=-1;
INSERT INTO `npc_text` (`ID`,`text0_0`,`WDBVerified`) VALUES
(16540, '[PH]', -1),
(8336, '[PH]', -1),
(16726, '[PH]', -1);*/


SET @EquiEntry = 2439; -- Need 1 slot

-- Stormwind npcs
UPDATE `creature_template` SET `exp`=1,`minlevel`=65,`maxlevel`=65,`npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|32768,`speed_run`=1.1428571428571 WHERE `entry`=34075; -- Captain Dirgehammer
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|32768,`speed_run`=1.1428571428571 WHERE `entry`=12778; -- Lieutenant Rachel Vaccar
UPDATE `creature_template` SET `minlevel`=75,`maxlevel`=75,`npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|32768,`equipment_id`=@EquiEntry,`speed_run`=1.1428571428571 WHERE `entry`=34078; -- Lieutenant Tristia
UPDATE `creature_template` SET `exp`=1,`minlevel`=65,`maxlevel`=65,`npcflag`=`npcflag`|128,`unit_flags`=`unit_flags`|32768,`speed_run`=1.1428571428571 WHERE `entry`=34081; -- Captain O'Neal
UPDATE `creature_template` SET `faction_A`=123,`faction_H`=123,`exp`=2,`minlevel`=75,`maxlevel`=75,`baseattacktime`=2000,`npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|32768,`equipment_id`=188,`speed_run`=1.1428571428571 WHERE `entry`=40607; -- Knight-Lieutenant T'Maire Sydes
UPDATE `creature_template` SET `baseattacktime`=2000,`speed_run`=2.8571428571429,`InhabitType`=5 WHERE `entry`=32180; -- Tempus Wyrm
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33554432,`unit_class`=2,`speed_walk`=4,`speed_run`=2.8571428571429,`InhabitType`=7 WHERE `entry`=34381; -- [DND]Northrend Children's Week Trigger
UPDATE `creature_template` SET `speed_walk`=4,`speed_run`=2.8571428571429,`InhabitType`=5 WHERE `entry`=27925; -- Nozdormu
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|256,`speed_run`=2.8571428571429,`InhabitType`=5 WHERE `entry`=32185; -- Infinite Eradicator
UPDATE `creature_template` SET `faction_A`=2141,`faction_H`=2141,`exp`=2,`speed_run`=1.1428571428571 WHERE `entry`=32331; -- Past You  ???
UPDATE `creature_template` SET `faction_A`=2111,`faction_H`=2111,`unit_flags`=`unit_flags`|34816,`speed_run`=1.1428571428571 WHERE `entry`=27896; -- Infinite Assailant
UPDATE `creature_template` SET `faction_A`=2111,`faction_H`=2111,`unit_flags`=`unit_flags`|559104,`speed_run`=1.1428571428571 WHERE `entry`=27897; -- Infinite Destroyer
UPDATE `creature_template` SET `exp`=2,`speed_run`=1 WHERE `entry`=32327; -- Hourglass of Eternity
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=2 WHERE `entry`=26841; -- Reanimated Frost Wyrm
UPDATE `creature_template` SET `faction_A`=35,`faction_H`=35,`unit_flags`=`unit_flags`|33556488,`flags_extra`=`flags_extra`|128 WHERE `entry`=28306; -- Anti-Magic Zone

UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1.5,`gender`=1 WHERE `modelid`=31953; -- Knight-Lieutenant T'Maire Sydes
UPDATE `creature_model_info` SET `bounding_radius`=0.3,`combat_reach`=1,`gender`=0 WHERE `modelid`=27814; -- Infinite Eradicator
UPDATE `creature_model_info` SET `bounding_radius`=3.5,`combat_reach`=3,`gender`=2 WHERE `modelid`=24934; -- Nozdormu
UPDATE `creature_model_info` SET `bounding_radius`=0.5,`combat_reach`=1,`gender`=2 WHERE `modelid`=11686; -- [DND]Northrend Children's Week Trigger
UPDATE `creature_model_info` SET `bounding_radius`=0.3,`combat_reach`=1,`gender`=0 WHERE `modelid`=27813; -- Infinite Timebreaker
UPDATE `creature_model_info` SET `bounding_radius`=0.5,`combat_reach`=1,`gender`=2 WHERE `modelid`=11686; -- Past You
UPDATE `creature_model_info` SET `bounding_radius`=0.3,`combat_reach`=2.5,`gender`=0 WHERE `modelid`=20512; -- Infinite Destroyer
UPDATE `creature_model_info` SET `bounding_radius`=0.375,`combat_reach`=1.25,`gender`=0 WHERE `modelid`=19062; -- Infinite Assailant

UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=256,`auras`= '5301 0' WHERE `entry`=12778; -- Lieutenant Rachel Vaccar
UPDATE `creature_template_addon` SET `bytes2`=258 WHERE `entry`=12780; -- Sergeant Major Skyshadow
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=256,`auras`= '5301 0' WHERE `entry`=19848; -- Harbinger Ennarth
UPDATE `creature_template_addon` SET `bytes2`=256 WHERE `entry`=12779; -- Archmage Gaiman

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (31257,26426,32186,26841));
DELETE FROM `creature_template_addon` WHERE `entry` IN (34075,34081,40607,34078,28306);
DELETE FROM `creature_template_addon` WHERE `entry` IN (26426,27925,32186,32180,32185,32327,26841);
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`auras`) VALUES
(34075,0,257, '5301 0'), -- Captain Dirgehammer
(34081,0,257, NULL), -- Captain O'Neal
(40607,0,257, NULL), -- Knight-Lieutenant T'Maire Sydes
(34078,0,257, '5301 0'), -- Lieutenant Tristia
(26426,0,1, '47015 0'), -- Arctic Ram
(27925,50397184,1, '50013 0'),
(32186,50331648,1, '4368 0'), -- Infinite Timebreaker
(32180,50331648,1, '4368 0'), -- Tempus Wyrm
(32185,50331648,1, '4368 0'), -- Infinite Eradicator
(32327,0,1, '50057 0 50867 0'), -- Hourglass of Eternity
(26841,50331648,1, NULL), -- Reanimated Frost Wyrm
(28306,0,257, NULL); -- Anti-Magic Zone

DELETE FROM `creature_equip_template` WHERE `entry`=@EquiEntry;
INSERT INTO `creature_equip_template` (`entry`,`equipentry1`,`equipentry2`,`equipentry3`) VALUES
(@EquiEntry,34520,29638,0); -- Equipment of 34078 (Lieutenant Tristia)

-- 5302, triggered by 5301 is missing from spell_dbc. Data from 1.1.2 spell_dbc
DELETE FROM `spell_dbc` WHERE `Id`=5302;
INSERT INTO `spell_dbc` (`Id`,`Attributes`,`AttributesEx`,`CastingTimeIndex`,`ProcChance`,`DurationIndex`,`RangeIndex`,`EquippedItemClass`,`Effect1`,`EffectImplicitTargetA1`,`EffectApplyAuraName1`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`Comment`) VALUES
(5302,536871312,1024,1,101,28,1,-1,6,1,4,1,1,1, 'Defensive State - Follows a successful block,dodge or parry.');

-- Update info for spell 3617 found in earlier patches dbc
UPDATE `spell_dbc` SET `Attributes`=256,`CastingTimeIndex`=1,`ProcChance`=101,`SpellLevel`=45,`RangeIndex`=1,`Effect1`=1,`EffectDieSides1`=1,`EffectBasePoints1`=1,`EffectImplicitTargetA1`=1,`DmgMultiplier1`=1,`DmgMultiplier2`=1,`DmgMultiplier3`=1 WHERE `id`=3617;
-- Update info for spell 7056 found in earlier patches dbc
UPDATE `spell_dbc` SET `Attributes`=336,`CastingTimeIndex`=1,`ProcChance`=101,`DurationIndex`=21,`RangeIndex`=1,`Effect1`=6,`EffectImplicitTargetA1`=1,`EffectApplyAuraName1`=25,`DmgMultiplier2`=1,`DmgMultiplier2`=1,`DmgMultiplier3`=1,`Comment`= 'Pacified' WHERE `id`=7056;

-- Spawn Nozdormu (Remember to set guid)
DELETE FROM `creature` WHERE `id`=27925;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(152260,27925,571,1,1,0,0,4112.988,-417.6215,191.0509,1.727876,300,0,0,1,0,0,0,0,0,0);

DELETE FROM `script_texts` WHERE `npc_entry`=0 AND `entry`=-1000187;

UPDATE `creature_template` SET `ScriptName`='' WHERE `entry` IN (6172,6177); -- Henze Faulk & Narm Faulk

-- SAI for Henze Faulk
SET @ENTRY := 6172;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
-- AI
(@ENTRY,0,0,1,11,0,100,0,0,0,0,0,11,29266,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - On spawn - add aura'),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - Script - set npcflags'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - On spawn - set phase 1'),
(@ENTRY,0,3,0,8,1,100,0,8593,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - On spellhit - run script (phase 1)'),
-- Script
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - Script - set phase 0'),
(@ENTRY*100,9,1,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Henze Faulk - Script - turn to player'),
(@ENTRY*100,9,2,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Henze Faulk - Script - say text'),
(@ENTRY*100,9,3,0,0,0,100,0,1500,1500,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - Script - set npcflags'),
(@ENTRY*100,9,4,0,0,0,100,0,120000,120000,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Henze Faulk - Script - evade (reset script)');
-- NPC talk text insert
DELETE FROM `creature_text` WHERE `entry`=@ENTRY; 
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0, 'Thank you, dear $C, you just saved my life.',0,7,100,1,0,0, 'Henze Faulk');
-- Scripting cleanup
UPDATE `creature_template` SET `ScriptName`= '',`RegenHealth`=0 WHERE `entry`=@ENTRY;
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=@ENTRY;

-- SAI for Narm Faulk
SET @ENTRY := 6177;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
-- AI
(@ENTRY,0,0,1,11,0,100,0,0,0,0,0,11,29266,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - On spawn - add aura'),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - Script - set npcflags'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - On spawn - set phase 1'),
(@ENTRY,0,3,0,8,1,100,0,8593,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - On spellhit - run script (phase 1)'),
-- Script
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - Script - set phase 0'),
(@ENTRY*100,9,1,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Narm Faulk - Script - turn to player'),
(@ENTRY*100,9,2,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Narm Faulk - Script - say text'),
(@ENTRY*100,9,3,0,0,0,100,0,1500,1500,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - Script - set npcflags'),
(@ENTRY*100,9,4,0,0,0,100,0,120000,120000,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Narm Faulk - Script - evade (reset script)');
-- NPC talk text insert
DELETE FROM `creature_text` WHERE `entry`=@ENTRY; 
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0, 'Thank you, dear $C, you just saved my life.',0,7,100,1,0,0, 'Narm Faulk');
-- Scripting cleanup
UPDATE `creature_template` SET `ScriptName`= '',`RegenHealth`=0 WHERE `entry`=@ENTRY;
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=@ENTRY;

-- SAI for Fhyron Shadesong
SET @ENTRY := 33788;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=8570.943,`position_y`=1008.467,`position_z`=548.2927 WHERE `guid`=85201;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - On spawn - Start WP movement'),
(@ENTRY,0,1,0,40,0,100,0,8,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 8 - run script'),
(@ENTRY,0,2,0,40,0,100,0,10,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 10 - run script'),
(@ENTRY,0,3,0,40,0,100,0,12,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 12 - run script'),
(@ENTRY,0,4,0,40,0,100,0,14,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 14 - run script'),
(@ENTRY,0,5,0,40,0,100,0,15,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 15 - run script'),
(@ENTRY,0,6,0,40,0,100,0,17,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 17 - run script'),
(@ENTRY,0,7,0,40,0,100,0,18,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 18 - run script'),
(@ENTRY,0,8,0,40,0,100,0,20,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 20 - run script'),
(@ENTRY,0,9,0,40,0,100,0,21,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 21 - run script'),
(@ENTRY,0,10,0,40,0,100,0,26,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 26 - run script'),
(@ENTRY,0,11,0,40,0,100,0,28,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 28 - run script'),
(@ENTRY,0,12,0,40,0,100,0,31,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 31 - run script'),
(@ENTRY,0,13,0,40,0,100,0,33,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 33 - run script'),
(@ENTRY,0,14,0,40,0,100,0,38,@ENTRY,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Reach wp 38 - run script'),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,54,8000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Script - Pause path'),
(@ENTRY*100,9,1,0,0,0,100,0,100,100,0,0,66,0,0,0,0,0,0,19,33787,0,0,0,0,0,0, 'Fhyron Shadesong - Script - turn to Tournament Druid Spell Target'),
(@ENTRY*100,9,2,0,0,0,100,0,100,100,0,0,11,63678,0,0,0,0,0,19,33787,0,0,0,0,0,0, 'Fhyron Shadesong - Script - Cast Earthliving Visual on Tournament Druid Spell Target'),
(@ENTRY*100,9,3,0,0,0,50,0,4000,4000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fhyron Shadesong - Script - say text 0');
-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry`=@ENTRY; 
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0, 'Help shield us from these cutting winds, little sapling.',0,7,100,2,0,0, 'Fhyron Shadesong'),
(@ENTRY,0,1, 'There you are',0,7,100,273,0,0, 'Fhyron Shadesong'),
(@ENTRY,0,2, 'Grow, little one.',0,7,100,273,0,0, 'Fhyron Shadesong');
-- Waypoints for Fhyron Shadesong from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,8567.44,973.9194,547.9177, 'Fhyron Shadesong'),
(@ENTRY,2,8568.162,947.0933,547.8038, 'Fhyron Shadesong'),
(@ENTRY,3,8566.031,913.37,548.2927, 'Fhyron Shadesong'),
(@ENTRY,4,8564.706,894.527,547.6705, 'Fhyron Shadesong'),
(@ENTRY,5,8567.681,876.0731,547.5937, 'Fhyron Shadesong'),
(@ENTRY,6,8578.911,863.8034,548.4218, 'Fhyron Shadesong'),
(@ENTRY,7,8590.869,849.7815,547.6718, 'Fhyron Shadesong'),
(@ENTRY,8,8603.909,853.178,548.1281, 'Fhyron Shadesong'),
(@ENTRY,9,8599.38,855.512,547.715, 'Fhyron Shadesong'),
(@ENTRY,10,8591.701,868.5342,549.3784, 'Fhyron Shadesong'),
(@ENTRY,11,8586.77,871.798,547.876, 'Fhyron Shadesong'),
(@ENTRY,12,8586.149,883.8123,549.2509, 'Fhyron Shadesong'),
(@ENTRY,13,8583.74,886.251,548.96, 'Fhyron Shadesong'),
(@ENTRY,14,8582.075,903.0688,550.0374, 'Fhyron Shadesong'),
(@ENTRY,15,8585.078,918.2136,548.6675, 'Fhyron Shadesong'),
(@ENTRY,16,8581.65,944.137,547.897, 'Fhyron Shadesong'),
(@ENTRY,17,8582.839,948.3386,547.6221, 'Fhyron Shadesong'),
(@ENTRY,18,8565.45,986.6495,549.3403, 'Fhyron Shadesong'),
(@ENTRY,19,8570.5,989.399,547.629, 'Fhyron Shadesong'),
(@ENTRY,20,8576.626,1006.561,549.2132, 'Fhyron Shadesong'),
(@ENTRY,21,8586.87,1008.438,548.1278, 'Fhyron Shadesong'),
(@ENTRY,22,8590.46,1005.12,547.563, 'Fhyron Shadesong'),
(@ENTRY,23,8599.41,1007.08,547.419, 'Fhyron Shadesong'),
(@ENTRY,24,8602.17,1013.39,548.185, 'Fhyron Shadesong'),
(@ENTRY,25,8604.88,1030.23,556.734, 'Fhyron Shadesong'),
(@ENTRY,26,8612.658,1035.293,558.3499, 'Fhyron Shadesong'),
(@ENTRY,27,8611.47,1039.23,558.735, 'Fhyron Shadesong'),
(@ENTRY,28,8613.692,1042.313,558.3265, 'Fhyron Shadesong'),
(@ENTRY,29,8603.88,1044.65,558.38, 'Fhyron Shadesong'),
(@ENTRY,30,8598.02,1072.57,557.923, 'Fhyron Shadesong'),
(@ENTRY,31,8602.397,1081.373,558.2934, 'Fhyron Shadesong'),
(@ENTRY,32,8597.45,1089.27,557.317, 'Fhyron Shadesong'),
(@ENTRY,33,8600.864,1092.901,557.4839, 'Fhyron Shadesong'),
(@ENTRY,34,8593.38,1084.72,556.817, 'Fhyron Shadesong'),
(@ENTRY,35,8578.9,1068.6,557.38, 'Fhyron Shadesong'),
(@ENTRY,36,8563.31,1065.51,554.057, 'Fhyron Shadesong'),
(@ENTRY,37,8549.85,1061.87,550.61, 'Fhyron Shadesong'),
(@ENTRY,38,8547.754,1051.273,550.2899, 'Fhyron Shadesong'),
(@ENTRY,39,8544.317,1042.702,549.2928, 'Fhyron Shadesong'),
(@ENTRY,40,8557.891,1029.923,548.1677, 'Fhyron Shadesong'),
(@ENTRY,41,8566.168,1017.246,548.1677, 'Fhyron Shadesong'),
(@ENTRY,42,8570.943,1008.467,548.2927, 'Fhyron Shadesong');
-- Change InhabitType for 33787 "Tournament Druid Spell Target"
UPDATE `creature_template` SET `InhabitType`=1 WHERE `entry`=33787;

-- Egg Rush! should only be castable in Azure Watch, Dolannar, Goldshire, haranos, Bloodhoof Village, Brill, Falconwing Square, Razor Hill
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=61810;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`Comment`) VALUES
(17,0,61810,1,23,3576, 'Egg Rush! - Requires Azure Watch'), -- OR
(17,0,61810,2,23,186, 'Egg Rush! - Requires Dolanaar'), -- OR
(17,0,61810,3,23,87, 'Egg Rush! - Requires Goldshire'), -- OR
(17,0,61810,4,23,131, 'Egg Rush! - Requires Kharanos'), -- OR
(17,0,61810,5,23,222, 'Egg Rush! - Requires Bloodhoof Village'), -- OR
(17,0,61810,6,23,159, 'Egg Rush! - Requires Brill'), -- OR
(17,0,61810,7,23,2118, 'Egg Rush! - Requires Brill Town Hall'), -- OR
(17,0,61810,8,23,3665, 'Egg Rush! - Requires Falconwing Square'), -- OR
(17,0,61810,9,23,362, 'Egg Rush! - Requires Razor Hill'), -- OR
(17,0,61810,10,23,2337, 'Egg Rush! - Requires Razor Hill Barracks');

-- Template updates for gameobject Brightly Colored Egg
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry` BETWEEN 113768 AND 113772; -- Brightly Colored Egg's
/*
UPDATE `gameobject_template` SET `data1`=26884,`data7`=194047 WHERE `entry`=113772 AND `WDBVerified`=1; -- Brightly Colored Egg, made up GOB, no reason to be different from others
*/
-- Loot
DELETE FROM `gameobject_loot_template` WHERE `entry`=4984;
DELETE FROM `item_loot_template` WHERE `entry`=45072;
INSERT INTO `item_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(45072,44791,95,1,1,1,1), -- Noblegarden Chocolate
(45072,19028,0.2,1,1,1,1), -- Elegant Dress reminder of group 1
(45072,6833,0.9,1,1,1,1), -- White Tuxedo Shirt
(45072,6835,0.9,1,1,1,1), -- Black Tuxedo Pants
(45072,45073,0.6,1,1,1,1), -- Spring Flowers
(45072,44800,0.6,1,1,1,1), -- Spring Robes
(45072,44794,0.4,1,1,1,1), -- Spring Rabbit's Foot
(45072,44803,0.5,1,1,1,1), -- Spring Circlet
(45072,44792,0.9,1,1,1,1), -- Blossoming Branch
(45072,44806,-100,1,0,1,1); -- Brightly Colored Shell Fragment
/*
-- Creature template
UPDATE `creature_template` SET `equipment_id`=10102 WHERE `entry` =32836;*/


/* Spawn Brightly Colored Eggs */
/*
SET @EVENT = 9; -- Noblegarden
SET @GUID = 151896; -- Gameobjects
SET @DESPAWN = 40; -- Eggs respawn time: 40 seconds ?
SET @POOL = 5699; -- Need 8

SET @A = 113768; -- Brightly Colored Egg
SET @B = 113769; -- Brightly Colored Egg
SET @C = 113770; -- Brightly Colored Egg
SET @D = 113771; -- Brightly Colored Egg
SET @E = 113772; -- Brightly Colored Egg

DELETE FROM `game_event` WHERE `eventEntry`=26;
DELETE FROM `game_event_gameobject` WHERE `eventEntry`=26;

-- Pooling - max_limit needs to be ajusted, any sugestion?
DELETE FROM `pool_template` WHERE `entry` BETWEEN @POOL AND @POOL+7;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(@POOL+0,20, 'Noblegarden Eggs - Azure Watch'),
(@POOL+1,20, 'Noblegarden Eggs - Dolanaar'),
(@POOL+2,20, 'Noblegarden Eggs - Goldshire'),
(@POOL+3,20, 'Noblegarden Eggs - Kharanos'),
(@POOL+4,20, 'Noblegarden Eggs - Bloodhoof Village'),
(@POOL+5,20, 'Noblegarden Eggs - Brill'),
(@POOL+6,20, 'Noblegarden Eggs - Falconwing Square'),
(@POOL+7,20, 'Noblegarden Eggs - Razor Hill');

DELETE FROM `game_event_pool` WHERE `eventEntry`=@EVENT;
INSERT INTO `game_event_pool` (`eventEntry`,`pool_entry`) VALUES
(@EVENT,@POOL+0),(@EVENT,@POOL+1),
(@EVENT,@POOL+2),(@EVENT,@POOL+3),
(@EVENT,@POOL+4),(@EVENT,@POOL+5),
(@EVENT,@POOL+6),(@EVENT,@POOL+7);

DELETE FROM `pool_gameobject` WHERE `guid` BETWEEN @GUID AND @GUID+219 AND `pool_entry` BETWEEN @POOL AND @POOL+7;
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES
(@GUID+000,@POOL+0,0, 'Noblegarden Egg'),(@GUID+001,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+002,@POOL+0,0, 'Noblegarden Egg'),(@GUID+003,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+004,@POOL+0,0, 'Noblegarden Egg'),(@GUID+005,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+006,@POOL+0,0, 'Noblegarden Egg'),(@GUID+007,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+008,@POOL+0,0, 'Noblegarden Egg'),(@GUID+009,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+010,@POOL+0,0, 'Noblegarden Egg'),(@GUID+011,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+012,@POOL+0,0, 'Noblegarden Egg'),(@GUID+013,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+014,@POOL+0,0, 'Noblegarden Egg'),(@GUID+015,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+016,@POOL+0,0, 'Noblegarden Egg'),(@GUID+017,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+018,@POOL+0,0, 'Noblegarden Egg'),(@GUID+019,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+020,@POOL+0,0, 'Noblegarden Egg'),(@GUID+021,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+022,@POOL+0,0, 'Noblegarden Egg'),(@GUID+023,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+024,@POOL+0,0, 'Noblegarden Egg'),(@GUID+025,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+026,@POOL+0,0, 'Noblegarden Egg'),
(@GUID+027,@POOL+1,0, 'Noblegarden Egg'),(@GUID+028,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+029,@POOL+1,0, 'Noblegarden Egg'),(@GUID+030,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+031,@POOL+1,0, 'Noblegarden Egg'),(@GUID+032,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+033,@POOL+1,0, 'Noblegarden Egg'),(@GUID+034,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+035,@POOL+1,0, 'Noblegarden Egg'),(@GUID+036,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+037,@POOL+1,0, 'Noblegarden Egg'),(@GUID+038,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+039,@POOL+1,0, 'Noblegarden Egg'),(@GUID+040,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+041,@POOL+1,0, 'Noblegarden Egg'),(@GUID+042,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+043,@POOL+1,0, 'Noblegarden Egg'),(@GUID+044,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+045,@POOL+1,0, 'Noblegarden Egg'),(@GUID+046,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+047,@POOL+1,0, 'Noblegarden Egg'),(@GUID+048,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+049,@POOL+1,0, 'Noblegarden Egg'),(@GUID+050,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+051,@POOL+1,0, 'Noblegarden Egg'),
(@GUID+052,@POOL+2,0, 'Noblegarden Egg'),(@GUID+053,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+054,@POOL+2,0, 'Noblegarden Egg'),(@GUID+055,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+056,@POOL+2,0, 'Noblegarden Egg'),(@GUID+057,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+058,@POOL+2,0, 'Noblegarden Egg'),(@GUID+059,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+060,@POOL+2,0, 'Noblegarden Egg'),(@GUID+061,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+062,@POOL+2,0, 'Noblegarden Egg'),(@GUID+063,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+064,@POOL+2,0, 'Noblegarden Egg'),(@GUID+065,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+066,@POOL+2,0, 'Noblegarden Egg'),(@GUID+067,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+068,@POOL+2,0, 'Noblegarden Egg'),(@GUID+069,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+070,@POOL+2,0, 'Noblegarden Egg'),(@GUID+071,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+072,@POOL+2,0, 'Noblegarden Egg'),(@GUID+073,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+074,@POOL+2,0, 'Noblegarden Egg'),(@GUID+075,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+076,@POOL+2,0, 'Noblegarden Egg'),(@GUID+077,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+078,@POOL+2,0, 'Noblegarden Egg'),(@GUID+079,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+080,@POOL+2,0, 'Noblegarden Egg'),(@GUID+081,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+082,@POOL+2,0, 'Noblegarden Egg'),(@GUID+083,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+084,@POOL+2,0, 'Noblegarden Egg'),(@GUID+085,@POOL+2,0, 'Noblegarden Egg'),
(@GUID+086,@POOL+3,0, 'Noblegarden Egg'),(@GUID+087,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+088,@POOL+3,0, 'Noblegarden Egg'),(@GUID+089,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+090,@POOL+3,0, 'Noblegarden Egg'),(@GUID+091,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+092,@POOL+3,0, 'Noblegarden Egg'),(@GUID+093,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+094,@POOL+3,0, 'Noblegarden Egg'),(@GUID+095,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+096,@POOL+3,0, 'Noblegarden Egg'),(@GUID+097,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+098,@POOL+3,0, 'Noblegarden Egg'),(@GUID+099,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+100,@POOL+3,0, 'Noblegarden Egg'),(@GUID+101,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+102,@POOL+3,0, 'Noblegarden Egg'),(@GUID+103,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+104,@POOL+3,0, 'Noblegarden Egg'),(@GUID+105,@POOL+3,0, 'Noblegarden Egg'),
(@GUID+106,@POOL+4,0, 'Noblegarden Egg'),(@GUID+107,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+108,@POOL+4,0, 'Noblegarden Egg'),(@GUID+109,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+110,@POOL+4,0, 'Noblegarden Egg'),(@GUID+111,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+112,@POOL+4,0, 'Noblegarden Egg'),(@GUID+113,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+114,@POOL+4,0, 'Noblegarden Egg'),(@GUID+115,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+116,@POOL+4,0, 'Noblegarden Egg'),(@GUID+117,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+118,@POOL+4,0, 'Noblegarden Egg'),(@GUID+119,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+120,@POOL+4,0, 'Noblegarden Egg'),(@GUID+121,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+122,@POOL+4,0, 'Noblegarden Egg'),(@GUID+123,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+124,@POOL+4,0, 'Noblegarden Egg'),(@GUID+125,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+126,@POOL+4,0, 'Noblegarden Egg'),(@GUID+127,@POOL+4,0, 'Noblegarden Egg'),
(@GUID+128,@POOL+5,0, 'Noblegarden Egg'),(@GUID+129,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+130,@POOL+5,0, 'Noblegarden Egg'),(@GUID+131,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+132,@POOL+5,0, 'Noblegarden Egg'),(@GUID+133,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+134,@POOL+5,0, 'Noblegarden Egg'),(@GUID+135,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+136,@POOL+5,0, 'Noblegarden Egg'),(@GUID+137,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+138,@POOL+5,0, 'Noblegarden Egg'),(@GUID+139,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+140,@POOL+5,0, 'Noblegarden Egg'),(@GUID+141,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+142,@POOL+5,0, 'Noblegarden Egg'),(@GUID+143,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+144,@POOL+5,0, 'Noblegarden Egg'),(@GUID+145,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+146,@POOL+5,0, 'Noblegarden Egg'),(@GUID+147,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+148,@POOL+5,0, 'Noblegarden Egg'),(@GUID+149,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+150,@POOL+5,0, 'Noblegarden Egg'),(@GUID+151,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+152,@POOL+5,0, 'Noblegarden Egg'),(@GUID+153,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+154,@POOL+5,0, 'Noblegarden Egg'),(@GUID+155,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+156,@POOL+5,0, 'Noblegarden Egg'),(@GUID+157,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+158,@POOL+5,0, 'Noblegarden Egg'),(@GUID+159,@POOL+5,0, 'Noblegarden Egg'),
(@GUID+160,@POOL+5,0, 'Noblegarden Egg'),(@GUID+161,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+162,@POOL+6,0, 'Noblegarden Egg'),(@GUID+163,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+164,@POOL+6,0, 'Noblegarden Egg'),(@GUID+165,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+166,@POOL+6,0, 'Noblegarden Egg'),(@GUID+167,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+168,@POOL+6,0, 'Noblegarden Egg'),(@GUID+169,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+170,@POOL+6,0, 'Noblegarden Egg'),(@GUID+171,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+172,@POOL+6,0, 'Noblegarden Egg'),(@GUID+173,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+174,@POOL+6,0, 'Noblegarden Egg'),(@GUID+175,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+176,@POOL+6,0, 'Noblegarden Egg'),(@GUID+177,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+178,@POOL+6,0, 'Noblegarden Egg'),(@GUID+179,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+180,@POOL+6,0, 'Noblegarden Egg'),(@GUID+181,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+182,@POOL+6,0, 'Noblegarden Egg'),(@GUID+183,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+184,@POOL+6,0, 'Noblegarden Egg'),(@GUID+185,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+186,@POOL+6,0, 'Noblegarden Egg'),(@GUID+187,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+188,@POOL+6,0, 'Noblegarden Egg'),(@GUID+189,@POOL+6,0, 'Noblegarden Egg'),
(@GUID+190,@POOL+7,0, 'Noblegarden Egg'),(@GUID+191,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+192,@POOL+7,0, 'Noblegarden Egg'),(@GUID+193,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+194,@POOL+7,0, 'Noblegarden Egg'),(@GUID+195,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+196,@POOL+7,0, 'Noblegarden Egg'),(@GUID+197,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+198,@POOL+7,0, 'Noblegarden Egg'),(@GUID+199,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+200,@POOL+7,0, 'Noblegarden Egg'),(@GUID+201,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+202,@POOL+7,0, 'Noblegarden Egg'),(@GUID+203,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+204,@POOL+7,0, 'Noblegarden Egg'),(@GUID+205,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+206,@POOL+7,0, 'Noblegarden Egg'),(@GUID+207,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+208,@POOL+7,0, 'Noblegarden Egg'),(@GUID+209,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+210,@POOL+7,0, 'Noblegarden Egg'),(@GUID+211,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+212,@POOL+7,0, 'Noblegarden Egg'),(@GUID+213,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+214,@POOL+7,0, 'Noblegarden Egg'),(@GUID+215,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+216,@POOL+7,0, 'Noblegarden Egg'),(@GUID+217,@POOL+7,0, 'Noblegarden Egg'),
(@GUID+218,@POOL+7,0, 'Noblegarden Egg'),(@GUID+219,@POOL+7,0, 'Noblegarden Egg');

DELETE FROM `game_event_gameobject` WHERE `eventEntry`=@EVENT;
INSERT INTO `game_event_gameobject` (`eventEntry`,`guid`) VALUES
(@EVENT,@GUID+000),(@EVENT,@GUID+001),(@EVENT,@GUID+002),
(@EVENT,@GUID+003),(@EVENT,@GUID+004),(@EVENT,@GUID+005),
(@EVENT,@GUID+006),(@EVENT,@GUID+007),(@EVENT,@GUID+008),
(@EVENT,@GUID+009),(@EVENT,@GUID+010),(@EVENT,@GUID+011),
(@EVENT,@GUID+012),(@EVENT,@GUID+013),(@EVENT,@GUID+014),
(@EVENT,@GUID+015),(@EVENT,@GUID+016),(@EVENT,@GUID+017),
(@EVENT,@GUID+018),(@EVENT,@GUID+019),(@EVENT,@GUID+020),
(@EVENT,@GUID+021),(@EVENT,@GUID+022),(@EVENT,@GUID+023),
(@EVENT,@GUID+024),(@EVENT,@GUID+025),(@EVENT,@GUID+026),
(@EVENT,@GUID+027),(@EVENT,@GUID+028),(@EVENT,@GUID+029),
(@EVENT,@GUID+030),(@EVENT,@GUID+031),(@EVENT,@GUID+032),
(@EVENT,@GUID+033),(@EVENT,@GUID+034),(@EVENT,@GUID+035),
(@EVENT,@GUID+036),(@EVENT,@GUID+037),(@EVENT,@GUID+038),
(@EVENT,@GUID+039),(@EVENT,@GUID+040),(@EVENT,@GUID+041),
(@EVENT,@GUID+042),(@EVENT,@GUID+043),(@EVENT,@GUID+044),
(@EVENT,@GUID+045),(@EVENT,@GUID+046),(@EVENT,@GUID+047),
(@EVENT,@GUID+048),(@EVENT,@GUID+049),(@EVENT,@GUID+050),
(@EVENT,@GUID+051),(@EVENT,@GUID+052),(@EVENT,@GUID+053),
(@EVENT,@GUID+054),(@EVENT,@GUID+055),(@EVENT,@GUID+056),
(@EVENT,@GUID+057),(@EVENT,@GUID+058),(@EVENT,@GUID+059),
(@EVENT,@GUID+060),(@EVENT,@GUID+061),(@EVENT,@GUID+062),
(@EVENT,@GUID+063),(@EVENT,@GUID+064),(@EVENT,@GUID+065),
(@EVENT,@GUID+066),(@EVENT,@GUID+067),(@EVENT,@GUID+068),
(@EVENT,@GUID+069),(@EVENT,@GUID+070),(@EVENT,@GUID+071),
(@EVENT,@GUID+072),(@EVENT,@GUID+073),(@EVENT,@GUID+074),
(@EVENT,@GUID+075),(@EVENT,@GUID+076),(@EVENT,@GUID+077),
(@EVENT,@GUID+078),(@EVENT,@GUID+079),(@EVENT,@GUID+080),
(@EVENT,@GUID+081),(@EVENT,@GUID+082),(@EVENT,@GUID+083),
(@EVENT,@GUID+084),(@EVENT,@GUID+085),(@EVENT,@GUID+086),
(@EVENT,@GUID+087),(@EVENT,@GUID+088),(@EVENT,@GUID+089),
(@EVENT,@GUID+090),(@EVENT,@GUID+091),(@EVENT,@GUID+092),
(@EVENT,@GUID+093),(@EVENT,@GUID+094),(@EVENT,@GUID+095),
(@EVENT,@GUID+096),(@EVENT,@GUID+097),(@EVENT,@GUID+098),
(@EVENT,@GUID+099),(@EVENT,@GUID+100),(@EVENT,@GUID+101),
(@EVENT,@GUID+102),(@EVENT,@GUID+103),(@EVENT,@GUID+104),
(@EVENT,@GUID+105),(@EVENT,@GUID+106),(@EVENT,@GUID+107),
(@EVENT,@GUID+108),(@EVENT,@GUID+109),(@EVENT,@GUID+110),
(@EVENT,@GUID+111),(@EVENT,@GUID+112),(@EVENT,@GUID+113),
(@EVENT,@GUID+114),(@EVENT,@GUID+115),(@EVENT,@GUID+116),
(@EVENT,@GUID+117),(@EVENT,@GUID+118),(@EVENT,@GUID+119),
(@EVENT,@GUID+120),(@EVENT,@GUID+121),(@EVENT,@GUID+122),
(@EVENT,@GUID+123),(@EVENT,@GUID+124),(@EVENT,@GUID+125),
(@EVENT,@GUID+126),(@EVENT,@GUID+127),(@EVENT,@GUID+128),
(@EVENT,@GUID+129),(@EVENT,@GUID+130),(@EVENT,@GUID+131),
(@EVENT,@GUID+132),(@EVENT,@GUID+133),(@EVENT,@GUID+134),
(@EVENT,@GUID+135),(@EVENT,@GUID+136),(@EVENT,@GUID+137),
(@EVENT,@GUID+138),(@EVENT,@GUID+139),(@EVENT,@GUID+140),
(@EVENT,@GUID+141),(@EVENT,@GUID+142),(@EVENT,@GUID+143),
(@EVENT,@GUID+144),(@EVENT,@GUID+145),(@EVENT,@GUID+146),
(@EVENT,@GUID+147),(@EVENT,@GUID+148),(@EVENT,@GUID+149),
(@EVENT,@GUID+150),(@EVENT,@GUID+151),(@EVENT,@GUID+152),
(@EVENT,@GUID+153),(@EVENT,@GUID+154),(@EVENT,@GUID+155),
(@EVENT,@GUID+156),(@EVENT,@GUID+157),(@EVENT,@GUID+158),
(@EVENT,@GUID+159),(@EVENT,@GUID+160),(@EVENT,@GUID+161),
(@EVENT,@GUID+162),(@EVENT,@GUID+163),(@EVENT,@GUID+164),
(@EVENT,@GUID+165),(@EVENT,@GUID+166),(@EVENT,@GUID+167),
(@EVENT,@GUID+168),(@EVENT,@GUID+169),(@EVENT,@GUID+170),
(@EVENT,@GUID+171),(@EVENT,@GUID+172),(@EVENT,@GUID+173),
(@EVENT,@GUID+174),(@EVENT,@GUID+175),(@EVENT,@GUID+176),
(@EVENT,@GUID+177),(@EVENT,@GUID+178),(@EVENT,@GUID+179),
(@EVENT,@GUID+180),(@EVENT,@GUID+181),(@EVENT,@GUID+182),
(@EVENT,@GUID+183),(@EVENT,@GUID+184),(@EVENT,@GUID+185),
(@EVENT,@GUID+186),(@EVENT,@GUID+187),(@EVENT,@GUID+188),
(@EVENT,@GUID+189),(@EVENT,@GUID+190),(@EVENT,@GUID+191),
(@EVENT,@GUID+192),(@EVENT,@GUID+193),(@EVENT,@GUID+194),
(@EVENT,@GUID+195),(@EVENT,@GUID+196),(@EVENT,@GUID+197),
(@EVENT,@GUID+198),(@EVENT,@GUID+199),(@EVENT,@GUID+200),
(@EVENT,@GUID+201),(@EVENT,@GUID+202),(@EVENT,@GUID+203),
(@EVENT,@GUID+204),(@EVENT,@GUID+205),(@EVENT,@GUID+206),
(@EVENT,@GUID+207),(@EVENT,@GUID+208),(@EVENT,@GUID+209),
(@EVENT,@GUID+210),(@EVENT,@GUID+211),(@EVENT,@GUID+212),
(@EVENT,@GUID+213),(@EVENT,@GUID+214),(@EVENT,@GUID+215),
(@EVENT,@GUID+216),(@EVENT,@GUID+217),(@EVENT,@GUID+218),
(@EVENT,@GUID+219); 

DELETE FROM `gameobject` WHERE `id` BETWEEN 113768 AND 113772;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GUID+000,@A,0,1,1,-5572.18,-462.293,402.306,4.1197,0,0,0.882777,-0.469792,@DESPAWN,0,1), -- "Kharanos"
(@GUID+001,@B,0,1,1,-5588.73,-514.072,404.096,5.47452,0,0,0.393407,-0.919364,@DESPAWN,0,1),
(@GUID+002,@C,0,1,1,-5657.99,-509.341,398.747,1.01738,0,0,0.487035,0.873382,@DESPAWN,0,1),
(@GUID+003,@D,0,1,1,-5679.2,-527.206,396.599,0.129883,0,0,0.0648957,0.997892,@DESPAWN,0,1),
(@GUID+004,@E,0,1,1,-5648.93,-500.956,396.669,5.91827,0,0,0.181445,-0.983401,@DESPAWN,0,1),
(@GUID+005,@A,0,1,1,-5606.29,-445.915,403.953,4.50064,0,0,0.777873,-0.628421,@DESPAWN,0,1),
(@GUID+006,@B,0,1,1,-5610.05,-425.467,403.297,4.33964,0,0,0.825888,-0.563834,@DESPAWN,0,1),
(@GUID+007,@C,0,1,1,-5549.5,-438.023,405.233,4.35534,0,0,0.821434,-0.570304,@DESPAWN,0,1),
(@GUID+008,@D,0,1,1,-5568.58,-417.381,416.157,3.67204,0,0,0.965034,-0.262126,@DESPAWN,0,1),
(@GUID+009,@E,0,1,1,-5597.9,-420.422,412.014,3.52674,0,0,0.981515,-0.191384,@DESPAWN,0,1),
(@GUID+010,@A,0,1,1,-5585,-427.035,424.522,4.22181,0,0,0.857652,-0.514231,@DESPAWN,0,1),
(@GUID+011,@B,0,1,1,-5531.16,-459.015,403.516,4.19039,0,0,0.865625,-0.500693,@DESPAWN,0,1),
(@GUID+012,@C,0,1,1,-5543.29,-475.611,397.919,4.41423,0,0,0.804289,-0.594238,@DESPAWN,0,1),
(@GUID+013,@D,0,1,1,-5539.12,-501.709,402.718,3.42463,0,0,0.990003,-0.141047,@DESPAWN,0,1),
(@GUID+014,@E,0,1,1,-5550.12,-499.479,401.691,1.09592,0,0,0.520947,0.853589,@DESPAWN,0,1),
(@GUID+015,@A,0,1,1,-5552.1,-528.526,403.379,0.699295,0,0,0.342566,0.939494,@DESPAWN,0,1),
(@GUID+016,@B,0,1,1,-5577.98,-516.152,404.097,2.76804,0,0,0.982608,0.185694,@DESPAWN,0,1),
(@GUID+017,@C,0,1,1,-5589.02,-499.368,400.114,3.61626,0,0,0.971968,-0.235114,@DESPAWN,0,1),
(@GUID+018,@D,0,1,1,-5595.03,-507.466,401.138,0.835169,0,0,0.405553,0.914071,@DESPAWN,0,1),
(@GUID+019,@E,0,1,1,-5615.28,-523.667,402.662,2.11537,0,0,0.87122,0.490892,@DESPAWN,0,1),
(@GUID+020,@A,0,1,1,-5615.63,-532.978,406.92,1.49097,0,0,0.678329,0.734758,@DESPAWN,0,1),
(@GUID+021,@B,0,1,1,-5639.01,-531.358,405.116,1.07471,0,0,0.511866,0.859065,@DESPAWN,0,1),
(@GUID+022,@C,0,1,1,-5645.02,-506.352,397.389,6.13267,0,0,0.0751855,-0.99717,@DESPAWN,0,1),
(@GUID+023,@D,0,1,1,-5629.9,-478.085,397.148,4.82499,0,0,0.666198,-0.745775,@DESPAWN,0,1),
(@GUID+024,@E,0,1,1,-5596.35,-454.242,402.532,5.13522,0,0,0.54298,-0.839746,@DESPAWN,0,1),
(@GUID+025,@A,0,1,1,-5584.47,-462.246,402.873,1.54203,0,0,0.696862,0.717205,@DESPAWN,0,1),
(@GUID+026,@B,0,1,1,-5591.92,-476.967,396.981,5.29231,0,0,0.475419,-0.87976,@DESPAWN,0,1),
(@GUID+027,@C,0,1,1,-9471.12,43.1883,56.5597,1.5067,0,0,0.684088,0.7294,@DESPAWN,0,1), -- "Goldshire"
(@GUID+028,@D,0,1,1,-9437.51,112.982,57.576,4.86507,0,0,0.651119,-0.758976,@DESPAWN,0,1),
(@GUID+029,@E,0,1,1,-9423.57,109.77,58.6395,1.88449,0,0,0.808879,0.587974,@DESPAWN,0,1),
(@GUID+030,@A,0,1,1,-9424.83,63.7018,57.5696,4.42918,0,0,0.799825,-0.600233,@DESPAWN,0,1),
(@GUID+031,@B,0,1,1,-9416.75,54.7442,59.1231,5.99605,0,0,0.143077,-0.989712,@DESPAWN,0,1),
(@GUID+032,@C,0,1,1,-9425.34,56.1924,57.1307,0.756653,0,0,0.369366,0.929284,@DESPAWN,0,1),
(@GUID+033,@D,0,1,1,-9455.38,38.8205,56.6227,4.03962,0,0,0.900876,-0.434077,@DESPAWN,0,1),
(@GUID+034,@E,0,1,1,-9452.97,27.2894,56.5301,2.98326,0,0,0.996868,0.0790825,@DESPAWN,0,1),
(@GUID+035,@A,0,1,1,-9437.04,39.389,57.0626,1.83658,0,0,0.794565,0.607179,@DESPAWN,0,1),
(@GUID+036,@B,0,1,1,-9454.61,17.6726,58.0491,2.26462,0,0,0.905396,0.424568,@DESPAWN,0,1),
(@GUID+037,@C,0,1,1,-9470.77,-9.74519,56.5758,1.7227,0,0,0.758722,0.651415,@DESPAWN,0,1),
(@GUID+038,@D,0,1,1,-9477.11,7.08912,56.7995,0.151903,0,0,0.0758784,0.997117,@DESPAWN,0,1),
(@GUID+039,@E,0,1,1,-9484.17,13.6372,56.8493,0.576018,0,0,0.284044,0.958811,@DESPAWN,0,1),
(@GUID+040,@A,0,1,1,-9477.59,39.3136,57.4807,0.316842,0,0,0.157759,0.987478,@DESPAWN,0,1),
(@GUID+041,@B,0,1,1,-9485.15,46.0046,57.2156,0.242232,0,0,0.12082,0.992674,@DESPAWN,0,1),
(@GUID+042,@C,0,1,1,-9513.08,35.1837,57.3331,0.0851526,0,0,0.0425635,0.999094,@DESPAWN,0,1),
(@GUID+043,@D,0,1,1,-9501.08,61.728,56.6617,5.84212,0,0,0.218747,-0.975782,@DESPAWN,0,1),
(@GUID+044,@E,0,1,1,-9504.1,68.101,56.7047,5.03709,0,0,0.583512,-0.812105,@DESPAWN,0,1),
(@GUID+045,@A,0,1,1,-9499.42,83.8596,57.4257,5.81071,0,0,0.234046,-0.972226,@DESPAWN,0,1),
(@GUID+046,@B,0,1,1,-9511.45,101.96,58.6933,3.55663,0,0,0.978546,-0.206031,@DESPAWN,0,1),
(@GUID+047,@C,0,1,1,-9473.96,119.593,57.1435,4.68367,0,0,0.717187,-0.696881,@DESPAWN,0,1),
(@GUID+048,@D,0,1,1,-9469.15,101.676,58.0043,0.693849,0,0,0.340007,0.940423,@DESPAWN,0,1),
(@GUID+049,@E,0,1,1,-9473.1,78.0493,57.4364,5.28843,0,0,0.477122,-0.878837,@DESPAWN,0,1),
(@GUID+050,@A,0,1,1,-9463.99,81.5619,57.0823,1.29076,0,0,0.601501,0.798872,@DESPAWN,0,1),
(@GUID+051,@B,0,1,1,-9454.56,77.5214,57.0453,2.07616,0,0,0.86143,0.507876,@DESPAWN,0,1),
(@GUID+052,@C,0,1,1,2265.24,273.786,35.1652,3.01138,0,0,0.997881,0.0650598,@DESPAWN,0,1), -- "Brill"
(@GUID+053,@D,0,1,1,2285.1,254.969,34.3626,4.85628,0,0,0.654447,-0.756108,@DESPAWN,0,1),
(@GUID+054,@E,0,1,1,2288.74,269.683,35.1812,5.66446,0,0,0.304454,-0.952527,@DESPAWN,0,1),
(@GUID+055,@A,0,1,1,2278.93,277.294,35.1826,6.10428,0,0,0.0893348,-0.996002,@DESPAWN,0,1),
(@GUID+056,@B,0,1,1,2217.46,260.101,34.3656,6.16319,0,0,0.0599639,-0.998201,@DESPAWN,0,1),
(@GUID+057,@C,0,1,1,2241.09,240.359,34.1166,6.0925,0,0,0.0951979,-0.995458,@DESPAWN,0,1),
(@GUID+058,@D,0,1,1,2238.64,254.641,36.0388,4.69843,0,0,0.712026,-0.702153,@DESPAWN,0,1),
(@GUID+059,@E,0,1,1,2242.84,256.763,34.1151,4.9851,0,0,0.604425,-0.796662,@DESPAWN,0,1),
(@GUID+060,@A,0,1,1,2257.66,267.047,35.0788,3.00197,0,0,0.997564,0.069754,@DESPAWN,0,1),
(@GUID+061,@B,0,1,1,2265.36,253.863,34.8159,3.9523,0,0,0.918962,-0.394345,@DESPAWN,0,1),
(@GUID+062,@C,0,1,1,2285.8,254.474,34.2964,3.24545,0,0,0.998652,-0.0519028,@DESPAWN,0,1),
(@GUID+063,@D,0,1,1,2306.67,255.891,35.0947,2.94307,0,0,0.995077,0.0991001,@DESPAWN,0,1),
(@GUID+064,@E,0,1,1,2319.59,261.456,35.1823,3.96408,0,0,0.916623,-0.399752,@DESPAWN,0,1),
(@GUID+065,@A,0,1,1,2327.93,292.866,35.1823,3.35147,0,0,0.994499,-0.104749,@DESPAWN,0,1),
(@GUID+066,@B,0,1,1,2385.44,323.192,38.5898,4.96547,0,0,0.612215,-0.790691,@DESPAWN,0,1),
(@GUID+067,@C,0,1,1,2369.98,347.343,38.1937,5.98648,0,0,0.147807,-0.989016,@DESPAWN,0,1),
(@GUID+068,@D,0,1,1,2345.9,323.965,36.1689,1.27017,0,0,0.593245,0.805022,@DESPAWN,0,1),
(@GUID+069,@E,0,1,1,2315.1,313.901,36.7118,4.96547,0,0,0.612216,-0.790691,@DESPAWN,0,1),
(@GUID+070,@A,0,1,1,2304.19,329.028,37.3369,4.01513,0,0,0.906123,-0.423014,@DESPAWN,0,1),
(@GUID+071,@B,0,1,1,2289.53,334.538,34.6499,6.25743,0,0,0.0128751,-0.999917,@DESPAWN,0,1),
(@GUID+072,@C,0,1,1,2249.87,335.382,35.1891,1.72569,0,0,0.759695,0.650279,@DESPAWN,0,1),
(@GUID+073,@D,0,1,1,2267.7,337.796,35.1685,3.85019,0,0,0.93789,-0.346934,@DESPAWN,0,1),
(@GUID+074,@E,0,1,1,2270.61,345.306,35.1892,4.16435,0,0,0.872071,-0.48938,@DESPAWN,0,1),
(@GUID+075,@A,0,1,1,2262.43,353.117,35.1892,5.36993,0,0,0.440922,-0.897545,@DESPAWN,0,1),
(@GUID+076,@B,0,1,1,2253.53,346.854,35.1891,6.17104,0,0,0.0560442,-0.998428,@DESPAWN,0,1),
(@GUID+077,@C,0,1,1,2234.79,324.935,36.5233,3.29962,0,0,0.99688,-0.078933,@DESPAWN,0,1),
(@GUID+078,@D,0,1,1,2244.76,336.054,35.1877,4.98587,0,0,0.604116,-0.796896,@DESPAWN,0,1),
(@GUID+079,@E,0,1,1,2205.68,326.787,34.9419,5.99903,0,0,0.141602,-0.989924,@DESPAWN,0,1),
(@GUID+080,@A,0,1,1,2213.65,331.877,35.1961,1.57331,0,0,0.707996,0.706217,@DESPAWN,0,1),
(@GUID+081,@B,0,1,1,2208.33,304.79,34.3426,5.39428,0,0,0.429966,-0.902845,@DESPAWN,0,1),
(@GUID+082,@C,0,1,1,2220.88,310.768,36.7282,0.210651,0,0,0.105131,0.994458,@DESPAWN,0,1),
(@GUID+083,@D,0,1,1,2230.58,301.918,36.5037,4.42039,0,0,0.802456,-0.596711,@DESPAWN,0,1),
(@GUID+084,@E,0,1,1,2223.24,303.344,35.1879,2.28803,0,0,0.910303,0.413943,@DESPAWN,0,1),
(@GUID+085,@A,0,1,1,2229.29,278.899,35.1555,0.332388,0,0,0.16543,0.986221,@DESPAWN,0,1),
(@GUID+086,@B,530,1,1,9510.57,-6804.62,17.073,1.8242,0,0,0.79079,0.612087,@DESPAWN,0,1), -- "Falconwing Square"
(@GUID+087,@C,530,1,1,9521.05,-6860.13,21.0781,0.130877,0,0,0.0653918,0.99786,@DESPAWN,0,1),
(@GUID+088,@D,530,1,1,9551.75,-6830.38,17.6104,4.12699,0,0,0.88106,-0.473005,@DESPAWN,0,1),
(@GUID+089,@E,530,1,1,9554.75,-6830.2,16.4929,3.1688,0,0,0.999907,-0.0136057,@DESPAWN,0,1),
(@GUID+090,@A,530,1,1,9545.42,-6851,17.3644,1.13069,0,0,0.535708,0.844403,@DESPAWN,0,1),
(@GUID+091,@B,530,1,1,9543.39,-6863.25,21.0009,0.482738,0,0,0.239032,0.971012,@DESPAWN,0,1),
(@GUID+092,@C,530,1,1,9516.05,-6858.05,16.5391,4.97522,0,0,0.608352,-0.793667,@DESPAWN,0,1),
(@GUID+093,@D,530,1,1,9502.24,-6843.39,16.56,5.42682,0,0,0.415217,-0.909723,@DESPAWN,0,1),
(@GUID+094,@E,530,1,1,9484.62,-6829.57,16.6185,1.74331,0,0,0.765395,0.643561,@DESPAWN,0,1),
(@GUID+095,@A,530,1,1,9483.2,-6824.64,16.7831,5.22262,0,0,0.505777,-0.862665,@DESPAWN,0,1),
(@GUID+096,@B,530,1,1,9477.32,-6816.1,16.8213,5.45824,0,0,0.400877,-0.916132,@DESPAWN,0,1),
(@GUID+097,@C,530,1,1,9475.34,-6803.15,16.4955,6.04336,0,0,0.119626,-0.992819,@DESPAWN,0,1),
(@GUID+098,@D,530,1,1,9456.02,-6798.33,17.8346,4.60608,0,0,0.743677,-0.668539,@DESPAWN,0,1),
(@GUID+099,@E,530,1,1,9465.68,-6770.04,16.5745,3.57721,0,0,0.976373,-0.216091,@DESPAWN,0,1),
(@GUID+100,@A,530,1,1,9491.99,-6764.23,16.5058,2.80359,0,0,0.985753,0.168197,@DESPAWN,0,1),
(@GUID+101,@B,530,1,1,9516.86,-6771.11,16.4938,2.97638,0,0,0.99659,0.0825122,@DESPAWN,0,1),
(@GUID+102,@C,530,1,1,9524.29,-6814.98,16.4936,4.54718,0,0,0.76304,-0.646351,@DESPAWN,0,1),
(@GUID+103,@D,530,1,1,9543.14,-6794.87,16.4834,3.05493,0,0,0.999061,0.0433192,@DESPAWN,0,1),
(@GUID+104,@E,530,1,1,9551.25,-6807.38,16.4899,3.45155,0,0,0.988015,-0.154361,@DESPAWN,0,1),
(@GUID+105,@A,530,1,1,9555.84,-6824.24,16.4953,5.61925,0,0,0.325903,-0.945403,@DESPAWN,0,1),
(@GUID+106,@B,530,1,1,-4179.49,-12498.6,44.3612,5.3454,0,0,0.451898,-0.89207,@DESPAWN,0,1), -- "Azure Watch"
(@GUID+107,@C,530,1,1,-4193.3,-12458.3,45.7142,4.74457,0,0,0.695638,-0.718392,@DESPAWN,0,1),
(@GUID+108,@D,530,1,1,-4162.99,-12451.8,44.0466,2.34911,0,0,0.922517,0.385956,@DESPAWN,0,1),
(@GUID+109,@E,530,1,1,-4143.88,-12490,44.6714,3.43296,0,0,0.989407,-0.145167,@DESPAWN,0,1),
(@GUID+110,@A,530,1,1,-4140,-12518.8,45.7765,3.23896,0,0,0.998815,-0.0486653,@DESPAWN,0,1),
(@GUID+111,@B,530,1,1,-4141.64,-12533.2,45.3098,1.42862,0,0,0.655096,0.755546,@DESPAWN,0,1),
(@GUID+112,@C,530,1,1,-4154.66,-12537.1,45.5719,0.00704861,0,0,0.0035243,0.999994,@DESPAWN,0,1),
(@GUID+113,@D,530,1,1,-4168.66,-12542.6,45.3842,1.21656,0,0,0.571458,0.820632,@DESPAWN,0,1),
(@GUID+114,@E,530,1,1,-4183.33,-12564.4,40.1308,0.572535,0,0,0.282374,0.959304,@DESPAWN,0,1),
(@GUID+115,@A,530,1,1,-4207.6,-12559.9,40.677,0.541119,0,0,0.267271,0.963621,@DESPAWN,0,1),
(@GUID+116,@B,530,1,1,-4232.77,-12558.5,39.8764,5.32812,0,0,0.459588,-0.888132,@DESPAWN,0,1),
(@GUID+117,@C,530,1,1,-4233.57,-12534.1,45.78,0.462585,0,0,0.229236,0.973371,@DESPAWN,0,1),
(@GUID+118,@D,530,1,1,-4239.76,-12515.8,46.5776,1.43256,0,0,0.656582,0.754255,@DESPAWN,0,1),
(@GUID+119,@E,530,1,1,-4224.28,-12520.9,57.3901,5.37918,0,0,0.436767,-0.899575,@DESPAWN,0,1),
(@GUID+120,@A,530,1,1,-4219.7,-12506.3,45.4059,5.20247,0,0,0.514443,-0.857525,@DESPAWN,0,1),
(@GUID+121,@B,530,1,1,-4218.81,-12483.2,50.1845,1.57158,0,0,0.707385,0.706828,@DESPAWN,0,1),
(@GUID+122,@C,530,1,1,-4220.81,-12485,45.2711,3.44083,0,0,0.988828,-0.149061,@DESPAWN,0,1),
(@GUID+123,@D,530,1,1,-4227.3,-12471.5,45.7186,2.96173,0,0,0.995959,0.0898078,@DESPAWN,0,1),
(@GUID+124,@E,530,1,1,-4219.91,-12462.1,46.1824,4.96842,0,0,0.611046,-0.791595,@DESPAWN,0,1),
(@GUID+125,@A,530,1,1,-4215.75,-12440.2,44.6023,4.66605,0,0,0.723299,-0.690535,@DESPAWN,0,1),
(@GUID+126,@B,530,1,1,-4198.54,-12443.1,45.5096,5.7931,0,0,0.242598,-0.970127,@DESPAWN,0,1),
(@GUID+127,@C,530,1,1,-4186.59,-12437.9,43.6709,4.19482,0,0,0.864515,-0.502607,@DESPAWN,0,1),
(@GUID+128,@D,1,1,1,9834.42,996.991,1306.67,3.38578,0,0,0.992556,-0.121791,@DESPAWN,0,1), -- "Dolanaar"
(@GUID+129,@E,1,1,1,9857.8,973.055,1304.8,0.638475,0,0,0.313843,0.949475,@DESPAWN,0,1),
(@GUID+130,@A,1,1,1,9866.01,985.069,1309.35,1.02725,0,0,0.491336,0.87097,@DESPAWN,0,1),
(@GUID+131,@B,1,1,1,9871.22,987.366,1309.17,1.77338,0,0,0.774983,0.631982,@DESPAWN,0,1),
(@GUID+132,@C,1,1,1,9888.79,968.334,1309.37,5.51187,0,0,0.376167,-0.926552,@DESPAWN,0,1),
(@GUID+133,@D,1,1,1,9894.91,964.248,1310.49,5.24091,0,0,0.497866,-0.867254,@DESPAWN,0,1),
(@GUID+134,@E,1,1,1,9906.85,945.62,1313.48,0.940855,0,0,0.453267,0.891375,@DESPAWN,0,1),
(@GUID+135,@A,1,1,1,9905.5,936.252,1313.62,5.27625,0,0,0.482465,-0.875915,@DESPAWN,0,1),
(@GUID+136,@B,1,1,1,9912.13,918.466,1316.43,5.68858,0,0,0.292941,-0.956131,@DESPAWN,0,1),
(@GUID+137,@C,1,1,1,9923.98,905.402,1317.22,0.0180063,0,0,0.00900304,0.999959,@DESPAWN,0,1),
(@GUID+138,@D,1,1,1,9892.76,918.799,1307.59,2.46845,0,0,0.943892,0.330254,@DESPAWN,0,1),
(@GUID+139,@E,1,1,1,9860.8,910.839,1306.14,3.37558,0,0,0.993164,-0.116729,@DESPAWN,0,1),
(@GUID+140,@A,1,1,1,9851.2,880.204,1310.25,4.59294,0,0,0.748052,-0.66364,@DESPAWN,0,1),
(@GUID+141,@B,1,1,1,9835.31,897.141,1308.78,2.44095,0,0,0.939263,0.343199,@DESPAWN,0,1),
(@GUID+142,@C,1,1,1,9824.87,900.498,1305.55,3.75649,0,0,0.953108,-0.30263,@DESPAWN,0,1),
(@GUID+143,@D,1,1,1,9824.11,920.98,1304.55,1.81263,0,0,0.787238,0.61665,@DESPAWN,0,1),
(@GUID+144,@E,1,1,1,9809.87,935.889,1307.93,1.35318,0,0,0.626136,0.779714,@DESPAWN,0,1),
(@GUID+145,@A,1,1,1,9825.82,943.887,1306.73,1.2118,0,0,0.569504,0.821989,@DESPAWN,0,1),
(@GUID+146,@B,1,1,1,9818.16,941.709,1308.82,5.04848,0,0,0.57888,-0.815412,@DESPAWN,0,1),
(@GUID+147,@C,1,1,1,9797.18,927.063,1306.86,3.00644,0,0,0.997718,0.0675235,@DESPAWN,0,1),
(@GUID+148,@D,1,1,1,9785.09,936.851,1307.38,1.35318,0,0,0.626138,0.779713,@DESPAWN,0,1),
(@GUID+149,@E,1,1,1,9809.68,977.31,1304.27,1.82676,0,0,0.791575,0.611072,@DESPAWN,0,1),
(@GUID+150,@A,1,1,1,9784.31,964.786,1309.44,3.73921,0,0,0.955688,-0.294381,@DESPAWN,0,1),
(@GUID+151,@B,1,1,1,9837.54,978.538,1307.14,4.27721,0,0,0.843082,-0.537785,@DESPAWN,0,1),
(@GUID+152,@C,1,1,1,9778.77,964.973,1306.69,6.20301,0,0,0.0400778,-0.999197,@DESPAWN,0,1),
(@GUID+153,@D,1,1,1,9738.77,984.013,1303.77,1.04137,0,0,0.497472,0.86748,@DESPAWN,0,1),
(@GUID+154,@E,1,1,1,9726.77,970.323,1294.58,5.7459,0,0,0.265423,-0.964132,@DESPAWN,0,1),
(@GUID+155,@A,1,1,1,9698.11,952.961,1291.53,0.185278,0,0,0.0925063,0.995712,@DESPAWN,0,1),
(@GUID+156,@B,1,1,1,9700.25,889.704,1298.97,5.08616,0,0,0.563413,-0.826176,@DESPAWN,0,1),
(@GUID+157,@C,1,1,1,9738.64,884.265,1295.69,5.848,0,0,0.215879,-0.97642,@DESPAWN,0,1),
(@GUID+158,@D,1,1,1,9785.18,883.167,1298.1,4.90553,0,0,0.635633,-0.771991,@DESPAWN,0,1),
(@GUID+159,@E,1,1,1,9778.44,884.651,1297.97,3.8099,0,0,0.944688,-0.327969,@DESPAWN,0,1),
(@GUID+160,@A,1,1,1,9767.38,886.362,1298.14,4.77201,0,0,0.685717,-0.727868,@DESPAWN,0,1),
(@GUID+161,@B,1,1,1,297.2,-4657.1,16.7732,6.04909,0,0,0.11678,-0.993158,@DESPAWN,0,1), -- "Razor Hill"
(@GUID+162,@C,1,1,1,268.569,-4693.75,15.0267,5.3658,0,0,0.442777,-0.896632,@DESPAWN,0,1),
(@GUID+163,@D,1,1,1,266.882,-4717.16,15.0265,0.853685,0,0,0.413999,0.910277,@DESPAWN,0,1),
(@GUID+164,@E,1,1,1,273.893,-4729.49,13.5919,2.55407,0,0,0.957162,0.289553,@DESPAWN,0,1),
(@GUID+165,@A,1,1,1,273.773,-4777.38,11.8478,2.2085,0,0,0.893127,0.449805,@DESPAWN,0,1),
(@GUID+166,@B,1,1,1,297.468,-4797.06,10.145,5.99019,0,0,0.145974,-0.989288,@DESPAWN,0,1),
(@GUID+167,@C,1,1,1,284.923,-4810.53,11.9429,0.81442,0,0,0.396049,0.918229,@DESPAWN,0,1),
(@GUID+168,@D,1,1,1,289.461,-4840.14,10.9166,5.97841,0,0,0.151797,-0.988412,@DESPAWN,0,1),
(@GUID+169,@E,1,1,1,297.084,-4847.31,11.7787,2.48339,0,0,0.946333,0.323194,@DESPAWN,0,1),
(@GUID+170,@A,1,1,1,310.245,-4850.53,10.2372,2.31845,0,0,0.916494,0.400048,@DESPAWN,0,1),
(@GUID+171,@B,1,1,1,312.713,-4860.69,10.549,2.2517,0,0,0.902633,0.430411,@DESPAWN,0,1),
(@GUID+172,@C,1,1,1,332.089,-4843.46,12.0247,0.936158,0,0,0.451173,0.892437,@DESPAWN,0,1),
(@GUID+173,@D,1,1,1,345.731,-4852.46,10.3662,0.896889,0,0,0.433564,0.901123,@DESPAWN,0,1),
(@GUID+174,@E,1,1,1,338.115,-4858.18,10.3123,2.32239,0,0,0.917279,0.398244,@DESPAWN,0,1),
(@GUID+175,@A,1,1,1,337.55,-4834.48,9.99127,3.84999,0,0,0.937926,-0.346837,@DESPAWN,0,1),
(@GUID+176,@B,1,1,1,359.585,-4836.23,11.2313,4.3173,0,0,0.832134,-0.554575,@DESPAWN,0,1),
(@GUID+177,@C,1,1,1,341.753,-4809.21,10.2911,4.10917,0,0,0.88524,-0.465134,@DESPAWN,0,1),
(@GUID+178,@D,1,1,1,318.85,-4782.25,10.137,3.20596,0,0,0.999482,-0.032176,@DESPAWN,0,1),
(@GUID+179,@E,1,1,1,334.174,-4770.39,12.6355,4.27017,0,0,0.844969,-0.534816,@DESPAWN,0,1),
(@GUID+180,@A,1,1,1,366.98,-4754.08,11.812,4.71785,0,0,0.705173,-0.709035,@DESPAWN,0,1),
(@GUID+181,@B,1,1,1,367.509,-4719.81,13.5495,3.90497,0,0,0.928038,-0.372486,@DESPAWN,0,1),
(@GUID+182,@C,1,1,1,380.013,-4722.65,12.8458,3.27272,0,0,0.997851,-0.0655165,@DESPAWN,0,1),
(@GUID+183,@D,1,1,1,386.571,-4708.25,13.4001,3.43765,0,0,0.989064,-0.14749,@DESPAWN,0,1),
(@GUID+184,@E,1,1,1,364.009,-4699.68,14.6481,4.76497,0,0,0.688275,-0.72545,@DESPAWN,0,1),
(@GUID+185,@A,1,1,1,344.324,-4660.83,16.4647,6.01375,0,0,0.134308,-0.99094,@DESPAWN,0,1),
(@GUID+186,@B,1,1,1,316.132,-4664.03,16.0927,4.80424,0,0,0.673899,-0.738824,@DESPAWN,0,1),
(@GUID+187,@C,1,1,1,321.541,-4678.85,16.7263,0.951858,0,0,0.458164,0.888868,@DESPAWN,0,1),
(@GUID+188,@D,1,1,1,319.174,-4698.69,15.9669,2.43233,0,0,0.937775,0.347243,@DESPAWN,0,1),
(@GUID+189,@E,1,1,1,322.49,-4706.93,16.7168,3.99528,0,0,0.910278,-0.413999,@DESPAWN,0,1),
(@GUID+190,@A,1,1,1,-2318.7,-427.27,-5.00784,1.80544,0,0,0.785014,0.619479,@DESPAWN,0,1), -- "Bloodhoof Village"
(@GUID+191,@B,1,1,1,-2310.73,-453.481,28.0788,3.27413,0,0,0.997805,-0.0662205,@DESPAWN,0,1),
(@GUID+192,@C,1,1,1,-2281.93,-440.985,-7.68513,2.9207,0,0,0.993907,0.110221,@DESPAWN,0,1),
(@GUID+193,@D,1,1,1,-2282.04,-507.952,-9.42411,1.94367,0,0,0.825921,0.563786,@DESPAWN,0,1),
(@GUID+194,@E,1,1,1,-2240.59,-319.837,-9.42471,3.51842,0,0,0.982303,-0.1873,@DESPAWN,0,1),
(@GUID+195,@A,1,1,1,-2255.57,-331.142,-9.13563,0.961946,0,0,0.462642,0.886545,@DESPAWN,0,1),
(@GUID+196,@B,1,1,1,-2213.08,-373.327,-8.34503,3.49878,0,0,0.984094,-0.177647,@DESPAWN,0,1),
(@GUID+197,@C,1,1,1,-2239.43,-402.529,-9.42193,1.70022,0,0,0.751353,0.6599,@DESPAWN,0,1),
(@GUID+198,@D,1,1,1,-2245.06,-285.102,-9.42489,3.49878,0,0,0.984094,-0.177647,@DESPAWN,0,1),
(@GUID+199,@E,1,1,1,-2250.85,-256.279,-9.47737,3.22389,0,0,0.999153,-0.0411391,@DESPAWN,0,1),
(@GUID+200,@A,1,1,1,-2282.03,-257.974,-8.4252,3.20033,0,0,0.999569,-0.0293655,@DESPAWN,0,1),
(@GUID+201,@B,1,1,1,-2318.96,-265.509,-8.65507,4.93998,0,0,0.62224,-0.782827,@DESPAWN,0,1),
(@GUID+202,@C,1,1,1,-2334.42,-275.734,-8.54136,3.66764,0,0,0.965608,-0.260001,@DESPAWN,0,1),
(@GUID+203,@D,1,1,1,-2350.32,-305.64,-9.42338,4.88108,0,0,0.645024,-0.764162,@DESPAWN,0,1),
(@GUID+204,@E,1,1,1,-2384.46,-329.426,-9.56387,5.92172,0,0,0.179749,-0.983712,@DESPAWN,0,1),
(@GUID+205,@A,1,1,1,-2373.96,-317.655,-9.66495,0.235438,0,0,0.117447,0.993079,@DESPAWN,0,1),
(@GUID+206,@B,1,1,1,-2389.36,-349.159,-9.39815,1.51956,0,0,0.688762,0.724988,@DESPAWN,0,1),
(@GUID+207,@C,1,1,1,-2361.47,-364.775,-8.53755,2.54843,0,0,0.956342,0.292251,@DESPAWN,0,1),
(@GUID+208,@D,1,1,1,-2355.47,-364.996,-8.6927,0.522106,0,0,0.258098,0.966119,@DESPAWN,0,1),
(@GUID+209,@E,1,1,1,-2338.21,-367.223,-6.49505,2.64661,0,0,0.96953,0.244973,@DESPAWN,0,1),
(@GUID+210,@A,1,1,1,-2340.9,-352.75,-8.96522,2.37172,0,0,0.926822,0.3755,@DESPAWN,0,1),
(@GUID+211,@B,1,1,1,-2379.72,-322.666,2.84507,0.215802,0,0,0.107692,0.994184,@DESPAWN,0,1),
(@GUID+212,@C,1,1,1,-2361.47,-338.039,-8.82528,5.60756,0,0,0.331425,-0.943482,@DESPAWN,0,1),
(@GUID+213,@D,1,1,1,-2341.06,-317.455,-9.18516,4.56297,0,0,0.757911,-0.652358,@DESPAWN,0,1),
(@GUID+214,@E,1,1,1,-2325.19,-384.338,-8.10101,0.659543,0,0,0.323827,0.946116,@DESPAWN,0,1),
(@GUID+215,@A,1,1,1,-2296.58,-385.843,-9.01576,1.23288,0,0,0.578135,0.815941,@DESPAWN,0,1),
(@GUID+216,@B,1,1,1,-2306.12,-417.744,-8.10044,4.24096,0,0,0.852689,-0.522419,@DESPAWN,0,1),
(@GUID+217,@C,1,1,1,-2326.03,-440.102,-5.43827,4.10744,0,0,0.885641,-0.464371,@DESPAWN,0,1),
(@GUID+218,@D,1,1,1,-2330.82,-457.583,-6.74765,5.70572,0,0,0.284736,-0.958606,@DESPAWN,0,1),
(@GUID+219,@E,1,1,1,-2351.25,-495.771,-8.98241,3.82863,0,0,0.941576,-0.336801,@DESPAWN,0,1);*/


/*
SET @GUID = 152261; -- Creatures
SET @EVENT = 9; -- Noblegarden

UPDATE `game_event` SET `start_time`='2011-04-24 00:02:00', `length`=11*24*60 WHERE `eventEntry`=@EVENT; -- 11 days length
DELETE FROM `game_event_creature_quest` WHERE `eventEntry`=@EVENT;

UPDATE `creature_template` SET `minlevel`=12,`maxlevel`=12 WHERE `entry` IN (32836,32837);
UPDATE `creature_template` SET `minlevel`=75,`maxlevel`=75 WHERE `entry` IN (32798,32799);

DELETE FROM `game_event_creature` WHERE `eventEntry`=@EVENT;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(@EVENT, @GUID+00),(@EVENT, @GUID+01),
(@EVENT, @GUID+02),(@EVENT, @GUID+03),
(@EVENT, @GUID+04),(@EVENT, @GUID+05),
(@EVENT, @GUID+06),(@EVENT, @GUID+07),
(@EVENT, @GUID+08),(@EVENT, @GUID+09),
(@EVENT, @GUID+10),(@EVENT, @GUID+11),
(@EVENT, @GUID+12),(@EVENT, @GUID+13),
(@EVENT, @GUID+14),(@EVENT, @GUID+15);

DELETE FROM `creature` WHERE `id` IN (32798,32799,32836,32837);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+00,32798,0,1,1,0,0,2236.33,247.326,33.6595,2.84096,300,0,0,0,0,0,0,0,0,0), -- Spring Gatherer
(@GUID+01,32798,1,1,1,0,0,323.943,-4703.51,15.8903,4.29373,300,0,0,0,0,0,0,0,0,0), -- Spring Gatherer
(@GUID+02,32798,530,1,1,0,0,9495.4,-6841.51,16.986,0.807895,300,0,0,0,0,0,0,0,0,0), -- Spring Gatherer
(@GUID+03,32798,1,1,1,0,0,-2336.63,-355.656,-8.74798,5.58244,300,0,0,0,0,0,0,0,0,0), -- Spring Gatherer
(@GUID+04,32799,0,1,1,0,0,-5596.99,-506.959,401.155,2.73583,300,0,0,0,0,0,0,0,0,0), -- Spring Collector
(@GUID+05,32799,1,1,1,0,0,9837.29,969.65,1308.21,0.383221,300,0,0,0,0,0,0,0,0,0), -- Spring Collector
(@GUID+06,32799,0,1,1,0,0,-9453.86,44.7409,56.7139,1.45433,300,0,0,0,0,0,0,0,0,0), -- Spring Collector
(@GUID+07,32799,530,1,1,0,0,-4150.79,-12492.3,44.6553,3.75029,300,0,0,0,0,0,0,0,0,0), -- Spring Collector
(@GUID+08,32836,0,1,1,0,0,-5601.03,-512.86,401.492,1.56166,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Vendor 
(@GUID+09,32836,1,1,1,0,0,9839.27,961.92,1308.29,0.271694,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Vendor 
(@GUID+10,32836,0,1,1,0,0,-9451.26,42.2403,57.173,0.641447,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Vendor 
(@GUID+11,32836,530,1,1,0,0,-4155.63,-12486.1,44.7758,3.96234,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Vendor 
(@GUID+12,32837,0,1,1,0,0,2244.84,262.273,34.148,2.9156,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Merchant
(@GUID+13,32837,1,1,1,0,0,333.091,-4707.97,15.6644,4.12487,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Merchant
(@GUID+14,32837,530,1,1,0,0,9487.64,-6833.65,16.986,0.819677,300,0,0,0,0,0,0,0,0,0), -- Noblegarden Merchant
(@GUID+15,32837,1,1,1,0,0,-2343.08,-364.618,-8.4062,5.82199,300,0,0,0,0,0,0,0,0,0); -- Noblegarden Merchant
*/

DELETE FROM `spell_linked_spell` WHERE `spell_effect`=61719;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(61716,61719,2, 'Rabbit Costume: Lay Egg periodic'),
(61734,61719,2, 'Noblegarden Bunny: Lay Egg periodic');

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=9118;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(9118,16,181,0, ''),
(9118,6,490,0, '');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=9118 AND `type`=6;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(9118,6,543,0, '');