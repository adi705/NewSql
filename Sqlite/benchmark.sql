-- Query pattern 1 Both Read and Write
-- Read operation: Retrieve product details 
SELECT * FROM Products WHERE ProductID = ?;

-- Write operation: Add a new order
INSERT INTO Orders (CustomerID, OrderDate) VALUES (?, DATE('now'));

-- Read operation: Retrieve order details
SELECT * FROM Orders WHERE OrderID = ?;



-- Query pattern 2: ONlY Read

-- Read operation: Retrieve product details
SELECT * FROM Products WHERE ProductID = ?;

-- Read operation: Retrieve order details
SELECT * FROM Orders WHERE OrderID = ?;







-- dummy querys just to check if the database and data are setup properly


SELECT COUNT(*) AS TotalCustomers
FROM Customers;


SELECT COUNT(*) AS TotalProducts
FROM Products;


SELECT COUNT(*) AS TotalOrders
FROM Orders;


SELECT COUNT(*) AS TotalOrderDetails
FROM Order_Details;

SELECT SUM(p.Price * od.Quantity) AS TotalSales
FROM Order_Details od
JOIN Products p ON od.ProductID = p.ProductID;


SELECT c.FirstName, c.LastName, SUM(p.Price * od.Quantity) AS TotalSales
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Details od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID;


SELECT p.Name, SUM(od.Quantity) AS TotalQuantitySold
FROM Products p
JOIN Order_Details od ON p.ProductID = od.ProductID
GROUP BY p.ProductID
ORDER BY TotalQuantitySold DESC
LIMIT 10;


SELECT * FROM Orders
ORDER BY OrderDate DESC
LIMIT 10;

