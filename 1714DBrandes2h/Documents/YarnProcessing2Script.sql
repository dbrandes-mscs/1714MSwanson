USE [master]
GO
/****** Object:  Database [YarnProcessing2]    Script Date: 11/15/2018 2:42:41 PM ******/
CREATE DATABASE [YarnProcessing2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YarnProcessing2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\YarnProcessing2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YarnProcessing2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\YarnProcessing2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [YarnProcessing2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YarnProcessing2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YarnProcessing2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YarnProcessing2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YarnProcessing2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YarnProcessing2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YarnProcessing2] SET ARITHABORT OFF 
GO
ALTER DATABASE [YarnProcessing2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YarnProcessing2] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [YarnProcessing2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YarnProcessing2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YarnProcessing2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YarnProcessing2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YarnProcessing2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YarnProcessing2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YarnProcessing2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YarnProcessing2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YarnProcessing2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YarnProcessing2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YarnProcessing2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YarnProcessing2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YarnProcessing2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YarnProcessing2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YarnProcessing2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YarnProcessing2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YarnProcessing2] SET  MULTI_USER 
GO
ALTER DATABASE [YarnProcessing2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YarnProcessing2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YarnProcessing2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YarnProcessing2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YarnProcessing2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'YarnProcessing2', N'ON'
GO
ALTER DATABASE [YarnProcessing2] SET QUERY_STORE = OFF
GO
USE [YarnProcessing2]
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
USE [YarnProcessing2]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/15/2018 2:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FistName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 11/15/2018 2:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId_Id] [int] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/15/2018 2:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FinishOrderDate] [datetime] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[StatusId_Id] [int] NOT NULL,
	[CustomerId_Id] [int] NOT NULL,
	[ProcessTypeId_Id] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTypes]    Script Date: 11/15/2018 2:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cost] [decimal](18, 0) NOT NULL,
	[ProcessDescription] [nvarchar](max) NOT NULL,
	[Invoice_Id] [int] NOT NULL,
 CONSTRAINT [PK_ProcessTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/15/2018 2:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusDescription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([Id], [FistName], [LastName], [Phone], [Email]) VALUES (1, N'Jon', N'Howell', N'507-459-3158', N'jonhowell@email.com')
GO
INSERT [dbo].[Customers] ([Id], [FistName], [LastName], [Phone], [Email]) VALUES (2, N'Whitney', N'Kim', N'608-258-6971', N'whitneykim@email.com')
GO
INSERT [dbo].[Customers] ([Id], [FistName], [LastName], [Phone], [Email]) VALUES (3, N'Sonia', N'Edwards', N'715-845-9274', N'soniaedwards@email.com')
GO
INSERT [dbo].[Customers] ([Id], [FistName], [LastName], [Phone], [Email]) VALUES (4, N'Eva', N'Torrez', N'507-482-6479', N'evatorrez@email.com')
GO
INSERT [dbo].[Customers] ([Id], [FistName], [LastName], [Phone], [Email]) VALUES (5, N'Marvin', N'Wade', N'608-458-1276', N'marvinwade@email.com')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoices] ON 
GO
INSERT [dbo].[Invoices] ([Id], [CustomerId_Id]) VALUES (4, 1)
GO
INSERT [dbo].[Invoices] ([Id], [CustomerId_Id]) VALUES (5, 2)
GO
INSERT [dbo].[Invoices] ([Id], [CustomerId_Id]) VALUES (6, 3)
GO
INSERT [dbo].[Invoices] ([Id], [CustomerId_Id]) VALUES (7, 4)
GO
INSERT [dbo].[Invoices] ([Id], [CustomerId_Id]) VALUES (8, 5)
GO
SET IDENTITY_INSERT [dbo].[Invoices] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Id], [FinishOrderDate], [OrderDate], [StatusId_Id], [CustomerId_Id], [ProcessTypeId_Id]) VALUES (5, CAST(N'2018-10-08T00:00:00.000' AS DateTime), CAST(N'2018-10-01T00:00:00.000' AS DateTime), 2, 1, 2)
GO
INSERT [dbo].[Orders] ([Id], [FinishOrderDate], [OrderDate], [StatusId_Id], [CustomerId_Id], [ProcessTypeId_Id]) VALUES (7, CAST(N'2018-10-10T00:00:00.000' AS DateTime), CAST(N'2018-10-03T00:00:00.000' AS DateTime), 2, 2, 3)
GO
INSERT [dbo].[Orders] ([Id], [FinishOrderDate], [OrderDate], [StatusId_Id], [CustomerId_Id], [ProcessTypeId_Id]) VALUES (8, CAST(N'2018-10-12T00:00:00.000' AS DateTime), CAST(N'2018-10-05T00:00:00.000' AS DateTime), 2, 3, 4)
GO
INSERT [dbo].[Orders] ([Id], [FinishOrderDate], [OrderDate], [StatusId_Id], [CustomerId_Id], [ProcessTypeId_Id]) VALUES (9, CAST(N'2018-10-15T00:00:00.000' AS DateTime), CAST(N'2018-10-08T00:00:00.000' AS DateTime), 2, 4, 5)
GO
INSERT [dbo].[Orders] ([Id], [FinishOrderDate], [OrderDate], [StatusId_Id], [CustomerId_Id], [ProcessTypeId_Id]) VALUES (10, CAST(N'2018-10-22T00:00:00.000' AS DateTime), CAST(N'2018-10-15T00:00:00.000' AS DateTime), 2, 5, 6)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcessTypes] ON 
GO
INSERT [dbo].[ProcessTypes] ([Id], [Cost], [ProcessDescription], [Invoice_Id]) VALUES (2, CAST(10 AS Decimal(18, 0)), N'wash', 4)
GO
INSERT [dbo].[ProcessTypes] ([Id], [Cost], [ProcessDescription], [Invoice_Id]) VALUES (3, CAST(20 AS Decimal(18, 0)), N'pick', 5)
GO
INSERT [dbo].[ProcessTypes] ([Id], [Cost], [ProcessDescription], [Invoice_Id]) VALUES (4, CAST(15 AS Decimal(18, 0)), N'roving', 6)
GO
INSERT [dbo].[ProcessTypes] ([Id], [Cost], [ProcessDescription], [Invoice_Id]) VALUES (5, CAST(20 AS Decimal(18, 0)), N'yarn', 7)
GO
INSERT [dbo].[ProcessTypes] ([Id], [Cost], [ProcessDescription], [Invoice_Id]) VALUES (6, CAST(30 AS Decimal(18, 0)), N'dye', 8)
GO
SET IDENTITY_INSERT [dbo].[ProcessTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 
GO
INSERT [dbo].[Status] ([Id], [StatusDescription]) VALUES (1, N'InProgress')
GO
INSERT [dbo].[Status] ([Id], [StatusDescription]) VALUES (2, N'Finished')
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
/****** Object:  Index [IX_FK_CustomerInvoice]    Script Date: 11/15/2018 2:42:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CustomerInvoice] ON [dbo].[Invoices]
(
	[CustomerId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CustomerOrderHistory]    Script Date: 11/15/2018 2:42:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CustomerOrderHistory] ON [dbo].[Orders]
(
	[CustomerId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProcessTypeOrderHistory]    Script Date: 11/15/2018 2:42:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProcessTypeOrderHistory] ON [dbo].[Orders]
(
	[ProcessTypeId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StatusOrderHistory]    Script Date: 11/15/2018 2:42:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_StatusOrderHistory] ON [dbo].[Orders]
(
	[StatusId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_InvoiceProcessType]    Script Date: 11/15/2018 2:42:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_InvoiceProcessType] ON [dbo].[ProcessTypes]
(
	[Invoice_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_CustomerInvoice] FOREIGN KEY([CustomerId_Id])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_CustomerInvoice]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrderHistory] FOREIGN KEY([CustomerId_Id])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_CustomerOrderHistory]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeOrderHistory] FOREIGN KEY([ProcessTypeId_Id])
REFERENCES [dbo].[ProcessTypes] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_ProcessTypeOrderHistory]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_StatusOrderHistory] FOREIGN KEY([StatusId_Id])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_StatusOrderHistory]
GO
ALTER TABLE [dbo].[ProcessTypes]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceProcessType] FOREIGN KEY([Invoice_Id])
REFERENCES [dbo].[Invoices] ([Id])
GO
ALTER TABLE [dbo].[ProcessTypes] CHECK CONSTRAINT [FK_InvoiceProcessType]
GO
USE [master]
GO
ALTER DATABASE [YarnProcessing2] SET  READ_WRITE 
GO
