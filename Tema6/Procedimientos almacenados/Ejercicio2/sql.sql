-- 1. Eliminar el procedimiento pa_empleados_departamento si existe
IF OBJECT_ID('dbo.pa_empleados_departamento', 'P') IS NOT NULL

BEGIN
    DROP PROCEDURE PA_EMPLEADOS_DEPARTAMENTO;
END 
 -- 2. Crear un procedimiento para mostrar todos los empleados de un departamento determinado
CREATE PROCEDURE MOSTRAR_EMPLEADOS_POR_DEPARTAMENTO @DEPARTAMENTO INT AS BEGIN IF @DEPARTAMENTO IS NULL BEGIN PRINT 'Debe proporcionar un valor para el parámetro departamento.';

RETURN;
END;
 -- Tu lógica para mostrar los empleados del departamento proporcionado
SELECT
    *
FROM
    EMPLEADO
WHERE
    DEPARTAMENTO = @DEPARTAMENTO;
END 
 -- 3. Ejecutar el procedimiento enviando un valor para el parámetro
EXEC MOSTRAR_EMPLEADOS_POR_DEPARTAMENTO @DEPARTAMENTO = 1;
 -- 4. Ejecutar el procedimiento sin parámetro
EXEC MOSTRAR_EMPLEADOS_POR_DEPARTAMENTO @DEPARTAMENTO = NULL;
 -- 5. Eliminar el procedimiento pa_actualizarhijos si existe
IF OBJECT_ID('dbo.pa_actualizarhijos', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE PA_ACTUALIZARHIJOS;
END 
 -- 6. Crear un procedimiento almacenado para modificar la cantidad de hijos de un empleado
CREATE PROCEDURE MODIFICARCANTIDADHIJOS @DOCUMENTO VARCHAR(20), @NUEVACANTIDADHIJOS INT AS
BEGIN
 -- Verificar si se proporcionaron valores para ambos parámetros
    IF @DOCUMENTO IS NULL OR @NUEVACANTIDADHIJOS IS NULL
    BEGIN
 -- Si uno o ambos parámetros son NULL, retornar 0 y salir del procedimiento
        RETURN 0 END
 -- Actualizar la cantidad de hijos del empleado con el documento especificado
        UPDATE EMPLEADOS SET CANTIDADHIJOS = @NUEVACANTIDADHIJOS WHERE DOCUMENTO = @DOCUMENTO
 -- Verificar si se realizó la actualización
        IF @@ROWCOUNT > 0 BEGIN
 -- Si se realizó la actualización, retornar 1
        RETURN 1 END ELSE BEGIN
 -- Si no se realizó la actualización (porque el documento no existe), retornar 0
        RETURN 0 END END
 -- 7. Ejecutar el procedimiento enviando los dos parámetros y ver el contenido de la variable
DECLARE
    @RESULTADO INT
    EXEC @RESULTADO = MODIFICARCANTIDADHIJOS @DOCUMENTO = 'documento_del_empleado', @NUEVACANTIDADHIJOS = 3
    PRINT 'El resultado de la ejecución del procedimiento es: ' + CAST(@RESULTADO AS VARCHAR(10))
 -- 8. Verificar la actualización consultando la tabla
SELECT
    *
FROM
    EMPLEADO
WHERE
    DOCUMENTO = 12345;
 -- 9. Ejecutar los mismos pasos, pero enviando solo un valor para el parámetro documento
EXEC @RESULTADO = ACTUALIZAR_CANTIDAD_HIJOS @DOCUMENTO = 12345, @NUEVA_CANTIDAD_HIJOS = NULL;
PRINT 'Resultado de la actualización: ' + CAST(@RESULTADO AS VARCHAR(10));
 -- 10. Verificar que el registro no se actualizó consultando la tabla
SELECT
    *
FROM
    EMPLEADO
WHERE
    DOCUMENTO = 12345;
 -- 11. Emplear un "if" para controlar el valor de la variable de retorno
DECLARE
    @RESULTADO2 INT;
    EXEC       @RESULTADO2 = ACTUALIZAR_CANTIDAD_HIJOS @DOCUMENTO = 12345, @NUEVA_CANTIDAD_HIJOS = 2;
    IF         @RESULTADO2 = 1 BEGIN PRINT 'La actualización fue exitosa.';
END ELSE BEGIN PRINT 'La actualización no fue exitosa.';
END
 -- 12. Verificar la actualización consultando la tabla
SELECT * FROM EMPLEADO WHERE DOCUMENTO = 12345;
 -- 13. Emplear nuevamente un "if" y enviar solo valor para el parámetro "hijos"
DECLARE    @RESULTADO3 INT;
EXEC       @RESULTADO3 = ACTUALIZAR_CANTIDAD_HIJOS @DOCUMENTO = NULL, @NUEVA_CANTIDAD_HIJOS = 4;
IF         @RESULTADO3 = 1 BEGIN PRINT 'La actualización fue exitosa.';
END ELSE BEGIN PRINT 'La actualización no fue exitosa.';
END

--PARTE 2:

-- Paso 1: Eliminar la tabla "Alumno" si existe y crearla con los campos especificados
IF OBJECT_ID('Alumno', 'U') IS NOT NULL

DROP TABLE ALUMNO
CREATE TABLE ALUMNO (
    DOCUMENTO CHAR(8) PRIMARY KEY,
    NOMBRE VARCHAR(40),
    NOTA DECIMAL(4, 2)
)
 -- Paso 2: Insertar algunos registros en la tabla "Alumno"
INSERT INTO ALUMNO VALUES ('22222222', 'Pedro López', 5);

INSERT INTO ALUMNO VALUES (
    '23333333',
    'Ana López',
    4
);

INSERT INTO ALUMNO VALUES (
    '24444444',
    'María Santana',
    8
);

INSERT INTO ALUMNO VALUES (
    '25555555',
    'Juan García',
    5.6
);

INSERT INTO ALUMNO VALUES (
    '26666666',
    'Carlos Torres',
    2
);

INSERT INTO ALUMNO VALUES (
    '27777777',
    'Noelia Torres',
    7.5
);

INSERT INTO ALUMNO VALUES (
    '28888888',
    'Mariano Herreros',
    3.5
);

-- Paso 3: Eliminar la tabla "Aprobados" si existe y crearla con los mismos campos que "Alumno"
IF OBJECT_ID('Aprobados', 'U') IS NOT NULL

DROP TABLE APROBADOS
CREATE TABLE APROBADOS (
    DOCUMENTO CHAR(8) PRIMARY KEY,
    NOMBRE VARCHAR(40),
    NOTA DECIMAL(4, 2)
)
 -- Paso 4: Eliminar la tabla "Suspendidos" si existe y crearla con los campos especificados
IF OBJECT_ID('Suspendidos', 'U') IS NOT NULL
    DROP TABLE SUSPENDIDOS
CREATE TABLE SUSPENDIDOS (
    DOCUMENTO CHAR(8) PRIMARY KEY,
    NOMBRE VARCHAR(40)
)
 -- Paso 5: Eliminar el procedimiento "pa_aprobados" si existe
IF OBJECT_ID('pa_aprobados', 'P') IS NOT NULL
    DROP PROCEDURE PA_APROBADOS
 -- Paso 6: Crear el procedimiento para seleccionar alumnos aprobados
CREATE PROCEDURE PA_APROBADOS
AS
BEGIN
    SELECT * FROM ALUMNO WHERE NOTA >= 5
END
 -- Paso 7: Insertar en la tabla "Aprobados" el resultado devuelto por el procedimiento "pa_aprobados"
INSERT INTO APROBADOS EXEC PA_APROBADOS
 -- Paso 8: Ver el contenido de "Aprobados"
SELECT * FROM APROBADOS
 -- Paso 9: Eliminar el procedimiento "pa_suspendidos" si existe
IF OBJECT_ID('pa_suspendidos', 'P') IS NOT NULL
    DROP PROCEDURE PA_SUSPENDIDOS
 -- Paso 10: Crear el procedimiento para seleccionar alumnos suspendidos
CREATE PROCEDURE PA_SUSPENDIDOS
AS
BEGIN
    SELECT DOCUMENTO, NOMBRE FROM ALUMNO WHERE NOTA < 5
END
 -- Paso 11: Insertar en la tabla "Suspendidos" el resultado devuelto por el procedimiento "pa_suspendidos"
INSERT INTO SUSPENDIDOS EXEC PA_SUSPENDIDOS
 -- Paso 12: Ver el contenido de "Suspendidos"
SELECT * FROM SUSPENDIDOS