/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-05-27 17:58:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activity_Id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_Name` varchar(255) NOT NULL COMMENT '活动名称',
  `activity_beginTime` datetime NOT NULL COMMENT '活动开始时间',
  `activity_endTime` datetime NOT NULL COMMENT '活动结束时间',
  `activity_appliTime` datetime NOT NULL COMMENT '活动申请时间',
  `activity_appliReason` varchar(255) NOT NULL COMMENT '申请活动原因',
  `activity_typeId` int(11) NOT NULL COMMENT '活动类型ID--活动类型的ID',
  `activity_appliStuId` int(11) NOT NULL COMMENT '申请这个活动的学生ID--学生表的ID',
  `activity_Flag` int(11) NOT NULL DEFAULT '0' COMMENT '活动申请状态(0未审批既:正在申请当中1:审批过同意此活动的既:现在还未发起活动2:审批此活动未同意的:活动不存在3:申请活动同意之后发起的)',
  `activity_launchId` int(11) DEFAULT NULL,
  `activityPhoto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`activity_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('25', '生活部活动', '2017-05-24 14:04:19', '2017-05-31 14:04:20', '2017-05-23 14:04:38', '范德萨范德萨范德萨范德萨范范德萨范德萨范德萨发生大德发范德萨范德萨范德萨萨发是', '1', '37', '2', null, 'c83e2a5e_b6c8_40e3_800a_bf15f768a054.jpg');
INSERT INTO `activity` VALUES ('26', '生活部活2', '2017-05-24 14:05:23', '2017-05-31 14:05:25', '2017-05-23 14:05:41', '范德萨范德萨范德萨范德萨范德萨发生大  范德萨范德萨发的撒范德萨范德萨范德萨发的三范德萨范德萨范德萨范德萨', '1', '37', '3', '11', '388c9042_865e_45b8_882c_4419c2143cc4.jpg');
INSERT INTO `activity` VALUES ('27', '金属范德萨', '2017-05-24 16:25:00', '2017-05-26 16:25:02', '2017-05-23 16:25:16', '发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬', '1', '41', '3', '12', 'dc6552df_6018_4a85_9701_5e3236ab1a46.jpg');

-- ----------------------------
-- Table structure for activity_launch
-- ----------------------------
DROP TABLE IF EXISTS `activity_launch`;
CREATE TABLE `activity_launch` (
  `activity_lanId` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动发起表的ID',
  `activity_lanDesc` varchar(255) DEFAULT NULL COMMENT '对这个即将发起的活动的描述既宣传此活动的描述',
  `activity_perNum` int(11) DEFAULT NULL COMMENT '允许的报名人数',
  PRIMARY KEY (`activity_lanId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_launch
-- ----------------------------
INSERT INTO `activity_launch` VALUES ('11', 'vdsfdsafdsafsdafdsafdsa公对公讽德诵功大商股份十多个发送到广东佛山范德萨刚发的山工范德萨国防生的割发代首 刚发的割发代首国防生的国防生的国vfd刚发的山工范德萨个国防生的国防生的防生的割发代首国防生的割发代首', '50');
INSERT INTO `activity_launch` VALUES ('12', '发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬发斯蒂芬斯蒂芬', '2');

-- ----------------------------
-- Table structure for activity_launch_photo
-- ----------------------------
DROP TABLE IF EXISTS `activity_launch_photo`;
CREATE TABLE `activity_launch_photo` (
  `activity_launch_photoId` int(255) NOT NULL AUTO_INCREMENT,
  `activity_launch_Id` int(11) NOT NULL,
  `activity_launch_photos` varchar(255) NOT NULL,
  PRIMARY KEY (`activity_launch_photoId`,`activity_launch_photos`,`activity_launch_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_launch_photo
-- ----------------------------
INSERT INTO `activity_launch_photo` VALUES ('25', '11', '209c7380_fa52_4744_8f0d_127b4fd7bc8b.gif');
INSERT INTO `activity_launch_photo` VALUES ('26', '11', 'ce52da21_d607_4656_beb1_7f0382e4736a.png');
INSERT INTO `activity_launch_photo` VALUES ('27', '11', '3871e7d5_fa1d_4594_9bc6_9b8c90c344a2.jpg');
INSERT INTO `activity_launch_photo` VALUES ('28', '12', '558c0a7d_3bb9_4dc4_b1fb_89c75bd4cff0.gif');
INSERT INTO `activity_launch_photo` VALUES ('29', '12', 'f9d23b4e_0d63_415d_a2f4_ac6ac5e8b73c.jpg');
INSERT INTO `activity_launch_photo` VALUES ('30', '12', 'd89d50d8_0d45_4897_8e1d_ce3933ae5e1a.jpg');

-- ----------------------------
-- Table structure for activity_record
-- ----------------------------
DROP TABLE IF EXISTS `activity_record`;
CREATE TABLE `activity_record` (
  `activity_recordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动记录ID',
  `activity_recordContent` varchar(255) DEFAULT NULL COMMENT '记录活动内容',
  `activity_Id` int(11) NOT NULL,
  `activity_recordTime` datetime NOT NULL,
  PRIMARY KEY (`activity_recordId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_record
-- ----------------------------
INSERT INTO `activity_record` VALUES ('9', '国防生的国防生的国防生的国防生的', '26', '2017-05-23 14:07:07');

-- ----------------------------
-- Table structure for activity_record_photo
-- ----------------------------
DROP TABLE IF EXISTS `activity_record_photo`;
CREATE TABLE `activity_record_photo` (
  `activity_record_PhotoId` int(11) NOT NULL AUTO_INCREMENT COMMENT '照片ID(主键唯一)',
  `activity_recordId` int(11) DEFAULT NULL COMMENT '活动记录ID--》活动记录ID',
  `activity_record_photo` varchar(2500) DEFAULT NULL COMMENT '活动照片',
  PRIMARY KEY (`activity_record_PhotoId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_record_photo
-- ----------------------------
INSERT INTO `activity_record_photo` VALUES ('17', '9', '25caec3c_09c0_4b3b_b71b_56c1708ee385.gif');

-- ----------------------------
-- Table structure for activity_student
-- ----------------------------
DROP TABLE IF EXISTS `activity_student`;
CREATE TABLE `activity_student` (
  `activity_studentId` int(255) NOT NULL AUTO_INCREMENT,
  `activity_Id` int(11) NOT NULL COMMENT '活动Id',
  `stus_Id` int(11) NOT NULL COMMENT '学生Id',
  `stu_activityFlag` int(11) NOT NULL COMMENT '学生申请加入活动时的状态0申请加入活动1申请之后同意的2申请之后不同意的',
  `stu_messageId` int(11) DEFAULT NULL COMMENT '用于在活动管理页面 点击同意或者拒绝时 更新消息',
  PRIMARY KEY (`activity_studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_student
-- ----------------------------
INSERT INTO `activity_student` VALUES ('28', '15', '21', '0', '193');
INSERT INTO `activity_student` VALUES ('29', '20', '21', '1', '194');
INSERT INTO `activity_student` VALUES ('30', '19', '21', '1', '196');
INSERT INTO `activity_student` VALUES ('31', '20', '22', '2', '198');
INSERT INTO `activity_student` VALUES ('32', '19', '24', '1', '200');
INSERT INTO `activity_student` VALUES ('33', '24', '21', '1', null);
INSERT INTO `activity_student` VALUES ('34', '24', '15', '1', '207');
INSERT INTO `activity_student` VALUES ('35', '24', '24', '1', '209');
INSERT INTO `activity_student` VALUES ('36', '17', '24', '2', '211');
INSERT INTO `activity_student` VALUES ('37', '26', '37', '1', null);
INSERT INTO `activity_student` VALUES ('38', '26', '39', '2', '253');
INSERT INTO `activity_student` VALUES ('39', '26', '39', '2', '254');
INSERT INTO `activity_student` VALUES ('40', '26', '40', '1', '255');
INSERT INTO `activity_student` VALUES ('41', '27', '41', '1', null);
INSERT INTO `activity_student` VALUES ('42', '27', '42', '1', '270');

-- ----------------------------
-- Table structure for activity_type
-- ----------------------------
DROP TABLE IF EXISTS `activity_type`;
CREATE TABLE `activity_type` (
  `activity_typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `community_Id` int(255) DEFAULT NULL,
  `activity_typeName` varchar(255) NOT NULL COMMENT '活动名称',
  PRIMARY KEY (`activity_typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_type
-- ----------------------------
INSERT INTO `activity_type` VALUES ('1', '0', '个人活动');
INSERT INTO `activity_type` VALUES ('7', '16', '学生会活动');
INSERT INTO `activity_type` VALUES ('8', '17', '学生部活动');

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `authority_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `authority_name` varchar(255) NOT NULL COMMENT '权限名称',
  PRIMARY KEY (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', '学生管理');
INSERT INTO `authority` VALUES ('6', '活动管理');
INSERT INTO `authority` VALUES ('7', '社团管理');

-- ----------------------------
-- Table structure for authority_account
-- ----------------------------
DROP TABLE IF EXISTS `authority_account`;
CREATE TABLE `authority_account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL COMMENT '学生ID',
  `teacher_id` int(11) DEFAULT NULL COMMENT '老师ID',
  `account_name` varchar(255) NOT NULL COMMENT '登录账户',
  `account_pwd` varchar(255) NOT NULL COMMENT '登录密码',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority_account
-- ----------------------------
INSERT INTO `authority_account` VALUES ('1', null, '3', 'wanglaoshi', 'wanglaoshi');
INSERT INTO `authority_account` VALUES ('2', null, '1', 'admin', 'admin');
INSERT INTO `authority_account` VALUES ('3', null, '4', 'zhanglaoshi', 'zhanglaoshi');
INSERT INTO `authority_account` VALUES ('34', '37', null, 'lifuguang', 'lifuguang');
INSERT INTO `authority_account` VALUES ('35', '38', null, 'fandesa', 'fandesa');
INSERT INTO `authority_account` VALUES ('36', '39', null, 'wangyi', 'wangyi');
INSERT INTO `authority_account` VALUES ('37', '40', null, 'zhaowenju', 'zhaowenju');
INSERT INTO `authority_account` VALUES ('38', '41', null, 'gaoyukun', 'gaoyukun');
INSERT INTO `authority_account` VALUES ('39', '42', null, 'limingyue', 'limingyue');
INSERT INTO `authority_account` VALUES ('40', '43', null, 'tangjinsheng', 'tangjinsheng');

-- ----------------------------
-- Table structure for authority_account_bridge
-- ----------------------------
DROP TABLE IF EXISTS `authority_account_bridge`;
CREATE TABLE `authority_account_bridge` (
  `authority_id` int(11) NOT NULL,
  `authority_account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority_account_bridge
-- ----------------------------
INSERT INTO `authority_account_bridge` VALUES ('2', '2');
INSERT INTO `authority_account_bridge` VALUES ('1', '2');
INSERT INTO `authority_account_bridge` VALUES ('3', '2');
INSERT INTO `authority_account_bridge` VALUES ('5', '2');
INSERT INTO `authority_account_bridge` VALUES ('1', '19');
INSERT INTO `authority_account_bridge` VALUES ('1', '1');

-- ----------------------------
-- Table structure for authority_menu
-- ----------------------------
DROP TABLE IF EXISTS `authority_menu`;
CREATE TABLE `authority_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_parent_id` int(11) NOT NULL DEFAULT '0',
  `menu_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority_menu
-- ----------------------------
INSERT INTO `authority_menu` VALUES ('1', '学生管理', '0', '');
INSERT INTO `authority_menu` VALUES ('3', '学生信息', '1', 'backStudent.jsp');
INSERT INTO `authority_menu` VALUES ('5', '活动管理', '0', null);
INSERT INTO `authority_menu` VALUES ('6', '审核活动', '5', 'backActivityReview.jsp');
INSERT INTO `authority_menu` VALUES ('10', '权限管理', '0', '');
INSERT INTO `authority_menu` VALUES ('11', '菜单管理', '10', 'backAuthorityMenu.jsp');
INSERT INTO `authority_menu` VALUES ('12', '权限分配', '10', 'backAuthorityDistriButionMenu.jsp');
INSERT INTO `authority_menu` VALUES ('13', '用户管理', '10', 'backAuthorityDistribution.jsp');
INSERT INTO `authority_menu` VALUES ('14', '社团管理', '0', '');
INSERT INTO `authority_menu` VALUES ('15', '成绩管理', '0', '');
INSERT INTO `authority_menu` VALUES ('16', '社团审核', '14', 'backCommunityReview.jsp');
INSERT INTO `authority_menu` VALUES ('18', '用户管理', '0', '');

-- ----------------------------
-- Table structure for authority_menu_bridge
-- ----------------------------
DROP TABLE IF EXISTS `authority_menu_bridge`;
CREATE TABLE `authority_menu_bridge` (
  `authority_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority_menu_bridge
-- ----------------------------
INSERT INTO `authority_menu_bridge` VALUES ('2', '6');
INSERT INTO `authority_menu_bridge` VALUES ('3', '16');
INSERT INTO `authority_menu_bridge` VALUES ('3', '14');
INSERT INTO `authority_menu_bridge` VALUES ('5', '10');
INSERT INTO `authority_menu_bridge` VALUES ('5', '11');
INSERT INTO `authority_menu_bridge` VALUES ('5', '12');
INSERT INTO `authority_menu_bridge` VALUES ('5', '13');
INSERT INTO `authority_menu_bridge` VALUES ('5', '14');
INSERT INTO `authority_menu_bridge` VALUES ('6', '5');
INSERT INTO `authority_menu_bridge` VALUES ('6', '5');
INSERT INTO `authority_menu_bridge` VALUES ('6', '6');
INSERT INTO `authority_menu_bridge` VALUES ('6', '6');
INSERT INTO `authority_menu_bridge` VALUES ('1', '1');
INSERT INTO `authority_menu_bridge` VALUES ('1', '3');
INSERT INTO `authority_menu_bridge` VALUES ('1', '5');
INSERT INTO `authority_menu_bridge` VALUES ('1', '15');
INSERT INTO `authority_menu_bridge` VALUES ('1', '18');

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `community_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '社团ID',
  `community_Name` varchar(255) NOT NULL COMMENT '社团名称',
  `community_perNum` int(11) NOT NULL COMMENT '社团人数',
  `community_appliDate` datetime NOT NULL,
  `community_createDate` datetime DEFAULT NULL COMMENT '社团成立日期(后台同意日期)',
  `community_appliStu` int(11) DEFAULT NULL COMMENT '社团申请人--学生表的ID',
  `community_appliReason` varchar(255) DEFAULT NULL COMMENT '社团申请原因',
  `community_appliRespon` varchar(255) NOT NULL COMMENT '社团职责',
  `community_flag` int(11) NOT NULL DEFAULT '0' COMMENT '社团状态(0正在申请创建这个社团1审批这个社团同意的2审批过这个社团未同意的)',
  `community_photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`community_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community
-- ----------------------------
INSERT INTO `community` VALUES ('16', '学生会', '12', '2017-05-23 13:51:40', '2017-05-23 00:00:00', '37', '范德萨范德萨发收到范德萨发生大方式', '范德萨范德萨范德萨发的三', '1', 'f66e3db1_774c_434b_925d_1a6cbe1da512.png');
INSERT INTO `community` VALUES ('17', '学生部', '4', '2017-05-23 16:20:55', '2017-05-23 00:00:00', '41', '发的', '方法', '1', '99640e2a_aee6_435e_ae2d_362989256341.jpg');

-- ----------------------------
-- Table structure for community_people
-- ----------------------------
DROP TABLE IF EXISTS `community_people`;
CREATE TABLE `community_people` (
  `community_PeopleId` int(11) NOT NULL AUTO_INCREMENT,
  `community_Id` int(11) NOT NULL COMMENT '申请进入社团id',
  `community_stuId` int(11) NOT NULL COMMENT '社团学生ID',
  `community_position` varchar(255) DEFAULT '职员' COMMENT '部门中的职位',
  `community_peoFlag` int(11) DEFAULT '0' COMMENT '学生申请加入这个社团的状态(0:正在申请加入这个社团1:经过审批并同意的已经成为这个社团的人员2:经过审批为同意的)',
  `stu_messageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`community_PeopleId`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community_people
-- ----------------------------
INSERT INTO `community_people` VALUES ('49', '15', '27', '部长', '1', null);
INSERT INTO `community_people` VALUES ('50', '15', '28', '普通职员', '1', '223');
INSERT INTO `community_people` VALUES ('51', '15', '29', '普通职员', '1', '225');
INSERT INTO `community_people` VALUES ('52', '15', '30', '普通职员', '1', '228');
INSERT INTO `community_people` VALUES ('53', '15', '31', '普通职员', '1', '230');
INSERT INTO `community_people` VALUES ('54', '15', '32', '普通职员', '1', '232');
INSERT INTO `community_people` VALUES ('55', '15', '33', '普通职员', '1', '233');
INSERT INTO `community_people` VALUES ('56', '15', '34', '普通职员', '2', '236');
INSERT INTO `community_people` VALUES ('57', '15', '35', '普通职员', '1', '238');
INSERT INTO `community_people` VALUES ('58', '15', '36', '普通职员', '2', '240');
INSERT INTO `community_people` VALUES ('59', '16', '37', '部长', '1', null);
INSERT INTO `community_people` VALUES ('60', '16', '38', '普通职员', '2', '243');
INSERT INTO `community_people` VALUES ('61', '16', '39', '普通职员', '1', '245');
INSERT INTO `community_people` VALUES ('62', '16', '40', '普通职员', '2', '247');
INSERT INTO `community_people` VALUES ('63', '17', '41', '部长', '1', null);
INSERT INTO `community_people` VALUES ('64', '17', '42', '普通职员', '1', '265');
INSERT INTO `community_people` VALUES ('65', '17', '43', '普通职员', '1', '267');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_Id` int(11) NOT NULL COMMENT '项目Id',
  `preject_Name` varchar(255) NOT NULL COMMENT '项目名称',
  `preject_plan` varchar(255) DEFAULT NULL COMMENT '项目描述',
  `preject_score` varchar(255) DEFAULT NULL COMMENT '项目分数',
  `project_stage` int(11) NOT NULL COMMENT '学期阶段',
  PRIMARY KEY (`project_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '电子商城', '可以在网上购物，买东西不用出门', '80', '2');

-- ----------------------------
-- Table structure for project_revi
-- ----------------------------
DROP TABLE IF EXISTS `project_revi`;
CREATE TABLE `project_revi` (
  `project_reviewId` int(11) NOT NULL,
  `project_teaId` int(11) NOT NULL COMMENT '评审老师ID',
  `project_Id` int(11) NOT NULL COMMENT '项目ID',
  `project_Score` int(11) NOT NULL COMMENT '老师评审分数',
  PRIMARY KEY (`project_reviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_revi
-- ----------------------------
INSERT INTO `project_revi` VALUES ('1', '1', '1', '80');

-- ----------------------------
-- Table structure for project_stu
-- ----------------------------
DROP TABLE IF EXISTS `project_stu`;
CREATE TABLE `project_stu` (
  `project_Id` int(11) NOT NULL COMMENT '项目ID中间表',
  `student_Id` int(11) NOT NULL COMMENT '学生ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_stu
-- ----------------------------
INSERT INTO `project_stu` VALUES ('1', '1');

-- ----------------------------
-- Table structure for ques
-- ----------------------------
DROP TABLE IF EXISTS `ques`;
CREATE TABLE `ques` (
  `question_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '问题ID',
  `question_Content` varchar(255) NOT NULL COMMENT '问题内容',
  `question_Title` varchar(255) NOT NULL COMMENT '问题标题',
  `question_typeId` int(20) NOT NULL COMMENT '问题类别-->问题类别表ques_category',
  `question_StudentId` int(11) NOT NULL COMMENT '学生Id',
  `question_DataTime` datetime(6) NOT NULL COMMENT '时间',
  `question_step` int(11) NOT NULL DEFAULT '0',
  `question_praise` int(11) NOT NULL DEFAULT '0' COMMENT '赞',
  PRIMARY KEY (`question_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ques
-- ----------------------------
INSERT INTO `ques` VALUES ('9', '如何解决高并发问题', 'JAVA', '1', '40', '2017-05-23 14:20:19.000000', '1', '0');
INSERT INTO `ques` VALUES ('10', '    数据库连接池原理', 'Oracle数据库', '2', '39', '2017-05-23 14:34:20.000000', '0', '0');
INSERT INTO `ques` VALUES ('11', '范德萨范德萨', 'java', '2', '41', '2017-05-23 16:33:23.000000', '1', '0');
INSERT INTO `ques` VALUES ('12', '立刻就来了', '数据库的链接池', '2', '42', '2017-05-23 16:35:46.000000', '0', '0');
INSERT INTO `ques` VALUES ('13', '二恶', '飞哥', '3', '42', '2017-05-23 16:36:01.000000', '0', '0');

-- ----------------------------
-- Table structure for ques_answer
-- ----------------------------
DROP TABLE IF EXISTS `ques_answer`;
CREATE TABLE `ques_answer` (
  `ques_answer_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '答案ID',
  `ques_answer_content` varchar(255) DEFAULT NULL COMMENT '问题答案内容',
  `ques_answer_questionId` int(11) DEFAULT NULL COMMENT '问题ID',
  `ques_answer_studentId` int(11) DEFAULT NULL COMMENT '回答答案的学生ID',
  `ques_answer_DataTime` datetime DEFAULT NULL COMMENT '问题答案时间',
  `ques_answer_parent_Id` int(11) DEFAULT NULL COMMENT '问题答案父ID',
  PRIMARY KEY (`ques_answer_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ques_answer
-- ----------------------------
INSERT INTO `ques_answer` VALUES ('28', '电风扇', '8', '36', '2017-05-23 13:04:25', null);
INSERT INTO `ques_answer` VALUES ('29', '@AAA  哈哈哈', '8', '36', '2017-05-23 13:05:03', '28');
INSERT INTO `ques_answer` VALUES ('30', 'vdvfdsafdsa', '9', '39', '2017-05-23 14:20:36', null);
INSERT INTO `ques_answer` VALUES ('31', '@王毅  fdsafdsafdsafdsafdsa', '9', '40', '2017-05-23 14:21:10', '30');
INSERT INTO `ques_answer` VALUES ('32', 'face[哈哈] 范德萨范德萨范德萨', '10', '39', '2017-05-23 14:34:38', null);
INSERT INTO `ques_answer` VALUES ('33', '惹我', '11', '41', '2017-05-23 16:33:50', null);
INSERT INTO `ques_answer` VALUES ('34', '@高玉坤 是啊', '11', '42', '2017-05-23 16:34:28', '33');

-- ----------------------------
-- Table structure for ques_tocao
-- ----------------------------
DROP TABLE IF EXISTS `ques_tocao`;
CREATE TABLE `ques_tocao` (
  `questionId` int(11) NOT NULL COMMENT '问题吐槽Id',
  `ques_tucao_stuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ques_tocao
-- ----------------------------
INSERT INTO `ques_tocao` VALUES ('8', '36');
INSERT INTO `ques_tocao` VALUES ('9', '40');
INSERT INTO `ques_tocao` VALUES ('11', '41');

-- ----------------------------
-- Table structure for ques_type
-- ----------------------------
DROP TABLE IF EXISTS `ques_type`;
CREATE TABLE `ques_type` (
  `que_typeId` int(11) NOT NULL COMMENT '类别ID',
  `que_typeName` varchar(255) DEFAULT NULL COMMENT '类别名称',
  PRIMARY KEY (`que_typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ques_type
-- ----------------------------
INSERT INTO `ques_type` VALUES ('1', 'JAVA');
INSERT INTO `ques_type` VALUES ('2', 'PHP');
INSERT INTO `ques_type` VALUES ('3', 'C#');
INSERT INTO `ques_type` VALUES ('4', '数据库');

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu` (
  `stu_Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '学生ID 主键',
  `stu_Name` varchar(255) NOT NULL COMMENT '学生姓名',
  `stu_Sex` int(255) DEFAULT NULL COMMENT '学生性别:0男1女',
  `stu_Birthday` date DEFAULT NULL,
  `stu_Address` varchar(255) DEFAULT NULL,
  `stu_BirthPlace` int(11) DEFAULT NULL COMMENT '籍贯 精确到县',
  `stu_ClassId` int(11) DEFAULT NULL COMMENT '学生班级ID',
  `stu_CommunityId` int(11) DEFAULT NULL COMMENT '学生参加的社团',
  `stu_Photo` varchar(255) DEFAULT NULL COMMENT '学生照片',
  `stu_signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stu_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES ('37', '李福光', '0', '2017-05-23', '河南省', null, '1', '16', '410280a5-2162-4965-91bf-1aedf0fc2b4a.gif', 'fdsafdsafdsafdsafdsa');
INSERT INTO `stu` VALUES ('38', '范德萨', '1', '2017-05-23', '郑州', null, '1', null, '4d519037-c8c1-42b1-a2b5-a29736b07d42.jpg', null);
INSERT INTO `stu` VALUES ('39', '王毅', '0', '2017-05-23', '范德萨发', null, '1', '16', '87fb58b3-9c2c-4e92-b5ac-fa52058b20d0.gif', null);
INSERT INTO `stu` VALUES ('40', '赵文举', '0', '2017-05-23', '河南郑州', null, '1', null, '191f68f5-ffa6-4c3f-8da6-7ff0e59b4681.jpg', null);
INSERT INTO `stu` VALUES ('41', '高玉坤', '0', '2017-05-01', '郑州', null, '1', '17', '6b821a68-b910-4769-ba0c-84016f14a915.gif', '今天');
INSERT INTO `stu` VALUES ('42', '李明月', '1', '2017-05-07', '郑州', null, '1', '17', '66c4bcd9-0740-4c0b-977f-501d35b6a1fc.jpg', null);
INSERT INTO `stu` VALUES ('43', '汤晋升', '0', '2017-05-23', '郑州', null, '1', '17', 'fd392eda-fdd9-433e-b223-a1171577fc22.jpg', null);

-- ----------------------------
-- Table structure for stu_birthplace
-- ----------------------------
DROP TABLE IF EXISTS `stu_birthplace`;
CREATE TABLE `stu_birthplace` (
  `pla_Id` int(11) NOT NULL COMMENT '出生地ID',
  `pla_Name` varchar(255) DEFAULT NULL COMMENT '籍贯名称',
  `pla_parent_Name` int(11) DEFAULT NULL COMMENT '父籍贯名称',
  PRIMARY KEY (`pla_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_birthplace
-- ----------------------------

-- ----------------------------
-- Table structure for stu_classes
-- ----------------------------
DROP TABLE IF EXISTS `stu_classes`;
CREATE TABLE `stu_classes` (
  `cla_Id` int(11) NOT NULL COMMENT '班级ID',
  `cla_Name` varchar(255) DEFAULT NULL COMMENT '班级名称',
  PRIMARY KEY (`cla_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_classes
-- ----------------------------
INSERT INTO `stu_classes` VALUES ('1', 'GS385');
INSERT INTO `stu_classes` VALUES ('2', 'GS382');
INSERT INTO `stu_classes` VALUES ('3', 'GS380');
INSERT INTO `stu_classes` VALUES ('4', 'GS330');

-- ----------------------------
-- Table structure for stu_friend
-- ----------------------------
DROP TABLE IF EXISTS `stu_friend`;
CREATE TABLE `stu_friend` (
  `stu_FriendId` int(255) NOT NULL AUTO_INCREMENT,
  `stuId` int(11) NOT NULL COMMENT '我的ID-->学生表student',
  `frientId` int(11) NOT NULL COMMENT '朋友ID',
  `stu_friend_Flag` int(11) NOT NULL DEFAULT '0' COMMENT '0:不是好友申请加好友之后待审核状态 1：审核同意的   2审核不同意的',
  PRIMARY KEY (`stu_FriendId`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_friend
-- ----------------------------
INSERT INTO `stu_friend` VALUES ('58', '40', '37', '1');
INSERT INTO `stu_friend` VALUES ('59', '37', '40', '1');
INSERT INTO `stu_friend` VALUES ('60', '39', '40', '1');
INSERT INTO `stu_friend` VALUES ('61', '40', '39', '1');
INSERT INTO `stu_friend` VALUES ('62', '42', '41', '1');
INSERT INTO `stu_friend` VALUES ('63', '41', '42', '1');

-- ----------------------------
-- Table structure for stu_message
-- ----------------------------
DROP TABLE IF EXISTS `stu_message`;
CREATE TABLE `stu_message` (
  `stu_messageId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生消息表',
  `stu_Id` int(11) NOT NULL COMMENT '学生ID外键',
  `stu_message_context` longtext NOT NULL,
  `stu_messageTime` datetime NOT NULL,
  PRIMARY KEY (`stu_messageId`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_message
-- ----------------------------
INSERT INTO `stu_message` VALUES ('244', '38', '<a href=\'/Student/queryStudentInfoById.action?stuId=37\'><cite>李福光</cite></a>&nbsp;&nbsp;拒绝你加入&nbsp;<cite><a href=\'/Student/getCommunity.action?id=16>学生会</a></cite>社团', '2017-05-23 13:53:40');
INSERT INTO `stu_message` VALUES ('264', '41', '同意您创建&nbsp;&nbsp;<cite><a href=\'/Student/getCommunity.action?id=17\'>学生部</a></cite>&nbsp;&nbsp;社团 &nbsp;&nbsp;&nbsp;&nbsp;回馈信息:发的', '2017-05-23 16:21:22');
INSERT INTO `stu_message` VALUES ('265', '41', '<a href=\'/Student/queryStudentInfoById.action?stuId=42\'><cite>李明月</cite></a>申请加入&nbsp;&nbsp;<a href=\'/Student/queryById.action\'><cite>学生部</cite></a>&nbsp;&nbsp;社团<span style=\'margin-left:450px;\'><button  class=\'layui-btn layui-btn-danger layui-btn-small  layui-btn-disabled\'>已同意</button></span>', '2017-05-23 16:22:35');
INSERT INTO `stu_message` VALUES ('266', '42', '<a href=\'/Student/queryStudentInfoById.action?stuId=41\'><cite>高玉坤</cite></a>&nbsp;&nbsp;同意你加入&nbsp;<a href=\'/Student/getCommunity.action?id=17\'><cite>学生部</cite></a>社团', '2017-05-23 16:23:00');
INSERT INTO `stu_message` VALUES ('267', '41', '<a href=\'/Student/queryStudentInfoById.action?stuId=43\'><cite>汤晋升</cite></a>申请加入&nbsp;&nbsp;<a href=\'/Student/queryById.action\'><cite>学生部</cite></a>&nbsp;&nbsp;社团<span style=\'margin-left:450px;\'><button  class=\'layui-btn layui-btn-danger layui-btn-small  layui-btn-disabled\'>已同意</button></span>', '2017-05-23 16:24:11');
INSERT INTO `stu_message` VALUES ('268', '43', '<a href=\'/Student/queryStudentInfoById.action?stuId=41\'><cite>高玉坤</cite></a>&nbsp;&nbsp;同意你加入&nbsp;<a href=\'/Student/getCommunity.action?id=17\'><cite>学生部</cite></a>社团', '2017-05-23 16:24:29');
INSERT INTO `stu_message` VALUES ('269', '41', '同意创建<a href=\'/Student/front/activity/activitydetail.jsp?activityId=27\'><cite>金属范德萨</cite></a>活动 回馈信息:&nbsp;&nbsp;范德萨', '2017-05-23 16:25:55');
INSERT INTO `stu_message` VALUES ('270', '41', '<a href=\'/Student/queryStudentInfoById.action?stuId=42\'>李明月</a>申请加入&nbsp;&nbsp;<a href=\'/Student/front/activity/activitydetail.jsp?activityId=27\'>金属范德萨</a>&nbsp;&nbsp;活动<span style=\'margin-left:500px;\'><button  class=\'layui-btn layui-btn-danger layui-btn-small layui-btn-disabled\'>已同意</button></span>', '2017-05-23 16:27:59');
INSERT INTO `stu_message` VALUES ('271', '42', '<a href=\'/Student/queryStudentInfoById.action?stuId=41\'>高玉坤</a>同意您加入&nbsp;&nbsp;<a href=\'/Student/front/activity/activitydetail.jsp?activityId=27\'>金属范德萨</a>&nbsp;&nbsp;活动', '2017-05-23 16:28:25');
INSERT INTO `stu_message` VALUES ('272', '41', '<a href=\'/Student/queryStudentInfoById.action?stuId=42\'><cite>李明月</cite></a>请求加为好友<span style=\'margin-left:530px;\'><button  class=\'layui-btn layui-btn-danger layui-btn-small layui-btn-disabled\'>已同意</button></span> ', '2017-05-23 16:31:01');
INSERT INTO `stu_message` VALUES ('273', '42', '<a href=\'/Student/queryStudentInfoById.action?stuId=41\'><cite>高玉坤</cite></a>同意你加为好友', '2017-05-23 16:31:19');
INSERT INTO `stu_message` VALUES ('274', '42', '<a href=\'/Student/queryStudentInfoById.action?stuId=41\'><cite>高玉坤</cite></a>评论了您的说说', '2017-05-23 16:31:31');
INSERT INTO `stu_message` VALUES ('275', '42', '<a href=\'/Student/queryStudentInfoById.action?stuId=41\'><cite></a>高玉坤</cite>赞了您的说说', '2017-05-23 16:31:37');
INSERT INTO `stu_message` VALUES ('276', '41', '<a href=\'/Student/queryStudentInfoById.action?stuId=42\'><cite>李明月</cite></a>回复了你', '2017-05-23 16:32:13');
INSERT INTO `stu_message` VALUES ('277', '41', '<a href=\'/Student/queryStudentInfoById.action?stuId=42\'><cite>李明月</cite></a>回复了您的评论&nbsp;&nbsp', '2017-05-23 16:34:28');

-- ----------------------------
-- Table structure for stu_recomme_friend
-- ----------------------------
DROP TABLE IF EXISTS `stu_recomme_friend`;
CREATE TABLE `stu_recomme_friend` (
  `recomm_Id` int(11) NOT NULL,
  `recomme_studentId` int(11) NOT NULL COMMENT '推荐人的ID,给谁推荐',
  `recomme_refereeStudentId` varchar(255) DEFAULT NULL COMMENT '被推荐人ID',
  `recomme_reason` int(255) DEFAULT NULL COMMENT '推荐原因',
  PRIMARY KEY (`recomm_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_recomme_friend
-- ----------------------------
INSERT INTO `stu_recomme_friend` VALUES ('1', '1', '3', '1');

-- ----------------------------
-- Table structure for stu_score
-- ----------------------------
DROP TABLE IF EXISTS `stu_score`;
CREATE TABLE `stu_score` (
  `sco_Id` int(11) NOT NULL,
  `sco_SubjectId` int(255) DEFAULT NULL COMMENT '科目ID',
  `sco_StudentId` int(11) DEFAULT NULL COMMENT '学生ID',
  `sco_theScore` int(255) DEFAULT NULL COMMENT '理论分数',
  PRIMARY KEY (`sco_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_score
-- ----------------------------

-- ----------------------------
-- Table structure for stu_subject
-- ----------------------------
DROP TABLE IF EXISTS `stu_subject`;
CREATE TABLE `stu_subject` (
  `sub_Id` int(11) NOT NULL COMMENT '科目Id',
  `sub_Name` varchar(255) NOT NULL COMMENT '科目名称',
  `sub_StageId` int(11) NOT NULL COMMENT '课程阶段',
  PRIMARY KEY (`sub_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_subject
-- ----------------------------
INSERT INTO `stu_subject` VALUES ('1', 'C#', '1');

-- ----------------------------
-- Table structure for stu_tea
-- ----------------------------
DROP TABLE IF EXISTS `stu_tea`;
CREATE TABLE `stu_tea` (
  `stu_id` int(11) NOT NULL COMMENT '学生ID',
  `tea_id` int(11) NOT NULL COMMENT '老师ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_tea
-- ----------------------------
INSERT INTO `stu_tea` VALUES ('1', '1');

-- ----------------------------
-- Table structure for talking
-- ----------------------------
DROP TABLE IF EXISTS `talking`;
CREATE TABLE `talking` (
  `talking_Id` int(11) NOT NULL AUTO_INCREMENT,
  `talking_Content` varchar(255) NOT NULL,
  `talking_StudentId` int(11) NOT NULL,
  `talking_Time` datetime NOT NULL,
  `talking_thumCount` int(11) NOT NULL,
  `talking_authorityId` int(11) NOT NULL COMMENT '说说的可见性',
  PRIMARY KEY (`talking_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talking
-- ----------------------------
INSERT INTO `talking` VALUES ('72', 'fdsafdsafdsafdsafdsaffdsafdsa', '37', '2017-05-23 14:12:00', '0', '2');
INSERT INTO `talking` VALUES ('75', 'fdsfsad', '40', '2017-05-23 14:13:58', '0', '1');
INSERT INTO `talking` VALUES ('77', 'fdsfdsfsdafsdafds', '39', '2017-05-23 14:14:28', '0', '1');
INSERT INTO `talking` VALUES ('78', 'fds', '39', '2017-05-23 14:14:37', '0', '2');
INSERT INTO `talking` VALUES ('79', '今天他', '42', '2017-05-23 16:30:12', '1', '1');
INSERT INTO `talking` VALUES ('80', '范德萨', '42', '2017-05-23 16:30:36', '0', '2');

-- ----------------------------
-- Table structure for talking_authority
-- ----------------------------
DROP TABLE IF EXISTS `talking_authority`;
CREATE TABLE `talking_authority` (
  `talking_authorityId` int(11) NOT NULL COMMENT '说说可见性ID',
  `talking_tuthorityName` varchar(255) DEFAULT NULL COMMENT '说说可见性名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talking_authority
-- ----------------------------
INSERT INTO `talking_authority` VALUES ('1', '好友可见');
INSERT INTO `talking_authority` VALUES ('2', '自己可见');

-- ----------------------------
-- Table structure for talking_photos
-- ----------------------------
DROP TABLE IF EXISTS `talking_photos`;
CREATE TABLE `talking_photos` (
  `talkingPhotoId` int(11) NOT NULL AUTO_INCREMENT,
  `talkingId` int(11) DEFAULT NULL,
  `talkingPhoto` varchar(255) DEFAULT NULL COMMENT '说说照片',
  PRIMARY KEY (`talkingPhotoId`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talking_photos
-- ----------------------------
INSERT INTO `talking_photos` VALUES ('63', '72', '6744adc4_88a4_4a36_8c38_e88213c88fd7.gif');
INSERT INTO `talking_photos` VALUES ('66', '75', 'e6c0cf21_e854_437b_a977_177dc64f578d.jpg');
INSERT INTO `talking_photos` VALUES ('68', '78', '01f96ff4_9814_444d_bf8e_e314b11bc1c7.gif');
INSERT INTO `talking_photos` VALUES ('69', '80', 'a5fe5df6_7e12_426b_90a0_c010ee7c18c6.jpg');
INSERT INTO `talking_photos` VALUES ('70', '80', '75a38708_6fee_491b_afb7_26c7a417d838.jpg');

-- ----------------------------
-- Table structure for talking_stu_thum
-- ----------------------------
DROP TABLE IF EXISTS `talking_stu_thum`;
CREATE TABLE `talking_stu_thum` (
  `talking_Id` int(11) NOT NULL COMMENT '被赞的说说ID',
  `stu_Id` int(11) NOT NULL COMMENT '赞说说的学生ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talking_stu_thum
-- ----------------------------
INSERT INTO `talking_stu_thum` VALUES ('79', '41');

-- ----------------------------
-- Table structure for talking_tocao
-- ----------------------------
DROP TABLE IF EXISTS `talking_tocao`;
CREATE TABLE `talking_tocao` (
  `talking_tocao_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '说说的评论ID',
  `talking_id` int(11) DEFAULT NULL,
  `talking_tocao_Context` varchar(255) NOT NULL COMMENT '评论说说的内容',
  `talking_tocao_parentId` int(11) DEFAULT NULL COMMENT '评论的父ID',
  `talking_tocao_studentId` int(11) NOT NULL COMMENT '评论这个说说的学生Id',
  `talking_tocao_Time` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`talking_tocao_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talking_tocao
-- ----------------------------
INSERT INTO `talking_tocao` VALUES ('60', '77', 'dfds', '0', '40', '2017-05-23 14:18:18');
INSERT INTO `talking_tocao` VALUES ('61', '79', 'fds', '0', '41', '2017-05-23 16:31:31');
INSERT INTO `talking_tocao` VALUES ('62', '79', 'fdsfds ', '61', '42', '2017-05-23 16:32:13');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tea_id` int(11) NOT NULL COMMENT '老师ID',
  `tea_name` varchar(255) NOT NULL COMMENT '老师名称',
  PRIMARY KEY (`tea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('2', '朱磊');
INSERT INTO `teacher` VALUES ('3', '王老师');
INSERT INTO `teacher` VALUES ('4', '张老师');
