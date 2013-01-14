<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_editar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Formulario para modificar los datos (los datos son indicadores recortados)
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

// Comprobamos que vengan los datos mínimos necesarios
if (isset($_REQUEST['id_dato']) && isset($_REQUEST['id_entidad'])) 
{
	$id_dato = sanitize($_REQUEST['id_dato'],16);
	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
	$usuario_entidad = new usuario_entidad;
	// Comprobamos permisos 
	if ($usuario_entidad->load("id_usuario=$usuario->id and id_entidad=$id_entidad and (id_rol=1 or id_rol=2)"))
	{	
		$dato = new indicador();
    $dato->load_joined("id = $id_dato");
		$smarty->assign('dato', $dato);

		$entidad = new entidad();
    $entidad->load("id = $dato->id_entidad");
		$smarty->assign('entidad', $entidad);

    $subunidades = $entidad->Find("id_madre = $dato->id_entidad");
		$smarty->assign('subunidades', $subunidades);

    $visibilidad = new visibilidad;
    $visibilidades = $visibilidad->Find("1=1");
    $smarty->assign("visibilidades", $visibilidades);

		$usuario_entidad = new usuario_entidad();
    $usuarios_entidades = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
		$smarty->assign('usuarios_entidades', $usuarios_entidades);

		$indicador_subunidad = new indicador_subunidad();
		$indicador_subunidades = $indicador_subunidad->Find_entidades("id_indicador = $id_dato");
		$smarty->assign("indicador_subunidades", $indicador_subunidades);

		$smarty->assign('_nombre_pagina', "Editando dato: " . $dato->nombre); 
		$plantilla = 'dato_editar.tpl';
	}
	else
	{
		// El usuario no tiene permisos avisamos error
		$error = 'No tiene permisos suficientes para editar datoes de esta unidad';
		header("Location:index.php?page=dato_mostrar&id_dato=$id_dato&error=$error");
	}
}
else
{
	// Faltan parametros avisamos error
	$error = 'Faltan parametros para editar el dato';
	header("Location:index.php?error=$error");
}
?>
