<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadromando_listar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los cuadros de mando definidos por este usuario
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
	header('Location:index.php?page=cuadromando_listar');	
}

$cuadromando = new cuadromando();
//$cuadromandos = $cuadromando->listar_cuadromandos_contar_indicadores("id_usuario = ".$usuario->id);
$cuadromandos = $cuadromando->find_joined($usuario->id);
print_r($cuadromandos);
$smarty->assign('cuadromandos',$cuadromandos);

$plantilla = 'cuadromando_listar.tpl';
$smarty->assign('_nombre_pagina' , 'Cuadros de Mando');
?>
