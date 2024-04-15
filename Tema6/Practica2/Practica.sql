-- Create a DataBases

CREATE  DATABASE Instituto;
use Instituto;

/*creacion de la tabla */

Create TABLE alumnos(
    numero_incripcion int IDENTITY(1, 1),
    año_incripcion Date,
    nombre VARCHAR(15),
    documentacion VARCHAR(50),
    domicilio VARCHAR(50),
    ciudad VARCHAR(50),
    provincia VARCHAR(50),
    PRIMARY KEY (NUMERO_INCRIPCION, AÑO_INCRIPCION)
);

---- ELIMINE LA TABLA "alumno" SI EXISTE.
----NOTA: MUESTRA EL COMANDO Y LA SALIDA.
DROP TABLE IF EXISTS ALUMNOS;

--- CREE LA TABLA DEFINIENDO UNA CLAVE PRIMARIA COMPUESTA (AÑO DE INSCRIPCIÓN Y NÚMERO DE INSCRIPCIÓN).
--NOTA: MUESTRA EL COMANDO Y LA SALIDA.
CREATE TABLE ALUMNOS(
    NUMERO_INCRIPCION INT IDENTITY(1, 1),
    AÑO_INCRIPCION DATE,
    NOMBRE VARCHAR(15),
    DOCUMENTACION VARCHAR(50),
    DOMICILIO VARCHAR(50),
    CIUDAD VARCHAR(50),
    PROVINCIA VARCHAR(50),
    PRIMARY KEY (NUMERO_INCRIPCION, AÑO_INCRIPCION)
);

--- INSERTA 10 REGISTROS DE EJEMPLO.
--NOTA: MUESTRA EL COMANDO Y LA SALIDA.

INSERT INTO ALUMNOS (
    AÑO_INCRIPCION,
    NOMBRE,
    DOCUMENTACION,
    DOMICILIO,
    CIUDAD,
    PROVINCIA
) VALUES (
    '2022-01-01',
    'Juan Perez',
    '123456789A',
    'Calle 123',
    'Ciudad Uno',
    'Provincia Uno'
),
(
    '2022-01-02',
    'María López',
    '987654321B',
    'Avenida 456',
    'Ciudad Dos',
    'Provincia Dos'
),
(
    '2022-01-03',
    'Carlos García',
    '456789123C',
    'Calle 789',
    'Ciudad Tres',
    'Provincia Tres'
),
(
    '2022-01-04',
    'Laura Martínez',
    '654321987D',
    'Avenida 012',
    'Ciudad Cuatro',
    'Provincia Cuatro'
),
(
    '2022-01-05',
    'Pedro Rodriguez',
    '321987654E',
    'Calle 345',
    'Ciudad Cinco',
    'Provincia Cinco'
),
(
    '2022-01-06',
    'Ana Ruiz',
    '789123456F',
    'Avenida 678',
    'Ciudad Seis',
    'Provincia Seis'
),
(
    '2022-01-07',
    'Javier Sánchez',
    '234567891G',
    'Calle 901',
    'Ciudad Siete',
    'Provincia Siete'
),
(
    '2022-01-08',
    'Sofía Gómez',
    '891234567H',
    'Avenida 234',
    'Ciudad Ocho',
    'Provincia Ocho'
),
(
    '2022-01-09',
    'Diego Hernández',
    '567891234I',
    'Calle 567',
    'Ciudad Nueve',
    'Provincia Nueve'
),
(
    '2022-01-10',
    'Elena Torres',
    '678912345J',
    'Avenida 890',
    'Ciudad Diez',
    'Provincia Diez'
);

--- DEFINE LOS SIGUIENTES ÍNDICES: UN ÍNDICE ÚNICO POR EL CAMPO "documento" Y UN ÍNDICE COMÚN POR CIUDAD Y PROVINCIA.

create unique nooclustered INDEX ix_documento on Alumnos (documentos);
CREATE UNIQUE nonCLUSTERED INDEX IX_Ciudad_Provincia ON ALUMNOS (Ciudad ,Provincia);
--NOTA: MUESTRA EL COMANDO Y LA SALIDA. JUSTIFICA EL TIPO DE ÍNDICE EN UN COMENTARIO.
--NO SE PUEDEN CREAR VARIOS ÍNDICES CLÚSTER EN TABLA 'Alumnos'.
-- QUITE EL ÍNDICE CLÚSTER EXISTENTE 'PK__ALUMNOS__30E5907E2599B1F4' ANTES DE CREAR OTRO.
-- se tiene que poner El nonCLUSTERED para que te lo admita

-- el index de documento :
-- el index de ciudad y provincias:

--- VEA LOS ÍNDICES DE LA TABLA.
--NOTA: MUESTRA EL COMANDO Y LA SALIDA.
SP_HELPINDEX Alumnos;


--- INTENTE INGRESAR UN ALUMNO CON CLAVE PRIMARIA REPETIDA.
--NOTA: MUESTRA EL COMANDO Y LA SALIDA.
insert into Alumnos ( AÑO_INCRIPCION,
NOMBRE,
DOCUMENTACION,
DOMICILIO,
CIUDAD,
PROVINCIA)  VALUES (
'2022-01-01',
'Juan ',
'123456789A',
'Calle 12',
'Ciudad once',
'Provincia Uno'
)
--- INTENTE INGRESAR UN ALUMNO CON DOCUMENTO REPETIDO.
--NOTA: MUESTRA EL COMANDO Y LA SALIDA.
INSERT INTO ALUMNOS (
    AÑO_INCRIPCION,
    NOMBRE,
    DOCUMENTACION,
    DOMICILIO,
    CIUDAD,
    PROVINCIA
) VALUES (
    '2022-01-02',
    'Juan ',
    '123456789A',
    'Calle 14',
    'Ciudad once',
    'Provincia trece'
)
--- INGRESE VARIOS ALUMNOS DE LA MISMA CIUDAD Y PROVINCIA.
INSERT INTO ALUMNOS (
    AÑO_INCRIPCION,
    NOMBRE,
    DOCUMENTACION,
    DOMICILIO,
    CIUDAD,
    PROVINCIA
) VALUES (
    '2022-01-09',
    'JuanPe ',
    '123456789A',
    'Calle 14',
    'Ciudad once',
    'Provincia trece'
), VALUES (
    '2022-08-02',
    'Ana',
    '123456789A',
    'Calle 14',
    'Ciudad once',
    'Provincia trece'
), VALUES (
    '2022-11-02',
    'Pepe',
    '123456789A',
    'Calle 14',
    'Ciudad once',
    'Provincia trece'
), VALUES (
    '2022-12-22',
    'Marco',
    '123456789A',
    'Calle 14',
    'Ciudad once',
    'Provincia trece'
)
--NOTA: MUESTRA EL COMANDO Y LA SALIDA.

--- ELIMINA LOS ÍNDICES CREADOS, Y MUESTRA QUE YA NO SE ENCUENTRAN.
--NOTA: MUESTRA EL COMANDO Y LA SALIDA.
drop index ALUMNOS.PK__ALUMNOS__30E5907E2599B1F4;
drop index  Alumnos.IX_DOCUMENTO;
DROP INDEX ALUMNOS.IX_CIUDAD_PROVINCIA;

SP_HELPINDEX ALUMNOS;

