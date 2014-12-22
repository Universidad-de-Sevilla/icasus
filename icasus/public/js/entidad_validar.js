function entidad_validar()
{
	if (document.formentidad.nombre.value==='') 
	{ 
       	alert('Debe rellenar todos los campos marcados como requeridos');
		return(false);
	}
    else
	{
        document.formentidad.submit();
		return(true);
	}
}
