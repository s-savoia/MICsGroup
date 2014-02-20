CREATE TABLE [dbo].[mic_mailing_list] (
    [mailing_id] INT          IDENTITY (1, 1) NOT NULL,
    [name]       nVARCHAR (20) NULL,
    [email]      nVARCHAR (20) NULL,
    PRIMARY KEY CLUSTERED ([mailing_id] ASC)
);

