<?php
//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: indicador_editar.php
//--------------------------------------------------------------------------
// Descripcion: Formulario para modificar los datos de un indicador
//--------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

// Comprobamos que vengan los datos mínimos necesarios
if (isset($_REQUEST['id_indicador']) && isset($_REQUEST['id_entidad'])) 
{
	$id_indicador = sanitize($_REQUEST['id_indicador'],16);
	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
	$usuario_entidad = new usuario_entidad();
	// Comprobamos permisos 
	if ($usuario_entidad->load("id_usuario=$usuario->id and id_entidad=$id_entidad and (id_rol=1 or id_rol=2)"))
	{	
		$indicador = new indicador();
    $indicador->load_joined("id = $id_indicador");
		$smarty->assign('indicador', $indicador);

		$entidad = new entidad();
    $entidad->load("id = $indicador->id_entidad");
    $subunidades = $entidad->Find("id_madre = $indicador->id_entidad");
		$smarty->assign('entidad', $entidad);
		$smarty->assign('subunidades', $subunidades);

		$proceso = new proceso();
    $procesos = $proceso->Find("id_entidad = $indicador->id_entidad");
		$smarty->assign('procesos', $procesos);

    $criterio_efqm = new criterio_efqm();
    $criterios_efqm = $criterio_efqm->Find("1 = 1");
    $smarty->assign("criterios_efqm", $criterios_efqm);

    $visibilidad = new visibilidad;
    $visibilidades = $visibilidad->Find("1=1");
    $smarty->assign("visibilidades", $visibilidades);

    $tipo_agregacion = new tipo_agregacion();
    $tipos_agregacion = $tipo_agregacion->Find("true ORDER BY id");
    $smarty->assign("tipos_agregacion", $tipos_agregacion);


		$usuario_entidad = new usuario_entidad();
    $usuarios_entidades = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
		$smarty->assign('usuarios_entidades', $usuarios_entidades);

		$indicador_subunidad = new indicador_subunidad();
		$indicador_subunidades = $indicador_subunidad->Find_entidades("id_indicador = $id_indicador");
		$smarty->assign("indicador_subunidades", $indicador_subunidades);

		$smarty->assign('_nombre_pagina', "Editando indicador: " . $indicador->nombre); 
		$plantilla = 'indicador_editar.tpl';
	}
	else
	{
		// El usuario no tiene permisos avisamos error
		$error = 'No tiene permisos suficientes para editar indicadores de esta unidad';
		header("Location:index.php?page=indicador_mostrar&id_indicador=$id_indicador&error=$error");
	}
}
else
{
	// Faltan parametros avisamos error
	$error = 'Faltan parametros para editar un indicador';
	header("Location:index.php?error=$error");
}
?>
