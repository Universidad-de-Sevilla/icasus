<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadromando_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Prepara los datos para mostrar el formulario que permite crear un nuevo cuadro de mando
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

$entidad = new usuario_entidad();
$entidades = $entidad->Find_entidades_indicadores($usuario->id);

$smarty->assign('entidades' , $entidades);

//print_r($entidades);

$smarty->assign('_nombre_pagina' , "Nuevo cuadro de mando");
$plantilla = 'cuadromando_crear.tpl';

/*
$entidad = new ado_usuario_entidad();
$entidades = $entidad->carga_entidades_indicadores('id_usuario = '.$operario->id_usuario.' AND id_entidad < 221');

$smarty->assign('entidades',$entidades);
	
$smarty->assign('_nombre_pagina' , "Nuevo cuadro de mando");
$plantilla = 'cuadromando_crear.tpl';
*/
?>

