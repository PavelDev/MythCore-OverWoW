-- 10543
ALTER TABLE `group_member`
CHANGE `guid` `guid` INT(11) UNSIGNED NOT NULL,
CHANGE `memberGuid` `memberGuid` INT(11) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `memberFlags` `memberFlags` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `subgroup` `subgroup` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `roles` `roles` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0';
-- 10548
ALTER TABLE `channels`
DROP COLUMN `m_moderate`,
CHANGE `m_name` `m_name` VARCHAR(128) NOT NULL,
CHANGE `m_announce` `m_announce` TINYINT(3) UNSIGNED DEFAULT '1' NOT NULL,
CHANGE `m_public` `m_ownership` TINYINT(3) UNSIGNED DEFAULT '1' NOT NULL,
CHANGE `m_password` `m_password` VARCHAR(32) NULL,
ADD COLUMN `last_used` INT(10) UNSIGNED NOT NULL AFTER `BannedList`;
-- Set already existing/current channels to use current timestamp (saves them from being unneccesarily cleaned up)
UPDATE `channels` SET last_used = UNIX_TIMESTAMP();