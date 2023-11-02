-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-29 18:46:23.651

-- tables
-- Table: CourierCompany 
CREATE TABLE CourierCompany  (
    CourierCompanyID int  NOT NULL,
    NIP varchar(40)  NOT NULL,
    Address varchar(40)  NOT NULL,
    Name varchar(50)  NOT NULL,
    CONSTRAINT CourierCompany _pk PRIMARY KEY  (CourierCompanyID)
);

-- Table: Customer
CREATE TABLE Customer (
    CustomerID int  NOT NULL,
    FirstName varchar(30)  NOT NULL,
    LastName varchar(30)  NOT NULL,
    PhoneNumber varchar(20)  NOT NULL,
    Address varchar(100)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY  (CustomerID)
);

-- Table: Product
CREATE TABLE Product (
    ProductID int  NOT NULL,
    Publisher varchar(30)  NOT NULL,
    ISBN varchar(40)  NOT NULL,
    Title varchar(40)  NOT NULL,
    Author varchar(40)  NOT NULL,
    PageCount int  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY  (ProductID)
);

-- Table: Sales
CREATE TABLE Sales (
    SaleID int  NOT NULL,
    SaleDate datetime  NOT NULL,
    CustomerID int  NOT NULL,
    CourierCompanyID int  NOT NULL,
    ProductID int  NOT NULL,
    CONSTRAINT Sales_pk PRIMARY KEY  (SaleID)
);

-- foreign keys
-- Reference: Sales_CourierCompany  (table: Sales)
ALTER TABLE Sales ADD CONSTRAINT Sales_CourierCompany 
    FOREIGN KEY (CourierCompanyID)
    REFERENCES CourierCompany  (CourierCompanyID);

-- Reference: Sales_Customer (table: Sales)
ALTER TABLE Sales ADD CONSTRAINT Sales_Customer
    FOREIGN KEY (CustomerID)
    REFERENCES Customer (CustomerID);

-- Reference: Sales_Product (table: Sales)
ALTER TABLE Sales ADD CONSTRAINT Sales_Product
    FOREIGN KEY (ProductID)
    REFERENCES Product (ProductID);

-- sequences
-- Sequence: CourierCompany _seq
CREATE SEQUENCE CourierCompany _seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Customer_seq
CREATE SEQUENCE Customer_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Product_seq
CREATE SEQUENCE Product_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Sales_seq
CREATE SEQUENCE Sales_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

