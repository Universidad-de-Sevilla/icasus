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
    $proceso->id_madre = isset($_POST['madre'])?sanitize($_POST['madre'],2):0;   
    $proceso->codigo = isset($_POST['codigo'])?sanitize($_POST['codigo'],2):null;
    $proceso->revision = isset($_POST['revision'])?sanitize($_POST['revision'],2):null;
    $fecha = isset($_POST['fecha_revision'])?sanitize($_POST['fecha_revision'],SQL):null;
    $fecha = explode("/",$fecha);
    $fecha = $fecha[2]."/".$fecha[1]."/".$fecha[0];
    $proceso->fecha_revision = $fecha;  
    $proceso->nombre = isset($_POST['nombre'])?sanitize($_POST['nombre'],2):null;    
    $proceso->alcance = isset($_POST['alcance'])?sanitize($_POST['alcance'],2):null; 
    $proceso->mision = isset($_POST['mision'])?sanitize($_POST['mision'],2):null;    
    $proceso->equipo_de_proceso = isset($_POST['equipo_de_proceso'])?sanitize($_POST['equipo_de_proceso'],2):null;    
    $proceso->resultados_clave = isset($_POST['resultados_clave'])?sanitize($_POST['resultados_clave'],2):null;
    $proceso->entradas = isset($_POST['entradas'])?sanitize($_POST['entradas'],2):null;   
    $proceso->proveedores = isset($_POST['proveedores'])?sanitize($_POST['proveedores'],2):null;    
    $proceso->salidas = isset($_POST['salidas'])?sanitize($_POST['salidas'],2):null;    
    $proceso->clientes = isset($_POST['clientes'])?sanitize($_POST['clientes'],2):null;
    $proceso->actividades = isset($_POST['actividades'])?sanitize($_POST['actividades'],2):null;   
    $proceso->documentacion = isset($_POST['documentacion'])?sanitize($_POST['documentacion'],2):null;    
    $proceso->mediciones = isset($_POST['mediciones'])?sanitize($_POST['mediciones'],2):null;    
    $proceso->registros = isset($_POST['registros'])?sanitize($_POST['registros'],2):null;  
    $proceso->id_propietario = isset($_POST['id_propietario'])?sanitize($_POST['id_propietario'],2):null;
    
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
    $procesos_madre = $proceso_madre->Find("id_entidad = $id_entidad AND id <> $id_proceso");
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

