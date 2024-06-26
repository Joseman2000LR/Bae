/*REALIZALAS SIGUIENTES CONSULTAS EN SQL SERVER:
GENERAR UTILIZANDO INSTRUCCIONES DDL LA TABLA: SERV_CASA.*/
CREATE TABLE SERV_CASA (
    COD_CASA VARCHAR(10),
    TIPO_SERV VARCHAR(15),
    DISTANCIA FLOAT,
    FOREIGN KEY (COD_CASA) REFERENCES CASA_RURAL(CODIGO),
    FOREIGN KEY (TIPO_SERV) REFERENCES SERVICIOS(TIPO),
    PRIMARY KEY (COD_CASA, TIPO_SERV)
);
/*GENERAR UTILIZANDO INSTRUCCIONES DDL: MODIFICAR LA TABLA PROVINCIA Y
AÑADIR EL CAMPO NOMBRE CON SUS PROPIEDADES.*/
ALTER TABLE PROVINCIA ADD NOMBRE VARCHAR(30);
/*GENERAR UTILIZANDO INSTRUCCIONES DDL: MODIFICAR LA DEFINICIÓN DEL CAMPO
MUNICIPIO DE LA TABLA HABITACIÓN PARA QUE CONTEMPLE LA RELACIÓN CON LA
TABLA CASA_RURAL.*/
ALTER TABLE HABITACION ADD COD_CASA VARCHAR(10), ADD FOREIGN KEY (COD_CASA) REFERENCES CASA_RURAL(CODIGO);
/*BORRAR LA PROPIEDAD DE VALOR NO NULO DEL CAMPO NOMBRE DE LA TABLA
MUNICIPIO.*/
ALTER TABLE MUNICIPIO ALTER COLUMN NOMBRE VARCHAR(30) NULL;
/*INSERTAR UN REGISTRO COMPLETO (SIN AÑADIR NULOS) EN LA TABLA CASA_RURAL.
SUBIR UN 1% EL PRECIO DE LA NOCHE DE LAS CASAS UBICADAS EN EL MUNICIPIO DE
LA LAGUNA.*/
UPDATE HABITACION
SET
    PRECIO_NOCHE = PRECIO_NOCHE * 1.01
WHERE
    COD_CASA IN (
        SELECT
            CODIGO
        FROM
            CASA_RURAL
        WHERE
            MUNICIPIO = 'La Laguna'
    );
/*ELIMINAR LAS CASAS RURALES DE LA OROTAVA QUE TIENEN UN PRECIO POR NOCHE
SUPERIOR A 200 €.*/
DELETE FROM CASA_RURAL
WHERE
    MUNICIPIO = 'La Orotava'
    AND PRECIO_EUR > 200;

/*NOMBRE DEL DUEÑO Y DIRECCIÓN COMPLETA (CON EL NOMBRE DEL MUNICIPIO) DE
TODAS LAS CASAS RURALES DE LA PROVINCIA DE GRAN CANARIA.*/
SELECT
    CASA_RURAL.DUENYOL,
    CASA_RURAL.DIRECCION,
    PROVINCIA.NOMBRE
FROM
    CASA_RURAL
    INNER JOIN MUNICIPIO
    ON CASA_RURAL.MUNICIPIO=MUNICIPIO.CODIGO
    INNER JOIN PROVINCIA
    ON MUNICIPIO.PROVINCIA= PROVINCIA.CODIGO
WHERE
    PROVINCIA.NOMBRE='GRAN CANARIA';
/*NOMBRE DEL DUEÑO DE LAS CASAS QUE TIENEN TV Y WIFI EN TODAS LAS
HABITACIONES.*/
SELECT
    CASA_RURAL.DUENYOL
FROM
    CASA_RURAL
    INNER JOIN HABITACION
    ON CASA_RURAL.CODIGO=HABITACION.COD_CASA;
/*PRECIO MEDIO DE LAS CASAS (ALQUILER COMPLETO) CON BAÑO EN ALGUNA HABITACIÓN
QUE HAYAN SIDO CONSTRUIDAS O REHABILITADAS DESPUÉS DEL AÑO 2016.*/
SELECT
    AVG(CASA_RURAL.PRECIO_EUR)
FROM
    CASA_RURAL
    INNER JOIN HABITACION
    ON CASA_RURAL.CODIGO=HABITACION.COD_CASA
WHERE
    HABITACION.BANYO='s'
    AND CASA_RURAL.FECHA_CONSTRUCCION>'2016'
    OR CASA_RURAL.FECHA_REHABILITACION>'2016';
/*CÓDIGO Y DIRECCIÓN DE LAS CASAS EN LAS QUE HAY AL MENOS 2 HABITACIONES CON
BAÑO Y CABEN COMO MÁXIMO 8 PERSONAS EN ESTAS HABITACIONES.*/
SELECT
    CASA_RURAL.CODIGO,
    CASA_RURAL.DIRECCION
FROM
CASA_RURAL
inner join HABITACION on 
CASA_RURAL.CODIGO=HABITACION.COD_CASA where HABITACION.BANYO='s';
/*MOSTRAR EL CÓDIGO DE LAS CASAS CUYO PRECIO ES SUPERIOR AL 80% DE LAS CASAS
del municipio de Arafo.*/
SELECT
    CASA_RURAL.CODIGO
FROM
    CASA_RURAL
WHERE
    PRECIO_EUR > (
        SELECT
            MAX(PRECIO_EUR) * 0.8
        FROM
            CASA_RURAL
        WHERE
            MUNICIPIO = 'Arafo'
    );
/*CÓDIGO DE LAS CASAS CUYA DISTANCIA MEDIA A TODOS LOS SERVICIOS DISPONIBLES
SEA SUPERIOR A 2 KM.*
*/
SELECT
    COD_CASA
FROM
    (
        SELECT
            COD_CASA,
            AVG(DISTANCIA) AS DISTANCIAMEDIA
        FROM
            SERV_CASA
        GROUP BY
            COD_CASA
    ) AS DISTANCIAS
WHERE
    DISTANCIAMEDIA > 2;
/*MOSTRAR LAS HABITACIONES CON BAÑOS CUYOS PRECIOS SEAN INFERIORES AL 15% DE
LAS HABITACIONES DENTRO DEL MISMO MUNICIPIO.*/
SELECT
    *
FROM
    HABITACION H1
WHERE
    BANYO = 'Sí'
    AND PRECIO_NOCHE < (
        SELECT
            0.15 * AVG(PRECIO_NOCHE)
        FROM
            HABITACION H2
        WHERE
            H1.COD_CASA = H2.COD_CASA
    );
/*CÓDIGO Y PRECIO DE LA HABITACIÓN MÁS CARA DE LAS CASAS QUE ESTÁN A MENOS
DE UN KM DE UN SUPERMERCADO.*/
SELECT
    TOP 1 H.CODIGO AS CODIGO_HABITACION,
    H.PRECIO_NOCHE AS PRECIO_HABITACION
FROM
    HABITACION H
    INNER JOIN CASA_RURAL C
    ON H.COD_CASA = C.CODIGO
    INNER JOIN SERV_CASA S
    ON C.CODIGO = S.COD_CASA
    INNER JOIN SERVICIOS SE
    ON S.TIPO_SERV = SE.TIPO
WHERE
    SE.DESCRIPCION = 'Supermercado'
    AND S.DISTANCIA < 1
ORDER BY
    H.PRECIO_NOCHE DESC;
/*CÓDIGO, DIRECCIÓN, TELÉFONO Y EMAIL DE LAS CASAS QUE ESTÉN COMO MUCHO A 1
KM DE UN SUPERMERCADO, UNA FARMACIA Y UN CENTRO DE SALUD.*
/

/*CÓDIGO Y MUNICIPIO DE LA CASA CUYA DISTANCIA AL HOSPITAL MÁS PRÓXIMO ES LA
MÍNIMA DE TODAS LAS CASAS. INDICAR TAMBIÉN ESTA DISTANCIA.*
/

/*SERVICIO MÁS PRÓXIMO Y MÁS ALEJADO JUNTO CON LA DISTANCIA CORRESPONDIENTE
PARA CADA CASA.*
/
