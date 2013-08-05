-- 10475
DROP TABLE IF EXISTS `reserved_name`;
CREATE TABLE `reserved_name` (
  `name` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player Reserved Names';

ALTER TABLE `group_member`
CHANGE `guid` `guid` INT(11) UNSIGNED NOT NULL,
CHANGE `memberGuid` `memberGuid` INT(11) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `memberFlags` `memberFlags` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `subgroup` `subgroup` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `roles` `roles` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0';

ALTER TABLE character_banned ENGINE = InnoDB;

DROP TABLE IF EXISTS `gameobject_respawn`;
CREATE TABLE `gameobject_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawntime` int(10) unsigned NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grid Loading System';