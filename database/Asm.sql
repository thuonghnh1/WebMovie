create database PolyOEAsg
use PolyOEAsg;
SELECT * FROM Users
SELECT * FROM Shares
SELECT * FROM Favorites
SELECT * FROM Videos
CREATE TABLE Users (
  Username varchar(30) NOT NULL PRIMARY KEY,
  Fullname nvarchar(50) NOT NULL,
  MatKhau varchar(20) NOT NULL,
  Email nvarchar(50) NOT NULL,
  Admin bit NOT NULL
);
CREATE TABLE Shares (
  ShareId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  Username varchar(30) NOT NULL,
  VideoId varchar(50) NOT NULL,
  Emails nvarchar(250) NOT NULL,
  SharedDate date NOT NULL,
  CONSTRAINT FK_Shares_Users FOREIGN KEY (Username) REFERENCES Users(Username) ON DELETE NO ACTION,
  CONSTRAINT FK_Shares_Videos FOREIGN KEY (VideoId) REFERENCES Videos(VideoId) ON DELETE NO ACTION
);

CREATE TABLE Favorites (
  FavoriteId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  Username varchar(30) NOT NULL,
  VideoId varchar(50) NOT NULL,
  LikedDate date NOT NULL,
  CONSTRAINT FK_Favorites_Users FOREIGN KEY (Username) REFERENCES Users(Username) ON DELETE NO ACTION,
  CONSTRAINT FK_Favorites_Videos FOREIGN KEY (VideoId) REFERENCES Videos(VideoId) ON DELETE NO ACTION
);

CREATE TABLE Videos (
  VideoId varchar(50) NOT NULL PRIMARY KEY,
  Title nvarchar(100) NULL,
  Poster varchar(max) NULL,
  Views int NULL,
  DaoDien nvarchar(50) NULL,
  NgayCongChieu date NULL,
  ThoiLuong int NULL,
  PhuDe nvarchar(20) NULL,
  Trailer varchar(max) NULL,
  Description nvarchar(max) NULL,
  Active bit
);

INSERT INTO Users (Username, Fullname, MatKhau, Email, Admin)
VALUES ('user1', N'Zhongli', '123', 'zhongli@gmail.com', 1),
('thuong', N'Hoài Thương', '123', 'thuong@gmail.com', 0),
('baiQi', N'Bạch Khởi', '111', 'bq@gmail.com', 0),
('anhvu', N'Trần Anh Vũ', '003', 'vuta@gmail.com', 0),
('poly', N'Poly', '111', 'poly@gmail.com', 1);

INSERT INTO Shares (Username, VideoId, Emails, SharedDate)
VALUES ('user1', 'YN2016', 'zhongli@gmail.com', '2024-03-02');

INSERT INTO Favorites ( Username, VideoId, LikedDate) VALUES
('thuong', 'EX2024', '2024-03-06'),
('thuong', 'YN2016', '2023-02-08'),
('thuong', '5CM2007', '2023-08-15'),
('thuong', 'MMDB2023', '2023-01-16'),
('anhvu', 'EX2024', '2024-03-15'),
('anhvu', 'YN2016', '2022-02-18'),
('anhvu', '5CM2007', '2022-09-15'),
('anhvu', 'MMDB2023', '2024-02-22'),
('baiQi', '5CM2007', '2022-12-15'),
('baiQi', 'MMDB2023', '2024-01-01'),
('baiQi', 'YN2016', '2023-08-15');

INSERT INTO Videos (VideoId, Title, Poster, Views, DaoDien, NgayCongChieu, ThoiLuong, PhuDe, Trailer, Description, Active)
VALUES (
N'YN2016', N'Your Name','https://i.pinimg.com/564x/90/fd/ea/90fdea64aa68abf3b5591927194a53ab.jpg' , 1580, N'Shinkai Makoto', CAST(N'2016-08-26' AS Date), 112, N'Tiếng Việt',  N'NooIc3dMncc',
N'<b><i>“Mỗi buổi sáng mở mắt ra tôi đều có cảm giác mất mát. Thứ đã đánh mất đó là gì? Điều gì đó quan trọng, một người nào đó, hay đơn giản chỉ là một cái tên mà thôi”.</i></b>
<br>
<br>
Mitsuha là cô nữ sinh sống tại một vùng quê hẻo lánh trong một thị trấn nhỏ được bao quanh bởi núi rừng, cô lớn lên cùng với bà và em gái, trong một gia đình kế thừa nghi lễ truyền thống đền Shinto. Cha của cô sau cái chết của vợ, không chấp nhận nối nghiệp gia đình mà quyết định đi theo con đường chính trị. Mitsuha như bao cô gái khác, càng ngày càng trở nên chán ngán cuộc sống thôn quê buồn tẻ, yên bình, không có nổi một quán cafe, hiệu sách, tàu chỉ đến mỗi 2 tiếng, cửa hàng mới có 9 giờ đã đóng cửa. Cô mong ước kiếp sau mình có thể trở thành chàng trai Tokyo thành thị.
<br>
<br>
Nhưng không cần phải chờ đến kiếp sau đâu! Bởi vì điều kì diệu đã xảy ra, một ngày kia Mitsuha tỉnh dậy trong hình hài của một anh chàng Tokyo xa lạ tên là Taki, một cậu bạn năng động, hiền lành và dễ mến với một cuộc sống bận rộn từ học hành đến đi làm thêm.
<br>
<br>
Ngày này qua ngày khác, với những giấc mơ kì lạ khiến Taki và Mitsuha dần nhận ra, đây không đơn thuần chỉ là giấc mơ nữa, họ đã thật sự trao đổi thân xác cho nhau khi ngủ. Hai người họ đi từ bất ngờ, ngạc nhiên chuyển sang trạng thái dần thích nghi và giúp đỡ nhau để có thể sống tốt trong thân xác của đối phương. Để tránh những rắc rối, họ để lại những lời nhắn, những quy định cho nhau, thậm chí còn tặng kèm cả mấy trò chơi khăm hài hước. Việc hoán đổi cứ thể diễn ra và lặp lại tạo nên những sắc màu mới cho cuộc sống vốn nhàm chán của cả hai nhân vật. Hai người xa lạ, không có điểm chung như hai sợi dây song song đan vào nhau tạo thành phép màu kỳ diệu. Và rồi trải qua những tháng ngày đó, họ dần nhận ra tình cảm của mình dành cho đối phương, người mà họ chưa từng một lần chạm mặt.
<br>
<br>
Khi trái tim quyết định cất lên tiếng nói thì cũng là lúc cả hai nhận ra sự tồn tại mơ hồ của đối phương. Ngôi sao chổi nhiệm màu xuất hiện trên bầu trời Nhật Bản, khung cảnh tưởng chừng đẹp như trong mơ, đẹp đến mức khiến người ta vấn vương đó đã cuốn đi những giấc mơ kì lạ và mở ra một sự thật kinh hoàng.
<br>
<br>
Motif hoán đổi thân xác chắc chẳng có gì lạ lẫm đối với nền điện ảnh thế giới. Tuy nhiên với <b>Your Name</b>, đạo diễn Shinkai Mokoto đã khéo léo lồng ghép trong đó những giá trị văn hóa, nhân sinh quan và cả câu chuyện nhân duyên kỳ diệu.', 1)

INSERT INTO Videos (VideoId, Title, Poster, Views, DaoDien, NgayCongChieu, ThoiLuong, PhuDe, Trailer, Description, Active)
VALUES (
N'5CM2007', N'5 Centimet trên giây','https://i.pinimg.com/564x/ed/13/f0/ed13f0ff05a1a144408ccb18fb7c330b.jpg' , 1580, N'Shinkai Makoto', CAST(N'2007-03-03' AS Date), 63, N'Tiếng Việt',  N'wdM7athAem0',
N' <strong>“5cm/s không chỉ là vận tốc của những cánh anh đào rơi, mà còn là vận tốc khi chúng ta lặng lẽ bước qua đời nhau, đánh mất bao cảm xúc thiết tha nhất của tình yêu.”</strong>
    <br>
	<br>
<em>Tác giả Shinkai Makoto đã từng chia sẻ: xuyên suốt các tác phẩm của ông là "sự mất mát", một cảm giác mà bất cứ ai cũng sẽ gặp trong cuộc sống. Hai người dù có yêu nhau bao nhiêu thì đến cuối cùng, cái chết vẫn có thể chia lìa họ. Ai trong chúng ta rồi cũng sẽ đến một lúc nào đó sẽ không còn được gặp người mà ta vẫn hằng gắn bó, yêu thương. Nhưng chúng ta rồi cuối cùng cũng phải vượt qua cảm giác mất mát đó bằng cách này hay cách khác.</em>
<br>
<br>
Một cô gái đem lòng yêu đơn phương một chàng trai, nhưng lòng chàng trai đó luôn hướng về một hướng khác. Hai người yêu nhau nhưng cuối cùng rồi một người cũng rời đi, hoặc vì hoàn cảnh, hoặc vì còn nhung nhớ người khác, hoặc vẫn còn yêu nhưng đơn giản là chấp nhận chuyện không thể bên nhau.
Mỗi người ai rồi cũng sẽ có một mối tình sâu đậm, bản thân muốn quên cũng không thể nào quên, rồi sau đó chúng ta sẽ trải qua vài mối tình khác như Takaki, ngắn có, dài có, thoáng qua có, yên bình có. Nhưng rồi chúng ta sẽ lựa chọn ở bên ai, hay vẫn mãi bị ám ảnh bởi mối tình đó? Hãy xem và cảm nhận, cách mà Akari và Takaki lựa chọn để sống tiếp và quên đi mối tình đầu như thế nào.', 1)

INSERT INTO Videos (VideoId, Title, Poster, Views, DaoDien, NgayCongChieu, ThoiLuong, PhuDe, Trailer, Description, Active)
VALUES (
N'EX2024', N'Quật mộ trùng ma','https://i.pinimg.com/564x/76/d2/46/76d24627be5c8f61c0a40f438a60a428.jpg' , 459998, N'Jang Jae-hyun', CAST(N'2024-03-15' AS Date), 134, N'Tiếng Việt',  N'j_6_wLF1pDg',
N' Exhuma: Quật Mộ Trùng Ma" (Exhuma 2024) là một tác phẩm trinh thám kinh dị đầy ám ảnh của điện ảnh Hàn Quốc năm 2024, được sáng tác và chỉ đạo bởi Jang Jae-hyun. Phim quy tụ dàn diễn viên tài năng với sự tham gia của 
Choi Min-sik, Kim Go-eun, Yoo Hae-jin và Lee Do-hyun. Câu chuyện xoay quanh việc khám phá một ngôi mộ bí ẩn, khiến cho những năng lượng đen tối bị giam giữ dưới lòng đất được giải phóng. Đề tài đầy hấp dẫn này tạo nên một câu chuyện ly kỳ, 
đậm chất kịch tính với yếu tố huyền bí và siêu nhiên. "Exhuma" đã được chọn tham dự Phần Forum tại Liên hoan Phim Quốc tế Berlin lần thứ 74, nơi phim đã chinh phục khán giả trong buổi công chiếu đặc biệt. Câu chuyện theo dõi một gia đình giàu có ở Los Angeles khi họ đối mặt với những sự kiện siêu nhiên kỳ bí. 
Trong hành trình giải quyết những bí ẩn đen tối, gia đình đã tìm đến sự giúp đỡ của bộ đôi pháp sư trẻ tuổi Hwa Rim và Bong Gil. Hwa Rim nhanh chóng khám phá ra rằng mọi hiện tượng siêu nhiên này liên quan đến bóng tối của tổ tiên gia đình, được biết đến với biệt danh "Mộ Trùng Ma".
Phim đưa khán giả vào cuộc hành trình đầy căng thẳng để giải thoát linh hồn không yên của tổ tiên và kết thúc cơn ác mộng của gia đình.', 1)

INSERT INTO Videos (VideoId, Title, Poster, Views, DaoDien, NgayCongChieu, ThoiLuong, PhuDe, Trailer, Description, Active)
VALUES (
N'MMDB2023', N'Marry My Dead Body','https://i.pinimg.com/564x/cd/ee/68/cdee681abc84807abebf7fdb8afadec7.jpg' , 999879, N'Cheng Wei-hao', CAST(N'2023-02-10' AS Date), 130, N'Tiếng Việt',  N'kB3aMANGbiw',
N'Ngay từ khi công bố, Marry my dead body (Tựa Việt: Chuyện tôi và ma quỷ trở thành người một nhà) có nhiều yếu tố thu hút khán giả. Đây là phim boy-love (tình yêu nam nam) được chú ý nhất hiện nay khi quy tụ “nam thần” Hứa Quang Hán – gương mặt quen thuộc của màn ảnh Đài Loan.

Chưa kể, tác phẩm còn khai thác đề tài minh hôn (kết hôn với người đã khuất), khéo léo kết hợp thể loại trinh thám và hài hước để tạo thành một câu chuyện mới lạ, hấp dẫn.
<br>
<strong>Đám cưới bất đắc dĩ trong “Marry my dead body”</strong>
<br>
<strong>Tác phẩm của đạo diễn tên tuổi</strong>
<br>
<strong>Diễn xuất duyên dáng trong “Marry my dead body”</strong>', 1)
