ACTIVIDAD 2. TRIGGERS EN SQL SERVER

--1- Elimine las tablas si existen y créalas con los siguientes campos:

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

--2- Inserte algunos registros:

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
CREATE TRIGGER TRG_DELETE_EMPLEADOS ON EMPLEADOS INSTEAD OF
    DELETE AS
BEGIN
    DECLARE @TEMPVENTAS TABLE ( DOCUMENTO CHAR(8), NOMBRE VARCHAR(30), DOMICILIO VARCHAR(30), SECCION INT );
    INSERT INTO @TEMPVENTAS
        SELECT
            D.DOCUMENTO,
            D.NOMBRE,
            D.DOMICILIO,
            D.SECCION
        FROM
            DELETED D
            JOIN SECCIONES S
            ON D.SECCION = S.CODIGO
        WHERE
            S.NOMBRE = 'Ventas';
    DELETE FROM EMPLEADOS
    WHERE
        DOCUMENTO IN (
            SELECT
                DOCUMENTO
            FROM
                DELETED
        )
        AND DOCUMENTO NOT IN (
            SELECT
                DOCUMENTO
            FROM
                @TEMPVENTAS
        );
    INSERT INTO EMPLEADOS (
        DOCUMENTO,
        NOMBRE,
        DOMICILIO,
        SECCION
    )
        SELECT
            DOCUMENTO,
            NOMBRE,
            DOMICILIO,
            SECCION
        FROM
            @TEMPVENTAS;
END;
5- Crea un disparador para evitar que se inserten empleados en una sección que no  EXISTE.
CREATE TRIGGER TRG_INSERT_EMPLEADOS ON EMPLEADOS AFTER
    INSERT AS
BEGIN
    IF EXISTS (
        SELECT
            1
        FROM
            INSERTED I
            LEFT JOIN SECCIONES S
            ON I.SECCION = S.CODIGO
        WHERE
            S.CODIGO IS NULL
    )
BEGIN
    ROLLBACK;
    RAISERROR ('No se puede insertar un empleado en una sección que no existe.', 16, 1);
END
END;
6- Crea un disparador que actualice el domicilio de un empleado si el nuevo domicilio
ES DIFERENTE DEL ANTERIOR.
CREATE TRIGGER TRG_UPDATE_DOMICILIO ON EMPLEADOS AFTER
    UPDATE AS
BEGIN
    IF EXISTS (
        SELECT
            1
        FROM
            INSERTED I
            JOIN DELETED D
            ON I.DOCUMENTO = D.DOCUMENTO
        WHERE
            I.DOMICILIO <> D.DOMICILIO
    )
BEGIN
    UPDATE EMPLEADOS
    SET
        DOMICILIO = I.DOMICILIO FROM EMPLEADOS E JOIN INSERTED I ON E.DOCUMENTO = I.DOCUMENTO JOIN DELETED D ON E.DOCUMENTO = D.DOCUMENTO
    WHERE
        I.DOMICILIO <> D.DOMICILIO;
END
END;
7- Crea un disparador que se asegure de que al actualizar o insertar un documento de
LOS EMPLEADOS SEAN ÚNICOS. RECUERDA QUE DEBES INCLUIR CAPTURAS TANTO DE LOS CÓDIGOS
 DE TODOS LOS PASOS Y DE SU CORRECTO FUNCIONAMIENTO.
 CREATE TRIGGER TRG_UNIQUE_DOCUMENTO ON EMPLEADOS INSTEAD OF
    INSERT,
        UPDATE AS
    BEGIN
        IF EXISTS (
            SELECT
                1
            FROM
                (
                    SELECT
                        DOCUMENTO
                    FROM
                        INSERTED
                    UNION
                    ALL
                    SELECT
                        DOCUMENTO
                    FROM
                        EMPLEADOS
                ) AS DOCS
            GROUP BY
                DOCUMENTO
            HAVING
                COUNT(DOCUMENTO) > 1
        )
        BEGIN
            RAISERROR('No se puede insertar o actualizar un empleado con un documento duplicado.', 16, 1);
            ROLLBACK;
        END
        ELSE
BEGIN
    INSERT INTO EMPLEADOS (
        DOCUMENTO,
        NOMBRE,
        DOMICILIO,
        SECCION
    )
        SELECT
            DOCUMENTO,
            NOMBRE,
            DOMICILIO,
            SECCION
        FROM
            INSERTED
        WHERE
            NOT EXISTS (
                SELECT
                    1
                FROM
                    EMPLEADOS
                WHERE
                    EMPLEADOS.DOCUMENTO = INSERTED.DOCUMENTO
            );
    UPDATE E
    SET
        E.NOMBRE = I.NOMBRE,
        E.DOMICILIO = I.DOMICILIO,
        E.SECCION = I.SECCION FROM EMPLEADOS E JOIN INSERTED I ON E.DOCUMENTO = I.DOCUMENTO;
END END;