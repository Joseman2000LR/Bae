/**1.SELECCIÓN DE VIDEOJUEGOS CUYO TÍTULO COMIENZA CON "C".**/
SELECT * FROM VIDEOJUEGO where titulo LIKE 'C%';
/**2.VIDEOJUEGOS CREADOS POR DESARROLLADORAS CUYOS NOMBRES TERMINAN CON "s".**/
SELECT * FROM DESARROLLADORA where nombre LIKE '%s';
/**3.VIDEOJUEGOS CON TÍTULOS QUE CONTIENEN LA PALABRA "and" EN CUALQUIER POSICIÓN.**/
SELECT * FROM VIDEOJUEGO where titulo LIKE '%and %';
/**4.VIDEOJUEGOS CUYO TÍTULO COMIENZA CON UNA VOCAL.**/
SELECT * from VIDEOJUEGO where titulo like '%a' or 'e%' or 'u%' or 'i%' or 'o%';
/**5.VIDEOJUEGOS CUYA DESARROLLADORA TIENE AL MENOS UNA VOCAL REPETIDA.**/
SELECT * FROM DESARROLLADORA where nombre LIKE '%a' OR 'e%' OR 'u%' OR 'i%' OR 'o%';
/* arreglar**/
/**6.VIDEOJUEGOS CON PRECIOS QUE TIENEN DOS DÍGITOS DECIMALES EXACTOS.**/
SELECT * FROM VIDEOJUEGO where precio like '%.%' ;
/**7.VIDEOJUEGOS CUYOS TÍTULOS TIENEN AL MENOS TRES PALABRAS.**/
SELECT titulo FROM VIDEOJUEGO WHERE LENGTH(titulo)<=3;
/**8. Obtener todos los desarrolladoras cuyo nombre empieza con la letra "N".**/
SELECT * FROM DESARROLLADORA where nombre LIKE 'N%';
/**9. Seleccionar los videojuegos cuyo título contiene la palabra "Witcher".**/
SELECT * FROM VIDEOJUEGO where titulo like '%Witcher%';
/**10. Obtener todas las desarrolladoras cuyo nombre termina con "ez".**/
SELECT * FROM DESARROLLADORA where nombre like '%ez';
/**11. Obtener todos las desarrolladoras cuyo nombre tiene al menos 7 caracteres.**/
SELECT * FROM DESARROLLADORA where  LENGTH(nombre)<=7;
/**12. Seleccionar los videojuegos cuya desarrolladora es diferente de "Ubisoft".**/
SELECT VIDEOJUEGO.*  from videojuegos inner join DESARROLLADORA  on videojuego.DESARROLLADORA_ID = DESARROLLADORA.id where DESARROLLADORA.nombre != 'Ubisoft';
/**13. Obtener todos las desarrolladoras cuyo nombre contiene al menos una vocal.**/
SELECT * FROM DESARROLLADORA where nombre REGEXP '[aeiouAEIOU]';
/**14. Seleccionar los videojuegos cuyo título comienza con una letra mayúscula.**/
SELECT titulo from VIDEOJUEGO where titulo REGEXP '^[A-Z]' ;
/**15. Obtener todas las desarrolladoras cuyo nombre no contiene la letra "r".**/
SELECT * FROM desarrolladora where nombre not like '%r%' ;
/**16. Seleccionar los videojuegos cuya desarrolladora empieza con la letra "B".**/
SELECT * from DESARROLLADORA where nombre like 'B%';
/**17. Obtener todas las desarrolladoras cuyo nombre tiene exactamente 6 caracteres.**/
SELECT * from DESARROLLADORA where nombre REGEXP '^.{6}$';
/**18. Seleccionar los videojuegos cuyo título contiene al menos un número.**/
SELECT TITULO FROM VIDEOJUEGO where TITULO regexp '[0-9]';
/**19. Obtener todas las desarrolladoras cuyo nombre inicia con una vocal.**/
SELECT nombre FROM DESARROLLADORA where nombre regexp '^[aeiouAEIOU]';
/**20. Obtener todas las desarrolladoras cuyo nombre no contiene espacios en blanco.**/
SELECT nombre FROM DESARROLLADORA where nombre  NOT LIKE '% %';
/**21. Seleccionar los videojuegos cuyo título termina con una vocal.**/
SELECT titulo FROM VIDEOJUEGO where titulo regexp '[aeiouAEIUO]$';
/**22. Obtener todas las desarrolladoras cuyo nombre contiene la secuencia "ar".**/
SELECT * from DESARROLLADORA where nombre like '%ar%';
/**23. Seleccionar los videojuegos cuyo título empieza con la palabra "The".**/
SELECT titulo from VIDEOJUEGO where TITULO regexp '^[The]';
/**24. Obtener todas las desarrolladoras cuyo nombre tiene al menos una letra mayúscula.**/
SELECT * from DESARROLLADORA where nombre regexp '[A-Z]\1';
/**25. Obtener todos los videojuegos cuyo nombre no contiene números.**/
SELECT * FROM VIDEOJUEGO where titulo NOT regexp '\d';
/**26. Seleccionar los videojuegos cuyo título contiene al menos tres vocales.**/
SELECT titulo FROM VIDEOJUEGO WHERE titulo regexp '';
/**27. Obtener todas las desarrolladoras cuyo nombre inicia con una consonante.**/

/**28. Seleccionar los videojuegos cuyo título no contiene la palabra "The".**/

/**29. Obtener todas las desarrolladoras cuyo nombre tiene al menos una letra repetida CONSECUTIVAMENTE.**/
'a-z\1'
/**30. Obtener todas las desarrolladoras cuyo nombre empieza con "U" o termina con "x":**/

/**31. Obtener todas las desarrolladoras cuyo nombre no contiene caracteres especiales.**/