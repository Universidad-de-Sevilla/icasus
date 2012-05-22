function valor_validar()
{
	if (document.formvalor.dato_valor.value=='') 
	{ 
       	alert('Debe rellenar todos los campos marcados como requeridos');
		return(false);
	}
    else
	{
        document.formvalor.submit();
		return(true);
	}
}
