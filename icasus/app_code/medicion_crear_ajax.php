<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_crear_ajax.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Actualiza de manera asincrona las subunidades que se verán afectadas antes de crearse
// una medición
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

$id_indicador = sanitize($_GET['id_indicador'],INT);
$id_entidad = sanitize($_GET['id_entidad'],INT);

if (!empty($id_indicador) AND !empty($id_entidad))
{
	$indicador = new indicador();
	if ($indicador->permiso_crear_medicion($usuario->id,$id_indicador))
	{
		$indicador_subunidad = new indicador_subunidad();
		if ($indicador_subunidad->actualizar_subunidades($id_indicador,$id_entidad))
		{
			//deberia escribir en el log un regitro de exito de actualizacion
		}
		else
		{
			//deberia escribir en el log un regitro de error por no poder actualizar
		}
	}
	else
	{
		//deberia escribir en el log un regitro de error por falta de permiso
	}
}
else
{
	//deberia escribir en el log un regitro de error por falta de párametros
}
?>
