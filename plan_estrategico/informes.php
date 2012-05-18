<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: informes.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesús Martín (jjmc@us
//---------------------------------------------------------------------------------------------------
// Descripcion: Pagina muestra tipos de informes.
//---------------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $operario;
global $nombre_pagina;
global $plantilla;

$smarty-> assign('plan',true);
$id_entidad=sanitize($_GET['id_entidad'],2);
$smarty->assign('id_entidad',$id_entidad);

$plantilla='plan_estrategico/informes.tpl';



?>
