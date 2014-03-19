CREATE TABLE [dbo].[mic_find_service] --will not use this table
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[service]	nvarchar(200) NOT NULL,
	[unique]		char(1) NOT NULL,
	[location]	nvarchar(200) NOT NULL,
	[details]		nvarchar(MAX) NOT NULL
)

CREATE TABLE [dbo].[mic_services_bingham] (
    [id]       INT            IDENTITY (1, 1) NOT NULL,
    [service]  NVARCHAR (200) NOT NULL,
    [unique]   CHAR (1)       NOT NULL DEFAULT ('F'),
    [location] NVARCHAR (200) NOT NULL DEFAULT ('Bingham'),
    [details]  NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[mic_services_anson] (
    [id]       INT            IDENTITY (1, 1) NOT NULL,
    [service]  NVARCHAR (200) NOT NULL,
    [unique]   CHAR (1)       NOT NULL DEFAULT ('F'),
    [location] NVARCHAR (200) NOT NULL DEFAULT ('Anson'),
    [details]  NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[mic_services_lady_minto] (
    [id]       INT            IDENTITY (1, 1) NOT NULL,
    [service]  NVARCHAR (200) NOT NULL,
    [unique]   CHAR (1)       NOT NULL DEFAULT ('F'),
    [location] NVARCHAR (200) NOT NULL DEFAULT ('Lady Minto'),
    [details]  NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);