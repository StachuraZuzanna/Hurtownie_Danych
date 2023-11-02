-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-29 18:52:15.407

-- tables
-- Table: Customer
CREATE TABLE Customer (
    ClientID int  NOT NULL,
    CustomerName int  NOT NULL,
    CustomerNIP int  NOT NULL,
    CustomerAddress int  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY  (ClientID)
);

-- Table: Fruit
CREATE TABLE Fruit (
    FruitID int  NOT NULL,
    FruitName varchar(30)  NOT NULL,
    FruitCategory_FruitCategoryID int  NOT NULL,
    CONSTRAINT Fruit_pk PRIMARY KEY  (FruitID)
);

-- Table: Fruit Sales
CREATE TABLE Fruit Sales (
    SaleID int  NOT NULL,
    OrderAmount int  NOT NULL,
    SalesLocation varchar(40)  NOT NULL,
    PricePerKg float(2)  NOT NULL,
    QuantityOrdered int  NOT NULL,
    Customer_ClientID int  NOT NULL,
    OrderDate_OrderDateID int  NOT NULL,
    Fruit_FruitID int  NOT NULL,
    CONSTRAINT Fruit Sales_pk PRIMARY KEY  (SaleID)
);

-- Table: FruitCategory
CREATE TABLE FruitCategory (
    FruitCategoryID int  NOT NULL,
    FruitCategoryName varchar(40)  NOT NULL,
    CONSTRAINT FruitCategory_pk PRIMARY KEY  (FruitCategoryID)
);

-- Table: OrderDate
CREATE TABLE OrderDate (
    OrderDateID int  NOT NULL,
    OrderDay int  NOT NULL,
    OrderHour time  NOT NULL,
    OrderMonth varchar(20)  NOT NULL,
    CONSTRAINT OrderDate_pk PRIMARY KEY  (OrderDateID)
);

-- foreign keys
-- Reference: Fruit Sales_Customer (table: Fruit Sales)
ALTER TABLE Fruit Sales ADD CONSTRAINT Fruit Sales_Customer
    FOREIGN KEY (Customer_ClientID)
    REFERENCES Customer (ClientID);

-- Reference: Fruit Sales_Fruit (table: Fruit Sales)
ALTER TABLE Fruit Sales ADD CONSTRAINT Fruit Sales_Fruit
    FOREIGN KEY (Fruit_FruitID)
    REFERENCES Fruit (FruitID);

-- Reference: Fruit Sales_OrderDate (table: Fruit Sales)
ALTER TABLE Fruit Sales ADD CONSTRAINT Fruit Sales_OrderDate
    FOREIGN KEY (OrderDate_OrderDateID)
    REFERENCES OrderDate (OrderDateID);

-- Reference: Fruit_FruitCategory (table: Fruit)
ALTER TABLE Fruit ADD CONSTRAINT Fruit_FruitCategory
    FOREIGN KEY (FruitCategory_FruitCategoryID)
    REFERENCES FruitCategory (FruitCategoryID);

-- sequences
-- Sequence: Customer_seq
CREATE SEQUENCE Customer_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Fruit Sales_seq
CREATE SEQUENCE Fruit Sales_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FruitCategory_seq
CREATE SEQUENCE FruitCategory_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Fruit_seq
CREATE SEQUENCE Fruit_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: OrderDate_seq
CREATE SEQUENCE OrderDate_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

