/**1. Listar todos los libros vendidos junto con la cantidad y el precio total de cada venta.**/
SELECT  LIBRO.TITULO, VENTA.CANTIDAD, (VENTA.CANTIDAD * LIBRO.PRECIO) AS PRECIO_TOTAL FROM VENTA JOIN LIBRO ON VENTA.CODIGO_LIBRO = LIBRO.CODIGO;
/**2. Encontrar el nombre completo de los clientes que han comprado libros.**/
SELECT cliente.NOMBRE  || ' ' || CLIENTE.APELLIDO AS NOMBRE_COMPLETO  from  VENTA JOIN LIBRO ON VENTA.CODIGO_LIBRO = LIBRO.CODIGO  JOIN CLIENTE ON VENTA.ID_CLIENTE = CLIENTE.ID_CLIENTE;
/**3. Calcular el total gastado por cada cliente en todas sus compras.**
/

/**4. Encontrar los títulos de los libros vendidos en una fecha específica.**
/

/**5. Listar todos los clientes que han comprado el libro "El aleph".**
/

/**6. Encontrar el autor que ha vendido más libros.**
/

/**7. Obtener el título y el precio de los libros vendidos a un cliente específico.**
/

/**8. Calcular el precio promedio de los libros vendidos.**
/

/**9. Listar todos los libros que se han vendido más de una vez.**
/

/**10. Encontrar los libros más caros comprados por María Martínez.**/
