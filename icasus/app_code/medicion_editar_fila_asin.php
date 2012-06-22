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
$id_valor = sanitize($_REQUEST["id_valor"], INT);
$smarty->assign("valor_edit",$id_valor);

$medicion = new medicion();
$medicion->load("id = $id_medicion");
$smarty->assign("medicion",$medicion);

$indicador = new indicador();
$indicador->load("id = $medicion->id_indicador");
$smarty->assign("indicador",$indicador);

$valor = new valor();
$valores = $valor->Find_joined_jjmc($id_medicion,$usuario->id);
$smarty->assign("valores",$valores);

$indisub = new indicador_subunidad();
$indisubs = $indisub->find("id_usuario = $usuario->id AND id_indicador = $indicador->id");
$smarty->assign('indisubs',$indisubs);
/*
$id_valor = sanitize($_REQUEST["id_valor"], INT);
$smarty->assign("valor_edit",$id_valor);

$valor = new valor();
$valores = $valor->Find_joined("id_medicion = $id_medicion");
$smarty->assign("valores",$valores);

$smarty->assign("medicion_edit",$id_medicion);
*/
$plantilla = 'medicion_editar_fila_asin.tpl';
?>
