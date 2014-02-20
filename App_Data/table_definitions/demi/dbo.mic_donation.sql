CREATE TABLE [dbo].[mic_donation] (
    [donation_id]     INT           IDENTITY (1, 1) NOT NULL,
    [fname]           nVARCHAR (20)  NULL,
    [lname]           nVARCHAR (20)  NULL,
    [address]        nVARCHAR (MAX) NULL,
    [city]            nVARCHAR (20)  NULL,
    [province]        nVARCHAR (2)   NULL,
    [zip]             nVARCHAR (6)   NULL,
    [phone]           nVARCHAR (20)  NULL,
    [email]           nVARCHAR (20)  NULL,
    [survey]          INT           NULL,
    [comment]         nVARCHAR (MAX) NULL,
    [amount]          INT           NULL,
    [payment_type]    INT           NULL,
    [card_number]     nVARCHAR (20)  NULL,
    [security_number] INT           NULL,
    [cardholder_name] nVARCHAR (20)  NULL,
    [expiration]      INT           NULL,
    PRIMARY KEY CLUSTERED ([donation_id] ASC)
);

