-- 10777
ALTER TABLE `gameobject_respawn` CHANGE COLUMN `respawntime` `respawntime` bigint(20) unsigned NOT NULL DEFAULT 0;
ALTER TABLE `creature_respawn` CHANGE COLUMN `respawntime` `respawntime` bigint(20) unsigned NOT NULL DEFAULT 0;
