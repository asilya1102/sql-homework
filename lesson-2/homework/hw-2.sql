--Basic-Level Tasks (10)

--1 СОЗДАНИЕ ТАБЛИЦЫ
CREATE TABLE Employees1 (EMPID INT
,Name VARCHAR(50)
,SALARY DECIMAL(10,2));

--2 ВНЕСЕНИЕ ДАННЫХ
INSERT INTO Employees1 (EMPID, Name, SALARY)
VALUES (1, 'KRISTINA MIKHAYLOVA', 2000000);

INSERT INTO Employees1 (EMPID, Name, SALARY)
VALUES (1, 'KRISTINA MIKHAYLOVA', 2000000),
(2, 'MADINA ABDUVALIYEVA', 1500000),
(3, 'KRASNOVA YEKATERINA', 3000000);

--3 ИЗМЕНЕНИЕ ДАННЫХ
UPDATE Employees1
SET SALARY = 1700000
WHERE EMPID = 1;

--4 УДАЛЕНИЕ ДАННЫХ СО СТРОКИ
DELETE FROM Employees1
WHERE EMPID = 2;

--5 РАЗНИЦА МЕЖДУ  DELETE, TRUNCATE,  DROP.
-- DELETE УДАЛЯЕТ СТРОКУ, НО СОХРАНЯЕТ СТРУКТУРУ ТАБЛИЦЫ
-- TRUNCATE УДАЛЯЕТ ЗНАЧЕНИЯ ИЗ ВСЕХ СТРОК ТАБЛИЦЫ
-- DROP УДАЛЯЕТ ВСЮ ТАБЛИЦУ И НЕЛЬЗЯ ВОССТАНОВИТЬ, ЕСЛИ НЕТ РЕЗЕРВНОЙ КОПИИ 

--6 ИЗМЕНЕНИЕ ПАРАМЕТРОВ КОЛОНКИ NAME
ALTER TABLE Employees1
ALTER COLUMN NAME VARCHAR (100);  

--7 ДОБАВЛЕНИЕ СТОЛБЦА
ALTER TABLE Employees1
ADD Department VARCHAR (50); 

--8 ИЗМЕНЕНИЕ ТИПА ДАННЫХ 
ALTER TABLE Employees1
ALTER COLUMN SALARY FLOAT;

--9 СОЗДАНИЕ НОВОЙ ТАБЛИЦЫ
CREATE TABLE DEPARTMENTS (
DEPARTMENTID INT PRIMARY KEY
, DEPARTMENTNAME VARCHAR (50));

--10 УДАЛЕНИЕ ТАБЛИЦЫ EMPLOYEES1 C СОХРАНЕНИЕМ ЕГО СТРУКТУРЫ
TRUNCATE TABLE Employees1;



-- Intermediate-Level Tasks (6)

--11	ВВОД ЗНАЧЕНИЙ В ТАБЛИЦУ DEPARTMENTS
INSERT INTO DEPARTMENTS (DEPARTMENTID, DEPARTMENTNAME, SALARY) 
VALUES (1, 'HR', 200000)
,(2, 'FINANCIAL MANAGEMENT', 300000)
,(3, 'TREASURY', 400000)
,(4, 'LEGAL DEPARTMENT', 500000)
,(5, 'RETAIL', 500000);

-- 12 ИЗМЕНЕНИЕ НАЗВАНИЯ ДЕПАРТМЕНТА ГДЕ ЗП БОЛЬШЕ 500000 НА MANAGEMENT
UPDATE DEPARTMENTS
SET DEPARTMENTNAME = 'Management'
WHERE SALARY > 500000;

-- 13 УДАЛЕНИЕ ВСЕХ ДЕПАРТАМЕНТОВ С СОХРАНЕНИЕМ СТРУКТУРЫ ТАБЛИЦЫ
TRUNCATE TABLE DEPARTMENTS;

-- 14 УДАЛЕНИЕ СТОЛБЦА 
ALTER TABLE EMPLOYEES
DROP COLUMN DepartmentI;

--15 ПЕРЕИМЕНОВАНИЕ ТАБЛИЦЫ
EXEC sp_rename 'Employees', 'StaffMembers';

-- 16 ПОЛНОЕ УДАЛЕНИЕ ТАБЛИЦЫ
DROP TABLE DEPARTMENTS;

Advanced-Level Tasks (9)



-- 17 СОЗДАНИЕ ТАБЛИЦЫ 
CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName VARCHAR (50), Category VARCHAR (50), Price DECIMAL,  InStock BIT);

--18 ограничение с именем
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

-- 19 Modify the table to add a StockQuantity column with a DEFAULT value of 50.
ALTER TABLE Products
ADD Department VARCHAR (50); 

-- 20 Rename Category to ProductCategory
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

-- 21 Insert 5 records into the Products table using standard INSERT INTO queries.
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, InStock) 
VALUES 
    (1, 'APPLE', 'FRUIT', 150, 1),
    (2, 'JUICE', 'DRINK', 300, 1),
    (3, 'SNEAKERS', 'SWEETS', 800, 1),
    (4, 'POTATO', 'VEGETABLE', 500, 0),
    (5, 'ORANGE', 'FRUIT', 120, 1);

 -- 22 Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
 SELECT * INTO Products_Backup
FROM Products;

-- 23. Rename the Products table to Inventory.
EXEC sp_rename 'Products', 'Inventory';

-- 24 Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

-- 25 Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.
INSERT INTO Inventory (ProductID, ProductName, ProductCategory, Price, InStock)
SELECT ProductID, ProductName, ProductCategory, Price, InStock FROM Inventory;
