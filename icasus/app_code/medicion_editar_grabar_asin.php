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

$valor = sanitize($_POST["valor"],SQL);
$contenedor = sanitize($_POST["contenedor"],SQL);
$id_medicion = sanitize($_POST["id_medicion"],INT);

$m = new medicion();
	
$m->load("id = $id_medicion");

if ($contenedor == 'et')
{$m->etiqueta = $valor;}
elseif ($contenedor == 'pi')
{$m->periodo_inicio = $valor;}
elseif ($contenedor == 'pf')
{$m->periodo_fin = $valor;}
elseif ($contenedor == 'gi')
{$m->grabacion_inicio = $valor;}
elseif ($contenedor == 'gf')
{$m->grabacion_fin = $valor;}
$m->save();
?>
