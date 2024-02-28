-- ----------------------------
-- 药品信息表
-- ----------------------------
DROP TABLE IF EXISTS `agentias`;
CREATE TABLE `agentias`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT,
    `type`         int(11) NOT NULL COMMENT '药剂类型 1/针剂  2/粉剂',
    `name`         varchar(100) COMMENT '药剂名称',
    `soec_desc`    varchar(100) COMMENT '规格描述',
    `maker`        varchar(100) COMMENT '厂家',
    `bar_code`     varchar(30) COMMENT '条码',
    `age_diameter` double(5, 2) COMMENT '直径',
    `age_height`    double(5, 2)  COMMENT '高度',
    `capacity`      int(10)  COMMENT '容量',
    `alarm_num`     int(10)  COMMENT '药剂总数量预警值',
    `box_alarm_num` int(10)  COMMENT '单药匣数量预警值',
    `pack_max_num`  int(10)  COMMENT '每包药最大值',
    `create_time`   datetime     ,
    `create_by`     varchar(36) ,
    `update_time`   datetime    ,
    `update_by`     varchar(36) ,
    `deleted` bit(1) NOT NULL DEFAULT 0 COMMENT '0:正常1:删除',
    `local_address` varchar(100)  COMMENT '药品存放位置',
    `isignore`      varchar(255) DEFAULT '0' COMMENT '是否忽略 0/否 1/是',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 0 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '药剂表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- 药匣分配药剂关联表
-- 药匣-药品(中间表)
-- 可以删除
-- ----------------------------
DROP TABLE IF EXISTS `agentia_box_agentias`;
CREATE TABLE `agentia_box_agentias`
(
    `id`          BIGINT ( 20 ) NOT NULL AUTO_INCREMENT,
    `box_id`      BIGINT ( 20 ) NOT NULL COMMENT '药匣id(agentia_box.id)',
    `agentias_id` BIGINT ( 20 ) NOT NULL COMMENT '药剂id(agentias.id)',
    `create_time` datetime,
    `create_by`   VARCHAR(50),
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 0 CHARACTER
SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '药匣分配药剂关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- 药匣表
-- 存在问题(已经有了关联表，这里有冗余药片相关的信息)
-- indate 有效期做什么？
-- ----------------------------
DROP TABLE IF EXISTS `agentia_box`;
CREATE TABLE `agentia_box`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT,
    `box_soec_id`   bigint(20) NOT NULL COMMENT '药匣规格id',
    `box_no`        varchar(50) COMMENT '编号',
    `box_capacity`  int(11) COMMENT '药匣容量',
    `box_curr_num`  int(11) COMMENT '当前药剂数量',
    `usable_num`    int(11) COMMENT '药剂可使用量',
    `agentias_id`   bigint(20) COMMENT '药剂id(agentias.id)',
    `agentias_name` varchar(100) COMMENT '药剂名称',
    `indate`        date COMMENT '有效期',
    `status`        int(4) COMMENT '状态 1/正常',
    `create_by`     varchar(36),
    `create_time`   datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`     varchar(36),
    `update_time`   datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `deleted`       bit(1) NOT NULL DEFAULT 0 COMMENT '0:正常1:删除',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX           `index_agentiasid`(`agentias_id`) USING BTREE,
    INDEX           `index_usable_num`(`usable_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 0 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '药匣表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- 柜体仓位表
-- ----------------------------
DROP TABLE IF EXISTS `agentia_cabinet_space`;
CREATE TABLE `agentia_cabinet_space`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT,
    `cabinet_id`       bigint(20) COMMENT '柜体id(TODO)',
    `cabinet_name`     varchar(30) COMMENT '柜体名称',
    `plies_num`        int(11) COMMENT '层数',
    `cabinet_space_no` varchar(30) COMMENT '仓位编号',
    `box_id`           bigint(20) COMMENT '药匣id(agentia_box.id)',
    `box_no`           varchar(30) COMMENT '药匣编号',
    `box_soec_id`      bigint(20) COMMENT '药匣规格id',
    `box_soec_name`    varchar(30) COMMENT '药匣规格名称',
    `status`           int(4) COMMENT '状态0:空仓1:正常2:药量不足6:驱动故障7:通信故障8:电机卡死',
    `use_status`       int(4) COMMENT '使用状态1:正常使用2:停止使用',
    `assign_flag`      bit(1) COMMENT '指定药品标志:true:指定药品false:未指定药品',
    `address`          int(20) COMMENT '寄存器地址',
    `create_time`      datetime,
    `create_by`        varchar(30),
    `save_num`         int(20) COMMENT '测试药匣装药量',
    `send_num`         int(20) COMMENT '测试每次掉药的数量',
    `agentias_name`    varchar(30) COMMENT '测试药品名称',
    `deleted`       bit(1) NOT NULL DEFAULT 0 COMMENT '0:正常1:删除',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX              `index_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 0 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '柜体仓位表' ROW_FORMAT = Dynamic;