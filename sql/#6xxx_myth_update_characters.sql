-- -------------------------------------------------------------------------
-- --------------- Myth Project "Characters" Database Update ---------------
-- -------------------------------------------------------------------------
-- Myth Anticheat
DROP TABLE IF EXISTS `players_reports_status`;
CREATE TABLE `players_reports_status` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `creation_time` int(10) unsigned NOT NULL DEFAULT '0',
  `average` float NOT NULL DEFAULT '0',
  `total_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `speed_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fly_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `jump_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `waterwalk_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `teleportplane_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `climb_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='';
-- Myth Wintergrasp
DELETE FROM `worldstates` WHERE `entry` IN (31001,31002,31003,31004);
INSERT INTO `worldstates` VALUES
('31001', '0', 'WG war status'),
('31002', '0', 'WG clock'),
('31003', '0', 'WG Fortress Defender'),
('31004', '0', 'WG TEMP Battle Control Faction');

-- Truncate Character`s/Pet`s active Buffs, to avoid crashes. Because Mech. && Spells Changed.
TRUNCATE character_aura;
TRUNCATE pet_aura;

