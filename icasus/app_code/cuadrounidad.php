<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadrounidad.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los indicadores de la unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
	header('Location:index.php?page=cuadromando_listar');	
}
if (isset($_GET["id_entidad"]) AND $_GET["id_entidad"] >0)
{
	$id_unidad = sanitize($_GET["id_entidad"],2);
	$proceso = new proceso();
	
	//obtiene los procesos de la unidad y sus indicadores
	$procesos_propios = $proceso->find("id_entidad = $id_unidad");
	$smarty->assign('procesos_propios',$procesos_propios);
	
	//si la unidad mide indicadores de otras unidades, busca los procesos de estos indicadores
	$procesos_indicadores_segregados = $proceso->procesos_indicadores_segregados($id_unidad);
	$smarty->assign('procesos_indicadores_segregados',$procesos_indicadores_segregados);
	//obtiene los procesos de la unidad superior y sus indicadores
	$procesos_indicadores_superior = $proceso->proceso_indicador_superior($id_unidad);
	$smarty->assign('procesos_indicadores_superior',$procesos_indicadores_superior);

	//obtiene entidad superior.
	$entidad = new entidad();
	$entidad->load("id = $id_unidad");
	$entidad_madre = new entidad();
	$entidad_madre->load("id = $entidad->id_madre");
	$smarty->assign('entidad_superior',$entidad_madre);
	$smarty->assign('procesos_indicadores_superior',$procesos_indicadores_superior);
	
	$plantilla = 'cuadrounidad.tpl';
	$smarty->assign('_nombre_pagina' , "Cuadro resumen: $entidad->nombre");

}
else
{
  $error = "No ha especificado la entidad.";
  header("location:index.php?page=error&error=$error");
}
?>

