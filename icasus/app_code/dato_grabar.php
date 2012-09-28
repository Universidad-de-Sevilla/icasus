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
    $es_dato_nuevo = false;
    // Preparamos el aviso para lanzarlo al final
    $aviso = "Se ha actualizado el dato";
  }
  else
  {
    $es_dato_nuevo = true;
    $aviso = "Se ha creado un nuevo dato";
  }
  // Campos obligatorios
  $dato->id_entidad = sanitize($_REQUEST['id_entidad'],INT);
  $dato->codigo = sanitize($_REQUEST['codigo'],SQL);
  $dato->nombre = sanitize($_REQUEST['nombre'],SQL);
  $dato->id_responsable = sanitize($_REQUEST["id_responsable"],INT);
  // Campos opcionales 
  $tipo_seleccion_responsable = isset($_REQUEST["tipo_seleccion_responsable"])?sanitize($_REQUEST['tipo_seleccion_responsable'],INT):NULL;
  $dato->id_visibilidad = isset($_REQUEST['id_visibilidad'])?sanitize($_REQUEST['id_visibilidad'],SQL):NULL;
  $dato->descripcion = isset($_REQUEST['descripcion'])?sanitize($_REQUEST['descripcion'],SQL):null;    
  $dato->periodicidad = isset($_REQUEST['periodicidad'])?sanitize($_REQUEST['periodicidad'],SQL):null;    
  $dato->nivel_desagregacion = isset($_REQUEST['nivel_desagregacion'])?sanitize($_REQUEST['nivel_desagregacion'],SQL):null;
  $dato->fuente_datos = isset($_REQUEST['fuente_datos'])?sanitize($_REQUEST['fuente_datos'],SQL):null;   
  $dato->unidad_generadora = isset($_REQUEST['unidad_generadora'])?sanitize($_REQUEST['unidad_generadora'],SQL):null;
  $dato->indicadores_relacionados = isset($_REQUEST['indicadores_relacionados'])?sanitize($_REQUEST['indicadores_relacionados'],SQL):null;    
  $dato->activo = 1;
  $dato->fecha_creacion = date("Y-m-d");
  
  // Una vez grabado el dato vamos a asignar a los responsables de medicion
  // Esto sólo se hace si se trata de un nuevo dato
  if ($dato->save())
  {
    if ($es_dato_nuevo == true)
    {
      $subunidades = $_REQUEST["subunidades"];
      if (count($subunidades) > 0)
      {
        foreach ($subunidades as $subunidad)
        {
          $indicador_subunidad = new indicador_subunidad();
          $indicador_subunidad->id_indicador = $dato->id;
          $indicador_subunidad->id_entidad = $subunidad;

          // Comprueba si la medición va a ser centralizada o asignada a cada responsable de subunidad
          // si es para cada responsable de subunidad, se le asigna como responsable de la medición
          // el reponsable de la unidad. Si no exite este se le asigna como resposable de medición
          // el responsable de medicion de la unidad superior.
          if ($tipo_seleccion_responsable == 0)
          {
            $indicador_subunidad->id_usuario = $dato->id_responsable;
          }
          else
          {
            $usuario_entidad = new usuario_entidad();
            if ($usuario_entidad->load("id_entidad = $subunidad AND id_rol = 1"))
            {
              $indicador_subunidad->id_usuario = $usuario_entidad->id_usuario;
            }
            else
            {
              $indicador_subunidad->id_usuario = $dato->id_responsable;
            }
          }
          $indicador_subunidad->save();
        }
      }
    }
    // Si ha ido bien mostramos la ficha del dato absoluto
    header("Location: index.php?page=dato_mostrar&id_dato=$dato->id&id_entidad=$id_entidad&aviso=$aviso");
  }
  else
  {
    // Error de grabación en la base de datos
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
