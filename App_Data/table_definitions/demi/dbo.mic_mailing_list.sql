CREATE TABLE [dbo].[mic_mailing_list] (
    [mailing_id] INT           IDENTITY (1, 1) NOT NULL,
    [name]       NVARCHAR (20) NULL,
    [email]      NVARCHAR (20) NULL,
    [subject]    NVARCHAR (30) NULL,
    [image]      NVARCHAR (50) NULL,
    [message] NVARCHAR(MAX) NULL, 
    PRIMARY KEY CLUSTERED ([mailing_id] ASC)
);

