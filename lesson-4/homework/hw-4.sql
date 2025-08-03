--- Easy-Level Tasks (10)

SELECT* FROM Products_Backup
1) SELECT TOP 5 *
FROM Employees
ORDER BY Salary DESC;

2) SELECT DISTINCT ProductCategory
FROM Products_Backup

3) SELECT *
FROM Products_Backup
WHERE Price > 100;

4) SELECT *
FROM Employees
WHERE FullName LIKE 'a%';

5) SELECT * FROM Products_Backup
ORDER BY Price ASC;

6) SELECT *
FROM Employees
WHERE Position = 'MANAGER' AND SALARY >= 6000;

7) SELECT ISNULL(EMAIL, 'noemail@example.com')
FROM Employees;

8) SELECT * FROM Products_Backup
WHERE Price BETWEEN 50 AND 100;

9) SELECT DISTINCT ProductCategory, ProductName
FROM Products_Backup

--10)
ORDER BY ProductName DESC

----Medium-Level Tasks (10)



11) SELECT TOP 10 *
FROM Products_Backup
ORDER BY Price DESC;

12) SELECT COALESCE(FULLNAME, pOSITION) AS SORT
FROM Employees;


13) SELECT DISTINCT ProductCategory, Price
FROM Products_Backup

14) SELECT *
FROM Employees
WHERE Position = 'MANAGER' AND age between 30 and 40;

15) 

 SELECT Salary
FROM Employees
ORDER BY Salary desc
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

16) SELECT *
FROM Products_Backup
WHERE Price <= 1000 AND InStock > 50
ORDER BY inStock ASC;

17) SELECT *
FROM Products_Backup
WHERE ProductName LIKE '%e%';

18) SELECT *
FROM Employees
where Position in ('Clerk', 'Developer', 'Analyst')

19) SELECT *
FROM Customers
ORDER BY City ASC, PostalCode DESC;

--- Hard-Level Tasks
20) SELECT TOP(5) ProductName, SalesAmount
FROM Products
ORDER BY SalesAmount DESC;

21) SELECT FirstName + ' ' + LastName AS FullName
FROM Employees;

22) SELECT DISTINCT Category, ProductName, Price
FROM Products
WHERE Price > 50;
 
 23) SELECT ProductName, Price
FROM Products
WHERE Price < (SELECT AVG(Price) FROM Products) * 0.1;

24) SELECT *
FROM Employees
WHERE Age < 30 AND Department IN ('HR', 'IT');

25) SELECT *
FROM Customers
WHERE Email LIKE '%@gmail.com';

26) SELECT *
FROM Employees
WHERE Salary > ALL (
    SELECT Salary
    FROM Employees
    WHERE Department = 'Sales'
);

27) SELECT *
FROM Orders
WHERE LATEST_DATE BETWEEN DATEADD(DAY, -180, CAST(GETDATE() AS DATE)) AND CAST(GETDATE() AS DATE);
