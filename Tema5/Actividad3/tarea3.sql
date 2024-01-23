/*PASO 1: CREA UNA TABLA.

1. Utilizando la terminal o línea de comandos, abre SQLite3 y crea una base de datos

LLAMADA TAREA3.DB

2.Dentro de SQLite3, crea una tabla llamada Series con los siguientes campos:*/
CREATE SERIES (Id Integer Primary key,Titulo text ,Genero text, anio DATE ,Calificacion Real , En_Emision BOOLEAN);
/*
● ID (TIPO INTEGER, CLAVE PRIMARIA)
● TÍTULO (TIPO TEXT)
● GÉNERO (TIPO TEXT)
● AÑO (TIPO DATE)
● CALIFICACIÓN (TIPO REAL)
● EN_EMISIÓN (TIPO BOOLEAN)
PASO 2: INSERTAR 20 ENTRADAS
DADO EL SIGUIENTE CONJUNTO DE INFORMACIÓN:
/**/
INSERT INTO SERIES (
    ID,
    TÍTULO,
    GÉNERO,
    AÑO,
    CALIFICACIÓN,
    EN_EMISIÓN
) VALUES (
    1,
    'Stranger Things',
    'Ciencia Ficción',
    '2016-07-15',
    9,
    FALSE
),
(
    2,
    'The Crown',
    'Drama',
    '2016-11-04',
    8.7,
    FALSE
),
(
    3,
    'Narcos',
    'Crimen',
    '2015-08-28',
    8.8,
    FALSE
),
(
    4,
    'Black Mirror',
    'Ciencia Ficción',
    '2011-12-04',
    8.9,
    FALSE
),
(
    5,
    'Money Heist',
    'Acción',
    '2017-05-02',
    8.5,
    FALSE
),
(
    6,
    'Ozark',
    'Drama',
    '2017-07-21',
    8.6,
    FALSE
),
(
    7,
    'The Witcher',
    'Fantasía',
    '2019-12-20',
    8.2,
    FALSE
),
(
    8,
    'Dark',
    'Ciencia Ficción',
    '2017-12-01',
    8.8,
    FALSE
),
(
    9,
    'Mindhunter',
    'Crimen',
    '2017-10-13',
    8.6,
    FALSE
),
(
    10,
    'BoJack Horseman',
    'Animación',
    '2014-08-22',
    9,
    FALSE
),
(
    11,
    'The Umbrella Academy',
    'Acción',
    '2019-02-15',
    8.1,
    FALSE
),
(
    12,
    'Lucifer',
    'Crimen',
    '2016-01-25',
    8.1,
    FALSE
),
(
    13,
    'The Mandalorian',
    'Ciencia Ficción',
    '2019-11-12',
    8.7,
    TRUE
),
(
    14,
    'Altered Carbon',
    'Ciencia Ficción',
    '2018-02-02',
    8,
    TRUE
),
(
    15,
    'The Haunting of Hill House',
    'Terror',
    '2018-10-12',
    8.7,
    FALSE
),
(
    16,
    'Sex Education',
    'Comedia',
    '2019-01-11',
    8.3,
    TRUE
),
(
    17,
    'Cobra Kai',
    'Acción',
    '2018-05-02',
    8.6,
    TRUE
),
(
    18,
    'The Office',
    'Comedia',
    '2005-03-24',
    8.9,
    FALSE
),
(
    19,
    '13 Reasons Why',
    'Drama',
    '2017-03-31',
    7.8,
    FALSE
),
(
    20,
    'Daredevil',
    'Acción',
    '2015-04-10',
    8.6,
    FALSE
);
/*
REALIZA LA INSERCIÓN EN LA TABLA SERIES DE LAS 20 ENTRADAS.
PASO 3: REALIZAR CONSULTAS DE DATOS.

1. Selecciona todos los registros de la tabla.

2. Muestra sólo los títulos y géneros de las series.

3. Filtra las series con una calificación mayor a 8.5.

4. Ordena las series por año de forma ascendente.

5. Cuenta cuántas series tienen una calificación mayor o igual a 8.

6. Calcula el promedio de las calificaciones.

7. Encuentra la serie con la calificación más alta.

8. Muestra los títulos de las series que están en emisión.

9. Obtén la cantidad total de series por género.

10. Filtra las series de Ciencia Ficción o Drama.

11. Encuentra las series cuyos títulos contienen la palabra "The".

12. Calcula la calificación promedio por género.

13. Ordena las series por año de forma descendente y muestra solo las primeras 5.

14. Obtén la serie con el título más largo.

15. Muestra las series que no están en emisión y tienen una calificación mayor a 8.

16. Encuentra las series cuya fecha de estreno es anterior a 2010 o posterior a 2020.

17. Calcula la suma de las calificaciones de las series de Acción.

18. Muestra las series que tienen un título único (ningún otro tiene el mismo título).

19. Encuentra la serie con la calificación más baja entre las que están en emisión.

20. Obtén las series cuyo género es el mismo que el de 'Stranger Things'.

21. Muestra las series de Drama ordenadas por calificación de forma descendente.

22. Calcula el rango de calificaciones (diferencia entre la calificación más alta y la más

BAJA).

23. Encuentra las series que se estrenaron antes que 'The Witcher'.

24. Muestra las series que tienen un título similar al de 'Money Heist' (ignorando

MAYÚSCULAS/MINÚSCULAS).

25. Calcula la calificación promedio de las series que no están en emisión y tienen más de 3

AÑOS DESDE SU ESTRENO.

26. Actualiza la calificación de 'The Crown' a 9.2.

27. Marca como finalizada la serie 'Stranger Things' (cambia el valor de En_Emisión a

FALSE).

28. Elimina la serie con el título '13 Reasons Why'.

29. Actualiza la fecha de estreno de 'The Mandalorian' al 2020-01-01.

30. Elimina todas las series con calificación menor a 8.*/