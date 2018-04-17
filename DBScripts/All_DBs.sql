CREATE TABLE [dbo].[Employee] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [Name]              NVARCHAR (250) NOT NULL,
    [Email]             NVARCHAR (250) NOT NULL,
    [DateOfBirth]       DATETIME       NOT NULL,
    [DateOfJoining]     DATETIME       NOT NULL,
    [DateOfResignation] DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Committee] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (250) NOT NULL,
    [Description] NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Budget] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [CommitteeID] INT            NOT NULL,
    [Amount]      REAL           NOT NULL,
    [Year]        NCHAR (4)      NOT NULL,
    [Description] NVARCHAR (500) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Budget_ToCommittee] FOREIGN KEY ([CommitteeID]) REFERENCES [dbo].[Committee] ([Id])
);


CREATE TABLE [dbo].[Event] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (50)  NOT NULL,
    [Description] NVARCHAR (500) NULL,
    [Schedule]    DATETIME       NOT NULL,
    [CommitteeID] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Evemt_ToCommittee] FOREIGN KEY ([CommitteeID]) REFERENCES [dbo].[Committee] ([Id])
);

CREATE TABLE [dbo].[Member] (
    [Id]          INT IDENTITY (1, 1) NOT NULL,
    [EmployeeID]  INT NOT NULL,
    [CommitteeID] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Member_ToCommittee] FOREIGN KEY ([CommitteeID]) REFERENCES [dbo].[Committee] ([Id]),
    CONSTRAINT [FK_Member_ToEmployee] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([Id])
);



CREATE TABLE [dbo].[Expense] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Amount]      REAL           NOT NULL,
    [Description] NVARCHAR (250) NULL,
    [EventID]     INT            NOT NULL,
    [DateTime]    DATETIME       NOT NULL,
    CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Expense_ToEvent] FOREIGN KEY ([EventID]) REFERENCES [dbo].[Event] ([Id])
);

CREATE TABLE [dbo].[Marriage] (
	[Id]     Int        IDENTITY(1,1),
	EmployeeID  Int     NOT NULL,
	DateOfMarriage DATETIME NOT NULL,
	CONSTANT [PK_Marriage] PRIMARY KEY CLUSTERED([Id] ASC),
	CONSTRAINT [FK_Marriage_ToEmployee] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([Id])
	)
	
	CREATE TABLE [dbo].[FounderAwards]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY (1, 1), 
    [EmployeeId] INT NOT NULL, 
    [Date] DATE NOT NULL, 
    CONSTRAINT [FK_Table_ToTable] FOREIGN KEY (EmployeeId) REFERENCES [Employee]([Id])
)

