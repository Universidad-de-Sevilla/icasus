<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: indicador_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba los datos de un indicador nuevo o existente
//---------------------------------------------------------------------------------------------------
global $usuario;
if (isset($_REQUEST["codigo"]) AND isset($_REQUEST["nombre"]) AND isset($_REQUEST["id_responsable"]) AND isset($_REQUEST["formulacion"]) AND isset($_REQUEST["subunidades"]) AND isset($_REQUEST["id_proceso"]) AND isset($_REQUEST["id_entidad"]))
{
  $indicador = new indicador();
  if (isset($_REQUEST["id_indicador"]))
  {
    $id_indicador = sanitize($_REQUEST["id_indicador"], INT);
    $indicador->load("id = $id_indicador");         
    $aviso = "Se han actualizado los datos del indicador";
  }
  else
  {
    $aviso = "Se ha creado un nuevo indicador";
  }
  // Campos obligatorios
  $indicador->id_proceso = sanitize($_REQUEST['id_proceso'],INT);
  $indicador->id_responsable = sanitize($_REQUEST['id_responsable'],INT);
  $indicador->id_entidad = sanitize($_REQUEST['id_entidad'],INT);
  $indicador->codigo = sanitize($_REQUEST['codigo'],SQL);
  $indicador->nombre = sanitize($_REQUEST['nombre'],SQL);
  $indicador->formulacion = sanitize($_REQUEST['formulacion'],SQL); 
  $indicador->id_visibilidad = sanitize($_REQUEST['id_visibilidad'],SQL);
  // Campos opcionales 
  $indicador->descripcion = isset($_REQUEST['descripcion'])?sanitize($_REQUEST['descripcion'],SQL):null;    
  $indicador->periodicidad = isset($_REQUEST['periodicidad'])?sanitize($_REQUEST['periodicidad'],SQL):null;    
  $indicador->fuente_informacion = isset($_REQUEST['fuente_informacion'])?sanitize($_REQUEST['fuente_informacion'],SQL):null;    
  $indicador->nivel_desagregacion = isset($_REQUEST['nivel_desagregacion'])?sanitize($_REQUEST['nivel_desagregacion'],SQL):null;
  $indicador->fuente_datos = isset($_REQUEST['fuente_datos'])?sanitize($_REQUEST['fuente_datos'],SQL):null;   
  $indicador->evidencia = isset($_REQUEST['evidencia'])?sanitize($_REQUEST['evidencia'],SQL):null;    
  $indicador->historicos = isset($_REQUEST['historicos'])?sanitize($_REQUEST['historicos'],SQL):null;    
  $indicador->unidad_generadora = isset($_REQUEST['unidad_generadora'])?sanitize($_REQUEST['unidad_generadora'],SQL):null;
  $indicador->interpretacion = isset($_REQUEST['interpretacion'])?sanitize($_REQUEST['interpretacion'],SQL):null;
  $indicador->indicadores_relacionados = isset($_REQUEST['indicadores_relacionados'])?sanitize($_REQUEST['indicadores_relacionados'],SQL):null;    
  $indicador->valor_referencia = isset($_REQUEST['valor_referencia'])?sanitize($_REQUEST['valor_referencia'],SQL):null;
  $indicador->activo = 1;
  $indicador->fecha_creacion = date("Y-m-d");
  if ($indicador->save())
  {
    $subunidades = $_REQUEST["subunidades"];
    // Si el indicador es nuevo grabamos subunidades
    if (! isset($id_indicador))
    {
      if (count($subunidades) > 0)
      {
        foreach ($subunidades as $subunidad)
        {
          $indicador_subunidad = new indicador_subunidad();
          $indicador_subunidad->id_indicador = $indicador->id;
          $indicador_subunidad->id_entidad = $subunidad;
          $indicador_subunidad->id_usuario = $usuario->id;
          $indicador_subunidad->save();
        }
      }
    }
    else
    {
      // Si el indicador ya existía hay que currarselo de otra forma
    }

    header("Location: index.php?page=indicador_mostrar&id_indicador=$id_indicador&id_entidad=$id_entidad&aviso=$aviso");
  }
  else
  {
    $error = "No se ha podido grabar el indicador.";
    header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
  }
}
else
{
	// Avisamos de error por falta de parametros
	$error = 'Faltan parámetros necesarios para grabar el indicador';
  header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
}
?>
