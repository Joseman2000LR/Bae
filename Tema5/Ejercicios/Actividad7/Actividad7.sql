
/**1. Mostrar todos los productos de la categoría "Bebidas".**/
SELECT * FROM PRODUCTOS WHERE categoria ='Bebidas';
/**2. Listar los productos ordenados por precio de forma descendente.**/
SELECT  * FROM PRODUCTOS order by precio desc; 
/**3. Calcular el precio total de todos los productos en la tabla "productos".**/
SELECT  avg(precio) from PRODUCTOS ;
/**4. Encontrar los productos con un nombre que contenga la letra 'a'.**/
SELECT * FROM PRODUCTOS WHERE nombre like '%a%';
/**5. Obtener la cantidad total de productos vendidos en todas las fechas.**/
SELECT avg(productos.precio), ventas.fecha from  productos inner join VENTAS on productos.ID =ventas.ID_PRODUCTO GROUP BY VENTAS.FECHA ORDER by Ventas.FECHA;
/**6. Encontrar el producto más caro en cada categoría.**/
SELECT PRODUCTOS.NOMBRE , productos.precio from  productos INNER JOIN VENTAS ON PRODUCTOS.ID =VENTAS.ID_PRODUCTO  GROUP BY VENTAS.FECHA ORDER BY productos.precio DESC LIMIT 1;
/**7. Listar los productos que no han sido vendidos.**/
SELECT PRODUCTOS.* FROM  PRODUCTOS LEFT JOIN VENTAS ON PRODUCTOS.ID =VENTAS.ID_PRODUCTO WHERE  VENTAS.ID_PRODUCTO IS NULL;
/**8. Calcular el precio promedio de los productos en la categoría "Snacks".**/
SELECT AVG(precio) AS precio_promedio_snacks FROM Productos WHERE categoria = 'Snacks';
/**9. Encontrar los productos que han sido vendidos más de 5 veces.**/
SELECT id_producto, COUNT(*) AS cantidad_ventas FROM VENTAS GROUP BY id_producto HAVING COUNT(*) > 5;
/**10. Mostrar la fecha y la cantidad de ventas para cada producto.**/
SELECT ID_PRODUCTO,    FECHA, SUM(CANTIDAD) AS CANTIDAD_VENTAS FROM   VENTAS GROUP BY ID_PRODUCTO,   FECHA;
/**11. Encontrar los productos que tienen un precio menor o igual a 2.**/
SELECT * FROM Productos WHERE precio <= 2;
/**12. Calcular la cantidad total de ventas para cada fecha.**/
SELECT fecha, SUM(cantidad) AS cantidad_total_ventas FROM Ventas GROUP BY fecha;
/**13. Listar los productos cuyo nombre comienza con la letra 'P'.**/
SELECT * FROM Productos WHERE nombre LIKE 'P%';
/**14. Obtener el producto más vendido en términos de cantidad.**/
SELECT ID_PRODUCTO, SUM(CANTIDAD) AS TOTAL_VENTAS FROM  VENTAS GROUP BY ID_PRODUCTO ORDER BY TOTAL_VENTAS DESC LIMIT 1;

/**15. Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.**/
SELECT * FROM Ventas WHERE fecha = '2024-01-18';
/**16. Calcular el total de ventas para cada producto.**/
SELECT id_producto, SUM(cantidad) AS total_ventas FROM Ventas GROUP BY id_producto;
/**17. Encontrar los productos con un precio entre 3 y 4.**/
SELECT * FROM Productos WHERE precio BETWEEN 3 AND 4;
/**18. Listar los productos y sus categorías ordenados alfabéticamente por categoría.**/
SELECT  PRODUCTOS.*,  Productos.CATEGORIA  FROM  PRODUCTOS INNER JOIN VENTAS  ON PRODUCTOS.ID =VENTAS.ID_PRODUCTO ORDER BY PRODUCTOS.nombre;
/**19. Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.**/
SELECT SUM(Productos.precio * Ventas.cantidad) AS precio_total FROM Ventas INNER JOIN Productos ON PRODUCTOS.ID =VENTAS.ID_PRODUCTO WHERE Ventas.fecha = '2024-01-19';
/**20. - Mostrar los productos que no pertenecen a la categoría "Higiene".**/
SELECT Productos.* FROM Productos JOIN VENTAS ON PRODUCTOS.ID =VENTAS.ID_PRODUCTO WHERE PRODUCTOS.CATEGORIA != 'Higiene';
/**21. - Encontrar la cantidad total de productos en cada categoría.**/
SELECT PRODUCTOS.nombre , COUNT(PRODUCTOS.id) AS cantidad_productos FROM Productos JOIN VENTAS ON PRODUCTOS.ID =VENTAS.ID_PRODUCTO GROUP BY PRODUCTOS.nombre;
/**22. - Listar los productos que tienen un precio igual a la media de precios.**/
SELECT * FROM Productos WHERE precio = (SELECT AVG(precio) FROM Productos);

/**23. - Calcular el precio total de los productos vendidos en cada fecha.**/
SELECT fecha, SUM(precio * cantidad) AS precio_total FROM Ventas JOIN Productos ON Ventas.id_producto = Productos.id GROUP BY fecha;
/**24. - Mostrar los productos con un nombre que termina con la letra 'o'.**/
SELECT * FROM Productos WHERE nombre LIKE '%o';
/**25. - Encontrar los productos que han sido vendidos en más de una fecha.**/
SELECT ID_PRODUCTO FROM Ventas GROUP BY ID_PRODUCTO HAVING COUNT(DISTINCT fecha) > 1;
/**26. - Listar los productos cuya categoría comienza con la letra 'L'.**/
SELECT Productos.* FROM Productos JOIN VENTAS ON Productos.id = VENTAS.id_producto WHERE PRODUCTOS.CATEGORIA LIKE 'L%';
/**27. - Calcular el total de ventas para cada producto en la fecha '2024-01-17'.**/
SELECT id_producto, SUM(cantidad) AS total_ventas FROM Ventas WHERE fecha = '2024-01-17' GROUP BY id_producto;
/**28. - Mostrar los productos cuyo nombre tiene al menos 5 caracteres.**/
SELECT * FROM Productos WHERE LENGTH(nombre) >= 5;
/**29. - Encontrar los productos que tienen un precio superior al precio máximo en la tabla "productos".**/
SELECT * FROM Productos WHERE precio > (SELECT MAX(precio) FROM Productos);
