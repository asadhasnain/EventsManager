CREATE TABLE [dbo].[Employee] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [Name]              NVARCHAR (250) NOT NULL,
    [Email]             NVARCHAR (250) NOT NULL,
    [DateOfBirth]       DATETIME       NOT NULL,
    [DateOfJoining]     DATETIME       NOT NULL,
    [DateOfResignation] DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

