USE SalesDB;

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Email VARCHAR(100),
    CreatedAt DATETIME
);

INSERT INTO Customers VALUES 
(1, 'Nguyen Van C', 'c@email.com', GETDATE()),
(2, 'Tran Thi D', 'd@email.com', GETDATE());

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders VALUES 
(101, 1, GETDATE(), 1500000),
(102, 1, GETDATE(), 700000),
(103, 2, GETDATE(), 1250000);

-- JOIN
SELECT o.OrderID, o.TotalAmount, o.OrderDate, c.Name
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

-- GROUP BY
SELECT c.Name, SUM(o.TotalAmount) AS TotalSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Name;
