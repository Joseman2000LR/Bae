1- Elimine las tablas si existen:

IF OBJECT_ID('Consulta') IS NOT NULL

DROP TABLE CONSULTA;

IF OBJECT_ID('Medico') IS NOT NULL

DROP TABLE MEDICO;

2- Cree las tablas con las siguientes estructuras:

CREATE TABLE MEDICO (
    DOCUMENTO CHAR(8) NOT NULL,
    NOMBRE VARCHAR(30),
    CONSTRAINT PK_MEDICOS PRIMARY KEY CLUSTERED (DOCUMENTO)
);

CREATE TABLE CONSULTA(
    FECHA DATETIME,
    MEDICO CHAR(8) NOT NULL,
    PACIENTE VARCHAR(30),
    CONSTRAINT PK_CONSULTAS PRIMARY KEY (FECHA, MEDICO),
    CONSTRAINT FK_CONSULTAS_MEDICO FOREIGN KEY (MEDICO) REFERENCES MEDICO(DOCUMENTO)
);

3- Inserte algunos registros:

INSERT INTO MEDICO VALUES(
    '22222222',
    'Alberto Sedano'
);

INSERT INTO MEDICO VALUES(
    '23333333',
    'Pedro de la Paz'
);

INSERT INTO MEDICO VALUES(
    '24444444',
    'María Morales'
);

INSERT INTO CONSULTA VALUES(
    '2023/26/03 8:00',
    '22222222',
    'Elena Suárez'
);

INSERT INTO CONSULTA VALUES(
    '2023/26/03 8:00',
    '23333333',
    'Néstor Gómez'
);

INSERT INTO CONSULTA VALUES(
    '2023/23/03 8:30',
    '22222222',
    'Néstor Cabrera'
);

INSERT INTO CONSULTA VALUES(
    '2023/23/03 9:00',
    '22222222',
    'Joshua García'
);

INSERT INTO CONSULTA VALUES(
    '2023/29/03 8:00',
    '24444444',
    'Néstor Gómez'
);

INSERT INTO CONSULTA VALUES(
    '2023/23/03 8:30',
    '22222222',
    'Hector Pérez'
);

INSERT INTO CONSULTA VALUES(
    '2023/23/03 9:30',
    '23333333',
    'Hector Pérez'
);

4- Elimine la función "f_nombreDia" si existe.
drop IF OBJECT_ID('f_nombreDia') IS NOT NULL

5- Cree la función "f_nombreDia" que recibe una fecha (tipo string) y nos retorne el nombre
del día en español.
cretae FUNCTION  f_nombreDia ( @fecha String)RETURN String 
as begin 

RETURN END  ;

6- Elimine la función "f_horario" si existe.
IF OBJECT_ID('f_horario') IS NOT NULL

7- Cree la función "f_horario" que recibe una fecha (tipo string) y nos retorne la hora y
MINUTOS.
CREATE FUNCTION F_HORARIO(
    @FECHA VARCHAR(20)
) RETURNS VARCHAR(8) AS
BEGIN
    DECLARE @HORARIO VARCHAR(8);
    SET @HORARIO = CONVERT(VARCHAR(8), CAST(@FECHA AS TIME), 108);
    RETURN @HORARIO;
END;
SELECT DBO.F_HORARIO('2024-05-09 14:30:00');
8- Elimine la función "f_fecha" si existe.
IF OBJECT_ID('f_fecha') IS NOT NULL
9- Cree la función "f_fecha" que recibe una fecha (tipo string) y nos retorne la fecha (sin
HORA NI MINUTOS).
CRETAE FUNCTION F_HORARIO ( @FECHA VARCHAR(20))
 RETURNS VARCHAR(8) AS
BEGIN
    DECLARE
        @HORARIO VARCHAR(8);
        SET @HORARIO = CONVERT(VARCHAR(8), CAST(@FECHA AS TIME), 108);
RETURN @HORARIO;


10- Muestre todas las consultas del médico llamado 'Pedro de la Paz', incluyendo el día
(EMPLEE LA FUNCIÓN "f_nombreDia", LA FECHA (EMPLEE LA FUNCIÓN "f_fecha"), 
EL HORARIO (EMPLEE LA FUNCIÓN "f_horario") Y EL NOMBRE DEL PACIENTE.

11- MUESTRE TODOS LOS TURNOS PARA EL DÍA SÁBADO, JUNTO CON LA FECHA, DE TODOS LOS MÉDICOS. 

12- ENVÍE A LA FUNCIÓN "f_nombreDia" UNA FECHA Y MUESTRE EL VALOR RETORNADO