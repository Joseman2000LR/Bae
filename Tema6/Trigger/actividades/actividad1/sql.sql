ACTIVIDAD 1. TRIGGERS EN SQL SERVER

1- Elimine las tablas si existen:

IF OBJECT_ID('consultas') IS NOT NULL

DROP TABLE CONSULTAS;

IF OBJECT_ID('medicos') IS NOT NULL

DROP TABLE MEDICOS;

--2- Cree las tablas con las siguientes estructuras:

CREATE TABLE MEDICOS (
    DOCUMENTO CHAR(8) NOT NULL,
    NOMBRE VARCHAR(30),
    CONSTRAINT PK_MEDICOS PRIMARY KEY CLUSTERED (DOCUMENTO)
);

CREATE TABLE CONSULTAS(
    FECHA DATETIME,
    MEDICO CHAR(8) NOT NULL,
    PACIENTE VARCHAR(30),
    CONSTRAINT PK_CONSULTAS PRIMARY KEY (FECHA, MEDICO),
    CONSTRAINT FK_CONSULTAS_MEDICO FOREIGN KEY (MEDICO) REFERENCES MEDICOS(DOCUMENTO) ON UPDATE CASCADE ON DELETE CASCADE
);

--3- Inserte algunos registros:

INSERT INTO MEDICOS VALUES(
    '22222222',
    'Alfredo Acosta'
);

INSERT INTO MEDICOS VALUES(
    '23333333',
    'Pedro Pérez'
);

INSERT INTO MEDICOS VALUES(
    '24444444',
    'Marcelina Morales'
);

INSERT INTO CONSULTAS VALUES(
    '2010/03/26 8:00',
    '22222222',
    'Elena Suárez'
);

INSERT INTO CONSULTAS VALUES(
    '2010/03/26 8:00',
    '23333333',
    'Néstor Gómez'
);

INSERT INTO CONSULTAS VALUES(
    '2010/03/26 8:30',
    '22222222',
    'Néstor Cabrera'
);

INSERT INTO CONSULTAS VALUES(
    '2010/03/28 9:00',
    '22222222',
    'Joshua García'
);

INSERT INTO CONSULTAS VALUES(
    '2010/03/29 8:00',
    '24444444',
    'Néstor Gómez'
);

INSERT INTO CONSULTAS VALUES(
    '2010/03/24 8:30',
    '22222222',
    'Hector Pérez'
);

INSERT INTO CONSULTAS VALUES(
    '2010/03/24 9:30',
    '23333333',
    'Hector Pérez'
);

4- Cree un disparador de eliminación sobre la tabla médicos que permita borrar varios
REGISTROS A LA VEZ, PERO NINGÚN MÉDICO CON CONSULTAS PENDIENTES. SE ELIMINAN TODOS LOS
MÉDICOS SOLICITADOS EN CUALQUIER SENTENCIA "delete", Y LUEGO SE VUELVEN A INSERTAR AQUELLOS
CON CONSULTAS PENDIENTES.
CREATE OR ALTER TRIGGER trg_DeleteMedicos
ON MEDICOS
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM MEDICOS
    WHERE DOCUMENTO NOT IN (
        SELECT DISTINCT MEDICO
        FROM CONSULTAS
    );
    DECLARE @MedicosEliminados TABLE (
        DOCUMENTO CHAR(8) PRIMARY KEY
    );

    INSERT INTO @MedicosEliminados (DOCUMENTO)
    SELECT DOCUMENTO
    FROM DELETED;

    INSERT INTO MEDICOS (DOCUMENTO, NOMBRE)
    SELECT ME.DOCUMENTO, ME.NOMBRE
    FROM @MedicosEliminados ME
    WHERE EXISTS (
        SELECT 1
        FROM CONSULTAS C
        WHERE C.MEDICO = ME.DOCUMENTO
    );
END;

5- Cree un disparador de inserción, eliminación y actualización que no permita
MODIFICACIONES EN LA TABLA CONSULTAS SI TALES MODIFICACIONES AFECTAN AL PACIENTE “HÉCTOR
PÉREZ”.
CREATE OR ALTER TRIGGER t_paciente_hector
ON CONSULTAS
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
   DECLARE
    @HECTOR VACHAR(50) SET @HECTOR='HÉCTOR'
    IF (EXISTS (SELECT * FROM inserted WHERE PACIENTE = @hector)
        OR EXISTS (SELECT * FROM deleted WHERE PACIENTE = @hector))
    BEGIN
        DECLARE @errorMessage NVARCHAR(255)
        SET @errorMessage = 'No se permite modificar consultas del paciente "Héctor Pérez".'
        RAISERROR(@errorMessage, 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

hacer una consulta

6- Realizar un Trigger que impida hacer una consulta cuando se indica en la inserción una
FECHA VENCIDA (INFERIOR A LA FECHA ACTUAL).
create trigger t_pacinete on CONSULTAS
alter insert  
as 
begin
DECLARE @fechaActual datatime 
set @fechaActual = GETDATE()
IF EXISTS ( SELECT 1 FROM inserted  WHERE FECHA < @fechaActual )
    BEGIN
        RAISERROR('No se puede insertar una consulta con una fecha vencida.', 16, 1)
        ROLLBACK TRANSACTION
    END
END;

7- Cree un disparador que restrinja la inserción de nuevas consultas si el médico
CORRESPONDIENTE YA TIENE UNA CONSULTA PROGRAMADA PARA LA MISMA FECHA Y HORA.
CREATE  TRIGGER trg_RestrictConsultaMismoHorario
ON CONSULTAS
alter INSERT
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM inserted i
        JOIN CONSULTAS c ON i.MEDICO = c.MEDICO AND i.FECHA = c.FECHA
    )
    BEGIN
        RAISERROR('El médico ya tiene una consulta programada para la misma fecha y hora.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

8- Implemente un disparador que valide que el nombre del paciente en la tabla consultas no
CONTENGA CARACTERES ESPECIALES O NÚMEROS.


RECUERDA QUE DEBES INCLUIR CAPTURAS TANTO DE LOS CÓDIGOS DE TODOS LOS PASOS Y DE SU
CORRECTO FUNCIONAMIENTO.