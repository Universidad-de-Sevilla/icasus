<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicador_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un indicador
//---------------------------------------------------------------------------------------------------


if (isset($_REQUEST['id_indicador']) && isset($_REQUEST['id_entidad']) )
{
	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
	$id_indicador = sanitize($_REQUEST['id_indicador'],16);
	$indicador = new indicador();
  	$indicador->load_joined("id = $id_indicador");
  	if ($indicador->id_responsable == $indicador->responsable->id)
  	{
  		$medicion = new medicion();
	  	$mediciones = $medicion->Find("id_indicador = $id_indicador");
		if ($mediciones)
		{
			$error = 'Tiene mediciones asociadas al indicador, necesita borrar primero las mediciones';
			header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
		}
		else 
		{
			$indicador->delete();
			$aviso = 'Se ha borrado el indicador.';
			header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&aviso=$aviso");
		}	
	}
	else
	{
		$error = 'No tiene persimos para borrar el indicador';
		header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");	
	}

  	
}
else // falta id_indicador o id_entidad
{
	$error = 'Faltan parámetros para realizar esta acción.';
	header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
}
?>
