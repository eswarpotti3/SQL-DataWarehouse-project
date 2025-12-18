/*
------------------------------------------------------------
creating the schema and Database
------------------------------------------------------------

------------------------------------------------------------
-- 1. Create database IF NOT EXISTS
------------------------------------------------------------
*/
IF NOT EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = N'DataWarehouse'
)
BEGIN
    PRINT 'Creating database DataWarehouse...';
    CREATE DATABASE DataWarehouse;
END
ELSE
BEGIN
    PRINT 'Database [DataWarehouse] already exists. Skipping CREATE.';
END;
GO

-- create Database  'DataWarehouse'
use master;

create database DataWarehouse;

use DataWarehouse;

-- create Schema

create schema bronze;
go
create schema silver;
go
create schema gold;
