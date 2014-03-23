CREATE TABLE [dbo].[mic_donation] (
    [donation_id]      INT            IDENTITY (1, 1) NOT NULL,
    [fname]            NVARCHAR (20)  NULL,
    [lname]            NVARCHAR (20)  NULL,
    [address]          NVARCHAR (MAX) NULL,
    [city]             NVARCHAR (20)  NULL,
    [province]         NVARCHAR (20)  NULL,
    [zip]              NVARCHAR (6)   NULL,
    [phone]            NVARCHAR (20)  NULL,
    [email]            NVARCHAR (20)  NULL,
    [survey]           NVARCHAR(50)            NULL,
    [comment]          NVARCHAR (MAX) NULL,
    [amount]           INT            NULL,
    [payment_type]     NVARCHAR(20)            NULL,
    [card_number]      NVARCHAR (20)  NULL,
    [security_number]  INT            NULL,
    [cardholder_name]  NVARCHAR (20)  NULL,
    [expiration_month] NVARCHAR(20)            NULL,
    [expiration_year]  NVARCHAR(20)            NULL,
    [country]          NVARCHAR (20)  NULL,
    PRIMARY KEY CLUSTERED ([donation_id] ASC)
);

