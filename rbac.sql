SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `rbac_role`;
DROP TABLE IF EXISTS `rbac_role_assignement`;
DROP TABLE IF EXISTS `rbac_group`;
DROP TABLE IF EXISTS `rbac_user`;
DROP TABLE IF EXISTS `rbac_role_permission`;
DROP TABLE IF EXISTS `rbac_permission_policy`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `rbac_role` (
    `uid` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `Column1` INTEGER NOT NULL,
    PRIMARY KEY (`uid`)
);

CREATE TABLE `rbac_role_assignement` (
    `uid` VARCHAR(255) NOT NULL,
    `role_uid` VARCHAR(255) NOT NULL,
    `group_uid` VARCHAR(255) NOT NULL,
    `user_uid` VARCHAR(255) NOT NULL,
    `date` DATETIME NOT NULL
);

CREATE TABLE `rbac_group` (
    `uid` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `rbac_user` (
    `uid` VARCHAR(255) NOT NULL,
    `group_uid` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `rbac_role_permission` (
    `uid` VARCHAR(255) NOT NULL,
    `role_uid` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `effect` ENUM('ALLOW','DENY') NOT NULL,
    `` INTEGER NOT NULL
);

CREATE TABLE `rbac_permission_policy` (
    `uid` VARCHAR(255) NOT NULL,
    `on_ambiguity` ENUM('MORE_RECENT','OLDER','ALLOW', 'DENY') NOT NULL
);

ALTER TABLE `rbac_role_assignement` ADD FOREIGN KEY (`role_uid`) REFERENCES `rbac_role`(`uid`);
ALTER TABLE `rbac_role_assignement` ADD FOREIGN KEY (`group_uid`) REFERENCES `rbac_group`(`uid`);
ALTER TABLE `rbac_role_assignement` ADD FOREIGN KEY (`user_uid`) REFERENCES `rbac_user`(`uid`);
ALTER TABLE `rbac_user` ADD FOREIGN KEY (`group_uid`) REFERENCES `rbac_group`(`uid`);
ALTER TABLE `rbac_role_permission` ADD FOREIGN KEY (`role_uid`) REFERENCES `rbac_role`(`uid`);