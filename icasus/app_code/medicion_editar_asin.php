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
$campo = sanitize($_REQUEST["contenedor"], SQL);

$medicion = new medicion();
$medicion->load("id = $id_medicion");
$smarty->assign("medicion",$medicion);

if ($campo == 'pi' OR $campo == 'pf' OR $campo == 'gi' OR $campo == 'gf')
{
	$plantilla = 'medicion_editar_fecha_asin.tpl';
}
else 
{
	$plantilla = 'medicion_editar_etiqueta_asin.tpl';
}
?>
