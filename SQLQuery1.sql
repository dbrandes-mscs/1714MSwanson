USE [PropertyManager2]
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 11/5/2018 12:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment](
	[ApartmentId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingId] [int] NOT NULL,
	[ApartmentNum] [nvarchar](5) NOT NULL,
	[SquareFeet] [int] NOT NULL,
	[Bathrooms] [int] NOT NULL,
	[Rent] [smallmoney] NOT NULL,
	[TenantId] [int] NULL,
	[AdminId] [int] NULL,
 CONSTRAINT [PK_Apartment_1] PRIMARY KEY CLUSTERED 
(
	[ApartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApartmentEx1B]    Script Date: 11/5/2018 12:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentEx1B](
	[ApartmentId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[ApartmentNum] [nvarchar](5) NOT NULL,
	[SquareFeet] [int] NOT NULL,
	[Bathroom] [int] NOT NULL,
	[Rent] [smallmoney] NOT NULL,
	[TenantName] [nvarchar](50) NULL,
	[AdminName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Apartment] PRIMARY KEY CLUSTERED 
(
	[ApartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 11/5/2018 12:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[BuildingId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](15) NOT NULL,
	[Zip] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 11/5/2018 12:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[ApartmentId] [int] NULL,
	[InvoiceDate] [smalldatetime] NULL,
	[DueDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineItem]    Script Date: 11/5/2018 12:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineItem](
	[LineItemId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NULL,
	[Description] [nvarchar](25) NULL,
	[Amount] [smallmoney] NULL,
 CONSTRAINT [PK_LineItem] PRIMARY KEY CLUSTERED 
(
	[LineItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 11/5/2018 12:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](12) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Person1] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 11/5/2018 12:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ReceiptId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NULL,
	[ReceiptDate] [smalldatetime] NULL,
	[Amount] [smallmoney] NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[ReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Apartment] ON 
GO
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (1, 1, N'101', 400, 1, 550.0000, 1, 5)
GO
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (2, 1, N'102', 550, 1, 700.0000, 2, 5)
GO
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (3, 1, N'103', 500, 1, 600.0000, 3, 5)
GO
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (4, 1, N'104', 500, 1, 600.0000, 4, 5)
GO
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (5, 1, N'105', 550, 1, 700.0000, 5, 5)
GO
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (7, 2, N'201', 600, 1, 700.0000, 6, 5)
GO
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (8, 2, N'202', 550, 1, 650.0000, 7, 5)
GO
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (9, 2, N'203', 500, 1, 600.0000, 8, 5)
GO
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (10, 2, N'204', 500, 1, 600.0000, 9, 5)
GO
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (11, 2, N'205', 600, 1, 700.0000, 10, 5)
GO
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (12, 2, N'105', 500, 1, 400.0000, 11, 5)
GO
SET IDENTITY_INSERT [dbo].[Apartment] OFF
GO
SET IDENTITY_INSERT [dbo].[ApartmentEx1B] ON 
GO
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathroom], [Rent], [TenantName], [AdminName]) VALUES (1, N'Southeast Apartments', N'308 Pioneer Rd', N'101', 400, 1, 550.0000, NULL, N'Swanson')
GO
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathroom], [Rent], [TenantName], [AdminName]) VALUES (2, N'Southeast Apartments', N'308 Pioneer Rd', N'102', 550, 1, 700.0000, NULL, N'Swanson')
GO
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathroom], [Rent], [TenantName], [AdminName]) VALUES (9, N'Southeast Apartments', N'308 Pioneer Rd', N'103', 500, 1, 600.0000, NULL, N'Swanson')
GO
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathroom], [Rent], [TenantName], [AdminName]) VALUES (10, N'Southeast Apartments', N'308 Pioneer Rd', N'104', 500, 1, 600.0000, NULL, N'Swanson')
GO
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathroom], [Rent], [TenantName], [AdminName]) VALUES (11, N'Southeast Apartments', N'308 Pioneer Rd', N'105', 550, 1, 700.0000, NULL, N'Swanson')
GO
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathroom], [Rent], [TenantName], [AdminName]) VALUES (12, N'Southwest Apartments', N'1250 Homer Rd', N'201', 600, 1, 700.0000, NULL, N'Swanson')
GO
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathroom], [Rent], [TenantName], [AdminName]) VALUES (13, N'Southwest Apartments', N'1250 Homer Rd', N'202', 550, 1, 650.0000, NULL, N'Swanson')
GO
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathroom], [Rent], [TenantName], [AdminName]) VALUES (14, N'Southwest Apartments', N'1250 Homer Rd', N'203', 500, 1, 600.0000, NULL, N'Swanson')
GO
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathroom], [Rent], [TenantName], [AdminName]) VALUES (15, N'Southwest Apartments', N'1250 Homer Rd', N'204', 500, 1, 600.0000, NULL, N'Swanson')
GO
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathroom], [Rent], [TenantName], [AdminName]) VALUES (16, N'Southwest Apartments', N'1250 Homer Rd', N'205', 600, 1, 700.0000, NULL, N'Swanson')
GO
SET IDENTITY_INSERT [dbo].[ApartmentEx1B] OFF
GO
SET IDENTITY_INSERT [dbo].[Building] ON 
GO
INSERT [dbo].[Building] ([BuildingId], [BuildingName], [Address], [City], [State], [Zip]) VALUES (1, N'Southeast Apartments', N'308 Pioneer Rd', N'Red Wing', N'MN', N'55066')
GO
INSERT [dbo].[Building] ([BuildingId], [BuildingName], [Address], [City], [State], [Zip]) VALUES (2, N'Southwest Apartments', N'1250 Homer Rd', N'Winona', N'MN', N'55987')
GO
INSERT [dbo].[Building] ([BuildingId], [BuildingName], [Address], [City], [State], [Zip]) VALUES (3, N'Northeast Apartments', N'314 Dixie Ln', N'Winona', N'MN', N'55987')
GO
INSERT [dbo].[Building] ([BuildingId], [BuildingName], [Address], [City], [State], [Zip]) VALUES (4, N'Northwest Apartments', N'583 Anderson Rd', N'Red Wing ', N'MN', N'55066')
GO
INSERT [dbo].[Building] ([BuildingId], [BuildingName], [Address], [City], [State], [Zip]) VALUES (5, N'Green Prairie Apartments', N'123 Hamilton St', N'Winona ', N'MN', N'55987')
GO
INSERT [dbo].[Building] ([BuildingId], [BuildingName], [Address], [City], [State], [Zip]) VALUES (6, N'Sunset Apartments', N'435 Goodman Rd', N'Red Wing', N'MN', N'55066')
GO
SET IDENTITY_INSERT [dbo].[Building] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 
GO
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (1, 1, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (2, 2, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (3, 3, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (4, 4, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (5, 5, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (6, 1, CAST(N'2018-10-21T00:00:00' AS SmallDateTime), CAST(N'2018-11-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (7, 2, CAST(N'2018-10-21T00:00:00' AS SmallDateTime), CAST(N'2018-11-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (8, 3, CAST(N'2018-10-21T00:00:00' AS SmallDateTime), CAST(N'2018-11-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (9, 4, CAST(N'2018-10-21T00:00:00' AS SmallDateTime), CAST(N'2018-11-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (10, 5, CAST(N'2018-10-21T00:00:00' AS SmallDateTime), CAST(N'2018-11-01T00:00:00' AS SmallDateTime))
GO
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[LineItem] ON 
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1, 1, N'Rent, Oct 2018', 550.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (2, 1, N'Electricity', 50.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (3, 1, N'Gas', 40.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (4, 1, N'Garage', 60.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (5, 1, N'Cable TV/Internet', 70.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (6, 2, N'Rent, Oct 2018', 700.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (7, 2, N'Electricity', 50.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (8, 2, N'Gas', 40.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (9, 2, N'Garage', 60.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (10, 2, N'Cable TV/Internet', 70.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (11, 3, N'Rent, Oct 2018', 600.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (12, 3, N'Electricity', 50.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (13, 3, N'Gas', 40.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (14, 3, N'Garage', 60.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (15, 3, N'Cable TV/Internet', 70.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (16, 4, N'Rent, Oct 2018', 600.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (17, 4, N'Electricity', 50.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (18, 4, N'Gas', 40.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (19, 4, N'Garage', 60.0000)
GO
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (20, 4, N'Cable TV/Internet', 70.0000)
GO
SET IDENTITY_INSERT [dbo].[LineItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 
GO
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (1, N'Jake', N'Brown', N'123-456-7891', N'jake.brown@email.com')
GO
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (2, N'Karen', N'Nelson', N'456-123-5678', N'karen.nelson@email.com')
GO
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (3, N'Josh', N'Smith', N'780-876-1234', N'josh.smith@email.com')
GO
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (4, N'Bob', N'Clinton', N'745-283-4758', N'bob.clinton@email.com')
GO
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (5, N'Donari', N'Brandes', N'314-567-1928', N'donari.brandes@email.com')
GO
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (6, N'Meredith', N'Booth', N'123-654-7891', N'meredith.booth@email.com')
GO
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (7, N'Otis ', N'Wallis', N'321-456-9875', N'otis.wallis@email.com')
GO
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (8, N'Luke', N'Moss', N'564-842-6879', N'luke.moss@email.com')
GO
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (9, N'Derrick', N'Carpenter', N'468-125-6547', N'derrick.carpenter@email.com')
GO
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (10, N'Pablo ', N'Hall', N'186-498-1358', N'pablo.hall@email.com')
GO
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Phone], [Email]) VALUES (11, N'Leona', N'Gardiner', N'758-684-1568', N'leona.gardiner@email.com')
GO
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipt] ON 
GO
INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [ReceiptDate], [Amount]) VALUES (1, 1, CAST(N'2018-10-06T00:00:00' AS SmallDateTime), 770.0000)
GO
INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [ReceiptDate], [Amount]) VALUES (2, 2, CAST(N'2018-10-01T00:00:00' AS SmallDateTime), 920.0000)
GO
INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [ReceiptDate], [Amount]) VALUES (3, 3, CAST(N'2018-10-01T00:00:00' AS SmallDateTime), 820.0000)
GO
INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [ReceiptDate], [Amount]) VALUES (4, 4, CAST(N'2018-10-01T00:00:00' AS SmallDateTime), 820.0000)
GO
SET IDENTITY_INSERT [dbo].[Receipt] OFF
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Building] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Building] ([BuildingId])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_Building]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Person1] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_Person1]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Person11] FOREIGN KEY([AdminId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_Person11]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Apartment] FOREIGN KEY([ApartmentId])
REFERENCES [dbo].[Apartment] ([ApartmentId])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Apartment]
GO
ALTER TABLE [dbo].[LineItem]  WITH CHECK ADD  CONSTRAINT [FK_LineItem_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceId])
GO
ALTER TABLE [dbo].[LineItem] CHECK CONSTRAINT [FK_LineItem_Invoice]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceId])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Invoice]
GO
