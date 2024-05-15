PRÁCTICA Nº 4 SQLS: TRIGGER VARIOS EVENTOS
UNA EMPRESA ALMACENA LOS DATOS DE SUS EMPLEADOS EN UNA TABLA DENOMINADA "empleados"
Y LOS DATOS DE LAS DISTINTAS SUCURSALES EN UNA TABLA "sucursales".

1- Elimine las tablas si existen:

IF OBJECT_ID('empleados') IS NOT NULL

DROP TABLE EMPLEADOS;

IF OBJECT_ID('sucursales') IS NOT NULL

DROP TABLE SUCURSALES;

2- Cree las tablas, con las siguientes estructuras:

CREATE TABLE SUCURSALES(
    CODIGO INT IDENTITY,
    DOMICILIO VARCHAR(30),
    CONSTRAINT PK_SUCURSALES PRIMARY KEY (CODIGO)
);

CREATE TABLE EMPLEADOS(
    DOCUMENTO CHAR(8) NOT NULL,
    NOMBRE VARCHAR(30),
    DOMICILIO VARCHAR(30),
    SUCURSAL INT NOT NULL,
    CONSTRAINT PK_EMPLEADOS PRIMARY KEY (DOCUMENTO),
    CONSTRAINT FK_EMPLEADOS_SUCURSAL FOREIGN KEY(SUCURSAL) REFERENCES SUCURSALES(CODIGO)
);

3- Inserte algunos registros en las dos tablas:

INSERT INTO SUCURSALES VALUES (
    'La Laguna'
);

INSERT INTO SUCURSALES VALUES (
    'Tacoronte'
);

INSERT INTO SUCURSALES VALUES (
    'El Rosario'
);

INSERT INTO EMPLEADOS VALUES (
    '22222222',
    'Ana Acosta',
    'Avda. Los Menceyes, 6',
    1
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

4- Cree un disparador de inserción, eliminación y actualización que no permita
MODIFICACIONES EN LA TABLA "empleados" SI TALES MODIFICACIONES AFECTAN A EMPLEADOS DE LA
SUCURSAL DE 1.
create trigger t_empleado on empleado
alter insert ,delete ,update 
as 
begin
declare @surcursal int  
set @surculas =1
if(exists (select * from insert where surcursal = @sucursal) or exists (select * from delete where surculas=@sucursal) )
begin declare  @mensaje varchar(50)
set @mensaje ='no se permite'
    RAISERROR(@ERROR, 16, 1);
    ROLLBACK TRANSACTION;
END;
5- Inserte un empleado en la sucursal 3.

6- Intente insertar un empleado en la sucursal 1.

7- Ejecute un "update" sobre "empleados" que permita la transacción.

8- Ejecute un "update" sobre "empleados" que el trigger deshaga.

9- Elimine un empleado (o varios) que no sean de la sucursal 1.

10- Intente eliminar un empleado (o varios) de la sucursal 1.