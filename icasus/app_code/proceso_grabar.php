<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: proceso_grabar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba un nuevo proceso en la base de datos comprobando que el código no se 
// encuentre repetido
//---------------------------------------------------------------------------------------------------

// Si vienen todos los datos necesarios del formulario grabamos     
if (isset($_POST['alcance']) && isset($_POST['nombre']) && isset($_POST['codigo']) && isset($_POST['id_propietario']) && isset($_POST['madre']) )
{
  $proceso = new proceso();        
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
  $proceso->id_entidad = isset($_POST['id_entidad'])?sanitize($_POST['id_entidad'],2):null;

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

