<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: valor_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba en la base de dato el nuevo valor con los datos que vienen del formulario 
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

$id_medicion = sanitize($_REQUEST["id_medicion"], INT);
$contenedor = sanitize($_REQUEST["contenedor"], SQL);

$m = new medicion();
$m->load("id = $id_medicion");

$smarty->assign('medicion',$m);
$smarty->assign('contenedor',$contenedor);
$plantilla = 'medicion_editar_cancelar_asin.tpl';
?>
