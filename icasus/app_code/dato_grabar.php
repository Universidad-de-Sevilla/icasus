<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba un nuevo dato o actualiza uno existente
//---------------------------------------------------------------------------------------------------
global $usuario;

if (isset($_REQUEST["codigo"]) AND isset($_REQUEST["nombre"]) AND isset($_REQUEST["id_responsable"]) AND isset($_REQUEST["id_entidad"]))
{
  $dato = new indicador();
  if (isset($_REQUEST["id_dato"]))
  {
    $id_dato = sanitize($_REQUEST["id_dato"], INT);
    $dato->load("id = $id_dato");         
    $aviso = "Se han actualizado los datos del dato";
  }
  else
  {
    $aviso = "Se ha creado un nuevo dato";
  }
  // Campos obligatorios
  $dato->id_responsable = sanitize($_REQUEST['id_responsable'],INT);
  $dato->id_entidad = sanitize($_REQUEST['id_entidad'],INT);
  $dato->codigo = sanitize($_REQUEST['codigo'],SQL);
  $dato->nombre = sanitize($_REQUEST['nombre'],SQL);
  // Campos opcionales 
  $dato->id_visibilidad = sanitize($_REQUEST['id_visibilidad'],SQL);
  $dato->descripcion = isset($_REQUEST['descripcion'])?sanitize($_REQUEST['descripcion'],SQL):null;    
  $dato->periodicidad = isset($_REQUEST['periodicidad'])?sanitize($_REQUEST['periodicidad'],SQL):null;    
  $dato->fuente_informacion = isset($_REQUEST['fuente_informacion'])?sanitize($_REQUEST['fuente_informacion'],SQL):null;    
  $dato->nivel_desagregacion = isset($_REQUEST['nivel_desagregacion'])?sanitize($_REQUEST['nivel_desagregacion'],SQL):null;
  $dato->fuente_datos = isset($_REQUEST['fuente_datos'])?sanitize($_REQUEST['fuente_datos'],SQL):null;   
  $dato->unidad_generadora = isset($_REQUEST['unidad_generadora'])?sanitize($_REQUEST['unidad_generadora'],SQL):null;
  $dato->indicadores_relacionados = isset($_REQUEST['indicadores_relacionados'])?sanitize($_REQUEST['indicadores_relacionados'],SQL):null;    
  $dato->activo = 1;
  $dato->fecha_creacion = date("Y-m-d");

  if ($dato->save())
  {
    header("Location: index.php?page=dato_mostrar&id_dato=$dato->id&id_entidad=$id_entidad&aviso=$aviso");
  }
  else
  {
    $error = "No se ha podido grabar el dato.";
    header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
  }
}
else
{
	// Avisamos de error por falta de parametros
	$error = 'Faltan parámetros necesarios para grabar el dato';
  header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
}
?>
