<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_borrar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un dato absoluto
//---------------------------------------------------------------------------------------------------
global $usuario;

if (isset($_REQUEST['id_dato']) && isset($_REQUEST['id_entidad']) )
{
	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
	$id_dato = sanitize($_REQUEST['id_dato'],16);
	$dato = new indicador();
  	$dato->load_joined("id = $id_dato");
  	if ($dato->id_responsable == $usuario->id)
  	{
  		$medicion = new medicion();
	  	$mediciones = $medicion->Find("id_indicador = $id_dato");
		if ($mediciones)
		{
			$error = 'Tiene mediciones asociadas al dato, necesita borrar primero las mediciones';
			header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
		}
		else 
		{
			$dato->delete();
			$aviso = 'Se ha borrado el dato.';
			header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&aviso=$aviso");
		}	
	}
	else
	{
		$error = 'No tiene permisos para borrar el dato';
		header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");	
	}

  	
}
else // falta id_dato o id_entidad
{
	$error = ERR_PARAM;
	header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
}

