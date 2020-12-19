/*
Navicat MySQL Data Transfer

Source Server         : locahost
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : aa

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-12-19 11:25:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('123', 'admin', '182008');
INSERT INTO `admin` VALUES ('456', 'rol', '182008');
INSERT INTO `admin` VALUES ('789', 'rols', '182008');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '打发打发士大夫地方帆帆帆帆帆帆帆帆帆帆撒旦发射', '2015-02-01 00:00:00');

-- ----------------------------
-- Table structure for `dinnertable`
-- ----------------------------
DROP TABLE IF EXISTS `dinnertable`;
CREATE TABLE `dinnertable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableName` varchar(20) DEFAULT NULL,
  `tableStatus` int(11) DEFAULT '0',
  `orderDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of dinnertable
-- ----------------------------
INSERT INTO `dinnertable` VALUES ('1', '1号桌', '0', null);
INSERT INTO `dinnertable` VALUES ('2', '2号桌', '1', '2021-01-01 18:05:04');
INSERT INTO `dinnertable` VALUES ('3', '3号桌', '0', null);
INSERT INTO `dinnertable` VALUES ('4', '4号桌', '0', null);
INSERT INTO `dinnertable` VALUES ('5', '5号桌', '0', null);
INSERT INTO `dinnertable` VALUES ('6', '6号桌', '0', null);
INSERT INTO `dinnertable` VALUES ('7', '7号桌', '0', null);
INSERT INTO `dinnertable` VALUES ('8', '8号桌', '0', null);
INSERT INTO `dinnertable` VALUES ('9', '9号桌', '0', null);
INSERT INTO `dinnertable` VALUES ('10', '10号桌', '0', null);
INSERT INTO `dinnertable` VALUES ('11', '11号桌', '0', null);
INSERT INTO `dinnertable` VALUES ('12', '12号桌', '0', null);

-- ----------------------------
-- Table structure for `food`
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foodName` varchar(20) DEFAULT NULL,
  `foodType_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `popularity` int(11) DEFAULT '0',
  `comment` int(11) DEFAULT '0',
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foodType_id` (`foodType_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`foodType_id`) REFERENCES `foodtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('1', '鲜橙汁', '1', '17', '11111111', '25', '0', null);
INSERT INTO `food` VALUES ('2', '木瓜汁', '1', '26', '22222222222', '21', '0', null);
INSERT INTO `food` VALUES ('3', '芒果汁', '1', '31', '111111111111111', '26', '0', null);
INSERT INTO `food` VALUES ('4', '拿铁', '2', '28', '12212', '36', '0', null);
INSERT INTO `food` VALUES ('5', '摩卡', '2', '30', 'sdfsdf', '13', '0', null);
INSERT INTO `food` VALUES ('6', '卡布奇诺', '2', '28', 'xcvxcv', '36', '0', null);
INSERT INTO `food` VALUES ('7', '原味奶茶', '3', '22', 'sdfsd', '21', '0', null);
INSERT INTO `food` VALUES ('8', '茉香奶茶', '3', '22', 'retyt', '32', '0', null);
INSERT INTO `food` VALUES ('9', '蜂蜜柚子茶', '3', '23', 'ghg', '25', '0', null);
INSERT INTO `food` VALUES ('10', '提拉米苏', '4', '28', 'bn', '32', '0', null);
INSERT INTO `food` VALUES ('11', '芝士蛋糕', '4', '23', 'dfdf', '25', '0', null);
INSERT INTO `food` VALUES ('12', '焦糖苹果', '4', '26', 'cvc', '35', '0', null);
INSERT INTO `food` VALUES ('13', '苏打水', '5', '3', 'xcvcv', '26', '0', null);
INSERT INTO `food` VALUES ('14', '矿泉水', '5', '4', 'xcvxcv', '32', '0', null);
INSERT INTO `food` VALUES ('15', '巴黎水', '5', '7', '反对反对', '25', '0', null);
INSERT INTO `food` VALUES ('16', '可乐', '5', '23', '花见花开', '21', '0', null);
INSERT INTO `food` VALUES ('17', '雪碧', '5', '95', '从v不错v', '0', '0', null);
INSERT INTO `food` VALUES ('18', '冰糕', '5', '6', '565656', '56', '65', null);
INSERT INTO `food` VALUES ('19', '小雪糕', '6', '5', '45', '45', '54', null);
INSERT INTO `food` VALUES ('20', '大雪糕', '1', '12', '21\r\n                \r\n                ', '0', '0', null);
INSERT INTO `food` VALUES ('21', '豆腐脑', '4', '2.3', '99999999\r\n                \r\n                ', '0', '0', null);
INSERT INTO `food` VALUES ('22', '小蛋糕', '4', '100.32', '333333332656598', '0', '0', null);

-- ----------------------------
-- Table structure for `foodtype`
-- ----------------------------
DROP TABLE IF EXISTS `foodtype`;
CREATE TABLE `foodtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of foodtype
-- ----------------------------
INSERT INTO `foodtype` VALUES ('1', '果汁');
INSERT INTO `foodtype` VALUES ('2', '咖啡');
INSERT INTO `foodtype` VALUES ('3', '奶茶');
INSERT INTO `foodtype` VALUES ('4', '甜品');
INSERT INTO `foodtype` VALUES ('5', '其它');
INSERT INTO `foodtype` VALUES ('6', '666');
INSERT INTO `foodtype` VALUES ('7', '77');
INSERT INTO `foodtype` VALUES ('8', '888');

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL,
  `foodCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('1', '1', '1', '2');
INSERT INTO `orderdetail` VALUES ('2', '1', '2', '2');
INSERT INTO `orderdetail` VALUES ('3', '1', '3', '3');
INSERT INTO `orderdetail` VALUES ('6', '1', '5', '4');
INSERT INTO `orderdetail` VALUES ('14', '1', '16', '1');
INSERT INTO `orderdetail` VALUES ('15', '1', '15', '1');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderUser` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `totalPrice` double DEFAULT NULL,
  `orderStatus` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `table_id` (`table_id`),
  KEY `orders_ibfk_2` (`orderUser`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `dinnertable` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`orderUser`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '1', '2', '2021-01-01 18:05:04', '329', '1');
INSERT INTO `orders` VALUES ('2', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('3', '3', null, null, null, '0');
INSERT INTO `orders` VALUES ('4', '4', null, null, null, '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `age` varchar(5) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '182008', '182008', '我的风格', '9632584', '女', '12', 'sssss', '213');
INSERT INTO `user` VALUES ('2', '123456', '654321', '大大方方', '12', '女', '2', '3', '321');
INSERT INTO `user` VALUES ('3', '32', '65', '任然', '54', '女', '98', '4', '4');
INSERT INTO `user` VALUES ('4', '45', '45', '鹅鹅', '4545', '女', '45', '45', '45');
