-- ----------------------------
-- 用户表
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT,
    `mobile`             varchar(11) COMMENT '手机号',
    `real_name`          varchar(20) COMMENT '真实姓名',
    `user_name`          varchar(30) COMMENT '用户名',
    `password`           varchar(100) COMMENT '密码',
    `mailbox`            varchar(50) COMMENT '邮箱',
    `province_code`      int(6) COMMENT '省份code',
    `province`           varchar(50) COMMENT '省份',
    `city_code`          int(6) COMMENT '城市code',
    `city`               varchar(50) COMMENT '城市',
    `status`             int(11) COMMENT '状态 0 解冻 1  冻结',
    `types`              int(2) NOT NULL DEFAULT 0 COMMENT '0/对外开放   1/不对外开放',
    `hos_department_ids` varchar(30) COMMENT '医院部门s',
    `api_hos_area_id`    varchar(50),
    `area_floor_id`      bigint(20),
    `remark`             varchar(200),
    `last_login_time`    datetime,
    `create_time`        datetime COMMENT '创建时间',
    `update_time`        datetime COMMENT '修改时间',
    `create_by`          varchar(20) COMMENT '修改人',
    `update_by`          varchar(20) COMMENT '修改人',
    `deleted`            bit(1) NOT NULL DEFAULT 0 COMMENT '0:正常1:删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 0 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '后台用户表' ROW_FORMAT = DYNAMIC;
-- ----------------------------
-- 用户-用户角色表(中间表)
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT,
    `sys_user_id` bigint(20) NOT NULL COMMENT '用户的id(sys_usr.id)',
    `role_id`     bigint(20) NOT NULL COMMENT '角色的id(sys_role.id)',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 0 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- 用户角色表
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色的id',
    `role_name`    varchar(50) NOT NULL,
    `descriptions` varchar(200) COMMENT '描述',
    `pid`          bigint(20) COMMENT '上级角色id',
    `pname`        varchar(50) COMMENT '上级角色名称',
    `level`        varchar(1) COMMENT '1:超级管理员层；2:管理员层：3:业务角色层',
    `created_by`   varchar(50) COMMENT '创建人 ',
    `types`        varchar(5)           DEFAULT '0' COMMENT '0:对外开放 1:不对外开放',
    `status`       int(11) COMMENT '状态 0:关闭1:正常',
    `create_time`  datetime,
    `deleted`      bit(1)      NOT NULL DEFAULT 0 COMMENT '0:正常1:删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 0 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- 角色对应的目录
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT,
    `menu_id` bigint(20) NOT NULL COMMENT '目录的id(sys_menu.id)',
    `role_id` bigint(20) NOT NULL COMMENT '角色的id(sys_role.id)',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX     `menu_id`(`menu_id`) USING BTREE,
    INDEX     `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 0 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色拥有菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- 目录表
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `id`             bigint(20) NOT NULL AUTO_INCREMENT,
    `parent_menu_id` bigint(20) COMMENT '父菜单id,null最高级别',
    `menu_name`      varchar(50) NOT NULL COMMENT '菜单名称',
    `menu_url`       varchar(100) COMMENT '菜单URL',
    `menu_level`     int(6) COMMENT '菜单级别',
    `menu_order`     int(11) COMMENT '菜单排序',
    `status`         int(5) DEFAULT 0 COMMENT '0：正常    1：已删除',
    `create_time`    datetime,
    `create_by`      bigint(20),
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 0 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '后台菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- 系统配置表
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT,
    `classify`     varchar(20) COMMENT '分类',
    `config_type`  varchar(30) COMMENT '类型',
    `config_name`  varchar(30) COMMENT '名称',
    `config_value` varchar(50) COMMENT '值',
    `descriptions` varchar(100),
    `create_time`  datetime,
    `create_by`    varchar(36),
    `update_time`  datetime,
    `update_by`    varchar(36),
    `deleted`      bit(1) NOT NULL DEFAULT 0 COMMENT '0:正常1:删除',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `config_type`(`config_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 0 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统配置表' ROW_FORMAT = DYNAMIC;


