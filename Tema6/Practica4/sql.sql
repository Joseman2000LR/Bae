--1. Inserta el tipo de servicio Ocio.
INSERT INTO TIPOSERVICIO VALUES ('Ocio');
--2. Da de alta una reserva de la habitación 101 para el cliente 12345 para las noches 
-- del 2 al 4 de julio de 2024. El código de la reserva es autonumérico.
INSERT INTO RESERVAHABITAC (
    FECHAENTRADA,
    FECHASALIDA,
    IVA,
    NUMHABITACION,
    CLIENTE
) VALUES (
    '2024-07-02',
    '2024-07-04',
    0.07,
    101,
    '12345'
);
--3. Actualiza el teléfono del cliente 12345. Su nuevo número es 123456789.
UPDATE CLIENTE
SET
    TELEFONO = '123456789'
WHERE
    IDCLIENTE = '12345';
--4. Actualiza el precio de los servicios incrementándose en un 2%.
UPDATE SERVICIO
SET
    PRECIO = PRECIO * 1.02;
--5. Borra la reserva de la habitación 101 realizada anteriormente.  
mirar
DELETE FROM RESERVAHABITAC
WHERE
    NUMHABITACION = 101;
--6. Borra los tipos de servicio que no tienen servicios definidos.
DELETE FROM TIPOSERVICIO
WHERE
    NOMBRESERVICIO NOT IN (
        SELECT
            NOMBRESERVICIO
        FROM
            SERVICIO
    );
--7. Crea una vista que devuelva los clientes cuyo apellido incluya la sílaba “le”
--ORDENADOS POR SU IDENTIFICADOR.
        CREATE VIEW CLIENTESCON_LE AS
    SELECT
        IDCLIENTE,
        PAIS,
        NOMBRE,
        PRIMERAPELLIDO,
        SEGUNDOAPELLIDO,
        DIRECCION,
        TELEFONO,
        OBSERVACIONES
    FROM
        CLIENTE
    WHERE
        PRIMERAPELLIDO LIKE '%le%'
        OR SEGUNDOAPELLIDO LIKE '%le%';


        ORDER BY
IDCLIENTE;

        preguntar
--8. Crea una vista que devuelva los clientes, ordenados por su primer apellido, que
--TENGAN ALGUNA OBSERVACIÓN ANOTADA.
CREATE VIEW CLIENTESCONOBSERVACIONES AS
    SELECT
        IDCLIENTE,
        PAIS,
        NOMBRE,
        PRIMERAPELLIDO,
        SEGUNDOAPELLIDO,
        DIRECCION,
        TELEFONO,
        OBSERVACIONES
    FROM
        CLIENTE
    WHERE
        OBSERVACIONES IS NOT NULL;
--9. Crea una vista que devuelva los servicios cuyo precio supere los 5€ ordenados por
--SU CÓDIGO DE SERVICIO.
CREATE VIEW SERVICIOSPRECIO_SUPERIOR5 AS
    SELECT
        *
    FROM
        SERVICIO
    WHERE
        PRECIO > 5;
--10. Crea una consulta que devuelva las habitaciones reservadas para el día 15 de
--MARZO DE 2023.

--11. Crea una consulta que devuelva los clientes procedentes de España y Francia.

--12. Crea una vista que devuelva los clientes que han utilizado el servicio de comedor.

--13. Crea una vista que devuelva las características de cada habitación reservada.

--14. Crea una consulta que devuelva los precios de los distintos tipos de habitación por TEMPORADA.

--15. Crea una consulta que devuelva todos los clientes, y de aquellos que han realizado
--ALGUNA RESERVA EN MARZO, INDICAR EL NO DE RESERVA.

--16. Crea una vista con los servicios que nunca han sido contratados.

--17. Crea una consulta que devuelva los clientes con el mismo primer apellido.

--18. Crea una vista que devuelva el no de clientes por nacionalidad.

--19. Crea una vista que devuelva el no de habitaciones por categoría de habitación.

--20. Crea una vista que devuelva el no de servicios que se ofrecen por tipo de servicio.

--21. Crea una consulta que devuelva el gasto en servicios realizado por cada reserva.

--22. Crea una consulta que devuelva el precio del servicio más caro y del más barato.

--23. Crear una vista que muestre todos los datos del cliente excepto las observaciones.

--ACTUALIZAR EL NOMBRE DE UNO DE LOS CLIENTES UTILIZANDO ESTA VISTA.

--24. Crear una vista que muestre el id, nombre y primer apellido de todos los clientes y el

--GASTO TOTAL QUE HAN REALIZADO EN EL HOTEL EN SUS DIFERENTES ESTANCIAS.

--25. Crea un índice sobre el atributo pais de la tabla cliente, con objeto de agilizar las BÚSQUEDAS.

--26. Crea un índice sobre el atributo numHabitacion de la tabla ReservaHabitac, con OBJETO DE AGILIZAR LAS BÚSQUEDAS.

--27. Crea un índice sobre el atributo nombreServicio de la tabla Servicio, con objeto de AGILIZAR LAS BÚSQUEDAS.

--28. Añada una columna calculada en la tabla gastos que obtenga el importe por línea (CANTIDAD Y PRECIO)  SIN APLICAR EL IVA. 

--29. AÑADA UNA COLUMNA EN SERVICIOS QUE INDIQUE SI EL SERVICIO SE OFRECE A LOS CLIENTES O NO. 

--30. MOSTRAR EL PRECIO DE LAS HABITACIONES Y SUS RESPECTIVOS TIPOS DURANTE LA TEMPORADA DE VERANO (TIPO 'A').