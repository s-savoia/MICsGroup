﻿CREATE TABLE [dbo].[mic_find_service] --will not use this table
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[service]	nvarchar(200) NOT NULL,
	[unique]		char(1) NOT NULL,
	[location]	nvarchar(200) NOT NULL,
	[details]		nvarchar(MAX) NOT NULL
)

-- create a table form services at Bingham
CREATE TABLE [dbo].[mic_services_bingham] (
    [id]       INT            IDENTITY (1, 1) NOT NULL,
    [service]  NVARCHAR (200) NOT NULL,
    [unique]   CHAR (1)       NOT NULL DEFAULT ('F'),
    [location] NVARCHAR (200) NOT NULL DEFAULT ('Bingham'),
    [details]  NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

-- create a table for services at Anson
CREATE TABLE [dbo].[mic_services_anson] (
    [id]       INT            IDENTITY (1, 1) NOT NULL,
    [service]  NVARCHAR (200) NOT NULL,
    [unique]   CHAR (1)       NOT NULL DEFAULT ('F'),
    [location] NVARCHAR (200) NOT NULL DEFAULT ('Anson'),
    [details]  NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

-- create a table for services at Lady Minto
CREATE TABLE [dbo].[mic_services_lady_minto] (
    [id]       INT            IDENTITY (1, 1) NOT NULL,
    [service]  NVARCHAR (200) NOT NULL,
    [unique]   CHAR (1)       NOT NULL DEFAULT ('F'),
    [location] NVARCHAR (200) NOT NULL DEFAULT ('Lady Minto'),
    [details]  NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

-- 2014-03-19 (W) 11:36

ALTER TABLE [dbo].[mic_services_bingham] ALTER COLUMN [unique] CHAR (3) NOT NULL;

ALTER TABLE [dbo].[mic_services_anson] ALTER COLUMN [unique] CHAR (3) NOT NULL;

ALTER TABLE [dbo].[mic_services_lady_minto] ALTER COLUMN [unique] CHAR (3) NOT NULL;

-- insert rows into Bingham
SET IDENTITY_INSERT [dbo].[mic_services_bingham] ON
INSERT INTO [dbo].[mic_services_bingham] ([id], [service], [unique], [location], [details]) VALUES (1, N'Emergency', N'No ', N'Bingham', N'24-hour E.R. service is provided ata a primary level by on-call physicians...')
INSERT INTO [dbo].[mic_services_bingham] ([id], [service], [unique], [location], [details]) VALUES (2, N'Laboratory', N'No ', N'Bingham', N' Laboratory staff collect and identify samples from in-patients, out-patients, and emergency cases, completing necessary documentation, and forwarding results to the physician. ')
INSERT INTO [dbo].[mic_services_bingham] ([id], [service], [unique], [location], [details]) VALUES (3, N'Diagnostic Imaging', N'No ', N'Bingham', N'Radiologists provide readings within 24 hours, and in the case of emergencies, results can be provided within 1 to 2 hours - a much faster turnaround time than previous technology allowed! ')
SET IDENTITY_INSERT [dbo].[mic_services_bingham] OFF

-- insert rows into Anson
SET IDENTITY_INSERT [dbo].[mic_services_anson] ON
INSERT INTO [dbo].[mic_services_anson] ([id], [service], [unique], [location], [details]) VALUES (1, N'Diabetes Program', N'No ', N'Anson', N'This well-structured Diabetes Education Program helps people cope with diabetes and prevent complications. ')
INSERT INTO [dbo].[mic_services_anson] ([id], [service], [unique], [location], [details]) VALUES (2, N'Respiratory Therapy', N'No ', N'Anson', N'Ambulatory BP Testing, Arterial Blood Gases, Pulmonary Function Test, Nocturnal Saturation Studies, Holter Monitoring, 24-Hour Blood Pressure Test, Continuous Loop Test')
INSERT INTO [dbo].[mic_services_anson] ([id], [service], [unique], [location], [details]) VALUES (3, N'Complex Continuing Care', N'No ', N'Anson', N'Complex Continuing Care is provided in hospitals for people who have illnesses or disabilities which cannot be treated at home or in long-term care facilities. Patients are provided with room and board, and other basic necessities, in addition to medical care. ')
SET IDENTITY_INSERT [dbo].[mic_services_anson] OFF

