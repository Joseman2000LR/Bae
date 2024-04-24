-- Estructuras de control
-- 1. Ejemplo de BEGIN...END:
-- Encapsula un bloque de código. En este caso, se declara un aumento de sueldo para un
--EMPLEADO ESPECÍFICO Y SE ACTUALIZA SU SUELDO EN LA BASE DE DATOS.
BEGIN
    declare @DOCUMENTOEMPLEADO CHAR(8) ='2342';
    DECLARE
        @AUMNETO DECIMAL(6, 2)= 1000, 23;
        UPDATE  EMPLEADO SET SUELDO= SUELDO+@AUMENTO WHERE DOCUMENTO = @DOCUMENTOEMPLEADO;
    END;
 -- Utiliza BEGIN...END para actualizar el sueldo de un empleado específico
 -- 2. Ejemplo de IF...ELSE:
 -- Se utiliza para ejecutar un bloque de código si se cumple una condición y otro bloque si
 --NO SE CUMPLE.
 -- Haciendo uso de IF...ELSE verifica si un empleado específico tiene hijos o no hijos e
 --IMPRIME UN MENSAJE EN CONSECUENCIA.
 DECLARE
    @idEMPLEADO CHAR(8) ='22222222';
    BEGIN
            if((select hhijos from empleados where documentos=@idEmpleado)>0)
        begin 
            PRINT "Tiene hijos"
        END 
        ELSE BEGIN PRINT "no tiene hijos" END 
    END;
 -- 3. Ejemplo de EXISTS:
 -- Evalúa si existe al menos una fila que cumple con una condición especificada. En este
--   CASO, VERIFICA SI HAY EMPLEADOS EN EL DEPARTAMENTO DE CONTABILIDAD.
 -- Verifica si hay empleados en el departamento de Contabilidad y muestra un mensaje en
-- CONSECUENCIA.
    declare @empleadoDepartamento VARCHAR(20) 
    declare @departamento ='Contabilidad'
    if EXISTS (SELECT  * FROM  EMPLEADO WHERE  DEPARTAMENTO=@departamento)
begin 
    print "si existe  empleado"
end ;

 -- 4. Ejemplo de CASE:
 -- Evalúa una serie de condiciones y devuelve un valor dependiendo de cuál se cumpla
 --  PRIMERO. AQUÍ, SE DETERMINA EL DEPARTAMENTO DE UN EMPLEADO DADO UN VALOR ESPECIFICADO.
 -- Determina el departamento dado un valor especificado y muestra un mensaje 
 -- CORRESPONDIENTE.

 DECLARE
    @departamento varchar(20) 'no hay departamento'
    SELECT
        CASE
            WHEN 'CONTABILIDAD' THEN 'soy contable'
                
            WHEN 'SISTEMA' THEN 'soy sistemas'
            ELSE
                @DEPARTAMENTO
        END ;
 -- 5. Ejemplo de TRY...CATCH:
 -- Se utiliza para manejar errores en el código.
 -- Intenta insertar un empleado con documento duplicado, pero si hay un error muestra un MENSAJE.

 BEGIN
    TRY
    INSERT INTO Empleado
    VALUES
    ('22222222', 'Juan', 'perez', 1300.00 ,2 ,'contabilidad' );
END TRY 
BEGIN CATCH
    print "hay otro empleado con los mismo datos"
END CATCH

 -- 6. Ejemplo de BREAK (dentro de un bucle WHILE):
 -- Se utiliza para salir de un bucle.
 -- Ejecuta un bucle WHILE e imprime 15 iteraciones. Cuando el contador alcanza 7
 --ITERACIONES, EL BUCLE SE DETIENE. MUESTRA PARA CADA ITERACIÓN EL MENSAJE:
 --ITERACIÓN Y SU NÚMERO CORRESPONDIENTE.

DECLARE
    @CONTADOR INT = 1;
    WHILE    @CONTADOR <= 15 BEGIN IF @CONTADOR = 7 BREAK;
    PRINT @CONTADOR;
    SET @CONTADOR = @CONTADOR + 1;
END;