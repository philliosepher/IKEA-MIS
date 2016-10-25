CREATE DATABASE IKEA_dbcreation
GO
/* This Database was designed by Phil Liu, Stella Tang and Diana Bui for MIS-3545 Group Project */
/* IKEA */
USE IKEA_dbcreation
GO

/* Create Customer Table */
CREATE TABLE Customer (
CustomerID BIGINT PRIMARY KEY NOT NULL,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Age Numeric NOT NULL,
Email Varchar (50) NOT NULL,
Phone Numeric NOT NULL
)

/* Create Sales Table */
CREATE TABLE Sales (
SalesID BIGINT PRIMARY KEY NOT NULL,
CustomerID BIGINT  NOT NULL,
ProductID BIGINT NOT NULL, 
OrderID BIGINT  NOT NULL,
OrderDate DATE NOT NULL,
)

/* Create Orders Table */
CREATE TABLE Orders (
OrderID BIGINT PRIMARY KEY NOT NULL,
CustomerID BIGINT NOT NULL,
OrderDate DATE NOT NULL,
ShipmentID BIGINT NOT NULL,
VendorID BIGINT NOT NULL,
)

/* Creat Product Table */
CREATE TABLE Product (
ProductID BIGINT PRIMARY KEY NOT NULL,
ProductName VARCHAR(80) NOT NULL,
ProductCategory VARCHAR(50) NOT NULL,
ProductWeight INTEGER NOT NULL,
DimensionHeight INTEGER NOT NULL,
DimensionWidth INTEGER NOT NULL,
RetailPrice DECIMAL NOT NULL, 
)

/* Create Shipment Table */
CREATE TABLE Shipment (
ShipmentID BIGINT PRIMARY KEY NOT NULL,
CustomerID BIGINT NOT NULL,
ShipmentAddress VARCHAR (100) NOT NULL,
ScheduledShippingDate DATE NOT NULL,
ScheduledShippingTime TIME NOT NULL,
)

/* Create Vendor Table */
CREATE TABLE Vendor (
VendorID BIGINT PRIMARY KEY NOT NULL,
VendorCountry VARCHAR(20) NOT NULL,
VendorStates VARCHAR(20) NOT NULL,
VendorCity VARCHAR (20) NOT NULL,
VendorAddress VARCHAR (100) NOT NULL,
Phone Numeric NOT NULL,
)



