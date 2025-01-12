USE [master]
GO
/****** Object:  Database [HotelDB]    Script Date: 06.12.2024 13:13:08 ******/
CREATE DATABASE [HotelDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HotelDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HotelDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HotelDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelDB] SET  MULTI_USER 
GO
ALTER DATABASE [HotelDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelDB', N'ON'
GO
ALTER DATABASE [HotelDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [HotelDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HotelDB]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 06.12.2024 13:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id_customers] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[PassportS] [int] NOT NULL,
	[PassportN] [int] NOT NULL,
	[Phone] [nchar](11) NOT NULL,
 CONSTRAINT [PK_customers_tbl] PRIMARY KEY CLUSTERED 
(
	[id_customers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 06.12.2024 13:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[id_rooms] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nchar](3) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_rooms_tbl] PRIMARY KEY CLUSTERED 
(
	[id_rooms] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[services]    Script Date: 06.12.2024 13:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[services](
	[id_services] [int] IDENTITY(1,1) NOT NULL,
	[DateStart] [date] NOT NULL,
	[DateOver] [date] NOT NULL,
	[Days] [int] NULL,
	[Sum] [int] NULL,
	[id_rooms] [int] NOT NULL,
	[id_customers] [int] NOT NULL,
	[CustomerName] [nvarchar](150) NULL,
	[RoomNumber] [nchar](3) NULL,
 CONSTRAINT [PK_services_tbl] PRIMARY KEY CLUSTERED 
(
	[id_services] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (5, N'Jane', N'Smith', N'Петрович', 8745, 538368, N'84567678987')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (6, N'Вовчат', N'Рожков', N'', 2462, 289446, N'86526244255')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (7, N'Игорь', N'Сантинин', N'', 3156, 344461, N'88458747434')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (8, N'Тимофей', N'Капустин', N'Владимирович', 6456, 277576, N'84352736383')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (9, N'Ольга', N'Палмина', N'', 5455, 257652, N'89838963962')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (10, N'Игорь', N'Титов', N'Николаевич', 9390, 145452, N'86748484933')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (11, N'Мария', N'Титова', N'', 7838, 516454, N'82527764435')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (12, N'Татьяна', N'Станиславова', N'Владимировна', 8368, 356352, N'89003337433')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (13, N'Владлен', N'Кирпичев', N'Игоревич', 2446, 234462, N'84567678987')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (14, N'Мария', N'Полянина', N'Игоревна', 3461, 378156, N'86526244255')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (15, N'Шамиль', N'Тигров', N'Всеславович', 2776, 647656, N'88458747434')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (16, N'Александр', N'Панфилов', N'', 1121, 355455, N'84352736383')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (17, N'Пётр', N'Игорев', N'Николаевич', 1717, 939540, N'89838964962')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (18, N'Валентин', N'Полиморфинов', N'Петрович', 3745, 731838, N'86748684933')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (19, N'Анастасия', N'Тимофеева', N'Александровна', 3541, 544545, N'82527564435')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (20, N'Калина', N'Фадеева', N'Николаевна', 9367, 345345, N'83563653566')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (21, N'Ольга', N'Годжо', N'Сергеевна', 4620, 111122, N'89654381541')
INSERT [dbo].[customers] ([id_customers], [FirstName], [LastName], [MiddleName], [PassportS], [PassportN], [Phone]) VALUES (23, N'John', N'Doe', N'Middle', 1234, 567890, N'11112223333')
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[rooms] ON 

INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (11, N'101', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (12, N'102', N'single', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (13, N'103', N'double', N'Banned')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (14, N'104', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (15, N'105', N'single', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (16, N'106', N'single', N'Banned')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (17, N'107', N'single', N'Banned')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (18, N'108', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (19, N'109', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (20, N'110', N'single', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (21, N'111', N'single', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (22, N'112', N'single', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (23, N'201', N'single', N'Banned')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (24, N'202', N'single', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (25, N'203', N'double', N'Banned')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (26, N'204', N'single', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (27, N'205', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (28, N'206', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (29, N'207', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (30, N'208', N'tabor', N'Banned')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (31, N'209', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (32, N'210', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (33, N'211', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (34, N'212', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (35, N'213', N'single', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (36, N'214', N'single', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (37, N'215', N'single', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (38, N'216', N'single', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (39, N'217', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (40, N'218', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (41, N'219', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (42, N'220', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (43, N'221', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (44, N'301', N'single', N'Banned')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (45, N'302', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (46, N'303', N'single', N'Banned')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (47, N'304', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (48, N'305', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (49, N'306', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (50, N'307', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (51, N'308', N'tabor', N'Banned')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (52, N'309', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (53, N'310', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (54, N'311', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (55, N'312', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (56, N'313', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (57, N'314', N'double', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (58, N'315', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (59, N'316', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (60, N'317', N'tabor', N'')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (65, N'401', N'tabor', N'Banned')
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (66, N'402', N'tabor', NULL)
INSERT [dbo].[rooms] ([id_rooms], [Number], [Type], [Status]) VALUES (67, N'505', N'double', N'Banned')
SET IDENTITY_INSERT [dbo].[rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[services] ON 

INSERT [dbo].[services] ([id_services], [DateStart], [DateOver], [Days], [Sum], [id_rooms], [id_customers], [CustomerName], [RoomNumber]) VALUES (17, CAST(N'2024-11-25' AS Date), CAST(N'2024-11-26' AS Date), 1, 1000, 22, 5, N'Smith Jane Петрович', N'112')
INSERT [dbo].[services] ([id_services], [DateStart], [DateOver], [Days], [Sum], [id_rooms], [id_customers], [CustomerName], [RoomNumber]) VALUES (18, CAST(N'2024-11-27' AS Date), CAST(N'2024-12-06' AS Date), 9, 13500, 36, 11, N'Титова Мария ', N'214')
INSERT [dbo].[services] ([id_services], [DateStart], [DateOver], [Days], [Sum], [id_rooms], [id_customers], [CustomerName], [RoomNumber]) VALUES (21, CAST(N'2024-11-27' AS Date), CAST(N'2024-12-12' AS Date), 15, 15000, 40, 14, N'Полянина Мария Игоревна', N'218')
INSERT [dbo].[services] ([id_services], [DateStart], [DateOver], [Days], [Sum], [id_rooms], [id_customers], [CustomerName], [RoomNumber]) VALUES (25, CAST(N'2024-11-25' AS Date), CAST(N'2024-12-20' AS Date), 25, 37500, 19, 8, N'Капустин Тимофей Владимирович', N'109')
INSERT [dbo].[services] ([id_services], [DateStart], [DateOver], [Days], [Sum], [id_rooms], [id_customers], [CustomerName], [RoomNumber]) VALUES (27, CAST(N'2024-12-03' AS Date), CAST(N'2024-12-04' AS Date), 1, 2000, 24, 10, N'Титов Игорь Николаевич', N'202')
SET IDENTITY_INSERT [dbo].[services] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Services_RoomNumber_DateRange]    Script Date: 06.12.2024 13:13:08 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Services_RoomNumber_DateRange] ON [dbo].[services]
(
	[RoomNumber] ASC,
	[DateStart] ASC,
	[DateOver] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[services]  WITH CHECK ADD  CONSTRAINT [FK_services_customers] FOREIGN KEY([id_customers])
REFERENCES [dbo].[customers] ([id_customers])
GO
ALTER TABLE [dbo].[services] CHECK CONSTRAINT [FK_services_customers]
GO
ALTER TABLE [dbo].[services]  WITH CHECK ADD  CONSTRAINT [FK_services_rooms] FOREIGN KEY([id_rooms])
REFERENCES [dbo].[rooms] ([id_rooms])
GO
ALTER TABLE [dbo].[services] CHECK CONSTRAINT [FK_services_rooms]
GO
ALTER TABLE [dbo].[rooms]  WITH CHECK ADD  CONSTRAINT [CK_rooms] CHECK  (([Type]='tabor' OR [Type]='double' OR [Type]='single'))
GO
ALTER TABLE [dbo].[rooms] CHECK CONSTRAINT [CK_rooms]
GO
USE [master]
GO
ALTER DATABASE [HotelDB] SET  READ_WRITE 
GO
