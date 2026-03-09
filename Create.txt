DROP DATABASE IF EXISTS aSFashion_3; -- delete previously existing database for easy testing purposes
CREATE DATABASE aSFashion_3; -- create new database
USE aSFashion_3; -- put the following into the database


CREATE TABLE Customer(
    Cust_Number int PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Primary Key, Auto Increment, Not Null
    Cust_FName varchar(30), -- e.g Mohammad, John
    Cust_LName varchar(30), -- e.g Awrangjeb, Wang
    Cust_Phone varchar(10), -- Includes area code, e.g 0737355032
    Cust_Email varchar(60) -- e.g m.fraser@gmail.com
);


CREATE TABLE Store(
    Str_Num int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Str_Name varchar(50),
    Str_Phone char(10),
    Str_Email varchar(40),
    StoreManagerID int
);


CREATE TABLE Appointment (
    Apt_Lvl_ID CHAR(2) PRIMARY KEY,
    Apt_Lvl_Desc VARCHAR(40),
    Apt_Hourly_Rate DECIMAL(5, 2)
);


CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY AUTO_INCREMENT,
    Staff_FName VARCHAR(30),
    Staff_LName VARCHAR(30),
    Staff_Phone CHAR(10),
    Staff_DoB DATE,
    Staff_StartDate DATE,
    Staff_Apt_Level CHAR(2),
    Store_ID INT,
    SupervisorID INT,
    FOREIGN KEY (Staff_Apt_Level) REFERENCES Appointment(Apt_Lvl_ID),
    FOREIGN KEY (Store_ID) REFERENCES STORE(Str_Num),
    FOREIGN KEY (SupervisorID) REFERENCES Staff(Staff_ID)
);


ALTER TABLE Store
ADD CONSTRAINT fk
FOREIGN KEY (StoreManagerID) REFERENCES Staff(Staff_ID);


CREATE TABLE PRODUCTTYPE (
    Prod_TypeID INT PRIMARY KEY AUTO_INCREMENT,
    Prod_Type_Desc VARCHAR(40)
);


CREATE TABLE PRODUCT (
    Prod_Num INT PRIMARY KEY AUTO_INCREMENT,
    Prod_Desc VARCHAR(50),
    Prod_Size VARCHAR(10),
    Prod_Price DECIMAL(5, 2),
    Price_Discount DECIMAL(4, 2),
    Prod_TypeID INT,
    FOREIGN KEY (Prod_TypeID) REFERENCES PRODUCTTYPE(Prod_TypeID)
);


CREATE TABLE INVENTORY (
    Prod_Num INT,
    Str_Num INT,
    Inv_QntyOnHand INT,
    Inv_QtyOrdered INT,
    PRIMARY KEY (Prod_Num, Str_Num),
    FOREIGN KEY (Prod_Num) REFERENCES PRODUCT(Prod_Num),
    FOREIGN KEY (Str_Num) REFERENCES STORE(Str_Num)
);


CREATE TABLE ORDERMODE (
    Order_ModeID CHAR(1) PRIMARY KEY,
    Order_Mode_Desc VARCHAR(10)
);


CREATE TABLE CUSTOMERORDER (
    CustOrd_ID INT PRIMARY KEY AUTO_INCREMENT,
    CustOrd_Date DATE,
    CustOrd_Mode CHAR(1),
    Cust_Number INT,
    Str_Num INT,
    FOREIGN KEY (CustOrd_Mode) REFERENCES ORDERMODE(Order_ModeID),
    FOREIGN KEY (Cust_Number) REFERENCES CUSTOMER(Cust_Number),
    FOREIGN KEY (Str_Num) REFERENCES STORE(Str_Num)
);


CREATE TABLE ORDERLINE (
    CustOrd_ID INT,
    Prod_Num INT,
    OrdLn_DateArrived DATE,
    OrdLn_DatePicked DATE,
    OrdLn_Qnty INT,
    PRIMARY KEY (CustOrd_ID, Prod_Num),
    FOREIGN KEY (CustOrd_ID) REFERENCES CUSTOMERORDER(CustOrd_ID),
    FOREIGN KEY (Prod_Num) REFERENCES PRODUCT(Prod_Num)
);