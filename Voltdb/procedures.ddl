-- Stored procedure to insert data into the Customers table
CREATE PROCEDURE Customers.insert
    PARTITION ON COLUMN CustomerID
    CustomerID BIGINT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Address VARCHAR(255)
AS
    INSERT INTO Customers VALUES (?, ?, ?, ?, ?);


-- Stored procedure to insert data into the Products table
CREATE PROCEDURE Products.insert
    PARTITION ON COLUMN ProductID
    ProductID BIGINT,
    Name VARCHAR(255),
    Description VARCHAR(255),
    Price DECIMAL
AS
    INSERT INTO Products VALUES (?, ?, ?, ?);


-- Stored procedure to insert data into the Orders table
CREATE PROCEDURE Orders.insert
    PARTITION ON COLUMN OrderID
    OrderID BIGINT,
    CustomerID BIGINT,
    OrderDate TIMESTAMP
AS
    INSERT INTO Orders VALUES (?, ?, ?);


-- Stored procedure to insert data into the Order_Details table
CREATE PROCEDURE Order_Details.insert
    PARTITION ON COLUMN OrderDetailID
    OrderDetailID BIGINT,
    OrderID BIGINT,
    ProductID BIGINT,
    Quantity INT
AS
    INSERT INTO Order_Details VALUES (?, ?, ?, ?);
