CREATE TABLE [dbo].[Member] (
    [Id]          INT IDENTITY (1, 1) NOT NULL,
    [EmployeeID]  INT NOT NULL,
    [CommitteeID] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Member_ToCommittee] FOREIGN KEY ([CommitteeID]) REFERENCES [dbo].[Committee] ([Id]),
    CONSTRAINT [FK_Member_ToEmployee] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([Id])
);

