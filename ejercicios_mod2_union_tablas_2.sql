USE northwind;

/*Empleadas que sean de la misma ciudad:
Desde recursos humanos nos piden realizar una consulta que muestre por pantalla los datos de todas las empleadas y sus supervisoras. Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas. Investiga el resultado, ¿sabes decir quién es el director?*/

SELECT e.EmployeeID, e.FirstName, e.LastName, e.Title, j.FirstName, j.LastName, e.ReportsTo, j.Title
	FROM employees AS e
    LEFT JOIN employees AS j
		ON j.EmployeeID = e.ReportsTo;
        
/*El equipo de marketing necesita una lista con todas las categorías de productos, incluso si no tienen productos asociados. Queremos obtener el nombre de la categoría y el nombre de los productos dentro de cada categoría. Podriamos usar un RIGTH JOIN con 'categories'?, usemos tambien la tabla 'products'.*/

SELECT c.CategoryName, p.ProductName
	FROM products AS p
    RIGHT JOIN categories AS c
		ON c.CategoryID = p.CategoryID;
        
/*Desde el equipo de ventas nos piden obtener una lista de todos los pedidos junto con los datos de las empresas clientes. Sin embargo, hay algunos pedidos que pueden no tener un cliente asignado. Necesitamos asegurarnos de incluir todos los pedidos, incluso si no tienen cliente registrado.*/

SELECT c.CustomerID, c.CompanyName, o.OrderID
	FROM orders as o
    LEFT JOIN customers AS c
    ON c.CustomerID = o.CustomerID;
    
/*El equipo de Recursos Humanos quiere saber qué empleadas han gestionado pedidos y cuáles no. Queremos obtener una lista con todas las empleadas y, si han gestionado pedidos, mostrar los detalles del pedido.*/

SELECT o.OrderID, od.ProductID, od.UnitPrice, od.Quantity, od.Discount, o.EmployeeID, e.FirstName
	FROM orderdetails AS od
    LEFT JOIN orders AS o
		ON od.OrderID = o.OrderID
        LEFT JOIN employees AS e
			 ON o.EmployeeID = e.EmployeeID;

	
/*Desde el área de logística nos piden una lista de todos los transportistas (shippers) y los pedidos que han enviado. Queremos asegurarnos de incluir todos los transportistas, incluso si no han enviado pedidos*/

SELECT ShipperID,
	