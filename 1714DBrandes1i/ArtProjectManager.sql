USE [master]
GO
/****** Object:  Database [ArtProjectManager]    Script Date: 10/1/2018 8:24:02 PM ******/
CREATE DATABASE [ArtProjectManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ArtProjectManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ArtProjectManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ArtProjectManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ArtProjectManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ArtProjectManager] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ArtProjectManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ArtProjectManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ArtProjectManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ArtProjectManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ArtProjectManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ArtProjectManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [ArtProjectManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ArtProjectManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ArtProjectManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ArtProjectManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ArtProjectManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ArtProjectManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ArtProjectManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ArtProjectManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ArtProjectManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ArtProjectManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ArtProjectManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ArtProjectManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ArtProjectManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ArtProjectManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ArtProjectManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ArtProjectManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ArtProjectManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ArtProjectManager] SET RECOVERY FULL 
GO
ALTER DATABASE [ArtProjectManager] SET  MULTI_USER 
GO
ALTER DATABASE [ArtProjectManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ArtProjectManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ArtProjectManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ArtProjectManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ArtProjectManager] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ArtProjectManager', N'ON'
GO
ALTER DATABASE [ArtProjectManager] SET QUERY_STORE = OFF
GO
USE [ArtProjectManager]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ArtProjectManager]
GO
/****** Object:  Table [dbo].[Artists]    Script Date: 10/1/2018 8:24:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artists](
	[ArtistId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[ArtType] [nvarchar](50) NOT NULL,
	[MonthlyProductionRate] [int] NOT NULL,
 CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 10/1/2018 8:24:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectInfo]    Script Date: 10/1/2018 8:24:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectInfo](
	[ProjectId] [int] NOT NULL,
	[InStockInventory] [int] NOT NULL,
	[CreationCost] [smallmoney] NOT NULL,
	[ArtType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectInfo] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectStatus]    Script Date: 10/1/2018 8:24:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectStatus](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[ArtType] [nvarchar](50) NOT NULL,
	[ProductionStatus] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectStatus] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectSupplyInfo]    Script Date: 10/1/2018 8:24:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectSupplyInfo](
	[ProjectSupplyId] [int] IDENTITY(1,1) NOT NULL,
	[ArtType] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[InventoryOnHand] [int] NOT NULL,
 CONSTRAINT [PK_ProjectSupplyInfo] PRIMARY KEY CLUSTERED 
(
	[ProjectSupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Artists] ON 

INSERT [dbo].[Artists] ([ArtistId], [PersonId], [ArtType], [MonthlyProductionRate]) VALUES (2, 1, N'Paint', 4)
INSERT [dbo].[Artists] ([ArtistId], [PersonId], [ArtType], [MonthlyProductionRate]) VALUES (3, 2, N'Sculpt', 10)
INSERT [dbo].[Artists] ([ArtistId], [PersonId], [ArtType], [MonthlyProductionRate]) VALUES (4, 3, N'Knit', 2)
SET IDENTITY_INSERT [dbo].[Artists] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Position]) VALUES (1, N'Joy', N'Smith', N'Artist')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Position]) VALUES (2, N'Nancy', N'Gibbons', N'Artist')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Position]) VALUES (3, N'Sara', N'Johnson', N'Artist')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Position]) VALUES (4, N'Kathy', N'Michaels', N'Finance Manager')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Position]) VALUES (5, N'Mary', N'Holmes', N'Project Manager')
SET IDENTITY_INSERT [dbo].[Person] OFF
INSERT [dbo].[ProjectInfo] ([ProjectId], [InStockInventory], [CreationCost], [ArtType]) VALUES (1, 0, 20.0000, N'Paint')
INSERT [dbo].[ProjectInfo] ([ProjectId], [InStockInventory], [CreationCost], [ArtType]) VALUES (2, 0, 35.0000, N'Sculpt')
INSERT [dbo].[ProjectInfo] ([ProjectId], [InStockInventory], [CreationCost], [ArtType]) VALUES (3, 0, 15.0000, N'Knit')
SET IDENTITY_INSERT [dbo].[ProjectStatus] ON 

INSERT [dbo].[ProjectStatus] ([ProjectId], [PersonId], [ArtType], [ProductionStatus]) VALUES (1, 1, N'Paint', N'InProgress')
INSERT [dbo].[ProjectStatus] ([ProjectId], [PersonId], [ArtType], [ProductionStatus]) VALUES (2, 2, N'Sculpt', N'InProgress')
INSERT [dbo].[ProjectStatus] ([ProjectId], [PersonId], [ArtType], [ProductionStatus]) VALUES (3, 3, N'Knit', N'InProgress')
SET IDENTITY_INSERT [dbo].[ProjectStatus] OFF
SET IDENTITY_INSERT [dbo].[ProjectSupplyInfo] ON 

INSERT [dbo].[ProjectSupplyInfo] ([ProjectSupplyId], [ArtType], [Description], [InventoryOnHand]) VALUES (1, N'Paint', N'Blue', 2)
INSERT [dbo].[ProjectSupplyInfo] ([ProjectSupplyId], [ArtType], [Description], [InventoryOnHand]) VALUES (2, N'Paint', N'Green', 2)
INSERT [dbo].[ProjectSupplyInfo] ([ProjectSupplyId], [ArtType], [Description], [InventoryOnHand]) VALUES (3, N'Paint', N'Yellow', 2)
INSERT [dbo].[ProjectSupplyInfo] ([ProjectSupplyId], [ArtType], [Description], [InventoryOnHand]) VALUES (4, N'Sculpt', N'Clay', 3)
INSERT [dbo].[ProjectSupplyInfo] ([ProjectSupplyId], [ArtType], [Description], [InventoryOnHand]) VALUES (5, N'Knit', N'WoolYarn', 4)
INSERT [dbo].[ProjectSupplyInfo] ([ProjectSupplyId], [ArtType], [Description], [InventoryOnHand]) VALUES (6, N'Knit', N'AcrylicYarn', 4)
INSERT [dbo].[ProjectSupplyInfo] ([ProjectSupplyId], [ArtType], [Description], [InventoryOnHand]) VALUES (7, N'Paint', N'SmallCanvas', 6)
INSERT [dbo].[ProjectSupplyInfo] ([ProjectSupplyId], [ArtType], [Description], [InventoryOnHand]) VALUES (8, N'Paint', N'LargeCanvas', 3)
SET IDENTITY_INSERT [dbo].[ProjectSupplyInfo] OFF
USE [master]
GO
ALTER DATABASE [ArtProjectManager] SET  READ_WRITE 
GO
