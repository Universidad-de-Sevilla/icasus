<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://forja.rediris.es/projects/icasus/)
// Archivo: grupo_convocar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Convocar a los grupos de trabajo
//---------------------------------------------------------------------------------------------------

require_once('function/sanitize.php');
global $smarty;
global $plantilla;
global $operario;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
        header('Location:index.php');
}

/*$grupo = new ado_entidad();
$grupos = $grupo ->actas_grupo('221'); 
//print_r($grupos);

$smarty->assign('grupos_operario',$grupos);
*/
$smarty->assign('_nombre_pagina','Crear Equipo de Trabajo');
$plantilla = "grupo/grupo_convocar.tpl";

?>
