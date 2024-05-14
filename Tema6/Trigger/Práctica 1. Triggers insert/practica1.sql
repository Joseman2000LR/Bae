PRIMER PROBLEMA:
UNA EMPRESA ALMACENA LOS DATOS DE SUS EMPLEADOS EN UNA TABLA DENOMINADA
"empleados" Y EN OTRA TABLA LLAMADA "secciones", EL CÓDIGO DE LA SECCIÓN Y EL SUELDO
MÁXIMO DE CADA UNA DE ELLAS.

1- Elimine las tablas si existen:

IF OBJECT_ID('empleados') IS NOT NULL

DROP TABLE EMPLEADOS;

IF OBJECT_ID('secciones') IS NOT NULL

DROP TABLE SECCIONES;

2- Cree las tablas, con las siguientes estructuras:

CREATE TABLE SECCIONES(
    CODIGO INT IDENTITY,
    NOMBRE VARCHAR(30),
    SUELDOMAXIMO DECIMAL(8, 2),
    CONSTRAINT PK_SECCIONES PRIMARY KEY(CODIGO)
);

CREATE TABLE EMPLEADOS(
    DOCUMENTO CHAR(8) NOT NULL,
    NOMBRE VARCHAR(30) NOT NULL,
    DOMICILIO VARCHAR(30),
    CODIGOSECCION INT NOT NULL,
    SUELDO DECIMAL(8, 2),
    CONSTRAINT PK_EMPLEADOS PRIMARY KEY(DOCUMENTO),
    CONSTRAINT FK_EMPELADOS_SECCION FOREIGN KEY (CODIGOSECCION) REFERENCES SECCIONES(CODIGO)
);

3- Inserte algunos registros en ambas tablas:

INSERT INTO SECCIONES VALUES(
    'Administración',
    1500
);

INSERT INTO SECCIONES VALUES(
    'Sistemas',
    2000
);

INSERT INTO SECCIONES VALUES(
    'Secretaría',
    1000
);

INSERT INTO EMPLEADOS VALUES(
    '22222222',
    'Ana Acosta',
    'Santa Cruz 88',
    1,
    1100
);

INSERT INTO EMPLEADOS VALUES(
    '23333333',
    'Beneharo Pérez',
    'Los Príncipes 45',
    1,
    1200
);

INSERT INTO EMPLEADOS VALUES(
    '24444444',
    'Carlos Castro',
    'Los Menceyes 74',
    2,
    1800
);

INSERT INTO EMPLEADOS VALUES(
    '25555555',
    'Diana López',
    'Los Menceyes 73',
    3,
    1000
);

4- Cree un disparador para que se ejecute cada vez que una instrucción "insert" inserte

datos en "empleados"; el mismo debe verificar que el sueldo del empleado no sea mayor al

SUELDO MÁXIMO ESTABLECIDO PARA LA SECCIÓN, SI LO ES, DEBE MOSTRAR UN MENSAJE INDICANDO TAL
SITUACIÓN Y DESHACER LA TRANSACCIÓN.
CREATE TRIGGER VERIFICARSUELDOMAXIMO ON EMPLEADOS AFTER
    INSERT AS
BEGIN
 -- Variables para almacenar el sueldo del nuevo empleado y el sueldo máximo permitido para la sección
    DECLARE @NUEVOSUELDO DECIMAL(10, 2);
    DECLARE
        @IDSECCIONEMPLEADO INT;
        DECLARE           @SUELDOMAXIMOSECCION DECIMAL(10, 2);
 -- Obtener el sueldo del nuevo empleado y la sección a la que pertenece
        SELECT            @NUEVOSUELDO = SUELDO, @IDSECCIONEMPLEADO = ID_SECCION FROM INSERTED;
 -- Obtener el sueldo máximo permitido para la sección
        SELECT            @SUELDOMAXIMOSECCION = SUELDOMAXIMO FROM SUELDOMAXIMOPORSECCION WHERE IDSECCION = @IDSECCIONEMPLEADO;
 -- Verificar si el sueldo del nuevo empleado excede el sueldo máximo permitido para la sección
        IF                @NUEVOSUELDO > @SUELDOMAXIMOSECCION BEGIN
 -- Mostrar un mensaje indicando la situación
        RAISERROR('El sueldo del empleado excede el sueldo máximo permitido para la sección.', 16, 1);
 -- Deshacer la transacción
        ROLLBACK          TRANSACTION;
    END;
END;

5- Inserte un nuevo registro en "empleados" cuyo sueldo sea menor o igual al establecido

PARA LA SECCIÓN.

6- Verifique que el disparador se ejecutó consultando la tabla "empleados"

7- Intente insertar un nuevo registro en "empleados" cuyo sueldo sea mayor al establecido

PARA LA SECCIÓN. EL DISPARADOR SE EJECUTÓ MOSTRANDO UN MENSAJE Y LA TRANSACCIÓN SE DESHIZO.

8- Verifique que el registro no se agregó en "empleados"

9- Intente insertar un empleado con código de sección inexistente. Aparece un mensaje de

error porque se viola la restricción "foreign key"; el trigger no llegó a ejecutarse.