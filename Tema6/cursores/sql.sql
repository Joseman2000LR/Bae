cursores 

tabla empleado(docmentos char(8),nombre varchr(50));
create cursor declare micursor cursor for 
select documento ,nombre from empleado 
declare  @documento varc(8),
declare @nombre varch(50)
-- abrir el cursor 
open micursor
-- recorrer el cursor
fecth next from micursor into @docmuneto, @nombre 
while @@FETCH_status=0
begin 
print(@documento='documento'+'nombre'=@nombre);
fech next from micurso into @documento ,@nombre end 
close micursor ;
DEALLOCATE micursor;

--------------------------------


create database comercio;
go
use comercio;
go
create table categoria (
idCategoria int primary key not null,
nombreCategoria varchar(50) not null,
)
go
insert into categoria values (1, 'Ordenadores')
insert into categoria values (2, 'Accesorios')
go
create table productos (
codigo int primary key not null,
producto varchar(50) not null,
precio Money not null,
idCategoria int not null
foreign key (idCategoria) references categoria,
)
go
insert into productos values (1, 'HP Elitedesk', 1200.00, 1)
insert into productos values (2, 'Ratón HP', 16.00, 2)
insert into productos values (3, 'Micrófono', 8.00, 2)
insert into productos values (4, 'Auriculares USB', 20.00, 2)
go


create table titulos (
codigoTitulo int primary key not null,
Titulo varchar(20) not null
)
create table autores (
codigoAutor int primary key not null, 
nombres varchar(20) not null, 
apellidos varchar(40) not null, 
origen varchar(10) not null
)
create table titulos_autores (
codigoTitulo int foreign key (codigoTitulo) references titulos not null, 
codigoAutor int foreign key (codigoAutor) references autores not null
)
--Registros de prueba
insert into titulos values (1, 'Natalie')
insert into titulos values (2, 'Natalie 2')
insert into titulos values (3, 'Sangre con sabor a miel')
insert into titulos values (4, 'Los cerezos en flor')
insert into titulos values (5, 'BD SQL Server')
insert into titulos values (6, 'BD NoSQL')


insert into autores values (1, 'Bibiana', 'Reyes', 'Canarias')
insert into autores values (2, 'Judith', 'Morón', 'Canarias')
insert into autores values (3, 'José Miguel', 'Cejas', 'Canarias')


insert into titulos_autores values (1, 1)
insert into titulos_autores values (2, 1)
insert into titulos_autores values (3, 2)
insert into titulos_autores values (4, 3)
insert into titulos_autores values (5, 3)
insert into titulos_autores values (6, 3)

1 crea un cursor que muestre la informacion de los productos
DECLARE MICURSOR CURSOR FOR
SELECT codigo FROM productos;
DECLARE @codigo INT;
OPEN MICURSOR;
FETCH NEXT FROM MICURSOR INTO @codigo;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT CAST(@codigo AS VARCHAR);
    FETCH NEXT FROM MICURSOR INTO @codigo;
END;
CLOSE MICURSOR;
DEALLOCATE MICURSOR;
2 crea un cursor que muestre el nombre de la categoria y todos sus productos
 pista : dos cursores anidados 
 DECLARE @idCategoria int;
DECLARE @nombreCategoria varchar(50);
DECLARE @idProducto int;
DECLARE @nombreProducto varchar(50);
SELECT idCategoria ,nombreCategoria from categoria ;
DECLARE categoria_cursor CURSOR FOR 
SELECT idCategoria, nombreCategoria FROM categoria;
OPEN categoria_cursor;

FETCH NEXT FROM categoria_cursor INTO @idCategoria, @nombreCategoria;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Categoría: ' + @nombreCategoria;
     DECLARE producto_cursor CURSOR FOR 
    SELECT idProducto, nombreProducto 
    FROM producto 
    WHERE idCategoria = @idCategoria;

    OPEN producto_cursor;

    FETCH NEXT FROM producto_cursor INTO @idProducto, @nombreProducto;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT '    Producto: ' + @nombreProducto;
        FETCH NEXT FROM producto_cursor INTO @idProducto, @nombreProducto;
    END

    CLOSE producto_cursor;
    DEALLOCATE producto_cursor;

    FETCH NEXT FROM categoria_cursor INTO @idCategoria, @nombreCategoria;
END

CLOSE categoria_cursor;
DEALLOCATE categoria_cursor;

3 cea un cursor que muestre los titulos de los libros de autores canarios pista: dos cursores anidados

