-- 10000
DROP TABLE IF EXISTS `character_banned`;
CREATE TABLE `character_banned` (
  `guid` int(11) NOT NULL default '0' COMMENT 'Account id',
  `bandate` bigint(40) NOT NULL default '0',
  `unbandate` bigint(40) NOT NULL default '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`guid`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Ban List';
-- 10030
DROP TABLE IF EXISTS `item_soulbound_trade_data`;
CREATE TABLE `item_soulbound_trade_data` (
  `itemGuid` int(11) unsigned NOT NULL COMMENT 'Item GUID',
  `allowedPlayers` text NOT NULL COMMENT 'Space separated GUID list of players who can receive this item in trade',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item Refund System';