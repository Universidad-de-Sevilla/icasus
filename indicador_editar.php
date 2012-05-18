<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicador_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín Corredera (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Formulario para modificar los datos de un indicador
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript' , array('indicador_validar'));
$operario->permisos = array(array('indicador_editar',0));

// Comprobamos que vengan los datos mínimos necesarios
if (isset($_REQUEST['id_indicador']) && isset($_REQUEST['id_entidad'])) 
{
	$id_indicador = sanitize($_REQUEST['id_indicador'],16);
	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
	// Comprobamos permisos 
	if (in_array(array('indicador_editar',$id_entidad),$operario->permisos) OR 
		in_array(array('indicador_editar',0),$operario->permisos))
	{	
		// Si vienen todos los datos necesarios del formulario grabamos en la base de datos
		if (isset($_POST['nombre']) && isset($_POST['id_proceso']))
		{
			$codigo = sanitize($_POST['codigo'],2);
			$nombre = sanitize($_POST['nombre'],2);
			$id_proceso = sanitize($_POST['id_proceso'],16);
			$objetivo = sanitize($_POST['objetivo'],32);
			$objetivo_estrategico = isset($_POST['objetivo_estrategico'])?sanitize($_POST["objetivo_estrategico"],32):0;
			$objetivo_carta = isset($_POST['objetivo_carta'])?sanitize($_POST["objetivo_carta"],32):0;
			$descripcion = sanitize($_POST['descripcion'],2);
			$formulacion = sanitize($_POST['formulacion'],2); 
			$fuente = sanitize($_POST['fuente'],2);
			$periodicidad = sanitize($_POST['periodicidad'],2);
			$id_responsable = sanitize($_POST['id_responsable'],16);
			$id_visibilidad = sanitize($_POST['visibilidad'],16);
			//$id_dimension = sanitize($_POST['id_dimension'],16);
			//$umbral = sanitize($_POST['umbral'],2);
			$indicador = new indicador($basedatos);

			if ($indicador->modificar($codigo, $nombre, $objetivo, 
				$objetivo_estrategico, $objetivo_carta,
				$descripcion, $formulacion, $fuente, $periodicidad, 
				$id_responsable, $id_indicador, $id_proceso,$id_visibilidad))
			{
				// Los cambios se han guardado reenviamos a la pagina que muestra el indicador
				$aviso = 'Se han guardado los cambios en el indicador';
				header("Location: index.php?page=indicador_datos&id_indicador=$id_indicador&id_entidad=$id_entidad&aviso=$aviso");
			}
			else
			{
				// Ha fallado la modificacion avisamos error
				$error = 'No se ha podido modificar el indicador debido a un error';
				$smarty->assign('error', $error);
				$smarty->assign('_nombre_pagina' , 'Error'); 
				$plantilla = 'error.tpl';
			}
		}
		else 
		{
			// Prepara los datos que necesita el formulario para editar valores
			$indicador = new indicador($basedatos);
			$smarty->assign('indicador', $indicador->obtener_datos($id_indicador));
			//$smarty->assign('dimensiones' , $indicador->listar_dimensiones());
			$entidad = new entidad($basedatos);
			$smarty->assign('procesos', $entidad->listar_procesos($id_entidad));
			$smarty->assign('entidad',$entidad->obtener_datos($indicador->datos['id_entidad']));
			$smarty->assign('usuarios', $entidad->listar_usuarios($id_entidad));
			$smarty->assign('_nombre_pagina' , $entidad->datos['nombre']); 
			$visibilidad = new visibilidad();
			$visibilidades = $visibilidad->find('1=1');
			$smarty->assign('visibilidades' , $visibilidades); 
			$plantilla = 'indicador_editar.tpl';
		}
	}
	else
	{
		// El usuario no tiene permisos avisamos error
		$error = 'No tiene permisos suficientes para editar indicadores de esta unidad';
		$smarty->assign('error', $error);
		$plantilla = 'error.tpl';
	}
}
else
{
	// Faltan parametros avisamos error
	$error = 'Faltan parametros para editar un indicador';
	$smarty->assign('error', $error);
	$smarty->assign('_nombre_pagina' , 'Error'); 
	$plantilla = 'error.tpl';
}
?>
