-- Trinity SQLs, unil they are not included into Next DB Release.
DELETE FROM `spell_linked_spell` WHERE `spell_effect`=61719;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(61716,61719,2, 'Rabbit Costume: Lay Egg periodic'),
(61734,61719,2, 'Noblegarden Bunny: Lay Egg periodic');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_item_vanquished_clutches';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64981, 'spell_item_vanquished_clutches');
