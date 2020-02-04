/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : db_ebuy

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 07/10/2019 21:07:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_bigtype
-- ----------------------------
DROP TABLE IF EXISTS `t_bigtype`;
CREATE TABLE `t_bigtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bigtype
-- ----------------------------
INSERT INTO `t_bigtype` VALUES (1, '服饰', '服装');
INSERT INTO `t_bigtype` VALUES (2, '数码', NULL);
INSERT INTO `t_bigtype` VALUES (3, '美食', NULL);
INSERT INTO `t_bigtype` VALUES (4, '家电', NULL);
INSERT INTO `t_bigtype` VALUES (5, '美妆', '');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `nickName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `replyContent` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `replyTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (2, '积分大返利，优惠多多', '2018-01-02 00:00:00', 'jarry', '会员特惠月开始！', '2018-03-28 00:00:00');
INSERT INTO `t_comment` VALUES (3, '非常好', '2018-01-03 00:00:00', '阿拉蕾', NULL, '2018-03-29 00:00:00');
INSERT INTO `t_comment` VALUES (4, '客服态度非常好', '2018-01-04 00:00:00', '小明', '谢谢您的肯定。', '2018-03-30 00:00:00');
INSERT INTO `t_comment` VALUES (6, '网上购物方便快捷', '2018-03-28 00:00:00', '哆啦A梦', '', '2018-04-13 18:11:51');
INSERT INTO `t_comment` VALUES (18, '什么时候发货？', '2018-04-14 00:00:00', '孙悟空', '24小时内会尽快', '2018-04-14 21:26:46');
INSERT INTO `t_comment` VALUES (21, '这个网站不错。', '2018-04-14 08:10:13', '猪八戒', '谢谢，我们会继续努力。', NULL);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` float NOT NULL,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `orderNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_kh19wisaki6acmrs36vcmboj3`(`userId`) USING BTREE,
  CONSTRAINT `FK_kh19wisaki6acmrs36vcmboj3` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (1, 964, '2018-04-19 07:57:09', '20141022075709', 3, 4);
INSERT INTO `t_order` VALUES (2, 7896, '2018-04-19 07:59:51', '20141022075951', 3, 4);
INSERT INTO `t_order` VALUES (3, 23190, '2018-04-20 08:04:24', '20141022080424', 3, 4);
INSERT INTO `t_order` VALUES (4, 1497, '2018-04-21 16:50:27', '20180421045027', 3, 1);
INSERT INTO `t_order` VALUES (5, 499, '2018-04-23 16:17:21', '20180423041721', 3, 10);
INSERT INTO `t_order` VALUES (6, 499, '2018-04-23 18:00:21', '20180423060021', 3, 2);
INSERT INTO `t_order` VALUES (7, 499, '2018-04-23 20:07:54', '20180423080754', 3, 10);
INSERT INTO `t_order` VALUES (8, 1179, '2018-05-19 09:49:19', '20180519094919', 3, 10);
INSERT INTO `t_order` VALUES (9, 2358, '2018-05-19 09:49:58', '20180519094958', 3, 10);
INSERT INTO `t_order` VALUES (10, 1139, '2018-05-19 09:53:08', '20180519095308', 1, 1);
INSERT INTO `t_order` VALUES (11, 318, '2018-05-19 09:57:11', '20180519095711', 1, 1);
INSERT INTO `t_order` VALUES (12, 1139, '2018-05-19 09:57:52', '20180519095752', 1, 1);
INSERT INTO `t_order` VALUES (13, 318, '2018-05-19 09:58:31', '20180519095831', 3, 1);

-- ----------------------------
-- Table structure for t_order_product
-- ----------------------------
DROP TABLE IF EXISTS `t_order_product`;
CREATE TABLE `t_order_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `orderId` int(11) NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_8k7n3hmcgwvrs3ljx47u8l5w6`(`orderId`) USING BTREE,
  INDEX `FK_1orhyavyw8w5a8cj5tmtqfpd2`(`productId`) USING BTREE,
  CONSTRAINT `FK_1orhyavyw8w5a8cj5tmtqfpd2` FOREIGN KEY (`productId`) REFERENCES `t_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_8k7n3hmcgwvrs3ljx47u8l5w6` FOREIGN KEY (`orderId`) REFERENCES `t_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_product
-- ----------------------------
INSERT INTO `t_order_product` VALUES (1, 1, 1, 21);
INSERT INTO `t_order_product` VALUES (2, 1, 1, 15);
INSERT INTO `t_order_product` VALUES (3, 3, 1, 87);
INSERT INTO `t_order_product` VALUES (4, 1, 2, NULL);
INSERT INTO `t_order_product` VALUES (5, 1, 2, NULL);
INSERT INTO `t_order_product` VALUES (6, 2, 2, 87);
INSERT INTO `t_order_product` VALUES (7, 1, 3, NULL);
INSERT INTO `t_order_product` VALUES (8, 1, 3, 40);
INSERT INTO `t_order_product` VALUES (9, 2, 3, 92);
INSERT INTO `t_order_product` VALUES (10, 3, 4, NULL);
INSERT INTO `t_order_product` VALUES (11, 1, 5, NULL);
INSERT INTO `t_order_product` VALUES (12, 1, 6, NULL);
INSERT INTO `t_order_product` VALUES (13, 1, 7, 291);
INSERT INTO `t_order_product` VALUES (14, 1, 8, 25);
INSERT INTO `t_order_product` VALUES (15, 2, 9, 25);
INSERT INTO `t_order_product` VALUES (16, 1, 10, 27);
INSERT INTO `t_order_product` VALUES (17, 1, 11, 20);
INSERT INTO `t_order_product` VALUES (18, 1, 12, 27);
INSERT INTO `t_order_product` VALUES (19, 1, 13, 20);

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hot` int(11) NOT NULL,
  `hotTime` datetime(0) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(11) NOT NULL,
  `proPic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `specialPrice` int(11) NOT NULL,
  `specialPriceTime` datetime(0) NULL DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `bigTypeId` int(11) NULL DEFAULT NULL,
  `smallTypeId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_2vciohqujaeij91ujm5va2xs4`(`bigTypeId`) USING BTREE,
  INDEX `FK_qexns4el8esjqbdrqfys82ih8`(`smallTypeId`) USING BTREE,
  CONSTRAINT `FK_2vciohqujaeij91ujm5va2xs4` FOREIGN KEY (`bigTypeId`) REFERENCES `t_bigtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_qexns4el8esjqbdrqfys82ih8` FOREIGN KEY (`smallTypeId`) REFERENCES `t_smalltype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 295 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (8, 'MALI/2018春季修身显瘦破洞裤高腰女牛仔裤九分紧身铅笔裤小脚裤', 1, '2014-01-01 00:00:00', 'MALI/2018春季修身显瘦破洞裤高腰女牛仔裤九分紧身铅笔裤小脚裤', 78, 'images/product/20180505040051.jpg', 0, '2014-01-01 00:00:00', 65, 1, 8);
INSERT INTO `t_product` VALUES (9, '2018新款牛仔小脚裤', 1, '2014-01-01 00:00:00', '2018新款牛仔小脚裤', 99, 'images/product/6.jpg', 0, NULL, 152, 1, 8);
INSERT INTO `t_product` VALUES (10, '2018春装新款 韩版修身显瘦小脚裤休', 1, '2014-01-01 00:00:00', '2018春装新款 韩版修身显瘦小脚裤休', 79, 'images/product/7.jpg', 0, NULL, 52, 1, 8);
INSERT INTO `t_product` VALUES (14, '名驭 牛仔裤女小脚裤韩版潮2014春装', 1, '2014-01-01 00:00:00', '名驭 牛仔裤女小脚裤韩版潮2014春装', 79, 'images/product/8.jpg', 0, NULL, 55, 1, 8);
INSERT INTO `t_product` VALUES (15, '皮尔卡丹 男士牛仔裤 男 直筒 春夏新品 ', 1, '2014-01-01 00:00:00', '皮尔卡丹 男士牛仔裤 男 直筒 春夏新品 ', 199, 'images/product/9.jpg', 0, NULL, 125, 1, 8);
INSERT INTO `t_product` VALUES (16, 'Le hondies2014男士白色牛仔裤韩版', 1, '2014-01-01 00:00:00', 'Le hondies2014男士白色牛仔裤韩版', 129, 'images/product/10.jpg', 0, NULL, 129, 1, 8);
INSERT INTO `t_product` VALUES (17, '夏装新品 唐狮正品男基本修身小脚牛仔', 1, '2014-01-01 00:00:00', '夏装新品 唐狮正品男基本修身小脚牛仔', 129, 'images/product/11.jpg', 0, NULL, 129, 1, 8);
INSERT INTO `t_product` VALUES (18, 'gxg.1978男装2018新款春装休闲修身', 1, '2014-01-01 00:00:00', 'gxg.1978男装2018新款春装休闲修身', 229, 'images/product/12.jpg', 0, NULL, 229, 1, 7);
INSERT INTO `t_product` VALUES (19, '罗蒙 休闲西服男士小西装外套商务正装', 1, '2013-01-01 00:00:00', '罗蒙 休闲西服男士小西装外套商务正装', 449, 'images/product/13.jpg', 0, NULL, 125, 1, 7);
INSERT INTO `t_product` VALUES (20, '领般【新品】男士西服套装 商务休闲修身西装 男款职业正装结婚礼服 黑色斜纹 外', 0, NULL, '领般【新品】男士西服套装 ', 318, 'images/product/14.jpg', 1, '2013-01-01 00:00:00', 318, 1, 7);
INSERT INTO `t_product` VALUES (21, '货到付款Mr.TA 西服 2014新款男士礼服套 经典 黑色西装 英伦商务修身西服套装 黑', 0, NULL, '货到付款Mr.TA 西服 ', 468, 'images/product/15.jpg', 1, '2014-01-02 00:00:00', 468, 1, 7);
INSERT INTO `t_product` VALUES (25, '铜扣记蕾丝连衣裙中长款雪纺碎花2018夏季新款荷叶袖仙女裙沙滩裙', 0, NULL, '铜扣记蕾丝连衣裙中长款雪纺碎花2018夏季新款荷叶袖仙女裙沙滩裙', 1179, 'images/product/20180505041249.jpg', 1, '2014-01-01 00:00:00', 210, 1, 6);
INSERT INTO `t_product` VALUES (27, '2018夏装新款v领高腰雪纺连衣裙女中长款气质显瘦a字裙冷淡风裙子', 0, NULL, '2018夏装新款v领高腰雪纺连衣裙女中长款气质显瘦a字裙冷淡风裙子', 1139, 'images/product/20180505041444.jpg', 1, '2014-01-01 00:00:00', 58, 1, 6);
INSERT INTO `t_product` VALUES (40, '佳能（Canon） EOS 5D Mark III 单反机身', 0, NULL, '佳能（Canon） EOS 5D Mark III 单反机身', 22988, 'images/product/21.jpg', 1, '2014-01-01 00:00:00', 123, 2, 9);
INSERT INTO `t_product` VALUES (41, '尼康（Nikon） D3300 单反套机（AF-S DX 18-55mm f/3.5-5.6G VRII尼克尔镜头）', 0, NULL, '尼康（Nikon） D3300 单反套机', 6389, 'images/product/22.jpg', 1, '2014-01-01 00:00:00', 123, 2, 9);
INSERT INTO `t_product` VALUES (43, '佳能（Canon） EOS 700D 单反机身', 0, NULL, '佳能（Canon） EOS 700D 单反机身', 3199, 'images/product/24.jpg', 0, NULL, 485, 2, 9);
INSERT INTO `t_product` VALUES (44, '佳能（Canon） 1200D 双镜头套装', 0, NULL, '佳能（Canon） 1200D 双镜头套装', 8999, 'images/product/25.jpg', 0, NULL, 875, 2, 9);
INSERT INTO `t_product` VALUES (47, '尼康（Nikon） D3100 单反套机（AF-S DX 18-55mm f/3.5-5.6G VR尼克尔镜头）', 0, NULL, '尼康（Nikon） D3100 单反套机', 5299, 'images/product/28.jpg', 0, NULL, 641, 2, 9);
INSERT INTO `t_product` VALUES (49, '漫步者（EDIFIER） R101V 2.1声道多媒体音箱 黑色', 0, NULL, '漫步者R101V 2.1声道多媒体音箱 黑色', 119, 'images/product/30.jpg', 0, NULL, 465, 2, 29);
INSERT INTO `t_product` VALUES (51, '魅动e族MD-5110音箱 音响 蓝牙音箱 蓝牙音响 无线音箱 低音炮 NFC配对 黑色', 0, NULL, '魅动e族MD-5110音箱 音响 蓝牙音箱', 149, 'images/product/32.jpg', 0, NULL, 456, 2, 29);
INSERT INTO `t_product` VALUES (53, '哈曼卡顿harmankardon SoundSticks III 3代 水晶 音箱', 0, NULL, '哈曼卡顿 III 3代 水晶 音箱', 1098, 'images/product/34.jpg', 0, NULL, 331, 2, 29);
INSERT INTO `t_product` VALUES (56, '漫步者（EDIFIER） R10U 2.0声道 多媒体音箱 黑色', 0, NULL, '漫步者 R10U 2.0声道 多媒体音箱 黑色', 65, 'images/product/37.jpg', 0, NULL, 789, 2, 29);
INSERT INTO `t_product` VALUES (57, 'dostyle SD306重低音2.1电脑音箱低音炮音响子夜黑', 0, NULL, 'dostyle SD306重低音2.1电脑音箱低音炮音响', 239, 'images/product/38.jpg', 0, NULL, 4156, 2, 29);
INSERT INTO `t_product` VALUES (60, '麦博（microlab） M100(10) 多媒体有源音响 黑色', 0, NULL, '麦博 M100(10) 多媒体有源音响 黑色', 99, 'images/product/41.jpg', 0, NULL, 66, 2, 29);
INSERT INTO `t_product` VALUES (63, 'JBL ONBEATVENLTWHTCN 城市节拍 音乐底座/音箱 全新闪电接口 内置蓝牙 白色', 0, NULL, 'JBL  城市节拍 音乐底座/音箱 全新闪电接口', 998, 'images/product/44.jpg', 0, NULL, 651, 2, 29);
INSERT INTO `t_product` VALUES (68, '飞利浦（PHILIPS）DC295/93 iphone5/ipad4/mini/ipod 专用苹果充电底座音响 银', 0, NULL, '飞利浦 DC295 iphone5/ipad4/mini/ipod 专用', 799, 'images/product/49.jpg', 0, NULL, 6245, 2, 29);
INSERT INTO `t_product` VALUES (70, '苹果（Apple）iPod touch 4代 16G ME179CH/A 多媒体播放器 白色', 0, NULL, '苹果（Apple）iPod 16G 多媒体播放器 白色', 898, 'images/product/50.jpg', 0, NULL, 1154, 2, 30);
INSERT INTO `t_product` VALUES (72, '索尼（SONY） NWZ-B172F 2G MP3 播放器 黑色', 0, NULL, '索尼（SONY） NWZ-B172F 2G MP3 播放器 黑色', 239, 'images/product/52.jpg', 0, NULL, 675, 2, 30);
INSERT INTO `t_product` VALUES (73, '苹果（APPLE）MD773CH/A IPOD SHUFFLE 2GB/ PINK粉色', 0, NULL, '苹果（APPLE）MD773CH/A IPOD 2GB/ PINK粉色', 328, 'images/product/53.jpg', 0, NULL, 12, 2, 30);
INSERT INTO `t_product` VALUES (77, '苹果（Apple） iPod Nano 7代 16G MD477CH/A 多媒体播放器 蓝色', 0, NULL, '苹果（Apple） Nano 7代 16G 多媒体播放器', 998, 'images/product/57.jpg', 0, NULL, 123, 2, 30);
INSERT INTO `t_product` VALUES (78, '飞利浦（PHILIPS） SA2SPK04SFZ/93 MP3 播放器 4G 银色', 0, NULL, '飞利浦 SA2SPK04SFZ/93 MP3 播放器 4G 银色', 279, 'images/product/58.jpg', 0, NULL, 456, 2, 30);
INSERT INTO `t_product` VALUES (79, '苹果（APPLE）MD777CH/A IPOD SHUFFLE 2GB/PURPLE 紫色', 0, NULL, '苹果（APPLE）MD777CH/A IPOD 2GB/PURPLE 紫色', 328, 'images/product/59.jpg', 0, NULL, 456, 2, 30);
INSERT INTO `t_product` VALUES (80, '索尼（ SONY）NWZ-B172F MP3 纯白', 0, NULL, '索尼（ SONY）NWZ-B172F MP3 纯白', 239, 'images/product/60.jpg', 0, NULL, 54, 2, 30);
INSERT INTO `t_product` VALUES (83, '昂达（onda） VX330 双无损音乐格式+超便携纯音乐夹子+4G MP3 黑色', 0, NULL, '昂达 VX330 双无损音乐格式+超便携纯音乐夹', 99, 'images/product/63.jpg', 0, NULL, 62, 2, 30);
INSERT INTO `t_product` VALUES (84, '苹果（Apple） iPod Nano 7代 16GB ME971CH/A 多媒体播放器 深空灰色', 0, NULL, '苹果（Apple）iPod 7代 16GB 多媒体播放器', 998, 'images/product/64.jpg', 0, NULL, 89, 2, 30);
INSERT INTO `t_product` VALUES (87, '澳大利亚 进口牛奶 德运（Devondale）全脂牛奶礼盒装 1L*6', 0, NULL, '澳大利亚  德运 全脂牛奶礼盒装 1L*6', 99, 'images/product/67.jpg', 0, NULL, 66, 3, 31);
INSERT INTO `t_product` VALUES (88, '德国 进口牛奶 德亚（Deyatur）全脂牛奶200ml*30盒', 0, NULL, '德国 德亚 全脂牛奶200ml*30盒', 129, 'images/product/68.jpg', 0, NULL, 199, 3, 31);
INSERT INTO `t_product` VALUES (91, '丹麦进口 Kjeldsens 蓝罐 曲奇 礼盒 454g 盒装', 0, NULL, '丹麦进口  蓝罐 曲奇 礼盒 454g 盒装', 58, 'images/product/71.jpg', 0, NULL, 145, 3, 31);
INSERT INTO `t_product` VALUES (92, '中国 台湾 蜜兰诺 松塔 12粒装 192克（新老包装随机发送） 盒装', 0, NULL, '蜜兰诺 松塔 12粒装 192克', 17, 'images/product/72.jpg', 0, NULL, 451, 3, 31);
INSERT INTO `t_product` VALUES (94, '丹麦进口 美人鱼（Mermaid） 黄油 曲奇 454g', 0, NULL, '丹麦进口 美人鱼（Mermaid） 黄油 曲奇 454g', 31, 'images/product/74.jpg', 0, NULL, 415, 3, 31);
INSERT INTO `t_product` VALUES (96, '意大利进口FerreroRocher费列罗榛果威化巧克力16粒装200g', 0, NULL, '意大利进口费列罗榛果威化巧克力16粒装200g', 35, 'images/product/76.jpg', 0, NULL, 4142, 3, 31);
INSERT INTO `t_product` VALUES (97, '意大利进口FerreroRocher费列罗榛果威化巧克力32粒钻石装400g', 0, NULL, '意大利进口费列罗榛果威化巧克力32粒钻石400g', 77, 'images/product/77.jpg', 0, NULL, 547, 3, 31);
INSERT INTO `t_product` VALUES (98, '进口食品 非国内分装 费列罗榛果威化金莎巧克力T48粒钻石装礼盒600g', 0, NULL, '费列罗榛果威化金莎巧克力T48粒钻石装礼盒600g', 125, 'images/product/78.jpg', 0, NULL, 265, 3, 31);
INSERT INTO `t_product` VALUES (99, '新疆特产 一品玉和田大枣四星450g*3袋', 0, NULL, '新疆特产 一品玉和田大枣四星450g*3袋', 75, 'images/product/79.jpg', 0, NULL, 25, 3, 32);
INSERT INTO `t_product` VALUES (103, '稻香村京八件糕点礼盒 北京礼物1200g 北京特产', 0, NULL, '稻香村京八件糕点礼盒 北京礼物1200g 北京特产', 78, 'images/product/83.jpg', 0, NULL, 85, 3, 32);
INSERT INTO `t_product` VALUES (108, '冠云 中华老字号 山西特产 平遥牛肉家庭装(200gX3袋)600g', 0, NULL, '中华老字号 平遥牛肉家庭装(200gX3袋)600g', 88, 'images/product/88.jpg', 0, NULL, 65, 3, 32);
INSERT INTO `t_product` VALUES (109, '冠云 中华老字号 山西特产 平遥牛肉礼盒(158gX6袋)948g', 0, NULL, '中华老字号 平遥牛肉礼盒(158gX6袋)948g', 152, 'images/product/89.jpg', 0, NULL, 654, 3, 32);
INSERT INTO `t_product` VALUES (110, '山西特产 维之王山楂片268g*2袋', 0, NULL, '山西特产 维之王山楂片268g*2袋', 32, 'images/product/90.jpg', 0, NULL, 214, 3, 32);
INSERT INTO `t_product` VALUES (111, '武汉特产 周黑鸭鸭脖210g', 0, NULL, '武汉特产 周黑鸭鸭脖210g', 26, 'images/product/91.jpg', 0, NULL, 55, 3, 32);
INSERT INTO `t_product` VALUES (113, '武汉特产 周黑鸭锁骨300g', 0, NULL, '武汉特产 周黑鸭锁骨300g', 28, 'images/product/93.jpg', 0, NULL, 6211, 3, 33);
INSERT INTO `t_product` VALUES (114, '重庆特产 有友泡凤爪山椒味100g*5袋', 0, NULL, '重庆特产 有友泡凤爪山椒味100g*5袋', 22, 'images/product/94.jpg', 0, NULL, 445, 3, 33);
INSERT INTO `t_product` VALUES (115, '百草味靖江猪肉脯200g×2袋装靖江特产蜜汁精致猪肉干', 0, NULL, '百草味靖江猪肉脯200g×2袋装', 39, 'images/product/95.jpg', 0, NULL, 123, 3, 33);
INSERT INTO `t_product` VALUES (116, '食塘薄皮核桃1000g', 0, NULL, '食塘薄皮核桃1000g', 53, 'images/product/96.jpg', 0, NULL, 415, 3, 33);
INSERT INTO `t_product` VALUES (118, '加9.9元抢海鲜/蛋黄锅巴', 0, NULL, '飘零大叔猪肉脯1斤靖江特产肉干肉脯大礼包500g休闲食品零食小吃', 29, 'images/product/20180505044948.jpg', 0, NULL, 200, 3, 33);
INSERT INTO `t_product` VALUES (119, '楼兰蜜语 新疆纯野生无漂白 薄皮核桃500gx2包 新包装送夹子', 0, NULL, '楼兰蜜语 新疆薄皮核桃500gx2包', 50, 'images/product/99.jpg', 0, NULL, 1341, 3, 33);
INSERT INTO `t_product` VALUES (121, '【包邮】友臣金丝肉松饼整箱2.5kg 约70个 休闲零食品', 0, NULL, '【包邮】友臣金丝肉松饼整箱2.5kg 约70个', 67, 'images/product/101.jpg', 0, NULL, 4141, 3, 33);
INSERT INTO `t_product` VALUES (126, '海尔模卡（MOOKA） 48A5 48英寸 窄边框安卓智能电视', 0, NULL, '海尔模卡（MOOKA）48英寸 窄边框安卓智能电视', 3999, 'images/product/106.jpg', 0, NULL, 123, 4, 34);
INSERT INTO `t_product` VALUES (128, '飞利浦（PHILIPS） 50PFL3040/T3 50英寸 全高清LED液晶电视(黑色）', 0, NULL, '飞利浦 50PFL3040/T3 50英寸 全高清LED液晶', 1298, 'images/product/108.jpg', 0, NULL, 123, 4, 34);
INSERT INTO `t_product` VALUES (129, '夏普（SHARP）LCD-40DS20A 40英寸日本原装面板', 0, NULL, '夏普 40英寸日本原装面板', 3699, 'images/product/109.jpg', 0, NULL, 11, 4, 34);
INSERT INTO `t_product` VALUES (132, '康佳（KONKA） LED32E330C 32英寸 高清窄边LED（银色）', 0, NULL, '康佳 LED32E330C 32英寸 高清窄边LED（银色）', 1298, 'images/product/112.jpg', 0, NULL, 654, 4, 34);
INSERT INTO `t_product` VALUES (134, '乐视TV 超级电视（Letv） S50 50英寸 3D 智能LED液晶电视 黑色', 0, NULL, '乐视TV 超级电视（Letv） S50 50英寸 3D', 2799, 'images/product/114.jpg', 0, NULL, 134, 4, 34);
INSERT INTO `t_product` VALUES (135, '高清屏 海量片源\r\n承诺送货入户，未履约赔付10000积分', 0, NULL, 'Xiaomi/小米 小米电视4A 32英寸智能高清网络平板家用电视机40', 899, 'images/product/20180505044254.jpg', 0, NULL, 76, 4, 34);
INSERT INTO `t_product` VALUES (137, '海信（Hisense）LED50EC310JD 50英寸全网Vision 智能电视（黑色）', 0, NULL, '海信 LED50EC310JD 50英寸全网Vision ', 1298, 'images/product/117.jpg', 0, NULL, 45, 4, 34);
INSERT INTO `t_product` VALUES (142, '风干洁桶 蓝光杀菌 顺丰快递', 0, NULL, '喜力（家电）XQB72-2688 全自动洗衣机小型迷你家用7.2公斤宿舍', 608, 'images/product/121.jpg', 0, NULL, 189, 4, 35);
INSERT INTO `t_product` VALUES (289, '2018春装新款女装潮温柔沙滩裙子收腰碎花雪纺连衣裙夏超仙女长裙', 0, NULL, '2018春装新款女装潮温柔沙滩裙子收腰碎花雪纺连衣裙夏超仙女长裙', 279, 'images/product/20180505042552.jpg', 0, NULL, 99, 1, 6);
INSERT INTO `t_product` VALUES (291, 'Vero Moda透视拼接修身包边圆领蕾', 1, '2014-11-23 00:00:00', 'Vero Moda透视拼接修身包边圆领蕾', 499, 'images/product/2.jpg', 1, '2014-11-23 00:00:00', 98, 1, 6);
INSERT INTO `t_product` VALUES (294, '连衣裙2018春夏新款女装韩版时尚碎花雪纺长裙宽松显瘦露肩吊带裙', 1, '2014-11-23 00:00:00', '连衣裙2018春夏新款女装韩版时尚碎花雪纺长裙宽松显瘦露肩吊带裙', 178, 'images/product/20180505041922.jpg', 1, '2014-11-23 00:00:00', 129, 1, 6);

-- ----------------------------
-- Table structure for t_smalltype
-- ----------------------------
DROP TABLE IF EXISTS `t_smalltype`;
CREATE TABLE `t_smalltype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bigTypeId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_a9rcrieyoywpcgb1luxsbir8s`(`bigTypeId`) USING BTREE,
  CONSTRAINT `FK_a9rcrieyoywpcgb1luxsbir8s` FOREIGN KEY (`bigTypeId`) REFERENCES `t_bigtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_smalltype
-- ----------------------------
INSERT INTO `t_smalltype` VALUES (6, '连衣裙', '1', 1);
INSERT INTO `t_smalltype` VALUES (7, '男士西装', NULL, 1);
INSERT INTO `t_smalltype` VALUES (8, '牛仔裤', NULL, 1);
INSERT INTO `t_smalltype` VALUES (9, '相机', NULL, 2);
INSERT INTO `t_smalltype` VALUES (29, '音箱', NULL, 2);
INSERT INTO `t_smalltype` VALUES (30, 'MP3/MP4', NULL, 2);
INSERT INTO `t_smalltype` VALUES (31, '进口食品', NULL, 3);
INSERT INTO `t_smalltype` VALUES (32, '地方特产', NULL, 3);
INSERT INTO `t_smalltype` VALUES (33, '休闲食品', NULL, 3);
INSERT INTO `t_smalltype` VALUES (34, '平板电视', NULL, 4);
INSERT INTO `t_smalltype` VALUES (35, '洗衣机', NULL, 4);
INSERT INTO `t_smalltype` VALUES (36, '冰箱', NULL, 4);
INSERT INTO `t_smalltype` VALUES (38, '牛轧饼干', '', 3);

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (1, '音乐', 'http://www.java1234.com');
INSERT INTO `t_tag` VALUES (2, '影视', 'http://www.baidu.com');
INSERT INTO `t_tag` VALUES (3, '少儿', NULL);
INSERT INTO `t_tag` VALUES (4, '运动鞋', NULL);
INSERT INTO `t_tag` VALUES (5, '美容护肤', NULL);
INSERT INTO `t_tag` VALUES (6, '家纺用品', NULL);
INSERT INTO `t_tag` VALUES (7, '婴幼奶粉', NULL);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `dentityCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `trueName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '云南丽江', '1976-09-04 00:00:00', '411522199407254576', 'admin@qq.com', '13523902576', '123', '男', 2, '王天', 'admin');
INSERT INTO `t_user` VALUES (2, '江苏南京', '1989-01-01 00:00:00', '734823947291869443', '123@qq.com', '33333333', '123', '女', 1, '小花', 'marry');
INSERT INTO `t_user` VALUES (3, '四川成都', '1996-08-05 00:00:00', '468493734373957957', '123@qq.com', '22222222', '123', '女', 1, '小丽', 'lily');
INSERT INTO `t_user` VALUES (4, '山东青岛', '1995-09-17 00:00:00', '346383954459591795', '456@123.com', '55555555', '1234', '女', 1, '张三', 'jack');
INSERT INTO `t_user` VALUES (5, '辽宁大连', '1994-09-14 00:00:00', '718597349517945954', 'abc@qq.com', '44444444', '123', '男', 1, '赵四', 'tom');
INSERT INTO `t_user` VALUES (6, '山东济南', '1993-08-31 00:00:00', '411522199407254576', '123@qq.com', '66666666', '123', '男', 1, '王二', 'jerry');
INSERT INTO `t_user` VALUES (7, '陕西西安', '2000-09-29 00:00:00', '321321343543545456', '123@qq.com', '11111111', '123', '男', 1, '小明', 'jack');
INSERT INTO `t_user` VALUES (9, '河南郑州', '1996-04-26 00:00:00', '132364873672384687', '143@qq.com', '23466783', '123', '女', 1, '小红', 'Helen');
INSERT INTO `t_user` VALUES (10, '山东日照', '1998-04-06 00:00:00', '123456778324347473', '13245@qq.com', '13231454', '1234', '女', 1, '小月', 'kathy');

SET FOREIGN_KEY_CHECKS = 1;
