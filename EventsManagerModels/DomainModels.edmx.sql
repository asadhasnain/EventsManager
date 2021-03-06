
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/25/2018 19:26:22
-- Generated from EDMX file: E:\ProgrammingProjects\EventsManager\EventsManagerModels\DomainModels.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [EventsManager];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BabyBirth_ToEmployee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BabyBirths] DROP CONSTRAINT [FK_BabyBirth_ToEmployee];
GO
IF OBJECT_ID(N'[dbo].[FK_Budget_ToCommittee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Budgets] DROP CONSTRAINT [FK_Budget_ToCommittee];
GO
IF OBJECT_ID(N'[dbo].[FK_Employee_FounderAwards]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FounderAwards] DROP CONSTRAINT [FK_Employee_FounderAwards];
GO
IF OBJECT_ID(N'[dbo].[FK_Evemt_ToCommittee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_Evemt_ToCommittee];
GO
IF OBJECT_ID(N'[dbo].[FK_Expense_ToEvent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Expenses] DROP CONSTRAINT [FK_Expense_ToEvent];
GO
IF OBJECT_ID(N'[dbo].[FK_Marriage_ToEmployee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Marriages] DROP CONSTRAINT [FK_Marriage_ToEmployee];
GO
IF OBJECT_ID(N'[dbo].[FK_Member_ToCommittee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Members] DROP CONSTRAINT [FK_Member_ToCommittee];
GO
IF OBJECT_ID(N'[dbo].[FK_Member_ToEmployee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Members] DROP CONSTRAINT [FK_Member_ToEmployee];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[BabyBirths]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BabyBirths];
GO
IF OBJECT_ID(N'[dbo].[Budgets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Budgets];
GO
IF OBJECT_ID(N'[dbo].[Committees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Committees];
GO
IF OBJECT_ID(N'[dbo].[Employees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees];
GO
IF OBJECT_ID(N'[dbo].[Events]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Events];
GO
IF OBJECT_ID(N'[dbo].[Expenses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Expenses];
GO
IF OBJECT_ID(N'[dbo].[FounderAwards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FounderAwards];
GO
IF OBJECT_ID(N'[dbo].[Lunches]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Lunches];
GO
IF OBJECT_ID(N'[dbo].[Marriages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Marriages];
GO
IF OBJECT_ID(N'[dbo].[Members]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Members];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Budgets'
CREATE TABLE [dbo].[Budgets] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CommitteeID] int  NOT NULL,
    [Amount] real  NOT NULL,
    [Year] nchar(4)  NOT NULL,
    [Description] nvarchar(500)  NOT NULL
);
GO

-- Creating table 'Committees'
CREATE TABLE [dbo].[Committees] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(250)  NOT NULL,
    [Description] nvarchar(500)  NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(250)  NOT NULL,
    [Email] nvarchar(250)  NOT NULL,
    [DateOfBirth] datetime  NOT NULL,
    [DateOfJoining] datetime  NOT NULL,
    [DateOfResignation] datetime  NULL
);
GO

-- Creating table 'Events'
CREATE TABLE [dbo].[Events] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(50)  NOT NULL,
    [Description] nvarchar(500)  NULL,
    [Schedule] datetime  NOT NULL,
    [CommitteeID] int  NOT NULL
);
GO

-- Creating table 'Members'
CREATE TABLE [dbo].[Members] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EmployeeID] int  NOT NULL,
    [CommitteeID] int  NOT NULL
);
GO

-- Creating table 'FounderAwards'
CREATE TABLE [dbo].[FounderAwards] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EmployeeId] int  NOT NULL,
    [Date] datetime  NOT NULL
);
GO

-- Creating table 'BabyBirths'
CREATE TABLE [dbo].[BabyBirths] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Gender] int  NOT NULL,
    [DateOfBirth] datetime  NOT NULL,
    [EmployeeID] int  NOT NULL
);
GO

-- Creating table 'Expenses'
CREATE TABLE [dbo].[Expenses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Amount] real  NOT NULL,
    [Description] nvarchar(250)  NULL,
    [EventID] int  NOT NULL,
    [DateTime] datetime  NOT NULL
);
GO

-- Creating table 'Lunches'
CREATE TABLE [dbo].[Lunches] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Week] int  NOT NULL,
    [Day] nvarchar(250)  NOT NULL,
    [Deal] nvarchar(250)  NULL,
    [SideLine] nvarchar(250)  NULL,
    [Misc] nvarchar(250)  NULL,
    [Sweet] nvarchar(250)  NULL
);
GO

-- Creating table 'Marriages'
CREATE TABLE [dbo].[Marriages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EmployeeID] int  NOT NULL,
    [DateOfMarriage] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Budgets'
ALTER TABLE [dbo].[Budgets]
ADD CONSTRAINT [PK_Budgets]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Committees'
ALTER TABLE [dbo].[Committees]
ADD CONSTRAINT [PK_Committees]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [PK_Events]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [PK_Members]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FounderAwards'
ALTER TABLE [dbo].[FounderAwards]
ADD CONSTRAINT [PK_FounderAwards]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BabyBirths'
ALTER TABLE [dbo].[BabyBirths]
ADD CONSTRAINT [PK_BabyBirths]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Expenses'
ALTER TABLE [dbo].[Expenses]
ADD CONSTRAINT [PK_Expenses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Lunches'
ALTER TABLE [dbo].[Lunches]
ADD CONSTRAINT [PK_Lunches]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Marriages'
ALTER TABLE [dbo].[Marriages]
ADD CONSTRAINT [PK_Marriages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CommitteeID] in table 'Budgets'
ALTER TABLE [dbo].[Budgets]
ADD CONSTRAINT [FK_Budget_ToCommittee]
    FOREIGN KEY ([CommitteeID])
    REFERENCES [dbo].[Committees]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Budget_ToCommittee'
CREATE INDEX [IX_FK_Budget_ToCommittee]
ON [dbo].[Budgets]
    ([CommitteeID]);
GO

-- Creating foreign key on [CommitteeID] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [FK_Evemt_ToCommittee]
    FOREIGN KEY ([CommitteeID])
    REFERENCES [dbo].[Committees]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Evemt_ToCommittee'
CREATE INDEX [IX_FK_Evemt_ToCommittee]
ON [dbo].[Events]
    ([CommitteeID]);
GO

-- Creating foreign key on [CommitteeID] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [FK_Member_ToCommittee]
    FOREIGN KEY ([CommitteeID])
    REFERENCES [dbo].[Committees]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Member_ToCommittee'
CREATE INDEX [IX_FK_Member_ToCommittee]
ON [dbo].[Members]
    ([CommitteeID]);
GO

-- Creating foreign key on [EmployeeID] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [FK_Member_ToEmployee]
    FOREIGN KEY ([EmployeeID])
    REFERENCES [dbo].[Employees]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Member_ToEmployee'
CREATE INDEX [IX_FK_Member_ToEmployee]
ON [dbo].[Members]
    ([EmployeeID]);
GO

-- Creating foreign key on [EmployeeId] in table 'FounderAwards'
ALTER TABLE [dbo].[FounderAwards]
ADD CONSTRAINT [FK_Employee_FounderAwards]
    FOREIGN KEY ([EmployeeId])
    REFERENCES [dbo].[Employees]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Employee_FounderAwards'
CREATE INDEX [IX_FK_Employee_FounderAwards]
ON [dbo].[FounderAwards]
    ([EmployeeId]);
GO

-- Creating foreign key on [EmployeeID] in table 'BabyBirths'
ALTER TABLE [dbo].[BabyBirths]
ADD CONSTRAINT [FK_BabyBirth_ToEmployee]
    FOREIGN KEY ([EmployeeID])
    REFERENCES [dbo].[Employees]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BabyBirth_ToEmployee'
CREATE INDEX [IX_FK_BabyBirth_ToEmployee]
ON [dbo].[BabyBirths]
    ([EmployeeID]);
GO

-- Creating foreign key on [EventID] in table 'Expenses'
ALTER TABLE [dbo].[Expenses]
ADD CONSTRAINT [FK_Expense_ToEvent]
    FOREIGN KEY ([EventID])
    REFERENCES [dbo].[Events]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Expense_ToEvent'
CREATE INDEX [IX_FK_Expense_ToEvent]
ON [dbo].[Expenses]
    ([EventID]);
GO

-- Creating foreign key on [EmployeeID] in table 'Marriages'
ALTER TABLE [dbo].[Marriages]
ADD CONSTRAINT [FK_Marriage_ToEmployee]
    FOREIGN KEY ([EmployeeID])
    REFERENCES [dbo].[Employees]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Marriage_ToEmployee'
CREATE INDEX [IX_FK_Marriage_ToEmployee]
ON [dbo].[Marriages]
    ([EmployeeID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------