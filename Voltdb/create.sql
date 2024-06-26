-- Create tables
CREATE TABLE Customers (
    CustomerID BIGINT NOT NULL,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Address VARCHAR(255),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Products (
    ProductID BIGINT NOT NULL,
    Name VARCHAR(255),
    Description VARCHAR(255),
    Price DECIMAL(10, 2),
    PRIMARY KEY (ProductID)
);

CREATE TABLE Orders (
    OrderID BIGINT NOT NULL,
    CustomerID BIGINT,
    OrderDate TIMESTAMP,
    PRIMARY KEY (OrderID)
);

CREATE TABLE Order_Details (
    OrderDetailID BIGINT NOT NULL,
    OrderID BIGINT,
    ProductID BIGINT,
    Quantity INTEGER,
    PRIMARY KEY (OrderDetailID)
);




--populating procedures

CREATE PROCEDURE InsertCustomerProc (?, ?, ?, ?, ?)
AS
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address) VALUES (?, ?, ?, ?, ?);


CREATE PROCEDURE InsertProductProc (?, ?, ?, ?)
AS
INSERT INTO Products (ProductID, Name, Description, Price) VALUES (?, ?, ?, ?);


CREATE PROCEDURE InsertOrderProc (?, ?, ?)
AS
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES (?, ?, ?);

CREATE PROCEDURE InsertOrderDetailProc (?, ?, ?, ?)
AS
INSERT INTO Order_Details (OrderDetailID, OrderID, ProductID, Quantity) VALUES (?, ?, ?, ?);





-- benchmark procedures

CREATE PROCEDURE RetrieveProductDetails AS
SELECT * FROM Products WHERE ProductID = ?;

CREATE PROCEDURE RetrieveOrderDetails AS
SELECT * FROM Orders WHERE OrderID = ?;


CREATE PROCEDURE AddNewOrder AS
INSERT INTO Orders (CustomerID, OrderDate) VALUES (?, NOW());


