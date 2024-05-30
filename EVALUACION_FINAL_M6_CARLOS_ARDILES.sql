--- CARLOS FRANCO ARDILES GONZALEZ

--- EVALUACION FINAL MODULO 6

--- 1. Obtener el nombre y la cantidad de productos vendidos de cada categoría en el año 1997.

SELECT CategoryName, ProductName, SUM([Order Details].Quantity) as 'Cantidad de Productos' from Products 
INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
INNER JOIN Orders ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE YEAR(OrderDate) = 1997
Group BY ProductName, CategoryName
ORDER BY CategoryName ASC
--- EN ESTA PREGUNTA ENTIENDO QUE SOLICITA EL NOMBRE DEL PRODUCTO Y CANTIDAD DE PRODUCTO, VENDIDO DE CADA CATEGORIA EN EL AÑO 1997

--- 2. Obtener el nombre del empleado, la cantidad de órdenes procesadas y el total de 
--- productos vendidos por cada empleado.

select (FirstName+' '+LastName) as 'Nombre Completo', COUNT(DISTINCT Orders.OrderID)  as 'Cantidad Ordenes', SUM([Order Details].Quantity) as 'Total Productos' from Orders
INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
GROUP BY (FirstName+' '+LastName)

--- 3. Obtener el nombre del cliente, la fecha de la primera orden realizada y el total gastado por 
--- cada cliente.

Select c.CompanyName, MIN(o.Orderdate) 'Primer Pedido',
SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) 'Total Pagado' from Customers c
INNER JOIN Orders o ON o.CustomerID = c.CustomerID
INNER JOIN [Order Details] od ON od.OrderID = o.OrderID
group by c.CompanyName
order by 'Primer Pedido' ASC


--- 4. Obtener el nombre del empleado, la cantidad de órdenes procesadas y el total de 
--- productos vendidos solo para los empleados que hayan procesado más de 50 órdenes.
--- CONSIDERÉ TOTAL DE PRODUCTOS VENDIDOS COMO LA CANTIDAD DE PRODUCTOS VENDIDOS 'QUANTITY'
Select (FirstName+' '+LastName) as 'Nombre y Apellido', COUNT(DISTINCT o.OrderID) 'Cantidad Ordenes',
SUM(od.Quantity) 'Cantidad Total Productos'
from Employees e
INNER JOIN Orders o ON o.EmployeeID = e.EmployeeID
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
Group By (FirstName+' '+LastName) HAVING COUNT(DISTINCT o.OrderID) > 50



--- 5. Obtener el nombre del producto, el precio unitario y la cantidad vendida de los productos 
--- que se encuentran en la categoría 'Beverages' y cuyo precio unitario sea mayor a $10.

Select p.ProductName, p.UnitPrice, SUM(od.Quantity) 'Cantidad Vendida'
from Products p
INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE od.UnitPrice > 10 and CategoryName = 'Beverages'
Group by p.ProductName , p.UnitPrice

--- 6.Obtener el nombre del cliente y el total gastado por cada cliente que haya realizado una 
--- orden en el mes de enero de cualquier año.Select CompanyName, SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) 'Total Pagado'from Customers cINNER JOIN Orders o ON c.CustomerID = o.CustomerIDINNER JOIN [Order Details] od ON o.OrderID = od.OrderIDGroup By c.CompanyName HAVING MIN(MONTH(o.OrderDate)) = 1order by CompanyName--- DE LA PREGUNTA SE ENTIENDE QUE QUIERE LOS CLIENTES QUE SOLO HAN HECHO 1 ORDEN EN EL MES DE ENERO


--- 7. Obtener el nombre del empleado y el total de productos vendidos por cada empleado que 
--- haya procesado órdenes en el año 1996 o 1997

select (FirstName+' '+LastName) as 'Nombre Completo', SUM(od.Quantity) as 'Total Productos Vendidos'
from Employees e
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE Year(OrderDate) BETWEEN 1996 AND 1997
GROUP BY (FirstName+' '+LastName)

--- 9. Obtener el nombre del producto, el precio unitario y la cantidad vendida de los productos 
--- que se encuentran en la categoría 'Confections' o 'Seafood' y cuyo precio unitario esté 
--- entre $5 y $10.

Select p.ProductName, p.UnitPrice, SUM(od.Quantity) 'Cantidad Vendida'
from Products p
INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE od.UnitPrice BETWEEN 5 and 10
and CategoryName = 'Confections' or CategoryName = 'Seafood'
Group by p.ProductName , p.UnitPrice

--- 10. Obtener el nombre del cliente, la fecha y el total gastado por cada cliente que haya 
--- realizado al menos una orden y cuyo total gastado sea mayor a $1000.
 Select  c.CompanyName, o.OrderDate, SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) 'Total Pagado'
 from Customers c 
 INNER JOIN Orders o ON c.CustomerID =o.CustomerID
 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
 Group by C.CompanyName, o.OrderDate 
 HAVING SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) > 1000

 --- 14. Obtener el nombre del producto, el precio unitario y la cantidad vendida de los productos 
--- cuyos nombres contengan la subcadena 'chocolate'
Select p.ProductName, p.UnitPrice, SUM(od.Quantity) 'Cantidad Vendida'
from Products p
INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
WHERE p.ProductName LIKE '%chocolate%'
Group by p.ProductName , p.UnitPrice




--------------------------------------------------------------------------
--------------------------------------------------------------------------
--- Cami me podrias dar un feedback de la siguiente pregunta, al final me rendi no pude
--- lograr que solo me mostrara 1 compra aunque le pusiera count = 1
--- 8. Obtener el nombre del cliente, la fecha y el total gastado por cada cliente que haya 
--- realizado una orden entre el 1 de enero de 1997 y el 31 de diciembre de 1998.
 Select  c.CompanyName, MIN(o.OrderDate) 'Fecha Compra', SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) 'Total Pagado'
 from Customers c 
 INNER JOIN Orders o ON c.CustomerID =o.CustomerID
 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
 WHERE o.Orderdate BETWEEN '1997-01-01' AND '1998-12-31' 
 Group by C.CompanyName
 Order by c.CompanyName
				