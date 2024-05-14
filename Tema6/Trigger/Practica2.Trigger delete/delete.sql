UN COMERCIO QUE VENDE ARTÍCULOS DE INFORMÁTICA ALMACENA LOS DATOS DE SUS ARTÍCULOS EN UNA
TABLA DENOMINADA "articulo".

1- Elimine la tabla si existe:

IF OBJECT_ID('articulo') IS NOT NULL

DROP TABLE ARTICULOS;

2- Cree la tabla, con la siguiente estructura:

CREATE TABLE ARTICULO(
    CODIGO INT IDENTITY,
    TIPO VARCHAR(30),
    DESCRIPCION VARCHAR(40),
    PRECIO DECIMAL(8, 2),
    STOCK INT,
    CONSTRAINT PK_ARTICULOS PRIMARY KEY (CODIGO)
);

3- Inserte algunos registros:

INSERT INTO ARTICULOS VALUES (
    'impresora',
    'OKI C3340N',
    40,
    100
);

INSERT INTO ARTICULOS VALUES (
    'impresora',
    'OKI C5850',
    115,
    200
);

INSERT INTO ARTICULOS VALUES (
    'impresora',
    'HP laserjet 6200N',
    225,
    0
);

INSERT INTO ARTICULOS VALUES (
    'monitor',
    'OKI 19',
    90,
    0
);

INSERT INTO ARTICULOS VALUES (
    'monitor',
    'BENQ 19',
    120,
    0
);

INSERT INTO ARTICULOS VALUES (
    'monitor',
    'ASUS 27',
    150,
    0
);

INSERT INTO ARTICULOS VALUES (
    'monitor',
    'HP 21',
    160,
    0
);

INSERT INTO ARTICULOS VALUES (
    'monitor',
    'AOC 32',
    230,
    0
);
INSERT INTO ARTICULOS VALUES (
    'monitor h',
    'AOC 32',
    0,
    0
);

4- Cree un disparador para controlar que no se elimine un artículo si hay stock. El
DISPARADOR SE ACTIVARÁ CADA VEZ QUE SE EJECUTA UN "delete" SOBRE "articulo", CONTROLANDO EL
STOCK, SI SE ESTÁ ELIMINANDO UN ARTÍCULO CUYO STOCK SEA MAYOR A 0, EL DISPARADOR DEBE
RETORNAR UN MENSAJE DE ERROR Y DESHACER LA TRANSACCIÓN.
CREATE TRIGGER TARTICULODELETER ON ARTICULO AFTER
    DELETE AS
BEGIN
        IF  (SELECT   STOCK FROM DELETED>0) 
        BEGIN RAISERROR('Error: No se puede eliminar un artículo con stock igual o mayor que cero.', 16, 1);
        ROLLBACK TRANSACTION;
END END;
5- Solicite la eliminación de un artículo que no tenga stock.
delete articulo where codigo= 9;
6- Intente eliminar un artículo para el cual haya stock.
DELETE ARTICULO
WHERE
    CODIGO= 5;
7- Solicite la eliminación de varios artículos que no tengan stock.
DELETE ARTICULO
WHERE
    CODIGO= 10;
    DELETE ARTICULO
WHERE
    CODIGO=
    12;
8- Intente eliminar varios artículos, algunos con stock y otros sin stock.
DELETE ARTICULO
WHERE
    CODIGO= 5;

DELETE ARTICULO
WHERE
    CODIGO= 12;
9- Modificar el disparador anterior para que en el mensaje indique el artículo(descripción) y
LAS UNIDADES(STOCK) QUE QUEDARÍAN DE ESE ARTÍCULO.
ALTER  TRIGGER TARTICULODELETER ON ARTICULO AFTER
    DELETE AS
BEGIN
declare @stock int (select stock from delete );
declare @descripcion varchar(50)=(select descripcion from delete);
declare @error = print='el producto ', @descripcion ,' ' ,@stock ;
        IF (SELECT  STOCK FROM DELETED>0) 
        BEGIN RAISERROR(@error, 16, 1);
        ROLLBACK TRANSACTION;
END END;
10- Cree un trigger para evitar que se elimine más de 1 artículo.
create trigger controladorDelete on articulo alfter delete 
as begin  declare @columnas int 
set @columnas (select @@RowCountfrom delete)
if @columnas >1 begin 
 print('  ',16,1)
ROLLBACK TRANSACTION;
end;
11- Solicite la eliminación de 1 artículo para el cual no haya stock.

12- Solicite la eliminación de 1 artículo que tenga stock.

13- Solicite la eliminación de 2 artículos para los cuales no haya stock.

14- Solicite la eliminación de 2 artículos para los que haya stock.