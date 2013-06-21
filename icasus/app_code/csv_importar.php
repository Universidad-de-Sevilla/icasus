<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: csv_importar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Permite subir un fichero para importar datos a la aplicación
//---------------------------------------------------------------------------------------------------
global $smarty;

if (isset($_REQUEST['id_entidad']))
{
  $id_entidad = sanitize($_REQUEST['id_entidad'], INT);
  $smarty->assign('id_entidad', $id_entidad);
  $plantilla = 'csv_importar.tpl';
  $smarty->assign('_nombre_pagina', 'Importar fichero CSV');
}
else
{
  $error = 'Faltan parámetros para la importación';
  header('location:index.php?error=' . $error);
}
?>
