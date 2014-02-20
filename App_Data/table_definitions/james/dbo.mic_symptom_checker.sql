CREATE TABLE [dbo].[mic_symptom_checker]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[region]	nvarchar(200) NOT NULL,
	[area]	nvarchar(200) NOT NULL,
	[symptom]		nvarchar(200) NOT NULL,
	[causes]	nvarchar(MAX) NOT NULL

)
