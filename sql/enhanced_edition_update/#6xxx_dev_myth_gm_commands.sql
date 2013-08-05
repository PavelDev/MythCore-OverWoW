/* Myth Custom Command Balance */
/* For Dev Realm! */
/* Balance to prevent "drawing" and bullshits */
/* DEVELOPMENT REALM: LOGON.MMOGATE.NET DEV REALM!*/
UPDATE `command` SET `security` = 0 WHERE `name` LIKE '%';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE '%account%';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE '%ban%';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE '%server%';
UPDATE `command` SET `security` = 3 WHERE `name` LIKE '%reload%';