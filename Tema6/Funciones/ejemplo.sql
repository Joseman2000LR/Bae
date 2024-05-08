create function nombre_funcion(@paremetro1 tipo_dato @parametro2 tipo_dato
) RETURN tipo_retorno
as begin intruciones 

-- tipo escalar

create funcion sumar2numero(
    @parametro1 int @parametro2 int 
)
retun int 
as begin 
declare  @resultado int  =@parametro1 + @parametro2 
return @ resultado
end ;

select  dbo.sumar2numero(5,3); --dbo. es oblogatorio 

CREATE FUNCION buscarEmpleado(
    @dept_id varchar(20)
)
RETUNS
AS 
return(
    select  nombre  from empeado where deparatmento =@dpt_id
);

