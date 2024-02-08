-- Creación de la tabla Estudiantes
CREATE TABLE ESTUDIANTES (
    ID INTEGER PRIMARY KEY,
    NOMBRE TEXT,
    APELLIDO TEXT,
    EDAD INTEGER,
    IDCURSO INTEGER
);

-- Inserción de registros en la tabla Estudiantes
INSERT INTO ESTUDIANTES (
    NOMBRE,
    APELLIDO,
    EDAD,
    IDCURSO
) VALUES (
    'Juan',
    'Pérez',
    20,
    1
),
(
    'María',
    'García',
    22,
    2
),
(
    'Luis',
    'Martínez',
    21,
    3
),
(
    'Ana',
    'López',
    19,
    4
),
(
    'Pedro',
    'Sánchez',
    20,
    5
),
(
    'Laura',
    'Rodríguez',
    23,
    6
),
(
    'Carlos',
    'Fernández',
    21,
    1
),
(
    'Sofía',
    'González',
    22,
    2
),
(
    'Diego',
    'Díaz',
    19,
    3
),
(
    'Elena',
    'Hernández',
    20,
    4
),
(
    'Andrés',
    'Vázquez',
    22,
    5
),
(
    'Paula',
    'Moreno',
    21,
    6
),
(
    'Miguel',
    'Jiménez',
    20,
    1
),
(
    'Carmen',
    'Ruiz',
    22,
    2
),
(
    'Javier',
    'Gómez',
    19,
    3
),
(
    'Raquel',
    'Peralta',
    20,
    4
),
(
    'Alejandro',
    'Blanco',
    21,
    5
),
(
    'Isabel',
    'Santos',
    22,
    6
),
(
    'Fernando',
    'Torres',
    19,
    1
),
(
    'Marta',
    'Fuentes',
    20,
    2
);

-- Creación de la tabla Cursos
CREATE TABLE CURSOS (
    ID INTEGER PRIMARY KEY,
    NOMBRE TEXT,
    PROFESOR TEXT,
    FECHAINICIO DATE,
    FECHAFIN DATE
);

-- Inserción de registros en la tabla Cursos
INSERT INTO CURSOS (
    NOMBRE,
    PROFESOR,
    FECHAINICIO,
    FECHAFIN
) VALUES (
    'Matemáticas',
    'Xavier',
    '2024-01-01',
    '2024-05-30'
),
(
    'Historia',
    'Smith',
    '2024-02-01',
    '2024-06-30'
),
(
    'Literatura',
    'Benito',
    '2024-03-01',
    '2024-07-30'
),
(
    'Ciencias',
    'Brown',
    '2024-04-01',
    '2024-08-30'
),
(
    'Inglés',
    'Davis',
    '2024-05-01',
    '2024-09-30'
),
(
    'Arte',
    'Clark',
    '2024-06-01',
    '2024-10-30'
);