
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/19/2018 11:25:52
-- Generated from EDMX file: D:\SIG Bentley Technology Champions\ASP.NET MVC\EventsManager\EventsManagerModels\DomainModels.edmx
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
    ALTER TABLE [dbo].[BabyBirth] DROP CONSTRAINT [FK_BabyBirth_ToEmployee];
GO
IF OBJECT_ID(N'[dbo].[FK_Budget_ToCommittee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Budget] DROP CONSTRAINT [FK_Budget_ToCommittee];
GO
IF OBJECT_ID(N'[dbo].[FK_Evemt_ToCommittee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Event] DROP CONSTRAINT [FK_Evemt_ToCommittee];
GO
IF OBJECT_ID(N'[dbo].[FK_Expense_ToEvent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Expense] DROP CONSTRAINT [FK_Expense_ToEvent];
GO
IF OBJECT_ID(N'[dbo].[FK_Member_ToCommittee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Member] DROP CONSTRAINT [FK_Member_ToCommittee];
GO
IF OBJECT_ID(N'[dbo].[FK_Member_ToEmployee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Member] DROP CONSTRAINT [FK_Member_ToEmployee];
GO
IF OBJECT_ID(N'[dbo].[FK_Table_ToTable]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FounderAwards] DROP CONSTRAINT [FK_Table_ToTable];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[BabyBirth]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BabyBirth];
GO
IF OBJECT_ID(N'[dbo].[Budget]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Budget];
GO
IF OBJECT_ID(N'[dbo].[Committee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Committee];
GO
IF OBJECT_ID(N'[dbo].[Employee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employee];
GO
IF OBJECT_ID(N'[dbo].[Event]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Event];
GO
IF OBJECT_ID(N'[dbo].[Expense]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Expense];
GO
IF OBJECT_ID(N'[dbo].[FounderAwards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FounderAwards];
GO
IF OBJECT_ID(N'[dbo].[Member]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Member];
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------