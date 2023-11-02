-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-02 21:31:55.098

-- tables
-- Table: InventoryStatus
CREATE TABLE InventoryStatus (
    InventoryStatusID int  NOT NULL,
    Date int  NOT NULL,
    Quantity int  NOT NULL,
    Warehouse_WarehouseID int  NOT NULL,
    Product_ProductID int  NOT NULL,
    CONSTRAINT Inventory Status_pk PRIMARY KEY  (InventoryStatusID)
);

-- Table: Product
CREATE TABLE Product (
    ProductID int  NOT NULL,
    ProductName varchar(40)  NOT NULL,
    ProductBrand varchar(40)  NOT NULL,
    EffectiveStartDate date  NOT NULL,
    EffectiveEndDate date  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY  (ProductID)
);

-- Table: Warehouse
CREATE TABLE Warehouse (
    WarehouseID int  NOT NULL,
    Address varchar(40)  NOT NULL,
    Country varchar(40)  NOT NULL,
    CONSTRAINT Warehouse_pk PRIMARY KEY  (WarehouseID)
);

-- foreign keys
-- Reference: InventoryStatus_Product (table: InventoryStatus)
ALTER TABLE InventoryStatus ADD CONSTRAINT InventoryStatus_Product
    FOREIGN KEY (Product_ProductID)
    REFERENCES Product (ProductID);

-- Reference: InventoryStatus_Warehouse (table: InventoryStatus)
ALTER TABLE InventoryStatus ADD CONSTRAINT InventoryStatus_Warehouse
    FOREIGN KEY (Warehouse_WarehouseID)
    REFERENCES Warehouse (WarehouseID);

-- sequences
-- Sequence: InventoryStatus_seq
CREATE SEQUENCE InventoryStatus_seq
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

-- Sequence: Warehouse_seq
CREATE SEQUENCE Warehouse_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

