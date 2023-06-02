USE [ClassicModel]

SELECT * FROM Payments;
SELECT * FROM Offices;
SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM ProductLines;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Products;

SELECT * FROM Payments
WHERE amount > 100000;

SELECT * FROM Products
ORDER BY productLine;

SELECT productLine, COUNT(*) AS countProductline 
FROM Products
GROUP BY productLine;

SELECT MIN(amount) AS minimumPayment
FROM Payments;

SELECT * FROM Payments
WHERE amount > 2 * (SELECT AVG(amount) FROM Payments);

SELECT COUNT(orderNumber) AS herkkuGiftsTotalOrders
FROM Orders, Customers 
WHERE Orders.customerNumber = Customers.customerNumber
AND Customers.customerName = 'Herkku Gifts';

SELECT employeeNumber, firstName, lastName
FROM Employees, Offices
WHERE Employees.officeCode = Offices.officeCode
AND city = 'Boston';

SELECT Payments.customerNumber, customerName, amount
FROM Payments, Customers
WHERE Payments.customerNumber = Customers.customerNumber
AND amount > 100000
ORDER BY amount DESC;


SELECT quantityOrdered * priceEach AS OnHoldvalue
FROM Orders, OrderDetails
WHERE Orders.orderNumber = OrderDetails.orderNumber
AND status = 'On Hold';

SELECT customerName, COUNT(orderNumber) AS OnHoldItem
FROM Customers, Orders
WHERE Customers.customerNumber = Orders.customerNumber
AND status = 'On Hold'
GROUP BY customerName;

SELECT orderNumber, priceEach, MSRP
FROM OrderDetails, Products
WHERE OrderDetails.productCode = Products.productCode
AND buyPrice < MSRP;

SELECT productName, priceEach, buyPrice
FROM Products, OrderDetails
WHERE Products.productCode = OrderDetails.productCode
AND priceEach > 2 * buyPrice;

SELECT DISTINCT(productName)
FROM Orders, OrderDetails, Products
WHERE Orders.orderNumber = OrderDetails.orderNumber
AND OrderDetails.productCode = Products.productCode
AND DATENAME(WEEKDAY, orderDate) = 'MONDAY';

SELECT Products.productCode, productName, quantityInStock
FROM Products, OrderDetails, Orders
WHERE Orders.orderNumber = OrderDetails.orderNumber
AND OrderDetails.productCode = Products.productCode
AND status = 'On Hold';






