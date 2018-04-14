CREATE TABLE [dbo].[Committee] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (250) NOT NULL,
    [Description] NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

