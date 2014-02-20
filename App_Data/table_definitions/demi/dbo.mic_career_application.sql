CREATE TABLE [dbo].[mic_career_application] (
    [career_id]         INT           IDENTITY (1, 1) NOT NULL,
    [fname]             nVARCHAR (20)  NULL,
    [lname]             nVARCHAR (20)  NULL,
    [address]           nVARCHAR (MAX) NULL,
    [country]           nVARCHAR (20)  NULL,
    [province]          nVARCHAR (2)   NULL,
    [city]              nVARCHAR (20)  NULL,
    [zip]               nVARCHAR (6)   NULL,
    [phone]             nVARCHAR (20)  NULL,
    [email]             nVARCHAR (20)  NULL,
    [resume]            nVARCHAR (20)  NULL,
    [coverletter	]      nVARCHAR (20)  NULL,
    [ques_status]       INT           NULL,
    [ques_crime]        INT           NULL,
    [ques_certificate]  INT           NULL,
    [skill_proficiency] INT           NULL,
    [skill_experience]  INT           NULL,
    [reason]            nVARCHAR (50)  NULL,
    [comment]           nVARCHAR (MAX) NULL,
    [consent]           INT           NULL,
    PRIMARY KEY CLUSTERED ([career_id] ASC)
);

