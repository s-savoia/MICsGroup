CREATE TABLE [dbo].[mic_job_posts] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [position] nVARCHAR (200) NOT NULL,
    [location] nVARCHAR (200) NOT NULL,
    [details]  nVARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

