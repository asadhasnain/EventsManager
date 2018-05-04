CREATE TABLE [dbo].[Schedules] (
    [Id]          INT      IDENTITY (1, 1) NOT NULL,
    [StartDate]   DATETIME      NOT NULL,
    [EndDate] DATETIME NOT NULL,
    [Contribution] INT,
    [GuestContribution] INT,
    [AllowGuest]    BIT,
    [EventID]  INT      NOT NULL,
    CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Schedule_ToEvent] FOREIGN KEY ([EventID]) REFERENCES [dbo].[Events] ([Id])
);