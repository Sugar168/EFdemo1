
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/14/2020 18:02:47
-- Generated from EDMX file: D:\学习\vs2017\EFdemo\ModelFiestDemo\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Heima8ModelFirstDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CustomerOrderInfo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderInfo] DROP CONSTRAINT [FK_CustomerOrderInfo];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerProduct_Customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomerProduct] DROP CONSTRAINT [FK_CustomerProduct_Customer];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerProduct_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomerProduct] DROP CONSTRAINT [FK_CustomerProduct_Product];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Customer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customer];
GO
IF OBJECT_ID(N'[dbo].[OrderInfo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderInfo];
GO
IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product];
GO
IF OBJECT_ID(N'[dbo].[CustomerProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CustomerProduct];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customer'
CREATE TABLE [dbo].[Customer] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CusName] nvarchar(32)  NULL
);
GO

-- Creating table 'OrderInfo'
CREATE TABLE [dbo].[OrderInfo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [OrderContent] nvarchar(256)  NULL,
    [CustomerId] int  NOT NULL
);
GO

-- Creating table 'Product'
CREATE TABLE [dbo].[Product] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'RoleInfo'
CREATE TABLE [dbo].[RoleInfo] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'R_Customer_RoleInfo'
CREATE TABLE [dbo].[R_Customer_RoleInfo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CustomerId] int  NOT NULL,
    [RoleInfoId] int  NOT NULL
);
GO

-- Creating table 'CustomerProduct'
CREATE TABLE [dbo].[CustomerProduct] (
    [Customer_Id] int  NOT NULL,
    [Product_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Customer'
ALTER TABLE [dbo].[Customer]
ADD CONSTRAINT [PK_Customer]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderInfo'
ALTER TABLE [dbo].[OrderInfo]
ADD CONSTRAINT [PK_OrderInfo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [PK_Product]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RoleInfo'
ALTER TABLE [dbo].[RoleInfo]
ADD CONSTRAINT [PK_RoleInfo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'R_Customer_RoleInfo'
ALTER TABLE [dbo].[R_Customer_RoleInfo]
ADD CONSTRAINT [PK_R_Customer_RoleInfo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Customer_Id], [Product_Id] in table 'CustomerProduct'
ALTER TABLE [dbo].[CustomerProduct]
ADD CONSTRAINT [PK_CustomerProduct]
    PRIMARY KEY CLUSTERED ([Customer_Id], [Product_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerId] in table 'OrderInfo'
ALTER TABLE [dbo].[OrderInfo]
ADD CONSTRAINT [FK_CustomerOrderInfo]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customer]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerOrderInfo'
CREATE INDEX [IX_FK_CustomerOrderInfo]
ON [dbo].[OrderInfo]
    ([CustomerId]);
GO

-- Creating foreign key on [Customer_Id] in table 'CustomerProduct'
ALTER TABLE [dbo].[CustomerProduct]
ADD CONSTRAINT [FK_CustomerProduct_Customer]
    FOREIGN KEY ([Customer_Id])
    REFERENCES [dbo].[Customer]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Product_Id] in table 'CustomerProduct'
ALTER TABLE [dbo].[CustomerProduct]
ADD CONSTRAINT [FK_CustomerProduct_Product]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[Product]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerProduct_Product'
CREATE INDEX [IX_FK_CustomerProduct_Product]
ON [dbo].[CustomerProduct]
    ([Product_Id]);
GO

-- Creating foreign key on [CustomerId] in table 'R_Customer_RoleInfo'
ALTER TABLE [dbo].[R_Customer_RoleInfo]
ADD CONSTRAINT [FK_CustomerR_Customer_RoleInfo]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customer]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerR_Customer_RoleInfo'
CREATE INDEX [IX_FK_CustomerR_Customer_RoleInfo]
ON [dbo].[R_Customer_RoleInfo]
    ([CustomerId]);
GO

-- Creating foreign key on [RoleInfoId] in table 'R_Customer_RoleInfo'
ALTER TABLE [dbo].[R_Customer_RoleInfo]
ADD CONSTRAINT [FK_RoleInfoR_Customer_RoleInfo]
    FOREIGN KEY ([RoleInfoId])
    REFERENCES [dbo].[RoleInfo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleInfoR_Customer_RoleInfo'
CREATE INDEX [IX_FK_RoleInfoR_Customer_RoleInfo]
ON [dbo].[R_Customer_RoleInfo]
    ([RoleInfoId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------