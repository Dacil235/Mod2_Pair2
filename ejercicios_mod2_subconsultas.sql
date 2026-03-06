USE northwind;

/*Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. Para eso nos pide que lo hagamos con una query correlacionada.*/

SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate
	FROM orders AS o
    WHERE OrderDate = ( SELECT MAX(OrderDate)
							FROM orders AS o2
							WHERE o.EmployeeID = o2.EmployeeID);

/*Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. En concreto, tienen especial interés por los productos con categoría "Beverages". Devuelve el ID del producto, el nombre del producto y su ID de categoría.*/

SELECT CategoryID -- primera consulta para visualizancion de datos.
	FROM categories
    WHERE CategoryName = "Beverages";

SELECT ProductID, ProductName, CategoryID
	FROM products
    WHERE CategoryID IN (SELECT CategoryID
							FROM categories
							WHERE CategoryName = "Beverages");

/*Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países para buscar proveedores adicionales.*/

SELECT DISTINCT (Country)
	FROM customers
    WHERE Country NOT IN(SELECT Country
							FROM suppliers);
                            
/*Extraer los clientes que compraron mas de 20 artículos "Grandma's Boysenberry Spread"
Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.*/

SELECT OrderID, CompanyName
	FROM customers AS c
    INNER JOIN orders AS o
    ON c.CustomerID = o.CustomerID
    WHERE o.OrderID IN (SELECT od.OrderID
							FROM orderdetails AS od
							WHERE Quantity > 20 AND ProductID = 6);

/*Qué producto es más popular: Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró.*/

