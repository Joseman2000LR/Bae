create PROCEDURE pa_obtenerNumeroCiudades
    @nombre_pais vachar(50)
as 
begin
    select count(*) as numeroCiudades from 
    Ciudades where pais = @nombre_pais;
end;

exec / execute  PA_OBTENERNUMEROCIUDADES @nombre_pais="España"; o ''

ejemplo :
CREATE TABLE EMPLEADO (
    DOCUMENTO CHAR(8),
    NOMBRE VARCHAR(20),
    APELLIDO VARCHAR(20),
    SUELDO DECIMAL(6, 2),
    HHIJOS TINYINT,
    DEPARTAMENTOS VARCHAR(20),
    PRIMARY KEY (DOCUMENTO)
) INSERT INTO EMPLEADO VALUES(
    '22222222',
    'Juan',
    'perez',
    1300,
    2,
    'contabilidad'
);

INSERT INTO EMPLEADO VALUES(
    '22333333',
    'luis',
    'Lopez',
    1300,
    0,
    'contabilidad'
);

INSERT INTO EMPLEADO VALUES(
    '22444444',
    'Marta',
    'Perez',
    1500,
    1,
    'sistema'
);

INSERT INTO EMPLEADO VALUES(
    '22555555',
    'Susana',
    'Garcia',
    1400,
    2,
    'Secretaria'
);

INSERT INTO EMPLEADO VALUES(
    '22666666',
    'Jose maria',
    'Morales',
    1400,
    3,
    'Secretaria'
);

-- crear procedimineto

CREATE PROCEDURE PA_EMPLEADOSUELDO AS
BEGIN
    SELECT
        NOMBRE,
        APELLIDO,
        SUELDO
    FROM
        EMPLEADO END;
    EXEC PA_EMPLEADOSUELDO;
 -- procedimento que selecione los nombre, apellidos , cantidad de hijos de los empleados con hijos;
    CREATE PROCEDURE PA_EMPLEADO_HIJOS AS
    BEGIN
        SELECT
            NOMBRE,
            APELLIDO,
            HHIJOS
        FROM
            EMPLEADO
        WHERE
            HHIJOS >0;
    END;

    EXEC PA_EMPLEADO_HIJOS;
 --actualisar empleados que no tengan hijos y poner hijos y volver a probar el procedimineto
    INSERT INTO EMPLEADO VALUES(
        '22333333',
        'luis',
        'Lopez',
        1300,
        0,
        'contabilidad'
    );
    UPDATE EMPLEADO
    SET
        HHIJOS = 2
    WHERE
        DOCUMENTO = '22333333';
    EXEC PA_EMPLEADO_HIJOS;


    