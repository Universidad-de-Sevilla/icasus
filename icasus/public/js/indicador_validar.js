function indicador_validar()
{
    if (document.formindicador.id_responsable.value=='')
	{
        alert('Debe seleccionar un responsable para el indicador');
        return(false);
    }
    if ( document.formindicador.id_proceso.value=='' || document.formindicador.nombre.value=='' || document.formindicador.descripcion.value=='' || document.formindicador.formulacion.value=='' || document.formindicador.fuente.value=='' || document.formindicador.periodicidad.value=='' || document.formindicador.objetivo.value=='')
	{ 
       	alert('Debe rellenar todos los campos marcados como requeridos');
		return(false);
	}
    else 
	{
        document.formindicador.submit();
		return(true);
	}
}
