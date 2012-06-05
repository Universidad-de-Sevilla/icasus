<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: proceso_editar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Modifica procesos existentes
//--------------------------------------------------------------------------------------------------- 

global $smarty;                   
global $plantilla;                

// Para empezar a hablar necesitamos el id del proceso              
if (isset($_REQUEST['id_proceso']) && isset($_REQUEST['id_entidad']))
{
  $id_proceso = sanitize($_REQUEST['id_proceso'],16);         
  $id_entidad = sanitize($_REQUEST['id_entidad'],16);         
  $entidad = new entidad();
  $entidad->load("id = $id_entidad");      
  $smarty->assign('_nombre_pagina',$entidad->nombre);

  // Si vienen todos los datos necesarios del formulario grabamos
  if (isset($_POST['nombre']) && isset($_POST['codigo']))     
  {
    $proceso = new proceso();
    $proceso->load("id = $id_proceso");         
    $proceso->id_madre = sanitize($_POST['madre'],2);   
    $proceso->codigo = sanitize($_POST['codigo'],2);    
    $proceso->nombre = sanitize($_POST['nombre'],2);    
    $proceso->alcance = sanitize($_POST['alcance'],2);        
    $proceso->id_propietario = isset($_POST['id_propietario'])?sanitize($_POST['id_propietario'],16):null;
    
    if ($proceso->save())
    {
      header("Location: index.php?page=proceso_listar&id_entidad=$id_entidad");
    }
    else
    {
      $smarty->assign('error', $proceso->error); 
      $smarty->assign('_nombre_pagina','Error');
      $plantilla = 'error.tpl';
    }
  }
  // Si no vienen datos mostramos el formulario
  else
  {
    $proceso = new proceso();
    $proceso->load_joined("id = $id_proceso");
    $smarty->assign('proceso', $proceso);
    
    $usuario_entidad = new usuario_entidad();
    $usuarios_entidad = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
    $smarty->assign('usuarios_entidad', $usuarios_entidad);
    
    $proceso_madre = new proceso();
    $procesos_madre = $proceso_madre->Find("id_entidad = $id_entidad");
    $smarty->assign('procesos_madre', $procesos_madre);
    $plantilla = "proceso_editar.tpl";
  }
}
else
{
  $error = 'Faltan parametros para editar un proceso';
  header("location:index.php?page=error&error=$error");
}
?>

