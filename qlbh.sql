/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : qlbh

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-04-21 00:13:51
*/
/*
	sửa bảng users, oderdetail
    
*/



create database qlbh;
use qlbh;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `CatID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CatName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CatID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------
-- table NhaSanXuat
-- ------------------------
DROP TABLE IF EXISTS `NhaXuatBan`;
CREATE TABLE `NhaXuatBan` (
  `NXBID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NXBName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`NXBID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
-- ---------------------
-- insert du lieu Nha San Xuat
-- ---------------------
insert into `NhaXuatBan` values ('1','NXB Kim Đồng');
insert into `NhaXuatBan` values ('2','NXB Trẻ');
insert into `NhaXuatBan` values ('3','NXB HCM');
insert into `NhaXuatBan` values ('4','NXB Hà Nội');
insert into `NhaXuatBan` values ('5','NXB NXB Đà Nẵng');
insert into `NhaXuatBan` values ('6','NXB Lao Động');
insert into `NhaXuatBan` values ('7','NXB Thanh Niên');
insert into `NhaXuatBan` values ('8','NXB Hoa Học Trò');
insert into `NhaXuatBan` values ('9','NXB Thiếu Nhi');
insert into `NhaXuatBan` values ('10','NXB Khác');

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'Văn Học');
INSERT INTO `categories` VALUES ('2', 'Ngôn Tình');
INSERT INTO `categories` VALUES ('3', 'Tiểu Thuyết');
INSERT INTO `categories` VALUES ('4', 'Giáo Khoa');
INSERT INTO `categories` VALUES ('5', 'Nước Ngoài');
INSERT INTO `categories` VALUES ('6', 'Truyện Cười');
INSERT INTO `categories` VALUES ('7', 'Khác');

-- ----------------------------
-- Table structure for `orderdetails`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
   `f_ID` int(11) not null,
  `ProID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `Amount` int(11) NOT NULL,
  `DatePay` date,
  `Status` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `OrderID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime NOT NULL,
  `UserID` int(11) NOT NULL,
  `Total` bigint(20) NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `ProID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ProName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TinyDes` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `FullDes` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `CatID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `NXBID` int(11) NOT NULL,
  `DateDangTai` date,
  `SoLuongDaBan` int(11),
  `SoLuotXem` int(11),
  PRIMARY KEY (`ProID`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'CHỉ Cần Ta Yêu Nhau','Văn Học Trẻ', '<UL>\r\n    <LI>Tác giả: Văn học trẻ </LI>\r\n    <LI>Nhà xuất bản: Nxb văn học</LI>\r\n    <LI>Nhà phát hành: Người Trẻ Việt</LI>\r\n    <LI>Chỉ Cần Ta Yêu Nhau là tuyển tập mới nhất đến từ nhóm bút Văn học Trẻ. Một cuốn sách cho bạn điểm tựa bình yên trong những ngày tuổi trẻ chênh vênh.“Giữa thành phố 8 triệu người, chúng ta luôn cố gắng kiếm tìm cho mình một người bạn, một người để yêu, hoặc nhiều hơn thế... và luôn mong sẽ tìm ra, vì tin rằng ai rồi cũng sẽ có một điểm tựa</LI>\r\n    \r\n</UL>', '150000', '1', '83','2','2015-12-25','3','5');
INSERT INTO `products` VALUES ('2', 'NHững Ngày Ấu Thơ', 'Nguyên Hồng', '<UL>\r\n    <LI>Tác giả: Nguyên Hồng </LI> <LI>Nhà xuất bản: Nxb văn học</LI><LI>Nhà phát hành: NXB Văn Học </LI><LI>"Những ngày thơ ấu" là những lời tâm sự tha thiết, thầm kín, những hồi ức của một cái "tôi" đau khổ tự trình bày cuộc đời riêng của mình lên trang giấy một cách chân thành, tin cậy (trước đó, trong văn học nước ta chưa nhiều những hồi ký như những hồi ký như thế). Trong tập hồi ký rất xúc động này, Nguyên Hồng đã lắng nghe được những âm vang sâu lắng của tâm hồn, ghi nhận được những cảm giác tinh tế bên trong và diễn tả chúng qua những cái nhìn hồn nhiên, tươi sáng của tuổi thơ, khiến cho ta có cảm tưởng thú vị như được đưa trở về "thời thơ ấu của nhân loại". </LI>\r\n</UL>\r\n', '300000', '1', '64','2','2017-12-25','3','5');
INSERT INTO `products` VALUES ('3', 'Sếu Đầu Mùa', 'Chinghiz Aitmatov', '<UL>\r\n    <LI>Tác giả: Chinghiz Aitmatov </LI>\r\n    <LI>Người dịch: Đào Minh Hiệp/LI>\r\n    <LI>Nhà xuất bản: Nxb văn học</LI>\r\n    <LI>Nhà phát hành: NXB Văn Học</LI> LI>Sếu Đầu Mùa là câu chuyện về một lứa học sinh chưa đến tuổi trưởng thành nhưng đã phải sớm từ giã mái trường thân yêu để thay cha anh đang ở ngoài mặt trận, bắt tay vào công việc lao động nặng nhọc làm ra lúa mì cung cấp cho tiền tuyến.</LI>\r\n\r\n</UL>\r\n', '160000', '1', '86','2','2016-11-25','17','25');
INSERT INTO `products` VALUES ('4', 'Cuộc Chiến Đi Qua', 'Kanta Ibragimov', '<UL>\r\n    <LI>Tác giả: Kanta Ibragimov</LI>\r\n    <LI>Người dịch: Đào Minh Hiệp </LI>\r\n    <LI>Nhà xuất bản: Nxb văn học</LI> <LI>Lịch sử vùng đất Bắc Kavkaz, kể từ khi chính quyền Xô viết được thành lập tại đây vào năm 1924 và tan vỡ hoàn toàn vào năm 1995, đã được tác giả Kanta Ibragimov tái hiện thông qua hình tượng nhân vật chính lấy từ nguyên mẫu cuộc đời đầy thăng trầm và sóng gió của ông nội tác giả, nhưng được thể hiện dưới góc nhìn mới, chân thực và khách quan hơn so với dòng văn học Xô viết trước đây. Tác phẩm có sức bao quát rộng lớn và thông qua đó, người đọc có thể cảm nhận một cách đầy đủ và chân xác về bản anh hùng ca cùng những tấn bi kịch tại Chechnya và các vùng đất khác nhau trên lãnh thổ rộng lớn của Liên bang Xô viết trước đây.</LI>\r\n \r\n</UL>\r\n', '42000', '1', '63','2','2018-6-25','27','52');
INSERT INTO `products` VALUES ('5', 'Kiếp Người', 'Hữu Ước ', '<UL>\r\n    <LI>Tác giả: Hữu Ước </LI>\r\n    <LI>Nhà xuất bản: Nxb văn học</LI>\r\n    <LI>Nhà phát hành: NXB Văn Học</LI>\r\n    <LI>Tiểu thuyết Kiếp Người khởi truyện bằng hình ảnh một người tù, với quần áo tù vo tròn cắp nách giữa những người bạn tù lơ láo lẫn ngơ ngác. Và một cái tát trời giáng “dạy làm người” của đại ca Thiếp dành cho nhân vật “hắn” khi được ra tù mà quên chào bạn tù đã gây sốc ngay từ những trang đầu. Dù bộ sách khá dày nhưng sức hút của nó có thể giữ chặt bạn đọc từ đầu đến cuối bởi tính thời sự của nó luôn nóng hổi. Nó báo động về sự tha hóa đạo đức, về “lợi ích nhóm” đâu đó giữa quan trường, về cách hành xử giữa những tập thể “có một nhúm người cũng chia bè kéo cánh”, thậm chí họp giao ban còn ngồi quay lưng với nhau, rình rập vài ba trưởng phó phòng để bắt lỗi và âm ỉ chờ đợi thời cơ để loại trừ. Cuốn tiểu thuyết lắng đọng thân phận con người, số kiếp con người. Phải, trái cứ đan xen, lơ lửng, va đụng vào nhau.</LI>\r\n    <LI>Streaming video &amp; âm thanh với RealOne Player (hỗ trợ các dạng thức MP3/AAC).</LI>\r\n</UL>\r\n', '2900000', '1', '0','2','2018-3-25','34','55');
INSERT INTO `products` VALUES ('6', 'Vết Thương Hoa', 'Nguyễn Văn Hồng', '<UL>\r\n    <LI>Tác giả: Nguyễn Văn Học </LI>\r\n    <LI>Nhà xuất bản: Nxb Hà Nội</LI>\r\n <LI>Nhà phát hành: Limbooks</LI>\r\n <LI>Tiểu thuyết “Vết thương hoa hồng” độc giả không chỉ được chìm trong những câu văn đẹp về con người và phong cảnh miền quê Việt Nam mà còn bị ám ảnh bởi những lớp nghĩa ẩn mà tác giả muốn truyền tải. “Vết thương hoa hồng” là tác phẩm chạm được vào những vấn đề đang nhức nhối của những miền quê đang đứng trước sự thay đổi diện mạo từng ngày. Qua lăng kính của tác giả bất kỳ ai cũng sẽ thấy những thân phận và các vấn đề mới của nông thôn được miêu tả hết sức uyển chuyển và đau đớn.</LI>\r\n</UL>\r\n', '18000', '1', '62','4','2018-3-25','9','25');
INSERT INTO `products` VALUES ('7', 'Giấc Mộng Xuân Trong Ngõ Lồ Hô', 'Diệp Thạch Đào', '<UL>\r\n    <LI>Tác giả: Diệp Thạch Đào</LI>\r\n    <LI>Người dịch: Nhiều dịch giả </LI>\r\n    <LI>Nhà xuất bản: Nxb văn học</LI>\r\n    <LI>Nhà phát hành: NXB Văn Học</LI>\r\n    <LI>Giấc Mộng Xuân Trong Ngõ Hồ Lô là tập sách gồm tám truyện ngắn được ông viết trong ba giai đoạn sáng tác: thời trẻ, tuổi trung niên và những năm cuối đời. Đó là các tác phẩm: Thánh mẫu tháng ba, Lễ tế thánh mẫu trên trời được ra mắt bạn đọc Đài Loan vào năm 1949; các tác phẩm Chiếc vòng cổ hoa hồng, Dòng họ kiếm ăn, Giấc mộng xuân trong ngõ Hồ Lô được sáng tác từ năm 1966 đến năm 1968 và các tác phẩm Hậu duệ cuối cùng của tộc Chiraya, Hoa lay ơn và bột mỳ, Không hẹn mà gặp được viết trong những năm từ 1989 đến 1993. Đây là những tác phẩm tiêu biểu nhất của nhà văn Diệp Thạch Đào - một nhà văn quan trọng hàng đầu, mở đường và được mệnh danh là người thắp sáng cho văn học Đài Loan</LI>\r\n    </UL>\r\n', '280000', '1', '15','1','2017-12-23','13','15');
INSERT INTO `products` VALUES ('8', 'Người Cá', 'Alexander Romanovich ', '<UL>\r\n    <LI>Tác giả: Alexander Romanovich Belyaev </LI>\r\n    <LI>Người dịch: Đỗ Ca Sơn </LI>\r\n    <LI>Nhà xuất bản: Nxb văn học</LI>\r\n  <LI>Người Cá là câu chuyện kể về một chàng trai được mệnh danh “quỷ biển” là sản phẩm khoa học của một vị giáo sư tận tâm, tốt bụng. Chàng trai luôn ẩn thân, tránh cái nhìn tò mò của con người mà cứu vớt những động vật yếu đuối ngoài đại dương, bị mắc nạn và bị đe dọa bởi con người. Nhưng cuối cùng, sự hiện diện của cậu cũng bị phát hiện. Những kẻ xấu chỉ nghĩ làm sao để trục lợi, bắt cậu phải mò ngọc trai cho chúng. Từ đây, tấm bi kịch của cậu và vị giáo sư kia thực sự bắt đầu.</LI>\r\n</UL>\r\n', '270000', '1', '74','1','2017-12-23','13','35');
INSERT INTO `products` VALUES ('9', 'Bồng Bềnh Như Có Thể', 'Mai Lâm', '<UL>\r\n    <LI>Tác giả: Mai Lâm </LI>\r\n    <LI>Nhà xuất bản: Nxb văn học</LI>\r\n    <LI>Nhà phát hành: NXB Văn Học</LI>\r\n    <LI>Bồng Bềnh Như Có Thể là tập thứ 4 trong bộ tản văn “Từ Xa Hà Nội” của nhạc sĩ Mai Lâm, một Việt kiều từ Cộng hòa Liên bang Đức viết về Hà Nội. Đúng như tác giả tâm niệm: "Nếu được sống ở Hà Nội có lẽ tôi đã không viết gì. Bởi tôi thích sống hơn là viết về cuộc sống"; ông có lẽ chỉ sống hồn nhiên qua bao nhiêu năm tháng, để những kỷ niệm ngấm vào máu, cho đến một ngày xa Hà Nội định cư tại Đức, với bao nhớ thương và luyến tiếc, ông không thể không viết về nó. Hà Nội trong tản văn của Mai Lâm là những kỷ niệm khó quên về bà, về mẹ, về tuổi thơ, phố phường thanh lịch, với những niềm vui bé nhỏ, nồng nàn</LI>\r\n    </UL>\r\n', '240000', '1', '43','1','2017-12-23','56','115');
INSERT INTO `products` VALUES ('10', 'Dòng Sông Chết', 'Thiên Sơn', '<UL>\r\n    <LI>Tác giả: Thiên Sơn </LI>\r\n    <LI>Nhà xuất bản: Nxb văn học</LI>\r\n    <LI>Nhà phát hành: NXB Văn Học.</LI>\r\n   <LI>Tất cả là một cuộc độc thoại dài. Trong một cảm giác cô đơn vây tỏa, không thể chia sẻ cùng ai, nhân vật chính tự nói với mình, tự kể lại những gì mình trải nghiệm, đã suy nghĩ. Một giọng điệu trữ tình, xuyên suốt quán xuyến từ đầu đến cuối cuốn sách như một dòng sông miên man không ngừng chảy. Những điều sâu thẳm, những huyền bí của nội tâm được tái hiện.</LI>\r\n</UL>\r\n', '280000', '1', '80','1','2018-5-23','13','67');
INSERT INTO `products` VALUES ('11', 'Bạn Đánh Giá Bao Nhiêu', 'Vãn Tình', '<UL>\r\n    <LI>Tác giả: Vãn Tình </LI>\r\n    <LI>Người dịch: Mỹ Linh </LI>\r\n    <LI>Nhà xuất bản: Nxb HCM</LI>\r\n    <LI>Câu trả lời này do chính bạn quyết định, chính bạn “định giá”.Hơn bốn mươi câu chuyện trong sách xoay quanh các chủ đề tình yêu, hôn nhân, gia đình, sự nghiệp… đến từ chính cuộc sống của tác giả và những người xung quanh, vừa thực tế lại vừa gợi mở, dễ dàng giúp chúng ta liên hệ với tình huống của chính mình. Với những câu chuyện đó, Vãn Tình hi vọng có thể giúp các cô gái thoát khỏi tình cảnh khó khăn, tìm lại bản ngã, sống cuộc đời theo cách mà mình mong muốn.</LI>\r\n    </UL>\r\n', '25000', '2', '88','2','2018-4-23','43','68');
INSERT INTO `products` VALUES ('12', '5 Ngôn Ngữ Tình Yêu', ' Ross Campbel', '<UL>\r\n    <LI>Tác giả: Ross Campbell, M.D, Gary Chapman </LI>\r\n    <LI>Người dịch: Hoàng Yến </LI>\r\n    <LI>Nhà xuất bản: Nxb Tổng hợp TP.HCM</LI>\r\n    <LI>Nhà phát hành: Trí Việt</LI>\r\n <LI>Cuốn sách là cẩm nang hữu ích và cần thiết để các bậc cha mẹ xây dựng mối quan hệ gần gũi, thấu hiểu và yêu thương đối với con cái lứa tuổi vị thành niên. Hiện nay, việc giáo dục trẻ ở lứa tuổi này rắc rối và phức tạp khiến các bậc phụ huynh cảm thấy gặp khó khăn và dường như không hiểu con mình; nhưng chính lúc này đây vai trò của họ lại trở nên quan trọng hơn bao giờ hết. Các nghiên cứu về trẻ vị thành niên đều cho thấy các bậc cha mẹ chính là người có ảnh hưởng lớn nhất đến cuộc đời trẻ. Chỉ khi họ từ chối vai trò đó thì trẻ mới tìm kiếm chúng ở bạn bè đồng lứa hay ở những người trưởng thành khác.</LI>\r\n</UL>\r\n', '120000', '2', '61','3','2018-5-23','100','345');
INSERT INTO `products` VALUES ('13', 'Từ Điển Pháp Việt', 'Viện NGôn Ngũ Học', '\r\n<UL>\r\n    <LI>Tác giả: Viện Ngôn Ngữ Học.</LI>\r\n    <LI>Nhà xuất bản: Nxb Từ điển Bách khoa.</LI>\r\n    <LI>Nhà phát hành: Khang Việt</LI>\r\n    <LI>Từ Điển Pháp Việt gồm những từ Tiếng Pháp được dịch nghĩa sang Tiếng Việt giúp cho các bạn có thể tra cứu cũng như tham khảo. Giúp cho bạn tự tin trong giao tiếp với người Pháp.</LI>\r\n    </UL>\r\n', '260000', '4', '92','10','2018-1-23','101','234');
INSERT INTO `products` VALUES ('14', 'Danh Ngôn Tình yêu Tình Bạn', 'Việt Hùng', '<UL>\r\n    <LI>Tác giả: Việt Hùng </LI>\r\n    <LI>Nhà xuất bản: Nxb HCM</LI>\r\n    <LI>Nhà phát hành: Minh Thắng</LI>\r\n    <LI>Tình yêu - tình bạn là đề tài muôn thuở của thi ca. Từ ngàn xưa đến nay có rất nhiều sách vở viết về tình yêu - tình bạn, và nó là đề tài muôn thuở không bao giờ dứt. Cuốn sách này tập hợp những câu danh ngôn viết về tình yêu - tình bạn đã được thử nghiệm cùng thời gian, sống cùng thời gian. </LI>\r\n    </UL>\r\n', '120000', '2', '0','3','2018-5-23','13','78');
INSERT INTO `products` VALUES ('15', 'NGôn Ngữ Tình Yêu Hàn Quốc', 'Trần Nhật', '<UL>\r\n    <LI>Tác Giả: Trần Nhật</LI>\r\n    <LI>Nhà xuất bản: NXB Thời Đại</LI>\r\n    <LI>Nhà phát hành: Nhân Văn</LI>\r\n   <LI> Cuốn sách này sẽ hướng dẫn cách nói tiếng Hàn thông thường hằng ngày mà bạn không thể học được ở bất cứ các khóa học nàoBạn sẽ được trang bị những câu nói rất thông dụng được sử dụng trong cuộc sống hằng ngày ở Hàn Quốc</LI>\r\n</UL>\r\n', '192000', '2', '22','10','2018-5-23','13','35');
INSERT INTO `products` VALUES ('16', 'Tiếng Anh Trong ngôn ngữ Tình yêu', 'Bảo Trân', '<UL>\r\n    <LI>Nhà xuất bản: Nxb Thành phố Hồ Chí Minh</LI>\r\n    <LI>Nhà phát hành: Minh Tâm</LI>\r\n    <LI>Cuốn sách này gồm những nội dung chính sau:Những mẫu câu về chủ đề tình yêuNhững bài đối thoại về chủ đề tình yêuNhững câu văn thấm đượm yêu thương trong các bức thư tìnhNhững bức thư tình điển hìnhNhững bài thơ tình cổ điển</LI>\r\n     </UL>\r\n', '320000', '5', '81','3','2018-5-23','13','27');
INSERT INTO `products` VALUES ('17', 'Làm Chủ Kiến Thức Ngữ Văn 9 Luyện Thi Vào 10', 'Phạm Trung Tình', '<UL>\r\n    <LI>Tác giả: Phạm Trung Tình </LI>\r\n    <LI>Nhà xuất bản: Nxb Đại học Quốc gia Hà Nội</LI>\r\n    <LI>Nhà phát hành: Mcbooks</LI>\r\n   <LI>Cuốn sách sau đây tổng hợp dàn ý phân tích các tác phẩm văn học trong chương trình Ngữ văn lớp 9 giúp các bạn ôn thi vào lớp 10 đạt kết quả cao. Đây là tài liệu tham khảo hữu ích cho các giáo viên giảng dạy Ngữ văn 9. </LI>\r\n</UL>\r\n', '182000', '1', '33','4','2017-5-13','21','64');
INSERT INTO `products` VALUES ('18', 'Danh Ngôn Tình Yêu Và Cuộc Sống', ' Ngọc Hà ', '<UL>\r\n    <LI>Tác giả: Ngọc Hà</LI>\r\n    <LI>Nhà xuất bản: Nxb Văn hóa Thông tin</LI>\r\n    <LI>Nhà phát hành: Huy Hoàng</LI>\r\n    <LI>“Còn gì trong cuộc sống có thể tươi đẹp hơn hình ảnh một chàng trai và cô gái, tay nắm chặt tay với trái tim trong sáng và tràn ngập tình yêu cùng đi làm lễ cưới? Còn gì trong cuộc sống đẹp hơn tình yêu của tuổi trẻ?”. Và câu trả lời: “Vẫn còn một thứ, đó là hình ảnh đôi vợ chồng già khi họ sắp kết thúc cuộc hành trình của sự sống. Bàn tay của họ run rẩy lắm rồi nhưng vẫn nắm chặt, khuôn mặt họ in đầy vết nhăn nhưng vẫn rạng rỡ niềm yêu thương, trái tim già nua và mệt mỏi nhưng vẫn còn nghe thấy tiếng đập của tình yêu và ước mơ được dâng hiến. Đúng vậy, trên đời này vẫn còn một điều tốt đẹp hơn tình yêu tuổi trẻ. Đó là tình yêu tồn tại ngay cả khi tuổi trẻ đã bị thời gian lấy mất. Một tình yêu vĩnh hằng theo năm tháng và sẽ mãi mãi tồn tại theo nhịp đập của hai con tim yêu thương!” (Love Story)</LI>\r\n    </UL>\r\n', '300000', '2', '10','10','2017-5-13','21','62');
INSERT INTO `products` VALUES ('19', 'Ngôn Ngữ Tình Yêu', 'Hoàng Mai', '<UL>\r\n    <LI>Tác giả: Hoàng Mai (Biên Soạn) </LI>\r\n    <LI>Nhà xuất bản: Nxb Hà Nội</LI>\r\n    <LI>Nhà phát hành: Văn Chương</LI>\r\n   <LI>Vẻ đẹp thật sự không nằm trong dáng vẻ bên ngoài, mà ở bên trong trái tim. Chân giá trị không nằm trong những gì hữu hình mà nó tồn tại trong những cái vô hình. Tình thương yêu thật sự không nằm trong những việc đã làm, đã được biết đến, nó hiện hữu nơi những gì đã thực hiện trong thầm lặng...</LI>\r\n</UL>\r\n', '1820000', '2', '17','4','2017-5-13','21','44');
INSERT INTO `products` VALUES ('20', 'Combo Tiểu Thuyết Delirium', 'Lauren Oliver ', '<UL>\r\n    <LI>Tác giả: Lauren Oliver </LI>\r\n    <LI>Người dịch: Lộc Diệu Linh </LI>\r\n  <LI>Nhà xuất bản: NXB Thanh Niên</LI>\r\n <LI>Nhà phát hành: Đinh Tị</LI>\r\n <LI>Họ không hiểu rằng một khi tình yêu xâm nhập vào máu của bạn, bạn sẽ không bao giờ có thể thoát khỏi nó. Kể từ giây phút ấy, mọi thứ thay đổi. Các nhà khoa học đã tìm ra cách để tiêu diệt tình yêu, mọi người khi đến tuổi trưởng thành đều phải trải qua việc chữa trị. Các nhà khoa học sẽ thực hiện phẫu thuật não của họ để não không còn khả năng cảm nhận tình yêu nữa. Khi không còn tình yêu, con người sẽ không còn hung dữ, họ cư xử có chừng mực hơn, không để sự xúc động khiến họ mất kiểm soát.</LI>\r\n</UL>\r\n', '50000', '3', '0','7','2017-5-13','21','63');
INSERT INTO `products` VALUES ('21', 'Mùa Xuân Của Công Tử Bột', 'Phi Thiên Dạ Tường ', '<UL>\r\n    <LI>Tác giả: Phi Thiên Dạ Tường</LI>\r\n  <LI>Người dịch: Tiểu Lâm </LI>\r\n <LI>Nhà xuất bản: NXB Hồng Đức </LI>\r\n    <LI>Nhà phát hành: Amak </LI>\r\n   <LI>Nếu tạo hóa cho phép, có lẽ không ai trong chúng ta, đặc biệt là những người đã trưởng thành, mong muốn mình lớn lên. Bởi lẽ, trưởng thành là một quá trình vô cùng đau đớn. Dù muốn dù không, cũng sẽ có rất nhiều điều bắt buộc phải lựa chọn, nhưng ranh giới của những lựa chọn vốn dĩ mong manh làm sao và chỉ cần một quyết định sai lầm, định mệnh sẽ lập tức rẽ sang lối mới. Những con người đã đi lướt qua đời nhau, những năm tháng đã trôi qua vĩnh viễn không bao giờ quay trở lại. Kể cả Diêu Viễn, một đứa trẻ tưởng chừng như được số phận ưu ái, có cuộc sống khá giả, được người thân yêu thương, được bạn bè quý mến, là một chàng công tử bột đứng giữa trung tâm những phù phiếm phồn hoa, khi đi qua giai đoạn đất nước chuyển mình, thời cuộc thay đổi, cũng không tránh khỏi những hụt hẫng, chới với trên con đường bắt buộc phải trưởng thành.</LI>\r\n</UL>\r\n', '300000', '3', '74','10','2017-5-13','21','34');
INSERT INTO `products` VALUES ('22', 'Bộ Tiểu Thuyết Crossfire', ' Sylvia Day ', '<UL>\r\n    <LI>Tác giả: Sylvia Day </LI>\r\n    <LI>Người dịch: Vương Tú Huệ  </LI>\r\n    <LI>Nhà xuất bản: Nxb Trẻ</LI>\r\n  <LI>Nhà phát hành: NXB Trẻ</LI>\r\n <LI>Bộ tiểu thuyết CROSSFIRE gồm 3 tập: CHẠM MỞ – SOI CHIẾU – HÒA QUYỆN, thuộc thể loại tiểu thuyết tình cảm dành cho người trưởng thành</LI>\r\n    </UL>\r\n', '290000', '3', '30','2','2017-5-13','21','66');
INSERT INTO `products` VALUES ('23', 'Nửa Đêm Nằm Nhớ', ' Tiểu Quyên', '<UL>\r\n    <LI>Tác giả: Tiểu Quyên </LI>\r\n    <LI>Nhà xuất bản: Nxb Trẻ</LI>\r\n    <LI>Nhà phát hành: NXB Trẻ</LI>\r\n    <LI>Nửa đêm nằm nhớ là tập tản văn mới nhất của cây bút trẻ Tiểu Quyên. Với tập tản văn này, tác giả đã dẫn dắt người đọc đến một miền nhớ mênh mang về những ngày thơ ấu, quê nhà, những trò nghịch ngợm của trẻ con. Với giọng văn mượt mà, đầy cảm xúc, Tiểu Quyên đã thành công trong việc khơi lại những ký ức tuổi thơ trong trẻo đẹp đẽ của nhiều người.</LI>\r\n</UL>\r\n', '300000', '3', '5','2','2017-5-13','21','44');
INSERT INTO `products` VALUES ('24', 'Lịch Sử: Mai Hắc Đế - Vị Vua Da Đen', 'Tiểu Giàu', '<UL>\r\n    <LI>Tác giả: Tiểu Giàu</LI>\r\n    <LI>Nhà xuất bản: Nxb Đại Học Sư Phạm</LI>\r\n    <LI>Nhà phát hành: Nhân Văn</LI>\r\n     <LI>Quyển truyện Kể Chuyện Danh Nhân Lịch Sử: Mai Hắc Đế - Vị Vua Da Đen được biên soạn nhằm giúp các em hiểu thêm về vị vua Mai Hắc Đế và những cuộc đấu tranh chống lại nhà Đường. Câu chuyện trong sách mang đến những bài học về lịch sử nước Nam, cung cấp cho bé nguồn kiến thức một cách nhẹ nhàng và dễ nhớ. Sự anh minh của vị vua trong câu chuyện sẽ như những tấm gương sáng để các bé học hỏi và noi theo. Những hình minh họa sinh động, đầy màu sắc cùng với những câu chuyện thú vị trong mỗi bài học sẽ giúp các em có hứng thú hơn trong khi đọc. Đặc biệt, sách đã được mã hóa để sử dụng với bút thông minh, vua gia sư và các loại máy học tiếng Anh. Đây chắc chắn sẽ là những phương tiện hữu hiệu để cung cấp những kiến thức cho bé một cách nhanh và hiệu quả nhất.</LI>\r\n</UL>\r\n', '100000', '3', '22','10','2017-5-13','21','84');
INSERT INTO `products` VALUES ('25', 'Tin Vào Điều Em Muốn', 'Tiểu Châu ', '<UL>\r\n    <LI>Tác giả: Tiểu Châu </LI>\r\n    <LI>Nhà xuất bản: NXB Thanh Niên</LI>\r\n     <LI>Nhà phát hành: Đinh Tị</LI>\r\n      <LI>Đừng khóc, mình đã ở đây, mình đang nắm lấy tay cậu, đây là hiện thực, không phải giấc mơ đâu.- Đây không phải mơ phải không? - Cậu ấy hỏi lại tôi.- Ừ, không phải.- Cậu sẽ không buông tay mình chứ?Tôi gật đầu xác nhận, nước mắt cậu ...</LI>\r\n</UL>\r\n', '80000', '3', '52','10','2017-5-13','21','54');
INSERT INTO `products` VALUES ('26', 'Tôi Không Thể Viết Tiểu Thuyết', 'Nakamura Kou, Nakata Eiichi', '<UL>\r\n    <LI>Tác giả: Nakamura Kou, Nakata Eiichi</LI>\r\n    <LI>Người dịch: Mai Khanh </LI>\r\n    <LI>Nhà xuất bản: Nxb Hà Nội</LI>\r\n     <LI>Nhà phát hành: Nhã Nam</LI>\r\n    <LI>Mười bốn tuổi, cậu bé mọt sách Takahashi Kotaro đã bắt đầu dùng câu chữ để vẽ ra thế giới tưởng tượng của mình, với tình yêu dành cho gia đình là nguồn cảm hứng bất tận. Nhưng bí mật gia đình cậu bị phơi bày khiến cảm hứng tan biến, mọi thứ sụp đổ. Kotaro khao khát viết lại, nhưng không đủ dũng cảm để cầm bút.Những tưởng tình yêu viết lách đã chết đi trong lòng cậu, nhưng bước vào cấp ba, Kotaro bất ngờ gặp một người con gái, và niềm đam mê văn chương mà bấy lâu cậu chôn sâu tận đáy lòng phút chốc ùa về.</LI>\r\n</UL>\r\n', '80000', '3', '11','4','2017-5-13','21','69');
INSERT INTO `products` VALUES ('27', 'Cẩm Nang Học Tập Và Làm Việc Ở Nước Ngoài', 'Chu Đình Tới', '<UL>\r\n    <LI>Tác giả: Chu Đình Tới</LI>\r\n    <LI>Nhà xuất bản: Nxb Lao động</LI>\r\n      <LI>Nhà phát hành: Alpha books</LI>\r\n     <LI>Cuốn sách là lời chia sẻ của tác giả, người đã sống và làm việc ở hơn 20 quốc gia/khu vực và các nhân vật, những người đã trực tiếp trải qua và ghi dấn ấn tên tuổi của mình trong những lĩnh vực họ đang theo đuổi trên thế giới.</LI>\r\n</UL>\r\n', '1500000', '5', '28','6','2017-5-13','21','74');
INSERT INTO `products` VALUES ('28', 'Học Nói Tiếng Anh Cấp Tốc Khi Bạn Ở Nước Ngoài', 'Lê Huy Lâm', '<UL>\r\n    <LI>Người dịch: Lê Huy Lâm </LI>\r\n    <LI>Nhà xuất bản: Nxb Thành phố Hồ Chí Minh</LI>\r\n    <LI>Nhà phát hành: Minh Tâm</LI>\r\n    <LI>Học Nói Tiếng Anh Cấp Tốc Khi Bạn Ở Nước Ngoài được biên soạn nhằm đáp ứng nhu cầu giao tiếp tiếng Anh của đông đảo bạn đọc có nhu cầu đi du lịch hay giao tiếp với các du khách nước ngoài. Sách được biên soạn tỉ mỉ với nhiều tình huống thực tế mà bạn sẽ gặp phải khi ở người nước ngoài. Đây là cẩm nang và là người bạn đồng hành đắc lực giúp cho bạn vượt qua được những trở ngại ban đầu về ngôn ngữ khi đi du lịch hay giao tiếp với các du khách nước ngoài</LI>\r\n</UL>\r\n', '80000', '5', '29','3','2017-5-13','21','79');
INSERT INTO `products` VALUES ('29', 'Tiếng Việt 123 - Tiếng Việt Cho Người Nước Ngoài', 'Nhiều Tác Giả', '<UL>\r\n    <LI>Tác giả: Nhiều Tác Giả</LI>\r\n    <LI>Nhà xuất bản: Nxb Thế giới</LI>\r\n    <LI>Nhà phát hành: 123Vietnamese</LI>\r\n    <LI>Nếu như cuốn "Tiếng Việt 123" giúp cung cấp cho học viên hệ thống từ vựng và cấu trúc ngữ pháp hữu ích cho mỗi chủ đề thì "Bài tập tiếng Việt 123" chính là cuốn sách giúp họ có thể luyện tập, ghi nhớ và sử dụng chúng trong giao tiếp hàng ngày.</LI>\r\n</UL>\r\n', '200000', '5', '49','10','2017-5-13','21','64');
INSERT INTO `products` VALUES ('30', '900 Mẫu Câu Đàm Thoại', 'Nguyễn Trung Tánh ', '<UL>\r\n    <LI>Tác giả: Nguyễn Trung Tánh </LI>\r\n        <LI>Nhà xuất bản: Nxb Thành phố Hồ Chí Minh</LI>\r\n    <LI>Nhà phát hành: Minh Tâm</LI>\r\n</UL>\r\n', '24000', '5', '0','3','2017-5-13','21','104');
INSERT INTO `products` VALUES ('31', '101 Truyện Cười Tình Yêu', 'NĐức Anh ', '<UL>\r\n    <LI>Tác giả: Đức Anh </LI>\r\n    <LI>Nhà xuất bản: NXB Dân Trí</LI>\r\n    <LI>Nhà phát hành: Huy Hoàng</LI>\r\n    <LI>Hai vợ chồng phân công nhau:- Trong gia đình, người chồng phải đảm đương vai trò trụ cột.- Vậy người vợ?- Người vợ đảm đương vai trò điều khiển cái "trụ cột" kia!Mời bạn đón đọc</LI>\r\n    </UL>\r\n', '40000', '6', '0','10','2017-5-13','21','104');
INSERT INTO `products` VALUES ('32', '101 Truyện Cười Đặc Sắc (Tái Bản 2016)', 'NĐức Anh ', '<UL>\r\n    <LI>Tác giả: Đức Anh </LI>\r\n    <LI>Nhà xuất bản: NXB Dân Trí</LI>\r\n    <LI>Nhà phát hành: Huy Hoàng</LI>\r\n    <LI>Cuốn sách tập hợp những câu chuyện cười đặc sắc... Mỗi câu chuyện đem đến cho người đọc góc nhìn đa dạng về những sự việc diễn ra trong cuộc sống hàng ngày. Có tiếng cười trào lộng sảng khoái, có tiếng cười châm biếm nhẹ nhàng, có tiếng cười đả kích sâu cay... và có thể, người đọc sẽ tự rút ra những kinh nghiệm ứng xử, giao tiếp trong những tình huống đời thường.</LI>\r\n    </UL>\r\n', '50000', '6', '0','10','2017-5-13','21','104');
INSERT INTO `products` VALUES ('33', 'Truyện Cười Bốn Phương', 'NĐức Anh ', '<UL>\r\n    <LI>Tác giả: Đức Anh </LI>\r\n    <LI>Nhà xuất bản: NXB Dân Trí</LI>\r\n    <LI>Nhà phát hành: Huy Hoàng</LI>\r\n    <LI>Mục lục: Hôn nhân – Gia đình Tình yêu nam nữ Chuyện về phụ nữ Chuyện đàn ông Con cái Học trò – Trường lớp – Sinh viên Công việc Sân khấu – Điện ảnh – Thể thao – Báo chí Du lịch – Dịch vụ - Nhà hàng – Quảng cáo Bác sĩ – Bệnh</LI>\r\n    </UL>\r\n', '100000', '6', '0','10','2017-5-13','21','104');
INSERT INTO `products` VALUES ('34', 'Truyện Cười Đặc Sắc', 'Khánh Huyền ', '<UL>\r\n    <LI>Tác giả: Khánh Huyền (Sưu tầm và tuyển chọn)</LI>\r\n    <LI>Nhà xuất bản: NXB Hồng Đức</LI>\r\n    <LI>Nhà phát hành: TTTV Hà Nội</LI>\r\n    <LI>Hai vợ chồng phân công nhau:- Trong gia đình, người chồng phải đảm đương vai trò trụ cột.- Vậy người vợ?- Người vợ đảm đương vai trò điều khiển cái "trụ cột" kia!Mời bạn đón đọc</LI>\r\n    </UL>\r\n', '40000', '6', '0','10','2017-5-13','21','104');
INSERT INTO `products` VALUES ('35', 'Chồng Kể Vợ Cười - 1001 Truyện Cười Chọn Lọc', 'Việt Hùng ', '<UL>\r\n    <LI>Tác giả: Việt Hùng </LI>\r\n    <LI>Nhà xuất bản: Nxb Văn hóa Thông tin</LI>\r\n    <LI>Nhà phát hành: Phương Đông</LI>\r\n    <LI>Mục lụcĐơn giảnHay hơnĐức tínhLý doHết chịuEm nằm giữa cơKeo kiệtBa lần ba là chínĐãng trí bác họcTôi cũng biết thếCùng trời cuối đấtĐể khỏi bị hiểu nhầmXin đừng Đáng tiếc Phương tiện Đều giống nhau cả Nhìn kỹ 15%G henĐể đấy cho con Nhà ...</LI>\r\n    </UL>\r\n', '54000', '6', '0','10','2017-5-13','21','104');
INSERT INTO `products` VALUES ('36', '99 Truyện Cười Xả Stress - Học trò', 'Nguyễn Gia ', '<UL>\r\n    <LI>Tác giả: Nguyễn Gia </LI>\r\n    <LI>Nhà xuất bản: Nxb HCM</LI>\r\n    <LI>Nhà phát hành: Phương Đông</LI>\r\n    <LI>Mục lụcPhê vănVì tạiTìm ra Châu MỹMắt ở phía trướcMở bàiBán đảoĐơn giảnTại bốNước Lào?Gọi là gì?Hỏi Nguyễn DuSinh vào thời kỳ nào?Kẻ mê tiềnCâu hỏi khó trả lờiVô cùng kỳ lạPhản bácNên làm gì trướcLời nói thậtLời nói cửa ...</LI>\r\n    </UL>\r\n', '24000', '6', '0','3','2017-5-13','21','104');
INSERT INTO `products` VALUES ('37', 'Truyện Cười Song Ngữ Hoa - Việt', 'The Zhishi', '<UL>\r\n    <LI>Tác giả: The Zhishi </LI>\r\n    <LI>Nhà xuất bản: Nxb Thanh Niên</LI>\r\n    <LI>Nhà phát hành: Mcbooks</LI>\r\n    <LI>Biên dịch và sưu tầm những câu chuyện này nhắm tới những nhóm độc giả rộng rãi: những bạn đang học trung văn (bằng B), bằng C, học sinh khối không chuyên, học sinh chuyên ngữ, sinh viên khoa Trung văn, giáo viên… và cả những người yêu thích môn Trung văn. Các câu chuyện viết bằng tiếng Trung, bao gồm cả chữ giản thể và chữ phổn thể.</LI>\r\n    </UL>\r\n', '94000', '6', '0','7','2017-5-13','21','104');
INSERT INTO `products` VALUES ('38', 'Tuyển Tập Truyện Cười Tiếng Anh - Tập 1 ', 'rần Mạnh Tường ', '<UL>\r\n    <LI>Tác giả: Trần Mạnh Tường </LI>\r\n    <LI>Nhà xuất bản: Nxb Kim Đồng</LI>\r\n    <LI>Nhà phát hành: Minh Thắng</LI>\r\n    <LI>Tuyển Tập Truyện Cười tiếng Anh song ngữ Anh - Việt ngoài việc mang đến sự giải trí lành mạnh, những phút giây thư giãn sảng khoái mà còn giúp bạn có thêm vốn Anh ngữ phong phú, giúp bạn trau dồi kỹ năng ngoại ngữ cho mình.</LI>\r\n    </UL>\r\n', '84000', '6', '0','1','2017-5-13','21','104');
INSERT INTO `products` VALUES ('39', 'Truyện đọc để cười', 'Minh Xuân ', '<UL>\r\n    <LI>Tác giả: Minh Xuân  </LI>\r\n    <LI>Nhà xuất bản: NXB Dân Trí</LI>\r\n    <LI>Nhà phát hành: Huy Hoàng</LI>\r\n    <LI>Hóm hỉnh, vui nhộn, Truyện đọc để cười sẽ mang đến cho bạn những giây phút thoải mái, thư thái với những chuyện vui theo nhiều chủ đề thú vị. Với cách sắp xếp theo từng chủ đề, cuốn sách nhỏ này như một cuốn cẩm nang trong những buổi hội họp, không những giúp chúng ta trau dồi được kiến thức tiếng Anh mà còn hiểu thêm về phong tục, vǎn hoá của các cộng đồng, dân tộc trên thế giới. </LI>\r\n    </UL>\r\n', '54000', '6', '0','10','2017-5-13','21','104');
INSERT INTO `products` VALUES ('40', 'Truyện Trạng Cười Việt Nam', 'NĐức Anh ', '<UL>\r\n    <LI>Tác giả: Đức Anh </LI>\r\n    <LI>Nhà xuất bản: NXB Dân Trí</LI>\r\n    <LI>Nhà phát hành: Huy Hoàng</LI>\r\n    <LI>Mục lụcTruyện Trạng Quỳnh Giỏi từ trong bụng mẹĐầu to bằng cái bồĐất nứt con bọ hungChuyện dê đực chữaMiệng kẻ sangPhơi sáchChúa Liễu mắc lỡmTrả ơn bà chúa Liễu...Truyện Trạng LợnTrạng LợnTrạng nguyên hay trạng dởThiên tích thong ...</LI>\r\n    </UL>\r\n', '24000', '6', '0','10','2017-5-13','21','104');
INSERT INTO `products` VALUES ('41', 'Khổng Minh Gia Cát Lượng Đại Truyện - Tái bản 2003', 'Tam Quốc Ngoại Truyện ', '<UL>\r\n    <LI>Tác giả: Tam Quốc Ngoại Truyện  </LI>\r\n    <LI>Nhà xuất bản: NXB Đà Nẵng</LI>\r\n    <LI>Nhà phát hành: Huy Hoàng</LI>\r\n    <LI>Đối với bạn đọc Việt Nam yêu thích vǎn học Trung Quốc, từ lâu Khổng Minh - Gia Cát Lượng đã trở thành nhân vật vǎn học rất đỗi gẫn gũi và quen thuộc. Những chiến tích lẫy lừng, tai thao lược, nhân cách vĩ đại của ông vượt khỏi thời gian, làm rung động biết bao thế hệ. Tuy nhiên, những chi tiết thực về cuộc đời, được bao phủ bởi lớp huyền thoại của ông đến nay vẫn còn những tồn nghi nhất định, thu hút sự quan tâm chú ý của nhiều nhà vǎn, nhà nghiên cứu, cũng như độc giả đương đại. </LI>\r\n    </UL>\r\n', '24000', '6', '0','5','2017-5-13','21','104');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `f_ID` int(11) NOT NULL AUTO_INCREMENT,
  `f_Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `f_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_address` varchar(50) COLLATE utf8_unicode_ci,
  `f_phone` varchar(50) COLLATE utf8_unicode_ci,
  `f_DOB` date NOT NULL,
  `f_Permission` int(11) NOT NULL,
  PRIMARY KEY (`f_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
