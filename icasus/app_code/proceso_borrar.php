<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: proceso_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un proceso
//---------------------------------------------------------------------------------------------------
if (isset($_REQUEST['id_proceso']) && isset($_REQUEST['id_entidad']) )
{
	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
	$id_proceso = sanitize($_REQUEST['id_proceso'],16);
	$proceso = new proceso();
  	$proceso->load_joined("id = $id_proceso");
  	if ($proceso->id_propietario == $proceso->propietario->id)
  	{
  		$indicador = new indicador();
	  	$indicadores = $indicador->Find("id_proceso = $id_proceso");
		if ($indicadores)
		{
			$error = 'Tiene indicadores asociados al proceso, necesita borrar primero los indicadores';
			header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
		}
		else 
		{
			$proceso->delete();
			$aviso = 'Se ha borrado el proceso.';
			header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&aviso=$aviso");
		}	
	}
	else
	{
		$error = 'No tiene persimos para borrar el proceso';
		header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");	
	} 	
}
else // falta id_indicador o id_entidad
{
	$error = 'Faltan parámetros para realizar esta acción.';
	header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
}
?>