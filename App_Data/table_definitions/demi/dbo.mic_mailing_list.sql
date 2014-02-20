CREATE TABLE [dbo].[mic_mailing_list] (
    [mailing_id] INT IDENTITY(1,1) NOT NULL,
    [name]       VARCHAR (20) NULL,
    [email]      VARCHAR (20) NULL,
    PRIMARY KEY CLUSTERED ([mailing_id] ASC)
);

