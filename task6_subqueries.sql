SELECT u.UserName, (SELECT COUNT(*) FROM Orders o WHERE o.UserID = u.UserID) AS TotalOrders FROM Users u;
SELECT * FROM Users WHERE UserID IN (SELECT UserID FROM Orders);
SELECT * FROM Users u WHERE EXISTS ( SELECT 1 FROM Orders o WHERE o.UserID = u.UserID );
SELECT * FROM Users WHERE UserID = ( SELECT UserID fROM Orders GROUP BY UserID ORDER BY COUNT(*) DESC LIMIT 1 );
SELECT * FROM ( SELECT * FROM Products ORDER BY Price DESC LIMIT 3 ) AS TopProducts;
SELECT p.Name, (SELECT SUM(Quantity)  FROM OrderItems oi  WHERE oi.ProductID = p.ProductID) AS TimesOrdered FROM Products p;
SELECT * FROM Users WHERE UserID NOT IN ( SELECT DISTINCT UserID FROM Orders );
SELECT * FROM Products WHERE ProductID NOT IN ( SELECT DISTINCT ProductID FROM OrderItems );
SELECT * FROM Orders WHERE OrderID IN ( SELECT OrderID FROM OrderItems GROUP BY OrderID HAVING COUNT(*) > 1 );
SELECT * FROM Products
WHERE Price = ( SELECT MAX(Price) FROM Products );