-- Datebase is demo
--SELECT * FROM Shippers
--SELECT * FROM Employees
--SELECT * FROM Orders
--SELECT * FROM Suppliers
--SELECT * FROM Products
--SELECT CategoryName, Description FROM Categories
--SELECT FirstName, LastName, HireDate FROM Employees WHERE Title = 'Sales Representative' AND Country = 'USA'
--SELECT OrderID, OrderDate FROM Orders WHERE EmployeeID = 5
--SELECT SupplierID, ContactName, ContactTitle FROM Suppliers WHERE ContactTitle != 'Marketing Manager'
--SELECT ProductID, ProductName FROM Products WHERE ProductName LIKE '%queso%'
--SELECT OrderID, CustomerID, ShipCountry FROM Orders WHERE ShipCountry IN ('France','Belgium')
--SELECT FirstName, LastName, Title, BirthDate FROM Employees ORDER BY BirthDate asc
--SELECT FirstName, LastName, Title, DateOnlyBirthDate= convert(date, BirthDate) FROM Employees ORDER BY BirthDate asc
--SELECT FirstName, LastName, FirstName + ' ' + LastName AS FullName FROM Employees 
--SELECT * FROM OrderDetails 
--SELECT OrderID, ProductID, UnitPrice, Quantity, UnitPrice*Quantity AS TotalPrice FROM OrderDetails 
--SELECT count(CustomerID) AS TotalNumberOfCustomer FROM Customers
--SELECT min(OrderDate) FROM Orders 
--SELECT Country FROM Customers group by country
--SELECT ContactTitle, COUNT(*) AS TotalContactTitle FROM Customers GROUP BY ContactTitle ORDER BY TotalContactTitle desc
--SELECT * FROM Suppliers
--SELECT * FROM Products
--SELECT ProductID, ProductName, CompanyName FROM Products p JOIN Suppliers s ON p.SupplierID = s.SupplierID
--SELECT * FROM Shippers
--SELECT * FROM Orders
--FROM Orders o INNER JOIN Shippers s ON o.ShipVia = s.ShipperID WHERE OrderID < 10300 ORDER BY OrderID

--SELECT * FROM Products
--SELECT * FROM Categories

--SELECT CategoryName, COUNT(p.CategoryID) FROM Categories c INNER JOIN Products p ON c.CategoryID = p.ProductID GROUP BY CategoryName
--SELECT CategoryName, COUNT(*) FROM Categories c INNER JOIN Products p ON c.CategoryID = p.ProductID GROUP BY CategoryName
--SELECT CategoryName, COUNT(*) FROM  Products p INNER JOIN Categories c ON  p.CategoryID = c.CategoryID  GROUP BY CategoryName
   --  order by count(*) desc
--Select CategoryName, TotalProducts = count (*) From Products p Join Categories  c on p. CategoryID = c. CategoryID Group by CategoryName
    -- Order by count (*) desc
--SELECT CategoryName, count(p.CategoryID)  FROM  Products p 
   --INNER JOIN Categories c ON  p.CategoryID = c.CategoryID group by CategoryName order by  count(p.CategoryID) desc
--SELECT Country, city, Count(*) FROM Customers Group by Country, City order by Count(*) desc, country
--SELECT * FROM Products
--SELECT ProductID, ProductName, UnitsInStock, ReorderLevel FROM Products WHERE UnitsInStock < ReorderLevel ORDER BY ProductID

	/*Select
		ProductID
		, ProductName
		, UnitsInStock
		, ReorderLevel
		From Products
		Where
		UnitsInStock <= ReorderLevel
		Order by ProductID */

--23





