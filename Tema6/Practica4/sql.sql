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
SELECT
    *
FROM
    RESERVAHABITAC
WHERE
    FECHA_RESERVA = '2023-03-15';
--11. Crea una consulta que devuelva los clientes procedentes de España y Francia.
SELECT
    *
FROM
    CLIENTES
WHERE
    NACIONALIDAD IN ('España', 'Francia');
-- 12. Crea una vista que devuelva los clientes que han utilizado el servicio de comedor.
--13. Crea una vista que devuelva las características de cada habitación reservada.

--14. Crea una consulta que devuelva los precios de los distintos tipos de habitación por TEMPORADA.
SELECT
    T.TIPO_TEMPORADA,
    P.TIPO_HABITACION,
    P.PRECIO
FROM
    PRECIOS_HABITACIONES P
    INNER JOIN TEMPORADAS T
    ON P.TEMPORADA_ID = T.ID_TEMPORADA;
--15. Crea una consulta que devuelva todos los clientes, y de aquellos que han realizado
--ALGUNA RESERVA EN MARZO, INDICAR EL NO DE RESERVA.
SELECT
    C.*,
    R.NUMERO_RESERVA
FROM
    CLIENTES C
    LEFT JOIN RESERVAS R
    ON C.ID_CLIENTE = R.ID_CLIENTE
    AND MONTH(R.FECHA_RESERVA) = 3;
--16. Crea una vista con los servicios que nunca han sido contratados.
CREATE VIEW SERVICIOS_NO_CONTRATADOS AS
    SELECT
        *
    FROM
        SERVICIOS
    WHERE
        NOMBRE_SERVICIO NOT IN (
            SELECT
                DISTINCT NOMBRE_SERVICIO
            FROM
                RESERVAS
        );
--17. Crea una consulta que devuelva los clientes con el mismo primer apellido.
SELECT
    C1.*
FROM
    CLIENTES C1
    INNER JOIN CLIENTES C2
    ON SUBSTRING_INDEX(C1.APELLIDO,
    ' ',
    1) = SUBSTRING_INDEX(C2.APELLIDO,
    ' ',
    1)
    AND C1.ID_CLIENTE <> C2.ID_CLIENTE;
--18. Crea una vista que devuelva el no de clientes por nacionalidad.
CREATE VIEW CLIENTES_POR_NACIONALIDAD AS
    SELECT
        NACIONALIDAD,
        COUNT(*)     AS NUMERO_DE_CLIENTES
    FROM
        CLIENTES
    GROUP BY
        NACIONALIDAD;
--19. Crea una vista que devuelva el no de habitaciones por categoría de habitación.
CREATE VIEW HABITACIONES_POR_CATEGORIA AS
    SELECT
        CATEGORIA AS CATEGORIA,
        COUNT(*)  AS NUMERO_DE_HABITACIONES
    FROM
        TIPOHABITACION
    GROUP BY
        CATEGORIA;
--20. Crea una vista que devuelva el no de servicios que se ofrecen por tipo de servicio.
CREATE VIEW SERVICIOS_POR_TIPO AS
    SELECT
        TIPO_SERVICIO,
        COUNT(*)      AS NUMERO_DE_SERVICIOS
    FROM
        SERVICIOS
    GROUP BY
        TIPO_SERVICIO;
--21. Crea una consulta que devuelva el gasto en servicios realizado por cada reserva.
SELECT
    R.NUMERO_RESERVA,
    SUM(S.PRECIO)    AS GASTO_EN_SERVICIOS
FROM
    RESERVAS           R
    INNER JOIN RESERVAS_SERVICIOS RS
    ON R.NUMERO_RESERVA = RS.NUMERO_RESERVA
    INNER JOIN SERVICIOS S
    ON RS.ID_SERVICIO = S.ID_SERVICIO
GROUP BY
    R.NUMERO_RESERVA;
--22. Crea una consulta que devuelva el precio del servicio más caro y del más barato.
SELECT
    MAX(PRECIO) AS PRECIO_SERVICIO_MAS_CARO,
    MIN(PRECIO) AS PRECIO_SERVICIO_MAS_BARATO
FROM
    SERVICIOS;
--23. Crear una vista que muestre todos los datos del cliente excepto las observaciones.
CREATE VIEW CLIENTES_SIN_OBSERVACIONES AS
    SELECT
        ID_CLIENTE,
        NOMBRE,
        APELLIDO,
        NACIONALIDAD
    FROM
        CLIENTES;
--ACTUALIZAR EL NOMBRE DE UNO DE LOS CLIENTES UTILIZANDO ESTA VISTA.
UPDATE CLIENTES_SIN_OBSERVACIONES
SET
    NOMBRE = 'Nuevo Nombre'
WHERE
    ID_CLIENTE = '1';
--24. Crear una vista que muestre el id, nombre y primer apellido de todos los clientes y el
--GASTO TOTAL QUE HAN REALIZADO EN EL HOTEL EN SUS DIFERENTES ESTANCIAS.

--25. Crea un índice sobre el atributo pais de la tabla cliente, con objeto de agilizar las BÚSQUEDAS.
CREATE INDEX IDX_PAIS ON CLIENTE (PAIS);
--26. Crea un índice sobre el atributo numHabitacion de la tabla ReservaHabitac, con OBJETO DE AGILIZAR LAS BÚSQUEDAS.
CREATE INDEX IDX_NUMHABITACION ON RESERVAHABITAC (NUMHABITACION);
--27. Crea un índice sobre el atributo nombreServicio de la tabla Servicio, con objeto de AGILIZAR LAS BÚSQUEDAS.
CREATE INDEX IDX_NOMBRESERVICIO ON SERVICIO (NOMBRESERVICIO);
--28. Añada una columna calculada en la tabla gastos que obtenga el importe por línea (CANTIDAD Y PRECIO)  SIN APLICAR EL IVA. 
ALTER TABLE GASTOS ADD COLUMN IMPORTE_SIN_IVA DECIMAL(10, 2) AS (CANTIDAD * PRECIO) STORED;
--29. AÑADA UNA COLUMNA EN SERVICIOS QUE INDIQUE SI EL SERVICIO SE OFRECE A LOS CLIENTES O NO. 
ALTER TABLE SERVICIOS ADD COLUMN SE_OFRECE_A_CLIENTES BOOLEAN;
-- Establecer el valor como TRUE para los servicios que se ofrecen a los clientes
UPDATE SERVICIOS
SET
    SE_OFRECE_A_CLIENTES = TRUE
WHERE
    NOMBRE_SERVICIO = 'Servicio1';

-- Establecer el valor como FALSE para los servicios que no se ofrecen a los clientes
UPDATE SERVICIOS
SET
    SE_OFRECE_A_CLIENTES = FALSE
WHERE
    NOMBRE_SERVICIO = 'Servicio2';
--30. MOSTRAR EL PRECIO DE LAS HABITACIONES Y SUS RESPECTIVOS TIPOS DURANTE LA TEMPORADA DE VERANO (TIPO 'A').
SELECT
    TIPO_HABITACION,
    PRECIO
FROM
    PRECIOS_HABITACIONES
WHERE
    TIPO_TEMPORADA = 'A';