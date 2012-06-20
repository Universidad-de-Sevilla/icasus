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

$valor = new valor();
$valores = $valor->Find_joined("id_medicion = $id_medicion");
$smarty->assign("valores",$valores);

$smarty->assign("medicion_edit",$id_medicion);
$plantilla = 'medicion_editar_fila_cancelar_asin.tpl';
?>
