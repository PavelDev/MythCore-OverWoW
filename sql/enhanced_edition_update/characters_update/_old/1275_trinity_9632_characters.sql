-- 9521
DELETE FROM character_achievement WHERE `achievement` IN (3812,3916,3917,3918,3799,3797,3813,3814,3798,3815,3996,3997,3800,3816,3937,3936,3817,3818,3819,3808,3809,3810,4078,4079,4156,4080);
DELETE FROM character_achievement_progress WHERE `criteria` IN (11542,11546,11547,11549,11678,11679,11680,11681,11682,11683,11684,11685,11686,11687,11688,11689,11690,11691,11692,11693,11778,11779,11780,11799,11800,11801,11802,11803,11804,11818,11838,11839,11860,11861,11862,12116,12198,12258,12278,12279,12280,12281,12338,12339,12340,12341,12342,12343,12344,12345,12346,12347,12348,12349,12350,12358,12359,12360);

-- 9632
CREATE TABLE `character_arena_stats` (
`guid`  int(10) NOT NULL ,
`slot`  smallint(1) NOT NULL ,
`personal_rating`  int(10) NOT NULL ,
`matchmaker_rating`  int(10) NOT NULL ,
PRIMARY KEY (`guid`, `slot`)
);

UPDATE `arena_team_stats` SET `rating`=0;
ALTER TABLE `arena_team_member`
DROP COLUMN `personal_rating`;

DROP TABLE IF EXISTS `character_arena_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_arena_stats` (
  `guid`  int(10) NOT NULL ,
  `slot`  smallint(1) NOT NULL ,
  `personal_rating`  int(10) NOT NULL ,
  `matchmaker_rating`  int(10) NOT NULL ,
  PRIMARY KEY (`guid`, `slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;