<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_mostrar.php
//---------------------------------------------------------------------------------------------------
// Muestra todos los parametros de un dato y un listado de los valores introducidos
// Es casi igual que el indicador pero con algunos campos menos (misma tabla de la base de datos)
// Se diferencia del indicador en que pertenece a una unidad pero no a un proceso
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (isset($_REQUEST['id_dato']))
{
	$id_dato = sanitize($_REQUEST['id_dato'],16); 
	$dato = new indicador();
 	if ($dato->load_joined("id = $id_dato"))
  {
    $smarty->assign('dato', $dato);
  }
  else
  {
    $error = "No se puede mostrar el dato, el identificador no existe en la base de datos.";
    header("location:index.php?error=$error");
  }
	$entidad = new entidad();
 	$entidad->load("id = $dato->id_entidad");
	$smarty->assign('entidad', $entidad);

  //Subunidades asignadas a la medicion de este dato
  $dato_subunidad = new indicador_subunidad();
  $dato_subunidades = $dato_subunidad->Find_entidades("id_indicador = $id_dato");
  $smarty->assign("dato_subunidades", $dato_subunidades);

  //Simplemente ver si hay mediciones
  $medicion = new medicion();
  $mediciones = $medicion->Find("id_indicador = $id_dato");
  $smarty->assign("mediciones", $mediciones);
  
	$smarty->assign('_nombre_pagina', "Ficha del dato: " . $dato->nombre); 
	$plantilla = 'dato_mostrar.tpl';
}
else
{
	$error = "No se puede mostrar el dato por falta de parámetros.";
	header("location:index.php?error=$error");
}
?>
