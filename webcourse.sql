/*
Navicat MySQL Data Transfer

Source Server         : pengzq
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : webcourse

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-06-01 01:14:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `AdminID` char(100) NOT NULL,
  `AdminName` varchar(50) NOT NULL,
  `RealName` varchar(20) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `DeptID` char(50) NOT NULL,
  PRIMARY KEY (`AdminID`),
  KEY `DeptID` (`DeptID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'pzhiquan', '彭志权', '19960616', '9');
INSERT INTO `admin` VALUES ('1EB1607A06614ECA83A4C7D05DB9F0C8', 'JC9600', '叶金成', 'yejincheng10', '9');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `CourseID` char(100) NOT NULL,
  `CourseName` varchar(50) NOT NULL,
  `CourseType` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Major` varchar(50) NOT NULL,
  `Teacher` varchar(20) NOT NULL,
  `Dept` varchar(50) NOT NULL,
  `Year` int(4) DEFAULT NULL,
  `Adress` varchar(50) NOT NULL,
  `CreateMan` varchar(20) NOT NULL,
  `CreateTime` date NOT NULL,
  `CourseImages` varchar(100) NOT NULL,
  `PageView` int(4) DEFAULT NULL,
  `CourseDescription` varchar(1000) NOT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`CourseID`,`orderBy`),
  KEY `orderBy` (`orderBy`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1B5E51C4DA56421B828143DBFA2942E2', '植物生物学', '精品资源共享课', '理学', '生物科学', '廖建良', '生命科学学院', null, 'http://119.146.68.29/_s117/main.psp', 'pzhiquan', '2018-04-14', '/bs-course/images/10D487BAB82E40A2A396CF6EFBFFCD82_5af5edea19b3d15cd39750e51636647c.jpg', '1', '植物生物学是生物技术专业的专业核心课，是进一步学习普通生态学、植物遗传学、植物生物技术、细胞生物学、进化生物学、植物分子生物学等课程的基础。对提高大学生的基本科学素质和进一步学习其它专业课程有着十分密切的联系和重要的影响。', '9');
INSERT INTO `course` VALUES ('2', '服装结构设计', '精品资源共享课', '艺术学', '服装设计与工程', '刘东', '旭日广东服装学院', null, 'http://202.192.224.234/fzjgsj/n3c19.shtml', 'pzhiquan', '2018-04-02', '/bs-course/images/fzjg.jpg', '2', '《服装结构设计》是服装款式造型设计的延伸和发展，又是工艺设计的准备和基础，是服装设计与工程学科专业基础课程中最具有服装本身特色的专业基础课程，也是覆盖面最大的、教学任务重的专业基础课程。', '2');
INSERT INTO `course` VALUES ('2552CFC2F5D642CCB8FBD326F0448571', '概率论与数理统计', '精品资源共享课', '理学', '信息管理与信息系统', '柯忠义', '数学与大数据学院', null, 'http://course.hzu.edu.cn/gltj//default.aspx', 'JC9600', '2018-04-16', '/bs-course/images/F003F7D64A6F4F359CBEDDA3267C1A66_gt.jpg', '0', '概率论与数理统计是理工科和经济类学科的重要基础课程，是对随机现象统计规律演绎的研究，是处理随机现象的一门重要课程。概率论 概率论部分侧重于理论探讨，介绍概率论的基本概念，建立一系列定理和公式，寻求解决统计和随机过程问题的方法。 ', '17');
INSERT INTO `course` VALUES ('2CC40B469B5F49A686A552D589B3DF6C', '数学分析', '精品资源共享课', '理学', '数学与应用数学', '许金泉', '数学与大数据学院', null, 'http://course.hzu.edu.cn/sxfx/', 'JC9600', '2018-04-16', '/bs-course/images/94C926091B264279A45777AAC4BF2EAD_sxfx.jpg', '0', '本课程的教学内容为微积分的基本理论和方法 ，在数学分析的基本框架内介绍连续函数及其微积理论 。数学分析课在长期的教学实践中 ，已形成一个结构严谨的理论体系。本课程的教学基本上采用历史上形成的这一理论体系 ,在这一理论体系之下, 拓宽选材范围 ,从国内外多种教材和文献中选材， 结合教学的实际情况组织教学内容 ', '16');
INSERT INTO `course` VALUES ('3', '中国古典诗歌导读', '精品视频公开课', '文学', '汉语言文学', '申东城', '文学与传媒学院', null, 'http://202.192.224.234/gdsg/default.aspx', 'pzhiquan', '2018-04-02', '/bs-course/images/gdsg.jpg', '3', '《中国古典诗歌导读》是一门在文化地理学视域下，本位文学，兼顾其他文化因素，考察古典诗歌与岭南、巴蜀、黄河、长江等地域文化之间的关联性，并比对南北之别和东西差异，分析其在诗歌中的呈现形式及地域诗学的内涵意蕴、审美趣味等的专业课。', '3');
INSERT INTO `course` VALUES ('3448AED6D08E4AD59C03732DAF544AA8', '植物学', '精品资源共享课', '理学', '生物科学', '廖建良', '生命科学学院', null, 'http://119.146.68.29/_s118/main.psp', 'pzhiquan', '2018-04-14', '/bs-course/images/190A916A543E4E04A44F322F80C2D827_b064fbed93b7d147778a9c07e5f22663.jpg', '4', '《植物学》是一门内容十分广博的学科,研究对象是植物各类群的形态结构、分类和有关的生命活动、发育规律，以及植物和外界环境间多种多样关系的科学。', '13');
INSERT INTO `course` VALUES ('4', '特色社会主义', '精品资源共享课', '哲学', '马克思主义哲学', '杨凤', '马克思主义学院', null, 'http://202.192.224.234/shzy/n2c22.shtml', 'pzhiquan', '2018-04-02', '/bs-course/images/shzy.jpg', '0', '从理论和实践方面看，本门课程具有很强的时代感和针对性，是与时俱进的结果。追溯本门课程发展的历史进程，有两个层面的演进：一是由公共课到专业基础课；二是由中国革命史、到毛泽东思想概论、到邓小平理论、到邓小平理论和“三个代表”重要思想、到中国特色社会主义理论体系概论。', '4');
INSERT INTO `course` VALUES ('5', '饮食健康与营养', '精品视频公开课', '理学', '生物科学', '丁运华', '生命科学学院', null, 'http://course.hzu.edu.cn/jk/', 'pzhiquan', '2018-04-02', '/bs-course/images/ysyy.png', '5', '该课程所属学科是营养与食品卫生学，授课的主要内容包括人体的营养生理基础，食物中的能量和营养素的作用及其膳食来源与供给量，合理膳食的要素，营养评估的方法，以及营养与疾病的知识。', '5');
INSERT INTO `course` VALUES ('57545F6A87F44F7CA58242938DFF4311', '高等代数', '精品视频公开课', '理学', '数学与应用数学', '潘庆年', '数学与大数据学院', null, 'http://jpkc.hzu.edu.cn/maths/', 'JC9600', '2018-04-16', '/bs-course/images/188C8046E7B148059A3042470EBA68AB_gdds.jpg', '0', ' 通过本课程的学习, 掌握多项式和线性代数的基本知识和基础理论，熟悉和掌握抽象的、公理化的代数方法，理解具体与抽象、特殊与一般、有限与无限等辨证关系，提高抽象思维、逻辑推理及运算能力，提供进一步学习所必备的代数知识.', '15');
INSERT INTO `course` VALUES ('6', '文学概论', '精品资源共享课', '文学', '汉语言文学', '伍世昭', '文学与传媒学院', null, 'http://course.hzu.edu.cn/wxgl/', 'pzhiquan', '2018-04-02', '/bs-course/images/wxgl.png', '6', '本课程介绍和阐述文学理论的性质和形态，文学活动的性质和文学创作的过程，文学作品及文 学消费与接受的性质和特征，帮助学生掌握文学理论的基本原理和基础知识，树立马克思主义文艺观点，提高欣赏、评论文学作品的能力，科学地认识和理解文学现 象，为学习其他文学课程和以后从事语文教学奠定文学方面的理论基础。', '6');
INSERT INTO `course` VALUES ('7', '物流学', '精品资源共享课', '经济学', '国际贸易', '张敏', '经济管理学院', null, 'http://course.hzu.edu.cn/wl/default.aspx', 'pzhiquan', '2018-04-02', '/bs-course/images/wlx.jpg', '0', '　由于物流学是基于管理学的一门新兴交叉学科，物流管理专业或方向的基础课程名称名称也经历了一个演变的过程。如今，在教育部物流教学指导委员会《关于高等学校物流类专业人才培养方案的意见》（试行）中，《物流学》和《供应链管理》被明确列为物流管理专业的基础课程。', '7');
INSERT INTO `course` VALUES ('C32BE03939974F26976B8ADC8C6EF889', '近世代数', '精品资源共享课', '理学', '数学与应用数学', '潘庆年', '数学与大数据学院', null, 'http://119.146.68.29/_s119/main.psp', 'JC9600', '2018-04-16', '/bs-course/images/0D9511C13C2F4D54A1AAF5FB51FE16F2_jsds.jpg', '0', '近世代数是高等代数的后继课程。人们把19世纪以后发展起来的以研究代数体系为内容的代数学叫近世代数,又叫做抽象代数通过本课程的学习，可以培养学生的抽象思维能力和严密的逻辑推理能力。', '10');

-- ----------------------------
-- Table structure for `coursenotice`
-- ----------------------------
DROP TABLE IF EXISTS `coursenotice`;
CREATE TABLE `coursenotice` (
  `NoticeID` char(50) NOT NULL,
  `NoticeTitle` varchar(50) NOT NULL,
  `NoticeContent` varchar(1000) NOT NULL,
  `NoticeData` datetime NOT NULL,
  `NoticeImages` varchar(50) NOT NULL,
  PRIMARY KEY (`NoticeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursenotice
-- ----------------------------

-- ----------------------------
-- Table structure for `coursetype`
-- ----------------------------
DROP TABLE IF EXISTS `coursetype`;
CREATE TABLE `coursetype` (
  `CourseTypeID` char(50) NOT NULL,
  `CourseTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`CourseTypeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursetype
-- ----------------------------
INSERT INTO `coursetype` VALUES ('1', '精品资源共享课');
INSERT INTO `coursetype` VALUES ('2', '精品视频公开课');

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `DeptID` char(50) NOT NULL,
  `DeptName` varchar(50) NOT NULL,
  PRIMARY KEY (`DeptID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '电子信息与电气工程学院');
INSERT INTO `dept` VALUES ('2', '地理与旅游学院');
INSERT INTO `dept` VALUES ('3', '化学与材料工程学院');
INSERT INTO `dept` VALUES ('4', '经济管理学院');
INSERT INTO `dept` VALUES ('5', '建筑与土木工程学院');
INSERT INTO `dept` VALUES ('6', '\r\n\r\n\r\n教育科学学院');
INSERT INTO `dept` VALUES ('7', '\r\n美术与设计学院');
INSERT INTO `dept` VALUES ('8', '马克思主义学院');
INSERT INTO `dept` VALUES ('9', '数学与大数据学院');
INSERT INTO `dept` VALUES ('10', '生命科学学院');
INSERT INTO `dept` VALUES ('11', '体育学院');
INSERT INTO `dept` VALUES ('12', '\r\n外国语学院');
INSERT INTO `dept` VALUES ('13', '文学与传媒学院');
INSERT INTO `dept` VALUES ('14', '旭日广东服装学院');
INSERT INTO `dept` VALUES ('15', '信息科学技术学院');
INSERT INTO `dept` VALUES ('16', '\r\n音乐学院');
INSERT INTO `dept` VALUES ('17', '政法学院');

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `MajorID` char(50) NOT NULL,
  `MajorName` varchar(50) NOT NULL,
  `SubjectID` char(50) DEFAULT NULL,
  PRIMARY KEY (`MajorID`),
  KEY `SubjectID` (`SubjectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '国际经济与贸易', '1');
INSERT INTO `major` VALUES ('2', '法学', '2');
INSERT INTO `major` VALUES ('3', '社会工作', '2');
INSERT INTO `major` VALUES ('4', '思想政治教育', '2');
INSERT INTO `major` VALUES ('5', '学前教育', '3');
INSERT INTO `major` VALUES ('6', '体育教育', '3');
INSERT INTO `major` VALUES ('7', '汉语言文学', '4');
INSERT INTO `major` VALUES ('8', '英语', '4');
INSERT INTO `major` VALUES ('9', '日语', '4');
INSERT INTO `major` VALUES ('10', '历史学', '5');
INSERT INTO `major` VALUES ('11', '数学与应用数学', '6');
INSERT INTO `major` VALUES ('12', '物理学', '6');
INSERT INTO `major` VALUES ('13', '化学', '6');
INSERT INTO `major` VALUES ('14', '应用化学', '6');
INSERT INTO `major` VALUES ('15', '地理科学', '6');
INSERT INTO `major` VALUES ('16', '生物科学', '6');
INSERT INTO `major` VALUES ('17', '生物技术', '6');
INSERT INTO `major` VALUES ('18', '应用统计学', '6');
INSERT INTO `major` VALUES ('19', '电气工程及其自动化', '7');
INSERT INTO `major` VALUES ('20', '电子信息工程', '7');
INSERT INTO `major` VALUES ('21', '电子信息科学与技术', '7');
INSERT INTO `major` VALUES ('22', '计算机科学与技术', '7');
INSERT INTO `major` VALUES ('23', '软件工程', '7');
INSERT INTO `major` VALUES ('24', '网络工程', '7');
INSERT INTO `major` VALUES ('25', '土木工程', '7');
INSERT INTO `major` VALUES ('26', '化学工程与工艺', '7');
INSERT INTO `major` VALUES ('27', '服装设计与工程', '7');
INSERT INTO `major` VALUES ('28', '建筑学', '7');
INSERT INTO `major` VALUES ('29', '园林', '8');
INSERT INTO `major` VALUES ('30', '信息管理与信息系统', '9');
INSERT INTO `major` VALUES ('31', '工程管理', '9');
INSERT INTO `major` VALUES ('32', '市场营销', '9');
INSERT INTO `major` VALUES ('33', '财务管理', '9');
INSERT INTO `major` VALUES ('34', '审计学', '9');
INSERT INTO `major` VALUES ('35', '行政管理', '9');
INSERT INTO `major` VALUES ('36', '物流管理', '9');
INSERT INTO `major` VALUES ('37', '旅游管理', '9');
INSERT INTO `major` VALUES ('38', '音乐表演', '10');
INSERT INTO `major` VALUES ('39', '音乐学', '10');
INSERT INTO `major` VALUES ('40', '美术学', '10');
INSERT INTO `major` VALUES ('41', '视觉传达设计', '10');
INSERT INTO `major` VALUES ('42', '环境设计', '10');
INSERT INTO `major` VALUES ('37CF566A77144183960AE95FC6AEB179', '产品设计', null);
INSERT INTO `major` VALUES ('44', '服装与服饰设计', '10');

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `SubjectID` char(50) NOT NULL,
  `SubjectName` varchar(50) NOT NULL,
  PRIMARY KEY (`SubjectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', '经济学');
INSERT INTO `subject` VALUES ('2', '法学');
INSERT INTO `subject` VALUES ('3', '教育学');
INSERT INTO `subject` VALUES ('4', '文学');
INSERT INTO `subject` VALUES ('5', '历史学');
INSERT INTO `subject` VALUES ('6', '理学');
INSERT INTO `subject` VALUES ('7', '工学');
INSERT INTO `subject` VALUES ('8', '农学');
INSERT INTO `subject` VALUES ('9', '管理学');
INSERT INTO `subject` VALUES ('10', '艺术学');
