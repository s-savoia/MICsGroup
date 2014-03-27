-- create mic_job_postings table
CREATE TABLE [dbo].[mic_job_postings] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [position] nVARCHAR (200) NOT NULL,
    [location] nVARCHAR (200) NOT NULL,
    [details]  nVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

-- insert rows into mic_job_postings table
SET IDENTITY_INSERT [dbo].[mic_job_postings] ON
INSERT INTO [dbo].[mic_job_postings] ([Id], [position], [location], [details]) VALUES (1, N'Doctor', N'Matheson', N'licensed doctor of Ontario')
INSERT INTO [dbo].[mic_job_postings] ([Id], [position], [location], [details]) VALUES (2, N'Nurse', N'Iroquois Falls', N'registered nurse')
INSERT INTO [dbo].[mic_job_postings] ([Id], [position], [location], [details]) VALUES (3, N'Surgeon', N'Cochrane', N'10 years experience')
INSERT INTO [dbo].[mic_job_postings] ([Id], [position], [location], [details]) VALUES (4, N'a', N'a', N'a')
SET IDENTITY_INSERT [dbo].[mic_job_postings] OFF