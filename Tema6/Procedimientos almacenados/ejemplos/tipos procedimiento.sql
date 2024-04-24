declare @edad int ;
set @edad =28;
print "tengo "+ cast (v@edad as varchar(50)) ; 

/*
hacer una estrutura de beign end para un empleado  aumentar la el sueldo y actializar la base de datos */
BEGIN
    UPDATE EMPLEADO
    SET
        SUELDO= SUELDO+10
    WHERE
        DOCUMENTO = 1;
END;

-- con variables 
begin 
declare @documentoEmpleado char(8) ='2342';
declare @aumneto decimal(6,2)= 1000,23;
    UPDATE EMPLEADO
    SET
        SUELDO= sueldo+@aumento
    WHERE
        DOCUMENTO = @documentoEmpleado;
END;
