CREATE TABLE [dbo].[Budget] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [CommitteeID] INT            NOT NULL,
    [Amount]      REAL           NOT NULL,
    [Year]        NCHAR (4)      NOT NULL,
    [Description] NVARCHAR (500) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Budget_ToCommittee] FOREIGN KEY ([CommitteeID]) REFERENCES [dbo].[Committee] ([Id])
);

