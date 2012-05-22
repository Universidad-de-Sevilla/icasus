<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://forja.rediris.es/projects/icasus/)
// Archivo: indicador_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Creación de nuevos indicadores
//---------------------------------------------------------------------------------------------------

global $smarty;
global $operario;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript' , array('indicador_validar'));
$id_entidad = sanitize($_REQUEST['id_entidad'],16);

if (isset($_POST['codigo']) || isset($_POST['nombre']) || isset($_POST['descripcion']) 
	|| isset($_POST['formulacion']) || isset($_POST['fuente']) || isset($_POST['periodicidad'])
	|| isset($_POST['objetivo']) || isset($_POST['id_proceso']))
{
	// Si venían los datos necesarios los desinfectamos y grabamos el indicador
	$id_proceso = sanitize($_POST['id_proceso'],16);
	$codigo = sanitize($_POST['codigo'],2);
	$nombre = sanitize($_POST['nombre'],2);
	$objetivo = sanitize($_POST['objetivo'],2);
	$descripcion = sanitize($_POST['descripcion'],2);
	$objetivo_carta = isset($_POST['objetivo_carta'])?sanitize($_POST['objetivo_carta'],32):0;
	$objetivo_estrategico = isset($_POST['objetivo_estrategico'])?sanitize($_POST['objetivo_estrategico'],32):0;
	$formulacion = sanitize($_POST['formulacion'],2);
	$fuente = sanitize($_POST['fuente'],2);
	$periodicidad = sanitize($_POST['periodicidad'],2);
	$id_responsable = sanitize($_POST['id_responsable'],16);
	//define la visibilidad
	$id_visibilidad = sanitize($_POST['visibilidad'],16);
	$indicador = new indicador($basedatos);
	if ($id_indicador = $indicador->crear($id_entidad,$id_proceso,$codigo,$nombre,$objetivo,$objetivo_carta,
		$objetivo_estrategico,$descripcion, $formulacion,$fuente,$periodicidad,$id_responsable,$id_visibilidad))
	{
		$log = new log(); // registra la accion en el log
		$log->add('nuevo indicador',$id_indicador,$operario->id_usuario);	
		$smarty->assign('indicador',$indicador->obtener_datos($id_indicador));
		$smarty->assign('aviso', 'Se ha creado un nuevo indicador con los siguientes datos');
		$entidad = new entidad($basedatos);
		$entidad->obtener_datos($id_entidad);
		$smarty->assign('entidad', $entidad->datos);
		$smarty->assign('_nombre_pagina' , $entidad->datos['nombre']);
		$plantilla = 'indicador_datos.tpl';
	}
	else
	{
		$smarty->assign('error',$indicador->error);
		$smarty->assign('_nombre_pagina' , 'Error');
		$plantilla = 'error.tpl';
	}
}
else
{
	$entidad = new entidad($basedatos);
	$smarty->assign('usuarios',$entidad->listar_usuarios($id_entidad));
	$smarty->assign('procesos',$entidad->listar_procesos($id_entidad));
	$indicador = new indicador($basedatos);
	$smarty->assign('entidad', $entidad->obtener_datos($id_entidad));
	$smarty->assign('barra_indicadores',$entidad->barra_indicadores()); //para el desplegable de la barra de arriba 
	$smarty->assign('_nombre_pagina' , $entidad->datos['nombre']);
	$visibilidades = new visibilidad();
	$visible = $visibilidades->find('1=1');
	$smarty->assign('visibilidades',$visible);
	$plantilla = 'indicador_crear.tpl';
}
?>
