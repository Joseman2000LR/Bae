/**PASO 3: REALIZAR CONSULTAS DE DATOS.
REALIZA LAS SIGUIENTES CONSULTAS, Y MUESTRA EL RESULTADO OBTENIDO:*/

/*1. Listar todos los estudiantes de Literatura.*/
SELECT * FROM ESTUDIANTES INNER JOIN CURSOS ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE CURSOS.NOMBRE = 'Literatura';
/*2. Listar todos los estudiantes del profesor Xavier.**/
SELECT *  FROM ESTUDIANTES INNER JOIN CURSOS ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE CURSOS.PROFESOR ='Xavier';
/*3. Listar todos los estudiantes que tienen menos de 20 años.**/
SELECT * FROM ESTUDIANTES INNER JOIN CURSOS  ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE ESTUDIANTES.EDAD <20;
/*4. Listar todos los apellidos de los estudiantes que iniciaron el curso después de febrero de 2024.**/
SELECT ESTUDIANTES.APELLIDO FROM ESTUDIANTES INNER JOIN CURSOS ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE CURSOS.FECHAINICIO > '01/02/2024';
/*5. Listar todos los nombres de los estudiantes que finalizan el curso antes de septiembre.**/
SELECT ESTUDIANTES.NOMBRE FROM ESTUDIANTES    INNER JOIN CURSOS ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE   CURSOS.FECHAFIN > '01/09/2024';
/*6. Listar todos los estudiantes del curso de Matemáticas que tengan entre 20 y 22 años.**/
SELECT * FROM ESTUDIANTES INNER JOIN CURSOS ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE CURSOS.NOMBRE = 'Matemáticas'  AND ESTUDIANTES.EDAD BETWEEN 20 AND 22;
/*7. Listar todos los estudiantes que pertenecen a cursos que aún no han comenzado.**/
SELECT * FROM ESTUDIANTES  INNER JOIN CURSOS  ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE CURSOS.FECHAINICIO > CURRENT_DATE;
/*8. Listar todos los estudiantes que pertenecen a cursos que ya han finalizado.*/
SELECT * FROM ESTUDIANTES  INNER JOIN CURSOS  ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE CURSOR.FECHAFIN < CURRENT_DATE;
/*9. Listar todos los estudiantes que pertenecen a cursos que están en curso actualmente.**/
SELECT * FROM ESTUDIANTES  INNER JOIN CURSOS  ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE CURSOS.FECHAINICIO < CURRENT_DATE AND  CURSOS.FECHAFIN > CURRENT_DATE;
/*10. Listar todos los estudiantes que pertenecen a cursos que duran más de 40 días.**/
SELECT * ,(JulianDay(CURSOS.FECHAFIN)) - (JULIANDAY(CURSOS.FECHAINICIO))AS duracion_40dias FROM ESTUDIANTES  INNER JOIN CURSOS  ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE (JULIANDAY(CURSOS.FECHAFIN)) - (JULIANDAY(CURSOS.FECHAINICIO)) > 40;
/*11. Listar todos los estudiantes de Inglés que tienen más de 21 años.**/
SELECT * FROM ESTUDIANTES  INNER JOIN CURSOS  ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE CURSOS.NOMBRE ='Inglés' and ESTUDIANTES.EDAD >21;
/*12. Listar todos los estudiantes que pertenecen a Ciencias y que tienen un nombre que COMIENZA CON LA LETRA E.**/
SELECT ESTUDIANTES.NOMBRE, ESTUDIANTES.APELLIDO FROM ESTUDIANTES JOIN CURSOS ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE CURSOS.NOMBRE = 'Ciencias' AND ESTUDIANTES.NOMBRE LIKE 'E%'
/*13. Listar todos los estudiantes que pertenecen a cursos que tienen un nombre que no CONTIENE LA LETRA I. **/
SELECT ESTUDIANTES.NOMBRE, ESTUDIANTES.APELLIDO FROM ESTUDIANTES JOIN CURSOS ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE CURSOS.NOMBRE NOT LIKE '%I%'
/*14. Listar todos los estudiantes que pertenecen a cursos que están a cargo de un profesor CUYO NOMBRE COMIENZA CON B.**/
SELECT ESTUDIANTES.NOMBRE, ESTUDIANTES.APELLIDO FROM ESTUDIANTES JOIN CURSOS ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE CURSOS.PROFESOR LIKE 'B%'
/*15. Listar todos los estudiantes que pertenecen a cursos cuyo profesor es diferente del PROFESOR DE ARTE.**/
SELECT * FROM ESTUDIANTES JOIN CURSOS ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE CURSOS.PROFESOR != 'Clark';
/*16. Listar todos los estudiantes que pertenecen a cursos cuyo profesor ha impartido más de UN CURSO.**/
SELECT ESTUDIANTES.NOMBRE,  ESTUDIANTES.APELLIDO FROM  ESTUDIANTES  JOIN CURSOS ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE  CURSOS.PROFESOR IN ( SELECT PROFESOR FROM CURSOS GROUP BY PROFESOR HAVING COUNT(*) > 1  );
/*17. Listar todos los estudiantes que pertenecen a cursos cuya fecha de inicio es posterior a LA FECHA DE INICIO DE LITERATURA.**/
SELECT ESTUDIANTES.NOMBRE, ESTUDIANTES.APELLIDO FROM  ESTUDIANTES  JOIN CURSOS ON ESTUDIANTES.IDCURSO = CURSOS.ID WHERE CURSOS.FECHAINICIO > (  SELECT  FECHAINICIO  FROM    CURSOS  WHERE    NOMBRE = 'Literatura'   );