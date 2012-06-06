<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: proceso_grabar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba un nuevo proceso en la base de datos comprobando que el código no se 
// encuentre repetido
//---------------------------------------------------------------------------------------------------

// Si vienen todos los datos necesarios del formulario grabamos     
if (isset($_POST['id_entidad']) && isset($_POST['alcance']) && isset($_POST['nombre']) && isset($_POST['codigo']) && isset($_POST['id_propietario']) && isset($_POST['madre']) )
{
  $id_entidad = sanitize($_POST['id_entidad'],2);
  $alcance = sanitize($_POST['alcance'],2);
  $nombre = sanitize($_POST['nombre'],2);
  $codigo = sanitize($_POST['codigo'],2);
  $id_propietario = sanitize($_POST['id_propietario'],2);    
  $madre = sanitize($_POST['madre'],2);

  $proceso = new proceso(); 
  $proceso->id_entidad = $id_entidad;
  $proceso->alcance = $alcance;   
  $proceso->nombre = $nombre;
  $proceso->codigo = $codigo;
  $proceso->id_propietario = $id_propietario;                 
  $proceso->id_madre = $madre;

  /*
  // PORHACER
  $lista = $proceso->Find("codigo = $codigo");
  print_r($lista);
  if ($proceso->Find("codigo = $codigo"))
  {
    $error = "El código de proceso </b>$codigo</b> ya existe en el sistema";
    header("Location:index.php?page=proceso&error=$error");
  }
  */

  if ($proceso->save())
  {
    $aviso = 'Se ha grabado un nuevo proceso para esta entidad.';
    header("Location:index.php?page=proceso_listar&id_entidad=$id_entidad&aviso=$aviso");
  }
  else
  {
    $error = $proceso->error;
    header("Location:index.php?page=proceso_listar&id_entidad=$id_entidad&aviso=$error");
  }
}
// Si no vienen datos mostramos el formulario
else
{
  $error = 'Faltan datos para crear el proceso';
  header("Location:index.php?page=proceso_listar&id_entidad=$id_entidad&aviso=$error");
}
?>

