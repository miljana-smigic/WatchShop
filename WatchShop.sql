USE [master]
GO
/****** Object:  Database [WatchShop]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE DATABASE [WatchShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WatchShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WatchShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WatchShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WatchShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WatchShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WatchShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WatchShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WatchShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WatchShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WatchShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WatchShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [WatchShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WatchShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WatchShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WatchShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WatchShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WatchShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WatchShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WatchShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WatchShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WatchShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WatchShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WatchShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WatchShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WatchShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WatchShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WatchShop] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [WatchShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WatchShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WatchShop] SET  MULTI_USER 
GO
ALTER DATABASE [WatchShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WatchShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WatchShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WatchShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WatchShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WatchShop] SET QUERY_STORE = OFF
GO
USE [WatchShop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 01-Jul-20 14:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 01-Jul-20 14:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 01-Jul-20 14:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 01-Jul-20 14:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mechanisms]    Script Date: 01-Jul-20 14:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mechanisms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Mechanisms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLines]    Script Date: 01-Jul-20 14:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_OrderLines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 01-Jul-20 14:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 01-Jul-20 14:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[MechanismId] [int] NOT NULL,
	[GenderId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 01-Jul-20 14:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCases]    Script Date: 01-Jul-20 14:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[AdminCase] [bit] NOT NULL,
 CONSTRAINT [PK_UseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01-Jul-20 14:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUserCase]    Script Date: 01-Jul-20 14:13:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUserCase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUserCase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200628185313_WatchShop first test', N'3.1.3')
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (1, CAST(N'2020-06-29T22:11:45.1852338' AS DateTime2), NULL, 0, 1, N'Guess')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (2, CAST(N'2020-06-29T22:12:08.3531595' AS DateTime2), NULL, 0, 1, N'Rolex')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (3, CAST(N'2020-06-29T22:12:18.7460307' AS DateTime2), NULL, 0, 1, N'Fossil')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (4, CAST(N'2020-06-29T22:13:02.2821016' AS DateTime2), NULL, 0, 1, N'Casio')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (5, CAST(N'2020-06-29T22:13:25.2747977' AS DateTime2), NULL, 0, 1, N'Jaguar')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (6, CAST(N'2020-06-29T22:13:34.2981565' AS DateTime2), CAST(N'2020-06-29T22:20:52.3399404' AS DateTime2), 1, 0, N'Police')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (7, CAST(N'2020-06-30T21:39:03.1881636' AS DateTime2), CAST(N'2020-06-30T21:42:40.1448250' AS DateTime2), 1, 0, N'Test1')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (8, CAST(N'2020-07-01T13:11:18.4009496' AS DateTime2), NULL, 0, 1, N'Skagen')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (9, CAST(N'2020-07-01T13:11:27.5173872' AS DateTime2), NULL, 0, 1, N'DKNY')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (10, CAST(N'2020-07-01T13:11:37.8386527' AS DateTime2), NULL, 0, 1, N'Emporio Armani')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (11, CAST(N'2020-07-01T13:11:49.4726579' AS DateTime2), NULL, 0, 1, N'Michael Kors')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (12, CAST(N'2020-07-01T13:12:00.0505431' AS DateTime2), NULL, 0, 1, N'Sector')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (13, CAST(N'2020-07-01T13:12:06.5040645' AS DateTime2), NULL, 0, 1, N'Festina')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (14, CAST(N'2020-07-01T13:12:19.0160941' AS DateTime2), NULL, 0, 1, N'Bulova')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (15, CAST(N'2020-07-01T13:12:37.2159454' AS DateTime2), NULL, 0, 1, N'Samsung')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (16, CAST(N'2020-07-01T13:12:41.4608805' AS DateTime2), NULL, 0, 1, N'Fortis')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (17, CAST(N'2020-07-01T13:12:55.2604215' AS DateTime2), NULL, 0, 1, N'Just Cavalli')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (18, CAST(N'2020-07-01T13:13:07.3853749' AS DateTime2), NULL, 0, 1, N'Calypso')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (19, CAST(N'2020-07-01T13:14:17.1202234' AS DateTime2), NULL, 0, 1, N'Xeric')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (20, CAST(N'2020-07-01T13:14:30.0059041' AS DateTime2), NULL, 0, 1, N'Bertucci')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (21, CAST(N'2020-07-01T13:14:34.0985200' AS DateTime2), NULL, 0, 1, N'Ballast')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (22, CAST(N'2020-07-01T13:14:47.4124734' AS DateTime2), NULL, 0, 1, N'Devon')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (23, CAST(N'2020-07-01T13:15:06.6683434' AS DateTime2), NULL, 0, 1, N'Detrol')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (24, CAST(N'2020-07-01T13:15:23.7607150' AS DateTime2), NULL, 0, 1, N'G-shock')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (25, CAST(N'2020-07-01T13:15:35.8641164' AS DateTime2), NULL, 0, 1, N'Nava')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (26, CAST(N'2020-07-01T13:15:41.2908607' AS DateTime2), NULL, 0, 1, N'Mr. Jones')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (27, CAST(N'2020-07-01T13:15:58.3141246' AS DateTime2), NULL, 0, 1, N'One eleven')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (1, CAST(N'2020-06-29T23:34:31.4212509' AS DateTime2), NULL, 0, 1, N'Male')
INSERT [dbo].[Genders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (2, CAST(N'2020-06-29T23:34:37.3295811' AS DateTime2), NULL, 0, 1, N'Female')
INSERT [dbo].[Genders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (3, CAST(N'2020-06-29T23:34:58.3524348' AS DateTime2), NULL, 0, 1, N'Children')
INSERT [dbo].[Genders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (4, CAST(N'2020-06-29T23:35:03.0870977' AS DateTime2), NULL, 0, 1, N'Unisex')
INSERT [dbo].[Genders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (5, CAST(N'2020-06-29T23:35:35.6565957' AS DateTime2), CAST(N'2020-06-29T23:36:15.3568578' AS DateTime2), 1, 0, N'Test1')
INSERT [dbo].[Genders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (6, CAST(N'2020-06-30T21:43:43.0770757' AS DateTime2), CAST(N'2020-07-01T13:17:46.6325561' AS DateTime2), 1, 0, N'UpdateTest')
INSERT [dbo].[Genders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (7, CAST(N'2020-06-30T21:45:52.3720668' AS DateTime2), CAST(N'2020-06-30T21:47:08.2098431' AS DateTime2), 1, 0, N'Test')
SET IDENTITY_INSERT [dbo].[Genders] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (1, CAST(N'2020-06-28T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Admin')
INSERT [dbo].[Groups] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (2, CAST(N'2020-06-28T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'User')
INSERT [dbo].[Groups] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (3, CAST(N'2020-06-29T20:35:12.0598339' AS DateTime2), CAST(N'2020-06-29T20:42:50.9044172' AS DateTime2), 1, 0, N'change group')
INSERT [dbo].[Groups] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (4, CAST(N'2020-06-30T21:48:31.8665272' AS DateTime2), CAST(N'2020-06-30T21:49:53.6877105' AS DateTime2), 1, 0, N'update')
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Mechanisms] ON 

INSERT [dbo].[Mechanisms] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (1, CAST(N'2020-06-30T00:14:54.6710839' AS DateTime2), NULL, 0, 1, N'Quartz')
INSERT [dbo].[Mechanisms] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (2, CAST(N'2020-06-30T00:15:11.1475087' AS DateTime2), NULL, 0, 1, N'Mechanical')
INSERT [dbo].[Mechanisms] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (3, CAST(N'2020-06-30T00:15:20.3585187' AS DateTime2), NULL, 0, 1, N'Automatic')
INSERT [dbo].[Mechanisms] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (4, CAST(N'2020-06-30T00:15:26.5090851' AS DateTime2), CAST(N'2020-06-30T00:16:10.8676034' AS DateTime2), 1, 0, N'Test1')
INSERT [dbo].[Mechanisms] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (5, CAST(N'2020-06-30T21:50:30.4781319' AS DateTime2), CAST(N'2020-06-30T21:51:40.1074741' AS DateTime2), 1, 0, N'update')
SET IDENTITY_INSERT [dbo].[Mechanisms] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderLines] ON 

INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (1, CAST(N'2020-06-30T20:43:12.4737053' AS DateTime2), NULL, 0, 1, N'Blue Marine', 5, CAST(200.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (2, CAST(N'2020-06-30T20:43:12.4737080' AS DateTime2), NULL, 0, 1, N'Sensation', 3, CAST(150.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (3, CAST(N'2020-06-30T21:58:10.4018351' AS DateTime2), NULL, 0, 1, N'Sensation', 1, CAST(150.00 AS Decimal(18, 2)), 2, 2)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (4, CAST(N'2020-07-01T13:54:22.8292806' AS DateTime2), NULL, 0, 1, N'Blue Marine', 2, CAST(200.00 AS Decimal(18, 2)), 3, 1)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (5, CAST(N'2020-07-01T13:54:31.7526687' AS DateTime2), NULL, 0, 1, N'Sensation', 3, CAST(150.00 AS Decimal(18, 2)), 4, 2)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (6, CAST(N'2020-07-01T13:54:36.8668160' AS DateTime2), NULL, 0, 1, N'xShock', 1, CAST(300.00 AS Decimal(18, 2)), 5, 3)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (7, CAST(N'2020-07-01T13:55:08.2242741' AS DateTime2), NULL, 0, 1, N'Wilton 96C143', 6, CAST(124.00 AS Decimal(18, 2)), 6, 9)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (8, CAST(N'2020-07-01T13:55:17.3343014' AS DateTime2), NULL, 0, 1, N'Griffed DZ4519', 1, CAST(232.00 AS Decimal(18, 2)), 7, 12)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (9, CAST(N'2020-07-01T13:55:25.2183126' AS DateTime2), NULL, 0, 1, N'Mr. Daddy 2.0 DZ7422', 3, CAST(412.00 AS Decimal(18, 2)), 8, 14)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (10, CAST(N'2020-07-01T13:55:33.8521256' AS DateTime2), NULL, 0, 1, N'Vintage', 1, CAST(215.00 AS Decimal(18, 2)), 9, 4)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (11, CAST(N'2020-07-01T13:55:49.6467229' AS DateTime2), NULL, 0, 1, N'Flare Rocks DZ5588', 2, CAST(333.00 AS Decimal(18, 2)), 10, 20)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (12, CAST(N'2020-07-01T13:55:58.8134416' AS DateTime2), NULL, 0, 1, N'Stigg DZ1885', 3, CAST(580.00 AS Decimal(18, 2)), 11, 19)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (13, CAST(N'2020-07-01T13:56:06.7022832' AS DateTime2), NULL, 0, 1, N'Precisionist', 9, CAST(232.00 AS Decimal(18, 2)), 12, 7)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (14, CAST(N'2020-07-01T13:56:33.1890637' AS DateTime2), NULL, 0, 1, N'Stigg DZ1885', 2, CAST(580.00 AS Decimal(18, 2)), 13, 19)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (15, CAST(N'2020-07-01T13:56:40.3110748' AS DateTime2), NULL, 0, 1, N'Castilia DZ5591', 1, CAST(255.00 AS Decimal(18, 2)), 14, 16)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (16, CAST(N'2020-07-01T13:57:07.0259616' AS DateTime2), NULL, 0, 1, N'Rasp NSBB DZ1889', 2, CAST(411.00 AS Decimal(18, 2)), 15, 15)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (17, CAST(N'2020-07-01T13:57:10.4666420' AS DateTime2), NULL, 0, 1, N'Crusher DZ1901', 2, CAST(555.00 AS Decimal(18, 2)), 16, 13)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (18, CAST(N'2020-07-01T13:57:17.4644547' AS DateTime2), NULL, 0, 1, N'xShock', 7, CAST(300.00 AS Decimal(18, 2)), 17, 3)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (19, CAST(N'2020-07-01T13:57:26.3455475' AS DateTime2), NULL, 0, 1, N'Regatta 98L265', 1, CAST(121.00 AS Decimal(18, 2)), 18, 8)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (20, CAST(N'2020-07-01T13:57:32.6202868' AS DateTime2), NULL, 0, 1, N'Vintage', 1, CAST(215.00 AS Decimal(18, 2)), 19, 4)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (21, CAST(N'2020-07-01T13:57:40.8487144' AS DateTime2), NULL, 0, 1, N'Wilton 96C143', 2, CAST(124.00 AS Decimal(18, 2)), 20, 9)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (22, CAST(N'2020-07-01T13:57:57.3288119' AS DateTime2), NULL, 0, 1, N'xShock', 2, CAST(300.00 AS Decimal(18, 2)), 21, 3)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (23, CAST(N'2020-07-01T13:58:05.3083173' AS DateTime2), NULL, 0, 1, N'Blue Marine', 1, CAST(200.00 AS Decimal(18, 2)), 22, 1)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (24, CAST(N'2020-07-01T13:58:12.6066069' AS DateTime2), NULL, 0, 1, N'Mega Chief DZ4526', 1, CAST(767.00 AS Decimal(18, 2)), 23, 11)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (25, CAST(N'2020-07-01T13:58:19.0165359' AS DateTime2), NULL, 0, 1, N'Castilia DZ5591', 1, CAST(255.00 AS Decimal(18, 2)), 24, 16)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (26, CAST(N'2020-07-01T13:58:24.7793140' AS DateTime2), NULL, 0, 1, N'Rasp DZ1872', 1, CAST(466.00 AS Decimal(18, 2)), 25, 17)
SET IDENTITY_INSERT [dbo].[OrderLines] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (1, CAST(N'2020-06-30T20:43:12.4734575' AS DateTime2), CAST(N'2020-07-01T00:27:38.1503536' AS DateTime2), 0, 1, CAST(N'2020-07-30T00:00:00.0000000' AS DateTime2), 1, 3, N'Wall street')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (2, CAST(N'2020-06-30T21:58:10.4018065' AS DateTime2), NULL, 0, 1, CAST(N'2020-06-30T19:57:32.7280000' AS DateTime2), 1, 0, N'Zvecka')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (3, CAST(N'2020-07-01T13:54:22.8277733' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (4, CAST(N'2020-07-01T13:54:31.7526607' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (5, CAST(N'2020-07-01T13:54:36.8668074' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (6, CAST(N'2020-07-01T13:55:08.2242675' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (7, CAST(N'2020-07-01T13:55:17.3342318' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (8, CAST(N'2020-07-01T13:55:25.2183038' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (9, CAST(N'2020-07-01T13:55:33.8521021' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (10, CAST(N'2020-07-01T13:55:49.6466978' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (11, CAST(N'2020-07-01T13:55:58.8134212' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (12, CAST(N'2020-07-01T13:56:06.7022566' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (13, CAST(N'2020-07-01T13:56:33.1890567' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (14, CAST(N'2020-07-01T13:56:40.3110675' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (15, CAST(N'2020-07-01T13:57:07.0259567' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (16, CAST(N'2020-07-01T13:57:10.4666309' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (17, CAST(N'2020-07-01T13:57:17.4644501' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (18, CAST(N'2020-07-01T13:57:26.3455431' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (19, CAST(N'2020-07-01T13:57:32.6202820' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (20, CAST(N'2020-07-01T13:57:40.8487078' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (21, CAST(N'2020-07-01T13:57:57.3288072' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (22, CAST(N'2020-07-01T13:58:05.3083118' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (23, CAST(N'2020-07-01T13:58:12.6066021' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (24, CAST(N'2020-07-01T13:58:19.0165324' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (25, CAST(N'2020-07-01T13:58:24.7793100' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-01T11:53:07.6740000' AS DateTime2), 1, 0, N'string')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (1, CAST(N'2020-06-30T15:47:10.7600159' AS DateTime2), CAST(N'2020-07-01T13:58:05.3083190' AS DateTime2), 0, 1, N'Blue Marine', N'Perfect for summer days', 200, 52, 1, 1, 1)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (2, CAST(N'2020-06-30T15:47:50.5110358' AS DateTime2), CAST(N'2020-07-01T13:54:31.7526693' AS DateTime2), 0, 1, N'Sensation', N'Perfect for nights', 150, 4, 2, 2, 2)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (3, CAST(N'2020-06-30T15:52:21.7176588' AS DateTime2), CAST(N'2020-07-01T13:57:57.3288125' AS DateTime2), 0, 1, N'xShock', N'Feeling young', 300, 5, 3, 3, 4)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (4, CAST(N'2020-06-30T15:53:22.7879462' AS DateTime2), CAST(N'2020-07-01T13:57:32.6202875' AS DateTime2), 0, 1, N'Vintage', N'Retro forever', 215, 38, 2, 1, 3)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (5, CAST(N'2020-06-30T15:54:15.9675216' AS DateTime2), CAST(N'2020-06-30T15:54:30.4482160' AS DateTime2), 1, 0, N'Test', N'Test', 100, 40, 2, 1, 3)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (6, CAST(N'2020-07-01T13:30:11.0080406' AS DateTime2), NULL, 0, 1, N'Classic 15s', N'Classic choice', 420, 20, 1, 1, 1)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (7, CAST(N'2020-07-01T13:30:42.6036577' AS DateTime2), CAST(N'2020-07-01T13:56:06.7022937' AS DateTime2), 0, 1, N'Precisionist', N'Perfect gift', 232, 23, 2, 2, 2)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (8, CAST(N'2020-07-01T13:31:32.8983353' AS DateTime2), CAST(N'2020-07-01T13:57:26.3455485' AS DateTime2), 0, 1, N'Regatta 98L265', N'For bussiness look', 121, 33, 3, 2, 8)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (9, CAST(N'2020-07-01T13:34:12.9170762' AS DateTime2), CAST(N'2020-07-01T13:57:40.8487155' AS DateTime2), 0, 1, N'Wilton 96C143', N'', 124, 24, 2, 3, 11)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (10, CAST(N'2020-07-01T13:34:48.9858953' AS DateTime2), NULL, 0, 1, N'Classic 96B310', N'', 764, 33, 3, 4, 12)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (11, CAST(N'2020-07-01T13:35:44.0571314' AS DateTime2), CAST(N'2020-07-01T13:58:12.6066075' AS DateTime2), 0, 1, N'Mega Chief DZ4526', N'', 767, 10, 1, 1, 15)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (12, CAST(N'2020-07-01T13:36:25.4562732' AS DateTime2), CAST(N'2020-07-01T13:55:17.3343336' AS DateTime2), 0, 1, N'Griffed DZ4519', N'', 232, 42, 3, 4, 20)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (13, CAST(N'2020-07-01T13:36:49.8112421' AS DateTime2), CAST(N'2020-07-01T13:57:10.4666448' AS DateTime2), 0, 1, N'Crusher DZ1901', N'', 555, 9, 2, 2, 2)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (14, CAST(N'2020-07-01T13:37:16.8851060' AS DateTime2), CAST(N'2020-07-01T13:55:25.2183135' AS DateTime2), 0, 1, N'Mr. Daddy 2.0 DZ7422', N'', 412, 21, 3, 1, 8)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (15, CAST(N'2020-07-01T13:37:43.6305823' AS DateTime2), CAST(N'2020-07-01T13:57:07.0259626' AS DateTime2), 0, 1, N'Rasp NSBB DZ1889', N'', 411, 33, 3, 2, 16)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (16, CAST(N'2020-07-01T13:38:21.4258302' AS DateTime2), CAST(N'2020-07-01T13:58:19.0165363' AS DateTime2), 0, 1, N'Castilia DZ5591', N'', 255, 9, 3, 3, 19)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (17, CAST(N'2020-07-01T13:38:40.1357802' AS DateTime2), CAST(N'2020-07-01T13:58:24.7793147' AS DateTime2), 0, 1, N'Rasp DZ1872', N'', 466, 33, 3, 3, 17)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (18, CAST(N'2020-07-01T13:39:02.0991089' AS DateTime2), NULL, 0, 1, N'DX1189040', N'', 80, 14, 1, 1, 14)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (19, CAST(N'2020-07-01T13:39:37.4123279' AS DateTime2), CAST(N'2020-07-01T13:56:33.1890645' AS DateTime2), 0, 1, N'Stigg DZ1885', N'', 580, 53, 3, 3, 18)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (20, CAST(N'2020-07-01T13:40:08.9780179' AS DateTime2), CAST(N'2020-07-01T13:55:49.6467237' AS DateTime2), 0, 1, N'Flare Rocks DZ5588', N'', 333, 31, 3, 3, 3)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (21, CAST(N'2020-07-01T13:40:36.9278433' AS DateTime2), NULL, 0, 1, N'Castilia DZ5577', N'', 111, 11, 1, 1, 1)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [MechanismId], [GenderId], [BrandId]) VALUES (22, CAST(N'2020-07-01T13:41:18.3949122' AS DateTime2), NULL, 0, 1, N'Mega Chief DZ4476', N'', 654, 4, 2, 2, 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2020-06-28T19:31:27.7413464' AS DateTime2), N'User Registration', N'{"Username":"Miljana","FirstName":"Miljana","LastName":"Smigic","Password":"sifra1","Email":"miljanasmigic@gmail.com"}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2020-06-28T19:40:16.3459351' AS DateTime2), N'Users search', N'{"Username":null,"FirstName":null,"LastName":null,"PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2020-06-28T19:41:28.0070300' AS DateTime2), N'Users search', N'{"Username":null,"FirstName":null,"LastName":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2020-06-28T19:41:45.6665504' AS DateTime2), N'Users search', N'{"Username":null,"FirstName":null,"LastName":null,"PerPage":1,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2020-06-28T19:41:55.2007236' AS DateTime2), N'Users search', N'{"Username":null,"FirstName":null,"LastName":null,"PerPage":1,"Page":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2020-06-28T19:42:19.2081904' AS DateTime2), N'Get user by Id', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2020-06-28T19:42:34.4006948' AS DateTime2), N'User Information Update', N'{"Id":1,"Email":"miljana@gmail.com","Username":"admin","FirstName":"Miljana","LastName":"Smigic","Password":null}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2020-06-28T19:43:13.4921377' AS DateTime2), N'User Information Update', N'{"Id":1,"Email":"miljana@gmail.com","Username":"admin","FirstName":"Miljana","LastName":"Smigic","Password":"sifra1"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2020-06-28T19:43:43.0344051' AS DateTime2), N'User Information Update', N'{"Id":1,"Email":"miljana@gmail.com","Username":"admin","FirstName":"Miljana","LastName":"Smigic","Password":"sifra1"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2020-06-28T19:43:56.8229520' AS DateTime2), N'User Information Update', N'{"Id":1,"Email":"miljana@gmail.com","Username":"admin","FirstName":"Miljana","LastName":"Smigic","Password":"sifra1"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'2020-06-28T19:44:04.8507021' AS DateTime2), N'User Information Update', N'{"Id":1,"Email":"miljana@gmail.com","Username":"admin","FirstName":"Miljana","LastName":"Smigic","Password":"sifra1"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'2020-06-28T19:52:30.5615993' AS DateTime2), N'User Information Update', N'{"Id":2,"Email":"miljana@gmail.com","Username":"admin","FirstName":"Miljana","LastName":"Smigic","Password":"sifra1"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'2020-06-28T19:52:50.9815610' AS DateTime2), N'User Information Update', N'{"Id":2,"Email":"miljana@gmail.com","Username":"adminsdad","FirstName":"Miljana","LastName":"Smigic","Password":"sifra1"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'2020-06-28T19:53:00.9710411' AS DateTime2), N'Get user by Id', N'2', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'2020-06-28T19:53:08.3701200' AS DateTime2), N'Users search', N'{"Username":null,"FirstName":null,"LastName":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'2020-06-28T19:55:15.9658238' AS DateTime2), N'Change Customer Group By Admin', N'{"Id":2,"GroupId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'2020-06-28T19:57:07.2766781' AS DateTime2), N'Change User Right', N'{"Id":2,"UseCases":[1,2,3,4]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'2020-06-28T19:59:39.3277048' AS DateTime2), N'Change User Right', N'{"Id":2,"UseCases":[1,2,3,4]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'2020-06-28T21:07:52.3874113' AS DateTime2), N'Change User Right', N'{"Id":2,"UseCases":[1,2,3,4]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'2020-06-28T21:08:20.9236027' AS DateTime2), N'Change User Right', N'{"Id":2,"UseCases":[1]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'2020-06-28T21:09:03.6740945' AS DateTime2), N'Change Customer Group By Admin', N'{"Id":2,"GroupId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'2020-06-28T21:10:14.5235046' AS DateTime2), N'Change Customer Group By Admin', N'{"Id":2,"GroupId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'2020-06-28T21:12:47.5762763' AS DateTime2), N'Get user by Id', N'2', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'2020-06-28T21:13:13.8559688' AS DateTime2), N'Get user by Id', N'2', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'2020-06-28T21:13:22.0672088' AS DateTime2), N'User Information Update', N'{"Id":2,"Email":"miljanasmigic@gmail.com","Username":"Miljana","FirstName":"Miljana","LastName":"Smigic","Password":"Promena"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'2020-06-28T21:13:50.6278647' AS DateTime2), N'User Information Update', N'{"Id":2,"Email":"miljanasmigic@gmail.com","Username":"Miljana","FirstName":"Miljana","LastName":"Smigic","Password":null}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'2020-06-28T21:14:18.0900796' AS DateTime2), N'User Information Update', N'{"Id":2,"Email":"miljanasmigic@gmail.com","Username":"Miljana","FirstName":"Miljana","LastName":"Smigic","Password":"sifra1"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'2020-06-28T21:14:31.0379832' AS DateTime2), N'Get user by Id', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'2020-06-28T21:14:52.8075152' AS DateTime2), N'User Information Update', N'{"Id":1,"Email":"miljana@gmail.com","Username":"admin","FirstName":"Miljana","LastName":"Smigiccc","Password":"sifra1"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'2020-06-28T21:15:02.7283791' AS DateTime2), N'User Information Update', N'{"Id":1,"Email":"miljana@gmail.com","Username":"admina","FirstName":"Miljana","LastName":"Smigiccc","Password":"sifra1"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'2020-06-28T21:15:06.4014034' AS DateTime2), N'User Information Update', N'{"Id":1,"Email":"miljana@gmail.com","Username":"admin","FirstName":"Miljana","LastName":"Smigiccc","Password":"sifra1"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'2020-06-28T21:15:50.5736479' AS DateTime2), N'Add User', N'{"Email":"miljana@gmail.com","Username":"adminras","FirstName":"Miljana","LastName":"Smigiccc","Password":"sifra1","GroupId":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'2020-06-28T21:16:14.4044970' AS DateTime2), N'Add User', N'{"Email":"miljana@gmail.com","Username":"adminras","FirstName":"Miljana","LastName":"Smigiccc","Password":"sifra1","GroupId":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'2020-06-28T21:16:21.8581932' AS DateTime2), N'Add User', N'{"Email":"miljana@gmail.com","Username":"adminras","FirstName":"Miljana","LastName":"Smigiccc","Password":"sifra1","GroupId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'2020-06-29T15:11:43.3590073' AS DateTime2), N'Add User', N'{"Email":"miljana@gmail.com","Username":"adminras","FirstName":"Miljana","LastName":"Smigiccc","Password":"sifra1","GroupId":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'2020-06-29T15:12:08.5207307' AS DateTime2), N'Add User', N'{"Email":"miljana@gmail.com","Username":"adminras","FirstName":"Miljana","LastName":"Smigiccc","Password":"sifra1","GroupId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'2020-06-29T16:24:51.2751255' AS DateTime2), N'User Registration', N'{"Username":"adminras","FirstName":"Miljana","LastName":"Smigiccc","Password":"sifra1","Email":"miljana@gmail.com"}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'2020-06-29T16:26:34.5897775' AS DateTime2), N'User Registration', N'{"Username":"adminras","FirstName":"Miljana","LastName":"Smigiccc","Password":"sifra1","Email":"miljana@gmail.com"}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'2020-06-29T16:28:18.8124691' AS DateTime2), N'User Registration', N'{"Username":"miksi","FirstName":"Miljana","LastName":"Smigic","Password":"sifra1","Email":"miljana@gmail.com"}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'2020-06-29T16:28:36.5841025' AS DateTime2), N'User Registration', N'{"Username":"miksi","FirstName":"Miljana","LastName":"Smigic","Password":"sifra1","Email":"miljanasmigic@gmail.com"}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'2020-06-29T16:28:46.7323024' AS DateTime2), N'User Registration', N'{"Username":"miksii","FirstName":"Miljana","LastName":"Smigic","Password":"sifra1","Email":"miljanasmigic@gmail.com"}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'2020-06-29T16:42:52.3159865' AS DateTime2), N'User Registration', N'{"Username":"miksiii","FirstName":"Miljana","LastName":"Smigic","Password":"sifra1","Email":"miljanasmigic@gmail.com"}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'2020-06-29T18:29:03.3868446' AS DateTime2), N'Get all groups.', N'{"Name":null}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'2020-06-29T18:29:45.3191405' AS DateTime2), N'Get all groups.', N'{"Name":null}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'2020-06-29T18:29:54.7511220' AS DateTime2), N'Get one group.', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'2020-06-29T18:31:43.1011747' AS DateTime2), N'Get one group.', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'2020-06-29T18:33:41.1734637' AS DateTime2), N'Get one group.', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (48, CAST(N'2020-06-29T18:34:13.1550424' AS DateTime2), N'Get one group.', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (49, CAST(N'2020-06-29T18:34:17.7838612' AS DateTime2), N'Get one group.', N'2', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (50, CAST(N'2020-06-29T18:34:55.9360617' AS DateTime2), N'Add group.', N'{"Id":0,"Name":"user"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (51, CAST(N'2020-06-29T18:35:12.0303893' AS DateTime2), N'Add group.', N'{"Id":0,"Name":"new group"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (52, CAST(N'2020-06-29T18:35:26.1299363' AS DateTime2), N'Update group.', N'{"Id":3,"Name":"new group"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (53, CAST(N'2020-06-29T18:35:33.6581315' AS DateTime2), N'Update group.', N'{"Id":3,"Name":"user"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (54, CAST(N'2020-06-29T18:35:57.2545168' AS DateTime2), N'Update group.', N'{"Id":3,"Name":"change group"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (55, CAST(N'2020-06-29T18:39:15.2023680' AS DateTime2), N'Get one group.', N'3', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (56, CAST(N'2020-06-29T18:39:22.8616392' AS DateTime2), N'Get one group.', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (57, CAST(N'2020-06-29T18:40:28.0946875' AS DateTime2), N'Get one group.', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (58, CAST(N'2020-06-29T18:40:43.8348230' AS DateTime2), N'Delete group', N'3', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (59, CAST(N'2020-06-29T18:42:49.0783474' AS DateTime2), N'Delete group', N'3', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (60, CAST(N'2020-06-29T18:42:58.6557889' AS DateTime2), N'Delete group', N'3', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (61, CAST(N'2020-06-29T18:43:12.2496687' AS DateTime2), N'Delete group', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (62, CAST(N'2020-06-29T20:09:45.7466620' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (63, CAST(N'2020-06-29T20:11:11.0324674' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (64, CAST(N'2020-06-29T20:11:45.1168703' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Guess"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (65, CAST(N'2020-06-29T20:11:54.7966454' AS DateTime2), N'Get one brand', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (66, CAST(N'2020-06-29T20:12:08.3385112' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Rolex"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (67, CAST(N'2020-06-29T20:12:18.7286422' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Fossil"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (68, CAST(N'2020-06-29T20:12:22.9297001' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (69, CAST(N'2020-06-29T20:12:32.7808079' AS DateTime2), N'Get one brand', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (70, CAST(N'2020-06-29T20:13:02.2595715' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Casio"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (71, CAST(N'2020-06-29T20:13:25.2616200' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Jaguar"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (72, CAST(N'2020-06-29T20:13:34.2807779' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Diesel"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (73, CAST(N'2020-06-29T20:13:38.1466331' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (74, CAST(N'2020-06-29T20:13:53.6721633' AS DateTime2), N'Get one brand', N'6', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (75, CAST(N'2020-06-29T20:14:25.7620763' AS DateTime2), N'Update brand', N'{"Id":6,"Name":"Police"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (76, CAST(N'2020-06-29T20:15:24.7946363' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (77, CAST(N'2020-06-29T20:15:38.2782701' AS DateTime2), N'Update brand', N'{"Id":6,"Name":"Police"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (78, CAST(N'2020-06-29T20:17:14.2461941' AS DateTime2), N'Update brand', N'{"Id":6,"Name":"Police"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (79, CAST(N'2020-06-29T20:18:02.1565316' AS DateTime2), N'Update brand', N'{"Id":6,"Name":"Police"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (80, CAST(N'2020-06-29T20:18:16.2002867' AS DateTime2), N'Update brand', N'{"Id":6,"Name":"Police"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (81, CAST(N'2020-06-29T20:20:50.5225789' AS DateTime2), N'Delete brand', N'6', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (82, CAST(N'2020-06-29T20:20:57.6536428' AS DateTime2), N'Get one brand', N'6', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (83, CAST(N'2020-06-29T20:21:20.8014014' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (84, CAST(N'2020-06-29T21:34:10.0474094' AS DateTime2), N'Get genders', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (85, CAST(N'2020-06-29T21:34:31.3534360' AS DateTime2), N'Add gender', N'{"Id":0,"Name":"Male"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (86, CAST(N'2020-06-29T21:34:37.3113667' AS DateTime2), N'Add gender', N'{"Id":0,"Name":"Female"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (87, CAST(N'2020-06-29T21:34:58.3407823' AS DateTime2), N'Add gender', N'{"Id":0,"Name":"Children"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (88, CAST(N'2020-06-29T21:35:03.0715092' AS DateTime2), N'Add gender', N'{"Id":0,"Name":"Unisex"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (89, CAST(N'2020-06-29T21:35:07.5743832' AS DateTime2), N'Get genders', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (90, CAST(N'2020-06-29T21:35:15.3633571' AS DateTime2), N'Get one gender', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (91, CAST(N'2020-06-29T21:35:18.2409393' AS DateTime2), N'Get genders', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (92, CAST(N'2020-06-29T21:35:35.6431687' AS DateTime2), N'Add gender', N'{"Id":0,"Name":"Test"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (93, CAST(N'2020-06-29T21:35:54.9036832' AS DateTime2), N'Get genders', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (94, CAST(N'2020-06-29T21:36:04.4530002' AS DateTime2), N'Update gender', N'{"Id":5,"Name":"Test1"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (95, CAST(N'2020-06-29T21:36:09.6859442' AS DateTime2), N'Get one gender', N'5', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (96, CAST(N'2020-06-29T21:36:15.3222911' AS DateTime2), N'Delete gender', N'5', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (97, CAST(N'2020-06-29T21:36:19.9493141' AS DateTime2), N'Get genders', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (98, CAST(N'2020-06-29T22:12:57.9678718' AS DateTime2), N'Get mechanisms', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (99, CAST(N'2020-06-29T22:14:52.8178454' AS DateTime2), N'Add mechanism', N'{"Id":0,"Name":"Quartz"}', N'admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (100, CAST(N'2020-06-29T22:15:11.1260786' AS DateTime2), N'Add mechanism', N'{"Id":0,"Name":"Mechanical"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (101, CAST(N'2020-06-29T22:15:20.3509025' AS DateTime2), N'Add mechanism', N'{"Id":0,"Name":"Automatic"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (102, CAST(N'2020-06-29T22:15:26.4924019' AS DateTime2), N'Add mechanism', N'{"Id":0,"Name":"Test"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (103, CAST(N'2020-06-29T22:15:31.1709491' AS DateTime2), N'Get mechanisms', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (104, CAST(N'2020-06-29T22:15:36.8293120' AS DateTime2), N'Get mechanism', N'4', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (105, CAST(N'2020-06-29T22:15:59.3685874' AS DateTime2), N'Update mechanism', N'{"Id":4,"Name":"Test1"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (106, CAST(N'2020-06-29T22:16:03.8313940' AS DateTime2), N'Get mechanism', N'4', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (107, CAST(N'2020-06-29T22:16:10.7707925' AS DateTime2), N'Delete mechanism', N'4', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (108, CAST(N'2020-06-29T22:16:15.9512912' AS DateTime2), N'Get mechanisms', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (109, CAST(N'2020-06-30T10:47:18.0854645' AS DateTime2), N'Get mechanisms', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (110, CAST(N'2020-06-30T10:48:11.3137192' AS DateTime2), N'Get use case logs', N'{"FromDate":null,"ToDate":null,"UseCaseName":null,"Actor":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (111, CAST(N'2020-06-30T10:49:43.3965737' AS DateTime2), N'Get use case logs', N'{"FromDate":null,"ToDate":null,"UseCaseName":null,"Actor":"ano","PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (112, CAST(N'2020-06-30T13:43:16.5004733' AS DateTime2), N'Get products', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"MechanismId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (113, CAST(N'2020-06-30T13:47:10.6382941' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Blue Marine","Description":"Perfect for summer days","Price":200.0,"Quantity":50,"MechanismId":1,"GenderId":1,"BrandId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (114, CAST(N'2020-06-30T13:47:50.4766089' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Sensation","Description":"Perfect for nights","Price":150.0,"Quantity":5,"MechanismId":2,"GenderId":2,"BrandId":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (115, CAST(N'2020-06-30T13:47:52.8016152' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Sensation","Description":"Perfect for nights","Price":150.0,"Quantity":5,"MechanismId":2,"GenderId":2,"BrandId":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (116, CAST(N'2020-06-30T13:49:06.8901159' AS DateTime2), N'Get one gender', N'2', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (117, CAST(N'2020-06-30T13:49:48.0880572' AS DateTime2), N'Get one gender', N'2', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (118, CAST(N'2020-06-30T13:50:03.0139691' AS DateTime2), N'Get genders', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (119, CAST(N'2020-06-30T13:50:12.0542972' AS DateTime2), N'Delete gender', N'2', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (120, CAST(N'2020-06-30T13:50:45.1165038' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (121, CAST(N'2020-06-30T13:51:02.8414774' AS DateTime2), N'Delete brand', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (122, CAST(N'2020-06-30T13:52:21.6816038' AS DateTime2), N'Add product', N'{"Id":0,"Name":"xShock","Description":"Feeling young","Price":300.0,"Quantity":15,"MechanismId":3,"GenderId":3,"BrandId":4}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (123, CAST(N'2020-06-30T13:52:29.4835107' AS DateTime2), N'Get products', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"MechanismId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (124, CAST(N'2020-06-30T13:53:22.7598890' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Vintage","Description":"Retro forever","Price":215.0,"Quantity":50,"MechanismId":2,"GenderId":1,"BrandId":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (125, CAST(N'2020-06-30T13:53:28.7293301' AS DateTime2), N'Get products', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"MechanismId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (126, CAST(N'2020-06-30T13:53:42.0101143' AS DateTime2), N'Update product', N'{"Id":4,"Name":"Vintage","Description":"Retro forever","Price":215.0,"Quantity":40,"MechanismId":2,"GenderId":1,"BrandId":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (127, CAST(N'2020-06-30T13:53:46.6272456' AS DateTime2), N'Get product', N'4', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (128, CAST(N'2020-06-30T13:54:15.9574878' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Test","Description":"Test","Price":100.0,"Quantity":40,"MechanismId":2,"GenderId":1,"BrandId":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (129, CAST(N'2020-06-30T13:54:20.3440167' AS DateTime2), N'Get products', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"MechanismId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (130, CAST(N'2020-06-30T13:54:30.3963388' AS DateTime2), N'Delete product', N'5', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (131, CAST(N'2020-06-30T13:54:33.9200329' AS DateTime2), N'Get product', N'5', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (132, CAST(N'2020-06-30T13:54:45.1480691' AS DateTime2), N'Get products', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"MechanismId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (133, CAST(N'2020-06-30T14:06:02.7107542' AS DateTime2), N'Get products', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"MechanismId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (134, CAST(N'2020-06-30T18:38:01.9609346' AS DateTime2), N'Get products', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"MechanismId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (135, CAST(N'2020-06-30T18:38:14.2139340' AS DateTime2), N'Get orders', N'{"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (136, CAST(N'2020-06-30T18:38:27.7884182' AS DateTime2), N'Get products', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"MechanismId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (137, CAST(N'2020-06-30T18:42:12.8566206' AS DateTime2), N'Add order', N'{"OrderDate":"2020-06-30T00:00:00","Address":"Wall street","Items":[{"ProductId":1,"Quantity":5},{"ProductId":1,"Quantity":5}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (138, CAST(N'2020-06-30T18:42:35.0678107' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-30T00:00:00","Address":"Wall street","Items":[{"ProductId":1,"Quantity":5},{"ProductId":1,"Quantity":5}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (139, CAST(N'2020-06-30T18:43:00.1011042' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-30T00:00:00","Address":"Wall street","Items":[{"ProductId":1,"Quantity":5},{"ProductId":2,"Quantity":15}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (140, CAST(N'2020-06-30T18:43:12.3807118' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-30T00:00:00","Address":"Wall street","Items":[{"ProductId":1,"Quantity":5},{"ProductId":2,"Quantity":3}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (141, CAST(N'2020-06-30T18:43:20.7996696' AS DateTime2), N'Get orders', N'{"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (142, CAST(N'2020-06-30T18:43:37.2553357' AS DateTime2), N'Get order', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (143, CAST(N'2020-06-30T18:45:16.1424532' AS DateTime2), N'Change status', N'{"OrderId":1,"Status":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (144, CAST(N'2020-06-30T18:45:44.8140573' AS DateTime2), N'Get order', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (145, CAST(N'2020-06-30T18:46:57.7382903' AS DateTime2), N'Change status', N'{"OrderId":1,"Status":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (146, CAST(N'2020-06-30T18:47:04.8676922' AS DateTime2), N'Get order', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (147, CAST(N'2020-06-30T18:51:31.5160110' AS DateTime2), N'Change status', N'{"OrderId":1,"Status":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (148, CAST(N'2020-06-30T18:51:40.6782355' AS DateTime2), N'Change status', N'{"OrderId":1,"Status":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (149, CAST(N'2020-06-30T18:52:02.1578307' AS DateTime2), N'Change status', N'{"OrderId":1,"Status":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (150, CAST(N'2020-06-30T18:52:56.4393325' AS DateTime2), N'Change status', N'{"OrderId":1,"Status":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (151, CAST(N'2020-06-30T18:53:06.9940074' AS DateTime2), N'Change status', N'{"OrderId":1,"Status":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (152, CAST(N'2020-06-30T18:54:34.7540854' AS DateTime2), N'Change status', N'{"OrderId":1,"Status":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (153, CAST(N'2020-06-30T19:13:01.9750494' AS DateTime2), N'Change order status', N'{"OrderId":1,"Status":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (154, CAST(N'2020-06-30T19:16:24.6315832' AS DateTime2), N'Change order status', N'{"OrderId":1,"Status":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (155, CAST(N'2020-06-30T19:16:35.9502099' AS DateTime2), N'Change order status', N'{"OrderId":1,"Status":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (156, CAST(N'2020-06-30T19:17:00.3338781' AS DateTime2), N'Change order status', N'{"OrderId":1,"Status":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (157, CAST(N'2020-06-30T19:17:15.6905116' AS DateTime2), N'Change order status', N'{"OrderId":2,"Status":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (158, CAST(N'2020-06-30T19:18:59.3250062' AS DateTime2), N'Get orders', N'{"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (159, CAST(N'2020-06-30T19:33:06.1722746' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (160, CAST(N'2020-06-30T19:34:35.3016841' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (161, CAST(N'2020-06-30T19:35:19.8181463' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (162, CAST(N'2020-06-30T19:37:15.4539425' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (163, CAST(N'2020-06-30T19:37:35.7201134' AS DateTime2), N'Get brands.', N'{"Name":"1","PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (164, CAST(N'2020-06-30T19:38:30.7358315' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (165, CAST(N'2020-06-30T19:39:03.1243681' AS DateTime2), N'Add brand', N'{"Id":6,"Name":"Test"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (166, CAST(N'2020-06-30T19:39:13.6354154' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (167, CAST(N'2020-06-30T19:39:32.1482822' AS DateTime2), N'Get one brand', N'2', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (168, CAST(N'2020-06-30T19:39:54.7568541' AS DateTime2), N'Update brand', N'{"Id":7,"Name":"Test1"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (169, CAST(N'2020-06-30T19:41:11.7206814' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (170, CAST(N'2020-06-30T19:42:21.2555447' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (171, CAST(N'2020-06-30T19:42:33.0304175' AS DateTime2), N'Delete brand', N'8', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (172, CAST(N'2020-06-30T19:42:40.1091397' AS DateTime2), N'Delete brand', N'7', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (173, CAST(N'2020-06-30T19:42:57.9567364' AS DateTime2), N'Get genders', N'{"Name":null,"PerPage":1,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (174, CAST(N'2020-06-30T19:43:04.3735851' AS DateTime2), N'Get genders', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (175, CAST(N'2020-06-30T19:43:43.0217829' AS DateTime2), N'Add gender', N'{"Id":0,"Name":"Test"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (176, CAST(N'2020-06-30T19:43:49.2688988' AS DateTime2), N'Get genders', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (177, CAST(N'2020-06-30T19:44:19.1379501' AS DateTime2), N'Add gender', N'{"Id":0,"Name":"Test"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (178, CAST(N'2020-06-30T19:44:38.7108584' AS DateTime2), N'Get one gender', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (179, CAST(N'2020-06-30T19:44:40.1192054' AS DateTime2), N'Get one gender', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (180, CAST(N'2020-06-30T19:44:48.0871472' AS DateTime2), N'Get one gender', N'18', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (181, CAST(N'2020-06-30T19:45:05.0415943' AS DateTime2), N'Get one gender', N'0', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (182, CAST(N'2020-06-30T19:45:33.3236346' AS DateTime2), N'Update gender', N'{"Id":6,"Name":"UpdateTest"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (183, CAST(N'2020-06-30T19:45:52.3604246' AS DateTime2), N'Add gender', N'{"Id":0,"Name":"Test"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (184, CAST(N'2020-06-30T19:46:05.8931691' AS DateTime2), N'Get genders', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (185, CAST(N'2020-06-30T19:46:38.2036335' AS DateTime2), N'Update gender', N'{"Id":6,"Name":"UpdateTest"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (186, CAST(N'2020-06-30T19:46:50.5609091' AS DateTime2), N'Get genders', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (187, CAST(N'2020-06-30T19:47:08.1586165' AS DateTime2), N'Delete gender', N'7', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (188, CAST(N'2020-06-30T19:47:11.9736734' AS DateTime2), N'Delete gender', N'7', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (189, CAST(N'2020-06-30T19:47:35.0125281' AS DateTime2), N'Get all groups.', N'{"Name":null}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (190, CAST(N'2020-06-30T19:47:49.2966497' AS DateTime2), N'Get all groups.', N'{"Name":"User"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (191, CAST(N'2020-06-30T19:48:31.8333340' AS DateTime2), N'Add group.', N'{"Id":0,"Name":"string"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (192, CAST(N'2020-06-30T19:48:43.6474456' AS DateTime2), N'Get all groups.', N'{"Name":null}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (193, CAST(N'2020-06-30T19:48:55.9056675' AS DateTime2), N'Get one group.', N'4', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (194, CAST(N'2020-06-30T19:49:01.7697538' AS DateTime2), N'Get one group.', N'5', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (195, CAST(N'2020-06-30T19:49:33.4223171' AS DateTime2), N'Update group.', N'{"Id":4,"Name":"update"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (196, CAST(N'2020-06-30T19:49:43.8530546' AS DateTime2), N'Get all groups.', N'{"Name":null}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (197, CAST(N'2020-06-30T19:49:53.6544835' AS DateTime2), N'Delete group', N'4', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (198, CAST(N'2020-06-30T19:50:04.1549051' AS DateTime2), N'Get all groups.', N'{"Name":null}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (199, CAST(N'2020-06-30T19:50:17.0474525' AS DateTime2), N'Get mechanisms', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (200, CAST(N'2020-06-30T19:50:30.4548428' AS DateTime2), N'Add mechanism', N'{"Id":0,"Name":"string"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (201, CAST(N'2020-06-30T19:50:38.2058798' AS DateTime2), N'Get mechanisms', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (202, CAST(N'2020-06-30T19:50:48.6047815' AS DateTime2), N'Get mechanism', N'5', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (203, CAST(N'2020-06-30T19:51:01.2748844' AS DateTime2), N'Update mechanism', N'{"Id":5,"Name":"update"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (204, CAST(N'2020-06-30T19:51:24.2651396' AS DateTime2), N'Get mechanisms', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (205, CAST(N'2020-06-30T19:51:33.6202395' AS DateTime2), N'Delete mechanism', N'54', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (206, CAST(N'2020-06-30T19:51:40.0976740' AS DateTime2), N'Delete mechanism', N'5', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (207, CAST(N'2020-06-30T19:51:46.8631920' AS DateTime2), N'Get mechanisms', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (208, CAST(N'2020-06-30T19:51:55.2804567' AS DateTime2), N'Get orders', N'{"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (209, CAST(N'2020-06-30T19:53:47.9565215' AS DateTime2), N'Get order', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (210, CAST(N'2020-06-30T19:57:59.9835548' AS DateTime2), N'Add order', N'{"OrderDate":"2020-06-30T19:57:32.728Z","Address":"Zvecka","Items":[{"ProductId":2,"Quantity":10}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (211, CAST(N'2020-06-30T19:58:10.3328859' AS DateTime2), N'Add order', N'{"OrderDate":"2020-06-30T19:57:32.728Z","Address":"Zvecka","Items":[{"ProductId":2,"Quantity":1}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (212, CAST(N'2020-06-30T19:58:20.6563195' AS DateTime2), N'Get orders', N'{"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (213, CAST(N'2020-06-30T19:59:07.5437664' AS DateTime2), N'Change order status', N'{"OrderId":1,"Status":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (214, CAST(N'2020-06-30T19:59:16.0551727' AS DateTime2), N'Get orders', N'{"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (215, CAST(N'2020-06-30T19:59:27.7341195' AS DateTime2), N'Change order status', N'{"OrderId":1,"Status":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (216, CAST(N'2020-06-30T21:35:58.6185692' AS DateTime2), N'Get brands.', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (217, CAST(N'2020-06-30T22:18:18.6513296' AS DateTime2), N'Get brands', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (218, CAST(N'2020-06-30T22:19:44.9189173' AS DateTime2), N'Add user', N'{"Email":"string@sa.com","Username":"sdadsad","FirstName":"dsadad","LastName":"dsadasdas","Password":"dsadadas","GroupId":2}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (219, CAST(N'2020-06-30T22:20:21.5753626' AS DateTime2), N'Add user', N'{"Email":"string@sa.com","Username":"sdadsad","FirstName":"dsadad","LastName":"dsadasdas","Password":"dsadadas","GroupId":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (220, CAST(N'2020-06-30T22:20:24.6718259' AS DateTime2), N'Add user', N'{"Email":"string@sa.com","Username":"sdadsad","FirstName":"dsadad","LastName":"dsadasdas","Password":"dsadadas","GroupId":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (221, CAST(N'2020-06-30T22:20:43.2024052' AS DateTime2), N'Get users', N'{"Username":null,"FirstName":null,"LastName":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (222, CAST(N'2020-06-30T22:21:00.7522568' AS DateTime2), N'Get user', N'7', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (223, CAST(N'2020-06-30T22:21:24.8112337' AS DateTime2), N'User information update', N'{"Id":7,"Email":"string@gmail.com","Username":"string","FirstName":"string","LastName":"string","Password":"string"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (224, CAST(N'2020-06-30T22:22:12.6591469' AS DateTime2), N'Change user right', N'{"Id":2,"UseCases":[0]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (225, CAST(N'2020-06-30T22:22:29.8473198' AS DateTime2), N'Change user right', N'{"Id":2,"UseCases":[1,2]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (226, CAST(N'2020-06-30T22:22:49.1806079' AS DateTime2), N'Change user right', N'{"Id":7,"UseCases":[1,2]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (227, CAST(N'2020-06-30T22:23:08.5439006' AS DateTime2), N'Get products', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"MechanismId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (228, CAST(N'2020-06-30T22:25:41.2773159' AS DateTime2), N'Get orders', N'{"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (229, CAST(N'2020-06-30T22:26:00.5353731' AS DateTime2), N'Change order status', N'{"OrderId":1,"Status":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (230, CAST(N'2020-06-30T22:27:17.2217111' AS DateTime2), N'Change order status', N'{"OrderId":1,"Status":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (231, CAST(N'2020-06-30T22:27:25.5044270' AS DateTime2), N'Change order status', N'{"OrderId":1,"Status":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (232, CAST(N'2020-06-30T22:27:34.5626238' AS DateTime2), N'Change order status', N'{"OrderId":1,"Status":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (233, CAST(N'2020-06-30T22:27:38.1362771' AS DateTime2), N'Change order status', N'{"OrderId":1,"Status":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (234, CAST(N'2020-07-01T11:09:13.5103064' AS DateTime2), N'Get brands', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (235, CAST(N'2020-07-01T11:11:18.3368898' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Skagen"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (236, CAST(N'2020-07-01T11:11:27.5062755' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"DKNY"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (237, CAST(N'2020-07-01T11:11:37.8239436' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Emporio Armani"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (238, CAST(N'2020-07-01T11:11:49.4669687' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Michael Kors"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (239, CAST(N'2020-07-01T11:12:00.0406695' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Sector"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (240, CAST(N'2020-07-01T11:12:06.4845558' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Festina"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (241, CAST(N'2020-07-01T11:12:19.0084762' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Bulova"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (242, CAST(N'2020-07-01T11:12:27.5882143' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Bulova"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (243, CAST(N'2020-07-01T11:12:37.2001892' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Samsung"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (244, CAST(N'2020-07-01T11:12:41.4410753' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Fortis"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (245, CAST(N'2020-07-01T11:12:55.2480730' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Just Cavalli"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (246, CAST(N'2020-07-01T11:13:07.3657877' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Calypso"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (247, CAST(N'2020-07-01T11:13:13.7877331' AS DateTime2), N'Get brands', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (248, CAST(N'2020-07-01T11:14:17.0998888' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Xeric"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (249, CAST(N'2020-07-01T11:14:29.9939791' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Bertucci"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (250, CAST(N'2020-07-01T11:14:34.0944662' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Ballast"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (251, CAST(N'2020-07-01T11:14:47.4026195' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Devon"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (252, CAST(N'2020-07-01T11:15:06.6584021' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Detrol"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (253, CAST(N'2020-07-01T11:15:23.7467119' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"G-shock"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (254, CAST(N'2020-07-01T11:15:35.8543787' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Nava"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (255, CAST(N'2020-07-01T11:15:41.2811131' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"Mr. Jones"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (256, CAST(N'2020-07-01T11:15:58.3044695' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"One eleven"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (257, CAST(N'2020-07-01T11:17:06.0079614' AS DateTime2), N'Get brands', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (258, CAST(N'2020-07-01T11:17:25.4244926' AS DateTime2), N'Get genders', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (259, CAST(N'2020-07-01T11:17:46.5909782' AS DateTime2), N'Delete gender', N'6', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (260, CAST(N'2020-07-01T11:17:54.8128361' AS DateTime2), N'Get genders', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (261, CAST(N'2020-07-01T11:18:12.2019903' AS DateTime2), N'Get groups', N'{"Name":null}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (262, CAST(N'2020-07-01T11:18:25.8046001' AS DateTime2), N'Get mechanisms', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (263, CAST(N'2020-07-01T11:30:10.8750666' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Classic 15s","Description":"Classic choice","Price":420.0,"Quantity":20,"MechanismId":1,"GenderId":1,"BrandId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (264, CAST(N'2020-07-01T11:30:42.5622635' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Precisionist","Description":"Perfect gift","Price":232.0,"Quantity":32,"MechanismId":2,"GenderId":2,"BrandId":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (265, CAST(N'2020-07-01T11:31:32.8843935' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Regatta 98L265","Description":"For bussiness look","Price":121.0,"Quantity":34,"MechanismId":3,"GenderId":2,"BrandId":8}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (266, CAST(N'2020-07-01T11:31:47.8957897' AS DateTime2), N'Get products', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"MechanismId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (267, CAST(N'2020-07-01T11:32:26.6420951' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Wilton 96C143","Description":"","Price":124.0,"Quantity":32,"MechanismId":2,"GenderId":3,"BrandId":6}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (268, CAST(N'2020-07-01T11:33:03.9473606' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Wilton 96C143","Description":"","Price":124.0,"Quantity":32,"MechanismId":2,"GenderId":3,"BrandId":6}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (269, CAST(N'2020-07-01T11:33:26.0869935' AS DateTime2), N'Add brand', N'{"Id":0,"Name":"One eleven"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (270, CAST(N'2020-07-01T11:33:40.1535541' AS DateTime2), N'Get brands', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (271, CAST(N'2020-07-01T11:34:12.8947810' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Wilton 96C143","Description":"","Price":124.0,"Quantity":32,"MechanismId":2,"GenderId":3,"BrandId":11}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (272, CAST(N'2020-07-01T11:34:48.9818326' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Classic 96B310","Description":"","Price":764.0,"Quantity":33,"MechanismId":3,"GenderId":4,"BrandId":12}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (273, CAST(N'2020-07-01T11:35:44.0425458' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Mega Chief DZ4526","Description":"","Price":767.0,"Quantity":11,"MechanismId":1,"GenderId":1,"BrandId":15}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (274, CAST(N'2020-07-01T11:36:25.4422385' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Griffed DZ4519","Description":"","Price":232.0,"Quantity":43,"MechanismId":3,"GenderId":4,"BrandId":20}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (275, CAST(N'2020-07-01T11:36:49.8000387' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Crusher DZ1901","Description":"","Price":555.0,"Quantity":11,"MechanismId":2,"GenderId":2,"BrandId":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (276, CAST(N'2020-07-01T11:37:16.8653938' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Mr. Daddy 2.0 DZ7422","Description":"","Price":412.0,"Quantity":24,"MechanismId":3,"GenderId":1,"BrandId":8}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (277, CAST(N'2020-07-01T11:37:43.6208871' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Rasp NSBB DZ1889","Description":"","Price":411.0,"Quantity":35,"MechanismId":3,"GenderId":2,"BrandId":16}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (278, CAST(N'2020-07-01T11:37:51.6766223' AS DateTime2), N'Get products', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"MechanismId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (279, CAST(N'2020-07-01T11:38:21.4046427' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Castilia DZ5591","Description":"","Price":255.0,"Quantity":11,"MechanismId":3,"GenderId":3,"BrandId":19}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (280, CAST(N'2020-07-01T11:38:40.1253654' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Rasp DZ1872","Description":"","Price":466.0,"Quantity":34,"MechanismId":3,"GenderId":3,"BrandId":17}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (281, CAST(N'2020-07-01T11:39:02.0961437' AS DateTime2), N'Add product', N'{"Id":0,"Name":"DX1189040","Description":"","Price":80.0,"Quantity":14,"MechanismId":1,"GenderId":1,"BrandId":14}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (282, CAST(N'2020-07-01T11:39:37.3921671' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Stigg DZ1885","Description":"","Price":580.0,"Quantity":58,"MechanismId":3,"GenderId":3,"BrandId":18}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (283, CAST(N'2020-07-01T11:40:08.9736932' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Flare Rocks DZ5588","Description":"","Price":333.0,"Quantity":33,"MechanismId":3,"GenderId":3,"BrandId":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (284, CAST(N'2020-07-01T11:40:36.9094392' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Castilia DZ5577","Description":"","Price":111.0,"Quantity":11,"MechanismId":1,"GenderId":1,"BrandId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (285, CAST(N'2020-07-01T11:41:18.3816070' AS DateTime2), N'Add product', N'{"Id":0,"Name":"Mega Chief DZ4476","Description":"","Price":654.0,"Quantity":4,"MechanismId":2,"GenderId":2,"BrandId":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (286, CAST(N'2020-07-01T11:41:23.9797613' AS DateTime2), N'Get products', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"MechanismId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (287, CAST(N'2020-07-01T11:52:26.6356546' AS DateTime2), N'Get orders', N'{"UserId":null,"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (288, CAST(N'2020-07-01T11:54:22.6763923' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":1,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (289, CAST(N'2020-07-01T11:54:31.7406828' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":2,"Quantity":3}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (290, CAST(N'2020-07-01T11:54:36.8492969' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":3,"Quantity":1}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (291, CAST(N'2020-07-01T11:54:43.6943531' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":5,"Quantity":6}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (292, CAST(N'2020-07-01T11:55:08.2062195' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":9,"Quantity":6}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (293, CAST(N'2020-07-01T11:55:17.3049310' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":12,"Quantity":1}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (294, CAST(N'2020-07-01T11:55:25.2006425' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":14,"Quantity":3}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (295, CAST(N'2020-07-01T11:55:33.8346910' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":4,"Quantity":1}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (296, CAST(N'2020-07-01T11:55:49.6261380' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":20,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (297, CAST(N'2020-07-01T11:55:58.7911733' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":19,"Quantity":3}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (298, CAST(N'2020-07-01T11:56:06.6848463' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":7,"Quantity":9}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (299, CAST(N'2020-07-01T11:56:20.9441419' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":19,"Quantity":0}]}', N'admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (300, CAST(N'2020-07-01T11:56:33.1721730' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":19,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (301, CAST(N'2020-07-01T11:56:40.2952745' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":16,"Quantity":1}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (302, CAST(N'2020-07-01T11:56:47.8373236' AS DateTime2), N'Get orders', N'{"UserId":null,"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (303, CAST(N'2020-07-01T11:57:07.0059715' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":15,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (304, CAST(N'2020-07-01T11:57:10.4521168' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":13,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (305, CAST(N'2020-07-01T11:57:17.4500112' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":3,"Quantity":7}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (306, CAST(N'2020-07-01T11:57:26.3329423' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":8,"Quantity":1}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (307, CAST(N'2020-07-01T11:57:32.6069702' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":4,"Quantity":1}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (308, CAST(N'2020-07-01T11:57:40.8350666' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":9,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (309, CAST(N'2020-07-01T11:57:57.3097240' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":3,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (310, CAST(N'2020-07-01T11:58:05.2911141' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":1,"Quantity":1}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (311, CAST(N'2020-07-01T11:58:12.5925919' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":11,"Quantity":1}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (312, CAST(N'2020-07-01T11:58:19.0059983' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":16,"Quantity":1}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (313, CAST(N'2020-07-01T11:58:24.7670570' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-01T11:53:07.674Z","Address":"string","Items":[{"ProductId":17,"Quantity":1}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (314, CAST(N'2020-07-01T11:58:27.5448757' AS DateTime2), N'Get orders', N'{"UserId":null,"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCases] ON 

INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (1, N'Users Search', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (2, N'Get User by id', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (3, N'Delete User', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (4, N'Add user', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (5, N'update user information', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (6, N'admin update group', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (7, N'user rights', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (8, N'Registration', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (9, N'Get group', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (10, N'Get groups', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (11, N'Delete group', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (12, N'Add group', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (13, N'Update group', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (14, N'Get brands', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (15, N'Get brand', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (16, N'Delete brand', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (17, N'Add brand', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (20, N'Update brand', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (21, N'Get genders', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (22, N'Get gender', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (23, N'Delete gender', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (24, N'Add gender', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (25, N'Update gender', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (26, N'Get mechanisms', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (27, N'Get mechanism', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (28, N'Delete mechanisim', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (29, N'Add mechanism', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (30, N'Update mechanism', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (31, N'Get use case logs', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (32, N'Get products', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (33, N'Get product', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (34, N'Delete product', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (35, N'Add product', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (36, N'Update product', 1)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (37, N'Get orders', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (38, N'Get order', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (39, N'Add order', 0)
INSERT [dbo].[UseCases] ([Id], [Name], [AdminCase]) VALUES (40, N'Change order status', 1)
SET IDENTITY_INSERT [dbo].[UseCases] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Email], [Password], [GroupId]) VALUES (1, CAST(N'2020-06-28T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-28T23:15:06.4108791' AS DateTime2), 0, 1, N'admin', N'Miljana', N'Smigiccc', N'miljana@gmail.com', N'sifra1', 1)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Email], [Password], [GroupId]) VALUES (2, CAST(N'2020-06-28T21:31:29.7860941' AS DateTime2), NULL, 0, 1, N'Miljana', N'Miljana', N'Smigic', N'miljanasmigic@gmail.com', N'sifra1', 1)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Email], [Password], [GroupId]) VALUES (3, CAST(N'2020-06-28T23:16:14.4608150' AS DateTime2), NULL, 0, 1, N'adminras', N'Miljana', N'Smigiccc', N'miljana@gmail.com', N'sifra1', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Email], [Password], [GroupId]) VALUES (4, CAST(N'2020-06-29T18:28:18.8762158' AS DateTime2), NULL, 0, 1, N'miksi', N'Miljana', N'Smigic', N'miljana@gmail.com', N'sifra1', 1)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Email], [Password], [GroupId]) VALUES (5, CAST(N'2020-06-29T18:28:46.7517347' AS DateTime2), NULL, 0, 1, N'miksii', N'Miljana', N'Smigic', N'miljanasmigic@gmail.com', N'sifra1', 1)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Email], [Password], [GroupId]) VALUES (6, CAST(N'2020-06-29T18:42:54.1639491' AS DateTime2), NULL, 0, 1, N'miksiii', N'Miljana', N'Smigic', N'miljanasmigic@gmail.com', N'sifra1', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Email], [Password], [GroupId]) VALUES (7, CAST(N'2020-07-01T00:20:21.6492429' AS DateTime2), NULL, 0, 1, N'sdadsad', N'dsadad', N'dsadasdas', N'string@sa.com', N'dsadadas', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUserCase] ON 

INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (1, 1, 1)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (2, 1, 2)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (3, 1, 3)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (4, 1, 4)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (5, 1, 5)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (6, 1, 6)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (7, 1, 7)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (38, 3, 1)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (39, 3, 2)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (40, 3, 5)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (41, 6, 1)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (42, 6, 2)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (43, 6, 5)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (46, 1, 8)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (47, 1, 9)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (48, 1, 10)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (49, 1, 11)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (50, 1, 12)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (51, 1, 13)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (53, 1, 14)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (54, 1, 15)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (55, 1, 16)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (56, 1, 17)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (57, 1, 20)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (58, 1, 21)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (59, 1, 22)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (60, 1, 23)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (61, 1, 24)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (62, 1, 25)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (63, 1, 26)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (64, 1, 27)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (65, 1, 28)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (66, 1, 29)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (67, 1, 30)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (68, 1, 31)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (69, 1, 32)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (70, 1, 33)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (71, 1, 34)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (72, 1, 35)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (73, 1, 36)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (74, 1, 37)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (75, 1, 38)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (76, 1, 39)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (77, 1, 40)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (102, 2, 1)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (103, 2, 2)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (104, 7, 2)
INSERT [dbo].[UserUserCase] ([Id], [UserId], [UseCaseId]) VALUES (105, 7, 1)
SET IDENTITY_INSERT [dbo].[UserUserCase] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Brands_Name]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Brands_Name] ON [dbo].[Brands]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Genders_Name]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Genders_Name] ON [dbo].[Genders]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Groups_Name]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Groups_Name] ON [dbo].[Groups]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Mechanisms_Name]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Mechanisms_Name] ON [dbo].[Mechanisms]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_OrderId]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_OrderId] ON [dbo].[OrderLines]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_ProductId]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_ProductId] ON [dbo].[OrderLines]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_BrandId]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE NONCLUSTERED INDEX [IX_Products_BrandId] ON [dbo].[Products]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_GenderId]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE NONCLUSTERED INDEX [IX_Products_GenderId] ON [dbo].[Products]
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_MechanismId]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE NONCLUSTERED INDEX [IX_Products_MechanismId] ON [dbo].[Products]
(
	[MechanismId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_Name]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Products_Name] ON [dbo].[Products]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UseCases_Name]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UseCases_Name] ON [dbo].[UseCases]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_GroupId]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE NONCLUSTERED INDEX [IX_Users_GroupId] ON [dbo].[Users]
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUserCase_UseCaseId]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE NONCLUSTERED INDEX [IX_UserUserCase_UseCaseId] ON [dbo].[UserUserCase]
(
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUserCase_UserId]    Script Date: 01-Jul-20 14:13:37 ******/
CREATE NONCLUSTERED INDEX [IX_UserUserCase_UserId] ON [dbo].[UserUserCase]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [OrderStatus]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Genders_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Genders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Genders_GenderId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Mechanisms_MechanismId] FOREIGN KEY([MechanismId])
REFERENCES [dbo].[Mechanisms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Mechanisms_MechanismId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Groups_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Groups_GroupId]
GO
ALTER TABLE [dbo].[UserUserCase]  WITH CHECK ADD  CONSTRAINT [FK_UserUserCase_UseCases_UseCaseId] FOREIGN KEY([UseCaseId])
REFERENCES [dbo].[UseCases] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUserCase] CHECK CONSTRAINT [FK_UserUserCase_UseCases_UseCaseId]
GO
ALTER TABLE [dbo].[UserUserCase]  WITH CHECK ADD  CONSTRAINT [FK_UserUserCase_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUserCase] CHECK CONSTRAINT [FK_UserUserCase_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [WatchShop] SET  READ_WRITE 
GO
