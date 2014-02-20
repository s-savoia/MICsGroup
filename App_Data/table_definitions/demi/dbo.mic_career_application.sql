CREATE TABLE [dbo].[mic_career_application] (
    [career_id]         INT           NOT NULL IDENTITY,
    [fname]             VARCHAR (20)  NULL,
    [lname]             VARCHAR (20)  NULL,
    [address]           VARCHAR (MAX) NULL,
    [country]           VARCHAR (20)  NULL,
    [province]          VARCHAR (2)   NULL,
    [city]              VARCHAR (20)  NULL,
    [zip]               VARCHAR (6)   NULL,
    [phone]             VARCHAR (20)  NULL,
    [email]             VARCHAR (20)  NULL,
    [resume]            VARCHAR (20)  NULL,
    [coverletter	]      VARCHAR (20)  NULL,
    [ques_status]       INT           NULL,
    [ques_crime]        INT           NULL,
    [ques_certificate]  INT           NULL,
    [skill_proficiency] INT           NULL,
    [skill_experience]  INT           NULL,
    [reason]            VARCHAR (50)  NULL,
    [comment]           VARCHAR (MAX) NULL,
    [consent]           INT           NULL,
    PRIMARY KEY CLUSTERED ([career_id] ASC)
);

