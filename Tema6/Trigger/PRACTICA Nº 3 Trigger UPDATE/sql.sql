Un club almacena los datos de sus socios en una tabla denominada "socios", las
inscripciones en "inscritos" y en otra tabla "morosos" guarda los documentos de los socios
que deben matrículas.
1- Elimine las tablas si existen:
if object_id('inscritos') is not null
drop table inscritos;
if object_id('socios') is not null
drop table socios;
if object_id('morosos') is not null
drop table morosos;
--2- Cree las tablas, con las siguientes estructuras:
create table socios(
documento char(8) not null,
nombre varchar(30),
domicilio varchar(30),
constraint PK_socios primary key(documento)
);
create table inscritos(
numero int identity,
documento char(8) not null,
deporte varchar(20),
matricula char(1),
constraint FK_inscritos_documento
foreign key (documento)
references socios(documento),
constraint CK_inscritos_matricula check (matricula in ('s','n')),
constraint PK_inscritos primary key(documento,deporte)
);
create table morosos(
documento char(8) not null
);
--3- Inserte algunos registros en las 3 tablas:
insert into socios values('22222222','Ana Acosta','Avenida de los príncipes, 112');
insert into socios values('23333333','Berto Romero','La Milagrosa, 45');
insert into socios values('24444444','Carlos Castro','Avda. Miguel Hermoso, 76');
insert into socios values('25555555','María Morales','Camino de Los Llanos S/N');
insert into inscritos values('22222222','tenis','s');
insert into inscritos values('22222222','natacion','n');
insert into inscritos values('23333333','tenis','n');
insert into inscritos values('24444444','futbol','s');
insert into inscritos values('24444444','natacion','s');
insert into morosos values('22222222');
insert into morosos values('23333333');
4- Cree un disparador para la tabla "inscritos" que se active ante una sentencia "update" y
no permita actualizar más de un registro.
CREATE TRIGGER CONTROLADORUPADTE ON ARTICULO AFTER
    UPDATE AS
BEGIN
    DECLARE @COLUMNAS INT SET @COLUMNAS =( SELECT  @@ROWCOUNT FROM  DELETED )
         IF @COLUMNAS >1
    BEGIN
        PRINT 'No se puede actualizar más de un registro';
        ROLLBACK TRANSACTION;
    END
END;
5- Cree otro disparador para la tabla "inscritos" que se active ante una sentencia "update".
Si se actualiza el pago de la matrícula a 's', el socio debe eliminarse de la tabla "morosos";
no debe permitir modificar a 'n' una matrícula paga.
CREATE TRIGGER CONTROLADORUPADTE ON inscritos AFTER
    UPDATE AS
BEGIN
     IF (select matricula from upadte where matricula ='s') 
    BEGIN
       delete documentos from morosos;
        ROLLBACK TRANSACTION;
    END
END;
6- Actualice cualquier campo (diferente de "matricula") de un registro de la tabla "inscritos".
7- Actualice cualquier campo (diferente de "matricula") de varios registros de la tabla
"inscritos".
8- Actualice el campo "matricula" a 's' de un inscrito que deba la matrícula.
9- Verifique que el campo se actualizó y que el socio ya no está en "morosos".
10-Actualice el campo "matricula" a 'n' de un inscrito que tenga la matrícula paga