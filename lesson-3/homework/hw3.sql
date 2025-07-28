BULK INSERT позволяет импортировать большой объем данных из файла (например, .txt, .csv) в таблицу SQL Server.
BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
Импорт из Excel через OPENROWSET (требует настройки драйверов)
SELECT * INTO TempTable
FROM OPENROWSET(
    'Microsoft.ACE.OLEDB.12.0',
    'Excel 12.0;Database=C:\Data\products.xlsx;HDR=YES',
    'SELECT * FROM [Sheet1$]'
);
Экспорт данных (Excel, Text)
🔸 Экспорт в текстовый файл (через BCP)
bcp "SELECT * FROM Products" queryout "C:\Data\products_export.txt" -c -T -S localhost
Экспорт в Excel — напрямую не поддерживается в T-SQL
Обычно экспорт делают через SSIS, PowerShell или сторонние скрипты.
Комментарии, автоинкремент, NULL/NOT NULL
-- Комментарий: создаем таблицу продуктов
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY, -- автоинкремент
    ProductName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255) NULL
);
Уникальный ключ, первичный ключ, внешний ключ, ограничение Check
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(50) UNIQUE CHECK (LEN(CategoryName) > 2)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID)
);
Различия между UNIQUE KEY и PRIMARY KEY
--- PRIMARY KEY
Кол-во на таблицу - Только один
Допускает NULL - нет
Автоматический индекс- Кластеризованный по умолчанию
Назначение- Уникальный идентификатор строки

--- UNIQUE KEY
Кол-во на таблицу - Множественные
Допускает NULL - да
Автоматический индекс- Некластеризованный по умолчанию
Назначение- Гарантия уникальности значения

--- Easy-Level Tasks (10)
1. BULK INSERT используется для массовой загрузки данных из внешнего файла (например, .txt или .csv) в таблицу SQL Server. Это самый быстрый способ вставки большого объема данных.
2. Четыре формата файлов, которые можно импортировать в SQL Server
CSV (Comma-Separated Values)

TXT (Text File)

XLS/XLSX (Excel File)

XML (eXtensible Markup Language)

3. CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);
4. INSERT INTO Products (ProductID, ProductName, Price)
VALUES
(1, 'Keyboard', 29.99),
(2, 'Mouse', 15.50),
(3, 'Monitor', 120.00);

5. NULL — значение отсутствует, т.е. поле может остаться пустым. NOT NULL — значение обязательно должно быть указано.
6. ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
7. -- Создание таблицы продуктов с уникальными именами и ценой
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50) UNIQUE,
    Price DECIMAL(10,2)
);
8. ALTER TABLE Products
ADD CategoryID INT;
9. CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);
10. Столбец IDENTITY автоматически увеличивает значение при каждой новой вставке. Он используется для создания уникальных ключей без необходимости вручную указывать значения.
Medium-Level Tasks (10)
11. BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
12. ALTER TABLE Products
ADD CONSTRAINT FK_Category
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);
13. PRIMARY KEY
Уникальность - Обеспечивает
NULL значения - 	Не допускает
Кол-во на таблицу - Только один
Тип индекса по умолчанию - Кластеризованный

UNIQUE KEY
Уникальность - Обеспечивает
NULL значения - 	допускает
Кол-во на таблицу - Может быть несколько
Тип индекса по умолчанию - Некластеризованный

14. ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive
CHECK (Price > 0);
15. ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;
16. SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price, Stock
FROM Products;
17. Назначение FOREIGN KEY
Внешний ключ (FOREIGN KEY) — это ограничение, которое создаёт связь между таблицами. Он гарантирует:

Целостность данных: нельзя вставить значение, которого нет в связанной таблице.

Связь между сущностями, например: каждый продукт связан с существующей категорией.

Hard-Level Tasks (10)
18. CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Age INT CHECK (Age >= 18)
);
19.     CREATE TABLE TicketNumbers (
    TicketID INT IDENTITY(100, 10) PRIMARY KEY,
    Description NVARCHAR(100)
);
20. CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);
21. ISNULL(expression, replacement) возвращает replacement, если expression равен NULL. Работает только с двумя аргументами.
SELECT ISNULL(Price, 0) AS AdjustedPrice FROM Products;
COALESCE(expr1, expr2, ..., exprN) возвращает первый ненулевой (NOT NULL) аргумент из списка. Гибче, чем ISNULL.
SELECT COALESCE(Discount, Price, 0) AS FinalPrice FROM Products;
22. CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Email NVARCHAR(100) UNIQUE
);
23. CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
