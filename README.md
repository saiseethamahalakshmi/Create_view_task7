# 📊 Task 7: Creating and Using SQL Views

## 🎯 Objective
The goal of this task is to understand how to create and utilize **SQL Views** to simplify complex queries, enhance data security, and promote reusable SQL logic in database applications.

## 🛠️ Tools Used
- DB Browser for SQLite
- MySQL Workbench

## 📘 What is a View?
A **View** is a virtual table based on the result-set of an SQL query. It is used to:
- Abstract complex joins or filters
- Provide a simplified, secure interface to data
- Enable reusable query logic

---

## 🗃️ Database Schema Used

We used a basic **E-commerce** structure:
- `Customers (cust_id, name, city)`
- `Orders (order_id, cust_id, order_date, amount)`

---

## 🔧 SQL Setup & Data Insertion

```sql
CREATE TABLE Customers (
  cust_id INTEGER PRIMARY KEY,
  name TEXT,
  city TEXT
);

CREATE TABLE Orders (
  order_id INTEGER PRIMARY KEY,
  cust_id INTEGER,
  order_date DATE,
  amount REAL,
  FOREIGN KEY (cust_id) REFERENCES Customers(cust_id)
);

INSERT INTO Customers VALUES
  (1, 'Alice', 'Delhi'),
  (2, 'Bob', 'Mumbai');

INSERT INTO Orders VALUES
  (101, 1, '2025-06-01', 500.00),
  (102, 2, '2025-06-02', 800.00);
🔍 Creating Views
1️⃣ Customer Order View
sql
Copy
Edit
CREATE VIEW CustomerOrderView AS
SELECT 
  C.name AS CustomerName,
  C.city AS City,
  O.order_id AS OrderID,
  O.order_date AS OrderDate,
  O.amount AS OrderAmount
FROM Customers C
JOIN Orders O ON C.cust_id = O.cust_id;
2️⃣ High Value Orders View
sql
Copy
Edit
CREATE VIEW HighValueOrders AS
SELECT * FROM CustomerOrderView
WHERE OrderAmount > 600;
📤 Querying Views
sql
Copy
Edit
SELECT * FROM CustomerOrderView;

SELECT * FROM HighValueOrders;
✅ Sample Output:
CustomerName	City	OrderID	OrderDate	OrderAmount
Alice	Delhi	101	2025-06-01	500.00
Bob	Mumbai	102	2025-06-02	800.00

📚 Learning Outcome
Gained hands-on experience with CREATE VIEW

Understood how views support abstraction and security

Used views for cleaner, reusable SQL logic in reporting and dashboards
