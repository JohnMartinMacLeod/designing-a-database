INSERT INTO customer (Cust_Number,Cust_FName,Cust_LName,Cust_Phone,Cust_Email) 
VALUES
(NULL,'Rosemarie','Bradford',0437661489,'r.bradford@gmail.com'),
(NULL,'Cornell','Woodward',0359876246,'c.woodward@yahoo.com.au'),
(NULL,'Noe','Short',0219384752,'n.short@aol.com'),
(NULL,'Tammie','Norris',0849862457,'t.norris@live.com'),
(NULL,'Olin','Reilly',0694625791,'o.reilly@hotmail.com');


INSERT INTO appointment (Apt_Lvl_ID,Apt_Lvl_Desc,Apt_Hourly_Rate) 
VALUES 
('M1','Manager Level 1',110.50),
('M2','Manager Level 2',55.12),
('S1','Supervisor Level 1',25.40),
('S2','Supervisor Level 2',20.30),
('C1','Cashier Level 1',17.10);


INSERT INTO store (Str_Num,Str_Name,Str_Phone,Str_Email) 
VALUES
(NULL,'a*Fashion Melbourne',0359642350,'melboune@asfashion.com.au'),
(NULL,'a*Fashion Sydney',0234851276,'sydney@asfashion.com.au'),
(NULL,'a*Fashion Perth',0836785146,'perth@asfashion.com.au'),
(NULL,'a*Fashion Adelaide',0871356784,'adelaide@asfashion.com.au'),
(NULL,'a*Fashion Brisbane',0713459764,'brisbane@asfashion.com.au');


INSERT INTO staff (Staff_ID,Staff_FName,Staff_LName,Staff_Phone,Staff_DoB,Staff_StartDate,Staff_Apt_Level,Store_ID) 
VALUES
(NULL,'Huey','English',0468743198,'1989-10-08','2022-06-12','S1',1),
(NULL,'Gabrielle','Potts',0434865125,'1998-11-21','2021-09-18','M1',1),
(NULL,'Selma','Cobb',0442789653,'2001-04-05','2023-04-14','S2',2),
(NULL,'Mario','Garrison',0415346895,'1982-01-22','2024-01-03','C1',1),
(NULL,'Nolan','Raymond',0443245876,'2006-09-12','2024-12-20','C1',2);


UPDATE staff
SET SupervisorID = CASE
    WHEN Staff_ID IN (1, 2) THEN 2
    WHEN Staff_ID IN (3, 5) THEN 3
    WHEN Staff_ID = 4 THEN 1
    ELSE SupervisorID
END;


UPDATE store
SET StoreManagerID = 2
WHERE Str_Num IN (1, 2, 3, 4, 5);


INSERT INTO producttype (Prod_TypeID,Prod_Type_Desc) 
VALUES
(NULL,'Shirt'),
(NULL,'Pant'),
(NULL,'Sock'),
(NULL,'Shoe'),
(NULL,'Hat');


INSERT INTO product (Prod_Num,Prod_Desc,Prod_Size,Prod_Price,Price_Discount,Prod_TypeID) 
VALUES
(NULL,'Shirt for man','Large',20.95,0.00,1),
(NULL,'Pant for woman','Medium',34.99,10.00,2),
(NULL,'Sock for child','Small',5.50,0.00,3),
(NULL,'Shoe for man','Medium',120.95,20.00,4),
(NULL,'Hat, unisex','Medium',15.40,5.00,5);


INSERT INTO inventory (Prod_Num,Str_Num,Inv_QntyOnHand,Inv_QtyOrdered) 
VALUES
(1,1,700,120),
(2,1,1200,200),
(3,2,120,30),
(4,4,2000,300),
(5,5,360,80);


INSERT INTO ordermode (Order_ModeID,Order_Mode_Desc) 
VALUES
('O','Online'),
('I','In store');


INSERT INTO customerorder (CustOrd_ID,CustOrd_Date,CustOrd_Mode,Cust_Number,Str_Num) 
VALUES
(NULL,'2024-06-12','O',1,1),
(NULL,'2023-07-24','I',2,2),
(NULL,'2024-03-19','I',4,3),
(NULL,'2022-02-08','O',5,4),
(NULL,'2024-03-04','O',3,5);


INSERT INTO orderline (CustOrd_ID,Prod_Num,OrdLn_DateArrived,OrdLn_DatePicked,OrdLn_Qnty) 
VALUES
(1,2,'2024-07-01','2024-07-12',2),
(2,5,'2023-08-03','2023-08-03',5),
(3,1,'2024-04-01','2024-04-03',10),
(4,3,'2022-02-14','2022-02-27',3),
(5,4,'2024-03-09','2024-03-15',8);