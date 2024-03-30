-- Populate tables

-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address)
WITH RECURSIVE numbers(n) AS (
  SELECT 1
  UNION ALL
  SELECT n+1 FROM numbers WHERE n < 5000000
)
SELECT
    n,
    'FirstName' || n,
    'LastName' || n,
    'email' || n || '@example.com',
    'Address' || n
FROM numbers;

-- Insert sample data into Products table
INSERT INTO Products (ProductID, Name, Description, Price)
WITH RECURSIVE numbers(n) AS (
  SELECT 1
  UNION ALL
  SELECT n+1 FROM numbers WHERE n < 5000000
)
SELECT
    n,
    'Product' || n,
    'Description of Product' || n,
    ROUND(RANDOM()*1000, 2)
FROM numbers;

-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate)
WITH RECURSIVE numbers(n) AS (
  SELECT 1
  UNION ALL
  SELECT n+1 FROM numbers WHERE n < 5000000
)
SELECT
    n,
    ROUND(RANDOM()*5000000),
    DATE('now', '-' || CAST(ROUND(RANDOM()*365) AS INTEGER) || ' days')
FROM numbers;

-- Insert sample data into Order_Details table
INSERT INTO Order_Details (OrderDetailID, OrderID, ProductID, Quantity)
WITH RECURSIVE numbers(n) AS (
  SELECT 1
  UNION ALL
  SELECT n+1 FROM numbers WHERE n < 5000000
)
SELECT
    n,
    ROUND(RANDOM()*5000000),
    ROUND(RANDOM()*5000000),
    CAST(RANDOM()*10 AS INTEGER) + 1
FROM numbers;


