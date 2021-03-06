USE [master]
GO
/****** Object:  Database [PRJ321_SE1429]    Script Date: 3/30/2021 9:36:10 AM ******/
CREATE DATABASE [PRJ321_SE1429]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_MusicShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB_MusicShop.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_MusicShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB_MusicShop_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PRJ321_SE1429] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ321_SE1429].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ321_SE1429] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ321_SE1429] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ321_SE1429] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ321_SE1429] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ321_SE1429] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ321_SE1429] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ321_SE1429] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ321_SE1429] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ321_SE1429] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ321_SE1429] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PRJ321_SE1429] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ321_SE1429', N'ON'
GO
USE [PRJ321_SE1429]
GO
/****** Object:  Table [dbo].[HE140102_DUYNK_Category]    Script Date: 3/30/2021 9:36:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HE140102_DUYNK_Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HE140102_DUYNK_Order]    Script Date: 3/30/2021 9:36:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HE140102_DUYNK_Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NULL,
	[UserId] [varchar](100) NULL,
	[TotalPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HE140102_DUYNK_OrderDetail]    Script Date: 3/30/2021 9:36:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HE140102_DUYNK_OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HE140102_DUYNK_Product]    Script Date: 3/30/2021 9:36:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HE140102_DUYNK_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[ProductName] [nvarchar](100) NULL,
	[Price] [float] NULL,
	[ImgUrl] [nvarchar](200) NULL,
	[Discount] [float] NULL,
	[ProductDetail] [ntext] NULL,
	[Artist] [nvarchar](50) NULL,
	[Year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HE140102_DUYNK_SecurityQues]    Script Date: 3/30/2021 9:36:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HE140102_DUYNK_SecurityQues](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionDetail] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HE140102_DUYNK_Stock]    Script Date: 3/30/2021 9:36:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HE140102_DUYNK_Stock](
	[StockId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HE140102_DUYNK_Users]    Script Date: 3/30/2021 9:36:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HE140102_DUYNK_Users](
	[UserId] [varchar](100) NOT NULL,
	[Pass] [varchar](100) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Dob] [date] NULL,
	[Address] [nvarchar](200) NULL,
	[Email] [varchar](100) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[UserRole] [int] NOT NULL,
	[QuestionId] [int] NULL,
	[Answer] [text] NULL,
 CONSTRAINT [PK_HE140102_DUYNK_Userss] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[HE140102_DUYNK_Category] ON 

INSERT [dbo].[HE140102_DUYNK_Category] ([CategoryId], [CategoryName]) VALUES (1, N'Đĩa than Vinyl')
INSERT [dbo].[HE140102_DUYNK_Category] ([CategoryId], [CategoryName]) VALUES (2, N'Băng đĩa nhạc CD')
INSERT [dbo].[HE140102_DUYNK_Category] ([CategoryId], [CategoryName]) VALUES (3, N'Băng Cassette')
SET IDENTITY_INSERT [dbo].[HE140102_DUYNK_Category] OFF
SET IDENTITY_INSERT [dbo].[HE140102_DUYNK_Order] ON 

INSERT [dbo].[HE140102_DUYNK_Order] ([OrderId], [OrderDate], [UserId], [TotalPrice]) VALUES (1, CAST(N'2021-03-23' AS Date), N'user1', 390000)
SET IDENTITY_INSERT [dbo].[HE140102_DUYNK_Order] OFF
SET IDENTITY_INSERT [dbo].[HE140102_DUYNK_OrderDetail] ON 

INSERT [dbo].[HE140102_DUYNK_OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [Price]) VALUES (1, 1, 24, 1, 390000)
SET IDENTITY_INSERT [dbo].[HE140102_DUYNK_OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[HE140102_DUYNK_Product] ON 

INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (1, 1, N'Smile', 500000, N'katy-perry-smile-fan-edition-dia-cd_df90964391614a5e891a7c9d8b9e43b7_medium.jpg', 0, N'One of the best-selling musical artists of all time, Katy Perry will release her new studio album, Smile, on August 14th via Capitol Records. Features hit singles ', N'Katy Perry', 2020)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (2, 2, N'Prism', 300000, N'katy-perry-prism-dia-cd_master.jpg', 0, N'Following the triumphant success of the TEENAGE DREAM franchise (TEENAGE DREAM and TEENAGE DREAM: THE COMPLETE CONFECTION), which produced 8 pop singles, Katy Perry returns with a shimmering new album that includes her latest, #1 single, Roar, alongside such soon-to-be classics as Unconditionally, Legendary Lovers, Birthday, Walking On Air, This Is How We Do, International Smile and Double Rainbow.', N'Katy Perry', 2013)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (3, 2, N'One of the Boys', 320000, N'katy-perry-one-of-the-boys-dia-cd_e6d34821471c4cd9af4c1fc73f500b67_medium.png', 0, N'One of the Boys is the second album from Capitol Music Group recording artist, Katy Perry. The album is Perry''s first album since her Red Hill Records Christian rock debut, entitled Katy Hudson, which was recorded in 2001.The album features the singles, "UR So Gay" and "I Kissed a Girl".', N'Katy Perry', 2008)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (4, 2, N'Fearless', 300000, N'taylor-swift-fearless-taylor-s-version-dia-cd-target_207e95c241ad44f192c0b97d96fb6158_medium.png', 0, N'Fearless is the 2008 sophomore album from Taylor Swift, the young Country singer/songwriter who charmed the hearts and charts of America beginning with her debut single ''Tim McGraw''. Her triple-platinum self-titled debut release has scanned over 3.4 million units and spent more weeks at #1 than any other Country album this year: 24 weeks! Taylor is the only Country female artist to have five Top 10 singles from a debut album and the only Country female vocalist this decade to reach the Top 5 on Billboard''s Hot 100 Chart', N'Taylor Swift', 2008)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (5, 2, N'Speak Now', 420000, N'taylor_swift_-_speak_now__standard__-_dia_cd_medium.jpg', 0, N'2010 release, the third album from the Country/Pop superstar. Speak Now is the follow-up to her multi-million-selling 2008 album, Fearless. The 21-year-old singer/songwriter wrote the entire album on her own and co-produced with longtime collaborator Nathan Chapman, who worked with her on Fearless and her 2006 self-titled debut. Features the single ''Mine''.', N'Taylor Swift', 2010)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (6, 2, N'1989', 490000, N'taylor-swift-1989-standard-dia-cd-bonus-13-anh-polaroid_0baa5720c9e74f83b7a305d102a99b68_medium.png', 0, N'1989 is Taylor Swift’s first documented pop album. She always flirted with the concept of pop songs but she never went full-out with it. When you listen to 1989, you notice that it is a pop album, but it is far from bubblegum-pop meaningless songs that make no sense at all.', N'Taylor Swift', 2014)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (7, 2, N'Red', 420000, N'taylor_swift_-_red__deluxe__-_dia_cd_medium.jpg', 0, N'Hi, I''m Taylor. I love the number 13. I was born in December on a Christmas tree farm. I like imagining what life was like hundreds of years ago. I have blurry eyesight. My favorite thing in life is writing about life, specifically the parts of life concerning love. Because, as far as I''m concerned, love is absolutely everything.', N'Taylor Swift', 2012)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (9, 3, N'Lover', 400000, N'bang-cassette-tape-taylor-swiftt-lover_f418b70c234c41928783c41de665ef41_master.jpg', 0, N'Taylor Swift releases her highly anticipated 7th album, Lover featuring the hit singles "You Need To Calm Down" and "ME!" feat. Brendon Urie of Panic! At The Disco.', N'Taylor Swift', 2019)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (10, 2, N'folklore', 490000, N'taylor-swift-folklore-1-the-in-the-trees-edition-deluxe-cd-dia-cd1_794b6f5220e8423c8b082b291f40db79_medium.png', 0, N'Taylor Swift''s surprise album, folklore, on CD August 7th! "Most of the things I had planned this summer didn''t end up happening, but there is something I hadn''t planned on that DID happen. And that thing is my 8th studio album, folklore," she said, letting fans know she poured all her whims, dreams, fears, musings into the 17 tracks. "I wrote and recorded this music in isolation but got to collaborate with some musical heroes of mine; Aaron Dessner, Bon Iver, William Bowery and Jack Antonoff."', N'Taylor Swift', 2020)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (11, 3, N'evermore', 490000, N'taylor-swift-evermore-deluxe-cassette-bang-cassette_bd47f6a432704e56b4e20a1c7fe6a3dd_grande.png', 0, N'Taylor Swift has announced her ninth studio album, evermore; folklore''s sister record. These songs were created with Aaron Dessner, Jack Antonoff, WB and Justin Vernon. The deluxe physical edition will include two bonus tracks.', N'Taylor Swift', 2020)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (12, 2, N'21', 290000, N'adele_-_21_-_dia_cd_medium.jpg', 0, N'21 is the eagerly awaited sophomore album from British singer-songwriter Adele. It’s the follow up to Adele’s critically acclaimed, Grammy award winning debut album 19 (both named after her age at the time the songs were written). Recorded in Malibu and London, 21 offered Adele the opportunity to work with such luminary producers and songwriters as Rick Rubin, Paul Epworth, Ryan Tedder, Dan Wilson and Fraser T. Smith, as well as continuing to work with Francis “Eg” White and Jim Abbiss.', N'Adele', 2011)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (13, 1, N'When We All Fall Asleep, Where Do We Go?', 900000, N'eilish-when-we-all-fall-asleep-where-do-we-go-yellow-vinyl-lp-dia-than_c0c491d618584ae08dd155818a3fa92b_medium.jpg', 0, N'When We All Fall Asleep, Where Do We Go? Will be released March 29, 2019 on Darkroom/Interscope Records. It is the debut album from Billie Eilish and includes `when the party''s over'', `you should see me in a crown'' and just released `bury a friend''. The album follows 2017''s dont smile at me EP which recently peaked at #14 on Billboard Top 200 chart.', N'Billie Eilish', 2019)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (14, 1, N'Fine Line', 950000, N'harry-styles-fine-line-vinyl-2lp-dia-than_64ce5280bf264ce3b543fce66dd0cc98_master.jpg', 0, N'Double 180 gm vinyl LP pressing including poster. 2019 release, the sophomore solo album from the British artist best known for his work with boy band One Direction. Includes the singles "Lights Up" and "Watermelon Sugar".', N'Harry Styles', 2019)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (15, 1, N'Heartbreak Weather', 920000, N'niall-horan-heartbreak-weather-vinyl-lp-dia-than_5aea54e0fcf8488ebca111e98462a3fd_master.jpg', 0, N'Second studio album by the Irish singer-songwriter and former One Direction member. Featuring the singles ''Nice to Meet Ya'', ''Put a Little Love On Me'' and ''No Judgement'', the album is the follow up to Horan''s 2017 debut record ''Flicker''.', N'Niall Horan', 2020)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (16, 1, N'Flicker', 920000, N'niall-horan-flicker-vinyl-lp_ae57465010e64f6082c065a2a53a75fd_medium.jpg', 0, N'Deluxe edition contains 3 additional bonus tracks.', N'Niall Horan', 2017)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (17, 1, N'YOUNGBLOOD', 950000, N'5-seconds-of-summer-youngblood-vinyl-lp-dia-than_0048095865cc441582caddbdb4879c15_medium.jpg', 0, N'While expanding its musical parameters on Youngblood, 5SOS retains the hooks and trademark DNA that’s always been a massive part of the band’s appeal. They wrote and recorded the bulk of the album with the Swedish producing-writing team Carl and Rami (Nicki Minaj, Madonna). Other collaborators include producer/instrumentalist Mike Elizondo (Dr. Dre, Eminem, Fiona Apple), producer/engineer Noah Passovoy (Maroon 5), J Kash (Maroon 5, Charlie Puth), Asia Whitacre (Hailee Steinfeld, Zedd) and Andrew Goldstein (Linkin Park, Simple Plan).', N'5 Seconds Of Summer', 2018)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (18, 2, N'CALM', 750000, N'5sos-calm-dia-cdd_c41d7737b36442ecbf7b9b55a53963ed.png', 0, N'5 Seconds of Summer (5SOS) make their Interscope Records debut with their follow up to 2018s Youngblood, which debuted at #1 on the Billboard Top 200 chart, marking the bands third consecutive #1 debut. Produced by Andrew Watt, CALM includes 2019 hit songs ', N'5 Seconds Of Summer', 2020)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (19, 2, N'Future Nostalgia', 880000, N'dua-lipa-future-nostalgia-dia-cd_9533a9b0e8994018a237363ae03d9ac4_medium.jpg', 0, N'Help others learn more about this product by uploading a video!', N'Dua Lipa', 2020)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (20, 1, N'American Teen ', 180000, N'khalid_-_american_teen__vinyl_2lp__-_dia_than_3c0b021528e940fc9c0e333579ebff5c_medium.jpg', 0, N'American Teen - Exclusive Limited Edition Coke Clear Colored 2x Vinyl LP', N'Khalid', 2019)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (21, 3, N'Thank U Next', 300000, N'ariana-grande-thank-u-next-cassette-tape_d1d89d2dba7a400ba15c699936061a39_medium.png', 0, N'Import 2 x LP pressing on black vinyl. Island Records. 2019.', N'Ariana Grande', 2019)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (22, 3, N'Sweetener', 320000, N'ariana_grande_sweetener_a3b86cf107c0476f89af22d1bd4e7fcb_master.jpg', 0, N'UK double vinyl LP pressing. 2018 release, the fourth album from Ariana Grande, the Grammy Award-nominated, multi-platinum, record-breaking superstar that has emerged as one of the most magnetic and massively successful performers in pop music today. The album features the #1 smash  as well as The Light Is Coming (featuring Nicki Minaj) and God Is A Woman. With the release of no tears left to cry, she became the first artist in music history to see the lead single from her first four albums debut in the Top 10 on Billboard Hot 100. By the age of 24, Ariana Grande delivered three platinum-selling albums in addition to nabbing four Grammy Award nominations and landing eight hits in the Top 10 on the Billboard Hot 100 chart.', N'Ariana Grande', 2018)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (23, 1, N'My Everything', 400000, N'ariana-grande-my-everything-vinyl-lp-dia-than_a7fd6681db694cf1b37cc2014a6eb87e_medium.jpg', 0, N'Associated Press claimed, ''''This is how you follow up an impressive debut: simply step into the recording booth and be amazing yet again.'''' With additional accolades from Rolling Stone and USA Today, among many others, Grande broke streaming records and won numerous awards. Internationally the album quickly reached #1 in Australia, Mexico, Canada, Japan and Top 5 in the UK, Germany, Ireland, New Zealand, Sweden, Netherlands, Austria, and Switzerland. The first single from her sophomore album, ''''Problem'''' [featuring Iggy Azalea], saw her become the ''''youngest woman to debut with over 400K sold first-week.'''' Other tracks include ''''Break Free'''' [featuring Zedd] and ''''Bang Bang'''' with Nicki Minaj and Jessie J. The album debuted at #1 on the Billboard 200 in the United States. The album is now available on vinyl.', N'Ariana Grande', 2016)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (24, 1, N'Dangerous Woman', 390000, N'ariana-grande-dangerous-woman-purple-black-swirl-vinyl-lp-dia-than_5a16435a63704405930161f21818a5ed_grande.jpg', 0, N'Republic Records is releasing Ariana Grande''s 3rd album, Dangerous Woman, on 5/20. The GRAMMYr Award-nominated multiplatinum superstar was recently awarded with the 2016 Kids'' Choice Awards for Female Singer. She has released two tracks from the upcoming album, "Dangerous Woman" and "Be Alright," both of which have official videos to follow later in the release campaign. Ariana recently launched her Face of MAC Viva Glam campaign for 2016 and her new perfume will be released fall 2016.', N'Ariana Grande', 2015)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (26, 3, N'Rare', 600000, N'selena-gomez-rare-blue-cassette-tape-bang-cassette_3c63f7b176644f4f83e1397da53d691c_master.png', 0, N'The eagerly awaited new album from multi-platinum singer and actress SELENA GOMEZ. "Rare" - which will include the recently released #1 single "Lose You To Love Me" and "Look At Her Now"- is available on vinyl February 21st via Interscope Records.', N'Selena Gomez', 2019)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (27, 3, N'Manic', 500000, N'halsey-manic-cassette-tape-signed-co-chu-ky-bang-cassette_34856e5a99fc44c5ad284eb901629473_medium.png', 0, N'GRAMMYr Award-nominated, multi-Platinum artist and alternative pop maverick Halsey returns with her third full-length album Manic featuring her 5x Platinum hit "Without Me" and "Graveyard." The success of "Without Me" has made Halsey the first and only female artist to have at least three songs chart on the Billboard Hot 100. It now ranks as the longest-running Billboard Hot 100 top 10 hit by a female artist of this century.', N'Halsey', 2019)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (28, 1, N'hopeless fountain kingdom', 620000, N'halsey-hopeless-fountain-kingdom-vinyl-lp-record_2feb3d01b815488bbde2769ac0de5179_master.jpg', 0, N'GRAMMYr Award-nominated multi-platinum alternative pop maverick Halsey returns with her anxiously awaited second full-length album, hopeless fountain kingdom', N'Halsey', 2017)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (29, 3, N'reputation', 220000, N'taylor_swift_reputation_cassette_8e5ec9b951e54ba1ac070d9049950013_master.jpg', 0, N'Detail about the newest album reputation by Taylor Swift', N'Taylor Swift', 2017)
INSERT [dbo].[HE140102_DUYNK_Product] ([ProductId], [CategoryId], [ProductName], [Price], [ImgUrl], [Discount], [ProductDetail], [Artist], [Year]) VALUES (30, 2, N'dont smile at me', 390000, N'billie-eilish-dont-smile-at-me-album-cd_e55cfc82bef34528b3f7675d043cef96_medium.jpg', 0, N'dont smile at me, Billie Eilish''s debut EP originally released on August 11, 2017 via Darkroom/Interscope Records and has since peaked at #14 on the billboard top 200 chart. Of the eight tracks originally included, four are now Certified Platinum and three are Certified Gold. The EP laid the groundwork for Eilish''s 2019 debut album, WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?, which debuted at #1 on the Billboard Top 200 - making Billie the first artist born in the 2000s to achieve #1.', N'Billie Eilish', 2017)
SET IDENTITY_INSERT [dbo].[HE140102_DUYNK_Product] OFF
SET IDENTITY_INSERT [dbo].[HE140102_DUYNK_SecurityQues] ON 

INSERT [dbo].[HE140102_DUYNK_SecurityQues] ([QuestionId], [QuestionDetail]) VALUES (1, N'What was your childhood nickname?')
INSERT [dbo].[HE140102_DUYNK_SecurityQues] ([QuestionId], [QuestionDetail]) VALUES (2, N'What is the name of your favorite childhood friend?')
INSERT [dbo].[HE140102_DUYNK_SecurityQues] ([QuestionId], [QuestionDetail]) VALUES (3, N'What was the last name of your third grade teacher?')
INSERT [dbo].[HE140102_DUYNK_SecurityQues] ([QuestionId], [QuestionDetail]) VALUES (4, N'In what city or town was your first job?')
SET IDENTITY_INSERT [dbo].[HE140102_DUYNK_SecurityQues] OFF
SET IDENTITY_INSERT [dbo].[HE140102_DUYNK_Stock] ON 

INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (1, 1, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (2, 2, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (3, 3, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (4, 4, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (5, 5, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (6, 6, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (7, 7, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (12, 9, 0)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (13, 10, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (14, 11, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (15, 12, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (16, 13, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (17, 14, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (18, 15, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (19, 16, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (20, 17, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (21, 18, 0)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (22, 19, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (23, 20, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (24, 21, 2)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (25, 22, 2)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (26, 23, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (27, 24, 1)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (29, 26, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (30, 27, 8)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (31, 28, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (32, 29, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (33, 30, 9)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (35, 32, 4)
INSERT [dbo].[HE140102_DUYNK_Stock] ([StockId], [ProductId], [Quantity]) VALUES (36, 33, 2)
SET IDENTITY_INSERT [dbo].[HE140102_DUYNK_Stock] OFF
INSERT [dbo].[HE140102_DUYNK_Users] ([UserId], [Pass], [Name], [Gender], [Dob], [Address], [Email], [PhoneNumber], [UserRole], [QuestionId], [Answer]) VALUES (N'admin', N'123456', N'Admin', 1, CAST(N'2000-10-10' AS Date), N'Hanoi', N'admin@mail.com', N'0909090909', 0, NULL, NULL)
INSERT [dbo].[HE140102_DUYNK_Users] ([UserId], [Pass], [Name], [Gender], [Dob], [Address], [Email], [PhoneNumber], [UserRole], [QuestionId], [Answer]) VALUES (N'admin2', N'Admin1234', N'Admin two', 1, CAST(N'2021-03-04' AS Date), N'Ho Chi Minh', N'admin2@mail.com', N'09998888777', 0, NULL, NULL)
INSERT [dbo].[HE140102_DUYNK_Users] ([UserId], [Pass], [Name], [Gender], [Dob], [Address], [Email], [PhoneNumber], [UserRole], [QuestionId], [Answer]) VALUES (N'Admin4', N'Admin123', N'Admin3', 1, CAST(N'2021-03-06' AS Date), N'Texas', N'admin3@mail.com', N'0923942343', 0, NULL, NULL)
INSERT [dbo].[HE140102_DUYNK_Users] ([UserId], [Pass], [Name], [Gender], [Dob], [Address], [Email], [PhoneNumber], [UserRole], [QuestionId], [Answer]) VALUES (N'debug', N'Debug123', N'Debug Son', 1, CAST(N'2021-03-06' AS Date), N'Debug place', N'debug@gmail.com', N'000022222', 1, NULL, NULL)
INSERT [dbo].[HE140102_DUYNK_Users] ([UserId], [Pass], [Name], [Gender], [Dob], [Address], [Email], [PhoneNumber], [UserRole], [QuestionId], [Answer]) VALUES (N'seller1', N'Seller1234', N'Seller one', 1, CAST(N'2021-03-10' AS Date), N'Seattle', N'seller1@mail.com', N'09998887776', 2, NULL, NULL)
INSERT [dbo].[HE140102_DUYNK_Users] ([UserId], [Pass], [Name], [Gender], [Dob], [Address], [Email], [PhoneNumber], [UserRole], [QuestionId], [Answer]) VALUES (N'sellernew', N'Seller1234', N'Seller very new', 0, CAST(N'2020-01-06' AS Date), N'Hanoi', N'sellernew@mail.com', N'0994445556', 2, 3, N'hoa')
INSERT [dbo].[HE140102_DUYNK_Users] ([UserId], [Pass], [Name], [Gender], [Dob], [Address], [Email], [PhoneNumber], [UserRole], [QuestionId], [Answer]) VALUES (N'user1', N'User1234', N'User First', 1, CAST(N'2021-03-04' AS Date), N'Ha Noi', N'user1@mail.com', N'0998887777', 1, 2, N'binh')
INSERT [dbo].[HE140102_DUYNK_Users] ([UserId], [Pass], [Name], [Gender], [Dob], [Address], [Email], [PhoneNumber], [UserRole], [QuestionId], [Answer]) VALUES (N'usernew', N'User1234', N'User very new', 1, CAST(N'2018-01-08' AS Date), N'Nha Trang', N'usernew@mail.com', N'0992223333', 1, 2, N'an')
ALTER TABLE [dbo].[HE140102_DUYNK_Order]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[HE140102_DUYNK_Users] ([UserId])
GO
ALTER TABLE [dbo].[HE140102_DUYNK_OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[HE140102_DUYNK_Order] ([OrderId])
GO
ALTER TABLE [dbo].[HE140102_DUYNK_OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[HE140102_DUYNK_Product] ([ProductId])
GO
ALTER TABLE [dbo].[HE140102_DUYNK_Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[HE140102_DUYNK_Category] ([CategoryId])
GO
USE [master]
GO
ALTER DATABASE [PRJ321_SE1429] SET  READ_WRITE 
GO
