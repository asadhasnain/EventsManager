CREATE TABLE [dbo].[Registrations] (
    [Id]          INT      IDENTITY (1, 1) NOT NULL,
    [NumberOfGuests]   INT,
    [Paid] BIT NOT NULL,
    [EmployeeID] INT NOT NULL,
    [EventID]  INT      NOT NULL,
    CONSTRAINT [PK_Registrations] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Registration_ToEmployee] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employees] ([Id]),
    CONSTRAINT [FK_Registration_ToEvent] FOREIGN KEY ([EventID]) REFERENCES [dbo].[Events] ([Id])
);