CREATE TABLE [dbo].[BabyBirth] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Gender] INT            NOT NULL,
    [DateOfBirth]    DATETIME       NOT NULL,
    [EmployeeID] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_BabyBirth_ToEmployee] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([Id])
);
