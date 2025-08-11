--- HW-7
---- Easy-Level Tasks 
Select*from Products

1) SELECT MIN(Price) AS min_price
FROM products;

2) SELECT MAX (Salary) AS max_salary
FROM Employees;

3) SELECT COUNT(*) AS total_customers
FROM Customers;

4) SELECT COUNT(DISTINCT ProductName) AS unique_product_count
FROM Products;

5) SELECT SUM(SaleAmount) AS total_sales
FROM Sales
WHERE ProductID = 7;

6) Select AVG(Age) as avg_age
from Employees

7)	SELECT DepartmentName, COUNT(*) AS employee_count
FROM Employees
GROUP BY DepartmentName;

8) Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.
SELECT Category, MAX (Price) AS max_price, Min (Price) AS min_price
FROM Products
GROUP BY Category;

9) SELECT CustomerID, SUM(SaleAmount) AS total_sales
FROM Sales
GROUP BY CustomerID;

10) SELECT DepartmentName, COUNT(*) as more_5
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 5;

---- Medium-Level Tasks

11) 
SELECT ProductID, SUM(SaleAmount) AS total_sales, AVG (SaleAmount) AS avg_sales
FROM Sales
GROUP BY ProductId;
12) SELECT COUNT(*) AS employee_count
FROM Employees
WHERE DepartmentName = 'HR';
13) 
SELECT DEPARTMENTNAME, MAX(SALARY) AS Max_salary, Min (SALARY) AS Min_salary
FROM Employees
GROUP BY DEPARTMENTNAME;
14) SELECT DEPARTMENTNAME, avg(SALARY) AS avg_salary
FROM Employees
GROUP BY DEPARTMENTNAME;
15) SELECT DEPARTMENTNAME, avg(SALARY) AS avg_salary, count(*) as count_empl
FROM Employees
GROUP BY DEPARTMENTNAME;
16) 
SELECT * from products
SELECT Category, avg (price) as avg_prc 
FROM products
GROUP BY Category
HAVING avg (price) > 400;
17) 
SELECT * from Sales

SELECT Year (SaleDate) AS sale_year
, sum (SaleAmount) as sale_amnt 
FROM Sales
GROUP BY Year (SaleDate)
ORDER BY sale_year;

18)	
SELECT 
  c.CustomerID,
  c.FirstName,
  c.LastName,
  COUNT(o.OrderID) AS order_count
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(o.OrderID) >= 3
ORDER BY order_count DESC;
19) 
SELECT 
  DepartmentName AS DeptID,
  AVG(Salary) AS avg_salary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 60000
ORDER BY avg_salary DESC;
---- Hard-Level Tasks (6)

20) SELECT 
  Category,
  AVG(Price) AS avg_price
FROM Products
GROUP BY Category
HAVING AVG(Price) > 150
ORDER BY avg_price DESC;

21) SELECT 
  CustomerID,
  SUM(SaleAmount) AS total_sales
FROM Sales
GROUP BY CustomerID
HAVING SUM(SaleAmount) > 1500
ORDER BY total_sales DESC;

22) SELECT 
  DepartmentName AS DeptID,
  SUM(Salary) AS total_salary,
  AVG(Salary) AS avg_salary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 65000
ORDER BY avg_salary DESC;

23) SELECT 
  o.CustomerID,
  SUM(CASE WHEN o.Freight > 50 THEN o.TotalAmount ELSE 0 END) AS total_high_freight,
  MIN(o.TotalAmount) AS least_purchase
FROM tsql2012.sales.orders o
GROUP BY o.CustomerID
HAVING SUM(CASE WHEN o.Freight > 50 THEN o.TotalAmount ELSE 0 END) > 0
ORDER BY total_high_freight DESC;

24) SELECT 
  YEAR(OrderDate) AS order_year,
  MONTH(OrderDate) AS order_month,
  SUM(TotalAmount) AS total_sales,
  COUNT(DISTINCT ProductID) AS unique_products_sold
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(DISTINCT ProductID) >= 2
ORDER BY order_year, order_month;

25) SELECT 
  YEAR(OrderDate) AS order_year,
  MIN(Quantity) AS min_quantity,
  MAX(Quantity) AS max_quantity
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY order_year;
