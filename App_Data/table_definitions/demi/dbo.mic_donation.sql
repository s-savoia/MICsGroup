CREATE TABLE [dbo].[mic_donation] (
    [donation_id]     INT IDENTITY(1,1) NOT NULL,
    [fname]           VARCHAR (20)  NULL,
    [lname]           VARCHAR (20)  NULL,
    [address]         VARCHAR (MAX) NULL,
    [city]            VARCHAR (20)  NULL,
    [province]        VARCHAR (2)   NULL,
    [zip]             VARCHAR (6)   NULL,
    [phone]           VARCHAR (20)  NULL,
    [email]           VARCHAR (20)  NULL,
    [survey]          INT           NULL,
    [comment]         VARCHAR (MAX) NULL,
    [amount]          INT           NULL,
    [payment_type]    INT           NULL,
    [card_number]     VARCHAR (20)  NULL,
    [security_number] INT           NULL,
    [cardholder_name] VARCHAR (20)  NULL,
    [expiration]      INT           NULL,
    PRIMARY KEY CLUSTERED ([donation_id] ASC)
);

