--- Easy-Level Tasks

1) SELECT ProductName AS Name 
FROM Products;
2) SELECT *
FROM Customers AS Client;
3) Select ProductName from Products
Union 
Select ProductName from Products_Discounted
4) Select ProductName from Products
intersect 
Select ProductName from Products_Discounted
5) SELECT DISTINCT FirstName, Country
FROM Customers;
6) SELECT ProductName, Price,
       CASE
           WHEN Price > 1000 THEN 'High'
           WHEN Price < 1000 THEN 'Low'
       END AS PriceCategory
FROM Products;
7) SELECT StockQuantity,
       IIF(StockQuantity > 100, 'Yes', 'No') AS InStockStatus
FROM Products_Discounted;

--- Medium-Level Tasks
8) 
Select ProductName from Products
union 
Select ProductName from Products_Discounted
9) 
Select ProductName from Products
except 
Select ProductName from Products_Discounted
10) SELECT Price,
       IIF(Price > 1000, 'Expensive', 'Affordable') AS InStockStatus
FROM Products;
11) 
Select *
from Employees2
where Age < 25 or Salary > 60000;
12)UPDATE Employees2
SET Salary = Salary * 1.10
WHERE DepartmentName = 'HR' OR EmployeeID = 5;

--- Hard-Level Tasks
13) SELECT *,
  CASE
    WHEN SaleAmount > 500 THEN 'Top Tier'
    WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Low Tier'
  Else 'Others'
  END AS SaleAmountCategory
FROM Sales;
14) SELECT CustomerID
FROM Orders

EXCEPT

SELECT CustomerID
FROM Sales;

15) SELECT 
    CustomerID,
    Quantity,
    CASE 
        WHEN Quantity = 1 THEN 0.03
        WHEN Quantity BETWEEN 2 AND 3 THEN 0.05
        ELSE 0.07
    END AS DiscountPercentage
FROM Orders;
