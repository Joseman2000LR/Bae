CREATE DATABASES;

CREATE TABLE SOCIOS(
    DOCUMENTO CHAR(8) NOT NULL,
    NOMBRE VARCHAR(40),
    DOMICILIO VARCHAR(30),
    CONSTRAINT PK_SOCIOS_DOCUMENTO PRIMARY KEY (DOCUMENTO)
);

CREATE TABLE PROFESORES(
    DOCUMENTO CHAR(8) NOT NULL,
    NOMBRE VARCHAR(40),
    DOMICILIO VARCHAR(30),
    CONSTRAINT PK_PROFESORES_DOCUMENTO PRIMARY KEY (DOCUMENTO)
);

CREATE TABLE CURSOS(
    NUMERO TINYINT IDENTITY,
    DEPORTE VARCHAR(20),
    P I F C C É A R S A N R MQ U IE DIA VARCHAR(15),
    CONSTRAINT CK_INSCRITOS_DIA CHECK (DIA IN('lunes', 'martes', 'miercoles', 'jueves', 'viernes', 'sabado')),
    DOCUMENTOPROFESOR CHAR(8),
    CONSTRAINT PK_CURSOS_NUMERO PRIMARY KEY (NUMERO),
);

CREATE TABLE INSCRITOS(
    DOCUMENTOSOCIO CHAR(8) NOT NULL,
    NUMERO TINYINT NOT NULL,
    MATRICULA CHAR(1),
    CONSTRAINT CK_INSCRITOS_MATRICULA CHECK (MATRICULA IN('s', 'n')),
    CONSTRAINT PK_INSCRITOS_DOCUMENTO_NUMERO PRIMARY KEY (DOCUMENTOSOCIO, NUMERO)
);

--2- Inserte algunos registros para todas las tablas:

INSERT INTO SOCIOS VALUES(
    '30000000',
    'Francisco Fuentes',
    'La Graciosa 7'
);

INSERT INTO SOCIOS VALUES(
    '31111111',
    'Gerardo García',
    'Lanzarote 65'
);

INSERT INTO SOCIOS VALUES(
    '32222222',
    'Héctor Hernández',
    'Fuerteventura 74'
);

INSERT INTO SOCIOS VALUES(
    '33333333',
    'Inés Izquierdo',
    'Gran Canaria 45'
);

INSERT INTO PROFESORES VALUES(
    '22222222',
    'Ana Acosta',
    'Los Menceyes 31'
);

INSERT INTO PROFESORES VALUES(
    '23333333',
    'Carlos Castro',
    'Mencey Bencomo 5'
);

INSERT INTO PROFESORES VALUES(
    '24444444',
    'Daniel Díaz',
    'Mencey Acaymo 87'
);

INSERT INTO PROFESORES VALUES(
    '25555555',
    'Esteban López',
    'C/ Méndez Nuñez 4'
);

SQL SERVER - VISTAS

INSERT INTO CURSOS VALUES(
    'tenis',
    'lunes',
    '22222222'
);

INSERT INTO CURSOS VALUES(
    'tenis',
    'martes',
    '22222222'
);

INSERT INTO CURSOS VALUES(
    'natacion',
    'miercoles',
    '22222222'
);

INSERT INTO CURSOS VALUES(
    'natacion',
    'jueves',
    '23333333'
);

INSERT INTO CURSOS VALUES(
    'natacion',
    'viernes',
    '23333333'
);

INSERT INTO CURSOS VALUES(
    'futbol',
    'sabado',
    '24444444'
);

INSERT INTO CURSOS VALUES(
    'futbol',
    'lunes',
    '24444444'
);

INSERT INTO CURSOS VALUES(
    'baloncesto',
    'martes',
    '24444444'
);

INSERT INTO INSCRITOS VALUES(
    '30000000',
    1,
    's'
);

INSERT INTO INSCRITOS VALUES(
    '30000000',
    3,
    'n'
);

INSERT INTO INSCRITOS VALUES(
    '30000000',
    6,
    NULL
);

INSERT INTO INSCRITOS VALUES(
    '31111111',
    1,
    's'
);

INSERT INTO INSCRITOS VALUES(
    '31111111',
    4,
    's'
);

INSERT INTO INSCRITOS VALUES(
    '32222222',
    8,
    's'
);

--4- Cree una vista en la que aparezca el nombre y documento del socio, el deporte, el DÍA Y EL NOMBRE DEL PROFESOR.
CREATE VIEW VISTAINSCRIPCIONES AS
    SELECT
        S.NOMBRE    AS NOMBRESOCIO,
        S.DOCUMENTO AS DOCUMENTOSOCIO,
        C.DEPORTE   AS DEPORTE,
        C.DIA       AS DIA,
        P.NOMBRE    AS NOMBREPROFESOR
    FROM
        INSCRITOS  I
        INNER JOIN SOCIOS S
        ON I.DOCUMENTOSOCIO = S.DOCUMENTO
        INNER JOIN CURSOS C
        ON I.NUMERO = C.NUMERO
        INNER JOIN PROFESORES P
        ON C.DOCUMENTOPROFESOR = P.DOCUMENTO;

--5- Muestre la información contenida en la vista.
 select * from VISTAINSCRIPCIONES;

--6- Realice una consulta a la vista donde muestre la cantidad de socios inscritos en CADA DEPORTE ORDENADOS POR CANTIDAD.


--7- Muestre (consultando la vista) los cursos (deporte y día) para los cuales no hay INSCRITOS.

--8- Muestre los nombres de los socios que no se han inscrito en ningún curso(CONSULTANDO LA VISTA) 
--9- MUESTRE (CONSULTANDO LA VISTA) LOS PROFESORES QUE NO TIENEN ASIGNADO NINGÚN DEPORTE AÚN. 
--10- MUESTRE (CONSULTANDO LA VISTA) EL NOMBRE Y DOCUMENTO DE LOS SOCIOS QUE DEBEN MATRÍCULAS. 
--11- CONSULTE LA VISTA Y MUESTRE LOS NOMBRES DE LOS PROFESORES Y LOS DÍAS EN QUE ASISTEN AL CLUB PARA IMPARTIR SUS CLASES. --
--12- MUESTRE LA MISMA INFORMACIÓN ANTERIOR PERO ORDENADA POR DÍA. 
--13- MUESTRE TODOS LOS SOCIOS QUE SON COMPAÑEROS EN TENIS LOS LUNES. 
--14- ELIMINE LA VISTA "vi_inscritos" SI EXISTE Y CRÉELA PARA QUE MUESTRE LA CANTIDAD DE INSCRITOS POR CURSO, 
--INCLUYENDO EL NÚMERO DEL CURSO,
--EL NOMBRE DEL DEPORTE Y EL DÍA.
