CREATE TABLE [dbo].[Expense] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Amount]      REAL           NOT NULL,
    [Description] NVARCHAR (250) NULL,
    [MemberID]    INT            NOT NULL,
    [EventID]     INT            NOT NULL,
    [DateTime]    DATETIME       NOT NULL,
    CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Expense_ToEvent] FOREIGN KEY ([EventID]) REFERENCES [dbo].[Event] ([Id]),
    CONSTRAINT [FK_Expense_ToMember] FOREIGN KEY ([MemberID]) REFERENCES [dbo].[Member] ([Id])
);

