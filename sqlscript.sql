USE [master]
GO
/****** Object:  Database [curs]    Script Date: 17.05.2019 11:37:28 ******/
CREATE DATABASE [curs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'curs', FILENAME = N'D:\sql2\MSSQL14.MSSQLSERVER1\MSSQL\DATA\curs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'curs_log', FILENAME = N'D:\sql2\MSSQL14.MSSQLSERVER1\MSSQL\DATA\curs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [curs] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [curs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [curs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [curs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [curs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [curs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [curs] SET ARITHABORT OFF 
GO
ALTER DATABASE [curs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [curs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [curs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [curs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [curs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [curs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [curs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [curs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [curs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [curs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [curs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [curs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [curs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [curs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [curs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [curs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [curs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [curs] SET RECOVERY FULL 
GO
ALTER DATABASE [curs] SET  MULTI_USER 
GO
ALTER DATABASE [curs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [curs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [curs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [curs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [curs] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'curs', N'ON'
GO
ALTER DATABASE [curs] SET QUERY_STORE = OFF
GO
USE [curs]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 17.05.2019 11:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[CodeClient] [int] NULL,
	[Title] [varchar](40) NULL,
	[AddressTo] [varchar](30) NULL,
	[Post] [varchar](30) NULL,
	[Address] [varchar](60) NULL,
	[City] [varchar](15) NULL,
	[IIndex] [varchar](10) NULL,
	[Country] [varchar](10) NULL,
	[Telephone] [varchar](24) NULL,
	[Fax] [varchar](24) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 17.05.2019 11:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[CodeGoods] [int] NULL,
	[Mark] [varchar](40) NULL,
	[CodeSuppliers] [int] NULL,
	[CodeType] [int] NULL,
	[Price] [numeric](10, 3) NULL,
	[InWarehouse] [int] NULL,
	[Expected] [int] NULL,
	[MinimalStock] [int] NULL,
	[DeliveriesStopped] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 17.05.2019 11:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[CodeSuppliers] [int] NULL,
	[Title] [varchar](40) NULL,
	[AddressTo] [varchar](30) NULL,
	[Post] [varchar](30) NULL,
	[Address] [varchar](60) NULL,
	[City] [varchar](15) NULL,
	[IIndex] [varchar](10) NULL,
	[Country] [varchar](20) NULL,
	[Telephone] [varchar](24) NULL,
	[Fax] [varchar](24) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17.05.2019 11:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (1, N'Ovihkc', N'Андрей Ханавин', N'Координатор', N'ул. Бергуса, 8', N'Лулео', N'S-958 22', N'Швеция', N'0921-12 34 65', N'0921-12')
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (2, N'Белкантон', N'Андрей Карпухин', N'Главный менеджер', N'ул. Гарсиа, 9993', N'Мехико', N'05022', N'Мексика', N'(5) 555-3392', N'(5) 5557293')
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (3, N'Дамодара-Сервис', N'Лидия Кулаева', N'Совладелец', N'ул. Эдальго, 29', N'Берн', N'3012', N'Швейцария', N'0452-076545', NULL)
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (4, N'E-Life', N'Роланд Мендель', N'Менеджер по продажам', N'Vi. Кировская. 6', N'Трасс', N'8010', N'Авария', N'7675-3425', N'7675-3426')
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (5, N'IMC Computers', N'Мария Ларсон', N'Совладелец', N'ул. Ксргатая. 24', N'Nрекке', N'S-844 67', N'Швеция', N'0695-34 67 2', NULL)
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (6, N'Верса', N'Питер Франкен', N'Главный менеджер', N'Берлинская пл., 43', N'Мюнхен', N'80805', N'Термания', N'089-0877310', N'089-087745')
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (7, N'Comtris', N'Мария Хосе', N'Совладелец', N'ул. Палое. 5S', N'Каракас', N'108', N'Венесуэла', N'(2) 283-295 Г', N'(2) 283-3397')
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (8, N'Net Line', N'Марио Ионтес', N'Бухгалтер', N'ул. Ракко, 67', N'Риоде-Жанейро', N'05454-876', N'Бразилия', N'(21) 555-009Г', N'(21) 555-8765')
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (9, N'NTTs', N'Карлос Хемандос', N'11релсгавигель', N'ул. Карлос, 22', N'Сан-Кристобаль', N'5022', N'Венесуэла', N'(5) 555-1340', N'(5) 555-1948')
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (10, N'Интеллекте', N'Патрисия Кемма', N'Ученик продавца', N'Джонстоун шоссе, 8', N'Корк', NULL, N'Ирландия', N'2967 542', N'2967 3333')
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (11, N'ZS', N'Максим Анищенко', N'Бухгалтер', N'Бодиварская, 52', N'Bаркисимею', N'3508', N'Венесуэла', N'(9) 331-6954', N'(9) 331-7256')
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (12, N'Медиа-софт', N'Джовани Ровелли', N'Главный .менеджер', N'ул. Людовика. 22', N'Бергамо', N'24100', N'Италия', N'035-640230', N'035-640231')
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (13, N'Эликон-М', N'Александр Боровик-', N'Представитель', N'ул. Беринговая. 2743', N'Анкоридж', N'99508', N'США', N'(907) 555-7584', N'(907) 555- 2880')
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (14, N'Stop', N'Игнат Довидовский', N'Бухгалтер', N'Тачерстрасе, 10', N'Ккжевальд', N'01307', N'Германия', N'0372-035 188', NULL)
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (15, N'Соло', N'Андрей Савельев', N'Ученик продавца', N'ул. Провинциальная, 124', N'Реджио-Эмилио', N'42100', N'Италия', N'0522556721', N'0522- 556722')
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (16, N'Olymp', N'Юрий Макаров', N'Бухгалтер', N'ул. Виа, Г', N'Мадрид', N'28001', N'Испания', N'(91) 745 6200', N'(91) 745 6210')
INSERT [dbo].[Clients] ([CodeClient], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (17, N'Oki', N'Александр Гронский', N'Представитель', N'ул. Кастро. 414', N'Сан-Паулс', N'05634-030', N'Бразилия', N'(11) 555-2167', N'(11) 555-2168')
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (1, N'Genius SP-G06', 8, 9, CAST(9.000 AS Numeric(10, 3)), 15, 10, 8, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (2, N'Наушники Dialog М-750НУ+микрофон', 8, 9, CAST(9.000 AS Numeric(10, 3)), 15, 10, 8, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (3, N'ATX 2.03 300W', 19, 10, CAST(35.000 AS Numeric(10, 3)), 15, 5, 10, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (4, N'ATX Midi Tower 350W', 7, 10, CAST(55.000 AS Numeric(10, 3)), 5, 8, 21, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (5, N'Блок питания ATX 235/250/300W', 5, 10, CAST(14.000 AS Numeric(10, 3)), 20, 10, 5, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (6, N'HDD Maxtor 30Gb', 16, 11, CAST(69.000 AS Numeric(10, 3)), 10, 2, 8, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (7, N'HDD Seagate Baracuda 4 40Gb', 3, 11, CAST(87.000 AS Numeric(10, 3)), 8, 4, 12, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (8, N'HDD IBM 60Gb', 13, 11, CAST(9.000 AS Numeric(10, 3)), 5, 6, 8, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (9, N'T E A C', 4, 12, CAST(9.000 AS Numeric(10, 3)), 15, 10, 10, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (11, N'Samsung 52x', 8, 13, CAST(23.000 AS Numeric(10, 3)), 5, 5, NULL, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (12, N'TEAC 52x CD-522E', 3, 13, CAST(42.000 AS Numeric(10, 3)), 7, NULL, NULL, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (13, N'CD-RW/ROM TEAC', 3, 13, CAST(42.000 AS Numeric(10, 3)), 7, NULL, NULL, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (14, N'Verbatim', 3, 14, CAST(0.280 AS Numeric(10, 3)), 300, 100, 50, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (15, N'CD-R TDK 12x', 19, 14, CAST(0.620 AS Numeric(10, 3)), 200, 100, 50, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (16, N'ACORP 56EMS. USB', 5, 15, CAST(40.000 AS Numeric(10, 3)), 5, NULL, NULL, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (17, N'HUB 10/t00Mbit', 3, 16, CAST(32.000 AS Numeric(10, 3)), 10, 5, NULL, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (18, N'ACORP 56EMS. USB', 5, 15, CAST(40.000 AS Numeric(10, 3)), 5, NULL, NULL, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (19, N'3COM SOHO 100TX', 10, 16, CAST(22.000 AS Numeric(10, 3)), 15, 5, NULL, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (20, N'HUB 10/t00Mbit', 3, 16, CAST(32.000 AS Numeric(10, 3)), 10, 5, NULL, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (21, N'Switch 10/100Mbit', 13, 16, CAST(32.000 AS Numeric(10, 3)), 10, 10, 5, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (22, N'Кабель "витая пара" UTP cat.5', 4, 16, CAST(0.180 AS Numeric(10, 3)), 100, 100, 20, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (23, N'Canon LBP810', 3, 2, CAST(185.000 AS Numeric(10, 3)), 39, 5, 7, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (24, N'Accorp VlA266i815D', 7, 3, CAST(61.000 AS Numeric(10, 3)), 29, NULL, 10, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (25, N'TNT2 M64 32Mb', 7, 6, CAST(28.000 AS Numeric(10, 3)), NULL, NULL, NULL, N'YES')
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (26, N'DDR 128Mb', 9, 5, CAST(38.000 AS Numeric(10, 3)), 34, NULL, 25, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (27, N'Samsung 550B', 10, 2, CAST(150.000 AS Numeric(10, 3)), 20, NULL, NULL, N'YES')
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (28, N'Gigabyte GA-60XTA', 11, 3, CAST(64.000 AS Numeric(10, 3)), 76, NULL, 30, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (29, N'Creative Labs SB Life', 12, 7, CAST(9.000 AS Numeric(10, 3)), 26, NULL, NULL, N'YES')
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (30, N'Mouse Logitech B69', 13, 8, CAST(15.000 AS Numeric(10, 3)), 10, NULL, 15, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (31, N'Epson EPL520', 6, 2, CAST(90.000 AS Numeric(10, 3)), 76, NULL, NULL, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (32, N'Celeron 1000MHz', 15, 4, CAST(51.000 AS Numeric(10, 3)), 26, NULL, 15, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (33, N'Intel P4 1700MHz Box', 14, 4, CAST(137.000 AS Numeric(10, 3)), NULL, 70, 20, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (34, N'AMD Athlon 1333MHz', 6, 4, CAST(53.000 AS Numeric(10, 3)), 40, 9, 25, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (35, N'Samtron 76E', 16, 2, CAST(180.000 AS Numeric(10, 3)), 11, NULL, 15, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (36, N'Коврики пластиковые', 17, 8, CAST(0.500 AS Numeric(10, 3)), 112, NULL, 20, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (37, N'Chicony PS/2 820 2981', 19, 8, CAST(6.000 AS Numeric(10, 3)), 23, NULL, 30, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (38, N'SDRAM 128Mb', 18, 5, CAST(19.000 AS Numeric(10, 3)), 26, NULL, NULL, N'YES')
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (39, N'Asus A7S333', 6, 3, CAST(86.000 AS Numeric(10, 3)), 35, NULL, 30, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (40, N'Creative Labs SB Life 5.1+FM radio', 3, 7, CAST(39.000 AS Numeric(10, 3)), 10, NULL, 10, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (41, N'GeForce 2 MX 400 64Mb', 3, 6, CAST(36.000 AS Numeric(10, 3)), 10, 15, 24, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (42, N'DIMM PC 133 128Mb Micron', 3, 5, CAST(15.000 AS Numeric(10, 3)), 21, 10, 30, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (43, N'AND Duron 1000MHz', 9, 4, CAST(36.000 AS Numeric(10, 3)), 22, 10, 10, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (44, N'Lexmark Z35', 5, 2, CAST(62.000 AS Numeric(10, 3)), 12, NULL, 25, NULL)
INSERT [dbo].[Goods] ([CodeGoods], [Mark], [CodeSuppliers], [CodeType], [Price], [InWarehouse], [Expected], [MinimalStock], [DeliveriesStopped]) VALUES (45, N'TV-tuner Aver MediaTV Studio', 4, 6, CAST(75.000 AS Numeric(10, 3)), 29, NULL, NULL, N'YES')
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (1, N'EtelSoft', N'Андрей Герасимов', N'Представитель', N'707 Оксфорд', N'Анн-Арбор', N'48104', N'США', N'(313) 555-5753', N'(313) 555-3349')
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (2, N'Iven', N'Антон Сеткин', N'Главный менеджер', N'9-8 Секимаи', N'Токио', N'100', N'Япония', N'(03) 3555-5011', N'(313) 555-3349')
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (3, N'SV-Trading', N'Валерия Евенкова', N'Директор', N'92 Сетсако', N'Осака', N'545', N'Япония', N'(06) 431 -7877', NULL)
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (4, N'CD-Life', N'Наталия Отока', N'Главный менеджер', N'74 ул. Роз', N'Мельбурн', N'3058', N'Австралия', N'(03) 444-2343', N'(03) 444-6588')
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (5, N'Stepfor', N'Павел Фокин', N'Представитель', N'ул. Королевского пути, 29', N'Манчестер', N'М14 GSD', N'Великобритания', N'(161) 555-4448', NULL)
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (6, N'B.S.T.Group', N'Евгений Шаматранов', N'Продавец', N'Каладоган 13', N'Тетеборг', N'S-345 67', N'Швеция', N'031-987 65 43', N'031-987 65 9')
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (7, N'Biocom', N'Вячеслав Путеев', N'Главный менеджер', N'ул. Американская 12.890', N'Сан-Паулу', N'5442', N'Бразилия', N'(11) 555-4640', NULL)
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (8, N'DAAS', N'Петр Моргунов', N'Менеджер по продажам', N'Тверская 5', N'Москва', N'101785', N'Россия', N'(095)998-4510', NULL)
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (9, N'Конструктив', N'Федор Куполов', N'Представитель', N'ул. Данте 75', N'Равенна', N'48100', N'Италия', N'(0544) 60323', N'(0544) 60603')
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (10, N'Виола-Сервис', N'Виктор Кухарчук', N'Главный менеджер', N'ул. Хатлевеген, 5', N'Сандвикен', N'1320', N'Норвегия', N'(0)2-953010', NULL)
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (11, N'Гвин-Медиа', N'Артем Столяров', N'Местный представитель', N'3400-8 Авеню', N'Бенд', N'97101', N'США', N'(503) 555-993', NULL)
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (12, N'Senter', N'Александр Осипенко', N'Представитель', N'ул. Бровайдер, 231', N'Стокгольм', N'S-I23 45', N'Швеция', N'08-12.3 45 67', NULL)
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (13, N'Техинтерторг', N'Дарья Борщева', N'Агент по продажам', N'Частный Департамент', N'Бостон', N'02134', N'США', N'(617) 555-3267', N'(617) 555-3389')
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (14, N'Ситипринт', N'Инна Риякевич', N'Совладелец', N'ул. Серашун. 471', N'Сингапур', N'0512', N'Сингапур', N'555-8787', NULL)
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (15, N'Юнити Сервис', N'Алексей Жолнсрович', N'Менеджер по продажам', N'ул. Лингбиеилд', N'Лингби', N'2800', N'Дания', N'43844108', N'43844115')
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (16, N'ПК Сервис', N'Юрий Бартошек', N'Менеджер по продажам', N'ул. Войрон, 22', N'Монсо', N'71300', N'Франция', N'85-57-00-07', NULL)
INSERT [dbo].[Suppliers] ([CodeSuppliers], [Title], [AddressTo], [Post], [Address], [City], [IIndex], [Country], [Telephone], [Fax]) VALUES (17, N'Астлайн', N'Руслан Сидкж', N'Бухгалтер', N'ул. Чессер, 148', N'Оге-Хиацинте', N'J2S 7S8', N'Канада', N'(514) 555-2955', N'(514) 555-292 ')
INSERT [dbo].[Users] ([Login], [Password], [Type]) VALUES (N'qwerty', N'333', 3)
INSERT [dbo].[Users] ([Login], [Password], [Type]) VALUES (N'Sad', N'123', 1)
INSERT [dbo].[Users] ([Login], [Password], [Type]) VALUES (N'swa', N'321', 2)
USE [master]
GO
ALTER DATABASE [curs] SET  READ_WRITE 
GO
