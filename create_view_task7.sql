-- Customers Table
CREATE TABLE Customers (
  cust_id INTEGER PRIMARY KEY,
  name TEXT,
  city TEXT
);

-- Orders Table
CREATE TABLE Orders (
  order_id INTEGER PRIMARY KEY,
  cust_id INTEGER,
  order_date DATE,
  amount REAL,
  FOREIGN KEY (cust_id) REFERENCES Customers(cust_id)
);

-- Insert Sample Data
INSERT INTO Customers VALUES (1, 'ARJUN', 'Delhi'), (2, 'MAHA', 'Mumbai');
INSERT INTO Orders VALUES (101, 1, '2025-06-01', 500.00), (102, 2, '2025-06-02', 800.00);
CREATE VIEW CustomerOrderView AS
SELECT 
    C.name AS CustomerName,
    C.city AS City,
    O.order_id AS OrderID,
    O.order_date AS OrderDate,
    O.amount AS OrderAmount
FROM Customers C
JOIN Orders O ON C.cust_id = O.cust_id;
SELECT * FROM CustomerOrderView
