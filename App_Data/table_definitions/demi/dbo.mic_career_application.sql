CREATE TABLE [dbo].[mic_career_application] (
    [career_id]         INT            IDENTITY (1, 1) NOT NULL,
    [fname]             NVARCHAR (20)  NULL,
    [lname]             NVARCHAR (20)  NULL,
    [address]           NVARCHAR (MAX) NULL,
    [country]           INT            NULL,
    [province]          INT            NULL,
    [city]              NVARCHAR (20)  NULL,
    [zip]               NVARCHAR (6)   NULL,
    [phone]             NVARCHAR (20)  NULL,
    [email]             NVARCHAR (20)  NULL,
    [resume]            NVARCHAR (20)  NULL,
    [coverletter]		NVARCHAR (20)  NULL,
    [ques_status]       INT            NULL,
    [ques_crime]        INT            NULL,
    [ques_certificate]  INT            NULL,
    [skill_proficiency] INT            NULL,
    [skill_experience]  INT            NULL,
    [reason]            NVARCHAR (50)  NULL,
    [comment]           NVARCHAR (MAX) NULL,
    [consent]           INT            NULL,
    PRIMARY KEY CLUSTERED ([career_id] ASC)
);


