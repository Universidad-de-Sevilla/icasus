<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba una nueva medición de un indicador o actualiza una existente
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

if (isset($_REQUEST["id_indicador"]))
{
  $id_indicador = sanitize($_REQUEST["id_indicador"], INT);


  header("location:index.php?page=medicion_listar");
}
else
{
  $error = "Faltan datos para procesar la petición de creación de medición";
  header("location:index.php?page=medicion_crear");
}
?>
