SQLite3 tarea2.db

.open tarea2;
/*CREA UNA TABLA LLAMADA DISNEY CON LOS SIGUIENTES CAMPOS:
• ID (TIPO INTEGER, CLAVE PRIMARIA)
• NOMBRE (TIPO TEXT)
• PELÍCULA (TIPO TEXT)
• EDAD (TIPO INTEGER)
• TIPO (TIPO TEXT)*/
CREATE table  DISNEY(ID Integer PRimary Key , nombre text , Pelicula text, edad INTEGER, tipo text);
/* PASO 2: INSERTAR 50 ENTRADAS*/
INSERT  INTO DISNEY VALUES (1, 'MICKEY', 'FANTASÍAl', 90, 'RATÓN');
INSERT  INTO DISNEY VALUES(2,'MINNIE','FANTASÍA'92,'RATÓN');
INSERT  INTO DISNEY VALUES(3,'DONALD','EL PATO DONALD',85,'PATO');
INSERT  INTO DISNEY VALUES(4,'DAISY','EL PATO DONALD',87,'PATO');
INSERT  INTO DISNEY VALUES(5,'GOOFY','GOOFY','LA PELÍCULA',85,'PERRO');
INSERT  INTO DISNEY VALUES(6,'CENICIENTA','LA CENICIENTA',70,'HUMANO');
INSERT  INTO DISNEY VALUES(7,'SIMBA','EL REY LEÓN',30,'LEÓN');
INSERT  INTO DISNEY VALUES(8,'NALA','EL REY LEÓN',28,'LEÓN');
INSERT  INTO DISNEY VALUES(9,'ARIEL','LA SIRENITA',32,'SIRENA');
INSERT  INTO DISNEY VALUES(10,'ERIC','LA SIRENITA',34,'HUMANO');
INSERT  INTO DISNEY VALUES(11,'ALADDÍN','ALADDÍN',26,'HUMANO');
INSERT  INTO DISNEY VALUES(12,'YASMÍN','ALADDÍN',24,'HUMANO');
INSERT  INTO DISNEY VALUES(13,'WOODY','TOY STORY',25,'JUGUETE');
INSERT  INTO DISNEY VALUES(14,'BUZZ LIGHTYEAR','TOY STORY',26,'JUGUETE');
INSERT  INTO DISNEY VALUES(15,'ELSA','FROZEN',30,'HUMANO');
INSERT  INTO DISNEY VALUES(16,'ANNA','FROZEN',28,'HUMANO');
INSERT  INTO DISNEY VALUES(17,'MULÁN','MULÁN',32,'HUMANO');
INSERT  INTO DISNEY VALUES(18,'POCAHONTAS','POCAHONTAS',30,'HUMANO');
INSERT  INTO DISNEY VALUES(19,'HÉRCULES','HÉRCULES',28,'HUMANO');
insert  INTO DISNEY VALUES(20,'MEGARA','HÉRCULES',26,'HUMANO');

/*PASO 3: REALIZAR CONSULTAS DE DATOS.*/

/*1. Seleccionar todos los personajes de la película "Frozen".*/
SELECT  * FROM DISNEY WHERE  PELICULA='FROZEN';
/*2. Encontrar los personajes humanos mayores de 25 años.*/
SELECT *  FROM Disney WHERE tipo='HUMANO' AND edad >25; 
/*3. Ordenar los personajes por edad de manera descendente.*/
SELECT * FROM DISNEY order by EDAD DESC ;
/*4. Contar el número de personajes por tipo.*/
SELECT COUNT(tipo) from Disney ;/* o */SELECT tipo,count(tipo)as n_pj from Disney group by tipo;
/*5. Buscar personajes cuyo nombre comienza con la letra "M".*/
SELECT  * FROM  DISNEY WHERE NOMBRE LIKE 'M%';
/*6. Encontrar los personajes de DISNEY que no pertenecen a la película "Toy Story".*/
SELECT * from DISNEY WHERE PELICULA !='TOY STORY';/* o */select * from disney not like 'toy story';
/*7. Calcular la edad promedio de los personajes humanos.*/
SELECT AVG(EDAD)  as mediaHumano FROM DISNEY  WHERE personajes='Humanos'; 
/*8. Mostrar los personajes de DISNEY cuyos nombres contienen más de 5 letras.*/
SELECT nombre from DISNEY WHERE LENGTH(nombre)>5;
/*9. Encontrar los personajes cuyas edades están entre 25 y 30 años (inclusive).*/
SELECT NOMBRE FROM  DISNEY WHERE EDAD BETWEEN 25 AND 30;
/*10. Ordenar los personajes por película y edad de manera ascendente.*/
SELECT * FROM  DISNEY order by PELICULA ASC , edad ASC;
