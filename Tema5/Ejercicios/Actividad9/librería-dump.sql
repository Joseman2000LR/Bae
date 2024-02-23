-- Tabla de clientes
CREATE TABLE CLIENTE (
    ID_CLIENTE INTEGER PRIMARY KEY,
    NOMBRE TEXT,
    APELLIDO TEXT,
    DIRECCION TEXT
);

INSERT INTO CLIENTE (
    NOMBRE,
    APELLIDO,
    DIRECCION
) VALUES (
    'Juan',
    'González',
    'Calle Principal 123'
),
(
    'María',
    'Martínez',
    'Avenida Central 456'
),
(
    'Pedro',
    'Sánchez',
    'Plaza Mayor 789'
);

-- Tabla de libros
CREATE TABLE LIBRO (
    CODIGO INTEGER PRIMARY KEY,
    TITULO TEXT,
    AUTOR TEXT,
    EDITORIAL TEXT,
    PRECIO REAL,
    FECHA_PUBLICACION DATE
);

INSERT INTO LIBRO (
    TITULO,
    AUTOR,
    EDITORIAL,
    PRECIO,
    FECHA_PUBLICACION
) VALUES (
    'El aleph',
    'Borges',
    'Planeta',
    15.50,
    '1949-01-01'
),
(
    'Martin Fierro',
    'Jose Hernandez',
    'Emece',
    22.90,
    '1872-01-01'
),
(
    'Antologia poetica',
    'J.L. Borges',
    'Planeta',
    39,
    '1967-01-01'
),
(
    'Aprenda PHP',
    'Mario Molina',
    'Emece',
    19.50,
    '2022-01-01'
),
(
    'Cervantes y el quijote',
    'Bioy Casare- J.L. Borges',
    'Paidos',
    35.40,
    '1999-01-01'
),
(
    'El Manual de PHP',
    'J.C. Paez',
    'Paidos',
    19,
    '2020-01-01'
),
(
    'Harry Potter y la piedra filosofal',
    'J.K. Rowling',
    'Paidos',
    45.00,
    '1997-01-01'
),
(
    'Harry Potter y la camara secreta',
    'J.K. Rowling',
    'Paidos',
    46.00,
    '1998-01-01'
),
(
    'Alicia en el pais de las maravillas',
    'Lewis Carroll',
    'Paidos',
    36.00,
    '1865-01-01'
);

-- Tabla de ventas
CREATE TABLE VENTA (
    ID_VENTA INTEGER PRIMARY KEY,
    ID_CLIENTE INTEGER,
    CODIGO_LIBRO INTEGER,
    FECHA_VENTA DATE,
    CANTIDAD INTEGER,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
    FOREIGN KEY (CODIGO_LIBRO) REFERENCES LIBRO(CODIGO)
);

-- Datos de ejemplo para la tabla de ventas
INSERT INTO VENTA (
    ID_CLIENTE,
    CODIGO_LIBRO,
    FECHA_VENTA,
    CANTIDAD
) VALUES (
    1,
    1,
    '2024-01-15',
    2
),
(
    2,
    7,
    '2024-02-10',
    1
),
(
    3,
    3,
    '2024-01-20',
    3
),
(
    1,
    5,
    '2024-02-05',
    1
),
(
    2,
    2,
    '2024-01-30',
    2
),
(
    3,
    8,
    '2024-02-15',
    1
);