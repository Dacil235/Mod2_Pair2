/*Ciudades que empiezan con "A" o "B".

Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquellas compañías que están afincadas en ciudades que empiezan por "A" o "B". Necesita que le devolvamos la ciudad, el nombre de la compañía y el nombre de contacto.

Los resultados deberán ser:*/

USE northwind; 

SELECT CompanyName,ContactName,City
	FROM customers
	WHERE City LIKE "A%" OR City LIKE "B%" ;
    
    /*Número de pedidos que han hecho en las ciudades que empiezan con L.

En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total de pedidos que han hecho todas las ciudades que empiezan por "L".

Deberéis tener una tabla como la siguiente:*/

SELECT CompanyName,ContactName,City,COUNT(OrderID)
	FROM customers AS c
    LEFT JOIN orders AS o
    ON c.CustomerID = o.CustomerID
	WHERE City LIKE "L%"
    GROUP BY CompanyName,ContactName,City;
    

SELECT CompanyName,ContactName,MIN(city),COUNT(OrderID)
	FROM customers AS c
    LEFT JOIN orders AS o
    ON c.CustomerID = o.CustomerID
	WHERE City LIKE "L%"
    GROUP BY CompanyName,ContactName;
    
    /*Todos los clientes cuyo "country" no incluya "Sales".

Nuestro objetivo es extraer los clientes que no tengan el titulo de "Sales" en "ContactTitle" . Extraer el nombre de contacto, su titulo de contacto y el nombre de la compañía.*/
  
  SELECT ContactName,ContactTitle,CompanyName
  FROM customers
  WHERE ContactTitle NOT LIKE ("%Sales%") 
     
