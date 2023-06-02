USE [ClassicModel]

SELECT * FROM Payments;
SELECT * FROM Customers;
SELECT * FROM Offices;
SELECT * FROM Employees;
SELECT * FROM Orders; 
SELECT * FROM OrderDetails;
SELECT * FROM ProductLines;
SELECT * FROM Products;

/*a*/
SELECT AVG((MSRP - buyPrice) / buyPrice) * 100 
AS AverageMarkup
FROM Products;

/*b*/
SELECT COUNT(productCode) AS SellProducts
FROM Products;

/*c*/
SELECT customerName, city
FROM Customers
WHERE salesRepEmployeeNumber IS NULL;

/*d*/
SELECT CONCAT(firstName, ' ', lastName) 
AS EmployeeName, JobTitle
FROM Employees
WHERE jobTitle LIKE '%VP%' OR jobTitle LIKE '%Manager%';

/*e*/
SELECT orderNumber, SUM(quantityOrdered * priceEach) 
AS Value
FROM OrderDetails
GROUP BY orderNumber
HAVING SUM(quantityOrdered * priceEach) > 5000;

/*f*/ 
SELECT CONCAT(firstName, ' ', lastName) AS Top_of_organization 
FROM Employees
WHERE reportsTo IS NULL;

/*g*/
SELECT CONCAT(re.firstName, ' ', re.lastname)
AS Reports_William_Patterson
FROM Employees pw LEFT JOIN Employees re ON re.reportsTo = pw.employeeNumber
WHERE pw.lastName = 'Patterson'
AND pw.firstName = 'William';

/*h*/
SELECT Products.productCode, Products.productName
FROM Products, Orders, OrderDetails, Customers
WHERE Products.productCode = OrderDetails.productCode
AND Orders.customerNumber = Customers.customerNumber
AND OrderDetails.orderNumber = Orders.orderNumber
AND customerName = 'Herkku Gifts';

/*i*/
SELECT lastName, firstName, SUM(quantityOrdered * priceEach) * 0.05
AS Commission
FROM Employees, Orders, OrderDetails, Customers
WHERE Employees.employeeNumber = Customers.salesRepEmployeeNumber
AND Orders.orderNumber = OrderDetails.orderNumber
AND Customers.customerNumber = Orders.customerNumber
GROUP BY lastName, firstName
ORDER BY SUM(quantityOrdered * priceEach) * 0.05 DESC;

/*j*/
SELECT DATEDIFF(DAY, MIN(orderDate), MAX(orderDate))
AS Between_Days_Oldest_Newest_Order
FROM Orders;

/*k*/
SELECT customerName, AVG(DATEDIFF(DAY, orderDate, shippedDate))
AS Average_Time
FROM Customers, Orders
WHERE Customers.customerNumber = Orders.customerNumber
GROUP BY customerName
ORDER BY Average_Time DESC;

/*l*/
SELECT SUM(quantityOrdered * priceEach) 
AS Total_August_2004_Orders
FROM Orders, OrderDetails
WHERE Orders.orderNumber = OrderDetails.orderNumber
AND DATENAME(MONTH, orderDate) = 'August'
AND DATENAME(YEAR, orderDate) = '2004';

/*m*/
SELECT CONCAT(firstName, ' ', lastName)
AS Employee_Report_Diane
FROM Employees
WHERE reportsTo IN (SELECT employeeNumber FROM Employees 
WHERE reportsTo = (SELECT employeeNumber FROM Employees
WHERE firstName = 'Diane'
AND lastName = 'Murphy'));

/*n*/
SELECT pay.checkNumber, pay.amount, pay.paymentDate
FROM (SELECT pay.*, AVG(pay.amount) 
OVER (PARTITION BY YEAR(pay.paymentDate), MONTH(pay.paymentDate))
AS AVG_total_month_year FROM Payments pay) pay
WHERE pay.paymentDate BETWEEN '2004-10-01'
AND '2004-10-31'
AND pay.amount > 2 * AVG_total_month_year;


/*o*/
SELECT per.productLine, per.productName,
CAST(ROUND(per.quantityInStock * 100 / line.InStock, 2) AS NUMERIC(38,2))
AS Percentage
FROM Products per
JOIN (SELECT SUM(quantityInStock) AS InStock, productline
FROM Products
GROUP BY productline)
AS line ON per.productLine = line.productLine
ORDER BY per.productLine, Percentage DESC;



