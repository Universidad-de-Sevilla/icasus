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

if (isset($_REQUEST["id_indicador"]) AND isset($_REQUEST["periodo_inicio"]) AND isset($_REQUEST["periodo_fin"]))
{
  $medicion = new medicion();
  $medicion->id_indicador = sanitize($_REQUEST["id_indicador"], INT);
  $medicion->periodo_inicio = sanitize($_REQUEST["periodo_inicio"], SQL);
  $medicion->periodo_fin = sanitize($_REQUEST["periodo_fin"], SQL);
  $medicion->etiqueta = empty($_REQUEST["etiqueta"]) ? null : sanitize($_REQUEST["etiqueta"],SQL);

  if ($medicion->save())
  {
    $aviso = "Se ha agregado correctamente una nueva medición con X unidades afectadas";
    header("location:index.php?page=medicion_listar&id_indicador=$medicion->id_indicador&aviso=$aviso");
  }
  else
  {
    $error = "Ha ocurrido un error al grabar la medición, inténtelo de nuevo o contacte con los administradores de Icasus";
    header("location:index.php?page=medicion_listar&id_indicador=$medicion->id_indicador&error=$error");
  }
}
else
{
  $error = "Faltan datos para procesar la petición de creación de medición.";
  header("location:index.php?page=entidad_listar&error=$error");
}
?>
