
-- ----------------------------
-- 用户表
-- ----------------------------
INSERT INTO `sys_user` ( `real_name`, `user_name`, `password`, `deleted`)VALUES ( 'admin', 'admin', '$2a$04$Kg9dFjJt57Eys/yFx3reeOacdSbBFZTjcbmcsnpael98vMN4rtevO', b'0');

-- ----------------------------
-- 用户角色表
-- ----------------------------
INSERT INTO `sys_user_role` ( `sys_user_id`, `role_id`) VALUES ( 1, 1);

-- ----------------------------
-- 用户角色表
-- ----------------------------
INSERT INTO `sys_role` (`role_name`, `level`, `types`, `status`, `deleted`) VALUES ( '超级管理员', '1', '1', 0, b'0');


