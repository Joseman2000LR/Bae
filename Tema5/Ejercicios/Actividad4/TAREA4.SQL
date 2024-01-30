CREATE TABLE JUJUTSUKAISEN(ID INTEGER PRIMARY KEY, NOMBRE TEXT, EDAD TEXT, PUNTUACION REAL, VISTO BOOLEAN, PODERHABILIDAD);

INSERT INTO JUJUTSUKAISEN (
    NOMBRE,
    EDAD,
    PUNTUACION,
    VISTO,
    PODERHABILIDAD
) VALUES (
    'Yuji Itadori',
    15,
    8.5,
    TRUE,
    'Control de Cuerpo'
),
(
    'Megumi Fushiguro',
    16,
    9.0,
    TRUE,
    'Invocación de Bestias'
),
(
    'Nobara Kugisaki',
    16,
    8.2,
    TRUE,
    'Técnica de Martillo'
),
(
    'Satoru Gojo',
    28,
    9.8,
    TRUE,
    'Limitless Cursed Technique'
),
(
    'Sukuna',
    4500,
    9.7,
    FALSE,
    'Maldición Poderosa'
),
(
    'Maki Zenin',
    17,
    8.6,
    TRUE,
    'Técnica de Armas'
),
(
    'Panda',
    22,
    8.4,
    TRUE,
    'Cursed Corpse Technique'
),
(
    'Toge Inumaki',
    16,
    8.1,
    TRUE,
    'Técnica del Lenguaje'
),
(
    'Kento Nanami',
    32,
    9.5,
    TRUE,
    'Cursed Technique: Ratio Technique'
),
(
    'Yuta Okkotsu',
    17,
    8.9,
    TRUE,
    'Técnica de Supresión'
),
(
    'Aoi Todo',
    16,
    8.7,
    TRUE,
    'Cursed Technique: Boogie Woogie'
),
(
    'Mai Zenin',
    16,
    8.0,
    TRUE,
    'Arquería Cursed Technique'
),
(
    'Yuki Tsukumo',
    45,
    9.2,
    TRUE,
    'Moon Dregs'
),
(
    'Kokichi Muta',
    22,
    8.3,
    TRUE,
    'Cursed Corpse Technique'
),
(
    'Utahime Iori',
    27,
    9.1,
    TRUE,
    'Técnica de la Flauta'
),
(
    'Kiyotaka Ijichi',
    38,
    7.5,
    TRUE,
    'Sin habilidad específica'
),
(
    'Junpei Yoshino',
    16,
    7.9,
    TRUE,
    'Manipulación de Emociones'
),
(
    'Momo Nishimiya',
    16,
    8.8,
    TRUE,
    'Técnica de Creación de Hechizos'
),
(
    'Kasumi Miwa',
    17,
    8.3,
    TRUE,
    'Sin habilidad específica'
),
(
    'Awasaka',
    4000,
    9.0,
    FALSE,
    'Maldición Poderosa'
);


/*CONSULTA 1:
MOSTRAR TODOS LOS REGISTROS DE LA TABLA.*/
SELECT * FROM JUJUTSUKAISEN;
/*CONSULTA 2:
MOSTRAR EL NOMBRE Y LA EDAD DE LOS PERSONAJES ORDENADOS POR EDAD DE MANERA ASCENDENTE.*/
SELECT NOMBRE, EDAD FROM JUJUTSUKAISEN ORDER BY EDAD ASC;
/*CONSULTA 3:
CONTAR CUÁNTOS PERSONAJES HAN SIDO VISTOS Y CUÁNTOS NO HAN SIDO VISTOS.*/
SELECT * FROM JUJUTSUKAISEN WHERE VISTO=0;
/*CONSULTA 4:
MOSTRAR EL NOMBRE Y LA PUNTUACIÓN DE LOS PERSONAJES QUE TIENEN UNA PUNTUACIÓN MAYOR A 9.0.*/
SELECT NOMBRE , PUNTUACION FROM JUJUTSUKAISEN WHERE PUNTUACION BETWEEN 8.0 AND 9.0;
/*CONSULTA 5:
CALCULAR LA EDAD PROMEDIO DE LOS PERSONAJES.*/
SELCT AVG(EDAD) FROM JUJUTSUKAISEN;
/*CONSULTA 6:
MOSTRAR EL NOMBRE, LA EDAD Y LA PUNTUACIÓN DE LOS PERSONAJES QUE TIENEN UNA PUNTUACIÓN
ENTRE 8.0 Y 8.5, ORDENADOS POR PUNTUACIÓN DE MANERA DESCENDENTE.*/
SELECT NOMBRE , EDAD ,PUNTUACION FROM JUJUTSUKAISEN WHERE PUNTUACION BETWEEN 8.0 AND 8.5 ORDER BY PUNTUACION DESC;
/*CONSULTA 7:
CONTAR CUÁNTOS PERSONAJES TIENEN UNA HABILIDAD ESPECÍFICA Y CUÁNTOS NO TIENEN HABILIDAD
(HABILIDAD ES "Sin habilidad específica").*/
SELECT NOMBRE,PODERHABILIDAD , COUNT(PODERHABILIDAD) AS CANTIDAD FROM JUJUTSUKAISEN GROUP BY PODERHABILIDAD;
/*CONSULTA 8: MOSTRAR EL NOMBRE Y LA EDAD DE LOS PERSONAJES QUE TIENEN UNA EDAD MAYOR A 20 Y HAN SIDO VISTOS.*/
SELCT NOMBRE, EDAD, VISTO FROM JUJUTSUKAISEN WHERE EDAD >28 AND VISTO=1;
/*CONSULTA 9: CALCULAR LA PUNTUACIÓN MÁXIMA Y MÍNIMA DE LOS PERSONAJES.*/
SELCT MAX(PUNTUACION), MIN(PUNTUACION) FROM JUJUTSUKAISEN ;
/*CONSULTA 10: MOSTRAR EL NOMBRE Y LA EDAD DE LOS TRES PERSONAJES MÁS JÓVENES.*/
SELECT NOMBRE ,EDAD FROM JUJUTSUKAISEN ORDER BY EDAD ASC LIMIT 3;