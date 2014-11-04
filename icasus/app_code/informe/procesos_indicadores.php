<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: informe/procesos_indicadores.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: lista de procesos propios y procesos de la unidad madre
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (isset($_REQUEST['id_entidad']))
{ 
  $id_entidad = sanitize($_REQUEST['id_entidad'], INT);
  $entidad = new Entidad();
  $entidad->load_joined("id = $id_entidad");
  $proceso = new Proceso();
  $procesos_madre = $proceso->find_joined_indicadores("id_entidad = $entidad->id_madre");
  $procesos_propios = $proceso->find_joined_indicadores("id_entidad = $id_entidad");
  $smarty->assign("entidad", $entidad);
  $smarty->assign("procesos_madre", $procesos_madre);
  $smarty->assign("procesos_propios", $procesos_propios);
  $plantilla = 'informe/procesos_indicadores.tpl';
  $smarty->assign('_nombre_pagina' , "Lista de procesos e indicadores");
}
else
{
  header("location: index.php");
}
?>
