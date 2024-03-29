/**1. Listar todos los libros vendidos junto con la cantidad y el precio total de cada venta.**/
SELECT  LIBRO.TITULO, VENTA.CANTIDAD, (VENTA.CANTIDAD * LIBRO.PRECIO) AS PRECIO_TOTAL FROM VENTA JOIN LIBRO ON VENTA.CODIGO_LIBRO = LIBRO.CODIGO;
/**2. Encontrar el nombre completo de los clientes que han comprado libros.**/
SELECT cliente.NOMBRE  || ' ' || CLIENTE.APELLIDO AS NOMBRE_COMPLETO  from  VENTA JOIN LIBRO ON VENTA.CODIGO_LIBRO = LIBRO.CODIGO  JOIN CLIENTE ON VENTA.ID_CLIENTE = CLIENTE.ID_CLIENTE;
/**3. Calcular el total gastado por cada cliente en todas sus compras.**/
SELECT  CLIENTE.ID_CLIENTE, CLIENTE.NOMBRE || ' ' || CLIENTE.APELLIDO AS NOMBRE_COMPLETO, SUM(LIBRO.PRECIO * VENTA.CANTIDAD) AS TOTAL_GASTADO
FROM 
    CLIENTE 
JOIN 
    VENTA  ON CLIENTE.ID_CLIENTE = VENTA.ID_CLIENTE
JOIN 
    LIBRO  ON VENTA.CODIGO_LIBRO = LIBRO.CODIGO
GROUP BY 
    CLIENTE.ID_CLIENTE, NOMBRE_COMPLETO;

/**4. Encontrar los títulos de los libros vendidos en una fecha específica.**/
SELECT DISTINCT LIBRO.TITULO
FROM VENTA 
JOIN LIBRO  ON VENTA.CODIGO_LIBRO = LIBRO.CODIGO
WHERE VENTA.FECHA_VENTA = '2024-02-10';
/**5. Listar todos los clientes que han comprado el libro "El aleph".**/
SELECT  DISTINCT CLIENTE.ID_CLIENTE, CLIENTE.NOMBRE , CLIENTE.APELLIDO
FROM   CLIENTE 
JOIN  VENTA  ON CLIENTE.ID_CLIENTE = VENTA.ID_CLIENTE
JOIN  LIBRO  ON VENTA.CODIGO_LIBRO = LIBRO.CODIGO
WHERE LIBRO.TITULO = 'El aleph';   
/**6. Encontrar el autor que ha vendido más libros.**/

SELECT LIBRO.AUTOR, COUNT(*) AS NUMERO_DE_LIBROS_VENDIDOS
FROM LIBRO 
JOIN VENTA  ON LIBRO.CODIGO = VENTA.CODIGO_LIBRO
GROUP BY LIBRO.AUTOR ORDER BY NUMERO_DE_LIBROS_VENDIDOS DESC
LIMIT 1;

/**7. Obtener el título y el precio de los libros vendidos a un cliente específico.**/
SELECT LIBRO.TITULO,LIBRO.PRECIO
FROM  LIBRO  JOIN VENTA  ON LIBRO.CODIGO = VENTA.CODIGO_LIBRO
WHERE VENTA.ID_CLIENTE = 1;
/**8. Calcular el precio promedio de los libros vendidos.**/
SELECT AVG(LIBRO.PRECIO) AS PRECIO_PROMEDIO
FROM LIBRO  JOIN VENTA  ON LIBRO.CODIGO = VENTA.CODIGO_LIBRO;
/**9. Listar todos los libros que se han vendido más de una vez.**/
SELECT LIBRO.TITULO, COUNT(*) AS NUMERO_DE_VENTAS
FROM LIBRO 
JOIN VENTA  ON LIBRO.CODIGO = VENTA.CODIGO_LIBRO
GROUP BY LIBRO.TITULO
HAVING COUNT(*) > 1;

/**10. Encontrar los libros más caros comprados por María Martínez.**/

SELECT LIBRO.TITULO, LIBRO.PRECIO
FROM LIBRO 
JOIN VENTA  ON LIBRO.CODIGO = VENTA.CODIGO_LIBRO
JOIN CLIENTE  ON VENTA.ID_CLIENTE = CLIENTE.ID_CLIENTE
WHERE CLIENTE.NOMBRE = 'María' AND CLIENTE.APELLIDO = 'Martínez'
ORDER BY LIBRO.PRECIO DESC ;
