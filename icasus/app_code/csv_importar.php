<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: csv_importar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Permite subir un fichero para importar datos a la aplicación
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;
global $usuario;
$usuario_entidad = new usuario_entidad();


if (isset($_REQUEST['id_entidad']))
{
  $id_entidad = sanitize($_REQUEST['id_entidad'], INT);
  if ($usuario_entidad->comprobar_responsable_entidad($usuario->id, $id_entidad))
  {
    $smarty->assign('id_entidad', $id_entidad);
    $plantilla = 'csv_importar.tpl';
    $smarty->assign('_nombre_pagina', 'Importar fichero CSV');
  }
  else
  {
    $error = 'No tiene autorización para importar datos en esta unidad';
    header('location:index.php?error=' . $error);
  }
}
else
{
  $error = 'Faltan parámetros para la importación';
  header('location:index.php?error=' . $error);
}
?>
