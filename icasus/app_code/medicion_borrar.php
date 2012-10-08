<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_borrar.php
//---------------------------------------------------------------------------------------------------
// Borra la medición, los valores y los valores de referencia asociados a ella
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

if (isset($_REQUEST["id_medicion"]) AND isset($_REQUEST["tipo"]) AND isset($_REQUEST["id_entidad"]))
{
  $id_medicion = sanitize($_REQUEST["id_medicion"], INT);
  $id_entidad = sanitize($_REQUEST["id_entidad"], INT);
  $tipo = sanitize($_REQUEST["tipo"], SQL);

  $medicion = new medicion();
  $medicion->load("id = $id_medicion");
  $adodb = $medicion->db();
    
  // Consulta para borrar los valores
  

  // Consulta para borrar los registros relacionados de la tabla valor_referencia_medicion
  

  // Comenzamos una transacción de manera que se borre todo o nada

  header("location:index.php?page=medicion_listar&id_{$tipo}=$id_indicador&id_entidad=$id_entidad");
}
else
{
  $error = "Faltan parámetros para borrar la medición";
  header("location:index.php?error=$error");
}
?>

