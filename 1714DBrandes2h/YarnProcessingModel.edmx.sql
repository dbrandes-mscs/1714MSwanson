
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/15/2018 09:44:50
-- Generated from EDMX file: C:\Users\Donari\Documents\Visual Studio 2015\1714DBrandes\1714DBrandesVS\1714DBrandesex2h1\YarnProcessingModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [YarnProcessing2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CustomerInvoice]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_CustomerInvoice];
GO
IF OBJECT_ID(N'[dbo].[FK_InvoiceProcessType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProcessTypes] DROP CONSTRAINT [FK_InvoiceProcessType];
GO
IF OBJECT_ID(N'[dbo].[FK_StatusOrderHistory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_StatusOrderHistory];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerOrderHistory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_CustomerOrderHistory];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcessTypeOrderHistory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_ProcessTypeOrderHistory];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[Invoices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Invoices];
GO
IF OBJECT_ID(N'[dbo].[ProcessTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProcessTypes];
GO
IF OBJECT_ID(N'[dbo].[Status]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Status];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FistName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FinishOrderDate] datetime  NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [StatusId_Id] int  NOT NULL,
    [CustomerId_Id] int  NOT NULL,
    [ProcessTypeId_Id] int  NOT NULL
);
GO

-- Creating table 'Invoices'
CREATE TABLE [dbo].[Invoices] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CustomerId_Id] int  NOT NULL
);
GO

-- Creating table 'ProcessTypes'
CREATE TABLE [dbo].[ProcessTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cost] decimal(18,0)  NOT NULL,
    [ProcessDescription] nvarchar(max)  NOT NULL,
    [Invoice_Id] int  NOT NULL
);
GO

-- Creating table 'Status'
CREATE TABLE [dbo].[Status] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StatusDescription] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [PK_Invoices]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProcessTypes'
ALTER TABLE [dbo].[ProcessTypes]
ADD CONSTRAINT [PK_ProcessTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerId_Id] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [FK_CustomerInvoice]
    FOREIGN KEY ([CustomerId_Id])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerInvoice'
CREATE INDEX [IX_FK_CustomerInvoice]
ON [dbo].[Invoices]
    ([CustomerId_Id]);
GO

-- Creating foreign key on [Invoice_Id] in table 'ProcessTypes'
ALTER TABLE [dbo].[ProcessTypes]
ADD CONSTRAINT [FK_InvoiceProcessType]
    FOREIGN KEY ([Invoice_Id])
    REFERENCES [dbo].[Invoices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoiceProcessType'
CREATE INDEX [IX_FK_InvoiceProcessType]
ON [dbo].[ProcessTypes]
    ([Invoice_Id]);
GO

-- Creating foreign key on [StatusId_Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_StatusOrderHistory]
    FOREIGN KEY ([StatusId_Id])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusOrderHistory'
CREATE INDEX [IX_FK_StatusOrderHistory]
ON [dbo].[Orders]
    ([StatusId_Id]);
GO

-- Creating foreign key on [CustomerId_Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_CustomerOrderHistory]
    FOREIGN KEY ([CustomerId_Id])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerOrderHistory'
CREATE INDEX [IX_FK_CustomerOrderHistory]
ON [dbo].[Orders]
    ([CustomerId_Id]);
GO

-- Creating foreign key on [ProcessTypeId_Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_ProcessTypeOrderHistory]
    FOREIGN KEY ([ProcessTypeId_Id])
    REFERENCES [dbo].[ProcessTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcessTypeOrderHistory'
CREATE INDEX [IX_FK_ProcessTypeOrderHistory]
ON [dbo].[Orders]
    ([ProcessTypeId_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------