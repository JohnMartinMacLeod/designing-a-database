-- 1) Full Name & Hourly Salary of Staff Members


SELECT CONCAT(Staff_FNAME, ' ', Staff_LNAME) AS "Full Name", CONCAT('$', Apt_Hourly_Rate) AS "Hourly Salary"
FROM Staff
JOIN Appointment ON Staff.Staff_Apt_Level = Appointment.Apt_Lvl_ID
ORDER BY Apt_Hourly_Rate DESC;


-- 2) Full Name and Order Date of (only) the Second-Oldest Customer Order


SELECT CONCAT(Cust_FName, ' ', Cust_LName) AS "Full Name", CUSTOMERORDER.CustOrd_Date AS "Order Date"
FROM CUSTOMER
JOIN CUSTOMERORDER ON CUSTOMERORDER.Cust_Number = CUSTOMER.Cust_Number
ORDER BY CustOrd_Date ASC
LIMIT 1 OFFSET 1;


-- 3) Store Name, Full Name, Appointment Level and Hourly Rate of all Store Managers


SELECT Str_Name AS "Store Name", CONCAT(Staff.Staff_FNAME, ' ', Staff.Staff_LNAME) AS "Full Name",
Staff.Staff_Apt_Level AS "Appointment Level", CONCAT('$', Appointment.Apt_Hourly_Rate) AS "Hourly Rate"
FROM Store
JOIN Staff ON Store.StoreManagerID = Staff.Staff_ID
JOIN Appointment ON Staff.Staff_Apt_Level = Appointment.Apt_Lvl_ID
WHERE Appointment.Apt_Lvl_Desc LIKE "Manager%"
ORDER BY Appointment.Apt_Hourly_Rate DESC;


-- 4) List of Product Details & Total Quantity Sold


SELECT PRODUCT.Prod_Num AS "Product Number", Prod_Desc AS "Product", 
PRODUCTTYPE.Prod_Type_Desc AS "Type", Prod_Size AS "Size", ORDERLINE.OrdLn_Qnty AS "Total Qty. Sold"
FROM PRODUCT
JOIN PRODUCTTYPE ON PRODUCT.Prod_TypeID = PRODUCTTYPE.Prod_TypeID
JOIN ORDERLINE ON PRODUCT.Prod_Num = ORDERLINE.Prod_Num
WHERE ORDERLINE.OrdLn_DatePicked IS NOT NULL
ORDER BY ORDERLINE.OrdLn_Qnty DESC;


-- 5) As in (4), but only with orders by 20 March 2024, in order of Product Number then Total Qty. Sold


SELECT PRODUCT.Prod_Num AS "Product Number", Prod_Desc AS "Description", 
PRODUCTTYPE.Prod_Type_Desc AS "Type", ORDERLINE.OrdLn_Qnty AS "Total Qty. Sold"
FROM PRODUCT
JOIN PRODUCTTYPE ON PRODUCT.Prod_TypeID = PRODUCTTYPE.Prod_TypeID
JOIN ORDERLINE ON PRODUCT.Prod_Num = ORDERLINE.Prod_Num
WHERE ORDERLINE.OrdLn_DatePicked <= '2024-05-20'
ORDER BY PRODUCT.Prod_Num ASC, ORDERLINE.OrdLn_Qnty ASC;