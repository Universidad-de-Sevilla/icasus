function confirmar_borrado()
{
	if(confirm("¿Seguro que desea borrar este elemento?"))
	{
		document.formusuario.submit();
	}
	else
	{
		return(false);
	}
}
