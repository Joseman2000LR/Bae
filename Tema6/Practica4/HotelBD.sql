Create database Hotel;

use Hotel;

CREATE TABLE  TipoServicio  (
  nombreServicio  char(10) NOT NULL,
  PRIMARY KEY  (nombreServicio)
);

INSERT INTO  TipoServicio  VALUES ('Comedor');
INSERT INTO  TipoServicio  VALUES ('Lavandería');
INSERT INTO  TipoServicio  VALUES ('Parking');
INSERT INTO  TipoServicio  VALUES ('Recepción');

CREATE TABLE  Pais  (
  pais  char(20) NOT NULL,
  PRIMARY KEY  (pais)
);
 
INSERT INTO  Pais  VALUES ('Alemania');
INSERT INTO  Pais  VALUES ('España');
INSERT INTO  Pais  VALUES ('Francia');
INSERT INTO  Pais  VALUES ('Portugal');
INSERT INTO  Pais  VALUES ('Italia');

CREATE TABLE Cliente (
   idCliente  char(12) NOT NULL,
   pais  char(20) NOT NULL,
   nombre  char(12) NOT NULL,
   primerApellido  char(12) NOT NULL,
   segundoApellido  char(12) ,
   direccion  char(30) NOT NULL,
   telefono  char(12) NOT NULL,
   observaciones  char(50) ,
  PRIMARY KEY  (idCliente),
  FOREIGN KEY  (pais) references Pais (pais) );

INSERT INTO  Cliente  VALUES ('12345', 'España', 'Felipe', 'Iglesias', 'López', 'Avda Los Castros, 44', '942344444', 'Buen cliente');
INSERT INTO  Cliente  VALUES ('44444', 'España', 'Cristina', 'García', 'García', 'Calle Mayor, 67 ', '942456444', null);
INSERT INTO  Cliente  VALUES ('45678', 'Francia', 'Ludovic', 'Giuly', 'Bourquin', '18 avenue Alsacen Cour', '37890194', null);
INSERT INTO  Cliente  VALUES ('43215', 'Alemania', 'Hans', 'Schmidt', 'Müller', 'Hauptstrasse 123', '65890234', 'Cliente exigente');
INSERT INTO  Cliente  VALUES ('45680', 'Italia', 'Giulia', 'Bianchi', null, 'Via Verdi 5', '3209876543', null);

CREATE TABLE  TipoHabitacion  (
   categoria int NOT NULL ,
   camas  int  NOT NULL,
   exterior  char(2) NOT NULL check (exterior in ('Si', 'No')),
   salon  char(2) NOT NULL check (salon in ('Si', 'No')),
   terraza  char(2) NOT NULL check (terraza in ('Si', 'No')),
  PRIMARY KEY  (categoria)
) ;
-- CHECK es una restricción que limita los valores válidos 
-- para la columna "Terraza" a solo dos opciones: 'Si' o 'No'. 

INSERT INTO  TipoHabitacion  VALUES (1, 1, 'Si', 'No', 'No');
INSERT INTO  TipoHabitacion  VALUES (2, 2, 'Si', 'No', 'No');
INSERT INTO  TipoHabitacion  VALUES (3, 3, 'Si', 'No', 'No');
INSERT INTO  TipoHabitacion  VALUES (4, 1, 'Si', 'Si', 'No');

CREATE TABLE  Habitacion  (
  numHabitacion  int  NOT NULL,
  tipoHabitacion  int NOT NULL,
  PRIMARY KEY  ( numHabitacion ),
  Foreign key (TipoHabitacion) references tipoHabitacion ( categoria )
) ; 

INSERT INTO  Habitacion  VALUES (101, 1);
INSERT INTO  Habitacion  VALUES (102, 1);
INSERT INTO  Habitacion  VALUES (103, 1);
INSERT INTO  Habitacion  VALUES (104, 2);
INSERT INTO  Habitacion  VALUES (105, 2);
INSERT INTO  Habitacion  VALUES (106, 3);
INSERT INTO  Habitacion  VALUES (107, 4);

CREATE TABLE  Servicio  (
   idServicio  int NOT NULL ,
   nombreServicio  char(10) NOT NULL,
   descripcion  char(30) NOT NULL,
   precio  money NOT NULL,
   iva  numeric (5,2) NOT NULL,
   fecha  date NOT NULL,
  PRIMARY KEY  ( idServicio ),
  foreign key (nombreServicio) references TipoServicio (nombreServicio)
) ;

 set dateformat ymd;

INSERT INTO  Servicio  VALUES (1, 'Comedor', '1 menu del día', 10, 7, '2023-01-01');
INSERT INTO  Servicio  VALUES (2, 'Lavandería', 'Lavado de camisa', 2, 7, '2023-01-01');
INSERT INTO  Servicio  VALUES (3, 'Lavandería', 'Lavado de pantalon', 1, 7, '2023-01-01');

CREATE TABLE  Temporada  (
   temporada  int NOT NULL ,
   fechaInicio  date NOT NULL,
   fechaFinal  date NOT NULL,
   tipo  char(1) not null check (tipo in ('B','M','A')) ,
  PRIMARY KEY  (temporada)
) ;

 set dateformat ymd
 -- La instrucción SET DATEFORMAT ymd en SQL Server 
 -- establece el formato de fecha que se utilizará para interpretar 
 -- y mostrar fechas en consultas y comandos

INSERT INTO  Temporada  VALUES (1, '2023-01-01', '2023-03-31', 'B');
INSERT INTO  Temporada  VALUES (2, '2023-04-01', '2023-05-31', 'M');
INSERT INTO  Temporada  VALUES (3, '2023-06-01', '2023-08-31', 'A');
INSERT INTO  Temporada  VALUES (4, '2023-09-01', '2023-10-31', 'M');
INSERT INTO  Temporada  VALUES (5, '2023-11-01', '2023-12-31', 'B');

CREATE TABLE  PrecioHabitacion (
   idPrecio  int NOT NULL ,
   precio  money NOT NULL,
   temporada int NOT NULL,
   tipoHabitacion  int NOT NULL,
  PRIMARY KEY  ( idPrecio ),
  foreign key (temporada) references Temporada (temporada),
  foreign key (tipoHabitacion) references TipoHabitacion(categoria)
) ;

 
INSERT INTO  PrecioHabitacion  VALUES (1, 30, 1, 1);
INSERT INTO  PrecioHabitacion  VALUES (2, 35, 2, 1);
INSERT INTO  PrecioHabitacion  VALUES (3, 40, 3, 1);
INSERT INTO  PrecioHabitacion  VALUES (4, 35, 4, 1);
INSERT INTO  PrecioHabitacion  VALUES (5, 30, 5, 1);
INSERT INTO  PrecioHabitacion  VALUES (6, 35, 1, 2);
INSERT INTO  PrecioHabitacion  VALUES (7, 40, 2, 2);
INSERT INTO  PrecioHabitacion  VALUES (8, 45, 3, 2);
INSERT INTO  PrecioHabitacion  VALUES (9, 40, 4, 2);
INSERT INTO  PrecioHabitacion  VALUES (10, 35, 5, 2);
INSERT INTO  PrecioHabitacion  VALUES (11, 40, 1, 3);
INSERT INTO  PrecioHabitacion  VALUES (12, 45, 2, 3);
INSERT INTO  PrecioHabitacion  VALUES (13, 50, 3, 3);
INSERT INTO  PrecioHabitacion  VALUES (14, 45, 4, 3);
INSERT INTO  PrecioHabitacion  VALUES (15, 40, 5, 3);
INSERT INTO  PrecioHabitacion  VALUES (16, 50, 1, 4);
INSERT INTO  PrecioHabitacion  VALUES (17, 55, 2, 4);
INSERT INTO  PrecioHabitacion  VALUES (18, 60, 3, 4);
INSERT INTO  PrecioHabitacion  VALUES (19, 55, 4, 4);
INSERT INTO  PrecioHabitacion  VALUES (20, 50, 5, 4);

CREATE TABLE  ReservaHabitac  (
   idReserva  numeric identity(1,1) NOT NULL ,
   fechaEntrada  date NOT NULL,
   fechaSalida  date NOT NULL,
   iva  numeric(5,2) NOT NULL,
   numHabitacion  int NOT NULL,
   cliente  char(12) NOT NULL,
   PRIMARY KEY  ( idReserva )  ,
   foreign KEY  (cliente) references Cliente (idCliente),
  foreign key (numHabitacion) references Habitacion (NumHabitacion)
) ;

INSERT INTO  ReservaHabitac   (fechaEntrada , fechaSalida  , iva , numHabitacion  , cliente)
VALUES ( '2023-03-15', '2023-03-25', 0.07,101, '12345');
INSERT INTO  ReservaHabitac (fechaEntrada , fechaSalida   , iva , numHabitacion  , cliente)
 VALUES ( '2023-03-15', '2023-03-25', 0.07, 102, '12345');
INSERT INTO  ReservaHabitac (fechaEntrada , fechaSalida   , iva , numHabitacion  , cliente)
 VALUES ( '2023-02-16', '2023-02-21', 0.07,103, '12345');
INSERT INTO  ReservaHabitac  (fechaEntrada , fechaSalida   , iva , numHabitacion  , cliente)
VALUES ( '2023-03-16', '2023-03-21', 0.07,104, '44444');
INSERT INTO  ReservaHabitac (fechaEntrada, fechaSalida   , iva , numHabitacion  , cliente)
 VALUES ( '2023-03-16', '2023-03-21', 0.07,105, '44444');
INSERT INTO  ReservaHabitac  (fechaEntrada, fechaSalida  , iva , numHabitacion  , cliente)
VALUES ( '2023-03-16', '2023-03-21', 0.07,106, '44444');
INSERT INTO  ReservaHabitac (fechaEntrada, fechaSalida   , iva , numHabitacion  , cliente)
 VALUES ( '2023-03-16', '2023-03-21', 0.07,107, '44444');

CREATE TABLE  Gasto  (
   idGasto  int identity NOT NULL ,
   idReserva  numeric NOT NULL,
   idServicio  int NOT NULL,
   fecha  datetime NOT NULL,
   cantidad  int NOT NULL, 
   precio money  not null,
  PRIMARY KEY  ( idGasto ),
  foreign KEY  (idReserva) references ReservaHabitac  (idReserva ),
  foreign key (idServicio ) references Servicio (idServicio )
)  ;

set IDENTITY_INSERT dbo.Gasto on
-- La instrucción SET IDENTITY_INSERT ON es una orden que 
-- habilita la inserción explícita de valores en una columna 
-- de identidad (también conocida como autoincremento en SQL Server).

INSERT INTO  Gasto  ( idGasto,idReserva  , idServicio  ,fecha ,cantidad ,precio)
VALUES ( 1,1,1, '2023-03-15 12:00', 1,10);
INSERT INTO  Gasto  ( idGasto,idReserva  , idServicio  ,fecha ,cantidad ,precio)
VALUES (2, 1,1,  '2023-03-15 11:00', 1,10);
INSERT INTO  Gasto  (idGasto, idReserva  , idServicio  ,fecha ,cantidad ,precio)
VALUES (3, 4, 2, '2023-03-15 09:30', 1,2);

set IDENTITY_INSERT dbo.Gasto off