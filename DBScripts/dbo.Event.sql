CREATE TABLE [dbo].[Event] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (50)  NOT NULL,
    [Description] NVARCHAR (500) NULL,
    [Schedule]    DATETIME       NOT NULL,
    [CommitteeID] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Evemt_ToCommittee] FOREIGN KEY ([CommitteeID]) REFERENCES [dbo].[Committee] ([Id])
);

