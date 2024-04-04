CREATE PROCEDURE InsertCustomerProc (@CustomerID BIGINT, @FirstName VARCHAR(255), @LastName VARCHAR(255), @Email VARCHAR(255), @Address VARCHAR(255))
AS
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address) VALUES (@CustomerID, @FirstName, @LastName, @Email, @Address);




CREATE PROCEDURE InsertProductProc (@ProductID BIGINT, @Name VARCHAR(255), @Description VARCHAR(255), @Price DECIMAL(10, 2))
AS
INSERT INTO Products (ProductID, Name, Description, Price) VALUES (@ProductID, @Name, @Description, @Price);


CREATE PROCEDURE InsertOrderProc (@OrderID BIGINT, @CustomerID BIGINT, @OrderDate TIMESTAMP)
AS
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES (@OrderID, @CustomerID, @OrderDate);



CREATE PROCEDURE InsertOrderDetailProc (@OrderDetailID BIGINT, @OrderID BIGINT, @ProductID BIGINT, @Quantity INTEGER)
AS
INSERT INTO Order_Details (OrderDetailID, OrderID, ProductID, Quantity) VALUES (@OrderDetailID, @OrderID, @ProductID, @Quantity);



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
