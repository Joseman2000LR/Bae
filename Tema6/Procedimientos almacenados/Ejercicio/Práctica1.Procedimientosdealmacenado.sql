UNA EMPRESA ALMACENA LOS DATOS DE SUS EMPLEADOS EN UNA TABLA LLAMADA "Empleado".

1- Elimine el procedimiento llamado "pa_empleados_sueldo" si existe:

IF OBJECT_ID('pa_empleados_sueldo') IS NOT NULL

DROP PROCEDURE PA_EMPLEADOS_SUELDO;


2- Cree un procedimiento almacenado llamado "pa_empleados_sueldo" que seleccione los
NOMBRES, APELLIDOS Y SUELDOS DE LOS EMPLEADOS QUE TENGAN UN SUELDO SUPERIOR O IGUAL AL
ENVIADO COMO PARÁMETRO.


3- Ejecute el procedimiento creado anteriormente con distintos valores:
SUELDO 1400 Y SUELDO 1500

4- Ejecute el procedimiento almacenado "pa_empleados_sueldo" sin parámetros.
¿QUÉ SUCEDE? ¿POR QUÉ?

5- Elimine el procedimiento almacenado "pa_empleados_actualizar_sueldo" si existe.

6- Cree un procedimiento almacenado llamado "pa_empleados_actualizar_sueldo" que
ACTUALICE LOS SUELDOS IGUALES AL ENVIADO COMO PRIMER PARÁMETRO CON EL VALOR ENVIADO COMO
SEGUNDO PARÁMETRO.

7- Ejecute el procedimiento creado anteriormente y verifique si se ha ejecutado
CORRECTAMENTE: SUELDO 1300, 1350

8- Ejecute el procedimiento "pa_empleados_actualizar_sueldo" enviando un solo parámetro.
¿QUÉ SUCEDE? ¿POR QUÉ?

9- Ejecute el procedimiento almacenado "pa_empleados_actualizar_sueldo" enviando en
PRIMER LUGAR EL PARÁMETRO @SUELDONUEVO Y EN SEGUNDO LUGAR @SUELDOANTERIOR (PARÁMETROS
POR NOMBRE).

10- Verifique el cambio.

11- Elimine el procedimiento almacenado "pa_sueldototal", si existe.

12- Cree un procedimiento llamado "pa_sueldototal" que reciba el documento de un
EMPLEADO Y MUESTRE SU NOMBRE, APELLIDO Y EL SUELDO TOTAL (RESULTADO DE LA SUMA DEL SUELDO Y
SALARIO POR HIJO, QUE ES DE 200 € SI EL SUELDO ES MENOR A 1500 € Y 100 €, SI EL SUELDO ES
MAYOR O IGUAL A 1500€). COLOQUE COMO VALOR POR DEFECTO PARA EL PARÁMETRO EL PATRÓN "%".

13- Ejecute el procedimiento anterior enviando diferentes valores:
'22333333', '22444444' Y '22666666'

14- Ejecute el procedimiento sin enviar parámetro para que tome el valor por defecto.

15- Elimine el procedimiento llamado "pa_departamento" si existe.

16- Cree un procedimiento almacenado llamado "pa_departamento" al cual le enviamos el
NOMBRE DE UN DEPARTAMENTO Y QUE NOS RETORNE EL PROMEDIO DE SUELDOS DE TODOS LOS
EMPLEADOS DE ESE DEPARTAMENTO Y EL VALOR MAYOR DE SUELDO (DE ESE DEPARTAMENTO).

17- Ejecute el procedimiento creado anteriormente con distintos valores.

18- Ejecute el procedimiento "pa_ departamento" sin pasar valor para el parámetro
"departamento". LUEGO MUESTRE LOS VALORES DEVUELTOS POR EL PROCEDIMIENTO. ¿QUÉ SUCEDE?
¿POR QUÉ?

19- Modifica la ejecución anterior para que haciendo uso de la función CAST que realiza
CONVERSIONES DE TIPOS, MOSTRAR LA SALIDA DE LA SIGUIENTE FORMA: ‘EL DEPARTAMENTO DE
SECRETARÍA TIENE UN SUELDO MEDIO DE 1600.00 €, Y EL SUELDO MAYOR ES DE 1800.00 €’, POR
EJEMPLO.

20- Elimine el procedimiento almacenado "pa_sueldototal", si existe y cree un procedimiento
CON ESE NOMBRE QUE RECIBA EL DOCUMENTO DE UN EMPLEADO Y RETORNE EL SUELDO TOTAL,
RESULTADO DE LA SUMA DEL SUELDO Y SALARIO POR HIJO, QUE ES 200 SI EL SUELDO ES MENOR A 1500
Y 100 SI ES MAYOR O IGUAL, CON EL SIGUIENTE FORMATO: ‘EL EMPLEADO CON DOCUMENTO 222222222
TIENE UN SUELDO TOTAL DE 1900.00 € Y TIENE 2 HIJOS Y UN SUELDO DE 1500.00€’, POR EJEMPLO.

21- Ejecute el procedimiento anterior enviando un documento existente.

22- Ejecute el procedimiento anterior enviando un documento inexistente.
RETORNA "null".

23- Ejecute el procedimiento anterior enviando el documento de un empleado en cuyo
CAMPO "sueldo" CONTENGA "null". ¿QUÉ SUCEDE? ¿POR QUÉ?

24- Ejecute el procedimiento anterior sin enviar valor para el parámetro "documento". ¿Qué
SUCEDE? ¿POR QUÉ?