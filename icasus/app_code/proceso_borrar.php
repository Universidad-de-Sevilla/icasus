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
	$proceso = new Proceso();
  	$proceso->load_joined("id = $id_proceso");
  	if ($proceso->id_propietario == $proceso->propietario->id)
  	{
  		$indicador = new Indicador();
	  	$indicadores = $indicador->Find("id_proceso = $id_proceso");
		if ($indicadores)
		{
			$error = ERR_PROC_BORRAR;
			header("Location: index.php?page=proceso_listar&id_entidad=$id_entidad&error=$error");
		}
		else 
		{
			$proceso->delete();
			$aviso = MSG_PROC_BORRADO;
			header("Location: index.php?page=proceso_listar&id_entidad=$id_entidad&aviso=$aviso");
		}	
	}
	else
	{
		$error = ERR_PROC_BORRAR_NO_AUT;
		header("Location: index.php?page=proceso_listar&id_entidad=$id_entidad&error=$error");	
	} 	
}
else // falta id_indicador o id_entidad
{
	$error = ERR_PARAM;
	header("Location: index.php?page=proceso_listar&id_entidad=$id_entidad&error=$error");
}

