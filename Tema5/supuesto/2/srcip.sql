CREATE DATABASE CASAS_RURALES;

GO
USE CASAS_RURALES;

CREATE TABLE CASA_RURAL(
    CODIGO VARCHAR(10) PRIMARY KEY,
    DUENYOL VARCHAR(40),
    DIRECCION VARCHAR(30),
    TELEFONO VARCHAR(9),
    EMAIL VARCHAR(80),
    PRECIO_EUR INT,
    FECHA_CONSTRUCCION DATE,
    FECHA_REHABILITACION DATE,
    MUNICIPIO VARCHAR(10),
    DESCRIPCION VARCHAR(100)
);

CREATE TABLE HABITACION(
    CODIGO VARCHAR(2) PRIMARY KEY,
    NUM_PLAZAS TINYINT,
    BANYO VARCHAR(1),
    PRECIO_NOCHE INT,
    PRECIO_DTO_3 TINYINT,
    DESCRIPCION VARCHAR(100),
    COD_CASA VARCHAR(10)
);

CREATE TABLE MUNICIPIO(
    CODIGO VARCHAR(10) PRIMARY KEY,
    CODIGO_POSTAL VARCHAR(5),
    NOMBRE VARCHAR(30),
    PROVINCIA VARCHAR(2)
);

CREATE TABLE PROVINCIA(
    CODIGO VARCHAR(2) PRIMARY KEY,
    NOMBRE VARCHAR(30)
);

CREATE TABLE SERVICIOS(
    TIPO VARCHAR(15)PRIMARY KEY,
    DESCRIPCION VARCHAR(30)
);

CREATE TABLE SERV_CASA(
    COD_CASA VARCHAR(10),
    TIPO_SERV VARCHAR(15),
    DISTANCIA FLOAT
);

INSERT INTO PROVINCIA VALUES (
    'P1',
    'Santa Cruz de Tenerife'
),
(
    'P2',
    'Las Palmas de Gran Canaria'
);

INSERT INTO MUNICIPIO VALUES (
    'M01',
    '38500',
    'Güímar',
    'P1'
),
(
    'M02',
    '38550',
    'Arafo',
    'P1'
),
(
    'M03',
    '38555',
    'Candelaria',
    'P1'
),
(
    'M04',
    '38300',
    'Puerto de la Cruz',
    'P1'
),
(
    'M05',
    '35500',
    'Mogán',
    'P2'
),
(
    'M06',
    '35550',
    'Teror',
    'P2'
),
(
    'M07',
    '35550',
    'Agüímes',
    'P2'
),
(
    'M08',
    '35555',
    'Telde',
    'P2'
),
(
    'M09',
    '35300',
    'Gáldar',
    'P2'
);

INSERT INTO CASA_RURAL VALUES (
    'CR002',
    'Pedro Pérez',
    'La Morra
S/N',
    '666666666',
    'pp@gmail.com',
    60,
    '20/12/1975',
    '15/01/2005',
    'M01',
    'Casa
Cueva en zona agrícola...'
),
(
    'CR003',
    'Pedro Pérez',
    'Choregino,62
',
    '666666666',
    'pp@gmail.com',
    80,
    '20/12/2010',
    NULL,
    'M01',
    'Cueva junto al
mar...'
),
(
    'CR004',
    'María Mesa',
    'Choregino,64
',
    '666666667',
    'mm@gmail.com',
    30,
    '10/02/2000',
    NULL,
    'M01',
    'Cueva junto al
mar...'
),
(
    'CR005',
    'María Mesa',
    'Santa Lucía,4
',
    '666666667',
    'mm@gmail.com',
    130,
    '10/02/1965',
    '10/09/2012',
    'M01',
    'Casa junto
al mar...'
),
(
    'CR006',
    'Petra Peraza',
    'C/ La Palma,16
',
    '666666668',
    'pp@gmail.com',
    130,
    '10/02/1985',
    '01/09/2006',
    'M08',
    'Casa junto
al mar...'
),
(
    'CR007',
    'Olga Santana',
    'C/ Lanzarote,16
',
    '666666669',
    'os@gmail.com',
    230,
    '10/02/2024',
    NULL,
    'M09',
    'Piso residencial'
),
(
    'CR008',
    'Olga Santana',
    'C/ Lanzarote,18
',
    '666666669',
    'os@gmail.com',
    200,
    '10/02/2024',
    NULL,
    'M09',
    'Piso residencial'
);

INSERT INTO HABITACION VALUES (
    'h2',
    1,
    'n',
    30,
    25,
    'estudio sin habitaciones',
    'CR002'
),
(
    'h3',
    1,
    's',
    80,
    65,
    'Habitación con TV e internet',
    'CR008'
),
(
    'h4',
    2,
    's',
    100,
    80,
    'Súper habitación con TV, wifi, satélite,
...',
    'CR007'
);

INSERT INTO SERVICIOS VALUES (
    'S01',
    'Colegio'
),
(
    'S02',
    'Ambulatorio'
),
(
    'S03',
    'Área comercial'
),
(
    'S04',
    'Supermercado'
),
(
    'S05',
    'Farmacia'
),
(
    'S06',
    'Estación de servicio'
),
(
    'S07',
    'Zona de ocio'
);

INSERT INTO SERV_CASA VALUES (
    'CR001',
    'S01',
    6
),
(
    'CR001',
    'S02',
    8
),
(
    'CR001',
    'S07',
    2
),
(
    'CR002',
    'S01',
    16
),
(
    'CR002',
    'S02',
    10
),
(
    'CR002',
    'S07',
    0
);