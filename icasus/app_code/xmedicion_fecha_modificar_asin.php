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

$m = new medicion();
$id= sanitize($_POST["id2"],2);
$m->load("id = $id");
$periodo = sanitize($_POST["fecha"],2);
$etiqueta = sanitize($_POST["etiqueta"],2);

switch ($etiqueta)
{
	case 'pi':	$m->periodo_inicio = $periodo;break;
	case 'pf':	$m->periodo_fin = $periodo;break;
	case 'gi':	$m->grabacion_inicio = $periodo;break;
	case 'gf':	$m->grabacion_fin = $periodo;break;
}
$m->save();
?>
