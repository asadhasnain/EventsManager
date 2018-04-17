CREATE TABLE [dbo].[Marriage] (
	[Id]     Int        IDENTITY(1,1),
	EmployeeID  Int     NOT NULL,
	DateOfMarriage DATETIME NOT NULL,
	CONSTANT [PK_Marriage] PRIMARY KEY CLUSTERED([Id] ASC),
	CONSTRAINT [FK_Marriage_ToEmployee] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employee] ([Id])
	);
