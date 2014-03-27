CREATE TABLE [dbo].[mic_symptom_checker]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[region]	nvarchar(200) NOT NULL,
	[area]	nvarchar(200) NOT NULL,
	[symptom]		nvarchar(200) NOT NULL,
	[causes]	nvarchar(MAX) NOT NULL

)

DROP TABLE [dbo].[mic_symptom_checker];

CREATE TABLE [dbo].[mic_symptoms] (
    [Id]      INT            IDENTITY (1, 1) NOT NULL,
    [symptom] NVARCHAR (200) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[mic_advice] (
    [level]      INT            IDENTITY (1, 1) NOT NULL,
    [advice] NVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([level] ASC)
);

DROP TABLE [dbo].[mic_symptoms];
DROP TABLE [dbo].[mic_advice];

CREATE TABLE [dbo].[mic_symptoms] (
    [symptom] NVARCHAR (200) NOT NULL, 
    CONSTRAINT [PK_mic_symptoms] PRIMARY KEY ([symptom])
);

CREATE TABLE [dbo].[mic_advice] (
    [advice] NVARCHAR (MAX) NOT NULL
);

DROP TABLE [dbo].[mic_symptoms];
DROP TABLE [dbo].[mic_advice];


-- created new symptoms table
CREATE TABLE [dbo].[mic_symptoms] (    
    [id] INT IDENTITY (1, 1) NOT NULL, 
	[symptom] NVARCHAR (200) NOT NULL, 
    [has] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_mic_symptoms] PRIMARY KEY ([id]),
);

-- Inserting rows into symptoms table
SET IDENTITY_INSERT [dbo].[mic_symptoms] ON
INSERT INTO [dbo].[mic_symptoms] ([id], [symptom], [has]) VALUES (1, N'runny nose', 0)
INSERT INTO [dbo].[mic_symptoms] ([id], [symptom], [has]) VALUES (2, N'sneezing', 0)
INSERT INTO [dbo].[mic_symptoms] ([id], [symptom], [has]) VALUES (3, N'dry cough', 0)
INSERT INTO [dbo].[mic_symptoms] ([id], [symptom], [has]) VALUES (4, N'fever', 0)
INSERT INTO [dbo].[mic_symptoms] ([id], [symptom], [has]) VALUES (5, N'muscle ache', 0)
INSERT INTO [dbo].[mic_symptoms] ([id], [symptom], [has]) VALUES (6, N'fatigue', 0)
INSERT INTO [dbo].[mic_symptoms] ([id], [symptom], [has]) VALUES (7, N'sore throat', 0)
INSERT INTO [dbo].[mic_symptoms] ([id], [symptom], [has]) VALUES (8, N'headache', 0)
INSERT INTO [dbo].[mic_symptoms] ([id], [symptom], [has]) VALUES (9, N'chills', 0)
SET IDENTITY_INSERT [dbo].[mic_symptoms] OFF

-- created advice table
CREATE TABLE [dbo].[mic_advice] (
    [level]      INT            IDENTITY (1, 1) NOT NULL,
    [advice] NVARCHAR (500) NOT NULL,  -- changed from MAX to 500 (advice should be short, and not too long)
    PRIMARY KEY CLUSTERED ([level] ASC)
);

-- Inserting rows into advice table
SET IDENTITY_INSERT [dbo].[mic_advice] ON
INSERT INTO [dbo].[mic_advice] ([level], [advice]) VALUES (1, N'Book an appointment immediately')
INSERT INTO [dbo].[mic_advice] ([level], [advice]) VALUES (2, N'Book an appointment quickly')
INSERT INTO [dbo].[mic_advice] ([level], [advice]) VALUES (3, N'Get lots of rest and stay warm')
INSERT INTO [dbo].[mic_advice] ([level], [advice]) VALUES (4, N'You might have an allergy')
SET IDENTITY_INSERT [dbo].[mic_advice] OFF

-- Droped all rows in advice table

-- switched order of levels
SET IDENTITY_INSERT [dbo].[mic_advice] ON
INSERT INTO [dbo].[mic_advice] ([level], [advice]) VALUES (1, N'You might have an allergy')
INSERT INTO [dbo].[mic_advice] ([level], [advice]) VALUES (2, N'Get lots of rest and stay warm')
INSERT INTO [dbo].[mic_advice] ([level], [advice]) VALUES (3, N'Book an appointment quickly')
INSERT INTO [dbo].[mic_advice] ([level], [advice]) VALUES (4, N'Book an appointment immediately')
SET IDENTITY_INSERT [dbo].[mic_advice] OFF