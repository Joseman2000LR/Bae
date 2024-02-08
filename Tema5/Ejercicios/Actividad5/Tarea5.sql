-- Crear la tabla
CREATE TABLE HARRY_POTTER (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    NOMBRE TEXT,
    EDAD REAL,
    CASA TEXT
);

-- Insertar registros
INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Harry Potter',
    18,
    'Gryffindor'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Hermione Granger',
    18,
    'Gryffindor'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Ron Weasley',
    18,
    'Gryffindor'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Albus Dumbledore',
    150,
    'Gryffindor'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Severus Snape',
    38,
    'Slytherin'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Draco Malfoy',
    18,
    'Slytherin'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Luna Lovegood',
    18,
    'Ravenclaw'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Cedric Diggory',
    17,
    'Hufflepuff'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Ginny Weasley',
    17,
    'Gryffindor'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Nymphadora Tonks',
    26,
    'Hufflepuff'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Sirius Black',
    36,
    'Gryffindor'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Bellatrix Lestrange',
    36,
    'Slytherin'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Remus Lupin',
    37,
    'Gryffindor'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Minerva McGonagall',
    70,
    'Gryffindor'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Dolores Umbridge',
    50,
    'Slytherin'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Rubeus Hagrid',
    63,
    'Gryffindor'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Fred Weasley',
    18,
    'Gryffindor'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'George Weasley',
    18,
    'Gryffindor'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Dobby',
    200,
    'Unknown'
);

INSERT INTO HARRY_POTTER (
    NOMBRE,
    EDAD,
    CASA
) VALUES (
    'Fleur Delacour',
    18,
    'Beauxbatons'
);


--PASO 3: REALIZAR CONSULTAS DE DATOS.
--REALIZA LAS SIGUIENTES CONSULTAS, Y MUESTRA EL RESULTADO OBTENIDO:

--FUNCIONES UPPER Y LOWER:
--MUESTRA EL NOMBRE DE TODOS LOS PERSONAJES EN MAYÚSCULAS.
SELECT UPPER(NOMBRE) FROM HARRY_POTTER ;
--FUNCIONES NUMÉRICAS:
/*CALCULA EL VALOR ABSOLUTO DE LA EDAD DE TODOS LOS PERSONAJES. 
UTILIZA UN ALIAS PARA MOSTRAR EL RESULTADO JUNTO CON EL NOMBRE DEL PERSONAJE.*/
SELECT NOMBRE, ABS(EDAD) AS totalDeEdad FROM HARRY_POTTER ;
--FUNCIONES DE FECHA Y HORA:
/*MUESTRA LA FECHA ACTUAL.*/
SELECT  DATE('now');
--FUNCIONES DE AGREGACIÓN:
/* CALCULA EL PROMEDIO DE LAS EDADES DE TODOS LOS PERSONAJES.*/
SELECT AVG(EDAD)AS edadMedia FROM HARRY_POTTER;
-- CONVIERTA LA CADENA ‘123’ A UN VALOR ENTERO.
SELECT CAST('123' AS INTEGER);
--FUNCIONES DE MANIPULACIÓN DE CADENAS:
-- CONCATENA EL NOMBRE Y LA CASA DE CADA PERSONAJE.
SELECT CONCAT(Nombre,' ',CASA )FROM HARRY_POTTER;
--FUNCIONES DE MANIPULACIÓN DE CADENAS (CONCAT_WS):
-- CONCATENA EL NOMBRE Y LA CASA DE CADA PERSONAJE CON UN GUIÓN COMO SEPARADOR.
SELECT CONCAT(NOMBRE ,'-', CASA )FROM HARRY_POTTER;
--FUNCIONES DE CONTROL DE FLUJO (CASE):
-- CATEGORIZA A LOS PERSONAJES SEGÚN SUS EDADES.
SELECT
    NOMBRE,
    EDAD,
    CASE WHEN EDAD < 11 THEN  'Niño'
        WHEN EDAD BETWEEN 11 AND 17 THEN'Adolescente'
        WHEN EDAD BETWEEN 18 AND 30 THEN 'Joven adulto'
        ELSE 'Adulto'
    END  AS CATEGORIA_EDAD
FROM
    HARRY_POTTER;
--FUNCIONES DE AGREGACIÓN (SUM):
-- CALCULA LA SUMA TOTAL DE LA EDAD DE TODOS LOS PERSONAJES.
SELECT SUM(EDAD) FROM HARRY_POTTER;
 --FUNCIONES NUMÉRICAS (ROUND):
-- REDONDEA LA EDAD DE LOS PERSONAJES A DOS DECIMALES.
SELECT ROUND(EDAD ,-2) from HARRY_POTTER;
--FUNCIONES DE MANIPULACIÓN DE CADENAS (LENGTH):
-- MUESTRA LA LONGITUD DE CADA NOMBRE.
SELECT nombre, LENGTH(NOMBRE) from HARRY_POTTER;
--FUNCIONES DE AGREGACIÓN (COUNT):
-- CUENTA EL NÚMERO TOTAL DE PERSONAJES EN CADA CASA.
SELECT count(CASA) as mienbro ,casa FROM HARRY_POTTER GROUP BY  CASA  ;
--FUNCIONES DE FECHA Y HORA (CURRENT_TIME):
-- MUESTRA LA HORA ACTUAL.
SELECT TIME(CURRENT_TIME);
--FUNCIONES DE CONVERSIÓN (CAST):
-- CONVIERTE LA EDAD A UN VALOR DE PUNTO FLOTANTE.
SELECT CAST(EDAD AS FLOAT) from HARRY_POTTER;
--FUNCIONES DE MANIPULACIÓN DE CADENAS (SUBSTR):
-- MUESTRA LOS PRIMEROS TRES CARACTERES DE CADA NOMBRE.
SELECT SUBSTR(NOMBRE,1, 3) ,nombre from HARRY_POTTER;
--ORDER BY Y LIKE
-- PERSONAJES EN LA CASA DE GRYFFINDOR CON EDAD SUPERIOR A 25.
SELECT * from HARRY_POTTER WHERE CASA ='GRYFFINDOR' AND  EDAD>25;
-- PERSONAJES CUYOS NOMBRES CONTIENEN LA LETRA ‘A’ ORDENADOS POR SU EDAD DE MANERA ASCENDENTE.
SELECT * FROM HARRY_POTTER WHERE NOMBRE LIKE '%A%' ORDER BY EDAD ASC;
-- PERSONAJES DE LA CASA SLYTHERIN CON EDADES ENTRE 18 Y 35.
SELECT * FROM HARRY_POTTER WHERE EDAD BETWEEN 18 AND 35   AND CASA='Gryffindor';
-- PERSONAJES CON EDADES EN ORDEN DESCENDENTES, LIMITANDO A LOS PRIMEROS 5 RESULTADOS.
SELECT EDAD FROM HARRY_POTTER ORDER BY  EDAD DESC LIMIT 5;
-- PERSONAJES CUYOS NOMBRES COMIENZAN CON ‘M’ O ‘N’ Y TIENEN UNA EDAD SUPERIOR A 28.
SELECT NOMBRE FROM HARRY_POTTER WHERE EDAD >28 and nombre LIKE 'M%' OR 'N%' ;
--PERSONAJES DE LA CASA GRYFFINDOR O RAVENCLAW ORDENADOS ALFABÉTICAMENTE POR NOMBRE.
SELECT * FROM HARRY_POTTER WHERE CASA in('Gryffindor' , 'Ravenclaw')  ORDER BY NOMBRE ASC;
--PERSONAJES CON EDADES ÚNICAS (ELIMINANDO DUPLICADOS) EN ORDEN ASCENDENTE.
SELECT DISTINCT EDAD  FROM HARRY_POTTER ORDER BY EDAD ASC;
--PERSONAJES CUYOS NOMBRES TERMINAN CON ‘E’ O ‘D’ Y ESTÁN EN LA CASA GRYFFINDOR.
SELECT  Nombre FROM HARRY_POTTER WHERE  CASA IN('Gryffindor') AND  NOMBRE LIKE '%E' OR '%D';
--PERSONAJES CON EDADES FUERA DEL RANGO DE 18 A 30, ORDENADOS POR CASA.
SELECT * FROM HARRY_POTTER WHERE EDAD NOT BETWEEN 18 AND 30 GROUP BY CASA;
--PERSONAJES EN LA CASA HUFFLEPUFF CON NOMBRES QUE NO CONTIENEN LA ‘E’.
SELECT  * FROM  HARRY_POTTER WHERE  CASA = 'HUFFLEPUFF'  AND NOMBRE NOT LIKE '%e%';