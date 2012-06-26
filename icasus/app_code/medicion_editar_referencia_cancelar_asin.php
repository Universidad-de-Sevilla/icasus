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

$id_referencia = sanitize($_REQUEST["id"], INT);

  $valor_referencia_medicion = new valor_referencia_medicion();
  $valor_referencia_medicion->load("id = $id_referencia");
  $smarty->assign("valor_referencia_medicion", $valor_referencia_medicion);

$smarty->assign("usuario", $usuario);

$plantilla = 'medicion_editar_referencia_cancelar_asin.tpl';
?>
