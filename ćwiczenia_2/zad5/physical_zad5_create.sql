-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-29 19:55:38.623

-- tables
-- Table: Employee
CREATE TABLE Employee (
    EmployeeID int  NOT NULL,
    PESEL int  NOT NULL,
    Address varchar(40)  NOT NULL,
    Salary float(2)  NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY  (EmployeeID)
);

-- Table: Rating
CREATE TABLE Rating (
    RatingID int  NOT NULL,
    Rating int  NOT NULL,
    RatingDate date  NOT NULL,
    "Current" bit  NOT NULL,
    Employee_EmployeeID int  NOT NULL,
    CONSTRAINT Rating_pk PRIMARY KEY  (RatingID)
);

-- foreign keys
-- Reference: Rating_Employee (table: Rating)
ALTER TABLE Rating ADD CONSTRAINT Rating_Employee
    FOREIGN KEY (Employee_EmployeeID)
    REFERENCES Employee (EmployeeID);

-- sequences
-- Sequence: Employee_seq
CREATE SEQUENCE Employee_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Rating_seq
CREATE SEQUENCE Rating_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

