USE [master]
GO
/****** Object:  Database [MasterPolDB]    Script Date: 18.12.2024 20:18:57 ******/
CREATE DATABASE [MasterPolDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterPolDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MasterPolDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterPolDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MasterPolDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MasterPolDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterPolDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterPolDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterPolDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterPolDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterPolDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterPolDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterPolDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MasterPolDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterPolDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterPolDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterPolDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterPolDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterPolDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterPolDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterPolDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterPolDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MasterPolDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterPolDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterPolDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterPolDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterPolDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterPolDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterPolDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterPolDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MasterPolDB] SET  MULTI_USER 
GO
ALTER DATABASE [MasterPolDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterPolDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterPolDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterPolDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterPolDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasterPolDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MasterPolDB', N'ON'
GO
ALTER DATABASE [MasterPolDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [MasterPolDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MasterPolDB]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 18.12.2024 20:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](500) NULL,
	[FirstName] [varchar](500) NULL,
	[Patronymic] [varchar](500) NULL,
	[Email] [varchar](500) NULL,
	[Phone] [varchar](500) NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialTypes]    Script Date: 18.12.2024 20:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](200) NULL,
	[PercentageDefectiveMaterial] [float] NULL,
 CONSTRAINT [PK_Material_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProducts]    Script Date: 18.12.2024 20:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[PartnerID] [int] NULL,
	[ProductsNumber] [int] NULL,
	[SaleDate] [date] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 18.12.2024 20:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PartnerName] [varchar](200) NULL,
	[LastName] [varchar](200) NULL,
	[FirstName] [varchar](200) NULL,
	[Patronimic] [varchar](200) NULL,
	[Email] [varchar](200) NULL,
	[Phone] [varchar](22) NULL,
	[Address] [varchar](200) NULL,
	[INN] [bigint] NULL,
	[Rate] [int] NULL,
	[TypeID] [int] NULL,
	[Discount] [int] NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerTypes]    Script Date: 18.12.2024 20:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](200) NULL,
 CONSTRAINT [PK_Partner_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterialTypes]    Script Date: 18.12.2024 20:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterialTypes](
	[MaterialTypeID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_ProductMaterialTypes_1] PRIMARY KEY CLUSTERED 
(
	[MaterialTypeID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18.12.2024 20:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NULL,
	[ProductName] [varchar](200) NULL,
	[Article] [int] NULL,
	[MinimumCost] [float] NULL,
	[MaterialTypeID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 18.12.2024 20:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](200) NULL,
	[Coefficient] [float] NULL,
 CONSTRAINT [PK_Product_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18.12.2024 20:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MaterialTypes] ON 

INSERT [dbo].[MaterialTypes] ([ID], [Type], [PercentageDefectiveMaterial]) VALUES (1, N'Тип материала 1
', 0.001)
INSERT [dbo].[MaterialTypes] ([ID], [Type], [PercentageDefectiveMaterial]) VALUES (2, N'Тип материала 2
', 0.095)
INSERT [dbo].[MaterialTypes] ([ID], [Type], [PercentageDefectiveMaterial]) VALUES (3, N'Тип материала 3
', 0.028)
INSERT [dbo].[MaterialTypes] ([ID], [Type], [PercentageDefectiveMaterial]) VALUES (4, N'Тип материала 4
', 0.055)
INSERT [dbo].[MaterialTypes] ([ID], [Type], [PercentageDefectiveMaterial]) VALUES (5, N'Тип материала 5
', 0.034)
SET IDENTITY_INSERT [dbo].[MaterialTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerProducts] ON 

INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (1, 6, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (2, 8, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (3, 9, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (4, 7, 2, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (5, 9, 2, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (6, 10, 2, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (7, 6, 2, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (8, 6, 3, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (9, 7, 3, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (10, 9, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (11, 8, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (12, 10, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (13, 8, 5, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (14, 9, 5, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (15, 6, 5, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[PartnerProducts] ([ID], [ProductID], [PartnerID], [ProductsNumber], [SaleDate]) VALUES (16, 7, 5, 25000, CAST(N'2024-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[PartnerProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([ID], [PartnerName], [LastName], [FirstName], [Patronimic], [Email], [Phone], [Address], [INN], [Rate], [TypeID], [Discount]) VALUES (1, N'База Строитель
', N'Иванова', N'Александра', N'Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', 2222455179, 7, 1, 10)
INSERT [dbo].[Partners] ([ID], [PartnerName], [LastName], [FirstName], [Patronimic], [Email], [Phone], [Address], [INN], [Rate], [TypeID], [Discount]) VALUES (2, N'Паркет 29
', N'Петров', N'Василий', N'Петрович', N'vppetrov@vl.ru
', N'987 123 56 78
', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18
', 3333888520, 7, 2, 5)
INSERT [dbo].[Partners] ([ID], [PartnerName], [LastName], [FirstName], [Patronimic], [Email], [Phone], [Address], [INN], [Rate], [TypeID], [Discount]) VALUES (3, N'Стройсервис
', N'Соловьев', N'Андрей', N'Николаевич', N'ansolovev@st.ru
', N'812 223 32 00
', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', 4440391035, 7, 3, 0)
INSERT [dbo].[Partners] ([ID], [PartnerName], [LastName], [FirstName], [Patronimic], [Email], [Phone], [Address], [INN], [Rate], [TypeID], [Discount]) VALUES (4, N'Ремонт и отделка
', N'Воробьева', N'Екатерина', N'Валерьевна', N'ekaterina.vorobeva@ml.ru
', N'444 222 33 11
', N'143960, Московская область, город Реутов, ул. Свободы, 51
', 1111520857, 5, 4, 10)
INSERT [dbo].[Partners] ([ID], [PartnerName], [LastName], [FirstName], [Patronimic], [Email], [Phone], [Address], [INN], [Rate], [TypeID], [Discount]) VALUES (5, N'МонтажПро
', N'Степанов', N'Степан', N'Сергеевич', N'stepanov@stepan.ru
', N'912 888 33 33
', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122
', 5552431140, 10, 1, 15)
INSERT [dbo].[Partners] ([ID], [PartnerName], [LastName], [FirstName], [Patronimic], [Email], [Phone], [Address], [INN], [Rate], [TypeID], [Discount]) VALUES (6, N'test', N'test', N'test', NULL, N'1', N'1', N'test', NULL, 6, NULL, 0)
INSERT [dbo].[Partners] ([ID], [PartnerName], [LastName], [FirstName], [Patronimic], [Email], [Phone], [Address], [INN], [Rate], [TypeID], [Discount]) VALUES (7, N'123', N'123', N'23', NULL, N'123', N'213', N'213', NULL, 213, NULL, 0)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerTypes] ON 

INSERT [dbo].[PartnerTypes] ([ID], [Type]) VALUES (1, N'ЗАО
')
INSERT [dbo].[PartnerTypes] ([ID], [Type]) VALUES (2, N'ООО
')
INSERT [dbo].[PartnerTypes] ([ID], [Type]) VALUES (3, N'ПАО
')
INSERT [dbo].[PartnerTypes] ([ID], [Type]) VALUES (4, N'ОАО
')
SET IDENTITY_INSERT [dbo].[PartnerTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [TypeID], [ProductName], [Article], [MinimumCost], [MaterialTypeID]) VALUES (6, 3, N'Паркетная доска Ясень темный однополосная 14 мм
', 8758385, 4456.9, 1)
INSERT [dbo].[Products] ([ID], [TypeID], [ProductName], [Article], [MinimumCost], [MaterialTypeID]) VALUES (7, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм
', 8858958, 7330.99, 2)
INSERT [dbo].[Products] ([ID], [TypeID], [ProductName], [Article], [MinimumCost], [MaterialTypeID]) VALUES (8, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм
', 7750282, 1799.33, 3)
INSERT [dbo].[Products] ([ID], [TypeID], [ProductName], [Article], [MinimumCost], [MaterialTypeID]) VALUES (9, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской
', 7028748, 3890.41, 4)
INSERT [dbo].[Products] ([ID], [TypeID], [ProductName], [Article], [MinimumCost], [MaterialTypeID]) VALUES (10, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм
', 5012543, 5450.59, 5)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([ID], [Type], [Coefficient]) VALUES (1, N'Ламинат
', 2.35)
INSERT [dbo].[ProductTypes] ([ID], [Type], [Coefficient]) VALUES (2, N'Массивная доска
', 5.15)
INSERT [dbo].[ProductTypes] ([ID], [Type], [Coefficient]) VALUES (3, N'Паркетная доска
', 4.34)
INSERT [dbo].[ProductTypes] ([ID], [Type], [Coefficient]) VALUES (4, N'Пробковое покрытие
', 1.5)
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Roles]
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Partners] FOREIGN KEY([PartnerID])
REFERENCES [dbo].[Partners] ([ID])
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK_Table_1_Partners]
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK_Table_1_Products]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_Partner_Types] FOREIGN KEY([TypeID])
REFERENCES [dbo].[PartnerTypes] ([ID])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_Partner_Types]
GO
ALTER TABLE [dbo].[ProductMaterialTypes]  WITH CHECK ADD  CONSTRAINT [FK_Product_Material_Types_Material_Types] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialTypes] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterialTypes] CHECK CONSTRAINT [FK_Product_Material_Types_Material_Types]
GO
ALTER TABLE [dbo].[ProductMaterialTypes]  WITH CHECK ADD  CONSTRAINT [FK_Product_Material_Types_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterialTypes] CHECK CONSTRAINT [FK_Product_Material_Types_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Product_Types] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ProductTypes] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Product_Types]
GO
USE [master]
GO
ALTER DATABASE [MasterPolDB] SET  READ_WRITE 
GO
