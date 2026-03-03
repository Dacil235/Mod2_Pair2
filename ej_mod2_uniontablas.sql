USE northwind;

/* 
1. Pedidos por empresa en UK:
Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK. 
Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos. */
SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID)
	FROM customers AS c
		INNER JOIN orders AS o
			ON c.CustomerID = o.CustomerID
	WHERE ShipCountry = 'UK'
    GROUP BY c.CustomerID, c.CompanyName;
    
/* 
2. Productos pedidos por empresa en UK por año:
Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y han decidido pedirnos una serie de consultas adicionales. 
La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. 
Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins. */
SELECT c.CompanyName, o.OrderDate, COUNT(od.Quantity), o.CustomerID, c.CustomerID -- PRUEBA PARA LLEGAR AL CORRECTO 
	FROM orderdetails AS od
		INNER JOIN orders AS o 
			ON od.OrderID = o.OrderID
		INNER JOIN customers AS c
			ON o.CustomerID = c.CustomerID
	WHERE ShipCountry = 'UK'
    GROUP BY c.CompanyName, o.OrderDate, od.Quantity;
    
SELECT c.CompanyName, YEAR(o.OrderDate), SUM(od.Quantity), od.ProductID -- ESTE ES EL CORRECTO 
	FROM orders AS o
		INNER JOIN orderdetails AS od 
			ON o.OrderID = od.OrderID
		INNER JOIN customers AS c
			ON o.CustomerID = c.CustomerID
	WHERE ShipCountry = 'UK'
    GROUP BY c.CompanyName, o.OrderDate, od.ProductID;
    
/* Pedidos que han realizado cada compañía y su fecha:
Después de estas solicitudes desde UK y gracias a la utilidad de los resultados que se han obtenido, desde la central nos han pedido una consulta que indique el nombre de cada compañía 
cliente junto con cada pedido que han realizado y su fecha. */
SELECT c.CompanyName, o.OrderDate, o.OrderID
	FROM orders AS o
		INNER JOIN orderdetails AS od 
			ON o.OrderID = od.OrderID
		INNER JOIN customers AS c
			ON o.CustomerID = c.CustomerID
    GROUP BY c.CompanyName, o.OrderDate, o.OrderID;
    
/* Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y el nombre del producto, 
y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos). */
