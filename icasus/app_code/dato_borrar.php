<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: dato_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un dato
//---------------------------------------------------------------------------------------------------
global $usuario;

if (isset($_REQUEST['id_dato']) && isset($_REQUEST['id_entidad']) )
{
	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
	$id_dato = sanitize($_REQUEST['id_dato'],16);
	$dato = new indicador();
  $dato->load_joined("id = $id_dato");
  // Comprobamos que el usuario es responsable de este indicador para permitirle borrar
  if ($usuario->id == $dato->id_responsable OR $usuario->id == $dato->id_responsable_medicion)
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
		$error = 'No tiene persimos para borrar el dato';
		header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");	
	}
}
else // falta id_dato o id_entidad
{
	$error = 'Faltan parámetros para realizar esta acción.';
	header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
}
?>
