ACTIVIDAD 2. TRIGGERS EN SQL SERVER

1- Elimine las tablas si existen y créalas con los siguientes campos:

IF OBJECT_ID('empleados') IS NOT NULL

DROP TABLE EMPLEADOS;

IF OBJECT_ID('secciones') IS NOT NULL

DROP TABLE SECCIONES;

CREATE TABLE SECCIONES(
    CODIGO INT IDENTITY,
    NOMBRE VARCHAR(30),
    CONSTRAINT PK_SECCIONES PRIMARY KEY (CODIGO)
);

CREATE TABLE EMPLEADOS(
    DOCUMENTO CHAR(8) NOT NULL,
    NOMBRE VARCHAR(30),
    DOMICILIO VARCHAR(30),
    SECCION INT NOT NULL,
    CONSTRAINT PK_EMPLEADOS PRIMARY KEY (DOCUMENTO),
    CONSTRAINT FK_EMPLEADOS_SECCION FOREIGN KEY(SECCION) REFERENCES SECCIONES (CODIGO)
);

2- Inserte algunos registros:

INSERT INTO SECCIONES VALUES(
    'Secretaria'
);

INSERT INTO SECCIONES VALUES(
    'Sistemas'
);

INSERT INTO SECCIONES VALUES(
    'Contabilidad'
);

INSERT INTO SECCIONES VALUES(
    'Ventas'
);

INSERT INTO EMPLEADOS VALUES (
    '23333333',
    'Humberto Ramos',
    'C/ Tinguaro,34',
    2
);

INSERT INTO EMPLEADOS VALUES (
    '24444444',
    'Carlos Castro',
    'C/Bencomo, 2',
    3
);

INSERT INTO EMPLEADOS VALUES (
    '25555555',
    'Fabián Rivero',
    'C/Beneharo,23',
    1
);

INSERT INTO EMPLEADOS VALUES (
    '26666666',
    'Gustavo Méndez',
    'C/ Princesa Dácil',
    2
);

INSERT INTO EMPLEADOS VALUES (
    '27777777',
    'María González',
    'C/Tinerfe, 104',
    3
);

INSERT INTO EMPLEADOS VALUES (
    '22222222',
    'Ana Acosta',
    'Avda. Los Menceyes, 6',
    4
);

3- Crea un disparador de eliminación sobre la tabla "empleados" que permita borrar

VARIOS EMPLEADOS A LA VEZ, PERO NINGÚN EMPLEADO DE LA SECCIÓN "Ventas".
SE ELIMINAN TODOS LOS EMPLEADOS SOLICITADOS EN CUALQUIER SENTENCIA "delete", Y LUEGO
SE VUELVEN A INSERTAR AQUELLOS DE LA SECCIÓN "Ventas".

5- Crea un disparador para evitar que se inserten empleados en una sección que no

EXISTE.

6- Crea un disparador que actualice el domicilio de un empleado si el nuevo domicilio

ES DIFERENTE DEL ANTERIOR.

7- Crea un disparador que se asegure de que al actualizar o insertar un documento de

LOS EMPLEADOS SEAN ÚNICOS.
RECUERDA QUE DEBES INCLUIR CAPTURAS TANTO DE LOS CÓDIGOS DE TODOS LOS PASOS Y DE SU
CORRECTO FUNCIONAMIENTO.