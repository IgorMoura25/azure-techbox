﻿USE master
GO

IF DB_ID('TechBox') IS NULL
BEGIN
    CREATE DATABASE TechBox
END;
GO

IF NOT EXISTS (SELECT name FROM master.sys.server_principals WHERE name = 'techbox')
BEGIN
    CREATE LOGIN [techbox] WITH
        PASSWORD = 0x02005782F37B5EF893FC53FF946641842584CEF2119B9777C0B9F55EA1017F7253F8E59F96EF6C4B6486F3E268718CF42C0F32FE653078BE5830DA5A0B2ACA74D75E4F484A1B HASHED,
        DEFAULT_DATABASE = TechBox
END;
GO

USE TechBox
GO

IF NOT EXISTS (SELECT name FROM sys.database_principals WHERE name = 'techbox')
BEGIN
    CREATE USER [techbox] FOR LOGIN [techbox]
END;
GO

IF EXISTS (SELECT name FROM sys.database_principals WHERE name = 'techbox')
BEGIN
	GRANT EXECUTE TO [techbox];
END;
GO