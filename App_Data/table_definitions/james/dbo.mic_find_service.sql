CREATE TABLE [dbo].[mic_find_service]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[service]	nvarchar(200) NOT NULL,
	[unique]		char(1) NOT NULL,
	[location]	nvarchar(200) NOT NULL,
	[details]		nvarchar(MAX) NOT NULL


)
