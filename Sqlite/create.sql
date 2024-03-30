-- Create tables
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    Email TEXT,
    Address TEXT
);

CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    Name TEXT,
    Description TEXT,
    Price REAL
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    OrderDate DATE
);

CREATE TABLE Order_Details (
    OrderDetailID INTEGER PRIMARY KEY,
    OrderID INTEGER,
    ProductID INTEGER,
    Quantity INTEGER
);

