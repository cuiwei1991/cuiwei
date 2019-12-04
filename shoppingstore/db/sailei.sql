/*
 Navicat Premium Data Transfer

 Source Server         : 测试环境
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : nuode.saileikeji.com:3306
 Source Schema         : sailei

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 25/09/2019 17:28:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `gen_table_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生成表编号 ',
  `category` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
  `project_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成文件路径',
  `package_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gen_scheme_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '生成方案' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------
INSERT INTO `gen_scheme` VALUES ('1850e6ddeab74845a04a3db13648b391', 'b76f202ac4224289ba34da58d804439f', 'tree', 'D:\\developer\\project\\sailei-admin', 'com.sailei.modules', 'test', 'tree', '族谱', '族谱', 'admin', 'admin', '2019-08-17 16:12:53', 'admin', '2019-08-20 17:22:47', NULL, '0');
INSERT INTO `gen_scheme` VALUES ('27c19a4eed024cfe845ee7ae8f1c71e4', '98fa61fe4d8549f5bfae4e3856f8418f', 'curd', 'G:\\', 'com.sailei.modules', 'test', 'news', '新闻', '新闻', '高进', 'admin', '2019-08-29 10:14:12', 'admin', '2019-09-20 09:18:00', NULL, '0');
INSERT INTO `gen_scheme` VALUES ('2d5750a0e3dd4d199fdf4a3f5df33027', 'e80566a8fed947ffa3688b70e6a312c3', 'left_tree', 'D:\\developer\\project\\sailei-admin', 'com.sailei.modules', 'test', 'leftTree', '商品', '商品', 'gaojin', 'admin', '2019-08-19 10:16:18', 'admin', '2019-08-19 11:26:41', NULL, '0');
INSERT INTO `gen_scheme` VALUES ('4491b842cef043a19bff887459b27946', 'a286de59c92e4928ad461bd3667c9afc', 'curd_many', 'D:\\development\\sailei-admin', 'com.sailei.modules2', 'test2', '', '测试用户', '测试用户', 'smallpan', 'admin', '2019-08-17 15:12:19', 'admin', '2019-09-03 09:54:45', NULL, '0');
INSERT INTO `gen_scheme` VALUES ('882abd3ac8614394b5dc9d4302488584', 'caec44cfa8594926b88d1db5807830a7', 'curd', 'D:\\developer\\project\\sailei-admin', 'com.sailei.modules', 'test', 'news', '新闻', '新闻', 'gaojin', 'admin', '2019-08-17 14:34:01', 'admin', '2019-08-20 17:22:34', NULL, '0');
INSERT INTO `gen_scheme` VALUES ('de5ad05250a74c71a1075fc7efd0e661', 'c06445ccd8ef45b3aa424b46f622fc86', 'left_tree', 'D:\\developer\\project\\sailei-admin', 'com.sailei.modules', 'gen', 'demo', '树结构', '树结构', 'admin', 'admin', '2019-08-13 17:11:59', 'admin', '2019-08-17 11:56:48', NULL, '0');
INSERT INTO `gen_scheme` VALUES ('e9e3f26801fd4bd0bb6cb59871135728', 'd0253e72548e425d9d104e3237fb710d', 'curd_many', 'D:\\developer\\project\\sailei-admin', 'com.sailei.modules', 'gen', 'demo', '测试', '订单', 'admin', 'admin', '2019-08-13 09:11:51', 'admin', '2019-08-13 09:24:59', NULL, '0');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `pk` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主键',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联父表外键',
  `table_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表类型',
  `issync` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步',
  `gen_id_type` int(1) NULL DEFAULT 0 COMMENT '主键策略 0 默认UUID 1 自动递增',
  `sync_sql` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'select 1' COMMENT '同步sql',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gen_table_name`(`name`) USING BTREE,
  INDEX `gen_table_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('48154127b1e34256b919bba54277ee8e', 'test_good_info', 'id', '商品表', 'TestGoodInfo', 'test_good_class', 'class_id', '5', '1', 0, '', '1', '2019-08-19 10:11:09', '1', NULL, NULL, '0');
INSERT INTO `gen_table` VALUES ('98fa61fe4d8549f5bfae4e3856f8418f', 'test_news', 'id', '新闻表', 'TestNews', '', '', '0', '1', 0, NULL, NULL, '2019-08-29 10:11:26', '1', NULL, NULL, '0');
INSERT INTO `gen_table` VALUES ('9f863bc1e4514430a9024b617b839a3e', 'test_user_dept', 'id', '客户部门', 'TestUserDept', 'test_user', 'user_id', '2', '1', 0, '', '1', '2019-08-17 15:11:08', '1', NULL, NULL, '0');
INSERT INTO `gen_table` VALUES ('a286de59c92e4928ad461bd3667c9afc', 'test_user', 'id', '用户表', 'TestUser', '', '', '1', '1', 0, '', '1', '2019-08-17 15:05:06', '1', NULL, NULL, '0');
INSERT INTO `gen_table` VALUES ('b76f202ac4224289ba34da58d804439f', 'test_genealogy', 'id', '族谱表', 'TestGenealogy', '', '', '3', '1', 1, '', '1', '2019-08-17 16:11:15', '1', NULL, NULL, '0');
INSERT INTO `gen_table` VALUES ('bc875f4af86542f48effe59560a38063', 'test_user_school', 'id', '客户学校', 'TestUserSchool', 'test_user', 'user_id', '2', '1', 0, '', '1', '2019-08-17 15:08:44', '1', NULL, NULL, '0');
INSERT INTO `gen_table` VALUES ('e80566a8fed947ffa3688b70e6a312c3', 'test_good_class', 'id', '商品分类', 'TestGoodClass', '', '', '4', '1', 0, '', '1', '2019-08-19 09:24:34', '1', NULL, NULL, '0');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键',
  `is_null` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可为空',
  `is_insert` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段',
  `is_query` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gen_table_column_table_id`(`gen_table_id`) USING BTREE,
  INDEX `gen_table_column_name`(`name`) USING BTREE,
  INDEX `gen_table_column_sort`(`sort`) USING BTREE,
  INDEX `gen_table_column_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('01eadd7310f049efa8904720fa798576', '48154127b1e34256b919bba54277ee8e', 'image', '商品图片', 'varchar(64)', 'String', 'image', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 4, '1', '2019-08-19 11:09:40', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('0202580d1aff41428abb27406827ea05', 'e80566a8fed947ffa3688b70e6a312c3', 'create_date', '创建时间', 'datetime(0)', 'java.util.Date', 'createDate', '0', '1', '1', '0', '1', '0', '', 'input', '', NULL, 8, '1', '2019-08-19 10:52:14', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('02224232ff8b449694c7f834eaf466fc', 'a286de59c92e4928ad461bd3667c9afc', 'del_flag', '删除标记', 'int(1)', 'Integer', 'delFlag', '0', '0', '0', '0', '0', '0', '', 'input', 'DEL_FLAG', NULL, 11, '1', '2019-08-20 17:37:21', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('03383fcb82184eedba22798232b67fe4', '48154127b1e34256b919bba54277ee8e', 'is_recommend', '是否热门', 'int(11)', 'Integer', 'isRecommend', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 5, '1', '2019-08-19 11:09:40', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('03be11a5bd464a80a0062779c21ba232', 'e80566a8fed947ffa3688b70e6a312c3', 'parent_ids', '上级树', 'varchar(64)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', '', 'input', '', NULL, 5, '1', '2019-08-19 10:52:14', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('0747b564108d4bf3bafc29c8d2873593', 'bc875f4af86542f48effe59560a38063', 'school_name', '学校名称', 'varchar(200)', 'String', 'schoolName', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 5, '1', '2019-08-19 12:08:10', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('0d6eb1d00fe442d3bff9a96538b0434f', 'e80566a8fed947ffa3688b70e6a312c3', 'name', '分类名称', 'varchar(64)', 'String', 'name', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 6, '1', '2019-08-19 10:52:14', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('0e07b92909ef454dbe589dd82a62a2f2', 'e80566a8fed947ffa3688b70e6a312c3', 'del_flag', '删除标记', 'int(1)', 'Integer', 'delFlag', '0', '1', '1', '1', '0', '0', '', 'input', 'DEL_FLAG', NULL, 10, '1', '2019-08-19 10:52:14', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('0ec5a17a68d84b279a5b16cc09d8b7da', 'bc875f4af86542f48effe59560a38063', 'year', '入学年份', 'varchar(64)', 'String', 'year', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 7, '1', '2019-08-19 12:08:10', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('0f81d3462f104902908df8ae488331be', 'a286de59c92e4928ad461bd3667c9afc', 'id', 'ID', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '', 'input', '', NULL, 0, '1', '2019-08-20 17:37:21', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('14f1c5794b5940e993030becc9ce0123', '48154127b1e34256b919bba54277ee8e', 'good_code', '商品编码', 'varchar(64)', 'String', 'goodCode', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 1, '1', '2019-08-19 11:09:40', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('1509cdecc6bc4e1b958dade655d19671', 'a286de59c92e4928ad461bd3667c9afc', 'update_date', '修改时间', 'datetime(0)', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '', 'input', '', NULL, 10, '1', '2019-08-20 17:37:21', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('16f95377dfff4a51968280b5baf98270', 'bc875f4af86542f48effe59560a38063', 'update_date', '修改时间', 'datetime(0)', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '', 'input', '', NULL, 10, '1', '2019-08-19 12:08:10', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('1e013b7190b6470dafcd6db6475e6235', '48154127b1e34256b919bba54277ee8e', 'deion', '商品描述', 'varchar(64)', 'String', 'deion', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 3, '1', '2019-08-19 11:09:40', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('29d0ecb78fcc4be2a473a9d28e2308fe', '9f863bc1e4514430a9024b617b839a3e', 'dept_code', '部门名称', 'varchar(64)', 'String', 'deptCode', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 6, '1', '2019-08-19 12:07:43', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('334eece7904b42c1be8f74e9f368653b', 'e80566a8fed947ffa3688b70e6a312c3', 'sort', '排序', 'decimal(18,2)', 'java.math.BigDecimal', 'sort', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 7, '1', '2019-08-19 10:52:14', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('3ff9be2b47eb497bb1680057954e4556', 'e80566a8fed947ffa3688b70e6a312c3', 'id', 'ID', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '', 'input', '', NULL, 0, '1', '2019-08-19 10:52:14', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('418c0ae2787849d9b9c78a1722af732f', 'b76f202ac4224289ba34da58d804439f', 'update_date', '修改时间', 'datetime(0)', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '', 'input', '', NULL, 10, '1', '2019-08-17 17:32:16', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('549683a577514369822b514267e13f6f', 'a286de59c92e4928ad461bd3667c9afc', 'nick_name', '昵称', 'varchar(64)', 'String', 'nickName', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 5, '1', '2019-08-20 17:37:21', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('554027d36a7947d98e30db4309ac5b18', '9f863bc1e4514430a9024b617b839a3e', 'update_date', '修改时间', 'datetime(0)', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '', 'input', '', NULL, 9, '1', '2019-08-19 12:07:43', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('56f185c951074cd98e1a0927d6d0321c', 'bc875f4af86542f48effe59560a38063', 'create_date', '创建时间', 'datetime(0)', 'java.util.Date', 'createDate', '0', '1', '1', '0', '1', '0', '', 'input', '', NULL, 9, '1', '2019-08-19 12:08:10', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('5e893303f1a84761a56e922ed4941212', 'b76f202ac4224289ba34da58d804439f', 'call_name', '称呼', 'varchar(100)', 'String', 'callName', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 6, '1', '2019-08-17 17:32:16', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('5f77acf05d1d461a8424068d0c4ec68e', 'b76f202ac4224289ba34da58d804439f', 'del_flag', '删除标记', 'int(1)', 'Integer', 'delFlag', '0', '1', '1', '1', '0', '0', '', 'input', 'DEL_FLAG', NULL, 11, '1', '2019-08-17 17:32:16', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('6134ad638fb84ba5a51f40f5d7d49ed2', 'a286de59c92e4928ad461bd3667c9afc', 'age', '年龄', 'int(11)', 'Integer', 'age', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 6, '1', '2019-08-20 17:37:21', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('68eebbb24a114f8999ff53247688a691', 'e80566a8fed947ffa3688b70e6a312c3', 'update_date', '修改时间', 'datetime(0)', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '', 'input', '', NULL, 9, '1', '2019-08-19 10:52:14', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('6aa26428aff04b4d842d69dd3ab94ec7', '48154127b1e34256b919bba54277ee8e', 'id', 'ID', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '', 'input', '', NULL, 0, '1', '2019-08-19 11:09:40', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('70f9f805bad74a39be2209826b6d1bf7', '48154127b1e34256b919bba54277ee8e', 'class_id', '分类', 'varchar(64)', 'String', 'classId', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 7, '1', '2019-08-19 11:09:40', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('73ee2158c41f4801868192a7c706d300', '9f863bc1e4514430a9024b617b839a3e', 'user_id', '用户编号', 'varchar(64)', 'String', 'userId', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 4, '1', '2019-08-19 12:07:43', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('748884071b514e94963f52e5d6062b56', '98fa61fe4d8549f5bfae4e3856f8418f', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '1', '1', '1', '1', '', '', 'input', '', NULL, 2, '1', '2019-09-24 14:51:41', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('74e56c743cbb4bceb2b2d708bfb007cd', 'b76f202ac4224289ba34da58d804439f', 'name', '姓名', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 4, '1', '2019-08-17 17:32:16', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('7a65cafc3f2c46079e4374a492f0c5e7', 'a286de59c92e4928ad461bd3667c9afc', 'create_date', '创建时间', 'datetime(0)', 'java.util.Date', 'createDate', '0', '1', '1', '0', '1', '0', '', 'input', '', NULL, 9, '1', '2019-08-20 17:37:21', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('7ab3291f69f049cc835c18b46e9c8517', '48154127b1e34256b919bba54277ee8e', 'price', '价格', 'decimal(18,2)', 'java.math.BigDecimal', 'price', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 6, '1', '2019-08-19 11:09:40', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('7b76cb996a434da0a2966fb0d0af8de8', '98fa61fe4d8549f5bfae4e3856f8418f', 'public_time', '发布时间', 'datetime(0)', 'String', 'publicTime', '0', '1', '1', '1', '1', '', '', 'input', '', NULL, 8, '1', '2019-09-24 14:51:41', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('7be86b579a2e47188ded7367c4d1caea', 'a286de59c92e4928ad461bd3667c9afc', 'mobile', '手机号', 'varchar(11)', 'String', 'mobile', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 8, '1', '2019-08-20 17:37:21', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('7eb048db167345d198b9772b037d21ae', 'bc875f4af86542f48effe59560a38063', 'user_id', '用户编号', 'varchar(64)', 'String', 'userId', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 4, '1', '2019-08-19 12:08:10', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('803ca9267de344bfb70ff92d41f77e69', 'b76f202ac4224289ba34da58d804439f', 'create_date', '创建时间', 'datetime(0)', 'java.util.Date', 'createDate', '0', '1', '1', '0', '0', '0', '', 'input', '', NULL, 9, '1', '2019-08-17 17:32:16', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('82128ee3198241e3a459ea62ff076460', '9f863bc1e4514430a9024b617b839a3e', 'dept_job', '部门职位', 'varchar(64)', 'String', 'deptJob', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 7, '1', '2019-08-19 12:07:43', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('82ffdd2281624765a6d0ebc91cc6ebd0', '98fa61fe4d8549f5bfae4e3856f8418f', 'type', 'sdsdsd', 'int(1)', 'Integer', 'type', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 0, '1', '2019-09-24 14:51:41', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('87fa21b1af94478fb27e2bc9852fca97', '98fa61fe4d8549f5bfae4e3856f8418f', 'content', '内容3', 'varchar(64)', 'String', 'content', '0', '1', '1', '1', '1', '', '', 'input', '', NULL, 6, '1', '2019-09-24 14:51:41', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('8d5f87ce7b9047d2bb0d3ad2f0be8a30', 'b76f202ac4224289ba34da58d804439f', 'parent_ids', '父节点编号列表', 'varchar(5000)', 'String', 'parentIds', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 8, '1', '2019-08-17 17:32:16', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('8e5c6eeeba76420a92041fdd2a30a909', 'e80566a8fed947ffa3688b70e6a312c3', 'parent_id', '上级ID', 'varchar(64)', 'String', 'parentId', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 4, '1', '2019-08-19 10:52:14', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('92460f9c85e446b69dc914540ffa98f5', 'a286de59c92e4928ad461bd3667c9afc', 'name', '姓名', 'varchar(64)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 4, '1', '2019-08-20 17:37:21', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('996d789e5057495ab9e39f62ab3d5562', 'a286de59c92e4928ad461bd3667c9afc', 'id_number', '身份证号', 'varchar(64)', 'String', 'idNumber', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 7, '1', '2019-08-20 17:37:21', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('9ca422334c0941578e8e724f03a022df', 'b76f202ac4224289ba34da58d804439f', 'parent_id', '父节点编号', 'varchar(100)', 'String', 'parentId', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 7, '1', '2019-08-17 17:32:16', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('a856ae605e2343b9a2d019b252235cee', '9f863bc1e4514430a9024b617b839a3e', 'create_date', '创建时间', 'datetime(0)', 'java.util.Date', 'createDate', '0', '1', '1', '0', '1', '0', '', 'input', '', NULL, 8, '1', '2019-08-19 12:07:43', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('aafea378f2c3447ab81e885461ac42df', '48154127b1e34256b919bba54277ee8e', 'update_date', '修改时间', 'datetime(0)', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '', 'input', '', NULL, 9, '1', '2019-08-19 11:09:40', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('ae4c484dc7ab45559dd4e2658e5a4466', '9f863bc1e4514430a9024b617b839a3e', 'id', 'ID', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '', 'input', '', NULL, 0, '1', '2019-08-19 12:07:43', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('af066bd596584a97879b0bed26fe03bd', '48154127b1e34256b919bba54277ee8e', 'del_flag', '删除标记', 'int(1)', 'Integer', 'delFlag', '0', '1', '1', '1', '1', '0', '', 'input', 'DEL_FLAG', NULL, 10, '1', '2019-08-19 11:09:40', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('b50e502e9c594dd6bea5d31d630ee4fb', 'bc875f4af86542f48effe59560a38063', 'id', 'ID', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '', 'input', '', NULL, 0, '1', '2019-08-19 12:08:10', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('b82778c247324d1491e3c56242b926b8', 'bc875f4af86542f48effe59560a38063', 'type', '学校类型', 'varchar(64)', 'String', 'type', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 6, '1', '2019-08-19 12:08:10', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('b9a4a96b1fd44675965baf5aeeb47439', 'b76f202ac4224289ba34da58d804439f', 'id', 'ID', 'int(11)', 'Integer', 'id', '1', '0', '1', '0', '0', '0', '', 'input', '', NULL, 0, '1', '2019-08-17 17:32:16', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('c9e0f1d09f31492782217697cc9194ba', '98fa61fe4d8549f5bfae4e3856f8418f', 'update_date', '修改时间', 'datetime', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '', '', 'input', '', NULL, 3, '1', '2019-09-24 14:51:41', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('cab85f5ccded4d77a4d98c2a4c903b3f', '9f863bc1e4514430a9024b617b839a3e', 'del_flag', '删除标记', 'int(1)', 'Integer', 'delFlag', '0', '0', '0', '0', '0', '0', '', 'input', 'DEL_FLAG', NULL, 10, '1', '2019-08-19 12:07:43', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('d35a4b410c7540f7b13cf428b2dfbcbd', '98fa61fe4d8549f5bfae4e3856f8418f', 'id', 'ID', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '', '', 'input', '', NULL, 1, '1', '2019-09-24 14:51:41', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('d3d0a3f5d8854caba867133698d5404e', '48154127b1e34256b919bba54277ee8e', 'title', '商品名称', 'varchar(64)', 'String', 'title', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 2, '1', '2019-08-19 11:09:40', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('d63febf9aa2f4082b581993258db4137', 'b76f202ac4224289ba34da58d804439f', 'seniority', '辈分', 'varchar(100)', 'String', 'seniority', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 5, '1', '2019-08-17 17:32:16', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('e03a12030ca34ebfa7b1c665c4f540be', 'bc875f4af86542f48effe59560a38063', 'address', '详细地址', 'varchar(500)', 'String', 'address', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 8, '1', '2019-08-19 12:08:10', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('f0f5186fdf77408f93c3ee412ccaeead', 'bc875f4af86542f48effe59560a38063', 'del_flag', '删除标记', 'int(1)', 'Integer', 'delFlag', '0', '0', '0', '0', '0', '0', '', 'input', 'DEL_FLAG', NULL, 11, '1', '2019-08-19 12:08:10', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('f51d0a69197349c5aa34c4277d214cbe', '98fa61fe4d8549f5bfae4e3856f8418f', 'title', '标题', 'varchar(64)', 'String', 'title', '0', '1', '1', '1', '1', '', '', 'input', '', NULL, 5, '1', '2019-09-24 14:51:41', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('fc67dd3b5c014326aa8e01d6adbe080b', '9f863bc1e4514430a9024b617b839a3e', 'dept_name', '部门名称', 'varchar(64)', 'String', 'deptName', '0', '0', '1', '1', '1', '0', '', 'input', '', NULL, 5, '1', '2019-08-19 12:07:43', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('fc77efc2f41f45e2a99f15c9bdf0dc88', '98fa61fe4d8549f5bfae4e3856f8418f', 'del_flag', '删除标记', 'int(11)', 'Integer', 'delFlag', '0', '1', '0', '0', '0', '', '', 'input', '', NULL, 4, '1', '2019-09-24 14:51:41', '1', NULL, NULL, '0');
INSERT INTO `gen_table_column` VALUES ('ffc343ca705c4bebb2e8709fa08dc0a8', '48154127b1e34256b919bba54277ee8e', 'create_date', '创建时间', 'datetime(0)', 'java.util.Date', 'createDate', '0', '1', '1', '0', '1', '0', '', 'input', '', NULL, 8, '1', '2019-08-19 11:09:40', '1', NULL, NULL, '0');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '编号',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有父级编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `level` int(1) NULL DEFAULT 1 COMMENT '区域级别',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区域表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('100000000000', '0', '', '中国', 0, 0);
INSERT INTO `sys_area` VALUES ('110000000000', '100000000000', '0,', '北京市', 1, 0);
INSERT INTO `sys_area` VALUES ('110101000000', '110900000000', '0,110000000000,110900000000', '东城区', 3, 0);
INSERT INTO `sys_area` VALUES ('1101010000000222', '110000000000', '0,110000000000,', '开发部', 2, 1);
INSERT INTO `sys_area` VALUES ('110102000000', '110900000000', '0,110000000000,110900000000', '西城区', 3, 0);
INSERT INTO `sys_area` VALUES ('110105000000', '110900000000', '0,110000000000,110900000000', '朝阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('110106000000', '110900000000', '0,110000000000,110900000000', '丰台区', 3, 0);
INSERT INTO `sys_area` VALUES ('110107000000', '110900000000', '0,110000000000,110900000000', '石景山区', 3, 0);
INSERT INTO `sys_area` VALUES ('110108000000', '110900000000', '0,110000000000,110900000000', '海淀区', 3, 0);
INSERT INTO `sys_area` VALUES ('110109000000', '110900000000', '0,110000000000,110900000000', '门头沟区', 3, 0);
INSERT INTO `sys_area` VALUES ('110111000000', '110900000000', '0,110000000000,110900000000', '房山区', 3, 0);
INSERT INTO `sys_area` VALUES ('110112000000', '110900000000', '0,110000000000,110900000000', '通州区', 3, 0);
INSERT INTO `sys_area` VALUES ('110113000000', '110900000000', '0,110000000000,110900000000', '顺义区', 3, 0);
INSERT INTO `sys_area` VALUES ('110114000000', '110900000000', '0,110000000000,110900000000', '昌平区', 3, 0);
INSERT INTO `sys_area` VALUES ('110115000000', '110900000000', '0,110000000000,110900000000', '大兴区', 3, 0);
INSERT INTO `sys_area` VALUES ('110116000000', '110900000000', '0,110000000000,110900000000', '怀柔区', 3, 0);
INSERT INTO `sys_area` VALUES ('110117000000', '110900000000', '0,110000000000,110900000000', '平谷区', 3, 0);
INSERT INTO `sys_area` VALUES ('110228000000', '110900000000', '0,110000000000,110900000000', '密云县', 3, 0);
INSERT INTO `sys_area` VALUES ('110229000000', '110900000000', '0,110000000000,110900000000', '延庆县', 3, 0);
INSERT INTO `sys_area` VALUES ('110900000000', '110000000000', '0,110000000000', '北京市', 2, 0);
INSERT INTO `sys_area` VALUES ('120000000000', '100000000000', '0,', '天津市', 1, 0);
INSERT INTO `sys_area` VALUES ('120101000000', '120900000000', '0,120000000000,120900000000', '和平区', 3, 0);
INSERT INTO `sys_area` VALUES ('120102000000', '120900000000', '0,120000000000,120900000000', '河东区', 3, 0);
INSERT INTO `sys_area` VALUES ('120103000000', '120900000000', '0,120000000000,120900000000', '河西区', 3, 0);
INSERT INTO `sys_area` VALUES ('120104000000', '120900000000', '0,120000000000,120900000000', '南开区', 3, 0);
INSERT INTO `sys_area` VALUES ('120105000000', '120900000000', '0,120000000000,120900000000', '河北区', 3, 0);
INSERT INTO `sys_area` VALUES ('120106000000', '120900000000', '0,120000000000,120900000000', '红桥区', 3, 0);
INSERT INTO `sys_area` VALUES ('120110000000', '120900000000', '0,120000000000,120900000000', '东丽区', 3, 0);
INSERT INTO `sys_area` VALUES ('120111000000', '120900000000', '0,120000000000,120900000000', '西青区', 3, 0);
INSERT INTO `sys_area` VALUES ('120112000000', '120900000000', '0,120000000000,120900000000', '津南区', 3, 0);
INSERT INTO `sys_area` VALUES ('120113000000', '120900000000', '0,120000000000,120900000000', '北辰区', 3, 0);
INSERT INTO `sys_area` VALUES ('120114000000', '120900000000', '0,120000000000,120900000000', '武清区', 3, 0);
INSERT INTO `sys_area` VALUES ('120115000000', '120900000000', '0,120000000000,120900000000', '宝坻区', 3, 0);
INSERT INTO `sys_area` VALUES ('120116000000', '120900000000', '0,120000000000,120900000000', '滨海新区', 3, 0);
INSERT INTO `sys_area` VALUES ('120117000000', '120900000000', '0,120000000000,120900000000', '宁河区', 3, 0);
INSERT INTO `sys_area` VALUES ('120118000000', '120900000000', '0,120000000000,120900000000', '静海区', 3, 0);
INSERT INTO `sys_area` VALUES ('120225000000', '120900000000', '0,120000000000,120900000000', '蓟县', 3, 0);
INSERT INTO `sys_area` VALUES ('120900000000', '120000000000', '0,120000000000', '天津市', 2, 0);
INSERT INTO `sys_area` VALUES ('130000000000', '100000000000', '0,', '河北省', 1, 0);
INSERT INTO `sys_area` VALUES ('130100000000', '130000000000', '0,130000000000', '石家庄市', 2, 0);
INSERT INTO `sys_area` VALUES ('130102000000', '130100000000', '0,130000000000,130100000000', '长安区', 3, 0);
INSERT INTO `sys_area` VALUES ('130104000000', '130100000000', '0,130000000000,130100000000', '桥西区', 3, 0);
INSERT INTO `sys_area` VALUES ('130105000000', '130100000000', '0,130000000000,130100000000', '新华区', 3, 0);
INSERT INTO `sys_area` VALUES ('130107000000', '130100000000', '0,130000000000,130100000000', '井陉矿区', 3, 0);
INSERT INTO `sys_area` VALUES ('130108000000', '130100000000', '0,130000000000,130100000000', '裕华区', 3, 0);
INSERT INTO `sys_area` VALUES ('130109000000', '130100000000', '0,130000000000,130100000000', '藁城区', 3, 0);
INSERT INTO `sys_area` VALUES ('130110000000', '130100000000', '0,130000000000,130100000000', '鹿泉区', 3, 0);
INSERT INTO `sys_area` VALUES ('130111000000', '130100000000', '0,130000000000,130100000000', '栾城区', 3, 0);
INSERT INTO `sys_area` VALUES ('130121000000', '130100000000', '0,130000000000,130100000000', '井陉县', 3, 0);
INSERT INTO `sys_area` VALUES ('130123000000', '130100000000', '0,130000000000,130100000000', '正定县', 3, 0);
INSERT INTO `sys_area` VALUES ('130125000000', '130100000000', '0,130000000000,130100000000', '行唐县', 3, 0);
INSERT INTO `sys_area` VALUES ('130126000000', '130100000000', '0,130000000000,130100000000', '灵寿县', 3, 0);
INSERT INTO `sys_area` VALUES ('130127000000', '130100000000', '0,130000000000,130100000000', '高邑县', 3, 0);
INSERT INTO `sys_area` VALUES ('130128000000', '130100000000', '0,130000000000,130100000000', '深泽县', 3, 0);
INSERT INTO `sys_area` VALUES ('130129000000', '130100000000', '0,130000000000,130100000000', '赞皇县', 3, 0);
INSERT INTO `sys_area` VALUES ('130130000000', '130100000000', '0,130000000000,130100000000', '无极县', 3, 0);
INSERT INTO `sys_area` VALUES ('130131000000', '130100000000', '0,130000000000,130100000000', '平山县', 3, 0);
INSERT INTO `sys_area` VALUES ('130132000000', '130100000000', '0,130000000000,130100000000', '元氏县', 3, 0);
INSERT INTO `sys_area` VALUES ('130133000000', '130100000000', '0,130000000000,130100000000', '赵县', 3, 0);
INSERT INTO `sys_area` VALUES ('130183000000', '130100000000', '0,130000000000,130100000000', '晋州市', 3, 0);
INSERT INTO `sys_area` VALUES ('130184000000', '130100000000', '0,130000000000,130100000000', '新乐市', 3, 0);
INSERT INTO `sys_area` VALUES ('130200000000', '130000000000', '0,130000000000', '唐山市', 2, 0);
INSERT INTO `sys_area` VALUES ('130202000000', '130200000000', '0,130000000000,130200000000', '路南区', 3, 0);
INSERT INTO `sys_area` VALUES ('130203000000', '130200000000', '0,130000000000,130200000000', '路北区', 3, 0);
INSERT INTO `sys_area` VALUES ('130204000000', '130200000000', '0,130000000000,130200000000', '古冶区', 3, 0);
INSERT INTO `sys_area` VALUES ('130205000000', '130200000000', '0,130000000000,130200000000', '开平区', 3, 0);
INSERT INTO `sys_area` VALUES ('130207000000', '130200000000', '0,130000000000,130200000000', '丰南区', 3, 0);
INSERT INTO `sys_area` VALUES ('130208000000', '130200000000', '0,130000000000,130200000000', '丰润区', 3, 0);
INSERT INTO `sys_area` VALUES ('130209000000', '130200000000', '0,130000000000,130200000000', '曹妃甸区', 3, 0);
INSERT INTO `sys_area` VALUES ('130223000000', '130200000000', '0,130000000000,130200000000', '滦县', 3, 0);
INSERT INTO `sys_area` VALUES ('130224000000', '130200000000', '0,130000000000,130200000000', '滦南县', 3, 0);
INSERT INTO `sys_area` VALUES ('130225000000', '130200000000', '0,130000000000,130200000000', '乐亭县', 3, 0);
INSERT INTO `sys_area` VALUES ('130227000000', '130200000000', '0,130000000000,130200000000', '迁西县', 3, 0);
INSERT INTO `sys_area` VALUES ('130229000000', '130200000000', '0,130000000000,130200000000', '玉田县', 3, 0);
INSERT INTO `sys_area` VALUES ('130281000000', '130200000000', '0,130000000000,130200000000', '遵化市', 3, 0);
INSERT INTO `sys_area` VALUES ('130283000000', '130200000000', '0,130000000000,130200000000', '迁安市', 3, 0);
INSERT INTO `sys_area` VALUES ('130300000000', '130000000000', '0,130000000000', '秦皇岛市', 2, 0);
INSERT INTO `sys_area` VALUES ('130302000000', '130300000000', '0,130000000000,130300000000', '海港区', 3, 0);
INSERT INTO `sys_area` VALUES ('130303000000', '130300000000', '0,130000000000,130300000000', '山海关区', 3, 0);
INSERT INTO `sys_area` VALUES ('130304000000', '130300000000', '0,130000000000,130300000000', '北戴河区', 3, 0);
INSERT INTO `sys_area` VALUES ('130306000000', '130300000000', '0,130000000000,130300000000', '抚宁区', 3, 0);
INSERT INTO `sys_area` VALUES ('130321000000', '130300000000', '0,130000000000,130300000000', '青龙满族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('130322000000', '130300000000', '0,130000000000,130300000000', '昌黎县', 3, 0);
INSERT INTO `sys_area` VALUES ('130324000000', '130300000000', '0,130000000000,130300000000', '卢龙县', 3, 0);
INSERT INTO `sys_area` VALUES ('130400000000', '130000000000', '0,130000000000', '邯郸市', 2, 0);
INSERT INTO `sys_area` VALUES ('130402000000', '130400000000', '0,130000000000,130400000000', '邯山区', 3, 0);
INSERT INTO `sys_area` VALUES ('130403000000', '130400000000', '0,130000000000,130400000000', '丛台区', 3, 0);
INSERT INTO `sys_area` VALUES ('130404000000', '130400000000', '0,130000000000,130400000000', '复兴区', 3, 0);
INSERT INTO `sys_area` VALUES ('130406000000', '130400000000', '0,130000000000,130400000000', '峰峰矿区', 3, 0);
INSERT INTO `sys_area` VALUES ('130421000000', '130400000000', '0,130000000000,130400000000', '邯郸县', 3, 0);
INSERT INTO `sys_area` VALUES ('130423000000', '130400000000', '0,130000000000,130400000000', '临漳县', 3, 0);
INSERT INTO `sys_area` VALUES ('130424000000', '130400000000', '0,130000000000,130400000000', '成安县', 3, 0);
INSERT INTO `sys_area` VALUES ('130425000000', '130400000000', '0,130000000000,130400000000', '大名县', 3, 0);
INSERT INTO `sys_area` VALUES ('130426000000', '130400000000', '0,130000000000,130400000000', '涉县', 3, 0);
INSERT INTO `sys_area` VALUES ('130427000000', '130400000000', '0,130000000000,130400000000', '磁县', 3, 0);
INSERT INTO `sys_area` VALUES ('130428000000', '130400000000', '0,130000000000,130400000000', '肥乡县', 3, 0);
INSERT INTO `sys_area` VALUES ('130429000000', '130400000000', '0,130000000000,130400000000', '永年县', 3, 0);
INSERT INTO `sys_area` VALUES ('130430000000', '130400000000', '0,130000000000,130400000000', '邱县', 3, 0);
INSERT INTO `sys_area` VALUES ('130431000000', '130400000000', '0,130000000000,130400000000', '鸡泽县', 3, 0);
INSERT INTO `sys_area` VALUES ('130432000000', '130400000000', '0,130000000000,130400000000', '广平县', 3, 0);
INSERT INTO `sys_area` VALUES ('130433000000', '130400000000', '0,130000000000,130400000000', '馆陶县', 3, 0);
INSERT INTO `sys_area` VALUES ('130434000000', '130400000000', '0,130000000000,130400000000', '魏县', 3, 0);
INSERT INTO `sys_area` VALUES ('130435000000', '130400000000', '0,130000000000,130400000000', '曲周县', 3, 0);
INSERT INTO `sys_area` VALUES ('130481000000', '130400000000', '0,130000000000,130400000000', '武安市', 3, 0);
INSERT INTO `sys_area` VALUES ('130500000000', '130000000000', '0,130000000000', '邢台市', 2, 0);
INSERT INTO `sys_area` VALUES ('130502000000', '130500000000', '0,130000000000,130500000000', '桥东区', 3, 0);
INSERT INTO `sys_area` VALUES ('130503000000', '130500000000', '0,130000000000,130500000000', '桥西区', 3, 0);
INSERT INTO `sys_area` VALUES ('130521000000', '130500000000', '0,130000000000,130500000000', '邢台县', 3, 0);
INSERT INTO `sys_area` VALUES ('130522000000', '130500000000', '0,130000000000,130500000000', '临城县', 3, 0);
INSERT INTO `sys_area` VALUES ('130523000000', '130500000000', '0,130000000000,130500000000', '内丘县', 3, 0);
INSERT INTO `sys_area` VALUES ('130524000000', '130500000000', '0,130000000000,130500000000', '柏乡县', 3, 0);
INSERT INTO `sys_area` VALUES ('130525000000', '130500000000', '0,130000000000,130500000000', '隆尧县', 3, 0);
INSERT INTO `sys_area` VALUES ('130526000000', '130500000000', '0,130000000000,130500000000', '任县', 3, 0);
INSERT INTO `sys_area` VALUES ('130527000000', '130500000000', '0,130000000000,130500000000', '南和县', 3, 0);
INSERT INTO `sys_area` VALUES ('130528000000', '130500000000', '0,130000000000,130500000000', '宁晋县', 3, 0);
INSERT INTO `sys_area` VALUES ('130529000000', '130500000000', '0,130000000000,130500000000', '巨鹿县', 3, 0);
INSERT INTO `sys_area` VALUES ('130530000000', '130500000000', '0,130000000000,130500000000', '新河县', 3, 0);
INSERT INTO `sys_area` VALUES ('130531000000', '130500000000', '0,130000000000,130500000000', '广宗县', 3, 0);
INSERT INTO `sys_area` VALUES ('130532000000', '130500000000', '0,130000000000,130500000000', '平乡县', 3, 0);
INSERT INTO `sys_area` VALUES ('130533000000', '130500000000', '0,130000000000,130500000000', '威县', 3, 0);
INSERT INTO `sys_area` VALUES ('130534000000', '130500000000', '0,130000000000,130500000000', '清河县', 3, 0);
INSERT INTO `sys_area` VALUES ('130535000000', '130500000000', '0,130000000000,130500000000', '临西县', 3, 0);
INSERT INTO `sys_area` VALUES ('130581000000', '130500000000', '0,130000000000,130500000000', '南宫市', 3, 0);
INSERT INTO `sys_area` VALUES ('130582000000', '130500000000', '0,130000000000,130500000000', '沙河市', 3, 0);
INSERT INTO `sys_area` VALUES ('130600000000', '130000000000', '0,130000000000', '保定市', 2, 0);
INSERT INTO `sys_area` VALUES ('130602000000', '130600000000', '0,130000000000,130600000000', '竞秀区', 3, 0);
INSERT INTO `sys_area` VALUES ('130606000000', '130600000000', '0,130000000000,130600000000', '莲池区', 3, 0);
INSERT INTO `sys_area` VALUES ('130607000000', '130600000000', '0,130000000000,130600000000', '满城区', 3, 0);
INSERT INTO `sys_area` VALUES ('130608000000', '130600000000', '0,130000000000,130600000000', '清苑区', 3, 0);
INSERT INTO `sys_area` VALUES ('130609000000', '130600000000', '0,130000000000,130600000000', '徐水区', 3, 0);
INSERT INTO `sys_area` VALUES ('130623000000', '130600000000', '0,130000000000,130600000000', '涞水县', 3, 0);
INSERT INTO `sys_area` VALUES ('130624000000', '130600000000', '0,130000000000,130600000000', '阜平县', 3, 0);
INSERT INTO `sys_area` VALUES ('130626000000', '130600000000', '0,130000000000,130600000000', '定兴县', 3, 0);
INSERT INTO `sys_area` VALUES ('130627000000', '130600000000', '0,130000000000,130600000000', '唐县', 3, 0);
INSERT INTO `sys_area` VALUES ('130628000000', '130600000000', '0,130000000000,130600000000', '高阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('130629000000', '130600000000', '0,130000000000,130600000000', '容城县', 3, 0);
INSERT INTO `sys_area` VALUES ('130630000000', '130600000000', '0,130000000000,130600000000', '涞源县', 3, 0);
INSERT INTO `sys_area` VALUES ('130631000000', '130600000000', '0,130000000000,130600000000', '望都县', 3, 0);
INSERT INTO `sys_area` VALUES ('130632000000', '130600000000', '0,130000000000,130600000000', '安新县', 3, 0);
INSERT INTO `sys_area` VALUES ('130633000000', '130600000000', '0,130000000000,130600000000', '易县', 3, 0);
INSERT INTO `sys_area` VALUES ('130634000000', '130600000000', '0,130000000000,130600000000', '曲阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('130635000000', '130600000000', '0,130000000000,130600000000', '蠡县', 3, 0);
INSERT INTO `sys_area` VALUES ('130636000000', '130600000000', '0,130000000000,130600000000', '顺平县', 3, 0);
INSERT INTO `sys_area` VALUES ('130637000000', '130600000000', '0,130000000000,130600000000', '博野县', 3, 0);
INSERT INTO `sys_area` VALUES ('130638000000', '130600000000', '0,130000000000,130600000000', '雄县', 3, 0);
INSERT INTO `sys_area` VALUES ('130681000000', '130600000000', '0,130000000000,130600000000', '涿州市', 3, 0);
INSERT INTO `sys_area` VALUES ('130683000000', '130600000000', '0,130000000000,130600000000', '安国市', 3, 0);
INSERT INTO `sys_area` VALUES ('130684000000', '130600000000', '0,130000000000,130600000000', '高碑店市', 3, 0);
INSERT INTO `sys_area` VALUES ('130700000000', '130000000000', '0,130000000000', '张家口市', 2, 0);
INSERT INTO `sys_area` VALUES ('130702000000', '130700000000', '0,130000000000,130700000000', '桥东区', 3, 0);
INSERT INTO `sys_area` VALUES ('130703000000', '130700000000', '0,130000000000,130700000000', '桥西区', 3, 0);
INSERT INTO `sys_area` VALUES ('130705000000', '130700000000', '0,130000000000,130700000000', '宣化区', 3, 0);
INSERT INTO `sys_area` VALUES ('130706000000', '130700000000', '0,130000000000,130700000000', '下花园区', 3, 0);
INSERT INTO `sys_area` VALUES ('130721000000', '130700000000', '0,130000000000,130700000000', '宣化县', 3, 0);
INSERT INTO `sys_area` VALUES ('130722000000', '130700000000', '0,130000000000,130700000000', '张北县', 3, 0);
INSERT INTO `sys_area` VALUES ('130723000000', '130700000000', '0,130000000000,130700000000', '康保县', 3, 0);
INSERT INTO `sys_area` VALUES ('130724000000', '130700000000', '0,130000000000,130700000000', '沽源县', 3, 0);
INSERT INTO `sys_area` VALUES ('130725000000', '130700000000', '0,130000000000,130700000000', '尚义县', 3, 0);
INSERT INTO `sys_area` VALUES ('130726000000', '130700000000', '0,130000000000,130700000000', '蔚县', 3, 0);
INSERT INTO `sys_area` VALUES ('130727000000', '130700000000', '0,130000000000,130700000000', '阳原县', 3, 0);
INSERT INTO `sys_area` VALUES ('130728000000', '130700000000', '0,130000000000,130700000000', '怀安县', 3, 0);
INSERT INTO `sys_area` VALUES ('130729000000', '130700000000', '0,130000000000,130700000000', '万全县', 3, 0);
INSERT INTO `sys_area` VALUES ('130730000000', '130700000000', '0,130000000000,130700000000', '怀来县', 3, 0);
INSERT INTO `sys_area` VALUES ('130731000000', '130700000000', '0,130000000000,130700000000', '涿鹿县', 3, 0);
INSERT INTO `sys_area` VALUES ('130732000000', '130700000000', '0,130000000000,130700000000', '赤城县', 3, 0);
INSERT INTO `sys_area` VALUES ('130733000000', '130700000000', '0,130000000000,130700000000', '崇礼县', 3, 0);
INSERT INTO `sys_area` VALUES ('130800000000', '130000000000', '0,130000000000', '承德市', 2, 0);
INSERT INTO `sys_area` VALUES ('130802000000', '130800000000', '0,130000000000,130800000000', '双桥区', 3, 0);
INSERT INTO `sys_area` VALUES ('130803000000', '130800000000', '0,130000000000,130800000000', '双滦区', 3, 0);
INSERT INTO `sys_area` VALUES ('130804000000', '130800000000', '0,130000000000,130800000000', '鹰手营子矿区', 3, 0);
INSERT INTO `sys_area` VALUES ('130821000000', '130800000000', '0,130000000000,130800000000', '承德县', 3, 0);
INSERT INTO `sys_area` VALUES ('130822000000', '130800000000', '0,130000000000,130800000000', '兴隆县', 3, 0);
INSERT INTO `sys_area` VALUES ('130823000000', '130800000000', '0,130000000000,130800000000', '平泉县', 3, 0);
INSERT INTO `sys_area` VALUES ('130824000000', '130800000000', '0,130000000000,130800000000', '滦平县', 3, 0);
INSERT INTO `sys_area` VALUES ('130825000000', '130800000000', '0,130000000000,130800000000', '隆化县', 3, 0);
INSERT INTO `sys_area` VALUES ('130826000000', '130800000000', '0,130000000000,130800000000', '丰宁满族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('130827000000', '130800000000', '0,130000000000,130800000000', '宽城满族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('130828000000', '130800000000', '0,130000000000,130800000000', '围场满族蒙古族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('130900000000', '130000000000', '0,130000000000', '沧州市', 2, 0);
INSERT INTO `sys_area` VALUES ('130902000000', '130900000000', '0,130000000000,130900000000', '新华区', 3, 0);
INSERT INTO `sys_area` VALUES ('130903000000', '130900000000', '0,130000000000,130900000000', '运河区', 3, 0);
INSERT INTO `sys_area` VALUES ('130921000000', '130900000000', '0,130000000000,130900000000', '沧县', 3, 0);
INSERT INTO `sys_area` VALUES ('130922000000', '130900000000', '0,130000000000,130900000000', '青县', 3, 0);
INSERT INTO `sys_area` VALUES ('130923000000', '130900000000', '0,130000000000,130900000000', '东光县', 3, 0);
INSERT INTO `sys_area` VALUES ('130924000000', '130900000000', '0,130000000000,130900000000', '海兴县', 3, 0);
INSERT INTO `sys_area` VALUES ('130925000000', '130900000000', '0,130000000000,130900000000', '盐山县', 3, 0);
INSERT INTO `sys_area` VALUES ('130926000000', '130900000000', '0,130000000000,130900000000', '肃宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('130927000000', '130900000000', '0,130000000000,130900000000', '南皮县', 3, 0);
INSERT INTO `sys_area` VALUES ('130928000000', '130900000000', '0,130000000000,130900000000', '吴桥县', 3, 0);
INSERT INTO `sys_area` VALUES ('130929000000', '130900000000', '0,130000000000,130900000000', '献县', 3, 0);
INSERT INTO `sys_area` VALUES ('130930000000', '130900000000', '0,130000000000,130900000000', '孟村回族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('130981000000', '130900000000', '0,130000000000,130900000000', '泊头市', 3, 0);
INSERT INTO `sys_area` VALUES ('130982000000', '130900000000', '0,130000000000,130900000000', '任丘市', 3, 0);
INSERT INTO `sys_area` VALUES ('130983000000', '130900000000', '0,130000000000,130900000000', '黄骅市', 3, 0);
INSERT INTO `sys_area` VALUES ('130984000000', '130900000000', '0,130000000000,130900000000', '河间市', 3, 0);
INSERT INTO `sys_area` VALUES ('131000000000', '130000000000', '0,130000000000', '廊坊市', 2, 0);
INSERT INTO `sys_area` VALUES ('131002000000', '131000000000', '0,130000000000,131000000000', '安次区', 3, 0);
INSERT INTO `sys_area` VALUES ('131003000000', '131000000000', '0,130000000000,131000000000', '广阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('131022000000', '131000000000', '0,130000000000,131000000000', '固安县', 3, 0);
INSERT INTO `sys_area` VALUES ('131023000000', '131000000000', '0,130000000000,131000000000', '永清县', 3, 0);
INSERT INTO `sys_area` VALUES ('131024000000', '131000000000', '0,130000000000,131000000000', '香河县', 3, 0);
INSERT INTO `sys_area` VALUES ('131025000000', '131000000000', '0,130000000000,131000000000', '大城县', 3, 0);
INSERT INTO `sys_area` VALUES ('131026000000', '131000000000', '0,130000000000,131000000000', '文安县', 3, 0);
INSERT INTO `sys_area` VALUES ('131028000000', '131000000000', '0,130000000000,131000000000', '大厂回族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('131081000000', '131000000000', '0,130000000000,131000000000', '霸州市', 3, 0);
INSERT INTO `sys_area` VALUES ('131082000000', '131000000000', '0,130000000000,131000000000', '三河市', 3, 0);
INSERT INTO `sys_area` VALUES ('131100000000', '130000000000', '0,130000000000', '衡水市', 2, 0);
INSERT INTO `sys_area` VALUES ('131102000000', '131100000000', '0,130000000000,131100000000', '桃城区', 3, 0);
INSERT INTO `sys_area` VALUES ('131121000000', '131100000000', '0,130000000000,131100000000', '枣强县', 3, 0);
INSERT INTO `sys_area` VALUES ('131122000000', '131100000000', '0,130000000000,131100000000', '武邑县', 3, 0);
INSERT INTO `sys_area` VALUES ('131123000000', '131100000000', '0,130000000000,131100000000', '武强县', 3, 0);
INSERT INTO `sys_area` VALUES ('131124000000', '131100000000', '0,130000000000,131100000000', '饶阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('131125000000', '131100000000', '0,130000000000,131100000000', '安平县', 3, 0);
INSERT INTO `sys_area` VALUES ('131126000000', '131100000000', '0,130000000000,131100000000', '故城县', 3, 0);
INSERT INTO `sys_area` VALUES ('131127000000', '131100000000', '0,130000000000,131100000000', '景县', 3, 0);
INSERT INTO `sys_area` VALUES ('131128000000', '131100000000', '0,130000000000,131100000000', '阜城县', 3, 0);
INSERT INTO `sys_area` VALUES ('131181000000', '131100000000', '0,130000000000,131100000000', '冀州市', 3, 0);
INSERT INTO `sys_area` VALUES ('131182000000', '131100000000', '0,130000000000,131100000000', '深州市', 3, 0);
INSERT INTO `sys_area` VALUES ('139001000000', '130000000000', '0,130000000000', '定州市', 2, 0);
INSERT INTO `sys_area` VALUES ('139001001000', '139001000000', '0,130000000000,139001000000', '南城区街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('139001002000', '139001000000', '0,130000000000,139001000000', '北城区街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('139001003000', '139001000000', '0,130000000000,139001000000', '西城区街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('139001004000', '139001000000', '0,130000000000,139001000000', '长安路街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('139001100000', '139001000000', '0,130000000000,139001000000', '留早镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001101000', '139001000000', '0,130000000000,139001000000', '清风店镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001102000', '139001000000', '0,130000000000,139001000000', '庞村镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001103000', '139001000000', '0,130000000000,139001000000', '砖路镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001104000', '139001000000', '0,130000000000,139001000000', '明月店镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001105000', '139001000000', '0,130000000000,139001000000', '叮咛店镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001106000', '139001000000', '0,130000000000,139001000000', '东亭镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001107000', '139001000000', '0,130000000000,139001000000', '大辛庄镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001108000', '139001000000', '0,130000000000,139001000000', '东旺镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001109000', '139001000000', '0,130000000000,139001000000', '高蓬镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001110000', '139001000000', '0,130000000000,139001000000', '邢邑镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001111000', '139001000000', '0,130000000000,139001000000', '李亲顾镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001112000', '139001000000', '0,130000000000,139001000000', '子位镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001113000', '139001000000', '0,130000000000,139001000000', '开元镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001115000', '139001000000', '0,130000000000,139001000000', '周村镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001116000', '139001000000', '0,130000000000,139001000000', '息冢镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139001203000', '139001000000', '0,130000000000,139001000000', '东留春乡', 3, 0);
INSERT INTO `sys_area` VALUES ('139001204000', '139001000000', '0,130000000000,139001000000', '号头庄回族乡', 3, 0);
INSERT INTO `sys_area` VALUES ('139001205000', '139001000000', '0,130000000000,139001000000', '杨家庄乡', 3, 0);
INSERT INTO `sys_area` VALUES ('139001206000', '139001000000', '0,130000000000,139001000000', '大鹿庄乡', 3, 0);
INSERT INTO `sys_area` VALUES ('139001208000', '139001000000', '0,130000000000,139001000000', '西城乡', 3, 0);
INSERT INTO `sys_area` VALUES ('139002000000', '130000000000', '0,130000000000', '辛集市', 2, 0);
INSERT INTO `sys_area` VALUES ('139002100000', '139002000000', '0,130000000000,139002000000', '辛集镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139002101000', '139002000000', '0,130000000000,139002000000', '旧城镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139002102000', '139002000000', '0,130000000000,139002000000', '张古庄镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139002103000', '139002000000', '0,130000000000,139002000000', '位伯镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139002104000', '139002000000', '0,130000000000,139002000000', '新垒头镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139002105000', '139002000000', '0,130000000000,139002000000', '新城镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139002106000', '139002000000', '0,130000000000,139002000000', '南智邱镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139002107000', '139002000000', '0,130000000000,139002000000', '王口镇', 3, 0);
INSERT INTO `sys_area` VALUES ('139002200000', '139002000000', '0,130000000000,139002000000', '天宫营乡', 3, 0);
INSERT INTO `sys_area` VALUES ('139002201000', '139002000000', '0,130000000000,139002000000', '前营乡', 3, 0);
INSERT INTO `sys_area` VALUES ('139002202000', '139002000000', '0,130000000000,139002000000', '马庄乡', 3, 0);
INSERT INTO `sys_area` VALUES ('139002203000', '139002000000', '0,130000000000,139002000000', '和睦井乡', 3, 0);
INSERT INTO `sys_area` VALUES ('139002204000', '139002000000', '0,130000000000,139002000000', '田家庄乡', 3, 0);
INSERT INTO `sys_area` VALUES ('139002205000', '139002000000', '0,130000000000,139002000000', '中里厢乡', 3, 0);
INSERT INTO `sys_area` VALUES ('139002206000', '139002000000', '0,130000000000,139002000000', '小辛庄乡', 3, 0);
INSERT INTO `sys_area` VALUES ('140000000000', '100000000000', '0,', '山西省', 1, 0);
INSERT INTO `sys_area` VALUES ('140100000000', '140000000000', '0,140000000000', '太原市', 2, 0);
INSERT INTO `sys_area` VALUES ('140105000000', '140100000000', '0,140000000000,140100000000', '小店区', 3, 0);
INSERT INTO `sys_area` VALUES ('140106000000', '140100000000', '0,140000000000,140100000000', '迎泽区', 3, 0);
INSERT INTO `sys_area` VALUES ('140107000000', '140100000000', '0,140000000000,140100000000', '杏花岭区', 3, 0);
INSERT INTO `sys_area` VALUES ('140108000000', '140100000000', '0,140000000000,140100000000', '尖草坪区', 3, 0);
INSERT INTO `sys_area` VALUES ('140109000000', '140100000000', '0,140000000000,140100000000', '万柏林区', 3, 0);
INSERT INTO `sys_area` VALUES ('140110000000', '140100000000', '0,140000000000,140100000000', '晋源区', 3, 0);
INSERT INTO `sys_area` VALUES ('140121000000', '140100000000', '0,140000000000,140100000000', '清徐县', 3, 0);
INSERT INTO `sys_area` VALUES ('140122000000', '140100000000', '0,140000000000,140100000000', '阳曲县', 3, 0);
INSERT INTO `sys_area` VALUES ('140123000000', '140100000000', '0,140000000000,140100000000', '娄烦县', 3, 0);
INSERT INTO `sys_area` VALUES ('140181000000', '140100000000', '0,140000000000,140100000000', '古交市', 3, 0);
INSERT INTO `sys_area` VALUES ('140200000000', '140000000000', '0,140000000000', '大同市', 2, 0);
INSERT INTO `sys_area` VALUES ('140202000000', '140200000000', '0,140000000000,140200000000', '城区', 3, 0);
INSERT INTO `sys_area` VALUES ('140203000000', '140200000000', '0,140000000000,140200000000', '矿区', 3, 0);
INSERT INTO `sys_area` VALUES ('140211000000', '140200000000', '0,140000000000,140200000000', '南郊区', 3, 0);
INSERT INTO `sys_area` VALUES ('140212000000', '140200000000', '0,140000000000,140200000000', '新荣区', 3, 0);
INSERT INTO `sys_area` VALUES ('140221000000', '140200000000', '0,140000000000,140200000000', '阳高县', 3, 0);
INSERT INTO `sys_area` VALUES ('140222000000', '140200000000', '0,140000000000,140200000000', '天镇县', 3, 0);
INSERT INTO `sys_area` VALUES ('140223000000', '140200000000', '0,140000000000,140200000000', '广灵县', 3, 0);
INSERT INTO `sys_area` VALUES ('140224000000', '140200000000', '0,140000000000,140200000000', '灵丘县', 3, 0);
INSERT INTO `sys_area` VALUES ('140225000000', '140200000000', '0,140000000000,140200000000', '浑源县', 3, 0);
INSERT INTO `sys_area` VALUES ('140226000000', '140200000000', '0,140000000000,140200000000', '左云县', 3, 0);
INSERT INTO `sys_area` VALUES ('140227000000', '140200000000', '0,140000000000,140200000000', '大同县', 3, 0);
INSERT INTO `sys_area` VALUES ('140300000000', '140000000000', '0,140000000000', '阳泉市', 2, 0);
INSERT INTO `sys_area` VALUES ('140302000000', '140300000000', '0,140000000000,140300000000', '城区', 3, 0);
INSERT INTO `sys_area` VALUES ('140303000000', '140300000000', '0,140000000000,140300000000', '矿区', 3, 0);
INSERT INTO `sys_area` VALUES ('140311000000', '140300000000', '0,140000000000,140300000000', '郊区', 3, 0);
INSERT INTO `sys_area` VALUES ('140321000000', '140300000000', '0,140000000000,140300000000', '平定县', 3, 0);
INSERT INTO `sys_area` VALUES ('140322000000', '140300000000', '0,140000000000,140300000000', '盂县', 3, 0);
INSERT INTO `sys_area` VALUES ('140400000000', '140000000000', '0,140000000000', '长治市', 2, 0);
INSERT INTO `sys_area` VALUES ('140402000000', '140400000000', '0,140000000000,140400000000', '城区', 3, 0);
INSERT INTO `sys_area` VALUES ('140411000000', '140400000000', '0,140000000000,140400000000', '郊区', 3, 0);
INSERT INTO `sys_area` VALUES ('140421000000', '140400000000', '0,140000000000,140400000000', '长治县', 3, 0);
INSERT INTO `sys_area` VALUES ('140423000000', '140400000000', '0,140000000000,140400000000', '襄垣县', 3, 0);
INSERT INTO `sys_area` VALUES ('140424000000', '140400000000', '0,140000000000,140400000000', '屯留县', 3, 0);
INSERT INTO `sys_area` VALUES ('140425000000', '140400000000', '0,140000000000,140400000000', '平顺县', 3, 0);
INSERT INTO `sys_area` VALUES ('140426000000', '140400000000', '0,140000000000,140400000000', '黎城县', 3, 0);
INSERT INTO `sys_area` VALUES ('140427000000', '140400000000', '0,140000000000,140400000000', '壶关县', 3, 0);
INSERT INTO `sys_area` VALUES ('140428000000', '140400000000', '0,140000000000,140400000000', '长子县', 3, 0);
INSERT INTO `sys_area` VALUES ('140429000000', '140400000000', '0,140000000000,140400000000', '武乡县', 3, 0);
INSERT INTO `sys_area` VALUES ('140430000000', '140400000000', '0,140000000000,140400000000', '沁县', 3, 0);
INSERT INTO `sys_area` VALUES ('140431000000', '140400000000', '0,140000000000,140400000000', '沁源县', 3, 0);
INSERT INTO `sys_area` VALUES ('140481000000', '140400000000', '0,140000000000,140400000000', '潞城市', 3, 0);
INSERT INTO `sys_area` VALUES ('140500000000', '140000000000', '0,140000000000', '晋城市', 2, 0);
INSERT INTO `sys_area` VALUES ('140502000000', '140500000000', '0,140000000000,140500000000', '城区', 3, 0);
INSERT INTO `sys_area` VALUES ('140521000000', '140500000000', '0,140000000000,140500000000', '沁水县', 3, 0);
INSERT INTO `sys_area` VALUES ('140522000000', '140500000000', '0,140000000000,140500000000', '阳城县', 3, 0);
INSERT INTO `sys_area` VALUES ('140524000000', '140500000000', '0,140000000000,140500000000', '陵川县', 3, 0);
INSERT INTO `sys_area` VALUES ('140525000000', '140500000000', '0,140000000000,140500000000', '泽州县', 3, 0);
INSERT INTO `sys_area` VALUES ('140581000000', '140500000000', '0,140000000000,140500000000', '高平市', 3, 0);
INSERT INTO `sys_area` VALUES ('140600000000', '140000000000', '0,140000000000', '朔州市', 2, 0);
INSERT INTO `sys_area` VALUES ('140602000000', '140600000000', '0,140000000000,140600000000', '朔城区', 3, 0);
INSERT INTO `sys_area` VALUES ('140603000000', '140600000000', '0,140000000000,140600000000', '平鲁区', 3, 0);
INSERT INTO `sys_area` VALUES ('140621000000', '140600000000', '0,140000000000,140600000000', '山阴县', 3, 0);
INSERT INTO `sys_area` VALUES ('140622000000', '140600000000', '0,140000000000,140600000000', '应县', 3, 0);
INSERT INTO `sys_area` VALUES ('140623000000', '140600000000', '0,140000000000,140600000000', '右玉县', 3, 0);
INSERT INTO `sys_area` VALUES ('140624000000', '140600000000', '0,140000000000,140600000000', '怀仁县', 3, 0);
INSERT INTO `sys_area` VALUES ('140700000000', '140000000000', '0,140000000000', '晋中市', 2, 0);
INSERT INTO `sys_area` VALUES ('140702000000', '140700000000', '0,140000000000,140700000000', '榆次区', 3, 0);
INSERT INTO `sys_area` VALUES ('140721000000', '140700000000', '0,140000000000,140700000000', '榆社县', 3, 0);
INSERT INTO `sys_area` VALUES ('140722000000', '140700000000', '0,140000000000,140700000000', '左权县', 3, 0);
INSERT INTO `sys_area` VALUES ('140723000000', '140700000000', '0,140000000000,140700000000', '和顺县', 3, 0);
INSERT INTO `sys_area` VALUES ('140724000000', '140700000000', '0,140000000000,140700000000', '昔阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('140725000000', '140700000000', '0,140000000000,140700000000', '寿阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('140726000000', '140700000000', '0,140000000000,140700000000', '太谷县', 3, 0);
INSERT INTO `sys_area` VALUES ('140727000000', '140700000000', '0,140000000000,140700000000', '祁县', 3, 0);
INSERT INTO `sys_area` VALUES ('140728000000', '140700000000', '0,140000000000,140700000000', '平遥县', 3, 0);
INSERT INTO `sys_area` VALUES ('140729000000', '140700000000', '0,140000000000,140700000000', '灵石县', 3, 0);
INSERT INTO `sys_area` VALUES ('140781000000', '140700000000', '0,140000000000,140700000000', '介休市', 3, 0);
INSERT INTO `sys_area` VALUES ('140800000000', '140000000000', '0,140000000000', '运城市', 2, 0);
INSERT INTO `sys_area` VALUES ('140802000000', '140800000000', '0,140000000000,140800000000', '盐湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('140821000000', '140800000000', '0,140000000000,140800000000', '临猗县', 3, 0);
INSERT INTO `sys_area` VALUES ('140822000000', '140800000000', '0,140000000000,140800000000', '万荣县', 3, 0);
INSERT INTO `sys_area` VALUES ('140823000000', '140800000000', '0,140000000000,140800000000', '闻喜县', 3, 0);
INSERT INTO `sys_area` VALUES ('140824000000', '140800000000', '0,140000000000,140800000000', '稷山县', 3, 0);
INSERT INTO `sys_area` VALUES ('140825000000', '140800000000', '0,140000000000,140800000000', '新绛县', 3, 0);
INSERT INTO `sys_area` VALUES ('140826000000', '140800000000', '0,140000000000,140800000000', '绛县', 3, 0);
INSERT INTO `sys_area` VALUES ('140827000000', '140800000000', '0,140000000000,140800000000', '垣曲县', 3, 0);
INSERT INTO `sys_area` VALUES ('140828000000', '140800000000', '0,140000000000,140800000000', '夏县', 3, 0);
INSERT INTO `sys_area` VALUES ('140829000000', '140800000000', '0,140000000000,140800000000', '平陆县', 3, 0);
INSERT INTO `sys_area` VALUES ('140830000000', '140800000000', '0,140000000000,140800000000', '芮城县', 3, 0);
INSERT INTO `sys_area` VALUES ('140881000000', '140800000000', '0,140000000000,140800000000', '永济市', 3, 0);
INSERT INTO `sys_area` VALUES ('140882000000', '140800000000', '0,140000000000,140800000000', '河津市', 3, 0);
INSERT INTO `sys_area` VALUES ('140900000000', '140000000000', '0,140000000000', '忻州市', 2, 0);
INSERT INTO `sys_area` VALUES ('140902000000', '140900000000', '0,140000000000,140900000000', '忻府区', 3, 0);
INSERT INTO `sys_area` VALUES ('140921000000', '140900000000', '0,140000000000,140900000000', '定襄县', 3, 0);
INSERT INTO `sys_area` VALUES ('140922000000', '140900000000', '0,140000000000,140900000000', '五台县', 3, 0);
INSERT INTO `sys_area` VALUES ('140923000000', '140900000000', '0,140000000000,140900000000', '代县', 3, 0);
INSERT INTO `sys_area` VALUES ('140924000000', '140900000000', '0,140000000000,140900000000', '繁峙县', 3, 0);
INSERT INTO `sys_area` VALUES ('140925000000', '140900000000', '0,140000000000,140900000000', '宁武县', 3, 0);
INSERT INTO `sys_area` VALUES ('140926000000', '140900000000', '0,140000000000,140900000000', '静乐县', 3, 0);
INSERT INTO `sys_area` VALUES ('140927000000', '140900000000', '0,140000000000,140900000000', '神池县', 3, 0);
INSERT INTO `sys_area` VALUES ('140928000000', '140900000000', '0,140000000000,140900000000', '五寨县', 3, 0);
INSERT INTO `sys_area` VALUES ('140929000000', '140900000000', '0,140000000000,140900000000', '岢岚县', 3, 0);
INSERT INTO `sys_area` VALUES ('140930000000', '140900000000', '0,140000000000,140900000000', '河曲县', 3, 0);
INSERT INTO `sys_area` VALUES ('140931000000', '140900000000', '0,140000000000,140900000000', '保德县', 3, 0);
INSERT INTO `sys_area` VALUES ('140932000000', '140900000000', '0,140000000000,140900000000', '偏关县', 3, 0);
INSERT INTO `sys_area` VALUES ('140981000000', '140900000000', '0,140000000000,140900000000', '原平市', 3, 0);
INSERT INTO `sys_area` VALUES ('141000000000', '140000000000', '0,140000000000', '临汾市', 2, 0);
INSERT INTO `sys_area` VALUES ('141002000000', '141000000000', '0,140000000000,141000000000', '尧都区', 3, 0);
INSERT INTO `sys_area` VALUES ('141021000000', '141000000000', '0,140000000000,141000000000', '曲沃县', 3, 0);
INSERT INTO `sys_area` VALUES ('141022000000', '141000000000', '0,140000000000,141000000000', '翼城县', 3, 0);
INSERT INTO `sys_area` VALUES ('141023000000', '141000000000', '0,140000000000,141000000000', '襄汾县', 3, 0);
INSERT INTO `sys_area` VALUES ('141024000000', '141000000000', '0,140000000000,141000000000', '洪洞县', 3, 0);
INSERT INTO `sys_area` VALUES ('141025000000', '141000000000', '0,140000000000,141000000000', '古县', 3, 0);
INSERT INTO `sys_area` VALUES ('141026000000', '141000000000', '0,140000000000,141000000000', '安泽县', 3, 0);
INSERT INTO `sys_area` VALUES ('141027000000', '141000000000', '0,140000000000,141000000000', '浮山县', 3, 0);
INSERT INTO `sys_area` VALUES ('141028000000', '141000000000', '0,140000000000,141000000000', '吉县', 3, 0);
INSERT INTO `sys_area` VALUES ('141029000000', '141000000000', '0,140000000000,141000000000', '乡宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('141030000000', '141000000000', '0,140000000000,141000000000', '大宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('141031000000', '141000000000', '0,140000000000,141000000000', '隰县', 3, 0);
INSERT INTO `sys_area` VALUES ('141032000000', '141000000000', '0,140000000000,141000000000', '永和县', 3, 0);
INSERT INTO `sys_area` VALUES ('141033000000', '141000000000', '0,140000000000,141000000000', '蒲县', 3, 0);
INSERT INTO `sys_area` VALUES ('141034000000', '141000000000', '0,140000000000,141000000000', '汾西县', 3, 0);
INSERT INTO `sys_area` VALUES ('141081000000', '141000000000', '0,140000000000,141000000000', '侯马市', 3, 0);
INSERT INTO `sys_area` VALUES ('141082000000', '141000000000', '0,140000000000,141000000000', '霍州市', 3, 0);
INSERT INTO `sys_area` VALUES ('141100000000', '140000000000', '0,140000000000', '吕梁市', 2, 0);
INSERT INTO `sys_area` VALUES ('141102000000', '141100000000', '0,140000000000,141100000000', '离石区', 3, 0);
INSERT INTO `sys_area` VALUES ('141121000000', '141100000000', '0,140000000000,141100000000', '文水县', 3, 0);
INSERT INTO `sys_area` VALUES ('141122000000', '141100000000', '0,140000000000,141100000000', '交城县', 3, 0);
INSERT INTO `sys_area` VALUES ('141123000000', '141100000000', '0,140000000000,141100000000', '兴县', 3, 0);
INSERT INTO `sys_area` VALUES ('141124000000', '141100000000', '0,140000000000,141100000000', '临县', 3, 0);
INSERT INTO `sys_area` VALUES ('141125000000', '141100000000', '0,140000000000,141100000000', '柳林县', 3, 0);
INSERT INTO `sys_area` VALUES ('141126000000', '141100000000', '0,140000000000,141100000000', '石楼县', 3, 0);
INSERT INTO `sys_area` VALUES ('141127000000', '141100000000', '0,140000000000,141100000000', '岚县', 3, 0);
INSERT INTO `sys_area` VALUES ('141128000000', '141100000000', '0,140000000000,141100000000', '方山县', 3, 0);
INSERT INTO `sys_area` VALUES ('141129000000', '141100000000', '0,140000000000,141100000000', '中阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('141130000000', '141100000000', '0,140000000000,141100000000', '交口县', 3, 0);
INSERT INTO `sys_area` VALUES ('141181000000', '141100000000', '0,140000000000,141100000000', '孝义市', 3, 0);
INSERT INTO `sys_area` VALUES ('141182000000', '141100000000', '0,140000000000,141100000000', '汾阳市', 3, 0);
INSERT INTO `sys_area` VALUES ('150000000000', '100000000000', '0,', '内蒙古自治区', 1, 0);
INSERT INTO `sys_area` VALUES ('150100000000', '150000000000', '0,150000000000', '呼和浩特市', 2, 0);
INSERT INTO `sys_area` VALUES ('150102000000', '150100000000', '0,150000000000,150100000000', '新城区', 3, 0);
INSERT INTO `sys_area` VALUES ('150103000000', '150100000000', '0,150000000000,150100000000', '回民区', 3, 0);
INSERT INTO `sys_area` VALUES ('150104000000', '150100000000', '0,150000000000,150100000000', '玉泉区', 3, 0);
INSERT INTO `sys_area` VALUES ('150105000000', '150100000000', '0,150000000000,150100000000', '赛罕区', 3, 0);
INSERT INTO `sys_area` VALUES ('150121000000', '150100000000', '0,150000000000,150100000000', '土默特左旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150122000000', '150100000000', '0,150000000000,150100000000', '托克托县', 3, 0);
INSERT INTO `sys_area` VALUES ('150123000000', '150100000000', '0,150000000000,150100000000', '和林格尔县', 3, 0);
INSERT INTO `sys_area` VALUES ('150124000000', '150100000000', '0,150000000000,150100000000', '清水河县', 3, 0);
INSERT INTO `sys_area` VALUES ('150125000000', '150100000000', '0,150000000000,150100000000', '武川县', 3, 0);
INSERT INTO `sys_area` VALUES ('150200000000', '150000000000', '0,150000000000', '包头市', 2, 0);
INSERT INTO `sys_area` VALUES ('150202000000', '150200000000', '0,150000000000,150200000000', '东河区', 3, 0);
INSERT INTO `sys_area` VALUES ('150203000000', '150200000000', '0,150000000000,150200000000', '昆都仑区', 3, 0);
INSERT INTO `sys_area` VALUES ('150204000000', '150200000000', '0,150000000000,150200000000', '青山区', 3, 0);
INSERT INTO `sys_area` VALUES ('150205000000', '150200000000', '0,150000000000,150200000000', '石拐区', 3, 0);
INSERT INTO `sys_area` VALUES ('150206000000', '150200000000', '0,150000000000,150200000000', '白云鄂博矿区', 3, 0);
INSERT INTO `sys_area` VALUES ('150207000000', '150200000000', '0,150000000000,150200000000', '九原区', 3, 0);
INSERT INTO `sys_area` VALUES ('150221000000', '150200000000', '0,150000000000,150200000000', '土默特右旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150222000000', '150200000000', '0,150000000000,150200000000', '固阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('150223000000', '150200000000', '0,150000000000,150200000000', '达尔罕茂明安联合旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150300000000', '150000000000', '0,150000000000', '乌海市', 2, 0);
INSERT INTO `sys_area` VALUES ('150302000000', '150300000000', '0,150000000000,150300000000', '海勃湾区', 3, 0);
INSERT INTO `sys_area` VALUES ('150303000000', '150300000000', '0,150000000000,150300000000', '海南区', 3, 0);
INSERT INTO `sys_area` VALUES ('150304000000', '150300000000', '0,150000000000,150300000000', '乌达区', 3, 0);
INSERT INTO `sys_area` VALUES ('150400000000', '150000000000', '0,150000000000', '赤峰市', 2, 0);
INSERT INTO `sys_area` VALUES ('150402000000', '150400000000', '0,150000000000,150400000000', '红山区', 3, 0);
INSERT INTO `sys_area` VALUES ('150403000000', '150400000000', '0,150000000000,150400000000', '元宝山区', 3, 0);
INSERT INTO `sys_area` VALUES ('150404000000', '150400000000', '0,150000000000,150400000000', '松山区', 3, 0);
INSERT INTO `sys_area` VALUES ('150421000000', '150400000000', '0,150000000000,150400000000', '阿鲁科尔沁旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150422000000', '150400000000', '0,150000000000,150400000000', '巴林左旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150423000000', '150400000000', '0,150000000000,150400000000', '巴林右旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150424000000', '150400000000', '0,150000000000,150400000000', '林西县', 3, 0);
INSERT INTO `sys_area` VALUES ('150425000000', '150400000000', '0,150000000000,150400000000', '克什克腾旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150426000000', '150400000000', '0,150000000000,150400000000', '翁牛特旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150428000000', '150400000000', '0,150000000000,150400000000', '喀喇沁旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150429000000', '150400000000', '0,150000000000,150400000000', '宁城县', 3, 0);
INSERT INTO `sys_area` VALUES ('150430000000', '150400000000', '0,150000000000,150400000000', '敖汉旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150500000000', '150000000000', '0,150000000000', '通辽市', 2, 0);
INSERT INTO `sys_area` VALUES ('150502000000', '150500000000', '0,150000000000,150500000000', '科尔沁区', 3, 0);
INSERT INTO `sys_area` VALUES ('150521000000', '150500000000', '0,150000000000,150500000000', '科尔沁左翼中旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150522000000', '150500000000', '0,150000000000,150500000000', '科尔沁左翼后旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150523000000', '150500000000', '0,150000000000,150500000000', '开鲁县', 3, 0);
INSERT INTO `sys_area` VALUES ('150524000000', '150500000000', '0,150000000000,150500000000', '库伦旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150525000000', '150500000000', '0,150000000000,150500000000', '奈曼旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150526000000', '150500000000', '0,150000000000,150500000000', '扎鲁特旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150581000000', '150500000000', '0,150000000000,150500000000', '霍林郭勒市', 3, 0);
INSERT INTO `sys_area` VALUES ('150600000000', '150000000000', '0,150000000000', '鄂尔多斯市', 2, 0);
INSERT INTO `sys_area` VALUES ('150602000000', '150600000000', '0,150000000000,150600000000', '东胜区', 3, 0);
INSERT INTO `sys_area` VALUES ('150621000000', '150600000000', '0,150000000000,150600000000', '达拉特旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150622000000', '150600000000', '0,150000000000,150600000000', '准格尔旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150623000000', '150600000000', '0,150000000000,150600000000', '鄂托克前旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150624000000', '150600000000', '0,150000000000,150600000000', '鄂托克旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150625000000', '150600000000', '0,150000000000,150600000000', '杭锦旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150626000000', '150600000000', '0,150000000000,150600000000', '乌审旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150627000000', '150600000000', '0,150000000000,150600000000', '伊金霍洛旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150700000000', '150000000000', '0,150000000000', '呼伦贝尔市', 2, 0);
INSERT INTO `sys_area` VALUES ('150702000000', '150700000000', '0,150000000000,150700000000', '海拉尔区', 3, 0);
INSERT INTO `sys_area` VALUES ('150703000000', '150700000000', '0,150000000000,150700000000', '扎赉诺尔区', 3, 0);
INSERT INTO `sys_area` VALUES ('150721000000', '150700000000', '0,150000000000,150700000000', '阿荣旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150722000000', '150700000000', '0,150000000000,150700000000', '莫力达瓦达斡尔族自治旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150723000000', '150700000000', '0,150000000000,150700000000', '鄂伦春自治旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150724000000', '150700000000', '0,150000000000,150700000000', '鄂温克族自治旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150725000000', '150700000000', '0,150000000000,150700000000', '陈巴尔虎旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150726000000', '150700000000', '0,150000000000,150700000000', '新巴尔虎左旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150727000000', '150700000000', '0,150000000000,150700000000', '新巴尔虎右旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150781000000', '150700000000', '0,150000000000,150700000000', '满洲里市', 3, 0);
INSERT INTO `sys_area` VALUES ('150782000000', '150700000000', '0,150000000000,150700000000', '牙克石市', 3, 0);
INSERT INTO `sys_area` VALUES ('150783000000', '150700000000', '0,150000000000,150700000000', '扎兰屯市', 3, 0);
INSERT INTO `sys_area` VALUES ('150784000000', '150700000000', '0,150000000000,150700000000', '额尔古纳市', 3, 0);
INSERT INTO `sys_area` VALUES ('150785000000', '150700000000', '0,150000000000,150700000000', '根河市', 3, 0);
INSERT INTO `sys_area` VALUES ('150800000000', '150000000000', '0,150000000000', '巴彦淖尔市', 2, 0);
INSERT INTO `sys_area` VALUES ('150802000000', '150800000000', '0,150000000000,150800000000', '临河区', 3, 0);
INSERT INTO `sys_area` VALUES ('150821000000', '150800000000', '0,150000000000,150800000000', '五原县', 3, 0);
INSERT INTO `sys_area` VALUES ('150822000000', '150800000000', '0,150000000000,150800000000', '磴口县', 3, 0);
INSERT INTO `sys_area` VALUES ('150823000000', '150800000000', '0,150000000000,150800000000', '乌拉特前旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150824000000', '150800000000', '0,150000000000,150800000000', '乌拉特中旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150825000000', '150800000000', '0,150000000000,150800000000', '乌拉特后旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150826000000', '150800000000', '0,150000000000,150800000000', '杭锦后旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150900000000', '150000000000', '0,150000000000', '乌兰察布市', 2, 0);
INSERT INTO `sys_area` VALUES ('150902000000', '150900000000', '0,150000000000,150900000000', '集宁区', 3, 0);
INSERT INTO `sys_area` VALUES ('150921000000', '150900000000', '0,150000000000,150900000000', '卓资县', 3, 0);
INSERT INTO `sys_area` VALUES ('150922000000', '150900000000', '0,150000000000,150900000000', '化德县', 3, 0);
INSERT INTO `sys_area` VALUES ('150923000000', '150900000000', '0,150000000000,150900000000', '商都县', 3, 0);
INSERT INTO `sys_area` VALUES ('150924000000', '150900000000', '0,150000000000,150900000000', '兴和县', 3, 0);
INSERT INTO `sys_area` VALUES ('150925000000', '150900000000', '0,150000000000,150900000000', '凉城县', 3, 0);
INSERT INTO `sys_area` VALUES ('150926000000', '150900000000', '0,150000000000,150900000000', '察哈尔右翼前旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150927000000', '150900000000', '0,150000000000,150900000000', '察哈尔右翼中旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150928000000', '150900000000', '0,150000000000,150900000000', '察哈尔右翼后旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150929000000', '150900000000', '0,150000000000,150900000000', '四子王旗', 3, 0);
INSERT INTO `sys_area` VALUES ('150981000000', '150900000000', '0,150000000000,150900000000', '丰镇市', 3, 0);
INSERT INTO `sys_area` VALUES ('152200000000', '150000000000', '0,150000000000', '兴安盟', 2, 0);
INSERT INTO `sys_area` VALUES ('152201000000', '152200000000', '0,150000000000,152200000000', '乌兰浩特市', 3, 0);
INSERT INTO `sys_area` VALUES ('152202000000', '152200000000', '0,150000000000,152200000000', '阿尔山市', 3, 0);
INSERT INTO `sys_area` VALUES ('152221000000', '152200000000', '0,150000000000,152200000000', '科尔沁右翼前旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152222000000', '152200000000', '0,150000000000,152200000000', '科尔沁右翼中旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152223000000', '152200000000', '0,150000000000,152200000000', '扎赉特旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152224000000', '152200000000', '0,150000000000,152200000000', '突泉县', 3, 0);
INSERT INTO `sys_area` VALUES ('152500000000', '150000000000', '0,150000000000', '锡林郭勒盟', 2, 0);
INSERT INTO `sys_area` VALUES ('152501000000', '152500000000', '0,150000000000,152500000000', '二连浩特市', 3, 0);
INSERT INTO `sys_area` VALUES ('152502000000', '152500000000', '0,150000000000,152500000000', '锡林浩特市', 3, 0);
INSERT INTO `sys_area` VALUES ('152522000000', '152500000000', '0,150000000000,152500000000', '阿巴嘎旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152523000000', '152500000000', '0,150000000000,152500000000', '苏尼特左旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152524000000', '152500000000', '0,150000000000,152500000000', '苏尼特右旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152525000000', '152500000000', '0,150000000000,152500000000', '东乌珠穆沁旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152526000000', '152500000000', '0,150000000000,152500000000', '西乌珠穆沁旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152527000000', '152500000000', '0,150000000000,152500000000', '太仆寺旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152528000000', '152500000000', '0,150000000000,152500000000', '镶黄旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152529000000', '152500000000', '0,150000000000,152500000000', '正镶白旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152530000000', '152500000000', '0,150000000000,152500000000', '正蓝旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152531000000', '152500000000', '0,150000000000,152500000000', '多伦县', 3, 0);
INSERT INTO `sys_area` VALUES ('152900000000', '150000000000', '0,150000000000', '阿拉善盟', 2, 0);
INSERT INTO `sys_area` VALUES ('152921000000', '152900000000', '0,150000000000,152900000000', '阿拉善左旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152922000000', '152900000000', '0,150000000000,152900000000', '阿拉善右旗', 3, 0);
INSERT INTO `sys_area` VALUES ('152923000000', '152900000000', '0,150000000000,152900000000', '额济纳旗', 3, 0);
INSERT INTO `sys_area` VALUES ('210000000000', '100000000000', '0,', '辽宁省', 1, 0);
INSERT INTO `sys_area` VALUES ('210100000000', '210000000000', '0,210000000000', '沈阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('210102000000', '210100000000', '0,210000000000,210100000000', '和平区', 3, 0);
INSERT INTO `sys_area` VALUES ('210103000000', '210100000000', '0,210000000000,210100000000', '沈河区', 3, 0);
INSERT INTO `sys_area` VALUES ('210104000000', '210100000000', '0,210000000000,210100000000', '大东区', 3, 0);
INSERT INTO `sys_area` VALUES ('210105000000', '210100000000', '0,210000000000,210100000000', '皇姑区', 3, 0);
INSERT INTO `sys_area` VALUES ('210106000000', '210100000000', '0,210000000000,210100000000', '铁西区', 3, 0);
INSERT INTO `sys_area` VALUES ('210111000000', '210100000000', '0,210000000000,210100000000', '苏家屯区', 3, 0);
INSERT INTO `sys_area` VALUES ('210112000000', '210100000000', '0,210000000000,210100000000', '浑南区', 3, 0);
INSERT INTO `sys_area` VALUES ('210113000000', '210100000000', '0,210000000000,210100000000', '沈北新区', 3, 0);
INSERT INTO `sys_area` VALUES ('210114000000', '210100000000', '0,210000000000,210100000000', '于洪区', 3, 0);
INSERT INTO `sys_area` VALUES ('210122000000', '210100000000', '0,210000000000,210100000000', '辽中县', 3, 0);
INSERT INTO `sys_area` VALUES ('210123000000', '210100000000', '0,210000000000,210100000000', '康平县', 3, 0);
INSERT INTO `sys_area` VALUES ('210124000000', '210100000000', '0,210000000000,210100000000', '法库县', 3, 0);
INSERT INTO `sys_area` VALUES ('210181000000', '210100000000', '0,210000000000,210100000000', '新民市', 3, 0);
INSERT INTO `sys_area` VALUES ('210200000000', '210000000000', '0,210000000000', '大连市', 2, 0);
INSERT INTO `sys_area` VALUES ('210202000000', '210200000000', '0,210000000000,210200000000', '中山区', 3, 0);
INSERT INTO `sys_area` VALUES ('210203000000', '210200000000', '0,210000000000,210200000000', '西岗区', 3, 0);
INSERT INTO `sys_area` VALUES ('210204000000', '210200000000', '0,210000000000,210200000000', '沙河口区', 3, 0);
INSERT INTO `sys_area` VALUES ('210211000000', '210200000000', '0,210000000000,210200000000', '甘井子区', 3, 0);
INSERT INTO `sys_area` VALUES ('210212000000', '210200000000', '0,210000000000,210200000000', '旅顺口区', 3, 0);
INSERT INTO `sys_area` VALUES ('210213000000', '210200000000', '0,210000000000,210200000000', '金州区', 3, 0);
INSERT INTO `sys_area` VALUES ('210224000000', '210200000000', '0,210000000000,210200000000', '长海县', 3, 0);
INSERT INTO `sys_area` VALUES ('210281000000', '210200000000', '0,210000000000,210200000000', '瓦房店市', 3, 0);
INSERT INTO `sys_area` VALUES ('210282000000', '210200000000', '0,210000000000,210200000000', '普兰店市', 3, 0);
INSERT INTO `sys_area` VALUES ('210283000000', '210200000000', '0,210000000000,210200000000', '庄河市', 3, 0);
INSERT INTO `sys_area` VALUES ('210300000000', '210000000000', '0,210000000000', '鞍山市', 2, 0);
INSERT INTO `sys_area` VALUES ('210302000000', '210300000000', '0,210000000000,210300000000', '铁东区', 3, 0);
INSERT INTO `sys_area` VALUES ('210303000000', '210300000000', '0,210000000000,210300000000', '铁西区', 3, 0);
INSERT INTO `sys_area` VALUES ('210304000000', '210300000000', '0,210000000000,210300000000', '立山区', 3, 0);
INSERT INTO `sys_area` VALUES ('210311000000', '210300000000', '0,210000000000,210300000000', '千山区', 3, 0);
INSERT INTO `sys_area` VALUES ('210321000000', '210300000000', '0,210000000000,210300000000', '台安县', 3, 0);
INSERT INTO `sys_area` VALUES ('210323000000', '210300000000', '0,210000000000,210300000000', '岫岩满族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('210381000000', '210300000000', '0,210000000000,210300000000', '海城市', 3, 0);
INSERT INTO `sys_area` VALUES ('210400000000', '210000000000', '0,210000000000', '抚顺市', 2, 0);
INSERT INTO `sys_area` VALUES ('210402000000', '210400000000', '0,210000000000,210400000000', '新抚区', 3, 0);
INSERT INTO `sys_area` VALUES ('210403000000', '210400000000', '0,210000000000,210400000000', '东洲区', 3, 0);
INSERT INTO `sys_area` VALUES ('210404000000', '210400000000', '0,210000000000,210400000000', '望花区', 3, 0);
INSERT INTO `sys_area` VALUES ('210411000000', '210400000000', '0,210000000000,210400000000', '顺城区', 3, 0);
INSERT INTO `sys_area` VALUES ('210421000000', '210400000000', '0,210000000000,210400000000', '抚顺县', 3, 0);
INSERT INTO `sys_area` VALUES ('210422000000', '210400000000', '0,210000000000,210400000000', '新宾满族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('210423000000', '210400000000', '0,210000000000,210400000000', '清原满族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('210500000000', '210000000000', '0,210000000000', '本溪市', 2, 0);
INSERT INTO `sys_area` VALUES ('210502000000', '210500000000', '0,210000000000,210500000000', '平山区', 3, 0);
INSERT INTO `sys_area` VALUES ('210503000000', '210500000000', '0,210000000000,210500000000', '溪湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('210504000000', '210500000000', '0,210000000000,210500000000', '明山区', 3, 0);
INSERT INTO `sys_area` VALUES ('210505000000', '210500000000', '0,210000000000,210500000000', '南芬区', 3, 0);
INSERT INTO `sys_area` VALUES ('210521000000', '210500000000', '0,210000000000,210500000000', '本溪满族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('210522000000', '210500000000', '0,210000000000,210500000000', '桓仁满族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('210600000000', '210000000000', '0,210000000000', '丹东市', 2, 0);
INSERT INTO `sys_area` VALUES ('210602000000', '210600000000', '0,210000000000,210600000000', '元宝区', 3, 0);
INSERT INTO `sys_area` VALUES ('210603000000', '210600000000', '0,210000000000,210600000000', '振兴区', 3, 0);
INSERT INTO `sys_area` VALUES ('210604000000', '210600000000', '0,210000000000,210600000000', '振安区', 3, 0);
INSERT INTO `sys_area` VALUES ('210624000000', '210600000000', '0,210000000000,210600000000', '宽甸满族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('210681000000', '210600000000', '0,210000000000,210600000000', '东港市', 3, 0);
INSERT INTO `sys_area` VALUES ('210682000000', '210600000000', '0,210000000000,210600000000', '凤城市', 3, 0);
INSERT INTO `sys_area` VALUES ('210700000000', '210000000000', '0,210000000000', '锦州市', 2, 0);
INSERT INTO `sys_area` VALUES ('210702000000', '210700000000', '0,210000000000,210700000000', '古塔区', 3, 0);
INSERT INTO `sys_area` VALUES ('210703000000', '210700000000', '0,210000000000,210700000000', '凌河区', 3, 0);
INSERT INTO `sys_area` VALUES ('210711000000', '210700000000', '0,210000000000,210700000000', '太和区', 3, 0);
INSERT INTO `sys_area` VALUES ('210726000000', '210700000000', '0,210000000000,210700000000', '黑山县', 3, 0);
INSERT INTO `sys_area` VALUES ('210727000000', '210700000000', '0,210000000000,210700000000', '义县', 3, 0);
INSERT INTO `sys_area` VALUES ('210781000000', '210700000000', '0,210000000000,210700000000', '凌海市', 3, 0);
INSERT INTO `sys_area` VALUES ('210782000000', '210700000000', '0,210000000000,210700000000', '北镇市', 3, 0);
INSERT INTO `sys_area` VALUES ('210800000000', '210000000000', '0,210000000000', '营口市', 2, 0);
INSERT INTO `sys_area` VALUES ('210802000000', '210800000000', '0,210000000000,210800000000', '站前区', 3, 0);
INSERT INTO `sys_area` VALUES ('210803000000', '210800000000', '0,210000000000,210800000000', '西市区', 3, 0);
INSERT INTO `sys_area` VALUES ('210804000000', '210800000000', '0,210000000000,210800000000', '鲅鱼圈区', 3, 0);
INSERT INTO `sys_area` VALUES ('210811000000', '210800000000', '0,210000000000,210800000000', '老边区', 3, 0);
INSERT INTO `sys_area` VALUES ('210881000000', '210800000000', '0,210000000000,210800000000', '盖州市', 3, 0);
INSERT INTO `sys_area` VALUES ('210882000000', '210800000000', '0,210000000000,210800000000', '大石桥市', 3, 0);
INSERT INTO `sys_area` VALUES ('210900000000', '210000000000', '0,210000000000', '阜新市', 2, 0);
INSERT INTO `sys_area` VALUES ('210902000000', '210900000000', '0,210000000000,210900000000', '海州区', 3, 0);
INSERT INTO `sys_area` VALUES ('210903000000', '210900000000', '0,210000000000,210900000000', '新邱区', 3, 0);
INSERT INTO `sys_area` VALUES ('210904000000', '210900000000', '0,210000000000,210900000000', '太平区', 3, 0);
INSERT INTO `sys_area` VALUES ('210905000000', '210900000000', '0,210000000000,210900000000', '清河门区', 3, 0);
INSERT INTO `sys_area` VALUES ('210911000000', '210900000000', '0,210000000000,210900000000', '细河区', 3, 0);
INSERT INTO `sys_area` VALUES ('210921000000', '210900000000', '0,210000000000,210900000000', '阜新蒙古族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('210922000000', '210900000000', '0,210000000000,210900000000', '彰武县', 3, 0);
INSERT INTO `sys_area` VALUES ('211000000000', '210000000000', '0,210000000000', '辽阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('211002000000', '211000000000', '0,210000000000,211000000000', '白塔区', 3, 0);
INSERT INTO `sys_area` VALUES ('211003000000', '211000000000', '0,210000000000,211000000000', '文圣区', 3, 0);
INSERT INTO `sys_area` VALUES ('211004000000', '211000000000', '0,210000000000,211000000000', '宏伟区', 3, 0);
INSERT INTO `sys_area` VALUES ('211005000000', '211000000000', '0,210000000000,211000000000', '弓长岭区', 3, 0);
INSERT INTO `sys_area` VALUES ('211011000000', '211000000000', '0,210000000000,211000000000', '太子河区', 3, 0);
INSERT INTO `sys_area` VALUES ('211021000000', '211000000000', '0,210000000000,211000000000', '辽阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('211081000000', '211000000000', '0,210000000000,211000000000', '灯塔市', 3, 0);
INSERT INTO `sys_area` VALUES ('211100000000', '210000000000', '0,210000000000', '盘锦市', 2, 0);
INSERT INTO `sys_area` VALUES ('211102000000', '211100000000', '0,210000000000,211100000000', '双台子区', 3, 0);
INSERT INTO `sys_area` VALUES ('211103000000', '211100000000', '0,210000000000,211100000000', '兴隆台区', 3, 0);
INSERT INTO `sys_area` VALUES ('211121000000', '211100000000', '0,210000000000,211100000000', '大洼县', 3, 0);
INSERT INTO `sys_area` VALUES ('211122000000', '211100000000', '0,210000000000,211100000000', '盘山县', 3, 0);
INSERT INTO `sys_area` VALUES ('211200000000', '210000000000', '0,210000000000', '铁岭市', 2, 0);
INSERT INTO `sys_area` VALUES ('211202000000', '211200000000', '0,210000000000,211200000000', '银州区', 3, 0);
INSERT INTO `sys_area` VALUES ('211204000000', '211200000000', '0,210000000000,211200000000', '清河区', 3, 0);
INSERT INTO `sys_area` VALUES ('211221000000', '211200000000', '0,210000000000,211200000000', '铁岭县', 3, 0);
INSERT INTO `sys_area` VALUES ('211223000000', '211200000000', '0,210000000000,211200000000', '西丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('211224000000', '211200000000', '0,210000000000,211200000000', '昌图县', 3, 0);
INSERT INTO `sys_area` VALUES ('211281000000', '211200000000', '0,210000000000,211200000000', '调兵山市', 3, 0);
INSERT INTO `sys_area` VALUES ('211282000000', '211200000000', '0,210000000000,211200000000', '开原市', 3, 0);
INSERT INTO `sys_area` VALUES ('211300000000', '210000000000', '0,210000000000', '朝阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('211302000000', '211300000000', '0,210000000000,211300000000', '双塔区', 3, 0);
INSERT INTO `sys_area` VALUES ('211303000000', '211300000000', '0,210000000000,211300000000', '龙城区', 3, 0);
INSERT INTO `sys_area` VALUES ('211321000000', '211300000000', '0,210000000000,211300000000', '朝阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('211322000000', '211300000000', '0,210000000000,211300000000', '建平县', 3, 0);
INSERT INTO `sys_area` VALUES ('211324000000', '211300000000', '0,210000000000,211300000000', '喀喇沁左翼蒙古族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('211381000000', '211300000000', '0,210000000000,211300000000', '北票市', 3, 0);
INSERT INTO `sys_area` VALUES ('211382000000', '211300000000', '0,210000000000,211300000000', '凌源市', 3, 0);
INSERT INTO `sys_area` VALUES ('211400000000', '210000000000', '0,210000000000', '葫芦岛市', 2, 0);
INSERT INTO `sys_area` VALUES ('211402000000', '211400000000', '0,210000000000,211400000000', '连山区', 3, 0);
INSERT INTO `sys_area` VALUES ('211403000000', '211400000000', '0,210000000000,211400000000', '龙港区', 3, 0);
INSERT INTO `sys_area` VALUES ('211404000000', '211400000000', '0,210000000000,211400000000', '南票区', 3, 0);
INSERT INTO `sys_area` VALUES ('211421000000', '211400000000', '0,210000000000,211400000000', '绥中县', 3, 0);
INSERT INTO `sys_area` VALUES ('211422000000', '211400000000', '0,210000000000,211400000000', '建昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('211481000000', '211400000000', '0,210000000000,211400000000', '兴城市', 3, 0);
INSERT INTO `sys_area` VALUES ('220000000000', '100000000000', '0,', '吉林省', 1, 0);
INSERT INTO `sys_area` VALUES ('220100000000', '220000000000', '0,220000000000', '长春市', 2, 0);
INSERT INTO `sys_area` VALUES ('220102000000', '220100000000', '0,220000000000,220100000000', '南关区', 3, 0);
INSERT INTO `sys_area` VALUES ('220103000000', '220100000000', '0,220000000000,220100000000', '宽城区', 3, 0);
INSERT INTO `sys_area` VALUES ('220104000000', '220100000000', '0,220000000000,220100000000', '朝阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('220105000000', '220100000000', '0,220000000000,220100000000', '二道区', 3, 0);
INSERT INTO `sys_area` VALUES ('220106000000', '220100000000', '0,220000000000,220100000000', '绿园区', 3, 0);
INSERT INTO `sys_area` VALUES ('220112000000', '220100000000', '0,220000000000,220100000000', '双阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('220113000000', '220100000000', '0,220000000000,220100000000', '九台区', 3, 0);
INSERT INTO `sys_area` VALUES ('220122000000', '220100000000', '0,220000000000,220100000000', '农安县', 3, 0);
INSERT INTO `sys_area` VALUES ('220182000000', '220100000000', '0,220000000000,220100000000', '榆树市', 3, 0);
INSERT INTO `sys_area` VALUES ('220183000000', '220100000000', '0,220000000000,220100000000', '德惠市', 3, 0);
INSERT INTO `sys_area` VALUES ('220200000000', '220000000000', '0,220000000000', '吉林市', 2, 0);
INSERT INTO `sys_area` VALUES ('220202000000', '220200000000', '0,220000000000,220200000000', '昌邑区', 3, 0);
INSERT INTO `sys_area` VALUES ('220203000000', '220200000000', '0,220000000000,220200000000', '龙潭区', 3, 0);
INSERT INTO `sys_area` VALUES ('220204000000', '220200000000', '0,220000000000,220200000000', '船营区', 3, 0);
INSERT INTO `sys_area` VALUES ('220211000000', '220200000000', '0,220000000000,220200000000', '丰满区', 3, 0);
INSERT INTO `sys_area` VALUES ('220221000000', '220200000000', '0,220000000000,220200000000', '永吉县', 3, 0);
INSERT INTO `sys_area` VALUES ('220281000000', '220200000000', '0,220000000000,220200000000', '蛟河市', 3, 0);
INSERT INTO `sys_area` VALUES ('220282000000', '220200000000', '0,220000000000,220200000000', '桦甸市', 3, 0);
INSERT INTO `sys_area` VALUES ('220283000000', '220200000000', '0,220000000000,220200000000', '舒兰市', 3, 0);
INSERT INTO `sys_area` VALUES ('220284000000', '220200000000', '0,220000000000,220200000000', '磐石市', 3, 0);
INSERT INTO `sys_area` VALUES ('220300000000', '220000000000', '0,220000000000', '四平市', 2, 0);
INSERT INTO `sys_area` VALUES ('220302000000', '220300000000', '0,220000000000,220300000000', '铁西区', 3, 0);
INSERT INTO `sys_area` VALUES ('220303000000', '220300000000', '0,220000000000,220300000000', '铁东区', 3, 0);
INSERT INTO `sys_area` VALUES ('220322000000', '220300000000', '0,220000000000,220300000000', '梨树县', 3, 0);
INSERT INTO `sys_area` VALUES ('220323000000', '220300000000', '0,220000000000,220300000000', '伊通满族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('220381000000', '220300000000', '0,220000000000,220300000000', '公主岭市', 3, 0);
INSERT INTO `sys_area` VALUES ('220382000000', '220300000000', '0,220000000000,220300000000', '双辽市', 3, 0);
INSERT INTO `sys_area` VALUES ('220400000000', '220000000000', '0,220000000000', '辽源市', 2, 0);
INSERT INTO `sys_area` VALUES ('220402000000', '220400000000', '0,220000000000,220400000000', '龙山区', 3, 0);
INSERT INTO `sys_area` VALUES ('220403000000', '220400000000', '0,220000000000,220400000000', '西安区', 3, 0);
INSERT INTO `sys_area` VALUES ('220421000000', '220400000000', '0,220000000000,220400000000', '东丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('220422000000', '220400000000', '0,220000000000,220400000000', '东辽县', 3, 0);
INSERT INTO `sys_area` VALUES ('220500000000', '220000000000', '0,220000000000', '通化市', 2, 0);
INSERT INTO `sys_area` VALUES ('220502000000', '220500000000', '0,220000000000,220500000000', '东昌区', 3, 0);
INSERT INTO `sys_area` VALUES ('220503000000', '220500000000', '0,220000000000,220500000000', '二道江区', 3, 0);
INSERT INTO `sys_area` VALUES ('220521000000', '220500000000', '0,220000000000,220500000000', '通化县', 3, 0);
INSERT INTO `sys_area` VALUES ('220523000000', '220500000000', '0,220000000000,220500000000', '辉南县', 3, 0);
INSERT INTO `sys_area` VALUES ('220524000000', '220500000000', '0,220000000000,220500000000', '柳河县', 3, 0);
INSERT INTO `sys_area` VALUES ('220581000000', '220500000000', '0,220000000000,220500000000', '梅河口市', 3, 0);
INSERT INTO `sys_area` VALUES ('220582000000', '220500000000', '0,220000000000,220500000000', '集安市', 3, 0);
INSERT INTO `sys_area` VALUES ('220600000000', '220000000000', '0,220000000000', '白山市', 2, 0);
INSERT INTO `sys_area` VALUES ('220602000000', '220600000000', '0,220000000000,220600000000', '浑江区', 3, 0);
INSERT INTO `sys_area` VALUES ('220605000000', '220600000000', '0,220000000000,220600000000', '江源区', 3, 0);
INSERT INTO `sys_area` VALUES ('220621000000', '220600000000', '0,220000000000,220600000000', '抚松县', 3, 0);
INSERT INTO `sys_area` VALUES ('220622000000', '220600000000', '0,220000000000,220600000000', '靖宇县', 3, 0);
INSERT INTO `sys_area` VALUES ('220623000000', '220600000000', '0,220000000000,220600000000', '长白朝鲜族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('220681000000', '220600000000', '0,220000000000,220600000000', '临江市', 3, 0);
INSERT INTO `sys_area` VALUES ('220700000000', '220000000000', '0,220000000000', '松原市', 2, 0);
INSERT INTO `sys_area` VALUES ('220702000000', '220700000000', '0,220000000000,220700000000', '宁江区', 3, 0);
INSERT INTO `sys_area` VALUES ('220721000000', '220700000000', '0,220000000000,220700000000', '前郭尔罗斯蒙古族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('220722000000', '220700000000', '0,220000000000,220700000000', '长岭县', 3, 0);
INSERT INTO `sys_area` VALUES ('220723000000', '220700000000', '0,220000000000,220700000000', '乾安县', 3, 0);
INSERT INTO `sys_area` VALUES ('220781000000', '220700000000', '0,220000000000,220700000000', '扶余市', 3, 0);
INSERT INTO `sys_area` VALUES ('220800000000', '220000000000', '0,220000000000', '白城市', 2, 0);
INSERT INTO `sys_area` VALUES ('220802000000', '220800000000', '0,220000000000,220800000000', '洮北区', 3, 0);
INSERT INTO `sys_area` VALUES ('220821000000', '220800000000', '0,220000000000,220800000000', '镇赉县', 3, 0);
INSERT INTO `sys_area` VALUES ('220822000000', '220800000000', '0,220000000000,220800000000', '通榆县', 3, 0);
INSERT INTO `sys_area` VALUES ('220881000000', '220800000000', '0,220000000000,220800000000', '洮南市', 3, 0);
INSERT INTO `sys_area` VALUES ('220882000000', '220800000000', '0,220000000000,220800000000', '大安市', 3, 0);
INSERT INTO `sys_area` VALUES ('222400000000', '220000000000', '0,220000000000', '延边朝鲜族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('222401000000', '222400000000', '0,220000000000,222400000000', '延吉市', 3, 0);
INSERT INTO `sys_area` VALUES ('222402000000', '222400000000', '0,220000000000,222400000000', '图们市', 3, 0);
INSERT INTO `sys_area` VALUES ('222403000000', '222400000000', '0,220000000000,222400000000', '敦化市', 3, 0);
INSERT INTO `sys_area` VALUES ('222404000000', '222400000000', '0,220000000000,222400000000', '珲春市', 3, 0);
INSERT INTO `sys_area` VALUES ('222405000000', '222400000000', '0,220000000000,222400000000', '龙井市', 3, 0);
INSERT INTO `sys_area` VALUES ('222406000000', '222400000000', '0,220000000000,222400000000', '和龙市', 3, 0);
INSERT INTO `sys_area` VALUES ('222424000000', '222400000000', '0,220000000000,222400000000', '汪清县', 3, 0);
INSERT INTO `sys_area` VALUES ('222426000000', '222400000000', '0,220000000000,222400000000', '安图县', 3, 0);
INSERT INTO `sys_area` VALUES ('230000000000', '100000000000', '0,', '黑龙江省', 1, 0);
INSERT INTO `sys_area` VALUES ('230100000000', '230000000000', '0,230000000000', '哈尔滨市', 2, 0);
INSERT INTO `sys_area` VALUES ('230102000000', '230100000000', '0,230000000000,230100000000', '道里区', 3, 0);
INSERT INTO `sys_area` VALUES ('230103000000', '230100000000', '0,230000000000,230100000000', '南岗区', 3, 0);
INSERT INTO `sys_area` VALUES ('230104000000', '230100000000', '0,230000000000,230100000000', '道外区', 3, 0);
INSERT INTO `sys_area` VALUES ('230108000000', '230100000000', '0,230000000000,230100000000', '平房区', 3, 0);
INSERT INTO `sys_area` VALUES ('230109000000', '230100000000', '0,230000000000,230100000000', '松北区', 3, 0);
INSERT INTO `sys_area` VALUES ('230110000000', '230100000000', '0,230000000000,230100000000', '香坊区', 3, 0);
INSERT INTO `sys_area` VALUES ('230111000000', '230100000000', '0,230000000000,230100000000', '呼兰区', 3, 0);
INSERT INTO `sys_area` VALUES ('230112000000', '230100000000', '0,230000000000,230100000000', '阿城区', 3, 0);
INSERT INTO `sys_area` VALUES ('230113000000', '230100000000', '0,230000000000,230100000000', '双城区', 3, 0);
INSERT INTO `sys_area` VALUES ('230123000000', '230100000000', '0,230000000000,230100000000', '依兰县', 3, 0);
INSERT INTO `sys_area` VALUES ('230124000000', '230100000000', '0,230000000000,230100000000', '方正县', 3, 0);
INSERT INTO `sys_area` VALUES ('230125000000', '230100000000', '0,230000000000,230100000000', '宾县', 3, 0);
INSERT INTO `sys_area` VALUES ('230126000000', '230100000000', '0,230000000000,230100000000', '巴彦县', 3, 0);
INSERT INTO `sys_area` VALUES ('230127000000', '230100000000', '0,230000000000,230100000000', '木兰县', 3, 0);
INSERT INTO `sys_area` VALUES ('230128000000', '230100000000', '0,230000000000,230100000000', '通河县', 3, 0);
INSERT INTO `sys_area` VALUES ('230129000000', '230100000000', '0,230000000000,230100000000', '延寿县', 3, 0);
INSERT INTO `sys_area` VALUES ('230183000000', '230100000000', '0,230000000000,230100000000', '尚志市', 3, 0);
INSERT INTO `sys_area` VALUES ('230184000000', '230100000000', '0,230000000000,230100000000', '五常市', 3, 0);
INSERT INTO `sys_area` VALUES ('230200000000', '230000000000', '0,230000000000', '齐齐哈尔市', 2, 0);
INSERT INTO `sys_area` VALUES ('230202000000', '230200000000', '0,230000000000,230200000000', '龙沙区', 3, 0);
INSERT INTO `sys_area` VALUES ('230203000000', '230200000000', '0,230000000000,230200000000', '建华区', 3, 0);
INSERT INTO `sys_area` VALUES ('230204000000', '230200000000', '0,230000000000,230200000000', '铁锋区', 3, 0);
INSERT INTO `sys_area` VALUES ('230205000000', '230200000000', '0,230000000000,230200000000', '昂昂溪区', 3, 0);
INSERT INTO `sys_area` VALUES ('230206000000', '230200000000', '0,230000000000,230200000000', '富拉尔基区', 3, 0);
INSERT INTO `sys_area` VALUES ('230207000000', '230200000000', '0,230000000000,230200000000', '碾子山区', 3, 0);
INSERT INTO `sys_area` VALUES ('230208000000', '230200000000', '0,230000000000,230200000000', '梅里斯达斡尔族区', 3, 0);
INSERT INTO `sys_area` VALUES ('230221000000', '230200000000', '0,230000000000,230200000000', '龙江县', 3, 0);
INSERT INTO `sys_area` VALUES ('230223000000', '230200000000', '0,230000000000,230200000000', '依安县', 3, 0);
INSERT INTO `sys_area` VALUES ('230224000000', '230200000000', '0,230000000000,230200000000', '泰来县', 3, 0);
INSERT INTO `sys_area` VALUES ('230225000000', '230200000000', '0,230000000000,230200000000', '甘南县', 3, 0);
INSERT INTO `sys_area` VALUES ('230227000000', '230200000000', '0,230000000000,230200000000', '富裕县', 3, 0);
INSERT INTO `sys_area` VALUES ('230229000000', '230200000000', '0,230000000000,230200000000', '克山县', 3, 0);
INSERT INTO `sys_area` VALUES ('230230000000', '230200000000', '0,230000000000,230200000000', '克东县', 3, 0);
INSERT INTO `sys_area` VALUES ('230231000000', '230200000000', '0,230000000000,230200000000', '拜泉县', 3, 0);
INSERT INTO `sys_area` VALUES ('230281000000', '230200000000', '0,230000000000,230200000000', '讷河市', 3, 0);
INSERT INTO `sys_area` VALUES ('230300000000', '230000000000', '0,230000000000', '鸡西市', 2, 0);
INSERT INTO `sys_area` VALUES ('230302000000', '230300000000', '0,230000000000,230300000000', '鸡冠区', 3, 0);
INSERT INTO `sys_area` VALUES ('230303000000', '230300000000', '0,230000000000,230300000000', '恒山区', 3, 0);
INSERT INTO `sys_area` VALUES ('230304000000', '230300000000', '0,230000000000,230300000000', '滴道区', 3, 0);
INSERT INTO `sys_area` VALUES ('230305000000', '230300000000', '0,230000000000,230300000000', '梨树区', 3, 0);
INSERT INTO `sys_area` VALUES ('230306000000', '230300000000', '0,230000000000,230300000000', '城子河区', 3, 0);
INSERT INTO `sys_area` VALUES ('230307000000', '230300000000', '0,230000000000,230300000000', '麻山区', 3, 0);
INSERT INTO `sys_area` VALUES ('230321000000', '230300000000', '0,230000000000,230300000000', '鸡东县', 3, 0);
INSERT INTO `sys_area` VALUES ('230381000000', '230300000000', '0,230000000000,230300000000', '虎林市', 3, 0);
INSERT INTO `sys_area` VALUES ('230382000000', '230300000000', '0,230000000000,230300000000', '密山市', 3, 0);
INSERT INTO `sys_area` VALUES ('230400000000', '230000000000', '0,230000000000', '鹤岗市', 2, 0);
INSERT INTO `sys_area` VALUES ('230402000000', '230400000000', '0,230000000000,230400000000', '向阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('230403000000', '230400000000', '0,230000000000,230400000000', '工农区', 3, 0);
INSERT INTO `sys_area` VALUES ('230404000000', '230400000000', '0,230000000000,230400000000', '南山区', 3, 0);
INSERT INTO `sys_area` VALUES ('230405000000', '230400000000', '0,230000000000,230400000000', '兴安区', 3, 0);
INSERT INTO `sys_area` VALUES ('230406000000', '230400000000', '0,230000000000,230400000000', '东山区', 3, 0);
INSERT INTO `sys_area` VALUES ('230407000000', '230400000000', '0,230000000000,230400000000', '兴山区', 3, 0);
INSERT INTO `sys_area` VALUES ('230421000000', '230400000000', '0,230000000000,230400000000', '萝北县', 3, 0);
INSERT INTO `sys_area` VALUES ('230422000000', '230400000000', '0,230000000000,230400000000', '绥滨县', 3, 0);
INSERT INTO `sys_area` VALUES ('230500000000', '230000000000', '0,230000000000', '双鸭山市', 2, 0);
INSERT INTO `sys_area` VALUES ('230502000000', '230500000000', '0,230000000000,230500000000', '尖山区', 3, 0);
INSERT INTO `sys_area` VALUES ('230503000000', '230500000000', '0,230000000000,230500000000', '岭东区', 3, 0);
INSERT INTO `sys_area` VALUES ('230505000000', '230500000000', '0,230000000000,230500000000', '四方台区', 3, 0);
INSERT INTO `sys_area` VALUES ('230506000000', '230500000000', '0,230000000000,230500000000', '宝山区', 3, 0);
INSERT INTO `sys_area` VALUES ('230521000000', '230500000000', '0,230000000000,230500000000', '集贤县', 3, 0);
INSERT INTO `sys_area` VALUES ('230522000000', '230500000000', '0,230000000000,230500000000', '友谊县', 3, 0);
INSERT INTO `sys_area` VALUES ('230523000000', '230500000000', '0,230000000000,230500000000', '宝清县', 3, 0);
INSERT INTO `sys_area` VALUES ('230524000000', '230500000000', '0,230000000000,230500000000', '饶河县', 3, 0);
INSERT INTO `sys_area` VALUES ('230600000000', '230000000000', '0,230000000000', '大庆市', 2, 0);
INSERT INTO `sys_area` VALUES ('230602000000', '230600000000', '0,230000000000,230600000000', '萨尔图区', 3, 0);
INSERT INTO `sys_area` VALUES ('230603000000', '230600000000', '0,230000000000,230600000000', '龙凤区', 3, 0);
INSERT INTO `sys_area` VALUES ('230604000000', '230600000000', '0,230000000000,230600000000', '让胡路区', 3, 0);
INSERT INTO `sys_area` VALUES ('230605000000', '230600000000', '0,230000000000,230600000000', '红岗区', 3, 0);
INSERT INTO `sys_area` VALUES ('230606000000', '230600000000', '0,230000000000,230600000000', '大同区', 3, 0);
INSERT INTO `sys_area` VALUES ('230621000000', '230600000000', '0,230000000000,230600000000', '肇州县', 3, 0);
INSERT INTO `sys_area` VALUES ('230622000000', '230600000000', '0,230000000000,230600000000', '肇源县', 3, 0);
INSERT INTO `sys_area` VALUES ('230623000000', '230600000000', '0,230000000000,230600000000', '林甸县', 3, 0);
INSERT INTO `sys_area` VALUES ('230624000000', '230600000000', '0,230000000000,230600000000', '杜尔伯特蒙古族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('230700000000', '230000000000', '0,230000000000', '伊春市', 2, 0);
INSERT INTO `sys_area` VALUES ('230702000000', '230700000000', '0,230000000000,230700000000', '伊春区', 3, 0);
INSERT INTO `sys_area` VALUES ('230703000000', '230700000000', '0,230000000000,230700000000', '南岔区', 3, 0);
INSERT INTO `sys_area` VALUES ('230704000000', '230700000000', '0,230000000000,230700000000', '友好区', 3, 0);
INSERT INTO `sys_area` VALUES ('230705000000', '230700000000', '0,230000000000,230700000000', '西林区', 3, 0);
INSERT INTO `sys_area` VALUES ('230706000000', '230700000000', '0,230000000000,230700000000', '翠峦区', 3, 0);
INSERT INTO `sys_area` VALUES ('230707000000', '230700000000', '0,230000000000,230700000000', '新青区', 3, 0);
INSERT INTO `sys_area` VALUES ('230708000000', '230700000000', '0,230000000000,230700000000', '美溪区', 3, 0);
INSERT INTO `sys_area` VALUES ('230709000000', '230700000000', '0,230000000000,230700000000', '金山屯区', 3, 0);
INSERT INTO `sys_area` VALUES ('230710000000', '230700000000', '0,230000000000,230700000000', '五营区', 3, 0);
INSERT INTO `sys_area` VALUES ('230711000000', '230700000000', '0,230000000000,230700000000', '乌马河区', 3, 0);
INSERT INTO `sys_area` VALUES ('230712000000', '230700000000', '0,230000000000,230700000000', '汤旺河区', 3, 0);
INSERT INTO `sys_area` VALUES ('230713000000', '230700000000', '0,230000000000,230700000000', '带岭区', 3, 0);
INSERT INTO `sys_area` VALUES ('230714000000', '230700000000', '0,230000000000,230700000000', '乌伊岭区', 3, 0);
INSERT INTO `sys_area` VALUES ('230715000000', '230700000000', '0,230000000000,230700000000', '红星区', 3, 0);
INSERT INTO `sys_area` VALUES ('230716000000', '230700000000', '0,230000000000,230700000000', '上甘岭区', 3, 0);
INSERT INTO `sys_area` VALUES ('230722000000', '230700000000', '0,230000000000,230700000000', '嘉荫县', 3, 0);
INSERT INTO `sys_area` VALUES ('230781000000', '230700000000', '0,230000000000,230700000000', '铁力市', 3, 0);
INSERT INTO `sys_area` VALUES ('230800000000', '230000000000', '0,230000000000', '佳木斯市', 2, 0);
INSERT INTO `sys_area` VALUES ('230803000000', '230800000000', '0,230000000000,230800000000', '向阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('230804000000', '230800000000', '0,230000000000,230800000000', '前进区', 3, 0);
INSERT INTO `sys_area` VALUES ('230805000000', '230800000000', '0,230000000000,230800000000', '东风区', 3, 0);
INSERT INTO `sys_area` VALUES ('230811000000', '230800000000', '0,230000000000,230800000000', '郊区', 3, 0);
INSERT INTO `sys_area` VALUES ('230822000000', '230800000000', '0,230000000000,230800000000', '桦南县', 3, 0);
INSERT INTO `sys_area` VALUES ('230826000000', '230800000000', '0,230000000000,230800000000', '桦川县', 3, 0);
INSERT INTO `sys_area` VALUES ('230828000000', '230800000000', '0,230000000000,230800000000', '汤原县', 3, 0);
INSERT INTO `sys_area` VALUES ('230833000000', '230800000000', '0,230000000000,230800000000', '抚远县', 3, 0);
INSERT INTO `sys_area` VALUES ('230881000000', '230800000000', '0,230000000000,230800000000', '同江市', 3, 0);
INSERT INTO `sys_area` VALUES ('230882000000', '230800000000', '0,230000000000,230800000000', '富锦市', 3, 0);
INSERT INTO `sys_area` VALUES ('230900000000', '230000000000', '0,230000000000', '七台河市', 2, 0);
INSERT INTO `sys_area` VALUES ('230902000000', '230900000000', '0,230000000000,230900000000', '新兴区', 3, 0);
INSERT INTO `sys_area` VALUES ('230903000000', '230900000000', '0,230000000000,230900000000', '桃山区', 3, 0);
INSERT INTO `sys_area` VALUES ('230904000000', '230900000000', '0,230000000000,230900000000', '茄子河区', 3, 0);
INSERT INTO `sys_area` VALUES ('230921000000', '230900000000', '0,230000000000,230900000000', '勃利县', 3, 0);
INSERT INTO `sys_area` VALUES ('231000000000', '230000000000', '0,230000000000', '牡丹江市', 2, 0);
INSERT INTO `sys_area` VALUES ('231002000000', '231000000000', '0,230000000000,231000000000', '东安区', 3, 0);
INSERT INTO `sys_area` VALUES ('231003000000', '231000000000', '0,230000000000,231000000000', '阳明区', 3, 0);
INSERT INTO `sys_area` VALUES ('231004000000', '231000000000', '0,230000000000,231000000000', '爱民区', 3, 0);
INSERT INTO `sys_area` VALUES ('231005000000', '231000000000', '0,230000000000,231000000000', '西安区', 3, 0);
INSERT INTO `sys_area` VALUES ('231024000000', '231000000000', '0,230000000000,231000000000', '东宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('231025000000', '231000000000', '0,230000000000,231000000000', '林口县', 3, 0);
INSERT INTO `sys_area` VALUES ('231081000000', '231000000000', '0,230000000000,231000000000', '绥芬河市', 3, 0);
INSERT INTO `sys_area` VALUES ('231083000000', '231000000000', '0,230000000000,231000000000', '海林市', 3, 0);
INSERT INTO `sys_area` VALUES ('231084000000', '231000000000', '0,230000000000,231000000000', '宁安市', 3, 0);
INSERT INTO `sys_area` VALUES ('231085000000', '231000000000', '0,230000000000,231000000000', '穆棱市', 3, 0);
INSERT INTO `sys_area` VALUES ('231100000000', '230000000000', '0,230000000000', '黑河市', 2, 0);
INSERT INTO `sys_area` VALUES ('231102000000', '231100000000', '0,230000000000,231100000000', '爱辉区', 3, 0);
INSERT INTO `sys_area` VALUES ('231121000000', '231100000000', '0,230000000000,231100000000', '嫩江县', 3, 0);
INSERT INTO `sys_area` VALUES ('231123000000', '231100000000', '0,230000000000,231100000000', '逊克县', 3, 0);
INSERT INTO `sys_area` VALUES ('231124000000', '231100000000', '0,230000000000,231100000000', '孙吴县', 3, 0);
INSERT INTO `sys_area` VALUES ('231181000000', '231100000000', '0,230000000000,231100000000', '北安市', 3, 0);
INSERT INTO `sys_area` VALUES ('231182000000', '231100000000', '0,230000000000,231100000000', '五大连池市', 3, 0);
INSERT INTO `sys_area` VALUES ('231200000000', '230000000000', '0,230000000000', '绥化市', 2, 0);
INSERT INTO `sys_area` VALUES ('231202000000', '231200000000', '0,230000000000,231200000000', '北林区', 3, 0);
INSERT INTO `sys_area` VALUES ('231221000000', '231200000000', '0,230000000000,231200000000', '望奎县', 3, 0);
INSERT INTO `sys_area` VALUES ('231222000000', '231200000000', '0,230000000000,231200000000', '兰西县', 3, 0);
INSERT INTO `sys_area` VALUES ('231223000000', '231200000000', '0,230000000000,231200000000', '青冈县', 3, 0);
INSERT INTO `sys_area` VALUES ('231224000000', '231200000000', '0,230000000000,231200000000', '庆安县', 3, 0);
INSERT INTO `sys_area` VALUES ('231225000000', '231200000000', '0,230000000000,231200000000', '明水县', 3, 0);
INSERT INTO `sys_area` VALUES ('231226000000', '231200000000', '0,230000000000,231200000000', '绥棱县', 3, 0);
INSERT INTO `sys_area` VALUES ('231281000000', '231200000000', '0,230000000000,231200000000', '安达市', 3, 0);
INSERT INTO `sys_area` VALUES ('231282000000', '231200000000', '0,230000000000,231200000000', '肇东市', 3, 0);
INSERT INTO `sys_area` VALUES ('231283000000', '231200000000', '0,230000000000,231200000000', '海伦市', 3, 0);
INSERT INTO `sys_area` VALUES ('232700000000', '230000000000', '0,230000000000', '大兴安岭地区', 2, 0);
INSERT INTO `sys_area` VALUES ('232721000000', '232700000000', '0,230000000000,232700000000', '呼玛县', 3, 0);
INSERT INTO `sys_area` VALUES ('232722000000', '232700000000', '0,230000000000,232700000000', '塔河县', 3, 0);
INSERT INTO `sys_area` VALUES ('232723000000', '232700000000', '0,230000000000,232700000000', '漠河县', 3, 0);
INSERT INTO `sys_area` VALUES ('310000000000', '100000000000', '0,', '上海市', 1, 0);
INSERT INTO `sys_area` VALUES ('310101000000', '310900000000', '0,310000000000,310900000000', '黄浦区', 3, 0);
INSERT INTO `sys_area` VALUES ('310104000000', '310900000000', '0,310000000000,310900000000', '徐汇区', 3, 0);
INSERT INTO `sys_area` VALUES ('310105000000', '310900000000', '0,310000000000,310900000000', '长宁区', 3, 0);
INSERT INTO `sys_area` VALUES ('310106000000', '310900000000', '0,310000000000,310900000000', '静安区', 3, 0);
INSERT INTO `sys_area` VALUES ('310107000000', '310900000000', '0,310000000000,310900000000', '普陀区', 3, 0);
INSERT INTO `sys_area` VALUES ('310108000000', '310900000000', '0,310000000000,310900000000', '闸北区', 3, 0);
INSERT INTO `sys_area` VALUES ('310109000000', '310900000000', '0,310000000000,310900000000', '虹口区', 3, 0);
INSERT INTO `sys_area` VALUES ('310110000000', '310900000000', '0,310000000000,310900000000', '杨浦区', 3, 0);
INSERT INTO `sys_area` VALUES ('310112000000', '310900000000', '0,310000000000,310900000000', '闵行区', 3, 0);
INSERT INTO `sys_area` VALUES ('310113000000', '310900000000', '0,310000000000,310900000000', '宝山区', 3, 0);
INSERT INTO `sys_area` VALUES ('310114000000', '310900000000', '0,310000000000,310900000000', '嘉定区', 3, 0);
INSERT INTO `sys_area` VALUES ('310115000000', '310900000000', '0,310000000000,310900000000', '浦东新区', 3, 0);
INSERT INTO `sys_area` VALUES ('310116000000', '310900000000', '0,310000000000,310900000000', '金山区', 3, 0);
INSERT INTO `sys_area` VALUES ('310117000000', '310900000000', '0,310000000000,310900000000', '松江区', 3, 0);
INSERT INTO `sys_area` VALUES ('310118000000', '310900000000', '0,310000000000,310900000000', '青浦区', 3, 0);
INSERT INTO `sys_area` VALUES ('310120000000', '310900000000', '0,310000000000,310900000000', '奉贤区', 3, 0);
INSERT INTO `sys_area` VALUES ('310230000000', '310900000000', '0,310000000000,310900000000', '崇明县', 3, 0);
INSERT INTO `sys_area` VALUES ('310900000000', '310000000000', '0,310000000000', '上海市', 2, 0);
INSERT INTO `sys_area` VALUES ('320000000000', '100000000000', '0,', '江苏省', 1, 0);
INSERT INTO `sys_area` VALUES ('320100000000', '320000000000', '0,320000000000', '南京市', 2, 0);
INSERT INTO `sys_area` VALUES ('320102000000', '320100000000', '0,320000000000,320100000000', '玄武区', 3, 0);
INSERT INTO `sys_area` VALUES ('320104000000', '320100000000', '0,320000000000,320100000000', '秦淮区', 3, 0);
INSERT INTO `sys_area` VALUES ('320105000000', '320100000000', '0,320000000000,320100000000', '建邺区', 3, 0);
INSERT INTO `sys_area` VALUES ('320106000000', '320100000000', '0,320000000000,320100000000', '鼓楼区', 3, 0);
INSERT INTO `sys_area` VALUES ('320111000000', '320100000000', '0,320000000000,320100000000', '浦口区', 3, 0);
INSERT INTO `sys_area` VALUES ('320113000000', '320100000000', '0,320000000000,320100000000', '栖霞区', 3, 0);
INSERT INTO `sys_area` VALUES ('320114000000', '320100000000', '0,320000000000,320100000000', '雨花台区', 3, 0);
INSERT INTO `sys_area` VALUES ('320115000000', '320100000000', '0,320000000000,320100000000', '江宁区', 3, 0);
INSERT INTO `sys_area` VALUES ('320116000000', '320100000000', '0,320000000000,320100000000', '六合区', 3, 0);
INSERT INTO `sys_area` VALUES ('320117000000', '320100000000', '0,320000000000,320100000000', '溧水区', 3, 0);
INSERT INTO `sys_area` VALUES ('320118000000', '320100000000', '0,320000000000,320100000000', '高淳区', 3, 0);
INSERT INTO `sys_area` VALUES ('320200000000', '320000000000', '0,320000000000', '无锡市', 2, 0);
INSERT INTO `sys_area` VALUES ('320202000000', '320200000000', '0,320000000000,320200000000', '崇安区', 3, 0);
INSERT INTO `sys_area` VALUES ('320203000000', '320200000000', '0,320000000000,320200000000', '南长区', 3, 0);
INSERT INTO `sys_area` VALUES ('320204000000', '320200000000', '0,320000000000,320200000000', '北塘区', 3, 0);
INSERT INTO `sys_area` VALUES ('320205000000', '320200000000', '0,320000000000,320200000000', '锡山区', 3, 0);
INSERT INTO `sys_area` VALUES ('320206000000', '320200000000', '0,320000000000,320200000000', '惠山区', 3, 0);
INSERT INTO `sys_area` VALUES ('320211000000', '320200000000', '0,320000000000,320200000000', '滨湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('320281000000', '320200000000', '0,320000000000,320200000000', '江阴市', 3, 0);
INSERT INTO `sys_area` VALUES ('320282000000', '320200000000', '0,320000000000,320200000000', '宜兴市', 3, 0);
INSERT INTO `sys_area` VALUES ('320300000000', '320000000000', '0,320000000000', '徐州市', 2, 0);
INSERT INTO `sys_area` VALUES ('320302000000', '320300000000', '0,320000000000,320300000000', '鼓楼区', 3, 0);
INSERT INTO `sys_area` VALUES ('320303000000', '320300000000', '0,320000000000,320300000000', '云龙区', 3, 0);
INSERT INTO `sys_area` VALUES ('320305000000', '320300000000', '0,320000000000,320300000000', '贾汪区', 3, 0);
INSERT INTO `sys_area` VALUES ('320311000000', '320300000000', '0,320000000000,320300000000', '泉山区', 3, 0);
INSERT INTO `sys_area` VALUES ('320312000000', '320300000000', '0,320000000000,320300000000', '铜山区', 3, 0);
INSERT INTO `sys_area` VALUES ('320321000000', '320300000000', '0,320000000000,320300000000', '丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('320322000000', '320300000000', '0,320000000000,320300000000', '沛县', 3, 0);
INSERT INTO `sys_area` VALUES ('320324000000', '320300000000', '0,320000000000,320300000000', '睢宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('320381000000', '320300000000', '0,320000000000,320300000000', '新沂市', 3, 0);
INSERT INTO `sys_area` VALUES ('320382000000', '320300000000', '0,320000000000,320300000000', '邳州市', 3, 0);
INSERT INTO `sys_area` VALUES ('320400000000', '320000000000', '0,320000000000', '常州市', 2, 0);
INSERT INTO `sys_area` VALUES ('320402000000', '320400000000', '0,320000000000,320400000000', '天宁区', 3, 0);
INSERT INTO `sys_area` VALUES ('320404000000', '320400000000', '0,320000000000,320400000000', '钟楼区', 3, 0);
INSERT INTO `sys_area` VALUES ('320411000000', '320400000000', '0,320000000000,320400000000', '新北区', 3, 0);
INSERT INTO `sys_area` VALUES ('320412000000', '320400000000', '0,320000000000,320400000000', '武进区', 3, 0);
INSERT INTO `sys_area` VALUES ('320413000000', '320400000000', '0,320000000000,320400000000', '金坛区', 3, 0);
INSERT INTO `sys_area` VALUES ('320481000000', '320400000000', '0,320000000000,320400000000', '溧阳市', 3, 0);
INSERT INTO `sys_area` VALUES ('320500000000', '320000000000', '0,320000000000', '苏州市', 2, 0);
INSERT INTO `sys_area` VALUES ('320505000000', '320500000000', '0,320000000000,320500000000', '虎丘区', 3, 0);
INSERT INTO `sys_area` VALUES ('320506000000', '320500000000', '0,320000000000,320500000000', '吴中区', 3, 0);
INSERT INTO `sys_area` VALUES ('320507000000', '320500000000', '0,320000000000,320500000000', '相城区', 3, 0);
INSERT INTO `sys_area` VALUES ('320508000000', '320500000000', '0,320000000000,320500000000', '姑苏区', 3, 0);
INSERT INTO `sys_area` VALUES ('320509000000', '320500000000', '0,320000000000,320500000000', '吴江区', 3, 0);
INSERT INTO `sys_area` VALUES ('320581000000', '320500000000', '0,320000000000,320500000000', '常熟市', 3, 0);
INSERT INTO `sys_area` VALUES ('320582000000', '320500000000', '0,320000000000,320500000000', '张家港市', 3, 0);
INSERT INTO `sys_area` VALUES ('320583000000', '320500000000', '0,320000000000,320500000000', '昆山市', 3, 0);
INSERT INTO `sys_area` VALUES ('320585000000', '320500000000', '0,320000000000,320500000000', '太仓市', 3, 0);
INSERT INTO `sys_area` VALUES ('320600000000', '320000000000', '0,320000000000', '南通市', 2, 0);
INSERT INTO `sys_area` VALUES ('320602000000', '320600000000', '0,320000000000,320600000000', '崇川区', 3, 0);
INSERT INTO `sys_area` VALUES ('320611000000', '320600000000', '0,320000000000,320600000000', '港闸区', 3, 0);
INSERT INTO `sys_area` VALUES ('320612000000', '320600000000', '0,320000000000,320600000000', '通州区', 3, 0);
INSERT INTO `sys_area` VALUES ('320621000000', '320600000000', '0,320000000000,320600000000', '海安县', 3, 0);
INSERT INTO `sys_area` VALUES ('320623000000', '320600000000', '0,320000000000,320600000000', '如东县', 3, 0);
INSERT INTO `sys_area` VALUES ('320681000000', '320600000000', '0,320000000000,320600000000', '启东市', 3, 0);
INSERT INTO `sys_area` VALUES ('320682000000', '320600000000', '0,320000000000,320600000000', '如皋市', 3, 0);
INSERT INTO `sys_area` VALUES ('320684000000', '320600000000', '0,320000000000,320600000000', '海门市', 3, 0);
INSERT INTO `sys_area` VALUES ('320700000000', '320000000000', '0,320000000000', '连云港市', 2, 0);
INSERT INTO `sys_area` VALUES ('320703000000', '320700000000', '0,320000000000,320700000000', '连云区', 3, 0);
INSERT INTO `sys_area` VALUES ('320706000000', '320700000000', '0,320000000000,320700000000', '海州区', 3, 0);
INSERT INTO `sys_area` VALUES ('320707000000', '320700000000', '0,320000000000,320700000000', '赣榆区', 3, 0);
INSERT INTO `sys_area` VALUES ('320722000000', '320700000000', '0,320000000000,320700000000', '东海县', 3, 0);
INSERT INTO `sys_area` VALUES ('320723000000', '320700000000', '0,320000000000,320700000000', '灌云县', 3, 0);
INSERT INTO `sys_area` VALUES ('320724000000', '320700000000', '0,320000000000,320700000000', '灌南县', 3, 0);
INSERT INTO `sys_area` VALUES ('320800000000', '320000000000', '0,320000000000', '淮安市', 2, 0);
INSERT INTO `sys_area` VALUES ('320802000000', '320800000000', '0,320000000000,320800000000', '清河区', 3, 0);
INSERT INTO `sys_area` VALUES ('320803000000', '320800000000', '0,320000000000,320800000000', '淮安区', 3, 0);
INSERT INTO `sys_area` VALUES ('320804000000', '320800000000', '0,320000000000,320800000000', '淮阴区', 3, 0);
INSERT INTO `sys_area` VALUES ('320811000000', '320800000000', '0,320000000000,320800000000', '清浦区', 3, 0);
INSERT INTO `sys_area` VALUES ('320826000000', '320800000000', '0,320000000000,320800000000', '涟水县', 3, 0);
INSERT INTO `sys_area` VALUES ('320829000000', '320800000000', '0,320000000000,320800000000', '洪泽县', 3, 0);
INSERT INTO `sys_area` VALUES ('320830000000', '320800000000', '0,320000000000,320800000000', '盱眙县', 3, 0);
INSERT INTO `sys_area` VALUES ('320831000000', '320800000000', '0,320000000000,320800000000', '金湖县', 3, 0);
INSERT INTO `sys_area` VALUES ('320900000000', '320000000000', '0,320000000000', '盐城市', 2, 0);
INSERT INTO `sys_area` VALUES ('320902000000', '320900000000', '0,320000000000,320900000000', '亭湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('320903000000', '320900000000', '0,320000000000,320900000000', '盐都区', 3, 0);
INSERT INTO `sys_area` VALUES ('320904000000', '320900000000', '0,320000000000,320900000000', '大丰区', 3, 0);
INSERT INTO `sys_area` VALUES ('320921000000', '320900000000', '0,320000000000,320900000000', '响水县', 3, 0);
INSERT INTO `sys_area` VALUES ('320922000000', '320900000000', '0,320000000000,320900000000', '滨海县', 3, 0);
INSERT INTO `sys_area` VALUES ('320923000000', '320900000000', '0,320000000000,320900000000', '阜宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('320924000000', '320900000000', '0,320000000000,320900000000', '射阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('320925000000', '320900000000', '0,320000000000,320900000000', '建湖县', 3, 0);
INSERT INTO `sys_area` VALUES ('320981000000', '320900000000', '0,320000000000,320900000000', '东台市', 3, 0);
INSERT INTO `sys_area` VALUES ('321000000000', '320000000000', '0,320000000000', '扬州市', 2, 0);
INSERT INTO `sys_area` VALUES ('321002000000', '321000000000', '0,320000000000,321000000000', '广陵区', 3, 0);
INSERT INTO `sys_area` VALUES ('321003000000', '321000000000', '0,320000000000,321000000000', '邗江区', 3, 0);
INSERT INTO `sys_area` VALUES ('321012000000', '321000000000', '0,320000000000,321000000000', '江都区', 3, 0);
INSERT INTO `sys_area` VALUES ('321023000000', '321000000000', '0,320000000000,321000000000', '宝应县', 3, 0);
INSERT INTO `sys_area` VALUES ('321081000000', '321000000000', '0,320000000000,321000000000', '仪征市', 3, 0);
INSERT INTO `sys_area` VALUES ('321084000000', '321000000000', '0,320000000000,321000000000', '高邮市', 3, 0);
INSERT INTO `sys_area` VALUES ('321100000000', '320000000000', '0,320000000000', '镇江市', 2, 0);
INSERT INTO `sys_area` VALUES ('321102000000', '321100000000', '0,320000000000,321100000000', '京口区', 3, 0);
INSERT INTO `sys_area` VALUES ('321111000000', '321100000000', '0,320000000000,321100000000', '润州区', 3, 0);
INSERT INTO `sys_area` VALUES ('321112000000', '321100000000', '0,320000000000,321100000000', '丹徒区', 3, 0);
INSERT INTO `sys_area` VALUES ('321181000000', '321100000000', '0,320000000000,321100000000', '丹阳市', 3, 0);
INSERT INTO `sys_area` VALUES ('321182000000', '321100000000', '0,320000000000,321100000000', '扬中市', 3, 0);
INSERT INTO `sys_area` VALUES ('321183000000', '321100000000', '0,320000000000,321100000000', '句容市', 3, 0);
INSERT INTO `sys_area` VALUES ('321200000000', '320000000000', '0,320000000000', '泰州市', 2, 0);
INSERT INTO `sys_area` VALUES ('321202000000', '321200000000', '0,320000000000,321200000000', '海陵区', 3, 0);
INSERT INTO `sys_area` VALUES ('321203000000', '321200000000', '0,320000000000,321200000000', '高港区', 3, 0);
INSERT INTO `sys_area` VALUES ('321204000000', '321200000000', '0,320000000000,321200000000', '姜堰区', 3, 0);
INSERT INTO `sys_area` VALUES ('321281000000', '321200000000', '0,320000000000,321200000000', '兴化市', 3, 0);
INSERT INTO `sys_area` VALUES ('321282000000', '321200000000', '0,320000000000,321200000000', '靖江市', 3, 0);
INSERT INTO `sys_area` VALUES ('321283000000', '321200000000', '0,320000000000,321200000000', '泰兴市', 3, 0);
INSERT INTO `sys_area` VALUES ('321300000000', '320000000000', '0,320000000000', '宿迁市', 2, 0);
INSERT INTO `sys_area` VALUES ('321302000000', '321300000000', '0,320000000000,321300000000', '宿城区', 3, 0);
INSERT INTO `sys_area` VALUES ('321311000000', '321300000000', '0,320000000000,321300000000', '宿豫区', 3, 0);
INSERT INTO `sys_area` VALUES ('321322000000', '321300000000', '0,320000000000,321300000000', '沭阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('321323000000', '321300000000', '0,320000000000,321300000000', '泗阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('321324000000', '321300000000', '0,320000000000,321300000000', '泗洪县', 3, 0);
INSERT INTO `sys_area` VALUES ('330000000000', '100000000000', '0,', '浙江省', 1, 0);
INSERT INTO `sys_area` VALUES ('330100000000', '330000000000', '0,330000000000', '杭州市', 2, 0);
INSERT INTO `sys_area` VALUES ('330102000000', '330100000000', '0,330000000000,330100000000', '上城区', 3, 0);
INSERT INTO `sys_area` VALUES ('330103000000', '330100000000', '0,330000000000,330100000000', '下城区', 3, 0);
INSERT INTO `sys_area` VALUES ('330104000000', '330100000000', '0,330000000000,330100000000', '江干区', 3, 0);
INSERT INTO `sys_area` VALUES ('330105000000', '330100000000', '0,330000000000,330100000000', '拱墅区', 3, 0);
INSERT INTO `sys_area` VALUES ('330106000000', '330100000000', '0,330000000000,330100000000', '西湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('330108000000', '330100000000', '0,330000000000,330100000000', '滨江区', 3, 0);
INSERT INTO `sys_area` VALUES ('330109000000', '330100000000', '0,330000000000,330100000000', '萧山区', 3, 0);
INSERT INTO `sys_area` VALUES ('330110000000', '330100000000', '0,330000000000,330100000000', '余杭区', 3, 0);
INSERT INTO `sys_area` VALUES ('330111000000', '330100000000', '0,330000000000,330100000000', '富阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('330122000000', '330100000000', '0,330000000000,330100000000', '桐庐县', 3, 0);
INSERT INTO `sys_area` VALUES ('330127000000', '330100000000', '0,330000000000,330100000000', '淳安县', 3, 0);
INSERT INTO `sys_area` VALUES ('330182000000', '330100000000', '0,330000000000,330100000000', '建德市', 3, 0);
INSERT INTO `sys_area` VALUES ('330185000000', '330100000000', '0,330000000000,330100000000', '临安市', 3, 0);
INSERT INTO `sys_area` VALUES ('330200000000', '330000000000', '0,330000000000', '宁波市', 2, 0);
INSERT INTO `sys_area` VALUES ('330203000000', '330200000000', '0,330000000000,330200000000', '海曙区', 3, 0);
INSERT INTO `sys_area` VALUES ('330204000000', '330200000000', '0,330000000000,330200000000', '江东区', 3, 0);
INSERT INTO `sys_area` VALUES ('330205000000', '330200000000', '0,330000000000,330200000000', '江北区', 3, 0);
INSERT INTO `sys_area` VALUES ('330206000000', '330200000000', '0,330000000000,330200000000', '北仑区', 3, 0);
INSERT INTO `sys_area` VALUES ('330211000000', '330200000000', '0,330000000000,330200000000', '镇海区', 3, 0);
INSERT INTO `sys_area` VALUES ('330212000000', '330200000000', '0,330000000000,330200000000', '鄞州区', 3, 0);
INSERT INTO `sys_area` VALUES ('330225000000', '330200000000', '0,330000000000,330200000000', '象山县', 3, 0);
INSERT INTO `sys_area` VALUES ('330226000000', '330200000000', '0,330000000000,330200000000', '宁海县', 3, 0);
INSERT INTO `sys_area` VALUES ('330281000000', '330200000000', '0,330000000000,330200000000', '余姚市', 3, 0);
INSERT INTO `sys_area` VALUES ('330282000000', '330200000000', '0,330000000000,330200000000', '慈溪市', 3, 0);
INSERT INTO `sys_area` VALUES ('330283000000', '330200000000', '0,330000000000,330200000000', '奉化市', 3, 0);
INSERT INTO `sys_area` VALUES ('330300000000', '330000000000', '0,330000000000', '温州市', 2, 0);
INSERT INTO `sys_area` VALUES ('330302000000', '330300000000', '0,330000000000,330300000000', '鹿城区', 3, 0);
INSERT INTO `sys_area` VALUES ('330303000000', '330300000000', '0,330000000000,330300000000', '龙湾区', 3, 0);
INSERT INTO `sys_area` VALUES ('330304000000', '330300000000', '0,330000000000,330300000000', '瓯海区', 3, 0);
INSERT INTO `sys_area` VALUES ('330305000000', '330300000000', '0,330000000000,330300000000', '洞头区', 3, 0);
INSERT INTO `sys_area` VALUES ('330324000000', '330300000000', '0,330000000000,330300000000', '永嘉县', 3, 0);
INSERT INTO `sys_area` VALUES ('330326000000', '330300000000', '0,330000000000,330300000000', '平阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('330327000000', '330300000000', '0,330000000000,330300000000', '苍南县', 3, 0);
INSERT INTO `sys_area` VALUES ('330328000000', '330300000000', '0,330000000000,330300000000', '文成县', 3, 0);
INSERT INTO `sys_area` VALUES ('330329000000', '330300000000', '0,330000000000,330300000000', '泰顺县', 3, 0);
INSERT INTO `sys_area` VALUES ('330381000000', '330300000000', '0,330000000000,330300000000', '瑞安市', 3, 0);
INSERT INTO `sys_area` VALUES ('330382000000', '330300000000', '0,330000000000,330300000000', '乐清市', 3, 0);
INSERT INTO `sys_area` VALUES ('330400000000', '330000000000', '0,330000000000', '嘉兴市', 2, 0);
INSERT INTO `sys_area` VALUES ('330402000000', '330400000000', '0,330000000000,330400000000', '南湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('330411000000', '330400000000', '0,330000000000,330400000000', '秀洲区', 3, 0);
INSERT INTO `sys_area` VALUES ('330421000000', '330400000000', '0,330000000000,330400000000', '嘉善县', 3, 0);
INSERT INTO `sys_area` VALUES ('330424000000', '330400000000', '0,330000000000,330400000000', '海盐县', 3, 0);
INSERT INTO `sys_area` VALUES ('330481000000', '330400000000', '0,330000000000,330400000000', '海宁市', 3, 0);
INSERT INTO `sys_area` VALUES ('330482000000', '330400000000', '0,330000000000,330400000000', '平湖市', 3, 0);
INSERT INTO `sys_area` VALUES ('330483000000', '330400000000', '0,330000000000,330400000000', '桐乡市', 3, 0);
INSERT INTO `sys_area` VALUES ('330500000000', '330000000000', '0,330000000000', '湖州市', 2, 0);
INSERT INTO `sys_area` VALUES ('330502000000', '330500000000', '0,330000000000,330500000000', '吴兴区', 3, 0);
INSERT INTO `sys_area` VALUES ('330503000000', '330500000000', '0,330000000000,330500000000', '南浔区', 3, 0);
INSERT INTO `sys_area` VALUES ('330521000000', '330500000000', '0,330000000000,330500000000', '德清县', 3, 0);
INSERT INTO `sys_area` VALUES ('330522000000', '330500000000', '0,330000000000,330500000000', '长兴县', 3, 0);
INSERT INTO `sys_area` VALUES ('330523000000', '330500000000', '0,330000000000,330500000000', '安吉县', 3, 0);
INSERT INTO `sys_area` VALUES ('330600000000', '330000000000', '0,330000000000', '绍兴市', 2, 0);
INSERT INTO `sys_area` VALUES ('330602000000', '330600000000', '0,330000000000,330600000000', '越城区', 3, 0);
INSERT INTO `sys_area` VALUES ('330603000000', '330600000000', '0,330000000000,330600000000', '柯桥区', 3, 0);
INSERT INTO `sys_area` VALUES ('330604000000', '330600000000', '0,330000000000,330600000000', '上虞区', 3, 0);
INSERT INTO `sys_area` VALUES ('330624000000', '330600000000', '0,330000000000,330600000000', '新昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('330681000000', '330600000000', '0,330000000000,330600000000', '诸暨市', 3, 0);
INSERT INTO `sys_area` VALUES ('330683000000', '330600000000', '0,330000000000,330600000000', '嵊州市', 3, 0);
INSERT INTO `sys_area` VALUES ('330700000000', '330000000000', '0,330000000000', '金华市', 2, 0);
INSERT INTO `sys_area` VALUES ('330702000000', '330700000000', '0,330000000000,330700000000', '婺城区', 3, 0);
INSERT INTO `sys_area` VALUES ('330703000000', '330700000000', '0,330000000000,330700000000', '金东区', 3, 0);
INSERT INTO `sys_area` VALUES ('330723000000', '330700000000', '0,330000000000,330700000000', '武义县', 3, 0);
INSERT INTO `sys_area` VALUES ('330726000000', '330700000000', '0,330000000000,330700000000', '浦江县', 3, 0);
INSERT INTO `sys_area` VALUES ('330727000000', '330700000000', '0,330000000000,330700000000', '磐安县', 3, 0);
INSERT INTO `sys_area` VALUES ('330781000000', '330700000000', '0,330000000000,330700000000', '兰溪市', 3, 0);
INSERT INTO `sys_area` VALUES ('330782000000', '330700000000', '0,330000000000,330700000000', '义乌市', 3, 0);
INSERT INTO `sys_area` VALUES ('330783000000', '330700000000', '0,330000000000,330700000000', '东阳市', 3, 0);
INSERT INTO `sys_area` VALUES ('330784000000', '330700000000', '0,330000000000,330700000000', '永康市', 3, 0);
INSERT INTO `sys_area` VALUES ('330800000000', '330000000000', '0,330000000000', '衢州市', 2, 0);
INSERT INTO `sys_area` VALUES ('330802000000', '330800000000', '0,330000000000,330800000000', '柯城区', 3, 0);
INSERT INTO `sys_area` VALUES ('330803000000', '330800000000', '0,330000000000,330800000000', '衢江区', 3, 0);
INSERT INTO `sys_area` VALUES ('330822000000', '330800000000', '0,330000000000,330800000000', '常山县', 3, 0);
INSERT INTO `sys_area` VALUES ('330824000000', '330800000000', '0,330000000000,330800000000', '开化县', 3, 0);
INSERT INTO `sys_area` VALUES ('330825000000', '330800000000', '0,330000000000,330800000000', '龙游县', 3, 0);
INSERT INTO `sys_area` VALUES ('330881000000', '330800000000', '0,330000000000,330800000000', '江山市', 3, 0);
INSERT INTO `sys_area` VALUES ('330900000000', '330000000000', '0,330000000000', '舟山市', 2, 0);
INSERT INTO `sys_area` VALUES ('330902000000', '330900000000', '0,330000000000,330900000000', '定海区', 3, 0);
INSERT INTO `sys_area` VALUES ('330903000000', '330900000000', '0,330000000000,330900000000', '普陀区', 3, 0);
INSERT INTO `sys_area` VALUES ('330921000000', '330900000000', '0,330000000000,330900000000', '岱山县', 3, 0);
INSERT INTO `sys_area` VALUES ('330922000000', '330900000000', '0,330000000000,330900000000', '嵊泗县', 3, 0);
INSERT INTO `sys_area` VALUES ('331000000000', '330000000000', '0,330000000000', '台州市', 2, 0);
INSERT INTO `sys_area` VALUES ('331002000000', '331000000000', '0,330000000000,331000000000', '椒江区', 3, 0);
INSERT INTO `sys_area` VALUES ('331003000000', '331000000000', '0,330000000000,331000000000', '黄岩区', 3, 0);
INSERT INTO `sys_area` VALUES ('331004000000', '331000000000', '0,330000000000,331000000000', '路桥区', 3, 0);
INSERT INTO `sys_area` VALUES ('331021000000', '331000000000', '0,330000000000,331000000000', '玉环县', 3, 0);
INSERT INTO `sys_area` VALUES ('331022000000', '331000000000', '0,330000000000,331000000000', '三门县', 3, 0);
INSERT INTO `sys_area` VALUES ('331023000000', '331000000000', '0,330000000000,331000000000', '天台县', 3, 0);
INSERT INTO `sys_area` VALUES ('331024000000', '331000000000', '0,330000000000,331000000000', '仙居县', 3, 0);
INSERT INTO `sys_area` VALUES ('331081000000', '331000000000', '0,330000000000,331000000000', '温岭市', 3, 0);
INSERT INTO `sys_area` VALUES ('331082000000', '331000000000', '0,330000000000,331000000000', '临海市', 3, 0);
INSERT INTO `sys_area` VALUES ('331100000000', '330000000000', '0,330000000000', '丽水市', 2, 0);
INSERT INTO `sys_area` VALUES ('331102000000', '331100000000', '0,330000000000,331100000000', '莲都区', 3, 0);
INSERT INTO `sys_area` VALUES ('331121000000', '331100000000', '0,330000000000,331100000000', '青田县', 3, 0);
INSERT INTO `sys_area` VALUES ('331122000000', '331100000000', '0,330000000000,331100000000', '缙云县', 3, 0);
INSERT INTO `sys_area` VALUES ('331123000000', '331100000000', '0,330000000000,331100000000', '遂昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('331124000000', '331100000000', '0,330000000000,331100000000', '松阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('331125000000', '331100000000', '0,330000000000,331100000000', '云和县', 3, 0);
INSERT INTO `sys_area` VALUES ('331126000000', '331100000000', '0,330000000000,331100000000', '庆元县', 3, 0);
INSERT INTO `sys_area` VALUES ('331127000000', '331100000000', '0,330000000000,331100000000', '景宁畲族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('331181000000', '331100000000', '0,330000000000,331100000000', '龙泉市', 3, 0);
INSERT INTO `sys_area` VALUES ('340000000000', '100000000000', '0,', '安徽省', 1, 0);
INSERT INTO `sys_area` VALUES ('340100000000', '340000000000', '0,340000000000', '合肥市', 2, 0);
INSERT INTO `sys_area` VALUES ('340102000000', '340100000000', '0,340000000000,340100000000', '瑶海区', 3, 0);
INSERT INTO `sys_area` VALUES ('340103000000', '340100000000', '0,340000000000,340100000000', '庐阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('340104000000', '340100000000', '0,340000000000,340100000000', '蜀山区', 3, 0);
INSERT INTO `sys_area` VALUES ('340111000000', '340100000000', '0,340000000000,340100000000', '包河区', 3, 0);
INSERT INTO `sys_area` VALUES ('340121000000', '340100000000', '0,340000000000,340100000000', '长丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('340122000000', '340100000000', '0,340000000000,340100000000', '肥东县', 3, 0);
INSERT INTO `sys_area` VALUES ('340123000000', '340100000000', '0,340000000000,340100000000', '肥西县', 3, 0);
INSERT INTO `sys_area` VALUES ('340124000000', '340100000000', '0,340000000000,340100000000', '庐江县', 3, 0);
INSERT INTO `sys_area` VALUES ('340181000000', '340100000000', '0,340000000000,340100000000', '巢湖市', 3, 0);
INSERT INTO `sys_area` VALUES ('340200000000', '340000000000', '0,340000000000', '芜湖市', 2, 0);
INSERT INTO `sys_area` VALUES ('340202000000', '340200000000', '0,340000000000,340200000000', '镜湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('340203000000', '340200000000', '0,340000000000,340200000000', '弋江区', 3, 0);
INSERT INTO `sys_area` VALUES ('340207000000', '340200000000', '0,340000000000,340200000000', '鸠江区', 3, 0);
INSERT INTO `sys_area` VALUES ('340208000000', '340200000000', '0,340000000000,340200000000', '三山区', 3, 0);
INSERT INTO `sys_area` VALUES ('340221000000', '340200000000', '0,340000000000,340200000000', '芜湖县', 3, 0);
INSERT INTO `sys_area` VALUES ('340222000000', '340200000000', '0,340000000000,340200000000', '繁昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('340223000000', '340200000000', '0,340000000000,340200000000', '南陵县', 3, 0);
INSERT INTO `sys_area` VALUES ('340225000000', '340200000000', '0,340000000000,340200000000', '无为县', 3, 0);
INSERT INTO `sys_area` VALUES ('340300000000', '340000000000', '0,340000000000', '蚌埠市', 2, 0);
INSERT INTO `sys_area` VALUES ('340302000000', '340300000000', '0,340000000000,340300000000', '龙子湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('340303000000', '340300000000', '0,340000000000,340300000000', '蚌山区', 3, 0);
INSERT INTO `sys_area` VALUES ('340304000000', '340300000000', '0,340000000000,340300000000', '禹会区', 3, 0);
INSERT INTO `sys_area` VALUES ('340311000000', '340300000000', '0,340000000000,340300000000', '淮上区', 3, 0);
INSERT INTO `sys_area` VALUES ('340321000000', '340300000000', '0,340000000000,340300000000', '怀远县', 3, 0);
INSERT INTO `sys_area` VALUES ('340322000000', '340300000000', '0,340000000000,340300000000', '五河县', 3, 0);
INSERT INTO `sys_area` VALUES ('340323000000', '340300000000', '0,340000000000,340300000000', '固镇县', 3, 0);
INSERT INTO `sys_area` VALUES ('340400000000', '340000000000', '0,340000000000', '淮南市', 2, 0);
INSERT INTO `sys_area` VALUES ('340402000000', '340400000000', '0,340000000000,340400000000', '大通区', 3, 0);
INSERT INTO `sys_area` VALUES ('340403000000', '340400000000', '0,340000000000,340400000000', '田家庵区', 3, 0);
INSERT INTO `sys_area` VALUES ('340404000000', '340400000000', '0,340000000000,340400000000', '谢家集区', 3, 0);
INSERT INTO `sys_area` VALUES ('340405000000', '340400000000', '0,340000000000,340400000000', '八公山区', 3, 0);
INSERT INTO `sys_area` VALUES ('340406000000', '340400000000', '0,340000000000,340400000000', '潘集区', 3, 0);
INSERT INTO `sys_area` VALUES ('340421000000', '340400000000', '0,340000000000,340400000000', '凤台县', 3, 0);
INSERT INTO `sys_area` VALUES ('340500000000', '340000000000', '0,340000000000', '马鞍山市', 2, 0);
INSERT INTO `sys_area` VALUES ('340503000000', '340500000000', '0,340000000000,340500000000', '花山区', 3, 0);
INSERT INTO `sys_area` VALUES ('340504000000', '340500000000', '0,340000000000,340500000000', '雨山区', 3, 0);
INSERT INTO `sys_area` VALUES ('340506000000', '340500000000', '0,340000000000,340500000000', '博望区', 3, 0);
INSERT INTO `sys_area` VALUES ('340521000000', '340500000000', '0,340000000000,340500000000', '当涂县', 3, 0);
INSERT INTO `sys_area` VALUES ('340522000000', '340500000000', '0,340000000000,340500000000', '含山县', 3, 0);
INSERT INTO `sys_area` VALUES ('340523000000', '340500000000', '0,340000000000,340500000000', '和县', 3, 0);
INSERT INTO `sys_area` VALUES ('340600000000', '340000000000', '0,340000000000', '淮北市', 2, 0);
INSERT INTO `sys_area` VALUES ('340602000000', '340600000000', '0,340000000000,340600000000', '杜集区', 3, 0);
INSERT INTO `sys_area` VALUES ('340603000000', '340600000000', '0,340000000000,340600000000', '相山区', 3, 0);
INSERT INTO `sys_area` VALUES ('340604000000', '340600000000', '0,340000000000,340600000000', '烈山区', 3, 0);
INSERT INTO `sys_area` VALUES ('340621000000', '340600000000', '0,340000000000,340600000000', '濉溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('340700000000', '340000000000', '0,340000000000', '铜陵市', 2, 0);
INSERT INTO `sys_area` VALUES ('340702000000', '340700000000', '0,340000000000,340700000000', '铜官山区', 3, 0);
INSERT INTO `sys_area` VALUES ('340703000000', '340700000000', '0,340000000000,340700000000', '狮子山区', 3, 0);
INSERT INTO `sys_area` VALUES ('340711000000', '340700000000', '0,340000000000,340700000000', '郊区', 3, 0);
INSERT INTO `sys_area` VALUES ('340721000000', '340700000000', '0,340000000000,340700000000', '铜陵县', 3, 0);
INSERT INTO `sys_area` VALUES ('340800000000', '340000000000', '0,340000000000', '安庆市', 2, 0);
INSERT INTO `sys_area` VALUES ('340802000000', '340800000000', '0,340000000000,340800000000', '迎江区', 3, 0);
INSERT INTO `sys_area` VALUES ('340803000000', '340800000000', '0,340000000000,340800000000', '大观区', 3, 0);
INSERT INTO `sys_area` VALUES ('340811000000', '340800000000', '0,340000000000,340800000000', '宜秀区', 3, 0);
INSERT INTO `sys_area` VALUES ('340822000000', '340800000000', '0,340000000000,340800000000', '怀宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('340823000000', '340800000000', '0,340000000000,340800000000', '枞阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('340824000000', '340800000000', '0,340000000000,340800000000', '潜山县', 3, 0);
INSERT INTO `sys_area` VALUES ('340825000000', '340800000000', '0,340000000000,340800000000', '太湖县', 3, 0);
INSERT INTO `sys_area` VALUES ('340826000000', '340800000000', '0,340000000000,340800000000', '宿松县', 3, 0);
INSERT INTO `sys_area` VALUES ('340827000000', '340800000000', '0,340000000000,340800000000', '望江县', 3, 0);
INSERT INTO `sys_area` VALUES ('340828000000', '340800000000', '0,340000000000,340800000000', '岳西县', 3, 0);
INSERT INTO `sys_area` VALUES ('340881000000', '340800000000', '0,340000000000,340800000000', '桐城市', 3, 0);
INSERT INTO `sys_area` VALUES ('341000000000', '340000000000', '0,340000000000', '黄山市', 2, 0);
INSERT INTO `sys_area` VALUES ('341002000000', '341000000000', '0,340000000000,341000000000', '屯溪区', 3, 0);
INSERT INTO `sys_area` VALUES ('341003000000', '341000000000', '0,340000000000,341000000000', '黄山区', 3, 0);
INSERT INTO `sys_area` VALUES ('341004000000', '341000000000', '0,340000000000,341000000000', '徽州区', 3, 0);
INSERT INTO `sys_area` VALUES ('341021000000', '341000000000', '0,340000000000,341000000000', '歙县', 3, 0);
INSERT INTO `sys_area` VALUES ('341022000000', '341000000000', '0,340000000000,341000000000', '休宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('341023000000', '341000000000', '0,340000000000,341000000000', '黟县', 3, 0);
INSERT INTO `sys_area` VALUES ('341024000000', '341000000000', '0,340000000000,341000000000', '祁门县', 3, 0);
INSERT INTO `sys_area` VALUES ('341100000000', '340000000000', '0,340000000000', '滁州市', 2, 0);
INSERT INTO `sys_area` VALUES ('341102000000', '341100000000', '0,340000000000,341100000000', '琅琊区', 3, 0);
INSERT INTO `sys_area` VALUES ('341103000000', '341100000000', '0,340000000000,341100000000', '南谯区', 3, 0);
INSERT INTO `sys_area` VALUES ('341122000000', '341100000000', '0,340000000000,341100000000', '来安县', 3, 0);
INSERT INTO `sys_area` VALUES ('341124000000', '341100000000', '0,340000000000,341100000000', '全椒县', 3, 0);
INSERT INTO `sys_area` VALUES ('341125000000', '341100000000', '0,340000000000,341100000000', '定远县', 3, 0);
INSERT INTO `sys_area` VALUES ('341126000000', '341100000000', '0,340000000000,341100000000', '凤阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('341181000000', '341100000000', '0,340000000000,341100000000', '天长市', 3, 0);
INSERT INTO `sys_area` VALUES ('341182000000', '341100000000', '0,340000000000,341100000000', '明光市', 3, 0);
INSERT INTO `sys_area` VALUES ('341200000000', '340000000000', '0,340000000000', '阜阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('341202000000', '341200000000', '0,340000000000,341200000000', '颍州区', 3, 0);
INSERT INTO `sys_area` VALUES ('341203000000', '341200000000', '0,340000000000,341200000000', '颍东区', 3, 0);
INSERT INTO `sys_area` VALUES ('341204000000', '341200000000', '0,340000000000,341200000000', '颍泉区', 3, 0);
INSERT INTO `sys_area` VALUES ('341221000000', '341200000000', '0,340000000000,341200000000', '临泉县', 3, 0);
INSERT INTO `sys_area` VALUES ('341222000000', '341200000000', '0,340000000000,341200000000', '太和县', 3, 0);
INSERT INTO `sys_area` VALUES ('341225000000', '341200000000', '0,340000000000,341200000000', '阜南县', 3, 0);
INSERT INTO `sys_area` VALUES ('341226000000', '341200000000', '0,340000000000,341200000000', '颍上县', 3, 0);
INSERT INTO `sys_area` VALUES ('341282000000', '341200000000', '0,340000000000,341200000000', '界首市', 3, 0);
INSERT INTO `sys_area` VALUES ('341300000000', '340000000000', '0,340000000000', '宿州市', 2, 0);
INSERT INTO `sys_area` VALUES ('341302000000', '341300000000', '0,340000000000,341300000000', '埇桥区', 3, 0);
INSERT INTO `sys_area` VALUES ('341321000000', '341300000000', '0,340000000000,341300000000', '砀山县', 3, 0);
INSERT INTO `sys_area` VALUES ('341322000000', '341300000000', '0,340000000000,341300000000', '萧县', 3, 0);
INSERT INTO `sys_area` VALUES ('341323000000', '341300000000', '0,340000000000,341300000000', '灵璧县', 3, 0);
INSERT INTO `sys_area` VALUES ('341324000000', '341300000000', '0,340000000000,341300000000', '泗县', 3, 0);
INSERT INTO `sys_area` VALUES ('341500000000', '340000000000', '0,340000000000', '六安市', 2, 0);
INSERT INTO `sys_area` VALUES ('341502000000', '341500000000', '0,340000000000,341500000000', '金安区', 3, 0);
INSERT INTO `sys_area` VALUES ('341503000000', '341500000000', '0,340000000000,341500000000', '裕安区', 3, 0);
INSERT INTO `sys_area` VALUES ('341521000000', '341500000000', '0,340000000000,341500000000', '寿县', 3, 0);
INSERT INTO `sys_area` VALUES ('341522000000', '341500000000', '0,340000000000,341500000000', '霍邱县', 3, 0);
INSERT INTO `sys_area` VALUES ('341523000000', '341500000000', '0,340000000000,341500000000', '舒城县', 3, 0);
INSERT INTO `sys_area` VALUES ('341524000000', '341500000000', '0,340000000000,341500000000', '金寨县', 3, 0);
INSERT INTO `sys_area` VALUES ('341525000000', '341500000000', '0,340000000000,341500000000', '霍山县', 3, 0);
INSERT INTO `sys_area` VALUES ('341600000000', '340000000000', '0,340000000000', '亳州市', 2, 0);
INSERT INTO `sys_area` VALUES ('341602000000', '341600000000', '0,340000000000,341600000000', '谯城区', 3, 0);
INSERT INTO `sys_area` VALUES ('341621000000', '341600000000', '0,340000000000,341600000000', '涡阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('341622000000', '341600000000', '0,340000000000,341600000000', '蒙城县', 3, 0);
INSERT INTO `sys_area` VALUES ('341623000000', '341600000000', '0,340000000000,341600000000', '利辛县', 3, 0);
INSERT INTO `sys_area` VALUES ('341700000000', '340000000000', '0,340000000000', '池州市', 2, 0);
INSERT INTO `sys_area` VALUES ('341702000000', '341700000000', '0,340000000000,341700000000', '贵池区', 3, 0);
INSERT INTO `sys_area` VALUES ('341721000000', '341700000000', '0,340000000000,341700000000', '东至县', 3, 0);
INSERT INTO `sys_area` VALUES ('341722000000', '341700000000', '0,340000000000,341700000000', '石台县', 3, 0);
INSERT INTO `sys_area` VALUES ('341723000000', '341700000000', '0,340000000000,341700000000', '青阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('341800000000', '340000000000', '0,340000000000', '宣城市', 2, 0);
INSERT INTO `sys_area` VALUES ('341802000000', '341800000000', '0,340000000000,341800000000', '宣州区', 3, 0);
INSERT INTO `sys_area` VALUES ('341821000000', '341800000000', '0,340000000000,341800000000', '郎溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('341822000000', '341800000000', '0,340000000000,341800000000', '广德县', 3, 0);
INSERT INTO `sys_area` VALUES ('341823000000', '341800000000', '0,340000000000,341800000000', '泾县', 3, 0);
INSERT INTO `sys_area` VALUES ('341824000000', '341800000000', '0,340000000000,341800000000', '绩溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('341825000000', '341800000000', '0,340000000000,341800000000', '旌德县', 3, 0);
INSERT INTO `sys_area` VALUES ('341881000000', '341800000000', '0,340000000000,341800000000', '宁国市', 3, 0);
INSERT INTO `sys_area` VALUES ('350000000000', '100000000000', '0,', '福建省', 1, 0);
INSERT INTO `sys_area` VALUES ('350100000000', '350000000000', '0,350000000000', '福州市', 2, 0);
INSERT INTO `sys_area` VALUES ('350102000000', '350100000000', '0,350000000000,350100000000', '鼓楼区', 3, 0);
INSERT INTO `sys_area` VALUES ('350103000000', '350100000000', '0,350000000000,350100000000', '台江区', 3, 0);
INSERT INTO `sys_area` VALUES ('350104000000', '350100000000', '0,350000000000,350100000000', '仓山区', 3, 0);
INSERT INTO `sys_area` VALUES ('350105000000', '350100000000', '0,350000000000,350100000000', '马尾区', 3, 0);
INSERT INTO `sys_area` VALUES ('350111000000', '350100000000', '0,350000000000,350100000000', '晋安区', 3, 0);
INSERT INTO `sys_area` VALUES ('350121000000', '350100000000', '0,350000000000,350100000000', '闽侯县', 3, 0);
INSERT INTO `sys_area` VALUES ('350122000000', '350100000000', '0,350000000000,350100000000', '连江县', 3, 0);
INSERT INTO `sys_area` VALUES ('350123000000', '350100000000', '0,350000000000,350100000000', '罗源县', 3, 0);
INSERT INTO `sys_area` VALUES ('350124000000', '350100000000', '0,350000000000,350100000000', '闽清县', 3, 0);
INSERT INTO `sys_area` VALUES ('350125000000', '350100000000', '0,350000000000,350100000000', '永泰县', 3, 0);
INSERT INTO `sys_area` VALUES ('350128000000', '350100000000', '0,350000000000,350100000000', '平潭县', 3, 0);
INSERT INTO `sys_area` VALUES ('350181000000', '350100000000', '0,350000000000,350100000000', '福清市', 3, 0);
INSERT INTO `sys_area` VALUES ('350182000000', '350100000000', '0,350000000000,350100000000', '长乐市', 3, 0);
INSERT INTO `sys_area` VALUES ('350200000000', '350000000000', '0,350000000000', '厦门市', 2, 0);
INSERT INTO `sys_area` VALUES ('350203000000', '350200000000', '0,350000000000,350200000000', '思明区', 3, 0);
INSERT INTO `sys_area` VALUES ('350205000000', '350200000000', '0,350000000000,350200000000', '海沧区', 3, 0);
INSERT INTO `sys_area` VALUES ('350206000000', '350200000000', '0,350000000000,350200000000', '湖里区', 3, 0);
INSERT INTO `sys_area` VALUES ('350211000000', '350200000000', '0,350000000000,350200000000', '集美区', 3, 0);
INSERT INTO `sys_area` VALUES ('350212000000', '350200000000', '0,350000000000,350200000000', '同安区', 3, 0);
INSERT INTO `sys_area` VALUES ('350213000000', '350200000000', '0,350000000000,350200000000', '翔安区', 3, 0);
INSERT INTO `sys_area` VALUES ('350300000000', '350000000000', '0,350000000000', '莆田市', 2, 0);
INSERT INTO `sys_area` VALUES ('350302000000', '350300000000', '0,350000000000,350300000000', '城厢区', 3, 0);
INSERT INTO `sys_area` VALUES ('350303000000', '350300000000', '0,350000000000,350300000000', '涵江区', 3, 0);
INSERT INTO `sys_area` VALUES ('350304000000', '350300000000', '0,350000000000,350300000000', '荔城区', 3, 0);
INSERT INTO `sys_area` VALUES ('350305000000', '350300000000', '0,350000000000,350300000000', '秀屿区', 3, 0);
INSERT INTO `sys_area` VALUES ('350322000000', '350300000000', '0,350000000000,350300000000', '仙游县', 3, 0);
INSERT INTO `sys_area` VALUES ('350400000000', '350000000000', '0,350000000000', '三明市', 2, 0);
INSERT INTO `sys_area` VALUES ('350402000000', '350400000000', '0,350000000000,350400000000', '梅列区', 3, 0);
INSERT INTO `sys_area` VALUES ('350403000000', '350400000000', '0,350000000000,350400000000', '三元区', 3, 0);
INSERT INTO `sys_area` VALUES ('350421000000', '350400000000', '0,350000000000,350400000000', '明溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('350423000000', '350400000000', '0,350000000000,350400000000', '清流县', 3, 0);
INSERT INTO `sys_area` VALUES ('350424000000', '350400000000', '0,350000000000,350400000000', '宁化县', 3, 0);
INSERT INTO `sys_area` VALUES ('350425000000', '350400000000', '0,350000000000,350400000000', '大田县', 3, 0);
INSERT INTO `sys_area` VALUES ('350426000000', '350400000000', '0,350000000000,350400000000', '尤溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('350427000000', '350400000000', '0,350000000000,350400000000', '沙县', 3, 0);
INSERT INTO `sys_area` VALUES ('350428000000', '350400000000', '0,350000000000,350400000000', '将乐县', 3, 0);
INSERT INTO `sys_area` VALUES ('350429000000', '350400000000', '0,350000000000,350400000000', '泰宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('350430000000', '350400000000', '0,350000000000,350400000000', '建宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('350481000000', '350400000000', '0,350000000000,350400000000', '永安市', 3, 0);
INSERT INTO `sys_area` VALUES ('350500000000', '350000000000', '0,350000000000', '泉州市', 2, 0);
INSERT INTO `sys_area` VALUES ('350502000000', '350500000000', '0,350000000000,350500000000', '鲤城区', 3, 0);
INSERT INTO `sys_area` VALUES ('350503000000', '350500000000', '0,350000000000,350500000000', '丰泽区', 3, 0);
INSERT INTO `sys_area` VALUES ('350504000000', '350500000000', '0,350000000000,350500000000', '洛江区', 3, 0);
INSERT INTO `sys_area` VALUES ('350505000000', '350500000000', '0,350000000000,350500000000', '泉港区', 3, 0);
INSERT INTO `sys_area` VALUES ('350521000000', '350500000000', '0,350000000000,350500000000', '惠安县', 3, 0);
INSERT INTO `sys_area` VALUES ('350524000000', '350500000000', '0,350000000000,350500000000', '安溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('350525000000', '350500000000', '0,350000000000,350500000000', '永春县', 3, 0);
INSERT INTO `sys_area` VALUES ('350526000000', '350500000000', '0,350000000000,350500000000', '德化县', 3, 0);
INSERT INTO `sys_area` VALUES ('350527000000', '350500000000', '0,350000000000,350500000000', '金门县', 3, 0);
INSERT INTO `sys_area` VALUES ('350581000000', '350500000000', '0,350000000000,350500000000', '石狮市', 3, 0);
INSERT INTO `sys_area` VALUES ('350582000000', '350500000000', '0,350000000000,350500000000', '晋江市', 3, 0);
INSERT INTO `sys_area` VALUES ('350583000000', '350500000000', '0,350000000000,350500000000', '南安市', 3, 0);
INSERT INTO `sys_area` VALUES ('350600000000', '350000000000', '0,350000000000', '漳州市', 2, 0);
INSERT INTO `sys_area` VALUES ('350602000000', '350600000000', '0,350000000000,350600000000', '芗城区', 3, 0);
INSERT INTO `sys_area` VALUES ('350603000000', '350600000000', '0,350000000000,350600000000', '龙文区', 3, 0);
INSERT INTO `sys_area` VALUES ('350622000000', '350600000000', '0,350000000000,350600000000', '云霄县', 3, 0);
INSERT INTO `sys_area` VALUES ('350623000000', '350600000000', '0,350000000000,350600000000', '漳浦县', 3, 0);
INSERT INTO `sys_area` VALUES ('350624000000', '350600000000', '0,350000000000,350600000000', '诏安县', 3, 0);
INSERT INTO `sys_area` VALUES ('350625000000', '350600000000', '0,350000000000,350600000000', '长泰县', 3, 0);
INSERT INTO `sys_area` VALUES ('350626000000', '350600000000', '0,350000000000,350600000000', '东山县', 3, 0);
INSERT INTO `sys_area` VALUES ('350627000000', '350600000000', '0,350000000000,350600000000', '南靖县', 3, 0);
INSERT INTO `sys_area` VALUES ('350628000000', '350600000000', '0,350000000000,350600000000', '平和县', 3, 0);
INSERT INTO `sys_area` VALUES ('350629000000', '350600000000', '0,350000000000,350600000000', '华安县', 3, 0);
INSERT INTO `sys_area` VALUES ('350681000000', '350600000000', '0,350000000000,350600000000', '龙海市', 3, 0);
INSERT INTO `sys_area` VALUES ('350700000000', '350000000000', '0,350000000000', '南平市', 2, 0);
INSERT INTO `sys_area` VALUES ('350702000000', '350700000000', '0,350000000000,350700000000', '延平区', 3, 0);
INSERT INTO `sys_area` VALUES ('350703000000', '350700000000', '0,350000000000,350700000000', '建阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('350721000000', '350700000000', '0,350000000000,350700000000', '顺昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('350722000000', '350700000000', '0,350000000000,350700000000', '浦城县', 3, 0);
INSERT INTO `sys_area` VALUES ('350723000000', '350700000000', '0,350000000000,350700000000', '光泽县', 3, 0);
INSERT INTO `sys_area` VALUES ('350724000000', '350700000000', '0,350000000000,350700000000', '松溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('350725000000', '350700000000', '0,350000000000,350700000000', '政和县', 3, 0);
INSERT INTO `sys_area` VALUES ('350781000000', '350700000000', '0,350000000000,350700000000', '邵武市', 3, 0);
INSERT INTO `sys_area` VALUES ('350782000000', '350700000000', '0,350000000000,350700000000', '武夷山市', 3, 0);
INSERT INTO `sys_area` VALUES ('350783000000', '350700000000', '0,350000000000,350700000000', '建瓯市', 3, 0);
INSERT INTO `sys_area` VALUES ('350800000000', '350000000000', '0,350000000000', '龙岩市', 2, 0);
INSERT INTO `sys_area` VALUES ('350802000000', '350800000000', '0,350000000000,350800000000', '新罗区', 3, 0);
INSERT INTO `sys_area` VALUES ('350803000000', '350800000000', '0,350000000000,350800000000', '永定区', 3, 0);
INSERT INTO `sys_area` VALUES ('350821000000', '350800000000', '0,350000000000,350800000000', '长汀县', 3, 0);
INSERT INTO `sys_area` VALUES ('350823000000', '350800000000', '0,350000000000,350800000000', '上杭县', 3, 0);
INSERT INTO `sys_area` VALUES ('350824000000', '350800000000', '0,350000000000,350800000000', '武平县', 3, 0);
INSERT INTO `sys_area` VALUES ('350825000000', '350800000000', '0,350000000000,350800000000', '连城县', 3, 0);
INSERT INTO `sys_area` VALUES ('350881000000', '350800000000', '0,350000000000,350800000000', '漳平市', 3, 0);
INSERT INTO `sys_area` VALUES ('350900000000', '350000000000', '0,350000000000', '宁德市', 2, 0);
INSERT INTO `sys_area` VALUES ('350902000000', '350900000000', '0,350000000000,350900000000', '蕉城区', 3, 0);
INSERT INTO `sys_area` VALUES ('350921000000', '350900000000', '0,350000000000,350900000000', '霞浦县', 3, 0);
INSERT INTO `sys_area` VALUES ('350922000000', '350900000000', '0,350000000000,350900000000', '古田县', 3, 0);
INSERT INTO `sys_area` VALUES ('350923000000', '350900000000', '0,350000000000,350900000000', '屏南县', 3, 0);
INSERT INTO `sys_area` VALUES ('350924000000', '350900000000', '0,350000000000,350900000000', '寿宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('350925000000', '350900000000', '0,350000000000,350900000000', '周宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('350926000000', '350900000000', '0,350000000000,350900000000', '柘荣县', 3, 0);
INSERT INTO `sys_area` VALUES ('350981000000', '350900000000', '0,350000000000,350900000000', '福安市', 3, 0);
INSERT INTO `sys_area` VALUES ('350982000000', '350900000000', '0,350000000000,350900000000', '福鼎市', 3, 0);
INSERT INTO `sys_area` VALUES ('360000000000', '100000000000', '0,', '江西省', 1, 0);
INSERT INTO `sys_area` VALUES ('360100000000', '360000000000', '0,360000000000', '南昌市', 2, 0);
INSERT INTO `sys_area` VALUES ('360102000000', '360100000000', '0,360000000000,360100000000', '东湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('360103000000', '360100000000', '0,360000000000,360100000000', '西湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('360104000000', '360100000000', '0,360000000000,360100000000', '青云谱区', 3, 0);
INSERT INTO `sys_area` VALUES ('360105000000', '360100000000', '0,360000000000,360100000000', '湾里区', 3, 0);
INSERT INTO `sys_area` VALUES ('360111000000', '360100000000', '0,360000000000,360100000000', '青山湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('360112000000', '360100000000', '0,360000000000,360100000000', '新建区', 3, 0);
INSERT INTO `sys_area` VALUES ('360121000000', '360100000000', '0,360000000000,360100000000', '南昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('360123000000', '360100000000', '0,360000000000,360100000000', '安义县', 3, 0);
INSERT INTO `sys_area` VALUES ('360124000000', '360100000000', '0,360000000000,360100000000', '进贤县', 3, 0);
INSERT INTO `sys_area` VALUES ('360200000000', '360000000000', '0,360000000000', '景德镇市', 2, 0);
INSERT INTO `sys_area` VALUES ('360202000000', '360200000000', '0,360000000000,360200000000', '昌江区', 3, 0);
INSERT INTO `sys_area` VALUES ('360203000000', '360200000000', '0,360000000000,360200000000', '珠山区', 3, 0);
INSERT INTO `sys_area` VALUES ('360222000000', '360200000000', '0,360000000000,360200000000', '浮梁县', 3, 0);
INSERT INTO `sys_area` VALUES ('360281000000', '360200000000', '0,360000000000,360200000000', '乐平市', 3, 0);
INSERT INTO `sys_area` VALUES ('360300000000', '360000000000', '0,360000000000', '萍乡市', 2, 0);
INSERT INTO `sys_area` VALUES ('360302000000', '360300000000', '0,360000000000,360300000000', '安源区', 3, 0);
INSERT INTO `sys_area` VALUES ('360313000000', '360300000000', '0,360000000000,360300000000', '湘东区', 3, 0);
INSERT INTO `sys_area` VALUES ('360321000000', '360300000000', '0,360000000000,360300000000', '莲花县', 3, 0);
INSERT INTO `sys_area` VALUES ('360322000000', '360300000000', '0,360000000000,360300000000', '上栗县', 3, 0);
INSERT INTO `sys_area` VALUES ('360323000000', '360300000000', '0,360000000000,360300000000', '芦溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('360400000000', '360000000000', '0,360000000000', '九江市', 2, 0);
INSERT INTO `sys_area` VALUES ('360402000000', '360400000000', '0,360000000000,360400000000', '庐山区', 3, 0);
INSERT INTO `sys_area` VALUES ('360403000000', '360400000000', '0,360000000000,360400000000', '浔阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('360421000000', '360400000000', '0,360000000000,360400000000', '九江县', 3, 0);
INSERT INTO `sys_area` VALUES ('360423000000', '360400000000', '0,360000000000,360400000000', '武宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('360424000000', '360400000000', '0,360000000000,360400000000', '修水县', 3, 0);
INSERT INTO `sys_area` VALUES ('360425000000', '360400000000', '0,360000000000,360400000000', '永修县', 3, 0);
INSERT INTO `sys_area` VALUES ('360426000000', '360400000000', '0,360000000000,360400000000', '德安县', 3, 0);
INSERT INTO `sys_area` VALUES ('360427000000', '360400000000', '0,360000000000,360400000000', '星子县', 3, 0);
INSERT INTO `sys_area` VALUES ('360428000000', '360400000000', '0,360000000000,360400000000', '都昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('360429000000', '360400000000', '0,360000000000,360400000000', '湖口县', 3, 0);
INSERT INTO `sys_area` VALUES ('360430000000', '360400000000', '0,360000000000,360400000000', '彭泽县', 3, 0);
INSERT INTO `sys_area` VALUES ('360481000000', '360400000000', '0,360000000000,360400000000', '瑞昌市', 3, 0);
INSERT INTO `sys_area` VALUES ('360482000000', '360400000000', '0,360000000000,360400000000', '共青城市', 3, 0);
INSERT INTO `sys_area` VALUES ('360500000000', '360000000000', '0,360000000000', '新余市', 2, 0);
INSERT INTO `sys_area` VALUES ('360502000000', '360500000000', '0,360000000000,360500000000', '渝水区', 3, 0);
INSERT INTO `sys_area` VALUES ('360521000000', '360500000000', '0,360000000000,360500000000', '分宜县', 3, 0);
INSERT INTO `sys_area` VALUES ('360600000000', '360000000000', '0,360000000000', '鹰潭市', 2, 0);
INSERT INTO `sys_area` VALUES ('360602000000', '360600000000', '0,360000000000,360600000000', '月湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('360622000000', '360600000000', '0,360000000000,360600000000', '余江县', 3, 0);
INSERT INTO `sys_area` VALUES ('360681000000', '360600000000', '0,360000000000,360600000000', '贵溪市', 3, 0);
INSERT INTO `sys_area` VALUES ('360700000000', '360000000000', '0,360000000000', '赣州市', 2, 0);
INSERT INTO `sys_area` VALUES ('360702000000', '360700000000', '0,360000000000,360700000000', '章贡区', 3, 0);
INSERT INTO `sys_area` VALUES ('360703000000', '360700000000', '0,360000000000,360700000000', '南康区', 3, 0);
INSERT INTO `sys_area` VALUES ('360721000000', '360700000000', '0,360000000000,360700000000', '赣县', 3, 0);
INSERT INTO `sys_area` VALUES ('360722000000', '360700000000', '0,360000000000,360700000000', '信丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('360723000000', '360700000000', '0,360000000000,360700000000', '大余县', 3, 0);
INSERT INTO `sys_area` VALUES ('360724000000', '360700000000', '0,360000000000,360700000000', '上犹县', 3, 0);
INSERT INTO `sys_area` VALUES ('360725000000', '360700000000', '0,360000000000,360700000000', '崇义县', 3, 0);
INSERT INTO `sys_area` VALUES ('360726000000', '360700000000', '0,360000000000,360700000000', '安远县', 3, 0);
INSERT INTO `sys_area` VALUES ('360727000000', '360700000000', '0,360000000000,360700000000', '龙南县', 3, 0);
INSERT INTO `sys_area` VALUES ('360728000000', '360700000000', '0,360000000000,360700000000', '定南县', 3, 0);
INSERT INTO `sys_area` VALUES ('360729000000', '360700000000', '0,360000000000,360700000000', '全南县', 3, 0);
INSERT INTO `sys_area` VALUES ('360730000000', '360700000000', '0,360000000000,360700000000', '宁都县', 3, 0);
INSERT INTO `sys_area` VALUES ('360731000000', '360700000000', '0,360000000000,360700000000', '于都县', 3, 0);
INSERT INTO `sys_area` VALUES ('360732000000', '360700000000', '0,360000000000,360700000000', '兴国县', 3, 0);
INSERT INTO `sys_area` VALUES ('360733000000', '360700000000', '0,360000000000,360700000000', '会昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('360734000000', '360700000000', '0,360000000000,360700000000', '寻乌县', 3, 0);
INSERT INTO `sys_area` VALUES ('360735000000', '360700000000', '0,360000000000,360700000000', '石城县', 3, 0);
INSERT INTO `sys_area` VALUES ('360781000000', '360700000000', '0,360000000000,360700000000', '瑞金市', 3, 0);
INSERT INTO `sys_area` VALUES ('360800000000', '360000000000', '0,360000000000', '吉安市', 2, 0);
INSERT INTO `sys_area` VALUES ('360802000000', '360800000000', '0,360000000000,360800000000', '吉州区', 3, 0);
INSERT INTO `sys_area` VALUES ('360803000000', '360800000000', '0,360000000000,360800000000', '青原区', 3, 0);
INSERT INTO `sys_area` VALUES ('360821000000', '360800000000', '0,360000000000,360800000000', '吉安县', 3, 0);
INSERT INTO `sys_area` VALUES ('360822000000', '360800000000', '0,360000000000,360800000000', '吉水县', 3, 0);
INSERT INTO `sys_area` VALUES ('360823000000', '360800000000', '0,360000000000,360800000000', '峡江县', 3, 0);
INSERT INTO `sys_area` VALUES ('360824000000', '360800000000', '0,360000000000,360800000000', '新干县', 3, 0);
INSERT INTO `sys_area` VALUES ('360825000000', '360800000000', '0,360000000000,360800000000', '永丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('360826000000', '360800000000', '0,360000000000,360800000000', '泰和县', 3, 0);
INSERT INTO `sys_area` VALUES ('360827000000', '360800000000', '0,360000000000,360800000000', '遂川县', 3, 0);
INSERT INTO `sys_area` VALUES ('360828000000', '360800000000', '0,360000000000,360800000000', '万安县', 3, 0);
INSERT INTO `sys_area` VALUES ('360829000000', '360800000000', '0,360000000000,360800000000', '安福县', 3, 0);
INSERT INTO `sys_area` VALUES ('360830000000', '360800000000', '0,360000000000,360800000000', '永新县', 3, 0);
INSERT INTO `sys_area` VALUES ('360881000000', '360800000000', '0,360000000000,360800000000', '井冈山市', 3, 0);
INSERT INTO `sys_area` VALUES ('360900000000', '360000000000', '0,360000000000', '宜春市', 2, 0);
INSERT INTO `sys_area` VALUES ('360902000000', '360900000000', '0,360000000000,360900000000', '袁州区', 3, 0);
INSERT INTO `sys_area` VALUES ('360921000000', '360900000000', '0,360000000000,360900000000', '奉新县', 3, 0);
INSERT INTO `sys_area` VALUES ('360922000000', '360900000000', '0,360000000000,360900000000', '万载县', 3, 0);
INSERT INTO `sys_area` VALUES ('360923000000', '360900000000', '0,360000000000,360900000000', '上高县', 3, 0);
INSERT INTO `sys_area` VALUES ('360924000000', '360900000000', '0,360000000000,360900000000', '宜丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('360925000000', '360900000000', '0,360000000000,360900000000', '靖安县', 3, 0);
INSERT INTO `sys_area` VALUES ('360926000000', '360900000000', '0,360000000000,360900000000', '铜鼓县', 3, 0);
INSERT INTO `sys_area` VALUES ('360981000000', '360900000000', '0,360000000000,360900000000', '丰城市', 3, 0);
INSERT INTO `sys_area` VALUES ('360982000000', '360900000000', '0,360000000000,360900000000', '樟树市', 3, 0);
INSERT INTO `sys_area` VALUES ('360983000000', '360900000000', '0,360000000000,360900000000', '高安市', 3, 0);
INSERT INTO `sys_area` VALUES ('361000000000', '360000000000', '0,360000000000', '抚州市', 2, 0);
INSERT INTO `sys_area` VALUES ('361002000000', '361000000000', '0,360000000000,361000000000', '临川区', 3, 0);
INSERT INTO `sys_area` VALUES ('361021000000', '361000000000', '0,360000000000,361000000000', '南城县', 3, 0);
INSERT INTO `sys_area` VALUES ('361022000000', '361000000000', '0,360000000000,361000000000', '黎川县', 3, 0);
INSERT INTO `sys_area` VALUES ('361023000000', '361000000000', '0,360000000000,361000000000', '南丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('361024000000', '361000000000', '0,360000000000,361000000000', '崇仁县', 3, 0);
INSERT INTO `sys_area` VALUES ('361025000000', '361000000000', '0,360000000000,361000000000', '乐安县', 3, 0);
INSERT INTO `sys_area` VALUES ('361026000000', '361000000000', '0,360000000000,361000000000', '宜黄县', 3, 0);
INSERT INTO `sys_area` VALUES ('361027000000', '361000000000', '0,360000000000,361000000000', '金溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('361028000000', '361000000000', '0,360000000000,361000000000', '资溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('361029000000', '361000000000', '0,360000000000,361000000000', '东乡县', 3, 0);
INSERT INTO `sys_area` VALUES ('361030000000', '361000000000', '0,360000000000,361000000000', '广昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('361100000000', '360000000000', '0,360000000000', '上饶市', 2, 0);
INSERT INTO `sys_area` VALUES ('361102000000', '361100000000', '0,360000000000,361100000000', '信州区', 3, 0);
INSERT INTO `sys_area` VALUES ('361103000000', '361100000000', '0,360000000000,361100000000', '广丰区', 3, 0);
INSERT INTO `sys_area` VALUES ('361121000000', '361100000000', '0,360000000000,361100000000', '上饶县', 3, 0);
INSERT INTO `sys_area` VALUES ('361123000000', '361100000000', '0,360000000000,361100000000', '玉山县', 3, 0);
INSERT INTO `sys_area` VALUES ('361124000000', '361100000000', '0,360000000000,361100000000', '铅山县', 3, 0);
INSERT INTO `sys_area` VALUES ('361125000000', '361100000000', '0,360000000000,361100000000', '横峰县', 3, 0);
INSERT INTO `sys_area` VALUES ('361126000000', '361100000000', '0,360000000000,361100000000', '弋阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('361127000000', '361100000000', '0,360000000000,361100000000', '余干县', 3, 0);
INSERT INTO `sys_area` VALUES ('361128000000', '361100000000', '0,360000000000,361100000000', '鄱阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('361129000000', '361100000000', '0,360000000000,361100000000', '万年县', 3, 0);
INSERT INTO `sys_area` VALUES ('361130000000', '361100000000', '0,360000000000,361100000000', '婺源县', 3, 0);
INSERT INTO `sys_area` VALUES ('361181000000', '361100000000', '0,360000000000,361100000000', '德兴市', 3, 0);
INSERT INTO `sys_area` VALUES ('370000000000', '100000000000', '0,', '山东省', 1, 0);
INSERT INTO `sys_area` VALUES ('370100000000', '370000000000', '0,370000000000', '济南市', 2, 0);
INSERT INTO `sys_area` VALUES ('370102000000', '370100000000', '0,370000000000,370100000000', '历下区', 3, 0);
INSERT INTO `sys_area` VALUES ('370103000000', '370100000000', '0,370000000000,370100000000', '市中区', 3, 0);
INSERT INTO `sys_area` VALUES ('370104000000', '370100000000', '0,370000000000,370100000000', '槐荫区', 3, 0);
INSERT INTO `sys_area` VALUES ('370105000000', '370100000000', '0,370000000000,370100000000', '天桥区', 3, 0);
INSERT INTO `sys_area` VALUES ('370112000000', '370100000000', '0,370000000000,370100000000', '历城区', 3, 0);
INSERT INTO `sys_area` VALUES ('370113000000', '370100000000', '0,370000000000,370100000000', '长清区', 3, 0);
INSERT INTO `sys_area` VALUES ('370124000000', '370100000000', '0,370000000000,370100000000', '平阴县', 3, 0);
INSERT INTO `sys_area` VALUES ('370125000000', '370100000000', '0,370000000000,370100000000', '济阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('370126000000', '370100000000', '0,370000000000,370100000000', '商河县', 3, 0);
INSERT INTO `sys_area` VALUES ('370181000000', '370100000000', '0,370000000000,370100000000', '章丘市', 3, 0);
INSERT INTO `sys_area` VALUES ('370200000000', '370000000000', '0,370000000000', '青岛市', 2, 0);
INSERT INTO `sys_area` VALUES ('370202000000', '370200000000', '0,370000000000,370200000000', '市南区', 3, 0);
INSERT INTO `sys_area` VALUES ('370203000000', '370200000000', '0,370000000000,370200000000', '市北区', 3, 0);
INSERT INTO `sys_area` VALUES ('370211000000', '370200000000', '0,370000000000,370200000000', '黄岛区', 3, 0);
INSERT INTO `sys_area` VALUES ('370212000000', '370200000000', '0,370000000000,370200000000', '崂山区', 3, 0);
INSERT INTO `sys_area` VALUES ('370213000000', '370200000000', '0,370000000000,370200000000', '李沧区', 3, 0);
INSERT INTO `sys_area` VALUES ('370214000000', '370200000000', '0,370000000000,370200000000', '城阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('370281000000', '370200000000', '0,370000000000,370200000000', '胶州市', 3, 0);
INSERT INTO `sys_area` VALUES ('370282000000', '370200000000', '0,370000000000,370200000000', '即墨市', 3, 0);
INSERT INTO `sys_area` VALUES ('370283000000', '370200000000', '0,370000000000,370200000000', '平度市', 3, 0);
INSERT INTO `sys_area` VALUES ('370285000000', '370200000000', '0,370000000000,370200000000', '莱西市', 3, 0);
INSERT INTO `sys_area` VALUES ('370300000000', '370000000000', '0,370000000000', '淄博市', 2, 0);
INSERT INTO `sys_area` VALUES ('370302000000', '370300000000', '0,370000000000,370300000000', '淄川区', 3, 0);
INSERT INTO `sys_area` VALUES ('370303000000', '370300000000', '0,370000000000,370300000000', '张店区', 3, 0);
INSERT INTO `sys_area` VALUES ('370304000000', '370300000000', '0,370000000000,370300000000', '博山区', 3, 0);
INSERT INTO `sys_area` VALUES ('370305000000', '370300000000', '0,370000000000,370300000000', '临淄区', 3, 0);
INSERT INTO `sys_area` VALUES ('370306000000', '370300000000', '0,370000000000,370300000000', '周村区', 3, 0);
INSERT INTO `sys_area` VALUES ('370321000000', '370300000000', '0,370000000000,370300000000', '桓台县', 3, 0);
INSERT INTO `sys_area` VALUES ('370322000000', '370300000000', '0,370000000000,370300000000', '高青县', 3, 0);
INSERT INTO `sys_area` VALUES ('370323000000', '370300000000', '0,370000000000,370300000000', '沂源县', 3, 0);
INSERT INTO `sys_area` VALUES ('370400000000', '370000000000', '0,370000000000', '枣庄市', 2, 0);
INSERT INTO `sys_area` VALUES ('370402000000', '370400000000', '0,370000000000,370400000000', '市中区', 3, 0);
INSERT INTO `sys_area` VALUES ('370403000000', '370400000000', '0,370000000000,370400000000', '薛城区', 3, 0);
INSERT INTO `sys_area` VALUES ('370404000000', '370400000000', '0,370000000000,370400000000', '峄城区', 3, 0);
INSERT INTO `sys_area` VALUES ('370405000000', '370400000000', '0,370000000000,370400000000', '台儿庄区', 3, 0);
INSERT INTO `sys_area` VALUES ('370406000000', '370400000000', '0,370000000000,370400000000', '山亭区', 3, 0);
INSERT INTO `sys_area` VALUES ('370481000000', '370400000000', '0,370000000000,370400000000', '滕州市', 3, 0);
INSERT INTO `sys_area` VALUES ('370500000000', '370000000000', '0,370000000000', '东营市', 2, 0);
INSERT INTO `sys_area` VALUES ('370502000000', '370500000000', '0,370000000000,370500000000', '东营区', 3, 0);
INSERT INTO `sys_area` VALUES ('370503000000', '370500000000', '0,370000000000,370500000000', '河口区', 3, 0);
INSERT INTO `sys_area` VALUES ('370521000000', '370500000000', '0,370000000000,370500000000', '垦利县', 3, 0);
INSERT INTO `sys_area` VALUES ('370522000000', '370500000000', '0,370000000000,370500000000', '利津县', 3, 0);
INSERT INTO `sys_area` VALUES ('370523000000', '370500000000', '0,370000000000,370500000000', '广饶县', 3, 0);
INSERT INTO `sys_area` VALUES ('370600000000', '370000000000', '0,370000000000', '烟台市', 2, 0);
INSERT INTO `sys_area` VALUES ('370602000000', '370600000000', '0,370000000000,370600000000', '芝罘区', 3, 0);
INSERT INTO `sys_area` VALUES ('370611000000', '370600000000', '0,370000000000,370600000000', '福山区', 3, 0);
INSERT INTO `sys_area` VALUES ('370612000000', '370600000000', '0,370000000000,370600000000', '牟平区', 3, 0);
INSERT INTO `sys_area` VALUES ('370613000000', '370600000000', '0,370000000000,370600000000', '莱山区', 3, 0);
INSERT INTO `sys_area` VALUES ('370634000000', '370600000000', '0,370000000000,370600000000', '长岛县', 3, 0);
INSERT INTO `sys_area` VALUES ('370681000000', '370600000000', '0,370000000000,370600000000', '龙口市', 3, 0);
INSERT INTO `sys_area` VALUES ('370682000000', '370600000000', '0,370000000000,370600000000', '莱阳市', 3, 0);
INSERT INTO `sys_area` VALUES ('370683000000', '370600000000', '0,370000000000,370600000000', '莱州市', 3, 0);
INSERT INTO `sys_area` VALUES ('370684000000', '370600000000', '0,370000000000,370600000000', '蓬莱市', 3, 0);
INSERT INTO `sys_area` VALUES ('370685000000', '370600000000', '0,370000000000,370600000000', '招远市', 3, 0);
INSERT INTO `sys_area` VALUES ('370686000000', '370600000000', '0,370000000000,370600000000', '栖霞市', 3, 0);
INSERT INTO `sys_area` VALUES ('370687000000', '370600000000', '0,370000000000,370600000000', '海阳市', 3, 0);
INSERT INTO `sys_area` VALUES ('370700000000', '370000000000', '0,370000000000', '潍坊市', 2, 0);
INSERT INTO `sys_area` VALUES ('370702000000', '370700000000', '0,370000000000,370700000000', '潍城区', 3, 0);
INSERT INTO `sys_area` VALUES ('370703000000', '370700000000', '0,370000000000,370700000000', '寒亭区', 3, 0);
INSERT INTO `sys_area` VALUES ('370704000000', '370700000000', '0,370000000000,370700000000', '坊子区', 3, 0);
INSERT INTO `sys_area` VALUES ('370705000000', '370700000000', '0,370000000000,370700000000', '奎文区', 3, 0);
INSERT INTO `sys_area` VALUES ('370724000000', '370700000000', '0,370000000000,370700000000', '临朐县', 3, 0);
INSERT INTO `sys_area` VALUES ('370725000000', '370700000000', '0,370000000000,370700000000', '昌乐县', 3, 0);
INSERT INTO `sys_area` VALUES ('370781000000', '370700000000', '0,370000000000,370700000000', '青州市', 3, 0);
INSERT INTO `sys_area` VALUES ('370782000000', '370700000000', '0,370000000000,370700000000', '诸城市', 3, 0);
INSERT INTO `sys_area` VALUES ('370783000000', '370700000000', '0,370000000000,370700000000', '寿光市', 3, 0);
INSERT INTO `sys_area` VALUES ('370784000000', '370700000000', '0,370000000000,370700000000', '安丘市', 3, 0);
INSERT INTO `sys_area` VALUES ('370785000000', '370700000000', '0,370000000000,370700000000', '高密市', 3, 0);
INSERT INTO `sys_area` VALUES ('370786000000', '370700000000', '0,370000000000,370700000000', '昌邑市', 3, 0);
INSERT INTO `sys_area` VALUES ('370800000000', '370000000000', '0,370000000000', '济宁市', 2, 0);
INSERT INTO `sys_area` VALUES ('370811000000', '370800000000', '0,370000000000,370800000000', '任城区', 3, 0);
INSERT INTO `sys_area` VALUES ('370812000000', '370800000000', '0,370000000000,370800000000', '兖州区', 3, 0);
INSERT INTO `sys_area` VALUES ('370826000000', '370800000000', '0,370000000000,370800000000', '微山县', 3, 0);
INSERT INTO `sys_area` VALUES ('370827000000', '370800000000', '0,370000000000,370800000000', '鱼台县', 3, 0);
INSERT INTO `sys_area` VALUES ('370828000000', '370800000000', '0,370000000000,370800000000', '金乡县', 3, 0);
INSERT INTO `sys_area` VALUES ('370829000000', '370800000000', '0,370000000000,370800000000', '嘉祥县', 3, 0);
INSERT INTO `sys_area` VALUES ('370830000000', '370800000000', '0,370000000000,370800000000', '汶上县', 3, 0);
INSERT INTO `sys_area` VALUES ('370831000000', '370800000000', '0,370000000000,370800000000', '泗水县', 3, 0);
INSERT INTO `sys_area` VALUES ('370832000000', '370800000000', '0,370000000000,370800000000', '梁山县', 3, 0);
INSERT INTO `sys_area` VALUES ('370881000000', '370800000000', '0,370000000000,370800000000', '曲阜市', 3, 0);
INSERT INTO `sys_area` VALUES ('370883000000', '370800000000', '0,370000000000,370800000000', '邹城市', 3, 0);
INSERT INTO `sys_area` VALUES ('370900000000', '370000000000', '0,370000000000', '泰安市', 2, 0);
INSERT INTO `sys_area` VALUES ('370902000000', '370900000000', '0,370000000000,370900000000', '泰山区', 3, 0);
INSERT INTO `sys_area` VALUES ('370911000000', '370900000000', '0,370000000000,370900000000', '岱岳区', 3, 0);
INSERT INTO `sys_area` VALUES ('370921000000', '370900000000', '0,370000000000,370900000000', '宁阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('370923000000', '370900000000', '0,370000000000,370900000000', '东平县', 3, 0);
INSERT INTO `sys_area` VALUES ('370982000000', '370900000000', '0,370000000000,370900000000', '新泰市', 3, 0);
INSERT INTO `sys_area` VALUES ('370983000000', '370900000000', '0,370000000000,370900000000', '肥城市', 3, 0);
INSERT INTO `sys_area` VALUES ('371000000000', '370000000000', '0,370000000000', '威海市', 2, 0);
INSERT INTO `sys_area` VALUES ('371002000000', '371000000000', '0,370000000000,371000000000', '环翠区', 3, 0);
INSERT INTO `sys_area` VALUES ('371003000000', '371000000000', '0,370000000000,371000000000', '文登区', 3, 0);
INSERT INTO `sys_area` VALUES ('371082000000', '371000000000', '0,370000000000,371000000000', '荣成市', 3, 0);
INSERT INTO `sys_area` VALUES ('371083000000', '371000000000', '0,370000000000,371000000000', '乳山市', 3, 0);
INSERT INTO `sys_area` VALUES ('371100000000', '370000000000', '0,370000000000', '日照市', 2, 0);
INSERT INTO `sys_area` VALUES ('371102000000', '371100000000', '0,370000000000,371100000000', '东港区', 3, 0);
INSERT INTO `sys_area` VALUES ('371103000000', '371100000000', '0,370000000000,371100000000', '岚山区', 3, 0);
INSERT INTO `sys_area` VALUES ('371121000000', '371100000000', '0,370000000000,371100000000', '五莲县', 3, 0);
INSERT INTO `sys_area` VALUES ('371122000000', '371100000000', '0,370000000000,371100000000', '莒县', 3, 0);
INSERT INTO `sys_area` VALUES ('371200000000', '370000000000', '0,370000000000', '莱芜市', 2, 0);
INSERT INTO `sys_area` VALUES ('371202000000', '371200000000', '0,370000000000,371200000000', '莱城区', 3, 0);
INSERT INTO `sys_area` VALUES ('371203000000', '371200000000', '0,370000000000,371200000000', '钢城区', 3, 0);
INSERT INTO `sys_area` VALUES ('371300000000', '370000000000', '0,370000000000', '临沂市', 2, 0);
INSERT INTO `sys_area` VALUES ('371302000000', '371300000000', '0,370000000000,371300000000', '兰山区', 3, 0);
INSERT INTO `sys_area` VALUES ('371311000000', '371300000000', '0,370000000000,371300000000', '罗庄区', 3, 0);
INSERT INTO `sys_area` VALUES ('371312000000', '371300000000', '0,370000000000,371300000000', '河东区', 3, 0);
INSERT INTO `sys_area` VALUES ('371321000000', '371300000000', '0,370000000000,371300000000', '沂南县', 3, 0);
INSERT INTO `sys_area` VALUES ('371322000000', '371300000000', '0,370000000000,371300000000', '郯城县', 3, 0);
INSERT INTO `sys_area` VALUES ('371323000000', '371300000000', '0,370000000000,371300000000', '沂水县', 3, 0);
INSERT INTO `sys_area` VALUES ('371324000000', '371300000000', '0,370000000000,371300000000', '兰陵县', 3, 0);
INSERT INTO `sys_area` VALUES ('371325000000', '371300000000', '0,370000000000,371300000000', '费县', 3, 0);
INSERT INTO `sys_area` VALUES ('371326000000', '371300000000', '0,370000000000,371300000000', '平邑县', 3, 0);
INSERT INTO `sys_area` VALUES ('371327000000', '371300000000', '0,370000000000,371300000000', '莒南县', 3, 0);
INSERT INTO `sys_area` VALUES ('371328000000', '371300000000', '0,370000000000,371300000000', '蒙阴县', 3, 0);
INSERT INTO `sys_area` VALUES ('371329000000', '371300000000', '0,370000000000,371300000000', '临沭县', 3, 0);
INSERT INTO `sys_area` VALUES ('371400000000', '370000000000', '0,370000000000', '德州市', 2, 0);
INSERT INTO `sys_area` VALUES ('371402000000', '371400000000', '0,370000000000,371400000000', '德城区', 3, 0);
INSERT INTO `sys_area` VALUES ('371403000000', '371400000000', '0,370000000000,371400000000', '陵城区', 3, 0);
INSERT INTO `sys_area` VALUES ('371422000000', '371400000000', '0,370000000000,371400000000', '宁津县', 3, 0);
INSERT INTO `sys_area` VALUES ('371423000000', '371400000000', '0,370000000000,371400000000', '庆云县', 3, 0);
INSERT INTO `sys_area` VALUES ('371424000000', '371400000000', '0,370000000000,371400000000', '临邑县', 3, 0);
INSERT INTO `sys_area` VALUES ('371425000000', '371400000000', '0,370000000000,371400000000', '齐河县', 3, 0);
INSERT INTO `sys_area` VALUES ('371426000000', '371400000000', '0,370000000000,371400000000', '平原县', 3, 0);
INSERT INTO `sys_area` VALUES ('371427000000', '371400000000', '0,370000000000,371400000000', '夏津县', 3, 0);
INSERT INTO `sys_area` VALUES ('371428000000', '371400000000', '0,370000000000,371400000000', '武城县', 3, 0);
INSERT INTO `sys_area` VALUES ('371481000000', '371400000000', '0,370000000000,371400000000', '乐陵市', 3, 0);
INSERT INTO `sys_area` VALUES ('371482000000', '371400000000', '0,370000000000,371400000000', '禹城市', 3, 0);
INSERT INTO `sys_area` VALUES ('371500000000', '370000000000', '0,370000000000', '聊城市', 2, 0);
INSERT INTO `sys_area` VALUES ('371502000000', '371500000000', '0,370000000000,371500000000', '东昌府区', 3, 0);
INSERT INTO `sys_area` VALUES ('371521000000', '371500000000', '0,370000000000,371500000000', '阳谷县', 3, 0);
INSERT INTO `sys_area` VALUES ('371522000000', '371500000000', '0,370000000000,371500000000', '莘县', 3, 0);
INSERT INTO `sys_area` VALUES ('371523000000', '371500000000', '0,370000000000,371500000000', '茌平县', 3, 0);
INSERT INTO `sys_area` VALUES ('371524000000', '371500000000', '0,370000000000,371500000000', '东阿县', 3, 0);
INSERT INTO `sys_area` VALUES ('371525000000', '371500000000', '0,370000000000,371500000000', '冠县', 3, 0);
INSERT INTO `sys_area` VALUES ('371526000000', '371500000000', '0,370000000000,371500000000', '高唐县', 3, 0);
INSERT INTO `sys_area` VALUES ('371581000000', '371500000000', '0,370000000000,371500000000', '临清市', 3, 0);
INSERT INTO `sys_area` VALUES ('371600000000', '370000000000', '0,370000000000', '滨州市', 2, 0);
INSERT INTO `sys_area` VALUES ('371602000000', '371600000000', '0,370000000000,371600000000', '滨城区', 3, 0);
INSERT INTO `sys_area` VALUES ('371603000000', '371600000000', '0,370000000000,371600000000', '沾化区', 3, 0);
INSERT INTO `sys_area` VALUES ('371621000000', '371600000000', '0,370000000000,371600000000', '惠民县', 3, 0);
INSERT INTO `sys_area` VALUES ('371622000000', '371600000000', '0,370000000000,371600000000', '阳信县', 3, 0);
INSERT INTO `sys_area` VALUES ('371623000000', '371600000000', '0,370000000000,371600000000', '无棣县', 3, 0);
INSERT INTO `sys_area` VALUES ('371625000000', '371600000000', '0,370000000000,371600000000', '博兴县', 3, 0);
INSERT INTO `sys_area` VALUES ('371626000000', '371600000000', '0,370000000000,371600000000', '邹平县', 3, 0);
INSERT INTO `sys_area` VALUES ('371700000000', '370000000000', '0,370000000000', '菏泽市', 2, 0);
INSERT INTO `sys_area` VALUES ('371702000000', '371700000000', '0,370000000000,371700000000', '牡丹区', 3, 0);
INSERT INTO `sys_area` VALUES ('371721000000', '371700000000', '0,370000000000,371700000000', '曹县', 3, 0);
INSERT INTO `sys_area` VALUES ('371722000000', '371700000000', '0,370000000000,371700000000', '单县', 3, 0);
INSERT INTO `sys_area` VALUES ('371723000000', '371700000000', '0,370000000000,371700000000', '成武县', 3, 0);
INSERT INTO `sys_area` VALUES ('371724000000', '371700000000', '0,370000000000,371700000000', '巨野县', 3, 0);
INSERT INTO `sys_area` VALUES ('371725000000', '371700000000', '0,370000000000,371700000000', '郓城县', 3, 0);
INSERT INTO `sys_area` VALUES ('371726000000', '371700000000', '0,370000000000,371700000000', '鄄城县', 3, 0);
INSERT INTO `sys_area` VALUES ('371727000000', '371700000000', '0,370000000000,371700000000', '定陶县', 3, 0);
INSERT INTO `sys_area` VALUES ('371728000000', '371700000000', '0,370000000000,371700000000', '东明县', 3, 0);
INSERT INTO `sys_area` VALUES ('410000000000', '100000000000', '0,', '河南省', 1, 0);
INSERT INTO `sys_area` VALUES ('410100000000', '410000000000', '0,410000000000', '郑州市', 2, 0);
INSERT INTO `sys_area` VALUES ('410102000000', '410100000000', '0,410000000000,410100000000', '中原区', 3, 0);
INSERT INTO `sys_area` VALUES ('410103000000', '410100000000', '0,410000000000,410100000000', '二七区', 3, 0);
INSERT INTO `sys_area` VALUES ('410104000000', '410100000000', '0,410000000000,410100000000', '管城回族区', 3, 0);
INSERT INTO `sys_area` VALUES ('410105000000', '410100000000', '0,410000000000,410100000000', '金水区', 3, 0);
INSERT INTO `sys_area` VALUES ('410106000000', '410100000000', '0,410000000000,410100000000', '上街区', 3, 0);
INSERT INTO `sys_area` VALUES ('410108000000', '410100000000', '0,410000000000,410100000000', '惠济区', 3, 0);
INSERT INTO `sys_area` VALUES ('410122000000', '410100000000', '0,410000000000,410100000000', '中牟县', 3, 0);
INSERT INTO `sys_area` VALUES ('410181000000', '410100000000', '0,410000000000,410100000000', '巩义市', 3, 0);
INSERT INTO `sys_area` VALUES ('410182000000', '410100000000', '0,410000000000,410100000000', '荥阳市', 3, 0);
INSERT INTO `sys_area` VALUES ('410183000000', '410100000000', '0,410000000000,410100000000', '新密市', 3, 0);
INSERT INTO `sys_area` VALUES ('410184000000', '410100000000', '0,410000000000,410100000000', '新郑市', 3, 0);
INSERT INTO `sys_area` VALUES ('410185000000', '410100000000', '0,410000000000,410100000000', '登封市', 3, 0);
INSERT INTO `sys_area` VALUES ('410200000000', '410000000000', '0,410000000000', '开封市', 2, 0);
INSERT INTO `sys_area` VALUES ('410202000000', '410200000000', '0,410000000000,410200000000', '龙亭区', 3, 0);
INSERT INTO `sys_area` VALUES ('410203000000', '410200000000', '0,410000000000,410200000000', '顺河回族区', 3, 0);
INSERT INTO `sys_area` VALUES ('410204000000', '410200000000', '0,410000000000,410200000000', '鼓楼区', 3, 0);
INSERT INTO `sys_area` VALUES ('410205000000', '410200000000', '0,410000000000,410200000000', '禹王台区', 3, 0);
INSERT INTO `sys_area` VALUES ('410211000000', '410200000000', '0,410000000000,410200000000', '金明区', 3, 0);
INSERT INTO `sys_area` VALUES ('410212000000', '410200000000', '0,410000000000,410200000000', '祥符区', 3, 0);
INSERT INTO `sys_area` VALUES ('410221000000', '410200000000', '0,410000000000,410200000000', '杞县', 3, 0);
INSERT INTO `sys_area` VALUES ('410222000000', '410200000000', '0,410000000000,410200000000', '通许县', 3, 0);
INSERT INTO `sys_area` VALUES ('410223000000', '410200000000', '0,410000000000,410200000000', '尉氏县', 3, 0);
INSERT INTO `sys_area` VALUES ('410225000000', '410200000000', '0,410000000000,410200000000', '兰考县', 3, 0);
INSERT INTO `sys_area` VALUES ('410300000000', '410000000000', '0,410000000000', '洛阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('410302000000', '410300000000', '0,410000000000,410300000000', '老城区', 3, 0);
INSERT INTO `sys_area` VALUES ('410303000000', '410300000000', '0,410000000000,410300000000', '西工区', 3, 0);
INSERT INTO `sys_area` VALUES ('410304000000', '410300000000', '0,410000000000,410300000000', '瀍河回族区', 3, 0);
INSERT INTO `sys_area` VALUES ('410305000000', '410300000000', '0,410000000000,410300000000', '涧西区', 3, 0);
INSERT INTO `sys_area` VALUES ('410306000000', '410300000000', '0,410000000000,410300000000', '吉利区', 3, 0);
INSERT INTO `sys_area` VALUES ('410311000000', '410300000000', '0,410000000000,410300000000', '洛龙区', 3, 0);
INSERT INTO `sys_area` VALUES ('410322000000', '410300000000', '0,410000000000,410300000000', '孟津县', 3, 0);
INSERT INTO `sys_area` VALUES ('410323000000', '410300000000', '0,410000000000,410300000000', '新安县', 3, 0);
INSERT INTO `sys_area` VALUES ('410324000000', '410300000000', '0,410000000000,410300000000', '栾川县', 3, 0);
INSERT INTO `sys_area` VALUES ('410325000000', '410300000000', '0,410000000000,410300000000', '嵩县', 3, 0);
INSERT INTO `sys_area` VALUES ('410326000000', '410300000000', '0,410000000000,410300000000', '汝阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('410327000000', '410300000000', '0,410000000000,410300000000', '宜阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('410328000000', '410300000000', '0,410000000000,410300000000', '洛宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('410329000000', '410300000000', '0,410000000000,410300000000', '伊川县', 3, 0);
INSERT INTO `sys_area` VALUES ('410381000000', '410300000000', '0,410000000000,410300000000', '偃师市', 3, 0);
INSERT INTO `sys_area` VALUES ('410400000000', '410000000000', '0,410000000000', '平顶山市', 2, 0);
INSERT INTO `sys_area` VALUES ('410402000000', '410400000000', '0,410000000000,410400000000', '新华区', 3, 0);
INSERT INTO `sys_area` VALUES ('410403000000', '410400000000', '0,410000000000,410400000000', '卫东区', 3, 0);
INSERT INTO `sys_area` VALUES ('410404000000', '410400000000', '0,410000000000,410400000000', '石龙区', 3, 0);
INSERT INTO `sys_area` VALUES ('410411000000', '410400000000', '0,410000000000,410400000000', '湛河区', 3, 0);
INSERT INTO `sys_area` VALUES ('410421000000', '410400000000', '0,410000000000,410400000000', '宝丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('410422000000', '410400000000', '0,410000000000,410400000000', '叶县', 3, 0);
INSERT INTO `sys_area` VALUES ('410423000000', '410400000000', '0,410000000000,410400000000', '鲁山县', 3, 0);
INSERT INTO `sys_area` VALUES ('410425000000', '410400000000', '0,410000000000,410400000000', '郏县', 3, 0);
INSERT INTO `sys_area` VALUES ('410481000000', '410400000000', '0,410000000000,410400000000', '舞钢市', 3, 0);
INSERT INTO `sys_area` VALUES ('410482000000', '410400000000', '0,410000000000,410400000000', '汝州市', 3, 0);
INSERT INTO `sys_area` VALUES ('410500000000', '410000000000', '0,410000000000', '安阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('410502000000', '410500000000', '0,410000000000,410500000000', '文峰区', 3, 0);
INSERT INTO `sys_area` VALUES ('410503000000', '410500000000', '0,410000000000,410500000000', '北关区', 3, 0);
INSERT INTO `sys_area` VALUES ('410505000000', '410500000000', '0,410000000000,410500000000', '殷都区', 3, 0);
INSERT INTO `sys_area` VALUES ('410506000000', '410500000000', '0,410000000000,410500000000', '龙安区', 3, 0);
INSERT INTO `sys_area` VALUES ('410522000000', '410500000000', '0,410000000000,410500000000', '安阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('410523000000', '410500000000', '0,410000000000,410500000000', '汤阴县', 3, 0);
INSERT INTO `sys_area` VALUES ('410526000000', '410500000000', '0,410000000000,410500000000', '滑县', 3, 0);
INSERT INTO `sys_area` VALUES ('410527000000', '410500000000', '0,410000000000,410500000000', '内黄县', 3, 0);
INSERT INTO `sys_area` VALUES ('410581000000', '410500000000', '0,410000000000,410500000000', '林州市', 3, 0);
INSERT INTO `sys_area` VALUES ('410600000000', '410000000000', '0,410000000000', '鹤壁市', 2, 0);
INSERT INTO `sys_area` VALUES ('410602000000', '410600000000', '0,410000000000,410600000000', '鹤山区', 3, 0);
INSERT INTO `sys_area` VALUES ('410603000000', '410600000000', '0,410000000000,410600000000', '山城区', 3, 0);
INSERT INTO `sys_area` VALUES ('410611000000', '410600000000', '0,410000000000,410600000000', '淇滨区', 3, 0);
INSERT INTO `sys_area` VALUES ('410621000000', '410600000000', '0,410000000000,410600000000', '浚县', 3, 0);
INSERT INTO `sys_area` VALUES ('410622000000', '410600000000', '0,410000000000,410600000000', '淇县', 3, 0);
INSERT INTO `sys_area` VALUES ('410700000000', '410000000000', '0,410000000000', '新乡市', 2, 0);
INSERT INTO `sys_area` VALUES ('410702000000', '410700000000', '0,410000000000,410700000000', '红旗区', 3, 0);
INSERT INTO `sys_area` VALUES ('410703000000', '410700000000', '0,410000000000,410700000000', '卫滨区', 3, 0);
INSERT INTO `sys_area` VALUES ('410704000000', '410700000000', '0,410000000000,410700000000', '凤泉区', 3, 0);
INSERT INTO `sys_area` VALUES ('410711000000', '410700000000', '0,410000000000,410700000000', '牧野区', 3, 0);
INSERT INTO `sys_area` VALUES ('410721000000', '410700000000', '0,410000000000,410700000000', '新乡县', 3, 0);
INSERT INTO `sys_area` VALUES ('410724000000', '410700000000', '0,410000000000,410700000000', '获嘉县', 3, 0);
INSERT INTO `sys_area` VALUES ('410725000000', '410700000000', '0,410000000000,410700000000', '原阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('410726000000', '410700000000', '0,410000000000,410700000000', '延津县', 3, 0);
INSERT INTO `sys_area` VALUES ('410727000000', '410700000000', '0,410000000000,410700000000', '封丘县', 3, 0);
INSERT INTO `sys_area` VALUES ('410728000000', '410700000000', '0,410000000000,410700000000', '长垣县', 3, 0);
INSERT INTO `sys_area` VALUES ('410781000000', '410700000000', '0,410000000000,410700000000', '卫辉市', 3, 0);
INSERT INTO `sys_area` VALUES ('410782000000', '410700000000', '0,410000000000,410700000000', '辉县市', 3, 0);
INSERT INTO `sys_area` VALUES ('410800000000', '410000000000', '0,410000000000', '焦作市', 2, 0);
INSERT INTO `sys_area` VALUES ('410802000000', '410800000000', '0,410000000000,410800000000', '解放区', 3, 0);
INSERT INTO `sys_area` VALUES ('410803000000', '410800000000', '0,410000000000,410800000000', '中站区', 3, 0);
INSERT INTO `sys_area` VALUES ('410804000000', '410800000000', '0,410000000000,410800000000', '马村区', 3, 0);
INSERT INTO `sys_area` VALUES ('410811000000', '410800000000', '0,410000000000,410800000000', '山阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('410821000000', '410800000000', '0,410000000000,410800000000', '修武县', 3, 0);
INSERT INTO `sys_area` VALUES ('410822000000', '410800000000', '0,410000000000,410800000000', '博爱县', 3, 0);
INSERT INTO `sys_area` VALUES ('410823000000', '410800000000', '0,410000000000,410800000000', '武陟县', 3, 0);
INSERT INTO `sys_area` VALUES ('410825000000', '410800000000', '0,410000000000,410800000000', '温县', 3, 0);
INSERT INTO `sys_area` VALUES ('410882000000', '410800000000', '0,410000000000,410800000000', '沁阳市', 3, 0);
INSERT INTO `sys_area` VALUES ('410883000000', '410800000000', '0,410000000000,410800000000', '孟州市', 3, 0);
INSERT INTO `sys_area` VALUES ('410900000000', '410000000000', '0,410000000000', '濮阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('410902000000', '410900000000', '0,410000000000,410900000000', '华龙区', 3, 0);
INSERT INTO `sys_area` VALUES ('410922000000', '410900000000', '0,410000000000,410900000000', '清丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('410923000000', '410900000000', '0,410000000000,410900000000', '南乐县', 3, 0);
INSERT INTO `sys_area` VALUES ('410926000000', '410900000000', '0,410000000000,410900000000', '范县', 3, 0);
INSERT INTO `sys_area` VALUES ('410927000000', '410900000000', '0,410000000000,410900000000', '台前县', 3, 0);
INSERT INTO `sys_area` VALUES ('410928000000', '410900000000', '0,410000000000,410900000000', '濮阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('411000000000', '410000000000', '0,410000000000', '许昌市', 2, 0);
INSERT INTO `sys_area` VALUES ('411002000000', '411000000000', '0,410000000000,411000000000', '魏都区', 3, 0);
INSERT INTO `sys_area` VALUES ('411023000000', '411000000000', '0,410000000000,411000000000', '许昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('411024000000', '411000000000', '0,410000000000,411000000000', '鄢陵县', 3, 0);
INSERT INTO `sys_area` VALUES ('411025000000', '411000000000', '0,410000000000,411000000000', '襄城县', 3, 0);
INSERT INTO `sys_area` VALUES ('411081000000', '411000000000', '0,410000000000,411000000000', '禹州市', 3, 0);
INSERT INTO `sys_area` VALUES ('411082000000', '411000000000', '0,410000000000,411000000000', '长葛市', 3, 0);
INSERT INTO `sys_area` VALUES ('411100000000', '410000000000', '0,410000000000', '漯河市', 2, 0);
INSERT INTO `sys_area` VALUES ('411102000000', '411100000000', '0,410000000000,411100000000', '源汇区', 3, 0);
INSERT INTO `sys_area` VALUES ('411103000000', '411100000000', '0,410000000000,411100000000', '郾城区', 3, 0);
INSERT INTO `sys_area` VALUES ('411104000000', '411100000000', '0,410000000000,411100000000', '召陵区', 3, 0);
INSERT INTO `sys_area` VALUES ('411121000000', '411100000000', '0,410000000000,411100000000', '舞阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('411122000000', '411100000000', '0,410000000000,411100000000', '临颍县', 3, 0);
INSERT INTO `sys_area` VALUES ('411200000000', '410000000000', '0,410000000000', '三门峡市', 2, 0);
INSERT INTO `sys_area` VALUES ('411202000000', '411200000000', '0,410000000000,411200000000', '湖滨区', 3, 0);
INSERT INTO `sys_area` VALUES ('411221000000', '411200000000', '0,410000000000,411200000000', '渑池县', 3, 0);
INSERT INTO `sys_area` VALUES ('411222000000', '411200000000', '0,410000000000,411200000000', '陕县', 3, 0);
INSERT INTO `sys_area` VALUES ('411224000000', '411200000000', '0,410000000000,411200000000', '卢氏县', 3, 0);
INSERT INTO `sys_area` VALUES ('411281000000', '411200000000', '0,410000000000,411200000000', '义马市', 3, 0);
INSERT INTO `sys_area` VALUES ('411282000000', '411200000000', '0,410000000000,411200000000', '灵宝市', 3, 0);
INSERT INTO `sys_area` VALUES ('411300000000', '410000000000', '0,410000000000', '南阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('411302000000', '411300000000', '0,410000000000,411300000000', '宛城区', 3, 0);
INSERT INTO `sys_area` VALUES ('411303000000', '411300000000', '0,410000000000,411300000000', '卧龙区', 3, 0);
INSERT INTO `sys_area` VALUES ('411321000000', '411300000000', '0,410000000000,411300000000', '南召县', 3, 0);
INSERT INTO `sys_area` VALUES ('411322000000', '411300000000', '0,410000000000,411300000000', '方城县', 3, 0);
INSERT INTO `sys_area` VALUES ('411323000000', '411300000000', '0,410000000000,411300000000', '西峡县', 3, 0);
INSERT INTO `sys_area` VALUES ('411324000000', '411300000000', '0,410000000000,411300000000', '镇平县', 3, 0);
INSERT INTO `sys_area` VALUES ('411325000000', '411300000000', '0,410000000000,411300000000', '内乡县', 3, 0);
INSERT INTO `sys_area` VALUES ('411326000000', '411300000000', '0,410000000000,411300000000', '淅川县', 3, 0);
INSERT INTO `sys_area` VALUES ('411327000000', '411300000000', '0,410000000000,411300000000', '社旗县', 3, 0);
INSERT INTO `sys_area` VALUES ('411328000000', '411300000000', '0,410000000000,411300000000', '唐河县', 3, 0);
INSERT INTO `sys_area` VALUES ('411329000000', '411300000000', '0,410000000000,411300000000', '新野县', 3, 0);
INSERT INTO `sys_area` VALUES ('411330000000', '411300000000', '0,410000000000,411300000000', '桐柏县', 3, 0);
INSERT INTO `sys_area` VALUES ('411381000000', '411300000000', '0,410000000000,411300000000', '邓州市', 3, 0);
INSERT INTO `sys_area` VALUES ('411400000000', '410000000000', '0,410000000000', '商丘市', 2, 0);
INSERT INTO `sys_area` VALUES ('411402000000', '411400000000', '0,410000000000,411400000000', '梁园区', 3, 0);
INSERT INTO `sys_area` VALUES ('411403000000', '411400000000', '0,410000000000,411400000000', '睢阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('411421000000', '411400000000', '0,410000000000,411400000000', '民权县', 3, 0);
INSERT INTO `sys_area` VALUES ('411422000000', '411400000000', '0,410000000000,411400000000', '睢县', 3, 0);
INSERT INTO `sys_area` VALUES ('411423000000', '411400000000', '0,410000000000,411400000000', '宁陵县', 3, 0);
INSERT INTO `sys_area` VALUES ('411424000000', '411400000000', '0,410000000000,411400000000', '柘城县', 3, 0);
INSERT INTO `sys_area` VALUES ('411425000000', '411400000000', '0,410000000000,411400000000', '虞城县', 3, 0);
INSERT INTO `sys_area` VALUES ('411426000000', '411400000000', '0,410000000000,411400000000', '夏邑县', 3, 0);
INSERT INTO `sys_area` VALUES ('411481000000', '411400000000', '0,410000000000,411400000000', '永城市', 3, 0);
INSERT INTO `sys_area` VALUES ('411500000000', '410000000000', '0,410000000000', '信阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('411502000000', '411500000000', '0,410000000000,411500000000', '浉河区', 3, 0);
INSERT INTO `sys_area` VALUES ('411503000000', '411500000000', '0,410000000000,411500000000', '平桥区', 3, 0);
INSERT INTO `sys_area` VALUES ('411521000000', '411500000000', '0,410000000000,411500000000', '罗山县', 3, 0);
INSERT INTO `sys_area` VALUES ('411522000000', '411500000000', '0,410000000000,411500000000', '光山县', 3, 0);
INSERT INTO `sys_area` VALUES ('411523000000', '411500000000', '0,410000000000,411500000000', '新县', 3, 0);
INSERT INTO `sys_area` VALUES ('411524000000', '411500000000', '0,410000000000,411500000000', '商城县', 3, 0);
INSERT INTO `sys_area` VALUES ('411525000000', '411500000000', '0,410000000000,411500000000', '固始县', 3, 0);
INSERT INTO `sys_area` VALUES ('411526000000', '411500000000', '0,410000000000,411500000000', '潢川县', 3, 0);
INSERT INTO `sys_area` VALUES ('411527000000', '411500000000', '0,410000000000,411500000000', '淮滨县', 3, 0);
INSERT INTO `sys_area` VALUES ('411528000000', '411500000000', '0,410000000000,411500000000', '息县', 3, 0);
INSERT INTO `sys_area` VALUES ('411600000000', '410000000000', '0,410000000000', '周口市', 2, 0);
INSERT INTO `sys_area` VALUES ('411602000000', '411600000000', '0,410000000000,411600000000', '川汇区', 3, 0);
INSERT INTO `sys_area` VALUES ('411621000000', '411600000000', '0,410000000000,411600000000', '扶沟县', 3, 0);
INSERT INTO `sys_area` VALUES ('411622000000', '411600000000', '0,410000000000,411600000000', '西华县', 3, 0);
INSERT INTO `sys_area` VALUES ('411623000000', '411600000000', '0,410000000000,411600000000', '商水县', 3, 0);
INSERT INTO `sys_area` VALUES ('411624000000', '411600000000', '0,410000000000,411600000000', '沈丘县', 3, 0);
INSERT INTO `sys_area` VALUES ('411625000000', '411600000000', '0,410000000000,411600000000', '郸城县', 3, 0);
INSERT INTO `sys_area` VALUES ('411626000000', '411600000000', '0,410000000000,411600000000', '淮阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('411627000000', '411600000000', '0,410000000000,411600000000', '太康县', 3, 0);
INSERT INTO `sys_area` VALUES ('411628000000', '411600000000', '0,410000000000,411600000000', '鹿邑县', 3, 0);
INSERT INTO `sys_area` VALUES ('411681000000', '411600000000', '0,410000000000,411600000000', '项城市', 3, 0);
INSERT INTO `sys_area` VALUES ('411700000000', '410000000000', '0,410000000000', '驻马店市', 2, 0);
INSERT INTO `sys_area` VALUES ('411702000000', '411700000000', '0,410000000000,411700000000', '驿城区', 3, 0);
INSERT INTO `sys_area` VALUES ('411721000000', '411700000000', '0,410000000000,411700000000', '西平县', 3, 0);
INSERT INTO `sys_area` VALUES ('411722000000', '411700000000', '0,410000000000,411700000000', '上蔡县', 3, 0);
INSERT INTO `sys_area` VALUES ('411723000000', '411700000000', '0,410000000000,411700000000', '平舆县', 3, 0);
INSERT INTO `sys_area` VALUES ('411724000000', '411700000000', '0,410000000000,411700000000', '正阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('411725000000', '411700000000', '0,410000000000,411700000000', '确山县', 3, 0);
INSERT INTO `sys_area` VALUES ('411726000000', '411700000000', '0,410000000000,411700000000', '泌阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('411727000000', '411700000000', '0,410000000000,411700000000', '汝南县', 3, 0);
INSERT INTO `sys_area` VALUES ('411728000000', '411700000000', '0,410000000000,411700000000', '遂平县', 3, 0);
INSERT INTO `sys_area` VALUES ('411729000000', '411700000000', '0,410000000000,411700000000', '新蔡县', 3, 0);
INSERT INTO `sys_area` VALUES ('419001000000', '410000000000', '0,410000000000', '济源市', 2, 0);
INSERT INTO `sys_area` VALUES ('419001001000', '419001000000', '0,410000000000,419001000000', '济源市沁园街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('419001002000', '419001000000', '0,410000000000,419001000000', '济源市济水街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('419001003000', '419001000000', '0,410000000000,419001000000', '济源市北海街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('419001004000', '419001000000', '0,410000000000,419001000000', '济源市天坛街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('419001005000', '419001000000', '0,410000000000,419001000000', '济源市玉泉街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('419001100000', '419001000000', '0,410000000000,419001000000', '济源市克井镇', 3, 0);
INSERT INTO `sys_area` VALUES ('419001101000', '419001000000', '0,410000000000,419001000000', '济源市五龙口镇', 3, 0);
INSERT INTO `sys_area` VALUES ('419001102000', '419001000000', '0,410000000000,419001000000', '济源市轵城镇', 3, 0);
INSERT INTO `sys_area` VALUES ('419001103000', '419001000000', '0,410000000000,419001000000', '济源市承留镇', 3, 0);
INSERT INTO `sys_area` VALUES ('419001104000', '419001000000', '0,410000000000,419001000000', '济源市邵原镇', 3, 0);
INSERT INTO `sys_area` VALUES ('419001105000', '419001000000', '0,410000000000,419001000000', '济源市坡头镇', 3, 0);
INSERT INTO `sys_area` VALUES ('419001106000', '419001000000', '0,410000000000,419001000000', '济源市梨林镇', 3, 0);
INSERT INTO `sys_area` VALUES ('419001107000', '419001000000', '0,410000000000,419001000000', '济源市大峪镇', 3, 0);
INSERT INTO `sys_area` VALUES ('419001108000', '419001000000', '0,410000000000,419001000000', '济源市思礼镇', 3, 0);
INSERT INTO `sys_area` VALUES ('419001109000', '419001000000', '0,410000000000,419001000000', '济源市王屋镇', 3, 0);
INSERT INTO `sys_area` VALUES ('419001110000', '419001000000', '0,410000000000,419001000000', '济源市下冶镇', 3, 0);
INSERT INTO `sys_area` VALUES ('420000000000', '100000000000', '0,', '湖北省', 1, 0);
INSERT INTO `sys_area` VALUES ('420100000000', '420000000000', '0,420000000000', '武汉市', 2, 0);
INSERT INTO `sys_area` VALUES ('420102000000', '420100000000', '0,420000000000,420100000000', '江岸区', 3, 0);
INSERT INTO `sys_area` VALUES ('420103000000', '420100000000', '0,420000000000,420100000000', '江汉区', 3, 0);
INSERT INTO `sys_area` VALUES ('420104000000', '420100000000', '0,420000000000,420100000000', '硚口区', 3, 0);
INSERT INTO `sys_area` VALUES ('420105000000', '420100000000', '0,420000000000,420100000000', '汉阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('420106000000', '420100000000', '0,420000000000,420100000000', '武昌区', 3, 0);
INSERT INTO `sys_area` VALUES ('420107000000', '420100000000', '0,420000000000,420100000000', '青山区', 3, 0);
INSERT INTO `sys_area` VALUES ('420111000000', '420100000000', '0,420000000000,420100000000', '洪山区', 3, 0);
INSERT INTO `sys_area` VALUES ('420112000000', '420100000000', '0,420000000000,420100000000', '东西湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('420113000000', '420100000000', '0,420000000000,420100000000', '汉南区', 3, 0);
INSERT INTO `sys_area` VALUES ('420114000000', '420100000000', '0,420000000000,420100000000', '蔡甸区', 3, 0);
INSERT INTO `sys_area` VALUES ('420115000000', '420100000000', '0,420000000000,420100000000', '江夏区', 3, 0);
INSERT INTO `sys_area` VALUES ('420116000000', '420100000000', '0,420000000000,420100000000', '黄陂区', 3, 0);
INSERT INTO `sys_area` VALUES ('420117000000', '420100000000', '0,420000000000,420100000000', '新洲区', 3, 0);
INSERT INTO `sys_area` VALUES ('420200000000', '420000000000', '0,420000000000', '黄石市', 2, 0);
INSERT INTO `sys_area` VALUES ('420202000000', '420200000000', '0,420000000000,420200000000', '黄石港区', 3, 0);
INSERT INTO `sys_area` VALUES ('420203000000', '420200000000', '0,420000000000,420200000000', '西塞山区', 3, 0);
INSERT INTO `sys_area` VALUES ('420204000000', '420200000000', '0,420000000000,420200000000', '下陆区', 3, 0);
INSERT INTO `sys_area` VALUES ('420205000000', '420200000000', '0,420000000000,420200000000', '铁山区', 3, 0);
INSERT INTO `sys_area` VALUES ('420222000000', '420200000000', '0,420000000000,420200000000', '阳新县', 3, 0);
INSERT INTO `sys_area` VALUES ('420281000000', '420200000000', '0,420000000000,420200000000', '大冶市', 3, 0);
INSERT INTO `sys_area` VALUES ('420300000000', '420000000000', '0,420000000000', '十堰市', 2, 0);
INSERT INTO `sys_area` VALUES ('420302000000', '420300000000', '0,420000000000,420300000000', '茅箭区', 3, 0);
INSERT INTO `sys_area` VALUES ('420303000000', '420300000000', '0,420000000000,420300000000', '张湾区', 3, 0);
INSERT INTO `sys_area` VALUES ('420304000000', '420300000000', '0,420000000000,420300000000', '郧阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('420322000000', '420300000000', '0,420000000000,420300000000', '郧西县', 3, 0);
INSERT INTO `sys_area` VALUES ('420323000000', '420300000000', '0,420000000000,420300000000', '竹山县', 3, 0);
INSERT INTO `sys_area` VALUES ('420324000000', '420300000000', '0,420000000000,420300000000', '竹溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('420325000000', '420300000000', '0,420000000000,420300000000', '房县', 3, 0);
INSERT INTO `sys_area` VALUES ('420381000000', '420300000000', '0,420000000000,420300000000', '丹江口市', 3, 0);
INSERT INTO `sys_area` VALUES ('420500000000', '420000000000', '0,420000000000', '宜昌市', 2, 0);
INSERT INTO `sys_area` VALUES ('420502000000', '420500000000', '0,420000000000,420500000000', '西陵区', 3, 0);
INSERT INTO `sys_area` VALUES ('420503000000', '420500000000', '0,420000000000,420500000000', '伍家岗区', 3, 0);
INSERT INTO `sys_area` VALUES ('420504000000', '420500000000', '0,420000000000,420500000000', '点军区', 3, 0);
INSERT INTO `sys_area` VALUES ('420505000000', '420500000000', '0,420000000000,420500000000', '猇亭区', 3, 0);
INSERT INTO `sys_area` VALUES ('420506000000', '420500000000', '0,420000000000,420500000000', '夷陵区', 3, 0);
INSERT INTO `sys_area` VALUES ('420525000000', '420500000000', '0,420000000000,420500000000', '远安县', 3, 0);
INSERT INTO `sys_area` VALUES ('420526000000', '420500000000', '0,420000000000,420500000000', '兴山县', 3, 0);
INSERT INTO `sys_area` VALUES ('420527000000', '420500000000', '0,420000000000,420500000000', '秭归县', 3, 0);
INSERT INTO `sys_area` VALUES ('420528000000', '420500000000', '0,420000000000,420500000000', '长阳土家族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('420529000000', '420500000000', '0,420000000000,420500000000', '五峰土家族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('420581000000', '420500000000', '0,420000000000,420500000000', '宜都市', 3, 0);
INSERT INTO `sys_area` VALUES ('420582000000', '420500000000', '0,420000000000,420500000000', '当阳市', 3, 0);
INSERT INTO `sys_area` VALUES ('420583000000', '420500000000', '0,420000000000,420500000000', '枝江市', 3, 0);
INSERT INTO `sys_area` VALUES ('420600000000', '420000000000', '0,420000000000', '襄阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('420602000000', '420600000000', '0,420000000000,420600000000', '襄城区', 3, 0);
INSERT INTO `sys_area` VALUES ('420606000000', '420600000000', '0,420000000000,420600000000', '樊城区', 3, 0);
INSERT INTO `sys_area` VALUES ('420607000000', '420600000000', '0,420000000000,420600000000', '襄州区', 3, 0);
INSERT INTO `sys_area` VALUES ('420624000000', '420600000000', '0,420000000000,420600000000', '南漳县', 3, 0);
INSERT INTO `sys_area` VALUES ('420625000000', '420600000000', '0,420000000000,420600000000', '谷城县', 3, 0);
INSERT INTO `sys_area` VALUES ('420626000000', '420600000000', '0,420000000000,420600000000', '保康县', 3, 0);
INSERT INTO `sys_area` VALUES ('420682000000', '420600000000', '0,420000000000,420600000000', '老河口市', 3, 0);
INSERT INTO `sys_area` VALUES ('420683000000', '420600000000', '0,420000000000,420600000000', '枣阳市', 3, 0);
INSERT INTO `sys_area` VALUES ('420684000000', '420600000000', '0,420000000000,420600000000', '宜城市', 3, 0);
INSERT INTO `sys_area` VALUES ('420700000000', '420000000000', '0,420000000000', '鄂州市', 2, 0);
INSERT INTO `sys_area` VALUES ('420702000000', '420700000000', '0,420000000000,420700000000', '梁子湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('420703000000', '420700000000', '0,420000000000,420700000000', '华容区', 3, 0);
INSERT INTO `sys_area` VALUES ('420704000000', '420700000000', '0,420000000000,420700000000', '鄂城区', 3, 0);
INSERT INTO `sys_area` VALUES ('420800000000', '420000000000', '0,420000000000', '荆门市', 2, 0);
INSERT INTO `sys_area` VALUES ('420802000000', '420800000000', '0,420000000000,420800000000', '东宝区', 3, 0);
INSERT INTO `sys_area` VALUES ('420804000000', '420800000000', '0,420000000000,420800000000', '掇刀区', 3, 0);
INSERT INTO `sys_area` VALUES ('420821000000', '420800000000', '0,420000000000,420800000000', '京山县', 3, 0);
INSERT INTO `sys_area` VALUES ('420822000000', '420800000000', '0,420000000000,420800000000', '沙洋县', 3, 0);
INSERT INTO `sys_area` VALUES ('420881000000', '420800000000', '0,420000000000,420800000000', '钟祥市', 3, 0);
INSERT INTO `sys_area` VALUES ('420900000000', '420000000000', '0,420000000000', '孝感市', 2, 0);
INSERT INTO `sys_area` VALUES ('420902000000', '420900000000', '0,420000000000,420900000000', '孝南区', 3, 0);
INSERT INTO `sys_area` VALUES ('420921000000', '420900000000', '0,420000000000,420900000000', '孝昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('420922000000', '420900000000', '0,420000000000,420900000000', '大悟县', 3, 0);
INSERT INTO `sys_area` VALUES ('420923000000', '420900000000', '0,420000000000,420900000000', '云梦县', 3, 0);
INSERT INTO `sys_area` VALUES ('420981000000', '420900000000', '0,420000000000,420900000000', '应城市', 3, 0);
INSERT INTO `sys_area` VALUES ('420982000000', '420900000000', '0,420000000000,420900000000', '安陆市', 3, 0);
INSERT INTO `sys_area` VALUES ('420984000000', '420900000000', '0,420000000000,420900000000', '汉川市', 3, 0);
INSERT INTO `sys_area` VALUES ('421000000000', '420000000000', '0,420000000000', '荆州市', 2, 0);
INSERT INTO `sys_area` VALUES ('421002000000', '421000000000', '0,420000000000,421000000000', '沙市区', 3, 0);
INSERT INTO `sys_area` VALUES ('421003000000', '421000000000', '0,420000000000,421000000000', '荆州区', 3, 0);
INSERT INTO `sys_area` VALUES ('421022000000', '421000000000', '0,420000000000,421000000000', '公安县', 3, 0);
INSERT INTO `sys_area` VALUES ('421023000000', '421000000000', '0,420000000000,421000000000', '监利县', 3, 0);
INSERT INTO `sys_area` VALUES ('421024000000', '421000000000', '0,420000000000,421000000000', '江陵县', 3, 0);
INSERT INTO `sys_area` VALUES ('421081000000', '421000000000', '0,420000000000,421000000000', '石首市', 3, 0);
INSERT INTO `sys_area` VALUES ('421083000000', '421000000000', '0,420000000000,421000000000', '洪湖市', 3, 0);
INSERT INTO `sys_area` VALUES ('421087000000', '421000000000', '0,420000000000,421000000000', '松滋市', 3, 0);
INSERT INTO `sys_area` VALUES ('421100000000', '420000000000', '0,420000000000', '黄冈市', 2, 0);
INSERT INTO `sys_area` VALUES ('421102000000', '421100000000', '0,420000000000,421100000000', '黄州区', 3, 0);
INSERT INTO `sys_area` VALUES ('421121000000', '421100000000', '0,420000000000,421100000000', '团风县', 3, 0);
INSERT INTO `sys_area` VALUES ('421122000000', '421100000000', '0,420000000000,421100000000', '红安县', 3, 0);
INSERT INTO `sys_area` VALUES ('421123000000', '421100000000', '0,420000000000,421100000000', '罗田县', 3, 0);
INSERT INTO `sys_area` VALUES ('421124000000', '421100000000', '0,420000000000,421100000000', '英山县', 3, 0);
INSERT INTO `sys_area` VALUES ('421125000000', '421100000000', '0,420000000000,421100000000', '浠水县', 3, 0);
INSERT INTO `sys_area` VALUES ('421126000000', '421100000000', '0,420000000000,421100000000', '蕲春县', 3, 0);
INSERT INTO `sys_area` VALUES ('421127000000', '421100000000', '0,420000000000,421100000000', '黄梅县', 3, 0);
INSERT INTO `sys_area` VALUES ('421181000000', '421100000000', '0,420000000000,421100000000', '麻城市', 3, 0);
INSERT INTO `sys_area` VALUES ('421182000000', '421100000000', '0,420000000000,421100000000', '武穴市', 3, 0);
INSERT INTO `sys_area` VALUES ('421200000000', '420000000000', '0,420000000000', '咸宁市', 2, 0);
INSERT INTO `sys_area` VALUES ('421202000000', '421200000000', '0,420000000000,421200000000', '咸安区', 3, 0);
INSERT INTO `sys_area` VALUES ('421221000000', '421200000000', '0,420000000000,421200000000', '嘉鱼县', 3, 0);
INSERT INTO `sys_area` VALUES ('421222000000', '421200000000', '0,420000000000,421200000000', '通城县', 3, 0);
INSERT INTO `sys_area` VALUES ('421223000000', '421200000000', '0,420000000000,421200000000', '崇阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('421224000000', '421200000000', '0,420000000000,421200000000', '通山县', 3, 0);
INSERT INTO `sys_area` VALUES ('421281000000', '421200000000', '0,420000000000,421200000000', '赤壁市', 3, 0);
INSERT INTO `sys_area` VALUES ('421300000000', '420000000000', '0,420000000000', '随州市', 2, 0);
INSERT INTO `sys_area` VALUES ('421303000000', '421300000000', '0,420000000000,421300000000', '曾都区', 3, 0);
INSERT INTO `sys_area` VALUES ('421321000000', '421300000000', '0,420000000000,421300000000', '随县', 3, 0);
INSERT INTO `sys_area` VALUES ('421381000000', '421300000000', '0,420000000000,421300000000', '广水市', 3, 0);
INSERT INTO `sys_area` VALUES ('422800000000', '420000000000', '0,420000000000', '恩施土家族苗族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('422801000000', '422800000000', '0,420000000000,422800000000', '恩施市', 3, 0);
INSERT INTO `sys_area` VALUES ('422802000000', '422800000000', '0,420000000000,422800000000', '利川市', 3, 0);
INSERT INTO `sys_area` VALUES ('422822000000', '422800000000', '0,420000000000,422800000000', '建始县', 3, 0);
INSERT INTO `sys_area` VALUES ('422823000000', '422800000000', '0,420000000000,422800000000', '巴东县', 3, 0);
INSERT INTO `sys_area` VALUES ('422825000000', '422800000000', '0,420000000000,422800000000', '宣恩县', 3, 0);
INSERT INTO `sys_area` VALUES ('422826000000', '422800000000', '0,420000000000,422800000000', '咸丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('422827000000', '422800000000', '0,420000000000,422800000000', '来凤县', 3, 0);
INSERT INTO `sys_area` VALUES ('422828000000', '422800000000', '0,420000000000,422800000000', '鹤峰县', 3, 0);
INSERT INTO `sys_area` VALUES ('429004000000', '420000000000', '0,420000000000', '仙桃市', 2, 0);
INSERT INTO `sys_area` VALUES ('429004001000', '429004000000', '0,420000000000,429004000000', '沙嘴街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('429004002000', '429004000000', '0,420000000000,429004000000', '干河街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('429004003000', '429004000000', '0,420000000000,429004000000', '龙华山办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('429004100000', '429004000000', '0,420000000000,429004000000', '郑场镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004101000', '429004000000', '0,420000000000,429004000000', '毛嘴镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004102000', '429004000000', '0,420000000000,429004000000', '豆河镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004103000', '429004000000', '0,420000000000,429004000000', '三伏潭镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004104000', '429004000000', '0,420000000000,429004000000', '胡场镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004105000', '429004000000', '0,420000000000,429004000000', '长倘口镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004106000', '429004000000', '0,420000000000,429004000000', '西流河镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004107000', '429004000000', '0,420000000000,429004000000', '沙湖镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004108000', '429004000000', '0,420000000000,429004000000', '杨林尾镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004109000', '429004000000', '0,420000000000,429004000000', '彭场镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004110000', '429004000000', '0,420000000000,429004000000', '张沟镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004111000', '429004000000', '0,420000000000,429004000000', '郭河镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004112000', '429004000000', '0,420000000000,429004000000', '沔城回族镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004113000', '429004000000', '0,420000000000,429004000000', '通海口镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429004114000', '429004000000', '0,420000000000,429004000000', '陈场镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429005000000', '420000000000', '0,420000000000', '潜江市', 2, 0);
INSERT INTO `sys_area` VALUES ('429005001000', '429005000000', '0,420000000000,429005000000', '园林办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('429005002000', '429005000000', '0,420000000000,429005000000', '杨市办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('429005003000', '429005000000', '0,420000000000,429005000000', '周矶办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('429005004000', '429005000000', '0,420000000000,429005000000', '广华办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('429005005000', '429005000000', '0,420000000000,429005000000', '泰丰办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('429005006000', '429005000000', '0,420000000000,429005000000', '高场办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('429005100000', '429005000000', '0,420000000000,429005000000', '竹根滩镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429005101000', '429005000000', '0,420000000000,429005000000', '渔洋镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429005102000', '429005000000', '0,420000000000,429005000000', '王场镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429005103000', '429005000000', '0,420000000000,429005000000', '高石碑镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429005104000', '429005000000', '0,420000000000,429005000000', '熊口镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429005105000', '429005000000', '0,420000000000,429005000000', '老新镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429005106000', '429005000000', '0,420000000000,429005000000', '浩口镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429005107000', '429005000000', '0,420000000000,429005000000', '积玉口镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429005108000', '429005000000', '0,420000000000,429005000000', '张金镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429005109000', '429005000000', '0,420000000000,429005000000', '龙湾镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006000000', '420000000000', '0,420000000000', '天门市', 2, 0);
INSERT INTO `sys_area` VALUES ('429006001000', '429006000000', '0,420000000000,429006000000', '竟陵街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('429006002000', '429006000000', '0,420000000000,429006000000', '侨乡街道开发区', 3, 0);
INSERT INTO `sys_area` VALUES ('429006003000', '429006000000', '0,420000000000,429006000000', '杨林街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('429006100000', '429006000000', '0,420000000000,429006000000', '多宝镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006101000', '429006000000', '0,420000000000,429006000000', '拖市镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006102000', '429006000000', '0,420000000000,429006000000', '张港镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006103000', '429006000000', '0,420000000000,429006000000', '蒋场镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006104000', '429006000000', '0,420000000000,429006000000', '汪场镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006105000', '429006000000', '0,420000000000,429006000000', '渔薪镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006106000', '429006000000', '0,420000000000,429006000000', '黄潭镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006107000', '429006000000', '0,420000000000,429006000000', '岳口镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006108000', '429006000000', '0,420000000000,429006000000', '横林镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006109000', '429006000000', '0,420000000000,429006000000', '彭市镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006110000', '429006000000', '0,420000000000,429006000000', '麻洋镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006111000', '429006000000', '0,420000000000,429006000000', '多祥镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006112000', '429006000000', '0,420000000000,429006000000', '干驿镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006113000', '429006000000', '0,420000000000,429006000000', '马湾镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006114000', '429006000000', '0,420000000000,429006000000', '卢市镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006115000', '429006000000', '0,420000000000,429006000000', '小板镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006116000', '429006000000', '0,420000000000,429006000000', '九真镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006118000', '429006000000', '0,420000000000,429006000000', '皂市镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006119000', '429006000000', '0,420000000000,429006000000', '胡市镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006120000', '429006000000', '0,420000000000,429006000000', '石河镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006121000', '429006000000', '0,420000000000,429006000000', '佛子山镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429006201000', '429006000000', '0,420000000000,429006000000', '净潭乡', 3, 0);
INSERT INTO `sys_area` VALUES ('429021000000', '420000000000', '0,420000000000', '神农架林区', 2, 0);
INSERT INTO `sys_area` VALUES ('429021100000', '429021000000', '0,420000000000,429021000000', '松柏镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429021101000', '429021000000', '0,420000000000,429021000000', '阳日镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429021102000', '429021000000', '0,420000000000,429021000000', '木鱼镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429021103000', '429021000000', '0,420000000000,429021000000', '红坪镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429021104000', '429021000000', '0,420000000000,429021000000', '新华镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429021105000', '429021000000', '0,420000000000,429021000000', '九湖镇', 3, 0);
INSERT INTO `sys_area` VALUES ('429021200000', '429021000000', '0,420000000000,429021000000', '宋洛乡', 3, 0);
INSERT INTO `sys_area` VALUES ('429021202000', '429021000000', '0,420000000000,429021000000', '下谷坪土家族乡', 3, 0);
INSERT INTO `sys_area` VALUES ('430000000000', '100000000000', '0,', '湖南省', 1, 0);
INSERT INTO `sys_area` VALUES ('430100000000', '430000000000', '0,430000000000', '长沙市', 2, 0);
INSERT INTO `sys_area` VALUES ('430102000000', '430100000000', '0,430000000000,430100000000', '芙蓉区', 3, 0);
INSERT INTO `sys_area` VALUES ('430103000000', '430100000000', '0,430000000000,430100000000', '天心区', 3, 0);
INSERT INTO `sys_area` VALUES ('430104000000', '430100000000', '0,430000000000,430100000000', '岳麓区', 3, 0);
INSERT INTO `sys_area` VALUES ('430105000000', '430100000000', '0,430000000000,430100000000', '开福区', 3, 0);
INSERT INTO `sys_area` VALUES ('430111000000', '430100000000', '0,430000000000,430100000000', '雨花区', 3, 0);
INSERT INTO `sys_area` VALUES ('430112000000', '430100000000', '0,430000000000,430100000000', '望城区', 3, 0);
INSERT INTO `sys_area` VALUES ('430121000000', '430100000000', '0,430000000000,430100000000', '长沙县', 3, 0);
INSERT INTO `sys_area` VALUES ('430124000000', '430100000000', '0,430000000000,430100000000', '宁乡县', 3, 0);
INSERT INTO `sys_area` VALUES ('430181000000', '430100000000', '0,430000000000,430100000000', '浏阳市', 3, 0);
INSERT INTO `sys_area` VALUES ('430200000000', '430000000000', '0,430000000000', '株洲市', 2, 0);
INSERT INTO `sys_area` VALUES ('430202000000', '430200000000', '0,430000000000,430200000000', '荷塘区', 3, 0);
INSERT INTO `sys_area` VALUES ('430203000000', '430200000000', '0,430000000000,430200000000', '芦淞区', 3, 0);
INSERT INTO `sys_area` VALUES ('430204000000', '430200000000', '0,430000000000,430200000000', '石峰区', 3, 0);
INSERT INTO `sys_area` VALUES ('430211000000', '430200000000', '0,430000000000,430200000000', '天元区', 3, 0);
INSERT INTO `sys_area` VALUES ('430221000000', '430200000000', '0,430000000000,430200000000', '株洲县', 3, 0);
INSERT INTO `sys_area` VALUES ('430223000000', '430200000000', '0,430000000000,430200000000', '攸县', 3, 0);
INSERT INTO `sys_area` VALUES ('430224000000', '430200000000', '0,430000000000,430200000000', '茶陵县', 3, 0);
INSERT INTO `sys_area` VALUES ('430225000000', '430200000000', '0,430000000000,430200000000', '炎陵县', 3, 0);
INSERT INTO `sys_area` VALUES ('430281000000', '430200000000', '0,430000000000,430200000000', '醴陵市', 3, 0);
INSERT INTO `sys_area` VALUES ('430300000000', '430000000000', '0,430000000000', '湘潭市', 2, 0);
INSERT INTO `sys_area` VALUES ('430302000000', '430300000000', '0,430000000000,430300000000', '雨湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('430304000000', '430300000000', '0,430000000000,430300000000', '岳塘区', 3, 0);
INSERT INTO `sys_area` VALUES ('430321000000', '430300000000', '0,430000000000,430300000000', '湘潭县', 3, 0);
INSERT INTO `sys_area` VALUES ('430381000000', '430300000000', '0,430000000000,430300000000', '湘乡市', 3, 0);
INSERT INTO `sys_area` VALUES ('430382000000', '430300000000', '0,430000000000,430300000000', '韶山市', 3, 0);
INSERT INTO `sys_area` VALUES ('430400000000', '430000000000', '0,430000000000', '衡阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('430405000000', '430400000000', '0,430000000000,430400000000', '珠晖区', 3, 0);
INSERT INTO `sys_area` VALUES ('430406000000', '430400000000', '0,430000000000,430400000000', '雁峰区', 3, 0);
INSERT INTO `sys_area` VALUES ('430407000000', '430400000000', '0,430000000000,430400000000', '石鼓区', 3, 0);
INSERT INTO `sys_area` VALUES ('430408000000', '430400000000', '0,430000000000,430400000000', '蒸湘区', 3, 0);
INSERT INTO `sys_area` VALUES ('430412000000', '430400000000', '0,430000000000,430400000000', '南岳区', 3, 0);
INSERT INTO `sys_area` VALUES ('430421000000', '430400000000', '0,430000000000,430400000000', '衡阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('430422000000', '430400000000', '0,430000000000,430400000000', '衡南县', 3, 0);
INSERT INTO `sys_area` VALUES ('430423000000', '430400000000', '0,430000000000,430400000000', '衡山县', 3, 0);
INSERT INTO `sys_area` VALUES ('430424000000', '430400000000', '0,430000000000,430400000000', '衡东县', 3, 0);
INSERT INTO `sys_area` VALUES ('430426000000', '430400000000', '0,430000000000,430400000000', '祁东县', 3, 0);
INSERT INTO `sys_area` VALUES ('430481000000', '430400000000', '0,430000000000,430400000000', '耒阳市', 3, 0);
INSERT INTO `sys_area` VALUES ('430482000000', '430400000000', '0,430000000000,430400000000', '常宁市', 3, 0);
INSERT INTO `sys_area` VALUES ('430500000000', '430000000000', '0,430000000000', '邵阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('430502000000', '430500000000', '0,430000000000,430500000000', '双清区', 3, 0);
INSERT INTO `sys_area` VALUES ('430503000000', '430500000000', '0,430000000000,430500000000', '大祥区', 3, 0);
INSERT INTO `sys_area` VALUES ('430511000000', '430500000000', '0,430000000000,430500000000', '北塔区', 3, 0);
INSERT INTO `sys_area` VALUES ('430521000000', '430500000000', '0,430000000000,430500000000', '邵东县', 3, 0);
INSERT INTO `sys_area` VALUES ('430522000000', '430500000000', '0,430000000000,430500000000', '新邵县', 3, 0);
INSERT INTO `sys_area` VALUES ('430523000000', '430500000000', '0,430000000000,430500000000', '邵阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('430524000000', '430500000000', '0,430000000000,430500000000', '隆回县', 3, 0);
INSERT INTO `sys_area` VALUES ('430525000000', '430500000000', '0,430000000000,430500000000', '洞口县', 3, 0);
INSERT INTO `sys_area` VALUES ('430527000000', '430500000000', '0,430000000000,430500000000', '绥宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('430528000000', '430500000000', '0,430000000000,430500000000', '新宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('430529000000', '430500000000', '0,430000000000,430500000000', '城步苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('430581000000', '430500000000', '0,430000000000,430500000000', '武冈市', 3, 0);
INSERT INTO `sys_area` VALUES ('430600000000', '430000000000', '0,430000000000', '岳阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('430602000000', '430600000000', '0,430000000000,430600000000', '岳阳楼区', 3, 0);
INSERT INTO `sys_area` VALUES ('430603000000', '430600000000', '0,430000000000,430600000000', '云溪区', 3, 0);
INSERT INTO `sys_area` VALUES ('430611000000', '430600000000', '0,430000000000,430600000000', '君山区', 3, 0);
INSERT INTO `sys_area` VALUES ('430621000000', '430600000000', '0,430000000000,430600000000', '岳阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('430623000000', '430600000000', '0,430000000000,430600000000', '华容县', 3, 0);
INSERT INTO `sys_area` VALUES ('430624000000', '430600000000', '0,430000000000,430600000000', '湘阴县', 3, 0);
INSERT INTO `sys_area` VALUES ('430626000000', '430600000000', '0,430000000000,430600000000', '平江县', 3, 0);
INSERT INTO `sys_area` VALUES ('430681000000', '430600000000', '0,430000000000,430600000000', '汨罗市', 3, 0);
INSERT INTO `sys_area` VALUES ('430682000000', '430600000000', '0,430000000000,430600000000', '临湘市', 3, 0);
INSERT INTO `sys_area` VALUES ('430700000000', '430000000000', '0,430000000000', '常德市', 2, 0);
INSERT INTO `sys_area` VALUES ('430702000000', '430700000000', '0,430000000000,430700000000', '武陵区', 3, 0);
INSERT INTO `sys_area` VALUES ('430703000000', '430700000000', '0,430000000000,430700000000', '鼎城区', 3, 0);
INSERT INTO `sys_area` VALUES ('430721000000', '430700000000', '0,430000000000,430700000000', '安乡县', 3, 0);
INSERT INTO `sys_area` VALUES ('430722000000', '430700000000', '0,430000000000,430700000000', '汉寿县', 3, 0);
INSERT INTO `sys_area` VALUES ('430723000000', '430700000000', '0,430000000000,430700000000', '澧县', 3, 0);
INSERT INTO `sys_area` VALUES ('430724000000', '430700000000', '0,430000000000,430700000000', '临澧县', 3, 0);
INSERT INTO `sys_area` VALUES ('430725000000', '430700000000', '0,430000000000,430700000000', '桃源县', 3, 0);
INSERT INTO `sys_area` VALUES ('430726000000', '430700000000', '0,430000000000,430700000000', '石门县', 3, 0);
INSERT INTO `sys_area` VALUES ('430781000000', '430700000000', '0,430000000000,430700000000', '津市市', 3, 0);
INSERT INTO `sys_area` VALUES ('430800000000', '430000000000', '0,430000000000', '张家界市', 2, 0);
INSERT INTO `sys_area` VALUES ('430802000000', '430800000000', '0,430000000000,430800000000', '永定区', 3, 0);
INSERT INTO `sys_area` VALUES ('430811000000', '430800000000', '0,430000000000,430800000000', '武陵源区', 3, 0);
INSERT INTO `sys_area` VALUES ('430821000000', '430800000000', '0,430000000000,430800000000', '慈利县', 3, 0);
INSERT INTO `sys_area` VALUES ('430822000000', '430800000000', '0,430000000000,430800000000', '桑植县', 3, 0);
INSERT INTO `sys_area` VALUES ('430900000000', '430000000000', '0,430000000000', '益阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('430902000000', '430900000000', '0,430000000000,430900000000', '资阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('430903000000', '430900000000', '0,430000000000,430900000000', '赫山区', 3, 0);
INSERT INTO `sys_area` VALUES ('430921000000', '430900000000', '0,430000000000,430900000000', '南县', 3, 0);
INSERT INTO `sys_area` VALUES ('430922000000', '430900000000', '0,430000000000,430900000000', '桃江县', 3, 0);
INSERT INTO `sys_area` VALUES ('430923000000', '430900000000', '0,430000000000,430900000000', '安化县', 3, 0);
INSERT INTO `sys_area` VALUES ('430981000000', '430900000000', '0,430000000000,430900000000', '沅江市', 3, 0);
INSERT INTO `sys_area` VALUES ('431000000000', '430000000000', '0,430000000000', '郴州市', 2, 0);
INSERT INTO `sys_area` VALUES ('431002000000', '431000000000', '0,430000000000,431000000000', '北湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('431003000000', '431000000000', '0,430000000000,431000000000', '苏仙区', 3, 0);
INSERT INTO `sys_area` VALUES ('431021000000', '431000000000', '0,430000000000,431000000000', '桂阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('431022000000', '431000000000', '0,430000000000,431000000000', '宜章县', 3, 0);
INSERT INTO `sys_area` VALUES ('431023000000', '431000000000', '0,430000000000,431000000000', '永兴县', 3, 0);
INSERT INTO `sys_area` VALUES ('431024000000', '431000000000', '0,430000000000,431000000000', '嘉禾县', 3, 0);
INSERT INTO `sys_area` VALUES ('431025000000', '431000000000', '0,430000000000,431000000000', '临武县', 3, 0);
INSERT INTO `sys_area` VALUES ('431026000000', '431000000000', '0,430000000000,431000000000', '汝城县', 3, 0);
INSERT INTO `sys_area` VALUES ('431027000000', '431000000000', '0,430000000000,431000000000', '桂东县', 3, 0);
INSERT INTO `sys_area` VALUES ('431028000000', '431000000000', '0,430000000000,431000000000', '安仁县', 3, 0);
INSERT INTO `sys_area` VALUES ('431081000000', '431000000000', '0,430000000000,431000000000', '资兴市', 3, 0);
INSERT INTO `sys_area` VALUES ('431100000000', '430000000000', '0,430000000000', '永州市', 2, 0);
INSERT INTO `sys_area` VALUES ('431102000000', '431100000000', '0,430000000000,431100000000', '零陵区', 3, 0);
INSERT INTO `sys_area` VALUES ('431103000000', '431100000000', '0,430000000000,431100000000', '冷水滩区', 3, 0);
INSERT INTO `sys_area` VALUES ('431121000000', '431100000000', '0,430000000000,431100000000', '祁阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('431122000000', '431100000000', '0,430000000000,431100000000', '东安县', 3, 0);
INSERT INTO `sys_area` VALUES ('431123000000', '431100000000', '0,430000000000,431100000000', '双牌县', 3, 0);
INSERT INTO `sys_area` VALUES ('431124000000', '431100000000', '0,430000000000,431100000000', '道县', 3, 0);
INSERT INTO `sys_area` VALUES ('431125000000', '431100000000', '0,430000000000,431100000000', '江永县', 3, 0);
INSERT INTO `sys_area` VALUES ('431126000000', '431100000000', '0,430000000000,431100000000', '宁远县', 3, 0);
INSERT INTO `sys_area` VALUES ('431127000000', '431100000000', '0,430000000000,431100000000', '蓝山县', 3, 0);
INSERT INTO `sys_area` VALUES ('431128000000', '431100000000', '0,430000000000,431100000000', '新田县', 3, 0);
INSERT INTO `sys_area` VALUES ('431129000000', '431100000000', '0,430000000000,431100000000', '江华瑶族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('431200000000', '430000000000', '0,430000000000', '怀化市', 2, 0);
INSERT INTO `sys_area` VALUES ('431202000000', '431200000000', '0,430000000000,431200000000', '鹤城区', 3, 0);
INSERT INTO `sys_area` VALUES ('431221000000', '431200000000', '0,430000000000,431200000000', '中方县', 3, 0);
INSERT INTO `sys_area` VALUES ('431222000000', '431200000000', '0,430000000000,431200000000', '沅陵县', 3, 0);
INSERT INTO `sys_area` VALUES ('431223000000', '431200000000', '0,430000000000,431200000000', '辰溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('431224000000', '431200000000', '0,430000000000,431200000000', '溆浦县', 3, 0);
INSERT INTO `sys_area` VALUES ('431225000000', '431200000000', '0,430000000000,431200000000', '会同县', 3, 0);
INSERT INTO `sys_area` VALUES ('431226000000', '431200000000', '0,430000000000,431200000000', '麻阳苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('431227000000', '431200000000', '0,430000000000,431200000000', '新晃侗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('431228000000', '431200000000', '0,430000000000,431200000000', '芷江侗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('431229000000', '431200000000', '0,430000000000,431200000000', '靖州苗族侗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('431230000000', '431200000000', '0,430000000000,431200000000', '通道侗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('431281000000', '431200000000', '0,430000000000,431200000000', '洪江市', 3, 0);
INSERT INTO `sys_area` VALUES ('431300000000', '430000000000', '0,430000000000', '娄底市', 2, 0);
INSERT INTO `sys_area` VALUES ('431302000000', '431300000000', '0,430000000000,431300000000', '娄星区', 3, 0);
INSERT INTO `sys_area` VALUES ('431321000000', '431300000000', '0,430000000000,431300000000', '双峰县', 3, 0);
INSERT INTO `sys_area` VALUES ('431322000000', '431300000000', '0,430000000000,431300000000', '新化县', 3, 0);
INSERT INTO `sys_area` VALUES ('431381000000', '431300000000', '0,430000000000,431300000000', '冷水江市', 3, 0);
INSERT INTO `sys_area` VALUES ('431382000000', '431300000000', '0,430000000000,431300000000', '涟源市', 3, 0);
INSERT INTO `sys_area` VALUES ('433100000000', '430000000000', '0,430000000000', '湘西土家族苗族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('433101000000', '433100000000', '0,430000000000,433100000000', '吉首市', 3, 0);
INSERT INTO `sys_area` VALUES ('433122000000', '433100000000', '0,430000000000,433100000000', '泸溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('433123000000', '433100000000', '0,430000000000,433100000000', '凤凰县', 3, 0);
INSERT INTO `sys_area` VALUES ('433124000000', '433100000000', '0,430000000000,433100000000', '花垣县', 3, 0);
INSERT INTO `sys_area` VALUES ('433125000000', '433100000000', '0,430000000000,433100000000', '保靖县', 3, 0);
INSERT INTO `sys_area` VALUES ('433126000000', '433100000000', '0,430000000000,433100000000', '古丈县', 3, 0);
INSERT INTO `sys_area` VALUES ('433127000000', '433100000000', '0,430000000000,433100000000', '永顺县', 3, 0);
INSERT INTO `sys_area` VALUES ('433130000000', '433100000000', '0,430000000000,433100000000', '龙山县', 3, 0);
INSERT INTO `sys_area` VALUES ('440000000000', '100000000000', '0,', '广东省', 1, 0);
INSERT INTO `sys_area` VALUES ('440100000000', '440000000000', '0,440000000000', '广州市', 2, 0);
INSERT INTO `sys_area` VALUES ('440103000000', '440100000000', '0,440000000000,440100000000', '荔湾区', 3, 0);
INSERT INTO `sys_area` VALUES ('440104000000', '440100000000', '0,440000000000,440100000000', '越秀区', 3, 0);
INSERT INTO `sys_area` VALUES ('440105000000', '440100000000', '0,440000000000,440100000000', '海珠区', 3, 0);
INSERT INTO `sys_area` VALUES ('440106000000', '440100000000', '0,440000000000,440100000000', '天河区', 3, 0);
INSERT INTO `sys_area` VALUES ('440111000000', '440100000000', '0,440000000000,440100000000', '白云区', 3, 0);
INSERT INTO `sys_area` VALUES ('440112000000', '440100000000', '0,440000000000,440100000000', '黄埔区', 3, 0);
INSERT INTO `sys_area` VALUES ('440113000000', '440100000000', '0,440000000000,440100000000', '番禺区', 3, 0);
INSERT INTO `sys_area` VALUES ('440114000000', '440100000000', '0,440000000000,440100000000', '花都区', 3, 0);
INSERT INTO `sys_area` VALUES ('440115000000', '440100000000', '0,440000000000,440100000000', '南沙区', 3, 0);
INSERT INTO `sys_area` VALUES ('440117000000', '440100000000', '0,440000000000,440100000000', '从化区', 3, 0);
INSERT INTO `sys_area` VALUES ('440118000000', '440100000000', '0,440000000000,440100000000', '增城区', 3, 0);
INSERT INTO `sys_area` VALUES ('440200000000', '440000000000', '0,440000000000', '韶关市', 2, 0);
INSERT INTO `sys_area` VALUES ('440203000000', '440200000000', '0,440000000000,440200000000', '武江区', 3, 0);
INSERT INTO `sys_area` VALUES ('440204000000', '440200000000', '0,440000000000,440200000000', '浈江区', 3, 0);
INSERT INTO `sys_area` VALUES ('440205000000', '440200000000', '0,440000000000,440200000000', '曲江区', 3, 0);
INSERT INTO `sys_area` VALUES ('440222000000', '440200000000', '0,440000000000,440200000000', '始兴县', 3, 0);
INSERT INTO `sys_area` VALUES ('440224000000', '440200000000', '0,440000000000,440200000000', '仁化县', 3, 0);
INSERT INTO `sys_area` VALUES ('440229000000', '440200000000', '0,440000000000,440200000000', '翁源县', 3, 0);
INSERT INTO `sys_area` VALUES ('440232000000', '440200000000', '0,440000000000,440200000000', '乳源瑶族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('440233000000', '440200000000', '0,440000000000,440200000000', '新丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('440281000000', '440200000000', '0,440000000000,440200000000', '乐昌市', 3, 0);
INSERT INTO `sys_area` VALUES ('440282000000', '440200000000', '0,440000000000,440200000000', '南雄市', 3, 0);
INSERT INTO `sys_area` VALUES ('440300000000', '440000000000', '0,440000000000', '深圳市', 2, 0);
INSERT INTO `sys_area` VALUES ('440303000000', '440300000000', '0,440000000000,440300000000', '罗湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('440304000000', '440300000000', '0,440000000000,440300000000', '福田区', 3, 0);
INSERT INTO `sys_area` VALUES ('440305000000', '440300000000', '0,440000000000,440300000000', '南山区', 3, 0);
INSERT INTO `sys_area` VALUES ('440306000000', '440300000000', '0,440000000000,440300000000', '宝安区', 3, 0);
INSERT INTO `sys_area` VALUES ('440307000000', '440300000000', '0,440000000000,440300000000', '龙岗区', 3, 0);
INSERT INTO `sys_area` VALUES ('440308000000', '440300000000', '0,440000000000,440300000000', '盐田区', 3, 0);
INSERT INTO `sys_area` VALUES ('440400000000', '440000000000', '0,440000000000', '珠海市', 2, 0);
INSERT INTO `sys_area` VALUES ('440402000000', '440400000000', '0,440000000000,440400000000', '香洲区', 3, 0);
INSERT INTO `sys_area` VALUES ('440403000000', '440400000000', '0,440000000000,440400000000', '斗门区', 3, 0);
INSERT INTO `sys_area` VALUES ('440404000000', '440400000000', '0,440000000000,440400000000', '金湾区', 3, 0);
INSERT INTO `sys_area` VALUES ('440500000000', '440000000000', '0,440000000000', '汕头市', 2, 0);
INSERT INTO `sys_area` VALUES ('440507000000', '440500000000', '0,440000000000,440500000000', '龙湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('440511000000', '440500000000', '0,440000000000,440500000000', '金平区', 3, 0);
INSERT INTO `sys_area` VALUES ('440512000000', '440500000000', '0,440000000000,440500000000', '濠江区', 3, 0);
INSERT INTO `sys_area` VALUES ('440513000000', '440500000000', '0,440000000000,440500000000', '潮阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('440514000000', '440500000000', '0,440000000000,440500000000', '潮南区', 3, 0);
INSERT INTO `sys_area` VALUES ('440515000000', '440500000000', '0,440000000000,440500000000', '澄海区', 3, 0);
INSERT INTO `sys_area` VALUES ('440523000000', '440500000000', '0,440000000000,440500000000', '南澳县', 3, 0);
INSERT INTO `sys_area` VALUES ('440600000000', '440000000000', '0,440000000000', '佛山市', 2, 0);
INSERT INTO `sys_area` VALUES ('440604000000', '440600000000', '0,440000000000,440600000000', '禅城区', 3, 0);
INSERT INTO `sys_area` VALUES ('440605000000', '440600000000', '0,440000000000,440600000000', '南海区', 3, 0);
INSERT INTO `sys_area` VALUES ('440606000000', '440600000000', '0,440000000000,440600000000', '顺德区', 3, 0);
INSERT INTO `sys_area` VALUES ('440607000000', '440600000000', '0,440000000000,440600000000', '三水区', 3, 0);
INSERT INTO `sys_area` VALUES ('440608000000', '440600000000', '0,440000000000,440600000000', '高明区', 3, 0);
INSERT INTO `sys_area` VALUES ('440700000000', '440000000000', '0,440000000000', '江门市', 2, 0);
INSERT INTO `sys_area` VALUES ('440703000000', '440700000000', '0,440000000000,440700000000', '蓬江区', 3, 0);
INSERT INTO `sys_area` VALUES ('440704000000', '440700000000', '0,440000000000,440700000000', '江海区', 3, 0);
INSERT INTO `sys_area` VALUES ('440705000000', '440700000000', '0,440000000000,440700000000', '新会区', 3, 0);
INSERT INTO `sys_area` VALUES ('440781000000', '440700000000', '0,440000000000,440700000000', '台山市', 3, 0);
INSERT INTO `sys_area` VALUES ('440783000000', '440700000000', '0,440000000000,440700000000', '开平市', 3, 0);
INSERT INTO `sys_area` VALUES ('440784000000', '440700000000', '0,440000000000,440700000000', '鹤山市', 3, 0);
INSERT INTO `sys_area` VALUES ('440785000000', '440700000000', '0,440000000000,440700000000', '恩平市', 3, 0);
INSERT INTO `sys_area` VALUES ('440800000000', '440000000000', '0,440000000000', '湛江市', 2, 0);
INSERT INTO `sys_area` VALUES ('440802000000', '440800000000', '0,440000000000,440800000000', '赤坎区', 3, 0);
INSERT INTO `sys_area` VALUES ('440803000000', '440800000000', '0,440000000000,440800000000', '霞山区', 3, 0);
INSERT INTO `sys_area` VALUES ('440804000000', '440800000000', '0,440000000000,440800000000', '坡头区', 3, 0);
INSERT INTO `sys_area` VALUES ('440811000000', '440800000000', '0,440000000000,440800000000', '麻章区', 3, 0);
INSERT INTO `sys_area` VALUES ('440823000000', '440800000000', '0,440000000000,440800000000', '遂溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('440825000000', '440800000000', '0,440000000000,440800000000', '徐闻县', 3, 0);
INSERT INTO `sys_area` VALUES ('440881000000', '440800000000', '0,440000000000,440800000000', '廉江市', 3, 0);
INSERT INTO `sys_area` VALUES ('440882000000', '440800000000', '0,440000000000,440800000000', '雷州市', 3, 0);
INSERT INTO `sys_area` VALUES ('440883000000', '440800000000', '0,440000000000,440800000000', '吴川市', 3, 0);
INSERT INTO `sys_area` VALUES ('440900000000', '440000000000', '0,440000000000', '茂名市', 2, 0);
INSERT INTO `sys_area` VALUES ('440902000000', '440900000000', '0,440000000000,440900000000', '茂南区', 3, 0);
INSERT INTO `sys_area` VALUES ('440904000000', '440900000000', '0,440000000000,440900000000', '电白区', 3, 0);
INSERT INTO `sys_area` VALUES ('440981000000', '440900000000', '0,440000000000,440900000000', '高州市', 3, 0);
INSERT INTO `sys_area` VALUES ('440982000000', '440900000000', '0,440000000000,440900000000', '化州市', 3, 0);
INSERT INTO `sys_area` VALUES ('440983000000', '440900000000', '0,440000000000,440900000000', '信宜市', 3, 0);
INSERT INTO `sys_area` VALUES ('441200000000', '440000000000', '0,440000000000', '肇庆市', 2, 0);
INSERT INTO `sys_area` VALUES ('441202000000', '441200000000', '0,440000000000,441200000000', '端州区', 3, 0);
INSERT INTO `sys_area` VALUES ('441203000000', '441200000000', '0,440000000000,441200000000', '鼎湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('441204000000', '441200000000', '0,440000000000,441200000000', '高要区', 3, 0);
INSERT INTO `sys_area` VALUES ('441223000000', '441200000000', '0,440000000000,441200000000', '广宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('441224000000', '441200000000', '0,440000000000,441200000000', '怀集县', 3, 0);
INSERT INTO `sys_area` VALUES ('441225000000', '441200000000', '0,440000000000,441200000000', '封开县', 3, 0);
INSERT INTO `sys_area` VALUES ('441226000000', '441200000000', '0,440000000000,441200000000', '德庆县', 3, 0);
INSERT INTO `sys_area` VALUES ('441284000000', '441200000000', '0,440000000000,441200000000', '四会市', 3, 0);
INSERT INTO `sys_area` VALUES ('441300000000', '440000000000', '0,440000000000', '惠州市', 2, 0);
INSERT INTO `sys_area` VALUES ('441302000000', '441300000000', '0,440000000000,441300000000', '惠城区', 3, 0);
INSERT INTO `sys_area` VALUES ('441303000000', '441300000000', '0,440000000000,441300000000', '惠阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('441322000000', '441300000000', '0,440000000000,441300000000', '博罗县', 3, 0);
INSERT INTO `sys_area` VALUES ('441323000000', '441300000000', '0,440000000000,441300000000', '惠东县', 3, 0);
INSERT INTO `sys_area` VALUES ('441324000000', '441300000000', '0,440000000000,441300000000', '龙门县', 3, 0);
INSERT INTO `sys_area` VALUES ('441400000000', '440000000000', '0,440000000000', '梅州市', 2, 0);
INSERT INTO `sys_area` VALUES ('441402000000', '441400000000', '0,440000000000,441400000000', '梅江区', 3, 0);
INSERT INTO `sys_area` VALUES ('441403000000', '441400000000', '0,440000000000,441400000000', '梅县区', 3, 0);
INSERT INTO `sys_area` VALUES ('441422000000', '441400000000', '0,440000000000,441400000000', '大埔县', 3, 0);
INSERT INTO `sys_area` VALUES ('441423000000', '441400000000', '0,440000000000,441400000000', '丰顺县', 3, 0);
INSERT INTO `sys_area` VALUES ('441424000000', '441400000000', '0,440000000000,441400000000', '五华县', 3, 0);
INSERT INTO `sys_area` VALUES ('441426000000', '441400000000', '0,440000000000,441400000000', '平远县', 3, 0);
INSERT INTO `sys_area` VALUES ('441427000000', '441400000000', '0,440000000000,441400000000', '蕉岭县', 3, 0);
INSERT INTO `sys_area` VALUES ('441481000000', '441400000000', '0,440000000000,441400000000', '兴宁市', 3, 0);
INSERT INTO `sys_area` VALUES ('441500000000', '440000000000', '0,440000000000', '汕尾市', 2, 0);
INSERT INTO `sys_area` VALUES ('441502000000', '441500000000', '0,440000000000,441500000000', '城区', 3, 0);
INSERT INTO `sys_area` VALUES ('441521000000', '441500000000', '0,440000000000,441500000000', '海丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('441523000000', '441500000000', '0,440000000000,441500000000', '陆河县', 3, 0);
INSERT INTO `sys_area` VALUES ('441581000000', '441500000000', '0,440000000000,441500000000', '陆丰市', 3, 0);
INSERT INTO `sys_area` VALUES ('441600000000', '440000000000', '0,440000000000', '河源市', 2, 0);
INSERT INTO `sys_area` VALUES ('441602000000', '441600000000', '0,440000000000,441600000000', '源城区', 3, 0);
INSERT INTO `sys_area` VALUES ('441621000000', '441600000000', '0,440000000000,441600000000', '紫金县', 3, 0);
INSERT INTO `sys_area` VALUES ('441622000000', '441600000000', '0,440000000000,441600000000', '龙川县', 3, 0);
INSERT INTO `sys_area` VALUES ('441623000000', '441600000000', '0,440000000000,441600000000', '连平县', 3, 0);
INSERT INTO `sys_area` VALUES ('441624000000', '441600000000', '0,440000000000,441600000000', '和平县', 3, 0);
INSERT INTO `sys_area` VALUES ('441625000000', '441600000000', '0,440000000000,441600000000', '东源县', 3, 0);
INSERT INTO `sys_area` VALUES ('441700000000', '440000000000', '0,440000000000', '阳江市', 2, 0);
INSERT INTO `sys_area` VALUES ('441702000000', '441700000000', '0,440000000000,441700000000', '江城区', 3, 0);
INSERT INTO `sys_area` VALUES ('441704000000', '441700000000', '0,440000000000,441700000000', '阳东区', 3, 0);
INSERT INTO `sys_area` VALUES ('441721000000', '441700000000', '0,440000000000,441700000000', '阳西县', 3, 0);
INSERT INTO `sys_area` VALUES ('441781000000', '441700000000', '0,440000000000,441700000000', '阳春市', 3, 0);
INSERT INTO `sys_area` VALUES ('441800000000', '440000000000', '0,440000000000', '清远市', 2, 0);
INSERT INTO `sys_area` VALUES ('441802000000', '441800000000', '0,440000000000,441800000000', '清城区', 3, 0);
INSERT INTO `sys_area` VALUES ('441803000000', '441800000000', '0,440000000000,441800000000', '清新区', 3, 0);
INSERT INTO `sys_area` VALUES ('441821000000', '441800000000', '0,440000000000,441800000000', '佛冈县', 3, 0);
INSERT INTO `sys_area` VALUES ('441823000000', '441800000000', '0,440000000000,441800000000', '阳山县', 3, 0);
INSERT INTO `sys_area` VALUES ('441825000000', '441800000000', '0,440000000000,441800000000', '连山壮族瑶族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('441826000000', '441800000000', '0,440000000000,441800000000', '连南瑶族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('441881000000', '441800000000', '0,440000000000,441800000000', '英德市', 3, 0);
INSERT INTO `sys_area` VALUES ('441882000000', '441800000000', '0,440000000000,441800000000', '连州市', 3, 0);
INSERT INTO `sys_area` VALUES ('441900000000', '440000000000', '0,440000000000', '东莞市', 2, 0);
INSERT INTO `sys_area` VALUES ('441900003000', '441900000000', '0,440000000000,441900000000', '东城街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('441900004000', '441900000000', '0,440000000000,441900000000', '南城街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('441900005000', '441900000000', '0,440000000000,441900000000', '万江街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('441900006000', '441900000000', '0,440000000000,441900000000', '莞城街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('441900101000', '441900000000', '0,440000000000,441900000000', '石碣镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900102000', '441900000000', '0,440000000000,441900000000', '石龙镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900103000', '441900000000', '0,440000000000,441900000000', '茶山镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900104000', '441900000000', '0,440000000000,441900000000', '石排镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900105000', '441900000000', '0,440000000000,441900000000', '企石镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900106000', '441900000000', '0,440000000000,441900000000', '横沥镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900107000', '441900000000', '0,440000000000,441900000000', '桥头镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900108000', '441900000000', '0,440000000000,441900000000', '谢岗镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900109000', '441900000000', '0,440000000000,441900000000', '东坑镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900110000', '441900000000', '0,440000000000,441900000000', '常平镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900111000', '441900000000', '0,440000000000,441900000000', '寮步镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900112000', '441900000000', '0,440000000000,441900000000', '樟木头镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900113000', '441900000000', '0,440000000000,441900000000', '大朗镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900114000', '441900000000', '0,440000000000,441900000000', '黄江镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900115000', '441900000000', '0,440000000000,441900000000', '清溪镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900116000', '441900000000', '0,440000000000,441900000000', '塘厦镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900117000', '441900000000', '0,440000000000,441900000000', '凤岗镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900118000', '441900000000', '0,440000000000,441900000000', '大岭山镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900119000', '441900000000', '0,440000000000,441900000000', '长安镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900121000', '441900000000', '0,440000000000,441900000000', '虎门镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900122000', '441900000000', '0,440000000000,441900000000', '厚街镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900123000', '441900000000', '0,440000000000,441900000000', '沙田镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900124000', '441900000000', '0,440000000000,441900000000', '道滘镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900125000', '441900000000', '0,440000000000,441900000000', '洪梅镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900126000', '441900000000', '0,440000000000,441900000000', '麻涌镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900127000', '441900000000', '0,440000000000,441900000000', '望牛墩镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900128000', '441900000000', '0,440000000000,441900000000', '中堂镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900129000', '441900000000', '0,440000000000,441900000000', '高埗镇', 3, 0);
INSERT INTO `sys_area` VALUES ('441900401000', '441900000000', '0,440000000000,441900000000', '松山湖管委会', 3, 0);
INSERT INTO `sys_area` VALUES ('441900402000', '441900000000', '0,440000000000,441900000000', '虎门港管委会', 3, 0);
INSERT INTO `sys_area` VALUES ('441900403000', '441900000000', '0,440000000000,441900000000', '东莞生态园', 3, 0);
INSERT INTO `sys_area` VALUES ('442000000000', '440000000000', '0,440000000000', '中山市', 2, 0);
INSERT INTO `sys_area` VALUES ('442000001000', '442000000000', '0,440000000000,442000000000', '石岐区街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('442000002000', '442000000000', '0,440000000000,442000000000', '东区街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('442000003000', '442000000000', '0,440000000000,442000000000', '火炬开发区街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('442000004000', '442000000000', '0,440000000000,442000000000', '西区街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('442000005000', '442000000000', '0,440000000000,442000000000', '南区街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('442000006000', '442000000000', '0,440000000000,442000000000', '五桂山街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('442000100000', '442000000000', '0,440000000000,442000000000', '小榄镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000101000', '442000000000', '0,440000000000,442000000000', '黄圃镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000102000', '442000000000', '0,440000000000,442000000000', '民众镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000103000', '442000000000', '0,440000000000,442000000000', '东凤镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000104000', '442000000000', '0,440000000000,442000000000', '东升镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000105000', '442000000000', '0,440000000000,442000000000', '古镇镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000106000', '442000000000', '0,440000000000,442000000000', '沙溪镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000107000', '442000000000', '0,440000000000,442000000000', '坦洲镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000108000', '442000000000', '0,440000000000,442000000000', '港口镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000109000', '442000000000', '0,440000000000,442000000000', '三角镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000110000', '442000000000', '0,440000000000,442000000000', '横栏镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000111000', '442000000000', '0,440000000000,442000000000', '南头镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000112000', '442000000000', '0,440000000000,442000000000', '阜沙镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000113000', '442000000000', '0,440000000000,442000000000', '南朗镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000114000', '442000000000', '0,440000000000,442000000000', '三乡镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000115000', '442000000000', '0,440000000000,442000000000', '板芙镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000116000', '442000000000', '0,440000000000,442000000000', '大涌镇', 3, 0);
INSERT INTO `sys_area` VALUES ('442000117000', '442000000000', '0,440000000000,442000000000', '神湾镇', 3, 0);
INSERT INTO `sys_area` VALUES ('445100000000', '440000000000', '0,440000000000', '潮州市', 2, 0);
INSERT INTO `sys_area` VALUES ('445102000000', '445100000000', '0,440000000000,445100000000', '湘桥区', 3, 0);
INSERT INTO `sys_area` VALUES ('445103000000', '445100000000', '0,440000000000,445100000000', '潮安区', 3, 0);
INSERT INTO `sys_area` VALUES ('445122000000', '445100000000', '0,440000000000,445100000000', '饶平县', 3, 0);
INSERT INTO `sys_area` VALUES ('445200000000', '440000000000', '0,440000000000', '揭阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('445202000000', '445200000000', '0,440000000000,445200000000', '榕城区', 3, 0);
INSERT INTO `sys_area` VALUES ('445203000000', '445200000000', '0,440000000000,445200000000', '揭东区', 3, 0);
INSERT INTO `sys_area` VALUES ('445222000000', '445200000000', '0,440000000000,445200000000', '揭西县', 3, 0);
INSERT INTO `sys_area` VALUES ('445224000000', '445200000000', '0,440000000000,445200000000', '惠来县', 3, 0);
INSERT INTO `sys_area` VALUES ('445281000000', '445200000000', '0,440000000000,445200000000', '普宁市', 3, 0);
INSERT INTO `sys_area` VALUES ('445300000000', '440000000000', '0,440000000000', '云浮市', 2, 0);
INSERT INTO `sys_area` VALUES ('445302000000', '445300000000', '0,440000000000,445300000000', '云城区', 3, 0);
INSERT INTO `sys_area` VALUES ('445303000000', '445300000000', '0,440000000000,445300000000', '云安区', 3, 0);
INSERT INTO `sys_area` VALUES ('445321000000', '445300000000', '0,440000000000,445300000000', '新兴县', 3, 0);
INSERT INTO `sys_area` VALUES ('445322000000', '445300000000', '0,440000000000,445300000000', '郁南县', 3, 0);
INSERT INTO `sys_area` VALUES ('445381000000', '445300000000', '0,440000000000,445300000000', '罗定市', 3, 0);
INSERT INTO `sys_area` VALUES ('450000000000', '100000000000', '0,', '广西壮族自治区', 1, 0);
INSERT INTO `sys_area` VALUES ('450100000000', '450000000000', '0,450000000000', '南宁市', 2, 0);
INSERT INTO `sys_area` VALUES ('450102000000', '450100000000', '0,450000000000,450100000000', '兴宁区', 3, 0);
INSERT INTO `sys_area` VALUES ('450103000000', '450100000000', '0,450000000000,450100000000', '青秀区', 3, 0);
INSERT INTO `sys_area` VALUES ('450105000000', '450100000000', '0,450000000000,450100000000', '江南区', 3, 0);
INSERT INTO `sys_area` VALUES ('450107000000', '450100000000', '0,450000000000,450100000000', '西乡塘区', 3, 0);
INSERT INTO `sys_area` VALUES ('450108000000', '450100000000', '0,450000000000,450100000000', '良庆区', 3, 0);
INSERT INTO `sys_area` VALUES ('450109000000', '450100000000', '0,450000000000,450100000000', '邕宁区', 3, 0);
INSERT INTO `sys_area` VALUES ('450110000000', '450100000000', '0,450000000000,450100000000', '武鸣区', 3, 0);
INSERT INTO `sys_area` VALUES ('450123000000', '450100000000', '0,450000000000,450100000000', '隆安县', 3, 0);
INSERT INTO `sys_area` VALUES ('450124000000', '450100000000', '0,450000000000,450100000000', '马山县', 3, 0);
INSERT INTO `sys_area` VALUES ('450125000000', '450100000000', '0,450000000000,450100000000', '上林县', 3, 0);
INSERT INTO `sys_area` VALUES ('450126000000', '450100000000', '0,450000000000,450100000000', '宾阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('450127000000', '450100000000', '0,450000000000,450100000000', '横县', 3, 0);
INSERT INTO `sys_area` VALUES ('450200000000', '450000000000', '0,450000000000', '柳州市', 2, 0);
INSERT INTO `sys_area` VALUES ('450202000000', '450200000000', '0,450000000000,450200000000', '城中区', 3, 0);
INSERT INTO `sys_area` VALUES ('450203000000', '450200000000', '0,450000000000,450200000000', '鱼峰区', 3, 0);
INSERT INTO `sys_area` VALUES ('450204000000', '450200000000', '0,450000000000,450200000000', '柳南区', 3, 0);
INSERT INTO `sys_area` VALUES ('450205000000', '450200000000', '0,450000000000,450200000000', '柳北区', 3, 0);
INSERT INTO `sys_area` VALUES ('450221000000', '450200000000', '0,450000000000,450200000000', '柳江县', 3, 0);
INSERT INTO `sys_area` VALUES ('450222000000', '450200000000', '0,450000000000,450200000000', '柳城县', 3, 0);
INSERT INTO `sys_area` VALUES ('450223000000', '450200000000', '0,450000000000,450200000000', '鹿寨县', 3, 0);
INSERT INTO `sys_area` VALUES ('450224000000', '450200000000', '0,450000000000,450200000000', '融安县', 3, 0);
INSERT INTO `sys_area` VALUES ('450225000000', '450200000000', '0,450000000000,450200000000', '融水苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('450226000000', '450200000000', '0,450000000000,450200000000', '三江侗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('450300000000', '450000000000', '0,450000000000', '桂林市', 2, 0);
INSERT INTO `sys_area` VALUES ('450302000000', '450300000000', '0,450000000000,450300000000', '秀峰区', 3, 0);
INSERT INTO `sys_area` VALUES ('450303000000', '450300000000', '0,450000000000,450300000000', '叠彩区', 3, 0);
INSERT INTO `sys_area` VALUES ('450304000000', '450300000000', '0,450000000000,450300000000', '象山区', 3, 0);
INSERT INTO `sys_area` VALUES ('450305000000', '450300000000', '0,450000000000,450300000000', '七星区', 3, 0);
INSERT INTO `sys_area` VALUES ('450311000000', '450300000000', '0,450000000000,450300000000', '雁山区', 3, 0);
INSERT INTO `sys_area` VALUES ('450312000000', '450300000000', '0,450000000000,450300000000', '临桂区', 3, 0);
INSERT INTO `sys_area` VALUES ('450321000000', '450300000000', '0,450000000000,450300000000', '阳朔县', 3, 0);
INSERT INTO `sys_area` VALUES ('450323000000', '450300000000', '0,450000000000,450300000000', '灵川县', 3, 0);
INSERT INTO `sys_area` VALUES ('450324000000', '450300000000', '0,450000000000,450300000000', '全州县', 3, 0);
INSERT INTO `sys_area` VALUES ('450325000000', '450300000000', '0,450000000000,450300000000', '兴安县', 3, 0);
INSERT INTO `sys_area` VALUES ('450326000000', '450300000000', '0,450000000000,450300000000', '永福县', 3, 0);
INSERT INTO `sys_area` VALUES ('450327000000', '450300000000', '0,450000000000,450300000000', '灌阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('450328000000', '450300000000', '0,450000000000,450300000000', '龙胜各族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('450329000000', '450300000000', '0,450000000000,450300000000', '资源县', 3, 0);
INSERT INTO `sys_area` VALUES ('450330000000', '450300000000', '0,450000000000,450300000000', '平乐县', 3, 0);
INSERT INTO `sys_area` VALUES ('450331000000', '450300000000', '0,450000000000,450300000000', '荔浦县', 3, 0);
INSERT INTO `sys_area` VALUES ('450332000000', '450300000000', '0,450000000000,450300000000', '恭城瑶族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('450400000000', '450000000000', '0,450000000000', '梧州市', 2, 0);
INSERT INTO `sys_area` VALUES ('450403000000', '450400000000', '0,450000000000,450400000000', '万秀区', 3, 0);
INSERT INTO `sys_area` VALUES ('450405000000', '450400000000', '0,450000000000,450400000000', '长洲区', 3, 0);
INSERT INTO `sys_area` VALUES ('450406000000', '450400000000', '0,450000000000,450400000000', '龙圩区', 3, 0);
INSERT INTO `sys_area` VALUES ('450421000000', '450400000000', '0,450000000000,450400000000', '苍梧县', 3, 0);
INSERT INTO `sys_area` VALUES ('450422000000', '450400000000', '0,450000000000,450400000000', '藤县', 3, 0);
INSERT INTO `sys_area` VALUES ('450423000000', '450400000000', '0,450000000000,450400000000', '蒙山县', 3, 0);
INSERT INTO `sys_area` VALUES ('450481000000', '450400000000', '0,450000000000,450400000000', '岑溪市', 3, 0);
INSERT INTO `sys_area` VALUES ('450500000000', '450000000000', '0,450000000000', '北海市', 2, 0);
INSERT INTO `sys_area` VALUES ('450502000000', '450500000000', '0,450000000000,450500000000', '海城区', 3, 0);
INSERT INTO `sys_area` VALUES ('450503000000', '450500000000', '0,450000000000,450500000000', '银海区', 3, 0);
INSERT INTO `sys_area` VALUES ('450512000000', '450500000000', '0,450000000000,450500000000', '铁山港区', 3, 0);
INSERT INTO `sys_area` VALUES ('450521000000', '450500000000', '0,450000000000,450500000000', '合浦县', 3, 0);
INSERT INTO `sys_area` VALUES ('450600000000', '450000000000', '0,450000000000', '防城港市', 2, 0);
INSERT INTO `sys_area` VALUES ('450602000000', '450600000000', '0,450000000000,450600000000', '港口区', 3, 0);
INSERT INTO `sys_area` VALUES ('450603000000', '450600000000', '0,450000000000,450600000000', '防城区', 3, 0);
INSERT INTO `sys_area` VALUES ('450621000000', '450600000000', '0,450000000000,450600000000', '上思县', 3, 0);
INSERT INTO `sys_area` VALUES ('450681000000', '450600000000', '0,450000000000,450600000000', '东兴市', 3, 0);
INSERT INTO `sys_area` VALUES ('450700000000', '450000000000', '0,450000000000', '钦州市', 2, 0);
INSERT INTO `sys_area` VALUES ('450702000000', '450700000000', '0,450000000000,450700000000', '钦南区', 3, 0);
INSERT INTO `sys_area` VALUES ('450703000000', '450700000000', '0,450000000000,450700000000', '钦北区', 3, 0);
INSERT INTO `sys_area` VALUES ('450721000000', '450700000000', '0,450000000000,450700000000', '灵山县', 3, 0);
INSERT INTO `sys_area` VALUES ('450722000000', '450700000000', '0,450000000000,450700000000', '浦北县', 3, 0);
INSERT INTO `sys_area` VALUES ('450800000000', '450000000000', '0,450000000000', '贵港市', 2, 0);
INSERT INTO `sys_area` VALUES ('450802000000', '450800000000', '0,450000000000,450800000000', '港北区', 3, 0);
INSERT INTO `sys_area` VALUES ('450803000000', '450800000000', '0,450000000000,450800000000', '港南区', 3, 0);
INSERT INTO `sys_area` VALUES ('450804000000', '450800000000', '0,450000000000,450800000000', '覃塘区', 3, 0);
INSERT INTO `sys_area` VALUES ('450821000000', '450800000000', '0,450000000000,450800000000', '平南县', 3, 0);
INSERT INTO `sys_area` VALUES ('450881000000', '450800000000', '0,450000000000,450800000000', '桂平市', 3, 0);
INSERT INTO `sys_area` VALUES ('450900000000', '450000000000', '0,450000000000', '玉林市', 2, 0);
INSERT INTO `sys_area` VALUES ('450902000000', '450900000000', '0,450000000000,450900000000', '玉州区', 3, 0);
INSERT INTO `sys_area` VALUES ('450903000000', '450900000000', '0,450000000000,450900000000', '福绵区', 3, 0);
INSERT INTO `sys_area` VALUES ('450921000000', '450900000000', '0,450000000000,450900000000', '容县', 3, 0);
INSERT INTO `sys_area` VALUES ('450922000000', '450900000000', '0,450000000000,450900000000', '陆川县', 3, 0);
INSERT INTO `sys_area` VALUES ('450923000000', '450900000000', '0,450000000000,450900000000', '博白县', 3, 0);
INSERT INTO `sys_area` VALUES ('450924000000', '450900000000', '0,450000000000,450900000000', '兴业县', 3, 0);
INSERT INTO `sys_area` VALUES ('450981000000', '450900000000', '0,450000000000,450900000000', '北流市', 3, 0);
INSERT INTO `sys_area` VALUES ('451000000000', '450000000000', '0,450000000000', '百色市', 2, 0);
INSERT INTO `sys_area` VALUES ('451002000000', '451000000000', '0,450000000000,451000000000', '右江区', 3, 0);
INSERT INTO `sys_area` VALUES ('451021000000', '451000000000', '0,450000000000,451000000000', '田阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('451022000000', '451000000000', '0,450000000000,451000000000', '田东县', 3, 0);
INSERT INTO `sys_area` VALUES ('451023000000', '451000000000', '0,450000000000,451000000000', '平果县', 3, 0);
INSERT INTO `sys_area` VALUES ('451024000000', '451000000000', '0,450000000000,451000000000', '德保县', 3, 0);
INSERT INTO `sys_area` VALUES ('451026000000', '451000000000', '0,450000000000,451000000000', '那坡县', 3, 0);
INSERT INTO `sys_area` VALUES ('451027000000', '451000000000', '0,450000000000,451000000000', '凌云县', 3, 0);
INSERT INTO `sys_area` VALUES ('451028000000', '451000000000', '0,450000000000,451000000000', '乐业县', 3, 0);
INSERT INTO `sys_area` VALUES ('451029000000', '451000000000', '0,450000000000,451000000000', '田林县', 3, 0);
INSERT INTO `sys_area` VALUES ('451030000000', '451000000000', '0,450000000000,451000000000', '西林县', 3, 0);
INSERT INTO `sys_area` VALUES ('451031000000', '451000000000', '0,450000000000,451000000000', '隆林各族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('451081000000', '451000000000', '0,450000000000,451000000000', '靖西市', 3, 0);
INSERT INTO `sys_area` VALUES ('451100000000', '450000000000', '0,450000000000', '贺州市', 2, 0);
INSERT INTO `sys_area` VALUES ('451102000000', '451100000000', '0,450000000000,451100000000', '八步区', 3, 0);
INSERT INTO `sys_area` VALUES ('451121000000', '451100000000', '0,450000000000,451100000000', '昭平县', 3, 0);
INSERT INTO `sys_area` VALUES ('451122000000', '451100000000', '0,450000000000,451100000000', '钟山县', 3, 0);
INSERT INTO `sys_area` VALUES ('451123000000', '451100000000', '0,450000000000,451100000000', '富川瑶族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('451200000000', '450000000000', '0,450000000000', '河池市', 2, 0);
INSERT INTO `sys_area` VALUES ('451202000000', '451200000000', '0,450000000000,451200000000', '金城江区', 3, 0);
INSERT INTO `sys_area` VALUES ('451221000000', '451200000000', '0,450000000000,451200000000', '南丹县', 3, 0);
INSERT INTO `sys_area` VALUES ('451222000000', '451200000000', '0,450000000000,451200000000', '天峨县', 3, 0);
INSERT INTO `sys_area` VALUES ('451223000000', '451200000000', '0,450000000000,451200000000', '凤山县', 3, 0);
INSERT INTO `sys_area` VALUES ('451224000000', '451200000000', '0,450000000000,451200000000', '东兰县', 3, 0);
INSERT INTO `sys_area` VALUES ('451225000000', '451200000000', '0,450000000000,451200000000', '罗城仫佬族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('451226000000', '451200000000', '0,450000000000,451200000000', '环江毛南族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('451227000000', '451200000000', '0,450000000000,451200000000', '巴马瑶族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('451228000000', '451200000000', '0,450000000000,451200000000', '都安瑶族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('451229000000', '451200000000', '0,450000000000,451200000000', '大化瑶族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('451281000000', '451200000000', '0,450000000000,451200000000', '宜州市', 3, 0);
INSERT INTO `sys_area` VALUES ('451300000000', '450000000000', '0,450000000000', '来宾市', 2, 0);
INSERT INTO `sys_area` VALUES ('451302000000', '451300000000', '0,450000000000,451300000000', '兴宾区', 3, 0);
INSERT INTO `sys_area` VALUES ('451321000000', '451300000000', '0,450000000000,451300000000', '忻城县', 3, 0);
INSERT INTO `sys_area` VALUES ('451322000000', '451300000000', '0,450000000000,451300000000', '象州县', 3, 0);
INSERT INTO `sys_area` VALUES ('451323000000', '451300000000', '0,450000000000,451300000000', '武宣县', 3, 0);
INSERT INTO `sys_area` VALUES ('451324000000', '451300000000', '0,450000000000,451300000000', '金秀瑶族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('451381000000', '451300000000', '0,450000000000,451300000000', '合山市', 3, 0);
INSERT INTO `sys_area` VALUES ('451400000000', '450000000000', '0,450000000000', '崇左市', 2, 0);
INSERT INTO `sys_area` VALUES ('451402000000', '451400000000', '0,450000000000,451400000000', '江州区', 3, 0);
INSERT INTO `sys_area` VALUES ('451421000000', '451400000000', '0,450000000000,451400000000', '扶绥县', 3, 0);
INSERT INTO `sys_area` VALUES ('451422000000', '451400000000', '0,450000000000,451400000000', '宁明县', 3, 0);
INSERT INTO `sys_area` VALUES ('451423000000', '451400000000', '0,450000000000,451400000000', '龙州县', 3, 0);
INSERT INTO `sys_area` VALUES ('451424000000', '451400000000', '0,450000000000,451400000000', '大新县', 3, 0);
INSERT INTO `sys_area` VALUES ('451425000000', '451400000000', '0,450000000000,451400000000', '天等县', 3, 0);
INSERT INTO `sys_area` VALUES ('451481000000', '451400000000', '0,450000000000,451400000000', '凭祥市', 3, 0);
INSERT INTO `sys_area` VALUES ('460000000000', '100000000000', '0,', '海南省', 1, 0);
INSERT INTO `sys_area` VALUES ('460100000000', '460000000000', '0,460000000000', '海口市', 2, 0);
INSERT INTO `sys_area` VALUES ('460105000000', '460100000000', '0,460000000000,460100000000', '秀英区', 3, 0);
INSERT INTO `sys_area` VALUES ('460106000000', '460100000000', '0,460000000000,460100000000', '龙华区', 3, 0);
INSERT INTO `sys_area` VALUES ('460107000000', '460100000000', '0,460000000000,460100000000', '琼山区', 3, 0);
INSERT INTO `sys_area` VALUES ('460108000000', '460100000000', '0,460000000000,460100000000', '美兰区', 3, 0);
INSERT INTO `sys_area` VALUES ('460200000000', '460000000000', '0,460000000000', '三亚市', 2, 0);
INSERT INTO `sys_area` VALUES ('460202000000', '460200000000', '0,460000000000,460200000000', '海棠区', 3, 0);
INSERT INTO `sys_area` VALUES ('460203000000', '460200000000', '0,460000000000,460200000000', '吉阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('460204000000', '460200000000', '0,460000000000,460200000000', '天涯区', 3, 0);
INSERT INTO `sys_area` VALUES ('460205000000', '460200000000', '0,460000000000,460200000000', '崖州区', 3, 0);
INSERT INTO `sys_area` VALUES ('460300000000', '460000000000', '0,460000000000', '三沙市', 2, 0);
INSERT INTO `sys_area` VALUES ('460321000000', '460300000000', '0,460000000000,460300000000', '西沙群岛', 3, 0);
INSERT INTO `sys_area` VALUES ('460322000000', '460300000000', '0,460000000000,460300000000', '南沙群岛', 3, 0);
INSERT INTO `sys_area` VALUES ('460323000000', '460300000000', '0,460000000000,460300000000', '中沙群岛的岛礁及其海域', 3, 0);
INSERT INTO `sys_area` VALUES ('469001000000', '460000000000', '0,460000000000', '五指山市', 2, 0);
INSERT INTO `sys_area` VALUES ('469001100000', '469001000000', '0,460000000000,469001000000', '通什镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469001101000', '469001000000', '0,460000000000,469001000000', '南圣镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469001102000', '469001000000', '0,460000000000,469001000000', '毛阳镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469001103000', '469001000000', '0,460000000000,469001000000', '番阳镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469001200000', '469001000000', '0,460000000000,469001000000', '畅好乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469001201000', '469001000000', '0,460000000000,469001000000', '毛道乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469001202000', '469001000000', '0,460000000000,469001000000', '水满乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469002000000', '460000000000', '0,460000000000', '琼海市', 2, 0);
INSERT INTO `sys_area` VALUES ('469002100000', '469002000000', '0,460000000000,469002000000', '嘉积镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469002101000', '469002000000', '0,460000000000,469002000000', '万泉镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469002102000', '469002000000', '0,460000000000,469002000000', '石壁镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469002103000', '469002000000', '0,460000000000,469002000000', '中原镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469002104000', '469002000000', '0,460000000000,469002000000', '博鳌镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469002105000', '469002000000', '0,460000000000,469002000000', '阳江镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469002106000', '469002000000', '0,460000000000,469002000000', '龙江镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469002107000', '469002000000', '0,460000000000,469002000000', '潭门镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469002108000', '469002000000', '0,460000000000,469002000000', '塔洋镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469002109000', '469002000000', '0,460000000000,469002000000', '长坡镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469002110000', '469002000000', '0,460000000000,469002000000', '大路镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469002111000', '469002000000', '0,460000000000,469002000000', '会山镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003000000', '460000000000', '0,460000000000', '儋州市', 2, 0);
INSERT INTO `sys_area` VALUES ('469003100000', '469003000000', '0,460000000000,469003000000', '那大镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003101000', '469003000000', '0,460000000000,469003000000', '和庆镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003102000', '469003000000', '0,460000000000,469003000000', '南丰镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003103000', '469003000000', '0,460000000000,469003000000', '大成镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003104000', '469003000000', '0,460000000000,469003000000', '雅星镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003105000', '469003000000', '0,460000000000,469003000000', '兰洋镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003106000', '469003000000', '0,460000000000,469003000000', '光村镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003107000', '469003000000', '0,460000000000,469003000000', '木棠镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003108000', '469003000000', '0,460000000000,469003000000', '海头镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003109000', '469003000000', '0,460000000000,469003000000', '峨蔓镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003110000', '469003000000', '0,460000000000,469003000000', '三都镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003111000', '469003000000', '0,460000000000,469003000000', '王五镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003112000', '469003000000', '0,460000000000,469003000000', '白马井镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003113000', '469003000000', '0,460000000000,469003000000', '中和镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003114000', '469003000000', '0,460000000000,469003000000', '排浦镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003115000', '469003000000', '0,460000000000,469003000000', '东成镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469003116000', '469003000000', '0,460000000000,469003000000', '新州镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005000000', '460000000000', '0,460000000000', '文昌市', 2, 0);
INSERT INTO `sys_area` VALUES ('469005100000', '469005000000', '0,460000000000,469005000000', '文城镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005101000', '469005000000', '0,460000000000,469005000000', '重兴镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005102000', '469005000000', '0,460000000000,469005000000', '蓬莱镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005103000', '469005000000', '0,460000000000,469005000000', '会文镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005104000', '469005000000', '0,460000000000,469005000000', '东路镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005105000', '469005000000', '0,460000000000,469005000000', '潭牛镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005106000', '469005000000', '0,460000000000,469005000000', '东阁镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005107000', '469005000000', '0,460000000000,469005000000', '文教镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005108000', '469005000000', '0,460000000000,469005000000', '东郊镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005109000', '469005000000', '0,460000000000,469005000000', '龙楼镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005110000', '469005000000', '0,460000000000,469005000000', '昌洒镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005111000', '469005000000', '0,460000000000,469005000000', '翁田镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005112000', '469005000000', '0,460000000000,469005000000', '抱罗镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005113000', '469005000000', '0,460000000000,469005000000', '冯坡镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005114000', '469005000000', '0,460000000000,469005000000', '锦山镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005115000', '469005000000', '0,460000000000,469005000000', '铺前镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469005116000', '469005000000', '0,460000000000,469005000000', '公坡镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469006000000', '460000000000', '0,460000000000', '万宁市', 2, 0);
INSERT INTO `sys_area` VALUES ('469006100000', '469006000000', '0,460000000000,469006000000', '万城镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469006101000', '469006000000', '0,460000000000,469006000000', '龙滚镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469006102000', '469006000000', '0,460000000000,469006000000', '和乐镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469006103000', '469006000000', '0,460000000000,469006000000', '后安镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469006104000', '469006000000', '0,460000000000,469006000000', '大茂镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469006105000', '469006000000', '0,460000000000,469006000000', '东澳镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469006106000', '469006000000', '0,460000000000,469006000000', '礼纪镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469006107000', '469006000000', '0,460000000000,469006000000', '长丰镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469006108000', '469006000000', '0,460000000000,469006000000', '山根镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469006109000', '469006000000', '0,460000000000,469006000000', '北大镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469006110000', '469006000000', '0,460000000000,469006000000', '南桥镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469006111000', '469006000000', '0,460000000000,469006000000', '三更罗镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469007000000', '460000000000', '0,460000000000', '东方市', 2, 0);
INSERT INTO `sys_area` VALUES ('469007100000', '469007000000', '0,460000000000,469007000000', '八所镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469007101000', '469007000000', '0,460000000000,469007000000', '东河镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469007102000', '469007000000', '0,460000000000,469007000000', '大田镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469007103000', '469007000000', '0,460000000000,469007000000', '感城镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469007104000', '469007000000', '0,460000000000,469007000000', '板桥镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469007105000', '469007000000', '0,460000000000,469007000000', '三家镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469007106000', '469007000000', '0,460000000000,469007000000', '四更镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469007107000', '469007000000', '0,460000000000,469007000000', '新龙镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469007200000', '469007000000', '0,460000000000,469007000000', '天安乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469007201000', '469007000000', '0,460000000000,469007000000', '江边乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469021000000', '460000000000', '0,460000000000', '定安县', 2, 0);
INSERT INTO `sys_area` VALUES ('469021100000', '469021000000', '0,460000000000,469021000000', '定城镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469021101000', '469021000000', '0,460000000000,469021000000', '新竹镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469021102000', '469021000000', '0,460000000000,469021000000', '龙湖镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469021103000', '469021000000', '0,460000000000,469021000000', '黄竹镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469021104000', '469021000000', '0,460000000000,469021000000', '雷鸣镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469021105000', '469021000000', '0,460000000000,469021000000', '龙门镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469021106000', '469021000000', '0,460000000000,469021000000', '龙河镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469021107000', '469021000000', '0,460000000000,469021000000', '岭口镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469021108000', '469021000000', '0,460000000000,469021000000', '翰林镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469021109000', '469021000000', '0,460000000000,469021000000', '富文镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469022000000', '460000000000', '0,460000000000', '屯昌县', 2, 0);
INSERT INTO `sys_area` VALUES ('469022100000', '469022000000', '0,460000000000,469022000000', '屯城镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469022101000', '469022000000', '0,460000000000,469022000000', '新兴镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469022102000', '469022000000', '0,460000000000,469022000000', '枫木镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469022103000', '469022000000', '0,460000000000,469022000000', '乌坡镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469022104000', '469022000000', '0,460000000000,469022000000', '南吕镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469022105000', '469022000000', '0,460000000000,469022000000', '南坤镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469022106000', '469022000000', '0,460000000000,469022000000', '坡心镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469022107000', '469022000000', '0,460000000000,469022000000', '西昌镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469023000000', '460000000000', '0,460000000000', '澄迈县', 2, 0);
INSERT INTO `sys_area` VALUES ('469023100000', '469023000000', '0,460000000000,469023000000', '金江镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469023101000', '469023000000', '0,460000000000,469023000000', '老城镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469023102000', '469023000000', '0,460000000000,469023000000', '瑞溪镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469023103000', '469023000000', '0,460000000000,469023000000', '永发镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469023104000', '469023000000', '0,460000000000,469023000000', '加乐镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469023105000', '469023000000', '0,460000000000,469023000000', '文儒镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469023106000', '469023000000', '0,460000000000,469023000000', '中兴镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469023107000', '469023000000', '0,460000000000,469023000000', '仁兴镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469023108000', '469023000000', '0,460000000000,469023000000', '福山镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469023109000', '469023000000', '0,460000000000,469023000000', '桥头镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469023110000', '469023000000', '0,460000000000,469023000000', '大丰镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469024000000', '460000000000', '0,460000000000', '临高县', 2, 0);
INSERT INTO `sys_area` VALUES ('469024100000', '469024000000', '0,460000000000,469024000000', '临城镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469024101000', '469024000000', '0,460000000000,469024000000', '波莲镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469024102000', '469024000000', '0,460000000000,469024000000', '东英镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469024103000', '469024000000', '0,460000000000,469024000000', '博厚镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469024104000', '469024000000', '0,460000000000,469024000000', '皇桐镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469024105000', '469024000000', '0,460000000000,469024000000', '多文镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469024106000', '469024000000', '0,460000000000,469024000000', '和舍镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469024107000', '469024000000', '0,460000000000,469024000000', '南宝镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469024108000', '469024000000', '0,460000000000,469024000000', '新盈镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469024109000', '469024000000', '0,460000000000,469024000000', '调楼镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469025000000', '460000000000', '0,460000000000', '白沙黎族自治县', 2, 0);
INSERT INTO `sys_area` VALUES ('469025100000', '469025000000', '0,460000000000,469025000000', '牙叉镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469025101000', '469025000000', '0,460000000000,469025000000', '七坊镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469025102000', '469025000000', '0,460000000000,469025000000', '邦溪镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469025103000', '469025000000', '0,460000000000,469025000000', '打安镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469025200000', '469025000000', '0,460000000000,469025000000', '细水乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469025201000', '469025000000', '0,460000000000,469025000000', '元门乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469025202000', '469025000000', '0,460000000000,469025000000', '南开乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469025203000', '469025000000', '0,460000000000,469025000000', '阜龙乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469025204000', '469025000000', '0,460000000000,469025000000', '青松乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469025205000', '469025000000', '0,460000000000,469025000000', '金波乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469025206000', '469025000000', '0,460000000000,469025000000', '荣邦乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469026000000', '460000000000', '0,460000000000', '昌江黎族自治县', 2, 0);
INSERT INTO `sys_area` VALUES ('469026100000', '469026000000', '0,460000000000,469026000000', '石碌镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469026101000', '469026000000', '0,460000000000,469026000000', '叉河镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469026102000', '469026000000', '0,460000000000,469026000000', '十月田镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469026103000', '469026000000', '0,460000000000,469026000000', '乌烈镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469026104000', '469026000000', '0,460000000000,469026000000', '昌化镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469026105000', '469026000000', '0,460000000000,469026000000', '海尾镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469026106000', '469026000000', '0,460000000000,469026000000', '七叉镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469026200000', '469026000000', '0,460000000000,469026000000', '王下乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469027000000', '460000000000', '0,460000000000', '乐东黎族自治县', 2, 0);
INSERT INTO `sys_area` VALUES ('469027100000', '469027000000', '0,460000000000,469027000000', '抱由镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469027101000', '469027000000', '0,460000000000,469027000000', '万冲镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469027102000', '469027000000', '0,460000000000,469027000000', '大安镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469027103000', '469027000000', '0,460000000000,469027000000', '志仲镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469027104000', '469027000000', '0,460000000000,469027000000', '千家镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469027105000', '469027000000', '0,460000000000,469027000000', '九所镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469027106000', '469027000000', '0,460000000000,469027000000', '利国镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469027107000', '469027000000', '0,460000000000,469027000000', '黄流镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469027108000', '469027000000', '0,460000000000,469027000000', '佛罗镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469027109000', '469027000000', '0,460000000000,469027000000', '尖峰镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469027110000', '469027000000', '0,460000000000,469027000000', '莺歌海镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469028000000', '460000000000', '0,460000000000', '陵水黎族自治县', 2, 0);
INSERT INTO `sys_area` VALUES ('469028100000', '469028000000', '0,460000000000,469028000000', '椰林镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469028101000', '469028000000', '0,460000000000,469028000000', '光坡镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469028102000', '469028000000', '0,460000000000,469028000000', '三才镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469028103000', '469028000000', '0,460000000000,469028000000', '英州镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469028104000', '469028000000', '0,460000000000,469028000000', '隆广镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469028105000', '469028000000', '0,460000000000,469028000000', '文罗镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469028106000', '469028000000', '0,460000000000,469028000000', '本号镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469028107000', '469028000000', '0,460000000000,469028000000', '新村镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469028108000', '469028000000', '0,460000000000,469028000000', '黎安镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469028200000', '469028000000', '0,460000000000,469028000000', '提蒙乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469028201000', '469028000000', '0,460000000000,469028000000', '群英乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469029000000', '460000000000', '0,460000000000', '保亭黎族苗族自治县', 2, 0);
INSERT INTO `sys_area` VALUES ('469029100000', '469029000000', '0,460000000000,469029000000', '保城镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469029101000', '469029000000', '0,460000000000,469029000000', '什玲镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469029102000', '469029000000', '0,460000000000,469029000000', '加茂镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469029103000', '469029000000', '0,460000000000,469029000000', '响水镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469029104000', '469029000000', '0,460000000000,469029000000', '新政镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469029105000', '469029000000', '0,460000000000,469029000000', '三道镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469029200000', '469029000000', '0,460000000000,469029000000', '六弓乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469029201000', '469029000000', '0,460000000000,469029000000', '南林乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469029202000', '469029000000', '0,460000000000,469029000000', '毛感乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469030000000', '460000000000', '0,460000000000', '琼中黎族苗族自治县', 2, 0);
INSERT INTO `sys_area` VALUES ('469030100000', '469030000000', '0,460000000000,469030000000', '营根镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469030101000', '469030000000', '0,460000000000,469030000000', '湾岭镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469030102000', '469030000000', '0,460000000000,469030000000', '黎母山镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469030103000', '469030000000', '0,460000000000,469030000000', '和平镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469030104000', '469030000000', '0,460000000000,469030000000', '长征镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469030105000', '469030000000', '0,460000000000,469030000000', '红毛镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469030106000', '469030000000', '0,460000000000,469030000000', '中平镇', 3, 0);
INSERT INTO `sys_area` VALUES ('469030200000', '469030000000', '0,460000000000,469030000000', '吊罗山乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469030201000', '469030000000', '0,460000000000,469030000000', '上安乡', 3, 0);
INSERT INTO `sys_area` VALUES ('469030202000', '469030000000', '0,460000000000,469030000000', '什运乡', 3, 0);
INSERT INTO `sys_area` VALUES ('500000000000', '100000000000', '0,', '重庆市', 1, 0);
INSERT INTO `sys_area` VALUES ('500101000000', '500900000000', '0,500000000000,500900000000', '万州区', 3, 0);
INSERT INTO `sys_area` VALUES ('500102000000', '500900000000', '0,500000000000,500900000000', '涪陵区', 3, 0);
INSERT INTO `sys_area` VALUES ('500103000000', '500900000000', '0,500000000000,500900000000', '渝中区', 3, 0);
INSERT INTO `sys_area` VALUES ('500104000000', '500900000000', '0,500000000000,500900000000', '大渡口区', 3, 0);
INSERT INTO `sys_area` VALUES ('500105000000', '500900000000', '0,500000000000,500900000000', '江北区', 3, 0);
INSERT INTO `sys_area` VALUES ('500106000000', '500900000000', '0,500000000000,500900000000', '沙坪坝区', 3, 0);
INSERT INTO `sys_area` VALUES ('500107000000', '500900000000', '0,500000000000,500900000000', '九龙坡区', 3, 0);
INSERT INTO `sys_area` VALUES ('500108000000', '500900000000', '0,500000000000,500900000000', '南岸区', 3, 0);
INSERT INTO `sys_area` VALUES ('500109000000', '500900000000', '0,500000000000,500900000000', '北碚区', 3, 0);
INSERT INTO `sys_area` VALUES ('500110000000', '500900000000', '0,500000000000,500900000000', '綦江区', 3, 0);
INSERT INTO `sys_area` VALUES ('500111000000', '500900000000', '0,500000000000,500900000000', '大足区', 3, 0);
INSERT INTO `sys_area` VALUES ('500112000000', '500900000000', '0,500000000000,500900000000', '渝北区', 3, 0);
INSERT INTO `sys_area` VALUES ('500113000000', '500900000000', '0,500000000000,500900000000', '巴南区', 3, 0);
INSERT INTO `sys_area` VALUES ('500114000000', '500900000000', '0,500000000000,500900000000', '黔江区', 3, 0);
INSERT INTO `sys_area` VALUES ('500115000000', '500900000000', '0,500000000000,500900000000', '长寿区', 3, 0);
INSERT INTO `sys_area` VALUES ('500116000000', '500900000000', '0,500000000000,500900000000', '江津区', 3, 0);
INSERT INTO `sys_area` VALUES ('500117000000', '500900000000', '0,500000000000,500900000000', '合川区', 3, 0);
INSERT INTO `sys_area` VALUES ('500118000000', '500900000000', '0,500000000000,500900000000', '永川区', 3, 0);
INSERT INTO `sys_area` VALUES ('500119000000', '500900000000', '0,500000000000,500900000000', '南川区', 3, 0);
INSERT INTO `sys_area` VALUES ('500120000000', '500900000000', '0,500000000000,500900000000', '璧山区', 3, 0);
INSERT INTO `sys_area` VALUES ('500151000000', '500900000000', '0,500000000000,500900000000', '铜梁区', 3, 0);
INSERT INTO `sys_area` VALUES ('500152000000', '500900000000', '0,500000000000,500900000000', '潼南区', 3, 0);
INSERT INTO `sys_area` VALUES ('500153000000', '500900000000', '0,500000000000,500900000000', '荣昌区', 3, 0);
INSERT INTO `sys_area` VALUES ('500228000000', '500900000000', '0,500000000000,500900000000', '梁平县', 3, 0);
INSERT INTO `sys_area` VALUES ('500229000000', '500900000000', '0,500000000000,500900000000', '城口县', 3, 0);
INSERT INTO `sys_area` VALUES ('500230000000', '500900000000', '0,500000000000,500900000000', '丰都县', 3, 0);
INSERT INTO `sys_area` VALUES ('500231000000', '500900000000', '0,500000000000,500900000000', '垫江县', 3, 0);
INSERT INTO `sys_area` VALUES ('500232000000', '500900000000', '0,500000000000,500900000000', '武隆县', 3, 0);
INSERT INTO `sys_area` VALUES ('500233000000', '500900000000', '0,500000000000,500900000000', '忠县', 3, 0);
INSERT INTO `sys_area` VALUES ('500234000000', '500900000000', '0,500000000000,500900000000', '开县', 3, 0);
INSERT INTO `sys_area` VALUES ('500235000000', '500900000000', '0,500000000000,500900000000', '云阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('500236000000', '500900000000', '0,500000000000,500900000000', '奉节县', 3, 0);
INSERT INTO `sys_area` VALUES ('500237000000', '500900000000', '0,500000000000,500900000000', '巫山县', 3, 0);
INSERT INTO `sys_area` VALUES ('500238000000', '500900000000', '0,500000000000,500900000000', '巫溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('500240000000', '500900000000', '0,500000000000,500900000000', '石柱土家族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('500241000000', '500900000000', '0,500000000000,500900000000', '秀山土家族苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('500242000000', '500900000000', '0,500000000000,500900000000', '酉阳土家族苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('500243000000', '500900000000', '0,500000000000,500900000000', '彭水苗族土家族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('500900000000', '500000000000', '0,500000000000', '重庆市', 2, 0);
INSERT INTO `sys_area` VALUES ('510000000000', '100000000000', '0,', '四川省', 1, 0);
INSERT INTO `sys_area` VALUES ('510100000000', '510000000000', '0,510000000000', '成都市', 2, 0);
INSERT INTO `sys_area` VALUES ('510104000000', '510100000000', '0,510000000000,510100000000', '锦江区', 3, 0);
INSERT INTO `sys_area` VALUES ('510105000000', '510100000000', '0,510000000000,510100000000', '青羊区', 3, 0);
INSERT INTO `sys_area` VALUES ('510106000000', '510100000000', '0,510000000000,510100000000', '金牛区', 3, 0);
INSERT INTO `sys_area` VALUES ('510107000000', '510100000000', '0,510000000000,510100000000', '武侯区', 3, 0);
INSERT INTO `sys_area` VALUES ('510108000000', '510100000000', '0,510000000000,510100000000', '成华区', 3, 0);
INSERT INTO `sys_area` VALUES ('510112000000', '510100000000', '0,510000000000,510100000000', '龙泉驿区', 3, 0);
INSERT INTO `sys_area` VALUES ('510113000000', '510100000000', '0,510000000000,510100000000', '青白江区', 3, 0);
INSERT INTO `sys_area` VALUES ('510114000000', '510100000000', '0,510000000000,510100000000', '新都区', 3, 0);
INSERT INTO `sys_area` VALUES ('510115000000', '510100000000', '0,510000000000,510100000000', '温江区', 3, 0);
INSERT INTO `sys_area` VALUES ('510121000000', '510100000000', '0,510000000000,510100000000', '金堂县', 3, 0);
INSERT INTO `sys_area` VALUES ('510122000000', '510100000000', '0,510000000000,510100000000', '双流县', 3, 0);
INSERT INTO `sys_area` VALUES ('510124000000', '510100000000', '0,510000000000,510100000000', '郫县', 3, 0);
INSERT INTO `sys_area` VALUES ('510129000000', '510100000000', '0,510000000000,510100000000', '大邑县', 3, 0);
INSERT INTO `sys_area` VALUES ('510131000000', '510100000000', '0,510000000000,510100000000', '蒲江县', 3, 0);
INSERT INTO `sys_area` VALUES ('510132000000', '510100000000', '0,510000000000,510100000000', '新津县', 3, 0);
INSERT INTO `sys_area` VALUES ('510181000000', '510100000000', '0,510000000000,510100000000', '都江堰市', 3, 0);
INSERT INTO `sys_area` VALUES ('510182000000', '510100000000', '0,510000000000,510100000000', '彭州市', 3, 0);
INSERT INTO `sys_area` VALUES ('510183000000', '510100000000', '0,510000000000,510100000000', '邛崃市', 3, 0);
INSERT INTO `sys_area` VALUES ('510184000000', '510100000000', '0,510000000000,510100000000', '崇州市', 3, 0);
INSERT INTO `sys_area` VALUES ('510300000000', '510000000000', '0,510000000000', '自贡市', 2, 0);
INSERT INTO `sys_area` VALUES ('510302000000', '510300000000', '0,510000000000,510300000000', '自流井区', 3, 0);
INSERT INTO `sys_area` VALUES ('510303000000', '510300000000', '0,510000000000,510300000000', '贡井区', 3, 0);
INSERT INTO `sys_area` VALUES ('510304000000', '510300000000', '0,510000000000,510300000000', '大安区', 3, 0);
INSERT INTO `sys_area` VALUES ('510311000000', '510300000000', '0,510000000000,510300000000', '沿滩区', 3, 0);
INSERT INTO `sys_area` VALUES ('510321000000', '510300000000', '0,510000000000,510300000000', '荣县', 3, 0);
INSERT INTO `sys_area` VALUES ('510322000000', '510300000000', '0,510000000000,510300000000', '富顺县', 3, 0);
INSERT INTO `sys_area` VALUES ('510400000000', '510000000000', '0,510000000000', '攀枝花市', 2, 0);
INSERT INTO `sys_area` VALUES ('510402000000', '510400000000', '0,510000000000,510400000000', '东区', 3, 0);
INSERT INTO `sys_area` VALUES ('510403000000', '510400000000', '0,510000000000,510400000000', '西区', 3, 0);
INSERT INTO `sys_area` VALUES ('510411000000', '510400000000', '0,510000000000,510400000000', '仁和区', 3, 0);
INSERT INTO `sys_area` VALUES ('510421000000', '510400000000', '0,510000000000,510400000000', '米易县', 3, 0);
INSERT INTO `sys_area` VALUES ('510422000000', '510400000000', '0,510000000000,510400000000', '盐边县', 3, 0);
INSERT INTO `sys_area` VALUES ('510500000000', '510000000000', '0,510000000000', '泸州市', 2, 0);
INSERT INTO `sys_area` VALUES ('510502000000', '510500000000', '0,510000000000,510500000000', '江阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('510503000000', '510500000000', '0,510000000000,510500000000', '纳溪区', 3, 0);
INSERT INTO `sys_area` VALUES ('510504000000', '510500000000', '0,510000000000,510500000000', '龙马潭区', 3, 0);
INSERT INTO `sys_area` VALUES ('510521000000', '510500000000', '0,510000000000,510500000000', '泸县', 3, 0);
INSERT INTO `sys_area` VALUES ('510522000000', '510500000000', '0,510000000000,510500000000', '合江县', 3, 0);
INSERT INTO `sys_area` VALUES ('510524000000', '510500000000', '0,510000000000,510500000000', '叙永县', 3, 0);
INSERT INTO `sys_area` VALUES ('510525000000', '510500000000', '0,510000000000,510500000000', '古蔺县', 3, 0);
INSERT INTO `sys_area` VALUES ('510600000000', '510000000000', '0,510000000000', '德阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('510603000000', '510600000000', '0,510000000000,510600000000', '旌阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('510623000000', '510600000000', '0,510000000000,510600000000', '中江县', 3, 0);
INSERT INTO `sys_area` VALUES ('510626000000', '510600000000', '0,510000000000,510600000000', '罗江县', 3, 0);
INSERT INTO `sys_area` VALUES ('510681000000', '510600000000', '0,510000000000,510600000000', '广汉市', 3, 0);
INSERT INTO `sys_area` VALUES ('510682000000', '510600000000', '0,510000000000,510600000000', '什邡市', 3, 0);
INSERT INTO `sys_area` VALUES ('510683000000', '510600000000', '0,510000000000,510600000000', '绵竹市', 3, 0);
INSERT INTO `sys_area` VALUES ('510700000000', '510000000000', '0,510000000000', '绵阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('510703000000', '510700000000', '0,510000000000,510700000000', '涪城区', 3, 0);
INSERT INTO `sys_area` VALUES ('510704000000', '510700000000', '0,510000000000,510700000000', '游仙区', 3, 0);
INSERT INTO `sys_area` VALUES ('510722000000', '510700000000', '0,510000000000,510700000000', '三台县', 3, 0);
INSERT INTO `sys_area` VALUES ('510723000000', '510700000000', '0,510000000000,510700000000', '盐亭县', 3, 0);
INSERT INTO `sys_area` VALUES ('510724000000', '510700000000', '0,510000000000,510700000000', '安县', 3, 0);
INSERT INTO `sys_area` VALUES ('510725000000', '510700000000', '0,510000000000,510700000000', '梓潼县', 3, 0);
INSERT INTO `sys_area` VALUES ('510726000000', '510700000000', '0,510000000000,510700000000', '北川羌族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('510727000000', '510700000000', '0,510000000000,510700000000', '平武县', 3, 0);
INSERT INTO `sys_area` VALUES ('510781000000', '510700000000', '0,510000000000,510700000000', '江油市', 3, 0);
INSERT INTO `sys_area` VALUES ('510800000000', '510000000000', '0,510000000000', '广元市', 2, 0);
INSERT INTO `sys_area` VALUES ('510802000000', '510800000000', '0,510000000000,510800000000', '利州区', 3, 0);
INSERT INTO `sys_area` VALUES ('510811000000', '510800000000', '0,510000000000,510800000000', '昭化区', 3, 0);
INSERT INTO `sys_area` VALUES ('510812000000', '510800000000', '0,510000000000,510800000000', '朝天区', 3, 0);
INSERT INTO `sys_area` VALUES ('510821000000', '510800000000', '0,510000000000,510800000000', '旺苍县', 3, 0);
INSERT INTO `sys_area` VALUES ('510822000000', '510800000000', '0,510000000000,510800000000', '青川县', 3, 0);
INSERT INTO `sys_area` VALUES ('510823000000', '510800000000', '0,510000000000,510800000000', '剑阁县', 3, 0);
INSERT INTO `sys_area` VALUES ('510824000000', '510800000000', '0,510000000000,510800000000', '苍溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('510900000000', '510000000000', '0,510000000000', '遂宁市', 2, 0);
INSERT INTO `sys_area` VALUES ('510903000000', '510900000000', '0,510000000000,510900000000', '船山区', 3, 0);
INSERT INTO `sys_area` VALUES ('510904000000', '510900000000', '0,510000000000,510900000000', '安居区', 3, 0);
INSERT INTO `sys_area` VALUES ('510921000000', '510900000000', '0,510000000000,510900000000', '蓬溪县', 3, 0);
INSERT INTO `sys_area` VALUES ('510922000000', '510900000000', '0,510000000000,510900000000', '射洪县', 3, 0);
INSERT INTO `sys_area` VALUES ('510923000000', '510900000000', '0,510000000000,510900000000', '大英县', 3, 0);
INSERT INTO `sys_area` VALUES ('511000000000', '510000000000', '0,510000000000', '内江市', 2, 0);
INSERT INTO `sys_area` VALUES ('511002000000', '511000000000', '0,510000000000,511000000000', '市中区', 3, 0);
INSERT INTO `sys_area` VALUES ('511011000000', '511000000000', '0,510000000000,511000000000', '东兴区', 3, 0);
INSERT INTO `sys_area` VALUES ('511024000000', '511000000000', '0,510000000000,511000000000', '威远县', 3, 0);
INSERT INTO `sys_area` VALUES ('511025000000', '511000000000', '0,510000000000,511000000000', '资中县', 3, 0);
INSERT INTO `sys_area` VALUES ('511028000000', '511000000000', '0,510000000000,511000000000', '隆昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('511100000000', '510000000000', '0,510000000000', '乐山市', 2, 0);
INSERT INTO `sys_area` VALUES ('511102000000', '511100000000', '0,510000000000,511100000000', '市中区', 3, 0);
INSERT INTO `sys_area` VALUES ('511111000000', '511100000000', '0,510000000000,511100000000', '沙湾区', 3, 0);
INSERT INTO `sys_area` VALUES ('511112000000', '511100000000', '0,510000000000,511100000000', '五通桥区', 3, 0);
INSERT INTO `sys_area` VALUES ('511113000000', '511100000000', '0,510000000000,511100000000', '金口河区', 3, 0);
INSERT INTO `sys_area` VALUES ('511123000000', '511100000000', '0,510000000000,511100000000', '犍为县', 3, 0);
INSERT INTO `sys_area` VALUES ('511124000000', '511100000000', '0,510000000000,511100000000', '井研县', 3, 0);
INSERT INTO `sys_area` VALUES ('511126000000', '511100000000', '0,510000000000,511100000000', '夹江县', 3, 0);
INSERT INTO `sys_area` VALUES ('511129000000', '511100000000', '0,510000000000,511100000000', '沐川县', 3, 0);
INSERT INTO `sys_area` VALUES ('511132000000', '511100000000', '0,510000000000,511100000000', '峨边彝族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('511133000000', '511100000000', '0,510000000000,511100000000', '马边彝族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('511181000000', '511100000000', '0,510000000000,511100000000', '峨眉山市', 3, 0);
INSERT INTO `sys_area` VALUES ('511300000000', '510000000000', '0,510000000000', '南充市', 2, 0);
INSERT INTO `sys_area` VALUES ('511302000000', '511300000000', '0,510000000000,511300000000', '顺庆区', 3, 0);
INSERT INTO `sys_area` VALUES ('511303000000', '511300000000', '0,510000000000,511300000000', '高坪区', 3, 0);
INSERT INTO `sys_area` VALUES ('511304000000', '511300000000', '0,510000000000,511300000000', '嘉陵区', 3, 0);
INSERT INTO `sys_area` VALUES ('511321000000', '511300000000', '0,510000000000,511300000000', '南部县', 3, 0);
INSERT INTO `sys_area` VALUES ('511322000000', '511300000000', '0,510000000000,511300000000', '营山县', 3, 0);
INSERT INTO `sys_area` VALUES ('511323000000', '511300000000', '0,510000000000,511300000000', '蓬安县', 3, 0);
INSERT INTO `sys_area` VALUES ('511324000000', '511300000000', '0,510000000000,511300000000', '仪陇县', 3, 0);
INSERT INTO `sys_area` VALUES ('511325000000', '511300000000', '0,510000000000,511300000000', '西充县', 3, 0);
INSERT INTO `sys_area` VALUES ('511381000000', '511300000000', '0,510000000000,511300000000', '阆中市', 3, 0);
INSERT INTO `sys_area` VALUES ('511400000000', '510000000000', '0,510000000000', '眉山市', 2, 0);
INSERT INTO `sys_area` VALUES ('511402000000', '511400000000', '0,510000000000,511400000000', '东坡区', 3, 0);
INSERT INTO `sys_area` VALUES ('511403000000', '511400000000', '0,510000000000,511400000000', '彭山区', 3, 0);
INSERT INTO `sys_area` VALUES ('511421000000', '511400000000', '0,510000000000,511400000000', '仁寿县', 3, 0);
INSERT INTO `sys_area` VALUES ('511423000000', '511400000000', '0,510000000000,511400000000', '洪雅县', 3, 0);
INSERT INTO `sys_area` VALUES ('511424000000', '511400000000', '0,510000000000,511400000000', '丹棱县', 3, 0);
INSERT INTO `sys_area` VALUES ('511425000000', '511400000000', '0,510000000000,511400000000', '青神县', 3, 0);
INSERT INTO `sys_area` VALUES ('511500000000', '510000000000', '0,510000000000', '宜宾市', 2, 0);
INSERT INTO `sys_area` VALUES ('511502000000', '511500000000', '0,510000000000,511500000000', '翠屏区', 3, 0);
INSERT INTO `sys_area` VALUES ('511503000000', '511500000000', '0,510000000000,511500000000', '南溪区', 3, 0);
INSERT INTO `sys_area` VALUES ('511521000000', '511500000000', '0,510000000000,511500000000', '宜宾县', 3, 0);
INSERT INTO `sys_area` VALUES ('511523000000', '511500000000', '0,510000000000,511500000000', '江安县', 3, 0);
INSERT INTO `sys_area` VALUES ('511524000000', '511500000000', '0,510000000000,511500000000', '长宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('511525000000', '511500000000', '0,510000000000,511500000000', '高县', 3, 0);
INSERT INTO `sys_area` VALUES ('511526000000', '511500000000', '0,510000000000,511500000000', '珙县', 3, 0);
INSERT INTO `sys_area` VALUES ('511527000000', '511500000000', '0,510000000000,511500000000', '筠连县', 3, 0);
INSERT INTO `sys_area` VALUES ('511528000000', '511500000000', '0,510000000000,511500000000', '兴文县', 3, 0);
INSERT INTO `sys_area` VALUES ('511529000000', '511500000000', '0,510000000000,511500000000', '屏山县', 3, 0);
INSERT INTO `sys_area` VALUES ('511600000000', '510000000000', '0,510000000000', '广安市', 2, 0);
INSERT INTO `sys_area` VALUES ('511602000000', '511600000000', '0,510000000000,511600000000', '广安区', 3, 0);
INSERT INTO `sys_area` VALUES ('511603000000', '511600000000', '0,510000000000,511600000000', '前锋区', 3, 0);
INSERT INTO `sys_area` VALUES ('511621000000', '511600000000', '0,510000000000,511600000000', '岳池县', 3, 0);
INSERT INTO `sys_area` VALUES ('511622000000', '511600000000', '0,510000000000,511600000000', '武胜县', 3, 0);
INSERT INTO `sys_area` VALUES ('511623000000', '511600000000', '0,510000000000,511600000000', '邻水县', 3, 0);
INSERT INTO `sys_area` VALUES ('511681000000', '511600000000', '0,510000000000,511600000000', '华蓥市', 3, 0);
INSERT INTO `sys_area` VALUES ('511700000000', '510000000000', '0,510000000000', '达州市', 2, 0);
INSERT INTO `sys_area` VALUES ('511702000000', '511700000000', '0,510000000000,511700000000', '通川区', 3, 0);
INSERT INTO `sys_area` VALUES ('511703000000', '511700000000', '0,510000000000,511700000000', '达川区', 3, 0);
INSERT INTO `sys_area` VALUES ('511722000000', '511700000000', '0,510000000000,511700000000', '宣汉县', 3, 0);
INSERT INTO `sys_area` VALUES ('511723000000', '511700000000', '0,510000000000,511700000000', '开江县', 3, 0);
INSERT INTO `sys_area` VALUES ('511724000000', '511700000000', '0,510000000000,511700000000', '大竹县', 3, 0);
INSERT INTO `sys_area` VALUES ('511725000000', '511700000000', '0,510000000000,511700000000', '渠县', 3, 0);
INSERT INTO `sys_area` VALUES ('511781000000', '511700000000', '0,510000000000,511700000000', '万源市', 3, 0);
INSERT INTO `sys_area` VALUES ('511800000000', '510000000000', '0,510000000000', '雅安市', 2, 0);
INSERT INTO `sys_area` VALUES ('511802000000', '511800000000', '0,510000000000,511800000000', '雨城区', 3, 0);
INSERT INTO `sys_area` VALUES ('511803000000', '511800000000', '0,510000000000,511800000000', '名山区', 3, 0);
INSERT INTO `sys_area` VALUES ('511822000000', '511800000000', '0,510000000000,511800000000', '荥经县', 3, 0);
INSERT INTO `sys_area` VALUES ('511823000000', '511800000000', '0,510000000000,511800000000', '汉源县', 3, 0);
INSERT INTO `sys_area` VALUES ('511824000000', '511800000000', '0,510000000000,511800000000', '石棉县', 3, 0);
INSERT INTO `sys_area` VALUES ('511825000000', '511800000000', '0,510000000000,511800000000', '天全县', 3, 0);
INSERT INTO `sys_area` VALUES ('511826000000', '511800000000', '0,510000000000,511800000000', '芦山县', 3, 0);
INSERT INTO `sys_area` VALUES ('511827000000', '511800000000', '0,510000000000,511800000000', '宝兴县', 3, 0);
INSERT INTO `sys_area` VALUES ('511900000000', '510000000000', '0,510000000000', '巴中市', 2, 0);
INSERT INTO `sys_area` VALUES ('511902000000', '511900000000', '0,510000000000,511900000000', '巴州区', 3, 0);
INSERT INTO `sys_area` VALUES ('511903000000', '511900000000', '0,510000000000,511900000000', '恩阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('511921000000', '511900000000', '0,510000000000,511900000000', '通江县', 3, 0);
INSERT INTO `sys_area` VALUES ('511922000000', '511900000000', '0,510000000000,511900000000', '南江县', 3, 0);
INSERT INTO `sys_area` VALUES ('511923000000', '511900000000', '0,510000000000,511900000000', '平昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('512000000000', '510000000000', '0,510000000000', '资阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('512002000000', '512000000000', '0,510000000000,512000000000', '雁江区', 3, 0);
INSERT INTO `sys_area` VALUES ('512021000000', '512000000000', '0,510000000000,512000000000', '安岳县', 3, 0);
INSERT INTO `sys_area` VALUES ('512022000000', '512000000000', '0,510000000000,512000000000', '乐至县', 3, 0);
INSERT INTO `sys_area` VALUES ('512081000000', '512000000000', '0,510000000000,512000000000', '简阳市', 3, 0);
INSERT INTO `sys_area` VALUES ('513200000000', '510000000000', '0,510000000000', '阿坝藏族羌族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('513221000000', '513200000000', '0,510000000000,513200000000', '汶川县', 3, 0);
INSERT INTO `sys_area` VALUES ('513222000000', '513200000000', '0,510000000000,513200000000', '理县', 3, 0);
INSERT INTO `sys_area` VALUES ('513223000000', '513200000000', '0,510000000000,513200000000', '茂县', 3, 0);
INSERT INTO `sys_area` VALUES ('513224000000', '513200000000', '0,510000000000,513200000000', '松潘县', 3, 0);
INSERT INTO `sys_area` VALUES ('513225000000', '513200000000', '0,510000000000,513200000000', '九寨沟县', 3, 0);
INSERT INTO `sys_area` VALUES ('513226000000', '513200000000', '0,510000000000,513200000000', '金川县', 3, 0);
INSERT INTO `sys_area` VALUES ('513227000000', '513200000000', '0,510000000000,513200000000', '小金县', 3, 0);
INSERT INTO `sys_area` VALUES ('513228000000', '513200000000', '0,510000000000,513200000000', '黑水县', 3, 0);
INSERT INTO `sys_area` VALUES ('513229000000', '513200000000', '0,510000000000,513200000000', '马尔康县', 3, 0);
INSERT INTO `sys_area` VALUES ('513230000000', '513200000000', '0,510000000000,513200000000', '壤塘县', 3, 0);
INSERT INTO `sys_area` VALUES ('513231000000', '513200000000', '0,510000000000,513200000000', '阿坝县', 3, 0);
INSERT INTO `sys_area` VALUES ('513232000000', '513200000000', '0,510000000000,513200000000', '若尔盖县', 3, 0);
INSERT INTO `sys_area` VALUES ('513233000000', '513200000000', '0,510000000000,513200000000', '红原县', 3, 0);
INSERT INTO `sys_area` VALUES ('513300000000', '510000000000', '0,510000000000', '甘孜藏族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('513301000000', '513300000000', '0,510000000000,513300000000', '康定市', 3, 0);
INSERT INTO `sys_area` VALUES ('513322000000', '513300000000', '0,510000000000,513300000000', '泸定县', 3, 0);
INSERT INTO `sys_area` VALUES ('513323000000', '513300000000', '0,510000000000,513300000000', '丹巴县', 3, 0);
INSERT INTO `sys_area` VALUES ('513324000000', '513300000000', '0,510000000000,513300000000', '九龙县', 3, 0);
INSERT INTO `sys_area` VALUES ('513325000000', '513300000000', '0,510000000000,513300000000', '雅江县', 3, 0);
INSERT INTO `sys_area` VALUES ('513326000000', '513300000000', '0,510000000000,513300000000', '道孚县', 3, 0);
INSERT INTO `sys_area` VALUES ('513327000000', '513300000000', '0,510000000000,513300000000', '炉霍县', 3, 0);
INSERT INTO `sys_area` VALUES ('513328000000', '513300000000', '0,510000000000,513300000000', '甘孜县', 3, 0);
INSERT INTO `sys_area` VALUES ('513329000000', '513300000000', '0,510000000000,513300000000', '新龙县', 3, 0);
INSERT INTO `sys_area` VALUES ('513330000000', '513300000000', '0,510000000000,513300000000', '德格县', 3, 0);
INSERT INTO `sys_area` VALUES ('513331000000', '513300000000', '0,510000000000,513300000000', '白玉县', 3, 0);
INSERT INTO `sys_area` VALUES ('513332000000', '513300000000', '0,510000000000,513300000000', '石渠县', 3, 0);
INSERT INTO `sys_area` VALUES ('513333000000', '513300000000', '0,510000000000,513300000000', '色达县', 3, 0);
INSERT INTO `sys_area` VALUES ('513334000000', '513300000000', '0,510000000000,513300000000', '理塘县', 3, 0);
INSERT INTO `sys_area` VALUES ('513335000000', '513300000000', '0,510000000000,513300000000', '巴塘县', 3, 0);
INSERT INTO `sys_area` VALUES ('513336000000', '513300000000', '0,510000000000,513300000000', '乡城县', 3, 0);
INSERT INTO `sys_area` VALUES ('513337000000', '513300000000', '0,510000000000,513300000000', '稻城县', 3, 0);
INSERT INTO `sys_area` VALUES ('513338000000', '513300000000', '0,510000000000,513300000000', '得荣县', 3, 0);
INSERT INTO `sys_area` VALUES ('513400000000', '510000000000', '0,510000000000', '凉山彝族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('513401000000', '513400000000', '0,510000000000,513400000000', '西昌市', 3, 0);
INSERT INTO `sys_area` VALUES ('513422000000', '513400000000', '0,510000000000,513400000000', '木里藏族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('513423000000', '513400000000', '0,510000000000,513400000000', '盐源县', 3, 0);
INSERT INTO `sys_area` VALUES ('513424000000', '513400000000', '0,510000000000,513400000000', '德昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('513425000000', '513400000000', '0,510000000000,513400000000', '会理县', 3, 0);
INSERT INTO `sys_area` VALUES ('513426000000', '513400000000', '0,510000000000,513400000000', '会东县', 3, 0);
INSERT INTO `sys_area` VALUES ('513427000000', '513400000000', '0,510000000000,513400000000', '宁南县', 3, 0);
INSERT INTO `sys_area` VALUES ('513428000000', '513400000000', '0,510000000000,513400000000', '普格县', 3, 0);
INSERT INTO `sys_area` VALUES ('513429000000', '513400000000', '0,510000000000,513400000000', '布拖县', 3, 0);
INSERT INTO `sys_area` VALUES ('513430000000', '513400000000', '0,510000000000,513400000000', '金阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('513431000000', '513400000000', '0,510000000000,513400000000', '昭觉县', 3, 0);
INSERT INTO `sys_area` VALUES ('513432000000', '513400000000', '0,510000000000,513400000000', '喜德县', 3, 0);
INSERT INTO `sys_area` VALUES ('513433000000', '513400000000', '0,510000000000,513400000000', '冕宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('513434000000', '513400000000', '0,510000000000,513400000000', '越西县', 3, 0);
INSERT INTO `sys_area` VALUES ('513435000000', '513400000000', '0,510000000000,513400000000', '甘洛县', 3, 0);
INSERT INTO `sys_area` VALUES ('513436000000', '513400000000', '0,510000000000,513400000000', '美姑县', 3, 0);
INSERT INTO `sys_area` VALUES ('513437000000', '513400000000', '0,510000000000,513400000000', '雷波县', 3, 0);
INSERT INTO `sys_area` VALUES ('520000000000', '100000000000', '0,', '贵州省', 1, 0);
INSERT INTO `sys_area` VALUES ('520100000000', '520000000000', '0,520000000000', '贵阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('520102000000', '520100000000', '0,520000000000,520100000000', '南明区', 3, 0);
INSERT INTO `sys_area` VALUES ('520103000000', '520100000000', '0,520000000000,520100000000', '云岩区', 3, 0);
INSERT INTO `sys_area` VALUES ('520111000000', '520100000000', '0,520000000000,520100000000', '花溪区', 3, 0);
INSERT INTO `sys_area` VALUES ('520112000000', '520100000000', '0,520000000000,520100000000', '乌当区', 3, 0);
INSERT INTO `sys_area` VALUES ('520113000000', '520100000000', '0,520000000000,520100000000', '白云区', 3, 0);
INSERT INTO `sys_area` VALUES ('520115000000', '520100000000', '0,520000000000,520100000000', '观山湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('520121000000', '520100000000', '0,520000000000,520100000000', '开阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('520122000000', '520100000000', '0,520000000000,520100000000', '息烽县', 3, 0);
INSERT INTO `sys_area` VALUES ('520123000000', '520100000000', '0,520000000000,520100000000', '修文县', 3, 0);
INSERT INTO `sys_area` VALUES ('520181000000', '520100000000', '0,520000000000,520100000000', '清镇市', 3, 0);
INSERT INTO `sys_area` VALUES ('520200000000', '520000000000', '0,520000000000', '六盘水市', 2, 0);
INSERT INTO `sys_area` VALUES ('520201000000', '520200000000', '0,520000000000,520200000000', '钟山区', 3, 0);
INSERT INTO `sys_area` VALUES ('520203000000', '520200000000', '0,520000000000,520200000000', '六枝特区', 3, 0);
INSERT INTO `sys_area` VALUES ('520221000000', '520200000000', '0,520000000000,520200000000', '水城县', 3, 0);
INSERT INTO `sys_area` VALUES ('520222000000', '520200000000', '0,520000000000,520200000000', '盘县', 3, 0);
INSERT INTO `sys_area` VALUES ('520300000000', '520000000000', '0,520000000000', '遵义市', 2, 0);
INSERT INTO `sys_area` VALUES ('520302000000', '520300000000', '0,520000000000,520300000000', '红花岗区', 3, 0);
INSERT INTO `sys_area` VALUES ('520303000000', '520300000000', '0,520000000000,520300000000', '汇川区', 3, 0);
INSERT INTO `sys_area` VALUES ('520321000000', '520300000000', '0,520000000000,520300000000', '遵义县', 3, 0);
INSERT INTO `sys_area` VALUES ('520322000000', '520300000000', '0,520000000000,520300000000', '桐梓县', 3, 0);
INSERT INTO `sys_area` VALUES ('520323000000', '520300000000', '0,520000000000,520300000000', '绥阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('520324000000', '520300000000', '0,520000000000,520300000000', '正安县', 3, 0);
INSERT INTO `sys_area` VALUES ('520325000000', '520300000000', '0,520000000000,520300000000', '道真仡佬族苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('520326000000', '520300000000', '0,520000000000,520300000000', '务川仡佬族苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('520327000000', '520300000000', '0,520000000000,520300000000', '凤冈县', 3, 0);
INSERT INTO `sys_area` VALUES ('520328000000', '520300000000', '0,520000000000,520300000000', '湄潭县', 3, 0);
INSERT INTO `sys_area` VALUES ('520329000000', '520300000000', '0,520000000000,520300000000', '余庆县', 3, 0);
INSERT INTO `sys_area` VALUES ('520330000000', '520300000000', '0,520000000000,520300000000', '习水县', 3, 0);
INSERT INTO `sys_area` VALUES ('520381000000', '520300000000', '0,520000000000,520300000000', '赤水市', 3, 0);
INSERT INTO `sys_area` VALUES ('520382000000', '520300000000', '0,520000000000,520300000000', '仁怀市', 3, 0);
INSERT INTO `sys_area` VALUES ('520400000000', '520000000000', '0,520000000000', '安顺市', 2, 0);
INSERT INTO `sys_area` VALUES ('520402000000', '520400000000', '0,520000000000,520400000000', '西秀区', 3, 0);
INSERT INTO `sys_area` VALUES ('520403000000', '520400000000', '0,520000000000,520400000000', '平坝区', 3, 0);
INSERT INTO `sys_area` VALUES ('520422000000', '520400000000', '0,520000000000,520400000000', '普定县', 3, 0);
INSERT INTO `sys_area` VALUES ('520423000000', '520400000000', '0,520000000000,520400000000', '镇宁布依族苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('520424000000', '520400000000', '0,520000000000,520400000000', '关岭布依族苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('520425000000', '520400000000', '0,520000000000,520400000000', '紫云苗族布依族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('520500000000', '520000000000', '0,520000000000', '毕节市', 2, 0);
INSERT INTO `sys_area` VALUES ('520502000000', '520500000000', '0,520000000000,520500000000', '七星关区', 3, 0);
INSERT INTO `sys_area` VALUES ('520521000000', '520500000000', '0,520000000000,520500000000', '大方县', 3, 0);
INSERT INTO `sys_area` VALUES ('520522000000', '520500000000', '0,520000000000,520500000000', '黔西县', 3, 0);
INSERT INTO `sys_area` VALUES ('520523000000', '520500000000', '0,520000000000,520500000000', '金沙县', 3, 0);
INSERT INTO `sys_area` VALUES ('520524000000', '520500000000', '0,520000000000,520500000000', '织金县', 3, 0);
INSERT INTO `sys_area` VALUES ('520525000000', '520500000000', '0,520000000000,520500000000', '纳雍县', 3, 0);
INSERT INTO `sys_area` VALUES ('520526000000', '520500000000', '0,520000000000,520500000000', '威宁彝族回族苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('520527000000', '520500000000', '0,520000000000,520500000000', '赫章县', 3, 0);
INSERT INTO `sys_area` VALUES ('520600000000', '520000000000', '0,520000000000', '铜仁市', 2, 0);
INSERT INTO `sys_area` VALUES ('520602000000', '520600000000', '0,520000000000,520600000000', '碧江区', 3, 0);
INSERT INTO `sys_area` VALUES ('520603000000', '520600000000', '0,520000000000,520600000000', '万山区', 3, 0);
INSERT INTO `sys_area` VALUES ('520621000000', '520600000000', '0,520000000000,520600000000', '江口县', 3, 0);
INSERT INTO `sys_area` VALUES ('520622000000', '520600000000', '0,520000000000,520600000000', '玉屏侗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('520623000000', '520600000000', '0,520000000000,520600000000', '石阡县', 3, 0);
INSERT INTO `sys_area` VALUES ('520624000000', '520600000000', '0,520000000000,520600000000', '思南县', 3, 0);
INSERT INTO `sys_area` VALUES ('520625000000', '520600000000', '0,520000000000,520600000000', '印江土家族苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('520626000000', '520600000000', '0,520000000000,520600000000', '德江县', 3, 0);
INSERT INTO `sys_area` VALUES ('520627000000', '520600000000', '0,520000000000,520600000000', '沿河土家族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('520628000000', '520600000000', '0,520000000000,520600000000', '松桃苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('522300000000', '520000000000', '0,520000000000', '黔西南布依族苗族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('522301000000', '522300000000', '0,520000000000,522300000000', '兴义市', 3, 0);
INSERT INTO `sys_area` VALUES ('522322000000', '522300000000', '0,520000000000,522300000000', '兴仁县', 3, 0);
INSERT INTO `sys_area` VALUES ('522323000000', '522300000000', '0,520000000000,522300000000', '普安县', 3, 0);
INSERT INTO `sys_area` VALUES ('522324000000', '522300000000', '0,520000000000,522300000000', '晴隆县', 3, 0);
INSERT INTO `sys_area` VALUES ('522325000000', '522300000000', '0,520000000000,522300000000', '贞丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('522326000000', '522300000000', '0,520000000000,522300000000', '望谟县', 3, 0);
INSERT INTO `sys_area` VALUES ('522327000000', '522300000000', '0,520000000000,522300000000', '册亨县', 3, 0);
INSERT INTO `sys_area` VALUES ('522328000000', '522300000000', '0,520000000000,522300000000', '安龙县', 3, 0);
INSERT INTO `sys_area` VALUES ('522600000000', '520000000000', '0,520000000000', '黔东南苗族侗族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('522601000000', '522600000000', '0,520000000000,522600000000', '凯里市', 3, 0);
INSERT INTO `sys_area` VALUES ('522622000000', '522600000000', '0,520000000000,522600000000', '黄平县', 3, 0);
INSERT INTO `sys_area` VALUES ('522623000000', '522600000000', '0,520000000000,522600000000', '施秉县', 3, 0);
INSERT INTO `sys_area` VALUES ('522624000000', '522600000000', '0,520000000000,522600000000', '三穗县', 3, 0);
INSERT INTO `sys_area` VALUES ('522625000000', '522600000000', '0,520000000000,522600000000', '镇远县', 3, 0);
INSERT INTO `sys_area` VALUES ('522626000000', '522600000000', '0,520000000000,522600000000', '岑巩县', 3, 0);
INSERT INTO `sys_area` VALUES ('522627000000', '522600000000', '0,520000000000,522600000000', '天柱县', 3, 0);
INSERT INTO `sys_area` VALUES ('522628000000', '522600000000', '0,520000000000,522600000000', '锦屏县', 3, 0);
INSERT INTO `sys_area` VALUES ('522629000000', '522600000000', '0,520000000000,522600000000', '剑河县', 3, 0);
INSERT INTO `sys_area` VALUES ('522630000000', '522600000000', '0,520000000000,522600000000', '台江县', 3, 0);
INSERT INTO `sys_area` VALUES ('522631000000', '522600000000', '0,520000000000,522600000000', '黎平县', 3, 0);
INSERT INTO `sys_area` VALUES ('522632000000', '522600000000', '0,520000000000,522600000000', '榕江县', 3, 0);
INSERT INTO `sys_area` VALUES ('522633000000', '522600000000', '0,520000000000,522600000000', '从江县', 3, 0);
INSERT INTO `sys_area` VALUES ('522634000000', '522600000000', '0,520000000000,522600000000', '雷山县', 3, 0);
INSERT INTO `sys_area` VALUES ('522635000000', '522600000000', '0,520000000000,522600000000', '麻江县', 3, 0);
INSERT INTO `sys_area` VALUES ('522636000000', '522600000000', '0,520000000000,522600000000', '丹寨县', 3, 0);
INSERT INTO `sys_area` VALUES ('522700000000', '520000000000', '0,520000000000', '黔南布依族苗族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('522701000000', '522700000000', '0,520000000000,522700000000', '都匀市', 3, 0);
INSERT INTO `sys_area` VALUES ('522702000000', '522700000000', '0,520000000000,522700000000', '福泉市', 3, 0);
INSERT INTO `sys_area` VALUES ('522722000000', '522700000000', '0,520000000000,522700000000', '荔波县', 3, 0);
INSERT INTO `sys_area` VALUES ('522723000000', '522700000000', '0,520000000000,522700000000', '贵定县', 3, 0);
INSERT INTO `sys_area` VALUES ('522725000000', '522700000000', '0,520000000000,522700000000', '瓮安县', 3, 0);
INSERT INTO `sys_area` VALUES ('522726000000', '522700000000', '0,520000000000,522700000000', '独山县', 3, 0);
INSERT INTO `sys_area` VALUES ('522727000000', '522700000000', '0,520000000000,522700000000', '平塘县', 3, 0);
INSERT INTO `sys_area` VALUES ('522728000000', '522700000000', '0,520000000000,522700000000', '罗甸县', 3, 0);
INSERT INTO `sys_area` VALUES ('522729000000', '522700000000', '0,520000000000,522700000000', '长顺县', 3, 0);
INSERT INTO `sys_area` VALUES ('522730000000', '522700000000', '0,520000000000,522700000000', '龙里县', 3, 0);
INSERT INTO `sys_area` VALUES ('522731000000', '522700000000', '0,520000000000,522700000000', '惠水县', 3, 0);
INSERT INTO `sys_area` VALUES ('522732000000', '522700000000', '0,520000000000,522700000000', '三都水族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530000000000', '100000000000', '0,', '云南省', 1, 0);
INSERT INTO `sys_area` VALUES ('530100000000', '530000000000', '0,530000000000', '昆明市', 2, 0);
INSERT INTO `sys_area` VALUES ('530102000000', '530100000000', '0,530000000000,530100000000', '五华区', 3, 0);
INSERT INTO `sys_area` VALUES ('530103000000', '530100000000', '0,530000000000,530100000000', '盘龙区', 3, 0);
INSERT INTO `sys_area` VALUES ('530111000000', '530100000000', '0,530000000000,530100000000', '官渡区', 3, 0);
INSERT INTO `sys_area` VALUES ('530112000000', '530100000000', '0,530000000000,530100000000', '西山区', 3, 0);
INSERT INTO `sys_area` VALUES ('530113000000', '530100000000', '0,530000000000,530100000000', '东川区', 3, 0);
INSERT INTO `sys_area` VALUES ('530114000000', '530100000000', '0,530000000000,530100000000', '呈贡区', 3, 0);
INSERT INTO `sys_area` VALUES ('530122000000', '530100000000', '0,530000000000,530100000000', '晋宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('530124000000', '530100000000', '0,530000000000,530100000000', '富民县', 3, 0);
INSERT INTO `sys_area` VALUES ('530125000000', '530100000000', '0,530000000000,530100000000', '宜良县', 3, 0);
INSERT INTO `sys_area` VALUES ('530126000000', '530100000000', '0,530000000000,530100000000', '石林彝族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530127000000', '530100000000', '0,530000000000,530100000000', '嵩明县', 3, 0);
INSERT INTO `sys_area` VALUES ('530128000000', '530100000000', '0,530000000000,530100000000', '禄劝彝族苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530129000000', '530100000000', '0,530000000000,530100000000', '寻甸回族彝族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530181000000', '530100000000', '0,530000000000,530100000000', '安宁市', 3, 0);
INSERT INTO `sys_area` VALUES ('530300000000', '530000000000', '0,530000000000', '曲靖市', 2, 0);
INSERT INTO `sys_area` VALUES ('530302000000', '530300000000', '0,530000000000,530300000000', '麒麟区', 3, 0);
INSERT INTO `sys_area` VALUES ('530321000000', '530300000000', '0,530000000000,530300000000', '马龙县', 3, 0);
INSERT INTO `sys_area` VALUES ('530322000000', '530300000000', '0,530000000000,530300000000', '陆良县', 3, 0);
INSERT INTO `sys_area` VALUES ('530323000000', '530300000000', '0,530000000000,530300000000', '师宗县', 3, 0);
INSERT INTO `sys_area` VALUES ('530324000000', '530300000000', '0,530000000000,530300000000', '罗平县', 3, 0);
INSERT INTO `sys_area` VALUES ('530325000000', '530300000000', '0,530000000000,530300000000', '富源县', 3, 0);
INSERT INTO `sys_area` VALUES ('530326000000', '530300000000', '0,530000000000,530300000000', '会泽县', 3, 0);
INSERT INTO `sys_area` VALUES ('530328000000', '530300000000', '0,530000000000,530300000000', '沾益县', 3, 0);
INSERT INTO `sys_area` VALUES ('530381000000', '530300000000', '0,530000000000,530300000000', '宣威市', 3, 0);
INSERT INTO `sys_area` VALUES ('530400000000', '530000000000', '0,530000000000', '玉溪市', 2, 0);
INSERT INTO `sys_area` VALUES ('530402000000', '530400000000', '0,530000000000,530400000000', '红塔区', 3, 0);
INSERT INTO `sys_area` VALUES ('530421000000', '530400000000', '0,530000000000,530400000000', '江川县', 3, 0);
INSERT INTO `sys_area` VALUES ('530422000000', '530400000000', '0,530000000000,530400000000', '澄江县', 3, 0);
INSERT INTO `sys_area` VALUES ('530423000000', '530400000000', '0,530000000000,530400000000', '通海县', 3, 0);
INSERT INTO `sys_area` VALUES ('530424000000', '530400000000', '0,530000000000,530400000000', '华宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('530425000000', '530400000000', '0,530000000000,530400000000', '易门县', 3, 0);
INSERT INTO `sys_area` VALUES ('530426000000', '530400000000', '0,530000000000,530400000000', '峨山彝族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530427000000', '530400000000', '0,530000000000,530400000000', '新平彝族傣族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530428000000', '530400000000', '0,530000000000,530400000000', '元江哈尼族彝族傣族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530500000000', '530000000000', '0,530000000000', '保山市', 2, 0);
INSERT INTO `sys_area` VALUES ('530502000000', '530500000000', '0,530000000000,530500000000', '隆阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('530521000000', '530500000000', '0,530000000000,530500000000', '施甸县', 3, 0);
INSERT INTO `sys_area` VALUES ('530523000000', '530500000000', '0,530000000000,530500000000', '龙陵县', 3, 0);
INSERT INTO `sys_area` VALUES ('530524000000', '530500000000', '0,530000000000,530500000000', '昌宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('530581000000', '530500000000', '0,530000000000,530500000000', '腾冲市', 3, 0);
INSERT INTO `sys_area` VALUES ('530600000000', '530000000000', '0,530000000000', '昭通市', 2, 0);
INSERT INTO `sys_area` VALUES ('530602000000', '530600000000', '0,530000000000,530600000000', '昭阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('530621000000', '530600000000', '0,530000000000,530600000000', '鲁甸县', 3, 0);
INSERT INTO `sys_area` VALUES ('530622000000', '530600000000', '0,530000000000,530600000000', '巧家县', 3, 0);
INSERT INTO `sys_area` VALUES ('530623000000', '530600000000', '0,530000000000,530600000000', '盐津县', 3, 0);
INSERT INTO `sys_area` VALUES ('530624000000', '530600000000', '0,530000000000,530600000000', '大关县', 3, 0);
INSERT INTO `sys_area` VALUES ('530625000000', '530600000000', '0,530000000000,530600000000', '永善县', 3, 0);
INSERT INTO `sys_area` VALUES ('530626000000', '530600000000', '0,530000000000,530600000000', '绥江县', 3, 0);
INSERT INTO `sys_area` VALUES ('530627000000', '530600000000', '0,530000000000,530600000000', '镇雄县', 3, 0);
INSERT INTO `sys_area` VALUES ('530628000000', '530600000000', '0,530000000000,530600000000', '彝良县', 3, 0);
INSERT INTO `sys_area` VALUES ('530629000000', '530600000000', '0,530000000000,530600000000', '威信县', 3, 0);
INSERT INTO `sys_area` VALUES ('530630000000', '530600000000', '0,530000000000,530600000000', '水富县', 3, 0);
INSERT INTO `sys_area` VALUES ('530700000000', '530000000000', '0,530000000000', '丽江市', 2, 0);
INSERT INTO `sys_area` VALUES ('530702000000', '530700000000', '0,530000000000,530700000000', '古城区', 3, 0);
INSERT INTO `sys_area` VALUES ('530721000000', '530700000000', '0,530000000000,530700000000', '玉龙纳西族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530722000000', '530700000000', '0,530000000000,530700000000', '永胜县', 3, 0);
INSERT INTO `sys_area` VALUES ('530723000000', '530700000000', '0,530000000000,530700000000', '华坪县', 3, 0);
INSERT INTO `sys_area` VALUES ('530724000000', '530700000000', '0,530000000000,530700000000', '宁蒗彝族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530800000000', '530000000000', '0,530000000000', '普洱市', 2, 0);
INSERT INTO `sys_area` VALUES ('530802000000', '530800000000', '0,530000000000,530800000000', '思茅区', 3, 0);
INSERT INTO `sys_area` VALUES ('530821000000', '530800000000', '0,530000000000,530800000000', '宁洱哈尼族彝族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530822000000', '530800000000', '0,530000000000,530800000000', '墨江哈尼族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530823000000', '530800000000', '0,530000000000,530800000000', '景东彝族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530824000000', '530800000000', '0,530000000000,530800000000', '景谷傣族彝族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530825000000', '530800000000', '0,530000000000,530800000000', '镇沅彝族哈尼族拉祜族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530826000000', '530800000000', '0,530000000000,530800000000', '江城哈尼族彝族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530827000000', '530800000000', '0,530000000000,530800000000', '孟连傣族拉祜族佤族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530828000000', '530800000000', '0,530000000000,530800000000', '澜沧拉祜族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530829000000', '530800000000', '0,530000000000,530800000000', '西盟佤族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530900000000', '530000000000', '0,530000000000', '临沧市', 2, 0);
INSERT INTO `sys_area` VALUES ('530902000000', '530900000000', '0,530000000000,530900000000', '临翔区', 3, 0);
INSERT INTO `sys_area` VALUES ('530921000000', '530900000000', '0,530000000000,530900000000', '凤庆县', 3, 0);
INSERT INTO `sys_area` VALUES ('530922000000', '530900000000', '0,530000000000,530900000000', '云县', 3, 0);
INSERT INTO `sys_area` VALUES ('530923000000', '530900000000', '0,530000000000,530900000000', '永德县', 3, 0);
INSERT INTO `sys_area` VALUES ('530924000000', '530900000000', '0,530000000000,530900000000', '镇康县', 3, 0);
INSERT INTO `sys_area` VALUES ('530925000000', '530900000000', '0,530000000000,530900000000', '双江拉祜族佤族布朗族傣族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530926000000', '530900000000', '0,530000000000,530900000000', '耿马傣族佤族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('530927000000', '530900000000', '0,530000000000,530900000000', '沧源佤族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('532300000000', '530000000000', '0,530000000000', '楚雄彝族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('532301000000', '532300000000', '0,530000000000,532300000000', '楚雄市', 3, 0);
INSERT INTO `sys_area` VALUES ('532322000000', '532300000000', '0,530000000000,532300000000', '双柏县', 3, 0);
INSERT INTO `sys_area` VALUES ('532323000000', '532300000000', '0,530000000000,532300000000', '牟定县', 3, 0);
INSERT INTO `sys_area` VALUES ('532324000000', '532300000000', '0,530000000000,532300000000', '南华县', 3, 0);
INSERT INTO `sys_area` VALUES ('532325000000', '532300000000', '0,530000000000,532300000000', '姚安县', 3, 0);
INSERT INTO `sys_area` VALUES ('532326000000', '532300000000', '0,530000000000,532300000000', '大姚县', 3, 0);
INSERT INTO `sys_area` VALUES ('532327000000', '532300000000', '0,530000000000,532300000000', '永仁县', 3, 0);
INSERT INTO `sys_area` VALUES ('532328000000', '532300000000', '0,530000000000,532300000000', '元谋县', 3, 0);
INSERT INTO `sys_area` VALUES ('532329000000', '532300000000', '0,530000000000,532300000000', '武定县', 3, 0);
INSERT INTO `sys_area` VALUES ('532331000000', '532300000000', '0,530000000000,532300000000', '禄丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('532500000000', '530000000000', '0,530000000000', '红河哈尼族彝族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('532501000000', '532500000000', '0,530000000000,532500000000', '个旧市', 3, 0);
INSERT INTO `sys_area` VALUES ('532502000000', '532500000000', '0,530000000000,532500000000', '开远市', 3, 0);
INSERT INTO `sys_area` VALUES ('532503000000', '532500000000', '0,530000000000,532500000000', '蒙自市', 3, 0);
INSERT INTO `sys_area` VALUES ('532504000000', '532500000000', '0,530000000000,532500000000', '弥勒市', 3, 0);
INSERT INTO `sys_area` VALUES ('532523000000', '532500000000', '0,530000000000,532500000000', '屏边苗族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('532524000000', '532500000000', '0,530000000000,532500000000', '建水县', 3, 0);
INSERT INTO `sys_area` VALUES ('532525000000', '532500000000', '0,530000000000,532500000000', '石屏县', 3, 0);
INSERT INTO `sys_area` VALUES ('532527000000', '532500000000', '0,530000000000,532500000000', '泸西县', 3, 0);
INSERT INTO `sys_area` VALUES ('532528000000', '532500000000', '0,530000000000,532500000000', '元阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('532529000000', '532500000000', '0,530000000000,532500000000', '红河县', 3, 0);
INSERT INTO `sys_area` VALUES ('532530000000', '532500000000', '0,530000000000,532500000000', '金平苗族瑶族傣族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('532531000000', '532500000000', '0,530000000000,532500000000', '绿春县', 3, 0);
INSERT INTO `sys_area` VALUES ('532532000000', '532500000000', '0,530000000000,532500000000', '河口瑶族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('532600000000', '530000000000', '0,530000000000', '文山壮族苗族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('532601000000', '532600000000', '0,530000000000,532600000000', '文山市', 3, 0);
INSERT INTO `sys_area` VALUES ('532622000000', '532600000000', '0,530000000000,532600000000', '砚山县', 3, 0);
INSERT INTO `sys_area` VALUES ('532623000000', '532600000000', '0,530000000000,532600000000', '西畴县', 3, 0);
INSERT INTO `sys_area` VALUES ('532624000000', '532600000000', '0,530000000000,532600000000', '麻栗坡县', 3, 0);
INSERT INTO `sys_area` VALUES ('532625000000', '532600000000', '0,530000000000,532600000000', '马关县', 3, 0);
INSERT INTO `sys_area` VALUES ('532626000000', '532600000000', '0,530000000000,532600000000', '丘北县', 3, 0);
INSERT INTO `sys_area` VALUES ('532627000000', '532600000000', '0,530000000000,532600000000', '广南县', 3, 0);
INSERT INTO `sys_area` VALUES ('532628000000', '532600000000', '0,530000000000,532600000000', '富宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('532800000000', '530000000000', '0,530000000000', '西双版纳傣族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('532801000000', '532800000000', '0,530000000000,532800000000', '景洪市', 3, 0);
INSERT INTO `sys_area` VALUES ('532822000000', '532800000000', '0,530000000000,532800000000', '勐海县', 3, 0);
INSERT INTO `sys_area` VALUES ('532823000000', '532800000000', '0,530000000000,532800000000', '勐腊县', 3, 0);
INSERT INTO `sys_area` VALUES ('532900000000', '530000000000', '0,530000000000', '大理白族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('532901000000', '532900000000', '0,530000000000,532900000000', '大理市', 3, 0);
INSERT INTO `sys_area` VALUES ('532922000000', '532900000000', '0,530000000000,532900000000', '漾濞彝族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('532923000000', '532900000000', '0,530000000000,532900000000', '祥云县', 3, 0);
INSERT INTO `sys_area` VALUES ('532924000000', '532900000000', '0,530000000000,532900000000', '宾川县', 3, 0);
INSERT INTO `sys_area` VALUES ('532925000000', '532900000000', '0,530000000000,532900000000', '弥渡县', 3, 0);
INSERT INTO `sys_area` VALUES ('532926000000', '532900000000', '0,530000000000,532900000000', '南涧彝族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('532927000000', '532900000000', '0,530000000000,532900000000', '巍山彝族回族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('532928000000', '532900000000', '0,530000000000,532900000000', '永平县', 3, 0);
INSERT INTO `sys_area` VALUES ('532929000000', '532900000000', '0,530000000000,532900000000', '云龙县', 3, 0);
INSERT INTO `sys_area` VALUES ('532930000000', '532900000000', '0,530000000000,532900000000', '洱源县', 3, 0);
INSERT INTO `sys_area` VALUES ('532931000000', '532900000000', '0,530000000000,532900000000', '剑川县', 3, 0);
INSERT INTO `sys_area` VALUES ('532932000000', '532900000000', '0,530000000000,532900000000', '鹤庆县', 3, 0);
INSERT INTO `sys_area` VALUES ('533100000000', '530000000000', '0,530000000000', '德宏傣族景颇族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('533102000000', '533100000000', '0,530000000000,533100000000', '瑞丽市', 3, 0);
INSERT INTO `sys_area` VALUES ('533103000000', '533100000000', '0,530000000000,533100000000', '芒市', 3, 0);
INSERT INTO `sys_area` VALUES ('533122000000', '533100000000', '0,530000000000,533100000000', '梁河县', 3, 0);
INSERT INTO `sys_area` VALUES ('533123000000', '533100000000', '0,530000000000,533100000000', '盈江县', 3, 0);
INSERT INTO `sys_area` VALUES ('533124000000', '533100000000', '0,530000000000,533100000000', '陇川县', 3, 0);
INSERT INTO `sys_area` VALUES ('533300000000', '530000000000', '0,530000000000', '怒江傈僳族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('533321000000', '533300000000', '0,530000000000,533300000000', '泸水县', 3, 0);
INSERT INTO `sys_area` VALUES ('533323000000', '533300000000', '0,530000000000,533300000000', '福贡县', 3, 0);
INSERT INTO `sys_area` VALUES ('533324000000', '533300000000', '0,530000000000,533300000000', '贡山独龙族怒族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('533325000000', '533300000000', '0,530000000000,533300000000', '兰坪白族普米族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('533400000000', '530000000000', '0,530000000000', '迪庆藏族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('533401000000', '533400000000', '0,530000000000,533400000000', '香格里拉市', 3, 0);
INSERT INTO `sys_area` VALUES ('533422000000', '533400000000', '0,530000000000,533400000000', '德钦县', 3, 0);
INSERT INTO `sys_area` VALUES ('533423000000', '533400000000', '0,530000000000,533400000000', '维西傈僳族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('540000000000', '100000000000', '0,', '西藏自治区', 1, 0);
INSERT INTO `sys_area` VALUES ('540100000000', '540000000000', '0,540000000000', '拉萨市', 2, 0);
INSERT INTO `sys_area` VALUES ('540102000000', '540100000000', '0,540000000000,540100000000', '城关区', 3, 0);
INSERT INTO `sys_area` VALUES ('540121000000', '540100000000', '0,540000000000,540100000000', '林周县', 3, 0);
INSERT INTO `sys_area` VALUES ('540122000000', '540100000000', '0,540000000000,540100000000', '当雄县', 3, 0);
INSERT INTO `sys_area` VALUES ('540123000000', '540100000000', '0,540000000000,540100000000', '尼木县', 3, 0);
INSERT INTO `sys_area` VALUES ('540124000000', '540100000000', '0,540000000000,540100000000', '曲水县', 3, 0);
INSERT INTO `sys_area` VALUES ('540125000000', '540100000000', '0,540000000000,540100000000', '堆龙德庆县', 3, 0);
INSERT INTO `sys_area` VALUES ('540126000000', '540100000000', '0,540000000000,540100000000', '达孜县', 3, 0);
INSERT INTO `sys_area` VALUES ('540127000000', '540100000000', '0,540000000000,540100000000', '墨竹工卡县', 3, 0);
INSERT INTO `sys_area` VALUES ('540200000000', '540000000000', '0,540000000000', '日喀则市', 2, 0);
INSERT INTO `sys_area` VALUES ('540202000000', '540200000000', '0,540000000000,540200000000', '桑珠孜区', 3, 0);
INSERT INTO `sys_area` VALUES ('540221000000', '540200000000', '0,540000000000,540200000000', '南木林县', 3, 0);
INSERT INTO `sys_area` VALUES ('540222000000', '540200000000', '0,540000000000,540200000000', '江孜县', 3, 0);
INSERT INTO `sys_area` VALUES ('540223000000', '540200000000', '0,540000000000,540200000000', '定日县', 3, 0);
INSERT INTO `sys_area` VALUES ('540224000000', '540200000000', '0,540000000000,540200000000', '萨迦县', 3, 0);
INSERT INTO `sys_area` VALUES ('540225000000', '540200000000', '0,540000000000,540200000000', '拉孜县', 3, 0);
INSERT INTO `sys_area` VALUES ('540226000000', '540200000000', '0,540000000000,540200000000', '昂仁县', 3, 0);
INSERT INTO `sys_area` VALUES ('540227000000', '540200000000', '0,540000000000,540200000000', '谢通门县', 3, 0);
INSERT INTO `sys_area` VALUES ('540228000000', '540200000000', '0,540000000000,540200000000', '白朗县', 3, 0);
INSERT INTO `sys_area` VALUES ('540229000000', '540200000000', '0,540000000000,540200000000', '仁布县', 3, 0);
INSERT INTO `sys_area` VALUES ('540230000000', '540200000000', '0,540000000000,540200000000', '康马县', 3, 0);
INSERT INTO `sys_area` VALUES ('540231000000', '540200000000', '0,540000000000,540200000000', '定结县', 3, 0);
INSERT INTO `sys_area` VALUES ('540232000000', '540200000000', '0,540000000000,540200000000', '仲巴县', 3, 0);
INSERT INTO `sys_area` VALUES ('540233000000', '540200000000', '0,540000000000,540200000000', '亚东县', 3, 0);
INSERT INTO `sys_area` VALUES ('540234000000', '540200000000', '0,540000000000,540200000000', '吉隆县', 3, 0);
INSERT INTO `sys_area` VALUES ('540235000000', '540200000000', '0,540000000000,540200000000', '聂拉木县', 3, 0);
INSERT INTO `sys_area` VALUES ('540236000000', '540200000000', '0,540000000000,540200000000', '萨嘎县', 3, 0);
INSERT INTO `sys_area` VALUES ('540237000000', '540200000000', '0,540000000000,540200000000', '岗巴县', 3, 0);
INSERT INTO `sys_area` VALUES ('540300000000', '540000000000', '0,540000000000', '昌都市', 2, 0);
INSERT INTO `sys_area` VALUES ('540302000000', '540300000000', '0,540000000000,540300000000', '卡若区', 3, 0);
INSERT INTO `sys_area` VALUES ('540321000000', '540300000000', '0,540000000000,540300000000', '江达县', 3, 0);
INSERT INTO `sys_area` VALUES ('540322000000', '540300000000', '0,540000000000,540300000000', '贡觉县', 3, 0);
INSERT INTO `sys_area` VALUES ('540323000000', '540300000000', '0,540000000000,540300000000', '类乌齐县', 3, 0);
INSERT INTO `sys_area` VALUES ('540324000000', '540300000000', '0,540000000000,540300000000', '丁青县', 3, 0);
INSERT INTO `sys_area` VALUES ('540325000000', '540300000000', '0,540000000000,540300000000', '察雅县', 3, 0);
INSERT INTO `sys_area` VALUES ('540326000000', '540300000000', '0,540000000000,540300000000', '八宿县', 3, 0);
INSERT INTO `sys_area` VALUES ('540327000000', '540300000000', '0,540000000000,540300000000', '左贡县', 3, 0);
INSERT INTO `sys_area` VALUES ('540328000000', '540300000000', '0,540000000000,540300000000', '芒康县', 3, 0);
INSERT INTO `sys_area` VALUES ('540329000000', '540300000000', '0,540000000000,540300000000', '洛隆县', 3, 0);
INSERT INTO `sys_area` VALUES ('540330000000', '540300000000', '0,540000000000,540300000000', '边坝县', 3, 0);
INSERT INTO `sys_area` VALUES ('540400000000', '540000000000', '0,540000000000', '林芝市', 2, 0);
INSERT INTO `sys_area` VALUES ('540402000000', '540400000000', '0,540000000000,540400000000', '巴宜区', 3, 0);
INSERT INTO `sys_area` VALUES ('540421000000', '540400000000', '0,540000000000,540400000000', '工布江达县', 3, 0);
INSERT INTO `sys_area` VALUES ('540422000000', '540400000000', '0,540000000000,540400000000', '米林县', 3, 0);
INSERT INTO `sys_area` VALUES ('540423000000', '540400000000', '0,540000000000,540400000000', '墨脱县', 3, 0);
INSERT INTO `sys_area` VALUES ('540424000000', '540400000000', '0,540000000000,540400000000', '波密县', 3, 0);
INSERT INTO `sys_area` VALUES ('540425000000', '540400000000', '0,540000000000,540400000000', '察隅县', 3, 0);
INSERT INTO `sys_area` VALUES ('540426000000', '540400000000', '0,540000000000,540400000000', '朗县', 3, 0);
INSERT INTO `sys_area` VALUES ('542200000000', '540000000000', '0,540000000000', '山南地区', 2, 0);
INSERT INTO `sys_area` VALUES ('542221000000', '542200000000', '0,540000000000,542200000000', '乃东县', 3, 0);
INSERT INTO `sys_area` VALUES ('542222000000', '542200000000', '0,540000000000,542200000000', '扎囊县', 3, 0);
INSERT INTO `sys_area` VALUES ('542223000000', '542200000000', '0,540000000000,542200000000', '贡嘎县', 3, 0);
INSERT INTO `sys_area` VALUES ('542224000000', '542200000000', '0,540000000000,542200000000', '桑日县', 3, 0);
INSERT INTO `sys_area` VALUES ('542225000000', '542200000000', '0,540000000000,542200000000', '琼结县', 3, 0);
INSERT INTO `sys_area` VALUES ('542226000000', '542200000000', '0,540000000000,542200000000', '曲松县', 3, 0);
INSERT INTO `sys_area` VALUES ('542227000000', '542200000000', '0,540000000000,542200000000', '措美县', 3, 0);
INSERT INTO `sys_area` VALUES ('542228000000', '542200000000', '0,540000000000,542200000000', '洛扎县', 3, 0);
INSERT INTO `sys_area` VALUES ('542229000000', '542200000000', '0,540000000000,542200000000', '加查县', 3, 0);
INSERT INTO `sys_area` VALUES ('542231000000', '542200000000', '0,540000000000,542200000000', '隆子县', 3, 0);
INSERT INTO `sys_area` VALUES ('542232000000', '542200000000', '0,540000000000,542200000000', '错那县', 3, 0);
INSERT INTO `sys_area` VALUES ('542233000000', '542200000000', '0,540000000000,542200000000', '浪卡子县', 3, 0);
INSERT INTO `sys_area` VALUES ('542400000000', '540000000000', '0,540000000000', '那曲地区', 2, 0);
INSERT INTO `sys_area` VALUES ('542421000000', '542400000000', '0,540000000000,542400000000', '那曲县', 3, 0);
INSERT INTO `sys_area` VALUES ('542422000000', '542400000000', '0,540000000000,542400000000', '嘉黎县', 3, 0);
INSERT INTO `sys_area` VALUES ('542423000000', '542400000000', '0,540000000000,542400000000', '比如县', 3, 0);
INSERT INTO `sys_area` VALUES ('542424000000', '542400000000', '0,540000000000,542400000000', '聂荣县', 3, 0);
INSERT INTO `sys_area` VALUES ('542425000000', '542400000000', '0,540000000000,542400000000', '安多县', 3, 0);
INSERT INTO `sys_area` VALUES ('542426000000', '542400000000', '0,540000000000,542400000000', '申扎县', 3, 0);
INSERT INTO `sys_area` VALUES ('542427000000', '542400000000', '0,540000000000,542400000000', '索县', 3, 0);
INSERT INTO `sys_area` VALUES ('542428000000', '542400000000', '0,540000000000,542400000000', '班戈县', 3, 0);
INSERT INTO `sys_area` VALUES ('542429000000', '542400000000', '0,540000000000,542400000000', '巴青县', 3, 0);
INSERT INTO `sys_area` VALUES ('542430000000', '542400000000', '0,540000000000,542400000000', '尼玛县', 3, 0);
INSERT INTO `sys_area` VALUES ('542431000000', '542400000000', '0,540000000000,542400000000', '双湖县', 3, 0);
INSERT INTO `sys_area` VALUES ('542500000000', '540000000000', '0,540000000000', '阿里地区', 2, 0);
INSERT INTO `sys_area` VALUES ('542521000000', '542500000000', '0,540000000000,542500000000', '普兰县', 3, 0);
INSERT INTO `sys_area` VALUES ('542522000000', '542500000000', '0,540000000000,542500000000', '札达县', 3, 0);
INSERT INTO `sys_area` VALUES ('542523000000', '542500000000', '0,540000000000,542500000000', '噶尔县', 3, 0);
INSERT INTO `sys_area` VALUES ('542524000000', '542500000000', '0,540000000000,542500000000', '日土县', 3, 0);
INSERT INTO `sys_area` VALUES ('542525000000', '542500000000', '0,540000000000,542500000000', '革吉县', 3, 0);
INSERT INTO `sys_area` VALUES ('542526000000', '542500000000', '0,540000000000,542500000000', '改则县', 3, 0);
INSERT INTO `sys_area` VALUES ('542527000000', '542500000000', '0,540000000000,542500000000', '措勤县', 3, 0);
INSERT INTO `sys_area` VALUES ('610000000000', '100000000000', '0,', '陕西省', 1, 0);
INSERT INTO `sys_area` VALUES ('610100000000', '610000000000', '0,610000000000', '西安市', 2, 0);
INSERT INTO `sys_area` VALUES ('610102000000', '610100000000', '0,610000000000,610100000000', '新城区', 3, 0);
INSERT INTO `sys_area` VALUES ('610103000000', '610100000000', '0,610000000000,610100000000', '碑林区', 3, 0);
INSERT INTO `sys_area` VALUES ('610104000000', '610100000000', '0,610000000000,610100000000', '莲湖区', 3, 0);
INSERT INTO `sys_area` VALUES ('610111000000', '610100000000', '0,610000000000,610100000000', '灞桥区', 3, 0);
INSERT INTO `sys_area` VALUES ('610112000000', '610100000000', '0,610000000000,610100000000', '未央区', 3, 0);
INSERT INTO `sys_area` VALUES ('610113000000', '610100000000', '0,610000000000,610100000000', '雁塔区', 3, 0);
INSERT INTO `sys_area` VALUES ('610114000000', '610100000000', '0,610000000000,610100000000', '阎良区', 3, 0);
INSERT INTO `sys_area` VALUES ('610115000000', '610100000000', '0,610000000000,610100000000', '临潼区', 3, 0);
INSERT INTO `sys_area` VALUES ('610116000000', '610100000000', '0,610000000000,610100000000', '长安区', 3, 0);
INSERT INTO `sys_area` VALUES ('610117000000', '610100000000', '0,610000000000,610100000000', '高陵区', 3, 0);
INSERT INTO `sys_area` VALUES ('610122000000', '610100000000', '0,610000000000,610100000000', '蓝田县', 3, 0);
INSERT INTO `sys_area` VALUES ('610124000000', '610100000000', '0,610000000000,610100000000', '周至县', 3, 0);
INSERT INTO `sys_area` VALUES ('610125000000', '610100000000', '0,610000000000,610100000000', '户县', 3, 0);
INSERT INTO `sys_area` VALUES ('610200000000', '610000000000', '0,610000000000', '铜川市', 2, 0);
INSERT INTO `sys_area` VALUES ('610202000000', '610200000000', '0,610000000000,610200000000', '王益区', 3, 0);
INSERT INTO `sys_area` VALUES ('610203000000', '610200000000', '0,610000000000,610200000000', '印台区', 3, 0);
INSERT INTO `sys_area` VALUES ('610204000000', '610200000000', '0,610000000000,610200000000', '耀州区', 3, 0);
INSERT INTO `sys_area` VALUES ('610222000000', '610200000000', '0,610000000000,610200000000', '宜君县', 3, 0);
INSERT INTO `sys_area` VALUES ('610300000000', '610000000000', '0,610000000000', '宝鸡市', 2, 0);
INSERT INTO `sys_area` VALUES ('610302000000', '610300000000', '0,610000000000,610300000000', '渭滨区', 3, 0);
INSERT INTO `sys_area` VALUES ('610303000000', '610300000000', '0,610000000000,610300000000', '金台区', 3, 0);
INSERT INTO `sys_area` VALUES ('610304000000', '610300000000', '0,610000000000,610300000000', '陈仓区', 3, 0);
INSERT INTO `sys_area` VALUES ('610322000000', '610300000000', '0,610000000000,610300000000', '凤翔县', 3, 0);
INSERT INTO `sys_area` VALUES ('610323000000', '610300000000', '0,610000000000,610300000000', '岐山县', 3, 0);
INSERT INTO `sys_area` VALUES ('610324000000', '610300000000', '0,610000000000,610300000000', '扶风县', 3, 0);
INSERT INTO `sys_area` VALUES ('610326000000', '610300000000', '0,610000000000,610300000000', '眉县', 3, 0);
INSERT INTO `sys_area` VALUES ('610327000000', '610300000000', '0,610000000000,610300000000', '陇县', 3, 0);
INSERT INTO `sys_area` VALUES ('610328000000', '610300000000', '0,610000000000,610300000000', '千阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('610329000000', '610300000000', '0,610000000000,610300000000', '麟游县', 3, 0);
INSERT INTO `sys_area` VALUES ('610330000000', '610300000000', '0,610000000000,610300000000', '凤县', 3, 0);
INSERT INTO `sys_area` VALUES ('610331000000', '610300000000', '0,610000000000,610300000000', '太白县', 3, 0);
INSERT INTO `sys_area` VALUES ('610400000000', '610000000000', '0,610000000000', '咸阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('610402000000', '610400000000', '0,610000000000,610400000000', '秦都区', 3, 0);
INSERT INTO `sys_area` VALUES ('610403000000', '610400000000', '0,610000000000,610400000000', '杨陵区', 3, 0);
INSERT INTO `sys_area` VALUES ('610404000000', '610400000000', '0,610000000000,610400000000', '渭城区', 3, 0);
INSERT INTO `sys_area` VALUES ('610422000000', '610400000000', '0,610000000000,610400000000', '三原县', 3, 0);
INSERT INTO `sys_area` VALUES ('610423000000', '610400000000', '0,610000000000,610400000000', '泾阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('610424000000', '610400000000', '0,610000000000,610400000000', '乾县', 3, 0);
INSERT INTO `sys_area` VALUES ('610425000000', '610400000000', '0,610000000000,610400000000', '礼泉县', 3, 0);
INSERT INTO `sys_area` VALUES ('610426000000', '610400000000', '0,610000000000,610400000000', '永寿县', 3, 0);
INSERT INTO `sys_area` VALUES ('610427000000', '610400000000', '0,610000000000,610400000000', '彬县', 3, 0);
INSERT INTO `sys_area` VALUES ('610428000000', '610400000000', '0,610000000000,610400000000', '长武县', 3, 0);
INSERT INTO `sys_area` VALUES ('610429000000', '610400000000', '0,610000000000,610400000000', '旬邑县', 3, 0);
INSERT INTO `sys_area` VALUES ('610430000000', '610400000000', '0,610000000000,610400000000', '淳化县', 3, 0);
INSERT INTO `sys_area` VALUES ('610431000000', '610400000000', '0,610000000000,610400000000', '武功县', 3, 0);
INSERT INTO `sys_area` VALUES ('610481000000', '610400000000', '0,610000000000,610400000000', '兴平市', 3, 0);
INSERT INTO `sys_area` VALUES ('610500000000', '610000000000', '0,610000000000', '渭南市', 2, 0);
INSERT INTO `sys_area` VALUES ('610502000000', '610500000000', '0,610000000000,610500000000', '临渭区', 3, 0);
INSERT INTO `sys_area` VALUES ('610521000000', '610500000000', '0,610000000000,610500000000', '华县', 3, 0);
INSERT INTO `sys_area` VALUES ('610522000000', '610500000000', '0,610000000000,610500000000', '潼关县', 3, 0);
INSERT INTO `sys_area` VALUES ('610523000000', '610500000000', '0,610000000000,610500000000', '大荔县', 3, 0);
INSERT INTO `sys_area` VALUES ('610524000000', '610500000000', '0,610000000000,610500000000', '合阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('610525000000', '610500000000', '0,610000000000,610500000000', '澄城县', 3, 0);
INSERT INTO `sys_area` VALUES ('610526000000', '610500000000', '0,610000000000,610500000000', '蒲城县', 3, 0);
INSERT INTO `sys_area` VALUES ('610527000000', '610500000000', '0,610000000000,610500000000', '白水县', 3, 0);
INSERT INTO `sys_area` VALUES ('610528000000', '610500000000', '0,610000000000,610500000000', '富平县', 3, 0);
INSERT INTO `sys_area` VALUES ('610581000000', '610500000000', '0,610000000000,610500000000', '韩城市', 3, 0);
INSERT INTO `sys_area` VALUES ('610582000000', '610500000000', '0,610000000000,610500000000', '华阴市', 3, 0);
INSERT INTO `sys_area` VALUES ('610600000000', '610000000000', '0,610000000000', '延安市', 2, 0);
INSERT INTO `sys_area` VALUES ('610602000000', '610600000000', '0,610000000000,610600000000', '宝塔区', 3, 0);
INSERT INTO `sys_area` VALUES ('610621000000', '610600000000', '0,610000000000,610600000000', '延长县', 3, 0);
INSERT INTO `sys_area` VALUES ('610622000000', '610600000000', '0,610000000000,610600000000', '延川县', 3, 0);
INSERT INTO `sys_area` VALUES ('610623000000', '610600000000', '0,610000000000,610600000000', '子长县', 3, 0);
INSERT INTO `sys_area` VALUES ('610624000000', '610600000000', '0,610000000000,610600000000', '安塞县', 3, 0);
INSERT INTO `sys_area` VALUES ('610625000000', '610600000000', '0,610000000000,610600000000', '志丹县', 3, 0);
INSERT INTO `sys_area` VALUES ('610626000000', '610600000000', '0,610000000000,610600000000', '吴起县', 3, 0);
INSERT INTO `sys_area` VALUES ('610627000000', '610600000000', '0,610000000000,610600000000', '甘泉县', 3, 0);
INSERT INTO `sys_area` VALUES ('610628000000', '610600000000', '0,610000000000,610600000000', '富县', 3, 0);
INSERT INTO `sys_area` VALUES ('610629000000', '610600000000', '0,610000000000,610600000000', '洛川县', 3, 0);
INSERT INTO `sys_area` VALUES ('610630000000', '610600000000', '0,610000000000,610600000000', '宜川县', 3, 0);
INSERT INTO `sys_area` VALUES ('610631000000', '610600000000', '0,610000000000,610600000000', '黄龙县', 3, 0);
INSERT INTO `sys_area` VALUES ('610632000000', '610600000000', '0,610000000000,610600000000', '黄陵县', 3, 0);
INSERT INTO `sys_area` VALUES ('610700000000', '610000000000', '0,610000000000', '汉中市', 2, 0);
INSERT INTO `sys_area` VALUES ('610702000000', '610700000000', '0,610000000000,610700000000', '汉台区', 3, 0);
INSERT INTO `sys_area` VALUES ('610721000000', '610700000000', '0,610000000000,610700000000', '南郑县', 3, 0);
INSERT INTO `sys_area` VALUES ('610722000000', '610700000000', '0,610000000000,610700000000', '城固县', 3, 0);
INSERT INTO `sys_area` VALUES ('610723000000', '610700000000', '0,610000000000,610700000000', '洋县', 3, 0);
INSERT INTO `sys_area` VALUES ('610724000000', '610700000000', '0,610000000000,610700000000', '西乡县', 3, 0);
INSERT INTO `sys_area` VALUES ('610725000000', '610700000000', '0,610000000000,610700000000', '勉县', 3, 0);
INSERT INTO `sys_area` VALUES ('610726000000', '610700000000', '0,610000000000,610700000000', '宁强县', 3, 0);
INSERT INTO `sys_area` VALUES ('610727000000', '610700000000', '0,610000000000,610700000000', '略阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('610728000000', '610700000000', '0,610000000000,610700000000', '镇巴县', 3, 0);
INSERT INTO `sys_area` VALUES ('610729000000', '610700000000', '0,610000000000,610700000000', '留坝县', 3, 0);
INSERT INTO `sys_area` VALUES ('610730000000', '610700000000', '0,610000000000,610700000000', '佛坪县', 3, 0);
INSERT INTO `sys_area` VALUES ('610800000000', '610000000000', '0,610000000000', '榆林市', 2, 0);
INSERT INTO `sys_area` VALUES ('610802000000', '610800000000', '0,610000000000,610800000000', '榆阳区', 3, 0);
INSERT INTO `sys_area` VALUES ('610821000000', '610800000000', '0,610000000000,610800000000', '神木县', 3, 0);
INSERT INTO `sys_area` VALUES ('610822000000', '610800000000', '0,610000000000,610800000000', '府谷县', 3, 0);
INSERT INTO `sys_area` VALUES ('610823000000', '610800000000', '0,610000000000,610800000000', '横山县', 3, 0);
INSERT INTO `sys_area` VALUES ('610824000000', '610800000000', '0,610000000000,610800000000', '靖边县', 3, 0);
INSERT INTO `sys_area` VALUES ('610825000000', '610800000000', '0,610000000000,610800000000', '定边县', 3, 0);
INSERT INTO `sys_area` VALUES ('610826000000', '610800000000', '0,610000000000,610800000000', '绥德县', 3, 0);
INSERT INTO `sys_area` VALUES ('610827000000', '610800000000', '0,610000000000,610800000000', '米脂县', 3, 0);
INSERT INTO `sys_area` VALUES ('610828000000', '610800000000', '0,610000000000,610800000000', '佳县', 3, 0);
INSERT INTO `sys_area` VALUES ('610829000000', '610800000000', '0,610000000000,610800000000', '吴堡县', 3, 0);
INSERT INTO `sys_area` VALUES ('610830000000', '610800000000', '0,610000000000,610800000000', '清涧县', 3, 0);
INSERT INTO `sys_area` VALUES ('610831000000', '610800000000', '0,610000000000,610800000000', '子洲县', 3, 0);
INSERT INTO `sys_area` VALUES ('610900000000', '610000000000', '0,610000000000', '安康市', 2, 0);
INSERT INTO `sys_area` VALUES ('610902000000', '610900000000', '0,610000000000,610900000000', '汉滨区', 3, 0);
INSERT INTO `sys_area` VALUES ('610921000000', '610900000000', '0,610000000000,610900000000', '汉阴县', 3, 0);
INSERT INTO `sys_area` VALUES ('610922000000', '610900000000', '0,610000000000,610900000000', '石泉县', 3, 0);
INSERT INTO `sys_area` VALUES ('610923000000', '610900000000', '0,610000000000,610900000000', '宁陕县', 3, 0);
INSERT INTO `sys_area` VALUES ('610924000000', '610900000000', '0,610000000000,610900000000', '紫阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('610925000000', '610900000000', '0,610000000000,610900000000', '岚皋县', 3, 0);
INSERT INTO `sys_area` VALUES ('610926000000', '610900000000', '0,610000000000,610900000000', '平利县', 3, 0);
INSERT INTO `sys_area` VALUES ('610927000000', '610900000000', '0,610000000000,610900000000', '镇坪县', 3, 0);
INSERT INTO `sys_area` VALUES ('610928000000', '610900000000', '0,610000000000,610900000000', '旬阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('610929000000', '610900000000', '0,610000000000,610900000000', '白河县', 3, 0);
INSERT INTO `sys_area` VALUES ('611000000000', '610000000000', '0,610000000000', '商洛市', 2, 0);
INSERT INTO `sys_area` VALUES ('611002000000', '611000000000', '0,610000000000,611000000000', '商州区', 3, 0);
INSERT INTO `sys_area` VALUES ('611021000000', '611000000000', '0,610000000000,611000000000', '洛南县', 3, 0);
INSERT INTO `sys_area` VALUES ('611022000000', '611000000000', '0,610000000000,611000000000', '丹凤县', 3, 0);
INSERT INTO `sys_area` VALUES ('611023000000', '611000000000', '0,610000000000,611000000000', '商南县', 3, 0);
INSERT INTO `sys_area` VALUES ('611024000000', '611000000000', '0,610000000000,611000000000', '山阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('611025000000', '611000000000', '0,610000000000,611000000000', '镇安县', 3, 0);
INSERT INTO `sys_area` VALUES ('611026000000', '611000000000', '0,610000000000,611000000000', '柞水县', 3, 0);
INSERT INTO `sys_area` VALUES ('620000000000', '100000000000', '0,', '甘肃省', 1, 0);
INSERT INTO `sys_area` VALUES ('620100000000', '620000000000', '0,620000000000', '兰州市', 2, 0);
INSERT INTO `sys_area` VALUES ('620102000000', '620100000000', '0,620000000000,620100000000', '城关区', 3, 0);
INSERT INTO `sys_area` VALUES ('620103000000', '620100000000', '0,620000000000,620100000000', '七里河区', 3, 0);
INSERT INTO `sys_area` VALUES ('620104000000', '620100000000', '0,620000000000,620100000000', '西固区', 3, 0);
INSERT INTO `sys_area` VALUES ('620105000000', '620100000000', '0,620000000000,620100000000', '安宁区', 3, 0);
INSERT INTO `sys_area` VALUES ('620111000000', '620100000000', '0,620000000000,620100000000', '红古区', 3, 0);
INSERT INTO `sys_area` VALUES ('620121000000', '620100000000', '0,620000000000,620100000000', '永登县', 3, 0);
INSERT INTO `sys_area` VALUES ('620122000000', '620100000000', '0,620000000000,620100000000', '皋兰县', 3, 0);
INSERT INTO `sys_area` VALUES ('620123000000', '620100000000', '0,620000000000,620100000000', '榆中县', 3, 0);
INSERT INTO `sys_area` VALUES ('620200000000', '620000000000', '0,620000000000', '嘉峪关市', 2, 0);
INSERT INTO `sys_area` VALUES ('620201100000', '620200000000', '0,620000000000,620200000000', '新城镇', 3, 0);
INSERT INTO `sys_area` VALUES ('620201101000', '620200000000', '0,620000000000,620200000000', '峪泉镇', 3, 0);
INSERT INTO `sys_area` VALUES ('620201102000', '620200000000', '0,620000000000,620200000000', '文殊镇', 3, 0);
INSERT INTO `sys_area` VALUES ('620300000000', '620000000000', '0,620000000000', '金昌市', 2, 0);
INSERT INTO `sys_area` VALUES ('620302000000', '620300000000', '0,620000000000,620300000000', '金川区', 3, 0);
INSERT INTO `sys_area` VALUES ('620321000000', '620300000000', '0,620000000000,620300000000', '永昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('620400000000', '620000000000', '0,620000000000', '白银市', 2, 0);
INSERT INTO `sys_area` VALUES ('620402000000', '620400000000', '0,620000000000,620400000000', '白银区', 3, 0);
INSERT INTO `sys_area` VALUES ('620403000000', '620400000000', '0,620000000000,620400000000', '平川区', 3, 0);
INSERT INTO `sys_area` VALUES ('620421000000', '620400000000', '0,620000000000,620400000000', '靖远县', 3, 0);
INSERT INTO `sys_area` VALUES ('620422000000', '620400000000', '0,620000000000,620400000000', '会宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('620423000000', '620400000000', '0,620000000000,620400000000', '景泰县', 3, 0);
INSERT INTO `sys_area` VALUES ('620500000000', '620000000000', '0,620000000000', '天水市', 2, 0);
INSERT INTO `sys_area` VALUES ('620502000000', '620500000000', '0,620000000000,620500000000', '秦州区', 3, 0);
INSERT INTO `sys_area` VALUES ('620503000000', '620500000000', '0,620000000000,620500000000', '麦积区', 3, 0);
INSERT INTO `sys_area` VALUES ('620521000000', '620500000000', '0,620000000000,620500000000', '清水县', 3, 0);
INSERT INTO `sys_area` VALUES ('620522000000', '620500000000', '0,620000000000,620500000000', '秦安县', 3, 0);
INSERT INTO `sys_area` VALUES ('620523000000', '620500000000', '0,620000000000,620500000000', '甘谷县', 3, 0);
INSERT INTO `sys_area` VALUES ('620524000000', '620500000000', '0,620000000000,620500000000', '武山县', 3, 0);
INSERT INTO `sys_area` VALUES ('620525000000', '620500000000', '0,620000000000,620500000000', '张家川回族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('620600000000', '620000000000', '0,620000000000', '武威市', 2, 0);
INSERT INTO `sys_area` VALUES ('620602000000', '620600000000', '0,620000000000,620600000000', '凉州区', 3, 0);
INSERT INTO `sys_area` VALUES ('620621000000', '620600000000', '0,620000000000,620600000000', '民勤县', 3, 0);
INSERT INTO `sys_area` VALUES ('620622000000', '620600000000', '0,620000000000,620600000000', '古浪县', 3, 0);
INSERT INTO `sys_area` VALUES ('620623000000', '620600000000', '0,620000000000,620600000000', '天祝藏族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('620700000000', '620000000000', '0,620000000000', '张掖市', 2, 0);
INSERT INTO `sys_area` VALUES ('620702000000', '620700000000', '0,620000000000,620700000000', '甘州区', 3, 0);
INSERT INTO `sys_area` VALUES ('620721000000', '620700000000', '0,620000000000,620700000000', '肃南裕固族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('620722000000', '620700000000', '0,620000000000,620700000000', '民乐县', 3, 0);
INSERT INTO `sys_area` VALUES ('620723000000', '620700000000', '0,620000000000,620700000000', '临泽县', 3, 0);
INSERT INTO `sys_area` VALUES ('620724000000', '620700000000', '0,620000000000,620700000000', '高台县', 3, 0);
INSERT INTO `sys_area` VALUES ('620725000000', '620700000000', '0,620000000000,620700000000', '山丹县', 3, 0);
INSERT INTO `sys_area` VALUES ('620800000000', '620000000000', '0,620000000000', '平凉市', 2, 0);
INSERT INTO `sys_area` VALUES ('620802000000', '620800000000', '0,620000000000,620800000000', '崆峒区', 3, 0);
INSERT INTO `sys_area` VALUES ('620821000000', '620800000000', '0,620000000000,620800000000', '泾川县', 3, 0);
INSERT INTO `sys_area` VALUES ('620822000000', '620800000000', '0,620000000000,620800000000', '灵台县', 3, 0);
INSERT INTO `sys_area` VALUES ('620823000000', '620800000000', '0,620000000000,620800000000', '崇信县', 3, 0);
INSERT INTO `sys_area` VALUES ('620824000000', '620800000000', '0,620000000000,620800000000', '华亭县', 3, 0);
INSERT INTO `sys_area` VALUES ('620825000000', '620800000000', '0,620000000000,620800000000', '庄浪县', 3, 0);
INSERT INTO `sys_area` VALUES ('620826000000', '620800000000', '0,620000000000,620800000000', '静宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('620900000000', '620000000000', '0,620000000000', '酒泉市', 2, 0);
INSERT INTO `sys_area` VALUES ('620902000000', '620900000000', '0,620000000000,620900000000', '肃州区', 3, 0);
INSERT INTO `sys_area` VALUES ('620921000000', '620900000000', '0,620000000000,620900000000', '金塔县', 3, 0);
INSERT INTO `sys_area` VALUES ('620922000000', '620900000000', '0,620000000000,620900000000', '瓜州县', 3, 0);
INSERT INTO `sys_area` VALUES ('620923000000', '620900000000', '0,620000000000,620900000000', '肃北蒙古族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('620924000000', '620900000000', '0,620000000000,620900000000', '阿克塞哈萨克族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('620981000000', '620900000000', '0,620000000000,620900000000', '玉门市', 3, 0);
INSERT INTO `sys_area` VALUES ('620982000000', '620900000000', '0,620000000000,620900000000', '敦煌市', 3, 0);
INSERT INTO `sys_area` VALUES ('621000000000', '620000000000', '0,620000000000', '庆阳市', 2, 0);
INSERT INTO `sys_area` VALUES ('621002000000', '621000000000', '0,620000000000,621000000000', '西峰区', 3, 0);
INSERT INTO `sys_area` VALUES ('621021000000', '621000000000', '0,620000000000,621000000000', '庆城县', 3, 0);
INSERT INTO `sys_area` VALUES ('621022000000', '621000000000', '0,620000000000,621000000000', '环县', 3, 0);
INSERT INTO `sys_area` VALUES ('621023000000', '621000000000', '0,620000000000,621000000000', '华池县', 3, 0);
INSERT INTO `sys_area` VALUES ('621024000000', '621000000000', '0,620000000000,621000000000', '合水县', 3, 0);
INSERT INTO `sys_area` VALUES ('621025000000', '621000000000', '0,620000000000,621000000000', '正宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('621026000000', '621000000000', '0,620000000000,621000000000', '宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('621027000000', '621000000000', '0,620000000000,621000000000', '镇原县', 3, 0);
INSERT INTO `sys_area` VALUES ('621100000000', '620000000000', '0,620000000000', '定西市', 2, 0);
INSERT INTO `sys_area` VALUES ('621102000000', '621100000000', '0,620000000000,621100000000', '安定区', 3, 0);
INSERT INTO `sys_area` VALUES ('621121000000', '621100000000', '0,620000000000,621100000000', '通渭县', 3, 0);
INSERT INTO `sys_area` VALUES ('621122000000', '621100000000', '0,620000000000,621100000000', '陇西县', 3, 0);
INSERT INTO `sys_area` VALUES ('621123000000', '621100000000', '0,620000000000,621100000000', '渭源县', 3, 0);
INSERT INTO `sys_area` VALUES ('621124000000', '621100000000', '0,620000000000,621100000000', '临洮县', 3, 0);
INSERT INTO `sys_area` VALUES ('621125000000', '621100000000', '0,620000000000,621100000000', '漳县', 3, 0);
INSERT INTO `sys_area` VALUES ('621126000000', '621100000000', '0,620000000000,621100000000', '岷县', 3, 0);
INSERT INTO `sys_area` VALUES ('621200000000', '620000000000', '0,620000000000', '陇南市', 2, 0);
INSERT INTO `sys_area` VALUES ('621202000000', '621200000000', '0,620000000000,621200000000', '武都区', 3, 0);
INSERT INTO `sys_area` VALUES ('621221000000', '621200000000', '0,620000000000,621200000000', '成县', 3, 0);
INSERT INTO `sys_area` VALUES ('621222000000', '621200000000', '0,620000000000,621200000000', '文县', 3, 0);
INSERT INTO `sys_area` VALUES ('621223000000', '621200000000', '0,620000000000,621200000000', '宕昌县', 3, 0);
INSERT INTO `sys_area` VALUES ('621224000000', '621200000000', '0,620000000000,621200000000', '康县', 3, 0);
INSERT INTO `sys_area` VALUES ('621225000000', '621200000000', '0,620000000000,621200000000', '西和县', 3, 0);
INSERT INTO `sys_area` VALUES ('621226000000', '621200000000', '0,620000000000,621200000000', '礼县', 3, 0);
INSERT INTO `sys_area` VALUES ('621227000000', '621200000000', '0,620000000000,621200000000', '徽县', 3, 0);
INSERT INTO `sys_area` VALUES ('621228000000', '621200000000', '0,620000000000,621200000000', '两当县', 3, 0);
INSERT INTO `sys_area` VALUES ('622900000000', '620000000000', '0,620000000000', '临夏回族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('622901000000', '622900000000', '0,620000000000,622900000000', '临夏市', 3, 0);
INSERT INTO `sys_area` VALUES ('622921000000', '622900000000', '0,620000000000,622900000000', '临夏县', 3, 0);
INSERT INTO `sys_area` VALUES ('622922000000', '622900000000', '0,620000000000,622900000000', '康乐县', 3, 0);
INSERT INTO `sys_area` VALUES ('622923000000', '622900000000', '0,620000000000,622900000000', '永靖县', 3, 0);
INSERT INTO `sys_area` VALUES ('622924000000', '622900000000', '0,620000000000,622900000000', '广河县', 3, 0);
INSERT INTO `sys_area` VALUES ('622925000000', '622900000000', '0,620000000000,622900000000', '和政县', 3, 0);
INSERT INTO `sys_area` VALUES ('622926000000', '622900000000', '0,620000000000,622900000000', '东乡族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('622927000000', '622900000000', '0,620000000000,622900000000', '积石山保安族东乡族撒拉族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('623000000000', '620000000000', '0,620000000000', '甘南藏族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('623001000000', '623000000000', '0,620000000000,623000000000', '合作市', 3, 0);
INSERT INTO `sys_area` VALUES ('623021000000', '623000000000', '0,620000000000,623000000000', '临潭县', 3, 0);
INSERT INTO `sys_area` VALUES ('623022000000', '623000000000', '0,620000000000,623000000000', '卓尼县', 3, 0);
INSERT INTO `sys_area` VALUES ('623023000000', '623000000000', '0,620000000000,623000000000', '舟曲县', 3, 0);
INSERT INTO `sys_area` VALUES ('623024000000', '623000000000', '0,620000000000,623000000000', '迭部县', 3, 0);
INSERT INTO `sys_area` VALUES ('623025000000', '623000000000', '0,620000000000,623000000000', '玛曲县', 3, 0);
INSERT INTO `sys_area` VALUES ('623026000000', '623000000000', '0,620000000000,623000000000', '碌曲县', 3, 0);
INSERT INTO `sys_area` VALUES ('623027000000', '623000000000', '0,620000000000,623000000000', '夏河县', 3, 0);
INSERT INTO `sys_area` VALUES ('630000000000', '100000000000', '0,', '青海省', 1, 0);
INSERT INTO `sys_area` VALUES ('630100000000', '630000000000', '0,630000000000', '西宁市', 2, 0);
INSERT INTO `sys_area` VALUES ('630102000000', '630100000000', '0,630000000000,630100000000', '城东区', 3, 0);
INSERT INTO `sys_area` VALUES ('630103000000', '630100000000', '0,630000000000,630100000000', '城中区', 3, 0);
INSERT INTO `sys_area` VALUES ('630104000000', '630100000000', '0,630000000000,630100000000', '城西区', 3, 0);
INSERT INTO `sys_area` VALUES ('630105000000', '630100000000', '0,630000000000,630100000000', '城北区', 3, 0);
INSERT INTO `sys_area` VALUES ('630121000000', '630100000000', '0,630000000000,630100000000', '大通回族土族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('630122000000', '630100000000', '0,630000000000,630100000000', '湟中县', 3, 0);
INSERT INTO `sys_area` VALUES ('630123000000', '630100000000', '0,630000000000,630100000000', '湟源县', 3, 0);
INSERT INTO `sys_area` VALUES ('630200000000', '630000000000', '0,630000000000', '海东市', 2, 0);
INSERT INTO `sys_area` VALUES ('630202000000', '630200000000', '0,630000000000,630200000000', '乐都区', 3, 0);
INSERT INTO `sys_area` VALUES ('630203000000', '630200000000', '0,630000000000,630200000000', '平安区', 3, 0);
INSERT INTO `sys_area` VALUES ('630222000000', '630200000000', '0,630000000000,630200000000', '民和回族土族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('630223000000', '630200000000', '0,630000000000,630200000000', '互助土族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('630224000000', '630200000000', '0,630000000000,630200000000', '化隆回族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('630225000000', '630200000000', '0,630000000000,630200000000', '循化撒拉族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('632200000000', '630000000000', '0,630000000000', '海北藏族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('632221000000', '632200000000', '0,630000000000,632200000000', '门源回族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('632222000000', '632200000000', '0,630000000000,632200000000', '祁连县', 3, 0);
INSERT INTO `sys_area` VALUES ('632223000000', '632200000000', '0,630000000000,632200000000', '海晏县', 3, 0);
INSERT INTO `sys_area` VALUES ('632224000000', '632200000000', '0,630000000000,632200000000', '刚察县', 3, 0);
INSERT INTO `sys_area` VALUES ('632300000000', '630000000000', '0,630000000000', '黄南藏族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('632321000000', '632300000000', '0,630000000000,632300000000', '同仁县', 3, 0);
INSERT INTO `sys_area` VALUES ('632322000000', '632300000000', '0,630000000000,632300000000', '尖扎县', 3, 0);
INSERT INTO `sys_area` VALUES ('632323000000', '632300000000', '0,630000000000,632300000000', '泽库县', 3, 0);
INSERT INTO `sys_area` VALUES ('632324000000', '632300000000', '0,630000000000,632300000000', '河南蒙古族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('632500000000', '630000000000', '0,630000000000', '海南藏族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('632521000000', '632500000000', '0,630000000000,632500000000', '共和县', 3, 0);
INSERT INTO `sys_area` VALUES ('632522000000', '632500000000', '0,630000000000,632500000000', '同德县', 3, 0);
INSERT INTO `sys_area` VALUES ('632523000000', '632500000000', '0,630000000000,632500000000', '贵德县', 3, 0);
INSERT INTO `sys_area` VALUES ('632524000000', '632500000000', '0,630000000000,632500000000', '兴海县', 3, 0);
INSERT INTO `sys_area` VALUES ('632525000000', '632500000000', '0,630000000000,632500000000', '贵南县', 3, 0);
INSERT INTO `sys_area` VALUES ('632600000000', '630000000000', '0,630000000000', '果洛藏族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('632621000000', '632600000000', '0,630000000000,632600000000', '玛沁县', 3, 0);
INSERT INTO `sys_area` VALUES ('632622000000', '632600000000', '0,630000000000,632600000000', '班玛县', 3, 0);
INSERT INTO `sys_area` VALUES ('632623000000', '632600000000', '0,630000000000,632600000000', '甘德县', 3, 0);
INSERT INTO `sys_area` VALUES ('632624000000', '632600000000', '0,630000000000,632600000000', '达日县', 3, 0);
INSERT INTO `sys_area` VALUES ('632625000000', '632600000000', '0,630000000000,632600000000', '久治县', 3, 0);
INSERT INTO `sys_area` VALUES ('632626000000', '632600000000', '0,630000000000,632600000000', '玛多县', 3, 0);
INSERT INTO `sys_area` VALUES ('632700000000', '630000000000', '0,630000000000', '玉树藏族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('632701000000', '632700000000', '0,630000000000,632700000000', '玉树市', 3, 0);
INSERT INTO `sys_area` VALUES ('632722000000', '632700000000', '0,630000000000,632700000000', '杂多县', 3, 0);
INSERT INTO `sys_area` VALUES ('632723000000', '632700000000', '0,630000000000,632700000000', '称多县', 3, 0);
INSERT INTO `sys_area` VALUES ('632724000000', '632700000000', '0,630000000000,632700000000', '治多县', 3, 0);
INSERT INTO `sys_area` VALUES ('632725000000', '632700000000', '0,630000000000,632700000000', '囊谦县', 3, 0);
INSERT INTO `sys_area` VALUES ('632726000000', '632700000000', '0,630000000000,632700000000', '曲麻莱县', 3, 0);
INSERT INTO `sys_area` VALUES ('632800000000', '630000000000', '0,630000000000', '海西蒙古族藏族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('632801000000', '632800000000', '0,630000000000,632800000000', '格尔木市', 3, 0);
INSERT INTO `sys_area` VALUES ('632802000000', '632800000000', '0,630000000000,632800000000', '德令哈市', 3, 0);
INSERT INTO `sys_area` VALUES ('632821000000', '632800000000', '0,630000000000,632800000000', '乌兰县', 3, 0);
INSERT INTO `sys_area` VALUES ('632822000000', '632800000000', '0,630000000000,632800000000', '都兰县', 3, 0);
INSERT INTO `sys_area` VALUES ('632823000000', '632800000000', '0,630000000000,632800000000', '天峻县', 3, 0);
INSERT INTO `sys_area` VALUES ('632857000000', '632800000000', '0,630000000000,632800000000', '大柴旦行政委员会', 3, 0);
INSERT INTO `sys_area` VALUES ('632858000000', '632800000000', '0,630000000000,632800000000', '冷湖行政委员会', 3, 0);
INSERT INTO `sys_area` VALUES ('632859000000', '632800000000', '0,630000000000,632800000000', '茫崖行政委员会', 3, 0);
INSERT INTO `sys_area` VALUES ('640000000000', '100000000000', '0,', '宁夏回族自治区', 1, 0);
INSERT INTO `sys_area` VALUES ('640100000000', '640000000000', '0,640000000000', '银川市', 2, 0);
INSERT INTO `sys_area` VALUES ('640104000000', '640100000000', '0,640000000000,640100000000', '兴庆区', 3, 0);
INSERT INTO `sys_area` VALUES ('640105000000', '640100000000', '0,640000000000,640100000000', '西夏区', 3, 0);
INSERT INTO `sys_area` VALUES ('640106000000', '640100000000', '0,640000000000,640100000000', '金凤区', 3, 0);
INSERT INTO `sys_area` VALUES ('640121000000', '640100000000', '0,640000000000,640100000000', '永宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('640122000000', '640100000000', '0,640000000000,640100000000', '贺兰县', 3, 0);
INSERT INTO `sys_area` VALUES ('640181000000', '640100000000', '0,640000000000,640100000000', '灵武市', 3, 0);
INSERT INTO `sys_area` VALUES ('640200000000', '640000000000', '0,640000000000', '石嘴山市', 2, 0);
INSERT INTO `sys_area` VALUES ('640202000000', '640200000000', '0,640000000000,640200000000', '大武口区', 3, 0);
INSERT INTO `sys_area` VALUES ('640205000000', '640200000000', '0,640000000000,640200000000', '惠农区', 3, 0);
INSERT INTO `sys_area` VALUES ('640221000000', '640200000000', '0,640000000000,640200000000', '平罗县', 3, 0);
INSERT INTO `sys_area` VALUES ('640300000000', '640000000000', '0,640000000000', '吴忠市', 2, 0);
INSERT INTO `sys_area` VALUES ('640302000000', '640300000000', '0,640000000000,640300000000', '利通区', 3, 0);
INSERT INTO `sys_area` VALUES ('640303000000', '640300000000', '0,640000000000,640300000000', '红寺堡区', 3, 0);
INSERT INTO `sys_area` VALUES ('640323000000', '640300000000', '0,640000000000,640300000000', '盐池县', 3, 0);
INSERT INTO `sys_area` VALUES ('640324000000', '640300000000', '0,640000000000,640300000000', '同心县', 3, 0);
INSERT INTO `sys_area` VALUES ('640381000000', '640300000000', '0,640000000000,640300000000', '青铜峡市', 3, 0);
INSERT INTO `sys_area` VALUES ('640400000000', '640000000000', '0,640000000000', '固原市', 2, 0);
INSERT INTO `sys_area` VALUES ('640402000000', '640400000000', '0,640000000000,640400000000', '原州区', 3, 0);
INSERT INTO `sys_area` VALUES ('640422000000', '640400000000', '0,640000000000,640400000000', '西吉县', 3, 0);
INSERT INTO `sys_area` VALUES ('640423000000', '640400000000', '0,640000000000,640400000000', '隆德县', 3, 0);
INSERT INTO `sys_area` VALUES ('640424000000', '640400000000', '0,640000000000,640400000000', '泾源县', 3, 0);
INSERT INTO `sys_area` VALUES ('640425000000', '640400000000', '0,640000000000,640400000000', '彭阳县', 3, 0);
INSERT INTO `sys_area` VALUES ('640500000000', '640000000000', '0,640000000000', '中卫市', 2, 0);
INSERT INTO `sys_area` VALUES ('640502000000', '640500000000', '0,640000000000,640500000000', '沙坡头区', 3, 0);
INSERT INTO `sys_area` VALUES ('640521000000', '640500000000', '0,640000000000,640500000000', '中宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('640522000000', '640500000000', '0,640000000000,640500000000', '海原县', 3, 0);
INSERT INTO `sys_area` VALUES ('650000000000', '100000000000', '0,', '新疆维吾尔自治区', 1, 0);
INSERT INTO `sys_area` VALUES ('650100000000', '650000000000', '0,650000000000', '乌鲁木齐市', 2, 0);
INSERT INTO `sys_area` VALUES ('650102000000', '650100000000', '0,650000000000,650100000000', '天山区', 3, 0);
INSERT INTO `sys_area` VALUES ('650103000000', '650100000000', '0,650000000000,650100000000', '沙依巴克区', 3, 0);
INSERT INTO `sys_area` VALUES ('650104000000', '650100000000', '0,650000000000,650100000000', '新市区', 3, 0);
INSERT INTO `sys_area` VALUES ('650105000000', '650100000000', '0,650000000000,650100000000', '水磨沟区', 3, 0);
INSERT INTO `sys_area` VALUES ('650106000000', '650100000000', '0,650000000000,650100000000', '头屯河区', 3, 0);
INSERT INTO `sys_area` VALUES ('650107000000', '650100000000', '0,650000000000,650100000000', '达坂城区', 3, 0);
INSERT INTO `sys_area` VALUES ('650109000000', '650100000000', '0,650000000000,650100000000', '米东区', 3, 0);
INSERT INTO `sys_area` VALUES ('650121000000', '650100000000', '0,650000000000,650100000000', '乌鲁木齐县', 3, 0);
INSERT INTO `sys_area` VALUES ('650200000000', '650000000000', '0,650000000000', '克拉玛依市', 2, 0);
INSERT INTO `sys_area` VALUES ('650202000000', '650200000000', '0,650000000000,650200000000', '独山子区', 3, 0);
INSERT INTO `sys_area` VALUES ('650203000000', '650200000000', '0,650000000000,650200000000', '克拉玛依区', 3, 0);
INSERT INTO `sys_area` VALUES ('650204000000', '650200000000', '0,650000000000,650200000000', '白碱滩区', 3, 0);
INSERT INTO `sys_area` VALUES ('650205000000', '650200000000', '0,650000000000,650200000000', '乌尔禾区', 3, 0);
INSERT INTO `sys_area` VALUES ('650400000000', '650000000000', '0,650000000000', '吐鲁番市', 2, 0);
INSERT INTO `sys_area` VALUES ('650402000000', '650400000000', '0,650000000000,650400000000', '高昌区', 3, 0);
INSERT INTO `sys_area` VALUES ('650421000000', '650400000000', '0,650000000000,650400000000', '鄯善县', 3, 0);
INSERT INTO `sys_area` VALUES ('650422000000', '650400000000', '0,650000000000,650400000000', '托克逊县', 3, 0);
INSERT INTO `sys_area` VALUES ('652200000000', '650000000000', '0,650000000000', '哈密地区', 2, 0);
INSERT INTO `sys_area` VALUES ('652201000000', '652200000000', '0,650000000000,652200000000', '哈密市', 3, 0);
INSERT INTO `sys_area` VALUES ('652222000000', '652200000000', '0,650000000000,652200000000', '巴里坤哈萨克自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('652223000000', '652200000000', '0,650000000000,652200000000', '伊吾县', 3, 0);
INSERT INTO `sys_area` VALUES ('652300000000', '650000000000', '0,650000000000', '昌吉回族自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('652301000000', '652300000000', '0,650000000000,652300000000', '昌吉市', 3, 0);
INSERT INTO `sys_area` VALUES ('652302000000', '652300000000', '0,650000000000,652300000000', '阜康市', 3, 0);
INSERT INTO `sys_area` VALUES ('652323000000', '652300000000', '0,650000000000,652300000000', '呼图壁县', 3, 0);
INSERT INTO `sys_area` VALUES ('652324000000', '652300000000', '0,650000000000,652300000000', '玛纳斯县', 3, 0);
INSERT INTO `sys_area` VALUES ('652325000000', '652300000000', '0,650000000000,652300000000', '奇台县', 3, 0);
INSERT INTO `sys_area` VALUES ('652327000000', '652300000000', '0,650000000000,652300000000', '吉木萨尔县', 3, 0);
INSERT INTO `sys_area` VALUES ('652328000000', '652300000000', '0,650000000000,652300000000', '木垒哈萨克自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('652700000000', '650000000000', '0,650000000000', '博尔塔拉蒙古自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('652701000000', '652700000000', '0,650000000000,652700000000', '博乐市', 3, 0);
INSERT INTO `sys_area` VALUES ('652702000000', '652700000000', '0,650000000000,652700000000', '阿拉山口市', 3, 0);
INSERT INTO `sys_area` VALUES ('652722000000', '652700000000', '0,650000000000,652700000000', '精河县', 3, 0);
INSERT INTO `sys_area` VALUES ('652723000000', '652700000000', '0,650000000000,652700000000', '温泉县', 3, 0);
INSERT INTO `sys_area` VALUES ('652800000000', '650000000000', '0,650000000000', '巴音郭楞蒙古自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('652801000000', '652800000000', '0,650000000000,652800000000', '库尔勒市', 3, 0);
INSERT INTO `sys_area` VALUES ('652822000000', '652800000000', '0,650000000000,652800000000', '轮台县', 3, 0);
INSERT INTO `sys_area` VALUES ('652823000000', '652800000000', '0,650000000000,652800000000', '尉犁县', 3, 0);
INSERT INTO `sys_area` VALUES ('652824000000', '652800000000', '0,650000000000,652800000000', '若羌县', 3, 0);
INSERT INTO `sys_area` VALUES ('652825000000', '652800000000', '0,650000000000,652800000000', '且末县', 3, 0);
INSERT INTO `sys_area` VALUES ('652826000000', '652800000000', '0,650000000000,652800000000', '焉耆回族自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('652827000000', '652800000000', '0,650000000000,652800000000', '和静县', 3, 0);
INSERT INTO `sys_area` VALUES ('652828000000', '652800000000', '0,650000000000,652800000000', '和硕县', 3, 0);
INSERT INTO `sys_area` VALUES ('652829000000', '652800000000', '0,650000000000,652800000000', '博湖县', 3, 0);
INSERT INTO `sys_area` VALUES ('652900000000', '650000000000', '0,650000000000', '阿克苏地区', 2, 0);
INSERT INTO `sys_area` VALUES ('652901000000', '652900000000', '0,650000000000,652900000000', '阿克苏市', 3, 0);
INSERT INTO `sys_area` VALUES ('652922000000', '652900000000', '0,650000000000,652900000000', '温宿县', 3, 0);
INSERT INTO `sys_area` VALUES ('652923000000', '652900000000', '0,650000000000,652900000000', '库车县', 3, 0);
INSERT INTO `sys_area` VALUES ('652924000000', '652900000000', '0,650000000000,652900000000', '沙雅县', 3, 0);
INSERT INTO `sys_area` VALUES ('652925000000', '652900000000', '0,650000000000,652900000000', '新和县', 3, 0);
INSERT INTO `sys_area` VALUES ('652926000000', '652900000000', '0,650000000000,652900000000', '拜城县', 3, 0);
INSERT INTO `sys_area` VALUES ('652927000000', '652900000000', '0,650000000000,652900000000', '乌什县', 3, 0);
INSERT INTO `sys_area` VALUES ('652928000000', '652900000000', '0,650000000000,652900000000', '阿瓦提县', 3, 0);
INSERT INTO `sys_area` VALUES ('652929000000', '652900000000', '0,650000000000,652900000000', '柯坪县', 3, 0);
INSERT INTO `sys_area` VALUES ('653000000000', '650000000000', '0,650000000000', '克孜勒苏柯尔克孜自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('653001000000', '653000000000', '0,650000000000,653000000000', '阿图什市', 3, 0);
INSERT INTO `sys_area` VALUES ('653022000000', '653000000000', '0,650000000000,653000000000', '阿克陶县', 3, 0);
INSERT INTO `sys_area` VALUES ('653023000000', '653000000000', '0,650000000000,653000000000', '阿合奇县', 3, 0);
INSERT INTO `sys_area` VALUES ('653024000000', '653000000000', '0,650000000000,653000000000', '乌恰县', 3, 0);
INSERT INTO `sys_area` VALUES ('653100000000', '650000000000', '0,650000000000', '喀什地区', 2, 0);
INSERT INTO `sys_area` VALUES ('653101000000', '653100000000', '0,650000000000,653100000000', '喀什市', 3, 0);
INSERT INTO `sys_area` VALUES ('653121000000', '653100000000', '0,650000000000,653100000000', '疏附县', 3, 0);
INSERT INTO `sys_area` VALUES ('653122000000', '653100000000', '0,650000000000,653100000000', '疏勒县', 3, 0);
INSERT INTO `sys_area` VALUES ('653123000000', '653100000000', '0,650000000000,653100000000', '英吉沙县', 3, 0);
INSERT INTO `sys_area` VALUES ('653124000000', '653100000000', '0,650000000000,653100000000', '泽普县', 3, 0);
INSERT INTO `sys_area` VALUES ('653125000000', '653100000000', '0,650000000000,653100000000', '莎车县', 3, 0);
INSERT INTO `sys_area` VALUES ('653126000000', '653100000000', '0,650000000000,653100000000', '叶城县', 3, 0);
INSERT INTO `sys_area` VALUES ('653127000000', '653100000000', '0,650000000000,653100000000', '麦盖提县', 3, 0);
INSERT INTO `sys_area` VALUES ('653128000000', '653100000000', '0,650000000000,653100000000', '岳普湖县', 3, 0);
INSERT INTO `sys_area` VALUES ('653129000000', '653100000000', '0,650000000000,653100000000', '伽师县', 3, 0);
INSERT INTO `sys_area` VALUES ('653130000000', '653100000000', '0,650000000000,653100000000', '巴楚县', 3, 0);
INSERT INTO `sys_area` VALUES ('653131000000', '653100000000', '0,650000000000,653100000000', '塔什库尔干塔吉克自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('653200000000', '650000000000', '0,650000000000', '和田地区', 2, 0);
INSERT INTO `sys_area` VALUES ('653201000000', '653200000000', '0,650000000000,653200000000', '和田市', 3, 0);
INSERT INTO `sys_area` VALUES ('653221000000', '653200000000', '0,650000000000,653200000000', '和田县', 3, 0);
INSERT INTO `sys_area` VALUES ('653222000000', '653200000000', '0,650000000000,653200000000', '墨玉县', 3, 0);
INSERT INTO `sys_area` VALUES ('653223000000', '653200000000', '0,650000000000,653200000000', '皮山县', 3, 0);
INSERT INTO `sys_area` VALUES ('653224000000', '653200000000', '0,650000000000,653200000000', '洛浦县', 3, 0);
INSERT INTO `sys_area` VALUES ('653225000000', '653200000000', '0,650000000000,653200000000', '策勒县', 3, 0);
INSERT INTO `sys_area` VALUES ('653226000000', '653200000000', '0,650000000000,653200000000', '于田县', 3, 0);
INSERT INTO `sys_area` VALUES ('653227000000', '653200000000', '0,650000000000,653200000000', '民丰县', 3, 0);
INSERT INTO `sys_area` VALUES ('654000000000', '650000000000', '0,650000000000', '伊犁哈萨克自治州', 2, 0);
INSERT INTO `sys_area` VALUES ('654002000000', '654000000000', '0,650000000000,654000000000', '伊宁市', 3, 0);
INSERT INTO `sys_area` VALUES ('654003000000', '654000000000', '0,650000000000,654000000000', '奎屯市', 3, 0);
INSERT INTO `sys_area` VALUES ('654004000000', '654000000000', '0,650000000000,654000000000', '霍尔果斯市', 3, 0);
INSERT INTO `sys_area` VALUES ('654021000000', '654000000000', '0,650000000000,654000000000', '伊宁县', 3, 0);
INSERT INTO `sys_area` VALUES ('654022000000', '654000000000', '0,650000000000,654000000000', '察布查尔锡伯自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('654023000000', '654000000000', '0,650000000000,654000000000', '霍城县', 3, 0);
INSERT INTO `sys_area` VALUES ('654024000000', '654000000000', '0,650000000000,654000000000', '巩留县', 3, 0);
INSERT INTO `sys_area` VALUES ('654025000000', '654000000000', '0,650000000000,654000000000', '新源县', 3, 0);
INSERT INTO `sys_area` VALUES ('654026000000', '654000000000', '0,650000000000,654000000000', '昭苏县', 3, 0);
INSERT INTO `sys_area` VALUES ('654027000000', '654000000000', '0,650000000000,654000000000', '特克斯县', 3, 0);
INSERT INTO `sys_area` VALUES ('654028000000', '654000000000', '0,650000000000,654000000000', '尼勒克县', 3, 0);
INSERT INTO `sys_area` VALUES ('654200000000', '650000000000', '0,650000000000', '塔城地区', 2, 0);
INSERT INTO `sys_area` VALUES ('654201000000', '654200000000', '0,650000000000,654200000000', '塔城市', 3, 0);
INSERT INTO `sys_area` VALUES ('654202000000', '654200000000', '0,650000000000,654200000000', '乌苏市', 3, 0);
INSERT INTO `sys_area` VALUES ('654221000000', '654200000000', '0,650000000000,654200000000', '额敏县', 3, 0);
INSERT INTO `sys_area` VALUES ('654223000000', '654200000000', '0,650000000000,654200000000', '沙湾县', 3, 0);
INSERT INTO `sys_area` VALUES ('654224000000', '654200000000', '0,650000000000,654200000000', '托里县', 3, 0);
INSERT INTO `sys_area` VALUES ('654225000000', '654200000000', '0,650000000000,654200000000', '裕民县', 3, 0);
INSERT INTO `sys_area` VALUES ('654226000000', '654200000000', '0,650000000000,654200000000', '和布克赛尔蒙古自治县', 3, 0);
INSERT INTO `sys_area` VALUES ('654300000000', '650000000000', '0,650000000000', '阿勒泰地区', 2, 0);
INSERT INTO `sys_area` VALUES ('654301000000', '654300000000', '0,650000000000,654300000000', '阿勒泰市', 3, 0);
INSERT INTO `sys_area` VALUES ('654321000000', '654300000000', '0,650000000000,654300000000', '布尔津县', 3, 0);
INSERT INTO `sys_area` VALUES ('654322000000', '654300000000', '0,650000000000,654300000000', '富蕴县', 3, 0);
INSERT INTO `sys_area` VALUES ('654323000000', '654300000000', '0,650000000000,654300000000', '福海县', 3, 0);
INSERT INTO `sys_area` VALUES ('654324000000', '654300000000', '0,650000000000,654300000000', '哈巴河县', 3, 0);
INSERT INTO `sys_area` VALUES ('654325000000', '654300000000', '0,650000000000,654300000000', '青河县', 3, 0);
INSERT INTO `sys_area` VALUES ('654326000000', '654300000000', '0,650000000000,654300000000', '吉木乃县', 3, 0);
INSERT INTO `sys_area` VALUES ('659001000000', '650000000000', '0,650000000000', '石河子市', 2, 0);
INSERT INTO `sys_area` VALUES ('659001001000', '659001000000', '0,650000000000,659001000000', '新城街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659001002000', '659001000000', '0,650000000000,659001000000', '向阳街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659001003000', '659001000000', '0,650000000000,659001000000', '红山街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659001004000', '659001000000', '0,650000000000,659001000000', '老街街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659001005000', '659001000000', '0,650000000000,659001000000', '东城街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659001100000', '659001000000', '0,650000000000,659001000000', '北泉镇', 3, 0);
INSERT INTO `sys_area` VALUES ('659001101000', '659001000000', '0,650000000000,659001000000', '石河子镇', 3, 0);
INSERT INTO `sys_area` VALUES ('659002000000', '650000000000', '0,650000000000', '阿拉尔市', 2, 0);
INSERT INTO `sys_area` VALUES ('659002001000', '659002000000', '0,650000000000,659002000000', '金银川路街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659002002000', '659002000000', '0,650000000000,659002000000', '幸福路街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659002003000', '659002000000', '0,650000000000,659002000000', '青松路街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659002004000', '659002000000', '0,650000000000,659002000000', '南口街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659002200000', '659002000000', '0,650000000000,659002000000', '托喀依乡', 3, 0);
INSERT INTO `sys_area` VALUES ('659003000000', '650000000000', '0,650000000000', '图木舒克市', 2, 0);
INSERT INTO `sys_area` VALUES ('659003001000', '659003000000', '0,650000000000,659003000000', '齐干却勒街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659003002000', '659003000000', '0,650000000000,659003000000', '前海街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659003003000', '659003000000', '0,650000000000,659003000000', '永安坝街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659004000000', '650000000000', '0,650000000000', '五家渠市', 2, 0);
INSERT INTO `sys_area` VALUES ('659004001000', '659004000000', '0,650000000000,659004000000', '军垦路街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659004002000', '659004000000', '0,650000000000,659004000000', '青湖路街道办事处', 3, 0);
INSERT INTO `sys_area` VALUES ('659004003000', '659004000000', '0,650000000000,659004000000', '人民路街道办事处', 3, 0);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `parent_ids` varchar(5000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `parent_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '部门名称',
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '全称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记 0 默认 1 已删除',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('20190703114646232814', '27', '0,27,', '集团', '财务部', '财务部', '财务部', 1, '2019-07-03 11:46:46', '2019-07-03 11:46:46', '1', '1', 1, 0);
INSERT INTO `sys_dept` VALUES ('20190703114706733689', '27', '0,27,', '集团', '行政部', '行政部', '行政部', 2, '2019-07-03 11:47:07', '2019-07-03 11:47:07', '1', '1', 1, 0);
INSERT INTO `sys_dept` VALUES ('20190703114724882497', '27', '0,27,', '集团', '人事部', '人事部', '人事部', 3, '2019-07-03 11:47:25', '2019-07-03 11:47:25', '1', '1', 1, 0);
INSERT INTO `sys_dept` VALUES ('20190703114751649695', '27', '0,27,', '集团', '开发部', '开发部', '开发部', 4, '2019-07-03 11:47:52', '2019-07-03 11:47:52', '1', '1', 1, 0);
INSERT INTO `sys_dept` VALUES ('20190703114811769463', '27', '0,27,', '集团', '研发部', '研发部', '研发部', 5, '2019-07-03 11:48:12', '2019-07-03 11:48:12', '1', '1', 1, 0);
INSERT INTO `sys_dept` VALUES ('20190703114839757834', '27', '0,27,', '集团', '清算部', '清算部', '清算部', 6, '2019-07-03 11:48:40', '2019-07-03 11:48:40', '1', '1', 1, 0);
INSERT INTO `sys_dept` VALUES ('20190703114901774619', '27', '0,27,', '集团', '风控部', '风控部', '风控部', 7, '2019-07-03 11:49:02', '2019-07-03 11:49:02', '1', '1', 1, 0);
INSERT INTO `sys_dept` VALUES ('27', '0', '0,', '顶级', '集团', '集团', '总部', 0, '2019-05-16 10:46:26', '2019-07-03 11:46:13', '1', '1', 4176, 0);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `dict_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字典id',
  `dict_type_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属字典类型的id',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `sort` decimal(18, 2) NULL DEFAULT NULL COMMENT '排序',
  `deion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典的描述',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记 0 默认 1 已删除',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '基础字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1106120935070613505', '1106120388036902914', '1', '删除', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('1106120968910258177', '1106120388036902914', '0', '未删除', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190715151521388299', '1106120388036902914', '1', '删除', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190715151521401581', '1106120388036902914', '0', '未删除', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190715151528620692', '1106120388036902914', '1', '删除3', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190715151528622912', '1106120388036902914', '0', '未删除', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190715151536242761', '1106120388036902914', '1', '删除', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190715151536245447', '1106120388036902914', '0', '未删除', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719144008186498', '1106120388036902914', '0', '未删除', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719144008186767', '1106120388036902914', '1', '删除<>', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719144022403896', '1106120388036902914', '0', '未删除', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719144022404831', '1106120388036902914', '1', '删除()', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719144902371317', '1106120388036902914', '0', '未删除', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719144902374769', '1106120388036902914', '1', '删除()', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719153941191337', '1106120388036902914', '0', '未删除', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719153941195584', '1106120388036902914', '1', '删除& #40;& #41;', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719153955516105', '1106120388036902914', '0', '未删除', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719153955517416', '1106120388036902914', '1', '删除', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719154309689524', '1106120388036902914', '0', '未删除', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719154309692493', '1106120388036902914', '1', '删除()', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719155028646533', '1106120388036902914', '0', '未删除', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719155028652533', '1106120388036902914', '1', '删除()', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719155033582956', '1106120388036902914', '0', '未删除', 0.00, '', 0);
INSERT INTO `sys_dict` VALUES ('20190719155033583268', '1106120388036902914', '1', '删除', 1.00, '', 0);
INSERT INTO `sys_dict` VALUES ('20190719161753749519', '20190719155240239702', '0', '男', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719161818662385', '20190719155240239702', '', '', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719161818662415', '20190719155240239702', '1', '女', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719161909789457', '20190719155240239702', '2', 'AS', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719161909790895', '20190719155240239702', '1', '女', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719161909791443', '20190719155240239702', '', '', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719161951531607', '20190719155240239702', '0', '男', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719161951532835', '20190719155240239702', '', '', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719162002784268', '20190719155240239702', '1', '女', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719162002784683', '20190719155240239702', '1', '女', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719162432702648', '20190719155240239702', '0', '男', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719162432703778', '20190719155240239702', '1', '女', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719162441565477', '20190719155240239702', '0', '男', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190719162441566515', '20190719155240239702', '1', '女', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190721134745038920', '20190719155240239702', '0', '男', 0.00, '', 0);
INSERT INTO `sys_dict` VALUES ('20190721134745040358', '20190719155240239702', '1', '女', 1.00, '', 0);
INSERT INTO `sys_dict` VALUES ('20190817142922313239', '20190817142922285382', '3', '娱乐', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190817142922316327', '20190817142922285382', '', '', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190817142922317114', '20190817142922285382', '', '', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190817143006796882', '20190817142922285382', '1', '时政', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190817143006797668', '20190817142922285382', '2', '娱乐', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190817143006798375', '20190817142922285382', '1', '科技', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190817143036469058', '20190817142922285382', '3', '时政', 3.00, '', 0);
INSERT INTO `sys_dict` VALUES ('20190817143036471196', '20190817142922285382', '2', '娱乐', 2.00, '', 0);
INSERT INTO `sys_dict` VALUES ('20190817143036473040', '20190817142922285382', '1', '科技', 1.00, '', 0);
INSERT INTO `sys_dict` VALUES ('20190819113444006672', '20190819113443981814', '333', '但是', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819113444010136', '20190819113443981814', '', '', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819113444011141', '20190819113443981814', '', '', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819113814611798', '20190819113443981814', 'asas', 'sas', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819113814613693', '20190819113443981814', '', '', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819113814614357', '20190819113443981814', '', '', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819113814616295', '20190819113443981814', '', '', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819114211540435', '20190819113443981814', 'zxzx', 'zxzx', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819114211542249', '20190819113443981814', 'asasas', 'asas', 3.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819114211543955', '20190819113443981814', 'asass', 'zxx', 2.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819114211545798', '20190819113443981814', 'zxzx', 'zxzx', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819114446377866', '20190819113443981814', 'zxzx', 'zxzx', 4.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819114446379910', '20190819113443981814', 'asasas', 'asas', 3.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819114446380753', '20190819113443981814', 'asass', 'zxx', 2.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819114446382815', '20190819113443981814', 'zxzx', 'zxzx', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819114503203817', '20190819113443981814', 'zxzx', 'zxzx', 4.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819114503205275', '20190819113443981814', 'asasas', 'asas', 3.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819114503206076', '20190819113443981814', 'zxzx', 'zxzx', 1.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819114503206950', '20190819113443981814', 'asass', 'zxx', 2.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819114503207589', '20190819113443981814', 'as', 's', 0.00, '', 1);
INSERT INTO `sys_dict` VALUES ('20190819120345621818', '20190819113443981814', '', '', 0.00, '', 1);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_type_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字典类型id',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型名称',
  `deion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典描述',
  `sort` decimal(18, 2) NULL DEFAULT NULL COMMENT '排序',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记 0 默认 1 已删除',
  PRIMARY KEY (`dict_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1106120388036902914', 'DEL_FLAG', '是否删除', '删除标记 0 默认 1 已删除', 2.00, 0);
INSERT INTO `sys_dict_type` VALUES ('20190719155240239702', 'SEX', '性别', '性别', 2.00, 0);
INSERT INTO `sys_dict_type` VALUES ('20190817142922285382', 'NEWS_TYPE', '新闻字典', '新闻类型 1 科技 2 娱乐 3 时政', 5.00, 0);
INSERT INTO `sys_dict_type` VALUES ('20190819113443981814', 'DEL_FLAG2', '开发部', '删除标记 0 默认 1 已删除', 2.00, 1);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `login_log_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `log_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志名称',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '管理员id',
  `succeed` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否执行成功',
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '具体消息',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录ip',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记 0 默认 1 已删除',
  PRIMARY KEY (`login_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '父ID',
  `parent_ids` varchar(5000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '父ID列表',
  `parent_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '父菜单',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'layui-icon-spread-left' COMMENT '菜单图标',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'url地址',
  `levels` int(1) NULL DEFAULT NULL COMMENT '菜单层级  1：第一层  2：第二层  3：第三层',
  `menu_type` int(1) NULL DEFAULT 0 COMMENT '0:目录  1：菜单  2：按钮  3：数据权限',
  `is_show` int(1) NULL DEFAULT 1 COMMENT '菜单状态(字典) 0 隐藏 1 显示',
  `permission` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限标识',
  `sort` decimal(18, 2) NULL DEFAULT NULL COMMENT '菜单排序号',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记 0 未删除 1 已删除',
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `menuId`(`menu_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('105', '0', '0,', '顶级', '系统管理', 'layui-icon-set', '#', 1, 0, 1, 'sys', 100.00, '2019-08-26 11:01:20', 0);
INSERT INTO `sys_menu` VALUES ('106', '105', '0,105,', '系统管理', '用户管理', 'layui-icon-username', '/user', 2, 1, 1, 'user', 1.00, '2019-06-11 13:23:32', 0);
INSERT INTO `sys_menu` VALUES ('107', '106', '0,105,106,105,106,', '用户管理', '添加用户', 'layui-icon-spread-left', '/user/add', 5, 2, 1, 'user:add', 1.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('108', '106', '0,105,106,105,106,', '用户管理', '修改用户', 'layui-icon-spread-left', '/user/edit', 5, 2, 1, 'user:edit', 2.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('109', '106', '0,105,106,105,106,', '用户管理', '删除用户', 'layui-icon-spread-left', '/user/delete', 5, 2, 1, 'user:delete', 3.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('110', '106', '0,105,106,105,106,', '用户管理', '重置密码', 'layui-icon-spread-left', '/user/reset', 5, 2, 1, 'user:reset', 4.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('111', '106', '0,105,106,105,106,', '用户管理', '冻结用户', 'layui-icon-spread-left', '/user/freeze', 5, 2, 1, 'user:freeze', 5.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('112', '106', '0,105,106,105,106,', '用户管理', '解除冻结用户', 'layui-icon-spread-left', '/user/unfreeze', 5, 2, 1, 'user:unfreeze', 6.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('113', '106', '0,105,106,105,106,', '用户管理', '分配角色', 'layui-icon-spread-left', '/user/setRole', 5, 2, 1, 'user:setRole', 7.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('114', '105', '0,105,', '系统管理', '角色管理', 'layui-icon-vercode', '/role', 2, 1, 1, 'role', 2.00, '2019-06-11 13:23:27', 0);
INSERT INTO `sys_menu` VALUES ('115', '114', '0,105,106,105,114,', '角色管理', '添加角色', 'layui-icon-spread-left', '/role/add', 5, 2, 1, 'role:add', 1.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('116', '114', '0,105,106,105,114,', '角色管理', '修改角色', 'layui-icon-spread-left', '/role/edit', 5, 2, 1, 'role:edit', 2.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('117', '114', '0,105,106,105,114,', '角色管理', '删除角色', 'layui-icon-spread-left', '/role/remove', 5, 2, 1, 'role:remove', 3.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('118', '114', '0,105,106,105,114,', '角色管理', '配置权限', 'layui-icon-spread-left', '/role/setAuthority', 5, 2, 1, 'role:setAuthority', 4.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('119', '105', '0,105,', '系统管理', '菜单管理', 'layui-icon-menu-fill', '/menu', 2, 1, 1, 'menu', 4.00, '2019-06-11 13:21:44', 0);
INSERT INTO `sys_menu` VALUES ('120', '119', '0,105,106,105,119,', '菜单管理', '添加菜单', 'layui-icon-spread-left', '/menu/add', 5, 2, 1, 'menu:add', 1.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('121', '119', '0,105,106,105,119,', '菜单管理', '修改菜单', 'layui-icon-spread-left', '/menu/edit', 5, 2, 1, 'menu:edit', 2.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('122', '119', '0,105,106,105,119,', '菜单管理', '删除菜单', 'layui-icon-spread-left', '/menu/remove', 5, 2, 1, 'menu:remove', 3.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('128', '171', '0,105,171,', '日志管理', '业务日志', 'layui-icon-console', '/log', 3, 1, 1, 'log', 6.00, '2019-07-05 11:51:10', 0);
INSERT INTO `sys_menu` VALUES ('131', '105', '0,105,', '系统管理', '部门管理', 'layui-icon-template-1', '/dept', 2, 1, 1, 'dept', 3.00, '2019-06-11 13:23:22', 0);
INSERT INTO `sys_menu` VALUES ('133', '171', '0,105,171,', '日志管理', '登录日志', 'layui-icon-username', '/loginLog', 3, 1, 1, 'loginLog', 6.00, '2019-07-05 11:51:17', 0);
INSERT INTO `sys_menu` VALUES ('134', '128', '0,105,106,105,171,128,', '业务日志', '清空日志', 'layui-icon-spread-left', '/log/delLog', 6, 2, 0, 'log:delLog', 3.00, '2019-07-03 10:08:11', 0);
INSERT INTO `sys_menu` VALUES ('135', '131', '0,105,106,105,131,', '部门管理', '添加部门', 'layui-icon-spread-left', '/dept/add', 5, 2, 1, 'dept:add', 1.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('136', '131', '0,105,106,105,131,', '部门管理', '修改部门', 'layui-icon-spread-left', '/dept/update', 5, 2, 1, 'dept:update', 1.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('137', '131', '0,105,106,105,131,', '部门管理', '删除部门', 'layui-icon-spread-left', '/dept/delete', 5, 2, 1, 'dept:delete', 1.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('150', '119', '0,105,106,105,119,', '菜单管理', '菜单编辑跳转', 'layui-icon-spread-left', '/menu/menu_edit', 5, 2, 1, 'menu:menu_edit', 4.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('151', '119', '0,105,106,105,119,', '菜单管理', '菜单列表', 'layui-icon-spread-left', '/menu/list', 5, 2, 1, 'menu:list', 5.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('152', '131', '0,105,106,105,131,', '部门管理', '修改部门跳转', 'layui-icon-spread-left', '/dept/dept_update', 5, 2, 1, 'dept:dept_update', 4.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('153', '131', '0,105,106,105,131,', '部门管理', '部门列表', 'layui-icon-spread-left', '/dept/list', 5, 2, 1, 'dept:list', 5.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('154', '131', '0,105,106,105,131,', '部门管理', '部门详情', 'layui-icon-spread-left', '/dept/detail', 5, 2, 1, 'dept:detail', 6.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('158', '128', '0,105,106,105,171,128,', '业务日志', '日志列表', 'layui-icon-spread-left', '/log/list', 6, 2, 1, 'log:list', 2.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('159', '128', '0,105,106,105,171,128,', '业务日志', '日志详情', 'layui-icon-spread-left', '/log/detail', 6, 2, 1, 'log:detail', 3.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('160', '133', '0,105,106,105,171,133,', '登录日志', '清空登录日志', 'layui-icon-spread-left', '/loginLog/delLoginLog', 6, 2, 1, 'loginLog:delLoginLog', 1.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('161', '133', '0,105,106,105,171,133,', '登录日志', '登录日志列表', 'layui-icon-spread-left', '/loginLog/list', 6, 2, 1, 'loginLog:list', 2.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('162', '114', '0,105,106,105,114,', '角色管理', '修改角色跳转', 'layui-icon-spread-left', '/role/role_edit', 5, 2, 1, 'role:role_edit', 5.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('163', '114', '0,105,106,105,114,', '角色管理', '角色分配跳转', 'layui-icon-spread-left', '/role/role_assign', 5, 2, 1, 'role:role_assign', 6.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('164', '114', '0,105,106,105,114,', '角色管理', '角色列表', 'layui-icon-spread-left', '/role/list', 5, 2, 1, 'role:list', 7.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('165', '106', '0,105,106,105,106,', '用户管理', '分配角色跳转', 'layui-icon-spread-left', '/user/role_assign', 5, 2, 1, 'user:role_assign', 8.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('166', '106', '0,105,106,105,106,', '用户管理', '编辑用户跳转', 'layui-icon-spread-left', '/user/user_edit', 5, 2, 1, 'user:user_edit', 9.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('167', '106', '0,105,106,105,106,', '用户管理', '用户列表', 'layui-icon-spread-left', '/user/list', 5, 2, 1, 'user:list', 10.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('168', '105', '0,105,', '系统管理', '系统配置', 'layui-icon-set', '/set/index', 2, 1, 1, 'set:index', 8.00, '2019-06-11 14:00:12', 0);
INSERT INTO `sys_menu` VALUES ('169', '0', '0,', '顶级', '开发工具', 'layui-icon-util', '#', 1, 0, 1, 'gen', 2.00, '2019-08-26 11:02:01', 0);
INSERT INTO `sys_menu` VALUES ('170', '169', '0,169,', '开发工具', '代码生成', 'layui-icon-template', '/gen/index', 2, 1, 1, 'gen:list', 1.00, '2019-08-26 11:02:41', 0);
INSERT INTO `sys_menu` VALUES ('171', '105', '0,105,', '系统管理', '日志管理', 'layui-icon-log', '', 2, 0, 1, 'log', 6.00, '2019-08-26 11:01:29', 0);
INSERT INTO `sys_menu` VALUES ('172', '168', '0,105,168,', '系统配置', '添加配置', '', '', 3, 2, 1, 'set:add', 5.00, '2019-07-03 16:52:39', 0);
INSERT INTO `sys_menu` VALUES ('173', '168', '0,105,168,', '系统配置', '修改配置', '', '', 3, 2, 1, 'set:edit', 4.00, '2019-07-03 16:52:46', 0);
INSERT INTO `sys_menu` VALUES ('174', '168', '0,105,168,', '系统配置', '移除配置', '', '', 3, 2, 1, 'set:remove', 3.00, '2019-07-03 16:52:55', 0);
INSERT INTO `sys_menu` VALUES ('175', '168', '0,105,168,', '系统配置', '更新配置', '', '', 3, 2, 1, 'set:update', 2.00, '2019-07-03 16:53:00', 0);
INSERT INTO `sys_menu` VALUES ('176', '168', '0,105,168,', '系统配置', '锁解配置', '', '', 3, 2, 1, 'set:lock', 1.00, '2019-07-03 16:53:06', 0);
INSERT INTO `sys_menu` VALUES ('178', '105', '0,105,', '系统管理', '地区管理', 'layui-icon-location', '/area', 2, 1, 0, 'area:list', 5.00, '2019-08-30 12:17:53', 0);
INSERT INTO `sys_menu` VALUES ('179', '178', '0,105,106,105,178,', '地区管理', '添加', '', '', 5, 2, 1, 'area:add', 1.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('180', '170', '0,169,170,', '代码生成', '添加', '', '', 3, 2, 1, 'gen:add', 10.00, '2019-08-26 11:15:50', 0);
INSERT INTO `sys_menu` VALUES ('181', '178', '0,105,106,105,178,', '地区管理', '修改', '', '', 5, 2, 1, 'area:update', 2.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('182', '178', '0,105,106,105,178,', '地区管理', '删除', '', '', 5, 2, 1, 'area:delete', 3.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('183', '178', '0,105,106,105,178,', '地区管理', '修改页面', '', '', 5, 3, 1, 'area:area_update', 3.00, '2019-06-11 12:00:19', 0);
INSERT INTO `sys_menu` VALUES ('184', '169', '0,169,', '开发工具', '代码示例', 'layui-icon-read', '', 2, 0, 1, '', 2.00, '2019-08-28 11:40:09', 0);
INSERT INTO `sys_menu` VALUES ('185', '184', '0,169,184,', '代码示例', '多选模式', 'layui-icon-location', '/demo/select', 3, 1, 1, '', 2.00, '2019-08-30 12:18:04', 0);
INSERT INTO `sys_menu` VALUES ('186', '184', '0,169,184,', '代码示例', 'form表单', 'layui-icon-read', '/demo/form', 3, 1, 1, '', 2.00, '2019-08-30 12:18:13', 0);
INSERT INTO `sys_menu` VALUES ('20190715132510400370', '105', '0,105,', '系统管理', '字典管理', 'layui-icon-template', 'sys/dictType/index', 2, 1, 1, 'sys:dictType:list', NULL, '2019-07-15 15:43:40', 0);
INSERT INTO `sys_menu` VALUES ('20190715132510409901', '20190715132510400370', '0,105,20190715132510400370,', '字典管理', '添加', 'layui-icon-template', 'sys/dictType/index', 5, 2, 1, 'sys:dictType:add', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190715132510411182', '20190715132510400370', '0,105,20190715132510400370,', '字典管理', '修改', 'layui-icon-template', 'sys/dictType/index', 5, 2, 1, 'sys:dictType:edit', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190715132510413429', '20190715132510400370', '0,105,20190715132510400370,', '字典管理', '移除', 'layui-icon-template', 'sys/dictType/index', 5, 2, 1, 'sys:dictType:remove', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190718164234702838', '106', '0,105,106,', '用户管理', '导入', 'layui-icon-set', '', 3, 2, 1, 'user:import', 10.00, '2019-07-18 16:42:34', 0);
INSERT INTO `sys_menu` VALUES ('20190817143658908807', '169', '0,169,', '开发工具', '生成示例', 'layui-icon-ok-circle', '', 2, 0, 1, '', 1.00, '2019-08-28 11:40:02', 0);
INSERT INTO `sys_menu` VALUES ('20190817143809983788', '20190817143658908807', '0,169,20190817143658908807,', '生成示例', '单表示例', 'layui-icon-note', 'test/news/testNews/index', 3, 1, 1, 'test:news:testNews:list', 0.00, '2019-08-28 11:39:08', 1);
INSERT INTO `sys_menu` VALUES ('20190817143809985110', '20190817143809983788', '0,169,20190817143658908807,20190817143809983788,', '单表示例', '添加', 'layui-icon-note', 'test/news/testNews/index', 5, 2, 1, 'test:news:testNews:add', 0.00, NULL, 1);
INSERT INTO `sys_menu` VALUES ('20190817143809986109', '20190817143809983788', '0,169,20190817143658908807,20190817143809983788,', '单表示例', '修改', 'layui-icon-note', 'test/news/testNews/index', 5, 2, 1, 'test:news:testNews:edit', 0.00, NULL, 1);
INSERT INTO `sys_menu` VALUES ('20190817143809987143', '20190817143809983788', '0,169,20190817143658908807,20190817143809983788,', '单表示例', '移除', 'layui-icon-note', 'test/news/testNews/index', 5, 2, 1, 'test:news:testNews:remove', 0.00, NULL, 1);
INSERT INTO `sys_menu` VALUES ('20190817143809989644', '20190817143809983788', '0,169,20190817143658908807,20190817143809983788,', '单表示例', '查看', 'layui-icon-note', 'test/news/testNews/index', 5, 2, 1, 'test:news:testNews:detail', 0.00, NULL, 1);
INSERT INTO `sys_menu` VALUES ('20190817151425332305', '20190817143658908807', '0,169,20190817143658908807,', '生成示例', '主附表', 'layui-icon-share', 'test/user/testUser/index', 3, 1, 1, 'test:user:testUser:list', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190817151425343744', '20190817151425332305', '0,169,20190817143658908807,20190817151425332305,', '主附表', '添加', 'layui-icon-share', 'test/user/testUser/index', 5, 2, 1, 'test:user:testUser:add', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190817151425345934', '20190817151425332305', '0,169,20190817143658908807,20190817151425332305,', '主附表', '修改', 'layui-icon-share', 'test/user/testUser/index', 5, 2, 1, 'test:user:testUser:edit', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190817151425346297', '20190817151425332305', '0,169,20190817143658908807,20190817151425332305,', '主附表', '移除', 'layui-icon-share', 'test/user/testUser/index', 5, 2, 1, 'test:user:testUser:remove', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190817151425348276', '20190817151425332305', '0,169,20190817143658908807,20190817151425332305,', '主附表', '查看', 'layui-icon-share', 'test/user/testUser/index', 5, 2, 1, 'test:user:testUser:detail', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190817161436668020', '20190817143658908807', '0,169,20190817143658908807,', '生成示例', '树结构', 'layui-icon-tree', 'test/tree/testGenealogy/index', 3, 1, 1, 'test:tree:testGenealogy:list', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190817161436678105', '20190817161436668020', '0,169,20190817143658908807,20190817161436668020,', '树结构', '添加', 'layui-icon-tree', 'test/tree/testGenealogy/index', 5, 2, 1, 'test:tree:testGenealogy:add', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190817161436682058', '20190817161436668020', '0,169,20190817143658908807,20190817161436668020,', '树结构', '修改', 'layui-icon-tree', 'test/tree/testGenealogy/index', 5, 2, 1, 'test:tree:testGenealogy:edit', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190817161436685746', '20190817161436668020', '0,169,20190817143658908807,20190817161436668020,', '树结构', '移除', 'layui-icon-tree', 'test/tree/testGenealogy/index', 5, 2, 1, 'test:tree:testGenealogy:remove', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190817161436686779', '20190817161436668020', '0,169,20190817143658908807,20190817161436668020,', '树结构', '查看', 'layui-icon-tree', 'test/tree/testGenealogy/index', 5, 2, 1, 'test:tree:testGenealogy:detail', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190819101820551244', '20190817143658908807', '0,169,20190817143658908807,', '生成示例', '左树右表', 'layui-icon-release', 'test/lefttree/testGoodClass/index', 3, 1, 1, 'test:lefttree:testGoodClass:list', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190819101820576246', '20190819101820551244', '0,169,20190817143658908807,20190819101820551244,', '左树右表', '添加', 'layui-icon-release', 'test/lefttree/testGoodClass/index', 5, 2, 1, 'test:lefttree:testGoodClass:add', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190819101820579992', '20190819101820551244', '0,169,20190817143658908807,20190819101820551244,', '左树右表', '修改', 'layui-icon-release', 'test/lefttree/testGoodClass/index', 5, 2, 1, 'test:lefttree:testGoodClass:edit', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190819101820582529', '20190819101820551244', '0,169,20190817143658908807,20190819101820551244,', '左树右表', '移除', 'layui-icon-release', 'test/lefttree/testGoodClass/index', 5, 2, 1, 'test:lefttree:testGoodClass:remove', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190819101820583754', '20190819101820551244', '0,169,20190817143658908807,20190819101820551244,', '左树右表', '查看', 'layui-icon-release', 'test/lefttree/testGoodClass/index', 5, 2, 1, 'test:lefttree:testGoodClass:detail', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190819101820593265', '20190819101820551244', '0,169,20190817143658908807,20190819101820551244,', '左树右表', '子列表', 'layui-icon-release', 'test/lefttree/testGoodClass/index', 5, 2, 1, 'test:lefttree:testGoodInfo:list', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190819101820597628', '20190819101820551244', '0,169,20190817143658908807,20190819101820551244,', '左树右表', '子查看', 'layui-icon-release', 'test/lefttree/testGoodClass/index', 5, 2, 1, 'test:lefttree:testGoodInfo:detail', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190819101820599697', '20190819101820551244', '0,169,20190817143658908807,20190819101820551244,', '左树右表', '子新增', 'layui-icon-release', 'test/lefttree/testGoodClass/index', 5, 2, 1, 'test:lefttree:testGoodInfo:add', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190819101820601061', '20190819101820551244', '0,169,20190817143658908807,20190819101820551244,', '左树右表', '子修改', 'layui-icon-release', 'test/lefttree/testGoodClass/index', 5, 2, 1, 'test:lefttree:testGoodInfo:edit', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190819101820602680', '20190819101820551244', '0,169,20190817143658908807,20190819101820551244,', '左树右表', '子移除', 'layui-icon-release', 'test/lefttree/testGoodClass/index', 5, 2, 1, 'test:lefttree:testGoodInfo:remove', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190826110948965611', '170', '0,169,170,', '代码生成', '导入表', 'layui-icon-set', '', 3, 2, 1, 'gen:import', 8.00, '2019-08-26 11:16:33', 0);
INSERT INTO `sys_menu` VALUES ('20190826111020452885', '170', '0,169,170,', '代码生成', '创建菜单', 'layui-icon-set', '', 3, 2, 1, 'gen:createMenu', 6.00, '2019-08-26 11:17:05', 0);
INSERT INTO `sys_menu` VALUES ('20190826111043861040', '170', '0,169,170,', '代码生成', '移除表', 'layui-icon-set', '', 3, 2, 1, 'gen:remove', 5.00, '2019-08-26 11:17:30', 0);
INSERT INTO `sys_menu` VALUES ('20190826111102592933', '170', '0,169,170,', '代码生成', '彻底删除表', 'layui-icon-set', '', 3, 2, 1, 'gen:delete', 4.00, '2019-08-26 11:17:39', 0);
INSERT INTO `sys_menu` VALUES ('20190826111122796026', '170', '0,169,170,', '代码生成', '同步数据库', 'layui-icon-set', '', 3, 2, 1, 'gen:synchDb', 3.00, '2019-08-26 11:17:49', 0);
INSERT INTO `sys_menu` VALUES ('20190826111321166762', '170', '0,169,170,', '代码生成', '修改', 'layui-icon-set', '', 3, 2, 1, 'gen:edit', 9.00, '2019-08-26 11:16:07', 0);
INSERT INTO `sys_menu` VALUES ('20190826111436528111', '170', '0,169,170,', '代码生成', '代码生成', 'layui-icon-set', '', 3, 2, 1, 'gen:genCode', 7.00, '2019-08-26 11:16:47', 0);
INSERT INTO `sys_menu` VALUES ('20190829101558861456', '20190817143658908807', '0,169,20190817143658908807,', '生成示例', '单表', 'layui-icon-rate', 'test/news/testNews/index', 3, 1, 1, 'test:news:testNews:list', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190829101558864060', '20190829101558861456', '0,169,20190817143658908807,20190829101558861456,', '单表', '添加', 'layui-icon-rate', 'test/news/testNews/index', 5, 2, 1, 'test:news:testNews:add', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190829101558865653', '20190829101558861456', '0,169,20190817143658908807,20190829101558861456,', '单表', '修改', 'layui-icon-rate', 'test/news/testNews/index', 5, 2, 1, 'test:news:testNews:edit', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190829101558866218', '20190829101558861456', '0,169,20190817143658908807,20190829101558861456,', '单表', '移除', 'layui-icon-rate', 'test/news/testNews/index', 5, 2, 1, 'test:news:testNews:remove', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190829101558867102', '20190829101558861456', '0,169,20190817143658908807,20190829101558861456,', '单表', '查看', 'layui-icon-rate', 'test/news/testNews/index', 5, 2, 1, 'test:news:testNews:detail', 0.00, NULL, 0);
INSERT INTO `sys_menu` VALUES ('20190925160518438948', '105', '0,105,', '系统管理', '在线用户', 'layui-icon-login-qq', '/user/online', 2, 1, 1, 'user:onlineList', 1.00, '2019-09-25 16:05:18', 0);
INSERT INTO `sys_menu` VALUES ('20190925161236037517', '20190925160518438948', '0,105,20190925160518438948,', '在线用户', '剔除', 'layui-icon-set', '', 3, 2, 1, 'user:logout', 1.00, '2019-09-25 16:12:36', 0);

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `operation_log_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `log_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志类型(字典)',
  `log_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志名称',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户id',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类名称',
  `method` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '方法名称',
  `succeed` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否成功(字典)',
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记 0 默认 1 已删除',
  PRIMARY KEY (`operation_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色名称',
  `en_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '英文名',
  `sort` int(11) NULL DEFAULT NULL COMMENT '序号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改用户',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT 1 COMMENT '乐观锁',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记 0 默认 1 已删除',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'administrator', 1, '2019-05-15 14:15:40', '2019-05-15 14:15:55', '1', '1', '超级管理员', 1, 0);
INSERT INTO `sys_role` VALUES ('5', '测试', 'test', 2, '2019-05-15 14:15:43', '2019-05-09 15:50:34', '1', '1', '测试', 1, 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `menu_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单id',
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('20190826112115786813', '105', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115825722', '20190715132510400370', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115826873', '20190715132510409901', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115828856', '20190715132510411182', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115829961', '20190715132510413429', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115830036', '170', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115830262', '169', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115831675', '180', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115832885', '20190826110948965611', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115833789', '20190826111020452885', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115834203', '20190826111102592933', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115834450', '20190826111043861040', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115835750', '20190826111122796026', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115837139', '20190826111321166762', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115838333', '20190826111436528111', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115839740', '184', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115840094', '185', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115842332', '186', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115843933', '20190817143658908807', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115844428', '20190817143809983788', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115845705', '20190817143809985110', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115846932', '20190817143809986109', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115847125', '20190817143809987143', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115848654', '20190817143809989644', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115849734', '20190817151425332305', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115850553', '20190817151425343744', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115850751', '20190817151425345934', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115851368', '20190817151425346297', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115852051', '20190817151425348276', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115854240', '20190817161436668020', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115855676', '20190817161436678105', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115856230', '20190817161436682058', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115857603', '20190817161436685746', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115859808', '20190817161436686779', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115860620', '20190819101820551244', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115861040', '20190819101820576246', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115862912', '20190819101820579992', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115863551', '20190819101820582529', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115864601', '20190819101820583754', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115865795', '20190819101820593265', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115866109', '20190819101820599697', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115866610', '20190819101820597628', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115867014', '20190819101820601061', '5');
INSERT INTO `sys_role_menu` VALUES ('20190826112115869775', '20190819101820602680', '5');
INSERT INTO `sys_role_menu` VALUES ('20190828113933867845', '105', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933869945', '106', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933870852', '107', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933871610', '108', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933872018', '109', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933873155', '111', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933873805', '110', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933874441', '112', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933875091', '113', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933876363', '165', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933876430', '166', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933877564', '167', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933878961', '20190718164234702838', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933879845', '114', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933880667', '115', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933881157', '116', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933883742', '117', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933884826', '118', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933885127', '162', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933886064', '163', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933886538', '164', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933887592', '119', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933888316', '121', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933888628', '120', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933889351', '122', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933890100', '150', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933890904', '151', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933891739', '135', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933891756', '131', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933892855', '136', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933893698', '137', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933894268', '152', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933894648', '153', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933895837', '154', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933896852', '168', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933898652', '172', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933899475', '173', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933901132', '174', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933901774', '175', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933902486', '176', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933903590', '171', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933904101', '128', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933905207', '158', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933905749', '134', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933906719', '133', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933906762', '159', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933907255', '160', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933908010', '161', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933908779', '178', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933909002', '181', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933909219', '179', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933910250', '182', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933911798', '183', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933912878', '20190715132510400370', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933912975', '20190715132510409901', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933913434', '20190715132510411182', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933914718', '20190715132510413429', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933915840', '169', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933917965', '170', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933918486', '180', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933918740', '20190826110948965611', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933919564', '20190826111020452885', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933920758', '20190826111043861040', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933921388', '20190826111102592933', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933921892', '20190826111122796026', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933922897', '20190826111321166762', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933923202', '20190826111436528111', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933923424', '184', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933924265', '186', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933924419', '185', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933925578', '20190817143658908807', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933926135', '20190817143809983788', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933927684', '20190817143809985110', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933928522', '20190817143809986109', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933929389', '20190817143809989644', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933929601', '20190817143809987143', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933931391', '20190817151425332305', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933932662', '20190817151425343744', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933934576', '20190817151425345934', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933934831', '20190817151425346297', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933935313', '20190817151425348276', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933936051', '20190817161436678105', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933936321', '20190817161436668020', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933937550', '20190817161436682058', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933938372', '20190817161436685746', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933938413', '20190817161436686779', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933939631', '20190819101820551244', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933940459', '20190819101820576246', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933940690', '20190819101820579992', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933941112', '20190819101820582529', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933941136', '20190819101820583754', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933942179', '20190819101820593265', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933942426', '20190819101820597628', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933943197', '20190819101820599697', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933944969', '20190819101820601061', '1');
INSERT INTO `sys_role_menu` VALUES ('20190828113933945169', '20190819101820602680', '1');

-- ----------------------------
-- Table structure for sys_set
-- ----------------------------
DROP TABLE IF EXISTS `sys_set`;
CREATE TABLE `sys_set`  (
  `set_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `set_type` int(1) NOT NULL DEFAULT 0 COMMENT '业务类型 0 系统 ',
  `type_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `value_type` int(11) NOT NULL DEFAULT 0 COMMENT '配置值类型 0 字符串 1 数字 2 浮点数值 3 时间',
  `set_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置键',
  `set_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置值',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_lock` int(1) NULL DEFAULT 0 COMMENT '是否锁定 0 否 1 是 锁定后不允许修改，只有超级管理员可以解锁',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记 0 默认 1 已删除',
  PRIMARY KEY (`set_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '业务配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_set
-- ----------------------------
INSERT INTO `sys_set` VALUES (2, '支付', 0, '扫码付', 2, 'CT_VIP_RATE', '0.0e', '扫码付城市合伙人分成费率', 0, '2019-05-09 16:23:35', 1);
INSERT INTO `sys_set` VALUES (3, '扫码付费率', 0, '扫码付', 0, 'PT_VIP_RATE', '0.0133', '扫码付金牌推广人分成费率33', 0, '2019-05-27 17:49:36', 1);
INSERT INTO `sys_set` VALUES (4, '第一篇', 0, NULL, 0, 'asas', '22asas', '223233223asassdsd', 0, '2019-05-09 16:57:25', 1);
INSERT INTO `sys_set` VALUES (5, '最新活动', 0, '系统', 0, 'sdsd', '23323', 'sd', 0, '2019-05-09 17:02:47', 1);
INSERT INTO `sys_set` VALUES (6, 'asas', 0, '系统', 0, 'asas', 'asas', 'asas', 0, '2019-05-09 17:05:50', 1);
INSERT INTO `sys_set` VALUES (7, 'assasas', 0, '系统', 0, 'asas', 'asas', 'asas', 0, '2019-05-09 17:07:55', 1);
INSERT INTO `sys_set` VALUES (8, '第一篇', 0, '系统', 0, 'sdsd', 'sdsd', 'sdsd', 0, '2019-05-09 17:10:41', 1);
INSERT INTO `sys_set` VALUES (9, '	 PT_VIP_RATE', 0, '系统', 0, 'PT_VIP_RATE', 'PT_VIP_RATE', 'zdzx', 0, '2019-05-09 17:11:47', 1);
INSERT INTO `sys_set` VALUES (10, 'sdsdsd', 0, '系统', 0, 'sdsd', 'sdsd', 'sdsd', 0, '2019-05-09 17:17:52', 1);
INSERT INTO `sys_set` VALUES (11, 'assdasas', 0, '系统', 0, 'sdsdsd', 'sdsds', 'sdsdd', 0, '2019-05-09 17:21:31', 1);
INSERT INTO `sys_set` VALUES (12, '文件上传的根目录', 0, '系统', 0, 'FILE_UPLOAD_BASEDIR', '/home/data', '文件上传的根目录', 0, '2019-09-25 06:33:35', 0);
INSERT INTO `sys_set` VALUES (13, '文件访问的域名', 0, '系统', 0, 'SYS_DOMAIN_NAME', 'http://dev.saileikeji.com:10080/', '文件访问的域名', 0, '2019-09-25 06:34:03', 0);
INSERT INTO `sys_set` VALUES (14, 'azx', 0, '系统', 0, 'zxzx', 'zxzx', 'zxzx', 0, '2019-05-28 15:30:02', 1);
INSERT INTO `sys_set` VALUES (15, '文件上传的根目录', 0, '系统', 0, 'sdsd', 'sd', 'sd', 0, '2019-05-28 15:32:59', 1);
INSERT INTO `sys_set` VALUES (16, '11', 0, '系统', 1, '11', '4000000', '3333', 1, '2019-06-11 11:17:47', 1);
INSERT INTO `sys_set` VALUES (17, 'xiugai', 0, '系统', 3, '我问问', '222222', ' 啊6666', 1, '2019-06-11 11:47:46', 1);
INSERT INTO `sys_set` VALUES (18, '冻结资产大于拥有的资产时，信用借申请异常', 0, '系统', 0, '333', '333', 'q4q4', 0, '2019-06-11 11:52:46', 1);
INSERT INTO `sys_set` VALUES (19, '文件上传的根目录', 0, '系统', 1, 'ass', '23344erer', '文件访问的域名', 0, '2019-08-20 11:54:13', 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `account` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `sex` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别(字典)',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `dept_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编号',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态 1 正常 2 冻结',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `version` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记 0 默认 1 已删除',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '1d6b1208c7d151d335790276a18e3d99', 'q6taw', 'admin', '2019-06-25 00:00:00', 'M', 'gaojin1568@163.com', '18721971568', 'http://localhost:8080//staticFiles/user/20190924/db806763196d49ed80daa0b38b974594.jpg', '27', 1, '2016-01-29 08:49:53', NULL, '2019-05-05 15:17:35', '24', 25, 0);
INSERT INTO `sys_user` VALUES ('1126057670475972610', 'test', '18ac3fd8b2c7a3a53c93bdb1625a74c7', 'n1h9w', 'test', '2019-07-03 00:00:00', 'M', 'test@saileikeji.com', '18721971568', 'http://localhost:8080/staticFiles/user/20190528/d9881988f99242a4a53d230aa4cc38ea.jpg', '27', 1, '2019-05-08 17:34:04', '1', NULL, NULL, NULL, 0);
INSERT INTO `sys_user` VALUES ('20190719143321871046', 'demo', '1c431c8d84887387919e8db658ab8cf5', 'ftp78', 'demo', '2019-06-25 00:00:00', 'M', 'gaojin1568@163.com', '18721971568', NULL, NULL, 1, '2016-01-29 00:00:00', NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `role_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('34aecb3dbe5911e9947a8eeb71421637', '1', '1');
INSERT INTO `sys_user_role` VALUES ('f3084c3c9d4711e9891bfcaa14fe7400', '1126057670475972610', '5');

-- ----------------------------
-- Table structure for test_genealogy
-- ----------------------------
DROP TABLE IF EXISTS `test_genealogy`;
CREATE TABLE `test_genealogy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `seniority` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辈分',
  `call_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '称呼',
  `parent_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点编号',
  `parent_ids` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点编号列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '族谱表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_genealogy
-- ----------------------------
INSERT INTO `test_genealogy` VALUES (1, '2019-08-17 17:23:20', '2019-08-17 17:23:20', 0, '高大公', '金字辈', '爷爷', '0', '0,');
INSERT INTO `test_genealogy` VALUES (2, '2019-08-17 17:37:18', '2019-08-17 17:37:49', 0, '高大伯', '木字辈', '大伯', '1', '0,1,');
INSERT INTO `test_genealogy` VALUES (3, '2019-08-17 17:39:30', '2019-08-17 17:39:30', 0, '高二伯', '木字辈', '二伯', '1', '0,1,');
INSERT INTO `test_genealogy` VALUES (4, '2019-08-17 17:39:58', '2019-08-17 17:39:58', 0, '高大哥', '水字辈', '大哥', '2', '0,1,2,');
INSERT INTO `test_genealogy` VALUES (5, '2019-08-17 17:40:26', '2019-08-17 17:40:26', 0, '高水生', '水字辈', '大哥', '3', '0,1,3,');

-- ----------------------------
-- Table structure for test_good_class
-- ----------------------------
DROP TABLE IF EXISTS `test_good_class`;
CREATE TABLE `test_good_class`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级ID',
  `parent_ids` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级树',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `sort` decimal(18, 2) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_good_class
-- ----------------------------
INSERT INTO `test_good_class` VALUES ('20190819102053023971', '2019-08-19 10:20:53', '2019-08-19 10:20:53', 0, '0', '0,', '服装', 1.00);
INSERT INTO `test_good_class` VALUES ('20190819102133882921', '2019-08-19 10:21:33', '2019-08-19 10:21:33', 0, '0', '0,', '食品', 2.00);
INSERT INTO `test_good_class` VALUES ('20190819103539630336', '2019-08-19 10:35:39', '2019-08-19 10:35:39', 0, '20190819102053023971', '0,20190819102053023971,', '女装', 3.00);
INSERT INTO `test_good_class` VALUES ('20190819103551115917', '2019-08-19 10:35:51', '2019-08-19 10:35:51', 0, '20190819102053023971', '0,20190819102053023971,', '男装', 2.00);
INSERT INTO `test_good_class` VALUES ('20190819103601789440', '2019-08-19 10:36:01', '2019-08-19 10:36:01', 0, '20190819102053023971', '0,20190819102053023971,', '内衣', 1.00);
INSERT INTO `test_good_class` VALUES ('20190819103725488954', '2019-08-19 10:37:25', '2019-08-19 10:37:25', 0, '20190819103539630336', '0,20190819102053023971,20190819103539630336,', '夏上新', 999.00);
INSERT INTO `test_good_class` VALUES ('20190819103737010694', '2019-08-19 10:37:37', '2019-08-19 10:37:37', 0, '20190819103539630336', '0,20190819102053023971,20190819103539630336,', '连衣裙', 998.00);
INSERT INTO `test_good_class` VALUES ('20190819103806858002', '2019-08-19 10:38:06', '2019-08-19 10:38:06', 0, '20190819103539630336', '0,20190819102053023971,20190819103539630336,', 'T恤', 997.00);
INSERT INTO `test_good_class` VALUES ('20190819103822152114', '2019-08-19 10:38:22', '2019-08-19 10:38:22', 0, '20190819103539630336', '0,20190819102053023971,20190819103539630336,', '衬衫', 996.00);
INSERT INTO `test_good_class` VALUES ('20190819103830297666', '2019-08-19 10:38:30', '2019-08-19 10:38:30', 0, '20190819103539630336', '0,20190819102053023971,20190819103539630336,', '裤子', 995.00);
INSERT INTO `test_good_class` VALUES ('20190819103851117647', '2019-08-19 10:38:51', '2019-08-19 10:38:51', 0, '20190819103539630336', '0,20190819102053023971,20190819103539630336,', '牛仔裤', 994.00);
INSERT INTO `test_good_class` VALUES ('20190819104058421364', '2019-08-19 10:40:58', '2019-08-19 10:40:58', 0, '0', '0,', '电器', 2.00);
INSERT INTO `test_good_class` VALUES ('20190819104156979653', '2019-08-19 10:41:56', '2019-08-19 12:35:14', 0, '0', '0,', '洗护', 3.00);
INSERT INTO `test_good_class` VALUES ('20190819104230934974', '2019-08-19 10:42:30', '2019-08-19 10:42:30', 0, '0', '0,', '佩戴', 6.00);
INSERT INTO `test_good_class` VALUES ('20190819104247970985', '2019-08-19 10:42:47', '2019-08-19 10:42:47', 0, '0', '0,', '游戏', 7.00);
INSERT INTO `test_good_class` VALUES ('20190819104308257150', '2019-08-19 10:43:08', '2019-08-19 10:43:08', 0, '0', '0,', '运动', 8.00);
INSERT INTO `test_good_class` VALUES ('20190819104328761027', '2019-08-19 10:43:28', '2019-08-19 10:43:28', 0, '0', '0,', '办公', 9.00);
INSERT INTO `test_good_class` VALUES ('20190819104351613846', '2019-08-19 10:43:51', '2019-08-19 10:43:51', 0, '20190819103551115917', '0,20190819102053023971,20190819103551115917,', '春夏新品', 7.00);
INSERT INTO `test_good_class` VALUES ('20190819104418629923', '2019-08-19 10:44:18', '2019-08-19 10:44:18', 0, '20190819103551115917', '0,20190819102053023971,20190819103551115917,', 'T恤', 6.00);
INSERT INTO `test_good_class` VALUES ('20190819104441259142', '2019-08-19 10:44:41', '2019-08-19 10:44:41', 0, '20190819103601789440', '0,20190819102053023971,20190819103601789440,', '法式内衣', 3.00);
INSERT INTO `test_good_class` VALUES ('20190819104452168696', '2019-08-19 10:44:52', '2019-08-19 10:44:52', 0, '20190819103601789440', '0,20190819102053023971,20190819103601789440,', '文胸', 1.00);
INSERT INTO `test_good_class` VALUES ('20190819104513068706', '2019-08-19 10:45:13', '2019-08-19 10:45:13', 1, '20190819102133882921', '0,20190819102133882921,', '美食', 3.00);
INSERT INTO `test_good_class` VALUES ('20190819104526140588', '2019-08-19 10:45:26', '2019-08-19 10:45:26', 0, '20190819102133882921', '0,20190819102133882921,', '生鲜', 2.00);
INSERT INTO `test_good_class` VALUES ('20190819104536760532', '2019-08-19 10:45:36', '2019-08-19 10:45:36', 0, '20190819102133882921', '0,20190819102133882921,', '零食', 1.00);
INSERT INTO `test_good_class` VALUES ('20190819104600210362', '2019-08-19 10:46:00', '2019-08-19 10:46:00', 0, '20190819104058421364', '0,20190819104058421364,', '家电', 3.00);
INSERT INTO `test_good_class` VALUES ('20190819104608553376', '2019-08-19 10:46:08', '2019-08-19 10:46:08', 0, '20190819104058421364', '0,20190819104058421364,', '数码', 2.00);
INSERT INTO `test_good_class` VALUES ('20190819104618476222', '2019-08-19 10:46:18', '2019-08-19 10:46:18', 0, '20190819104058421364', '0,20190819104058421364,', '手机', 1.00);
INSERT INTO `test_good_class` VALUES ('20190819104703903602', '2019-08-19 10:47:03', '2019-08-19 10:47:03', 0, '20190819104156979653', '0,20190819104156979653,', '美妆', 3.00);
INSERT INTO `test_good_class` VALUES ('20190819104715031220', '2019-08-19 10:47:15', '2019-08-19 10:47:15', 0, '20190819104156979653', '0,20190819104156979653,', '个人护理', 2.00);
INSERT INTO `test_good_class` VALUES ('20190819104732316750', '2019-08-19 10:47:32', '2019-08-19 10:47:32', 0, '20190819104156979653', '0,20190819104156979653,', '营养保健', 1.00);
INSERT INTO `test_good_class` VALUES ('20190819104751204212', '2019-08-19 10:47:51', '2019-08-19 10:47:51', 0, '20190819104230934974', '0,20190819104230934974,', '珠宝', 3.00);
INSERT INTO `test_good_class` VALUES ('20190819104800768355', '2019-08-19 10:48:00', '2019-08-19 10:48:00', 0, '20190819104230934974', '0,20190819104230934974,', '眼睛', 2.00);
INSERT INTO `test_good_class` VALUES ('20190819104810295637', '2019-08-19 10:48:10', '2019-08-19 10:48:10', 0, '20190819104230934974', '0,20190819104230934974,', '手表', 1.00);
INSERT INTO `test_good_class` VALUES ('20190819104845811227', '2019-08-19 10:48:45', '2019-08-19 10:48:45', 0, '20190819104247970985', '0,20190819104247970985,', '游戏', 3.00);
INSERT INTO `test_good_class` VALUES ('20190819104855560825', '2019-08-19 10:48:55', '2019-08-19 10:48:55', 0, '20190819104247970985', '0,20190819104247970985,', '动漫周边', 2.00);
INSERT INTO `test_good_class` VALUES ('20190819104915009282', '2019-08-19 10:49:15', '2019-08-19 10:49:15', 0, '20190819104247970985', '0,20190819104247970985,', '影视', 1.00);
INSERT INTO `test_good_class` VALUES ('20190819104930076930', '2019-08-19 10:49:30', '2019-08-19 10:49:30', 0, '20190819104308257150', '0,20190819104308257150,', '运动', 3.00);
INSERT INTO `test_good_class` VALUES ('20190819104942258574', '2019-08-19 10:49:42', '2019-08-19 10:49:42', 0, '20190819104308257150', '0,20190819104308257150,', '护外健身', 2.00);
INSERT INTO `test_good_class` VALUES ('20190819104954681279', '2019-08-19 10:49:54', '2019-08-19 10:49:54', 0, '20190819104308257150', '0,20190819104308257150,', '乐器', 1.00);
INSERT INTO `test_good_class` VALUES ('20190819105013296079', '2019-08-19 10:50:13', '2019-08-19 10:50:13', 0, '20190819104328761027', '0,20190819104328761027,', '办公', 3.00);
INSERT INTO `test_good_class` VALUES ('20190819105022976290', '2019-08-19 10:50:22', '2019-08-19 10:50:22', 0, '20190819104328761027', '0,20190819104328761027,', 'DIY', 2.00);
INSERT INTO `test_good_class` VALUES ('20190819105043016889', '2019-08-19 10:50:43', '2019-08-19 10:50:43', 0, '20190819104328761027', '0,20190819104328761027,', '五金电子', 1.00);
INSERT INTO `test_good_class` VALUES ('20190819105328862204', '2019-08-19 10:53:28', '2019-08-19 10:53:28', 0, '20190819102133882921', '0,20190819102133882921,', '水果', 3.00);
INSERT INTO `test_good_class` VALUES ('20190821104854822257', '2019-08-21 10:48:54', '2019-08-21 10:48:54', 0, '20190819104058421364', '0,20190819104058421364,', '宋伊宁', 2.00);

-- ----------------------------
-- Table structure for test_good_info
-- ----------------------------
DROP TABLE IF EXISTS `test_good_info`;
CREATE TABLE `test_good_info`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记',
  `good_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `deion` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `image` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `is_recommend` int(11) NULL DEFAULT NULL COMMENT '是否热门',
  `price` decimal(18, 2) NULL DEFAULT NULL COMMENT '价格',
  `class_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_good_info
-- ----------------------------
INSERT INTO `test_good_info` VALUES ('20190819102216614902', '2019-08-19 10:22:16', '2019-08-19 11:11:48', 0, 'SDSD-2252', '牛奶', '蒙牛纯牛奶', 'sd', 1, 12.00, '20190819104526140588');

-- ----------------------------
-- Table structure for test_news
-- ----------------------------
DROP TABLE IF EXISTS `test_news`;
CREATE TABLE `test_news`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标记',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容3',
  `public_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `type` int(1) NULL DEFAULT NULL COMMENT 'sdsdsd',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test_user
-- ----------------------------
DROP TABLE IF EXISTS `test_user`;
CREATE TABLE `test_user`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `nick_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `id_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主附表主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_user
-- ----------------------------
INSERT INTO `test_user` VALUES ('20190817152149095459', '2019-08-17 15:21:49', '2019-08-20 09:08:34', 0, '开发部', '多少度', 223, '232323232323', '18721971568');

-- ----------------------------
-- Table structure for test_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `test_user_dept`;
CREATE TABLE `test_user_dept`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `dept_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `dept_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `dept_job` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门职位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_user_dept
-- ----------------------------
INSERT INTO `test_user_dept` VALUES ('20190817160702802654', '2019-08-17 16:07:02', '2019-08-17 16:07:02', 1, '20190817152149095459', '开发部', 'KF', '经理');
INSERT INTO `test_user_dept` VALUES ('20190820090834454203', '2019-08-20 09:08:34', '2019-08-20 09:08:34', 0, '20190817152149095459', '开发部', 'KF', '经理');
INSERT INTO `test_user_dept` VALUES ('20190820090834464874', '2019-08-20 09:08:34', '2019-08-20 09:08:34', 0, '20190817152149095459', '是的', '大幅度', '辅导费');

-- ----------------------------
-- Table structure for test_user_school
-- ----------------------------
DROP TABLE IF EXISTS `test_user_school`;
CREATE TABLE `test_user_school`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标记',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `school_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校名称',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校类型',
  `year` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入学年份',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户学校' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_user_school
-- ----------------------------
INSERT INTO `test_user_school` VALUES ('20190817160702814768', '2019-08-17 16:07:02', '2019-08-17 16:07:02', 1, '20190817152149095459', '青岛大学', '大学', '2008', '市南区');
INSERT INTO `test_user_school` VALUES ('20190820090834471009', '2019-08-20 09:08:34', '2019-08-20 09:08:34', 0, '20190817152149095459', '青岛大学', '大学', '2008', '市南区');
INSERT INTO `test_user_school` VALUES ('20190820090834473500', '2019-08-20 09:08:34', '2019-08-20 09:08:34', 0, '20190817152149095459', '地方', '地方', '2009', '发');

SET FOREIGN_KEY_CHECKS = 1;
