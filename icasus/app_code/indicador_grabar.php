<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: indicador_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba los datos de un indicador nuevo o existente
//---------------------------------------------------------------------------------------------------
global $usuario;
if (
	!empty($_REQUEST["codigo"]) 
	AND !empty($_REQUEST["nombre"]) 
	AND !empty($_REQUEST["id_responsable"])  
	AND !empty($_REQUEST["id_responsable_medicion"]) 
	AND !empty($_REQUEST["formulacion"]) 
	AND !empty($_REQUEST["id_proceso"]) 
	AND !empty($_REQUEST["id_entidad"]) 
	AND isset($_REQUEST["tipo_seleccion_responsable"])
) 
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
    $indicador->activo = 1;
  }
  // Campos obligatorios
  $indicador->id_proceso = sanitize($_REQUEST['id_proceso'],INT);
  $indicador->id_responsable = sanitize($_REQUEST['id_responsable'],INT);
  $indicador->id_responsable_medicion = sanitize($_REQUEST['id_responsable_medicion'],INT);
  $indicador->id_entidad = sanitize($_REQUEST['id_entidad'],INT);
  $indicador->codigo = sanitize($_REQUEST['codigo'],SQL);
  $indicador->nombre = sanitize($_REQUEST['nombre'],SQL);
  $indicador->formulacion = sanitize($_REQUEST['formulacion'],SQL); 
  $indicador->id_visibilidad = sanitize($_REQUEST['id_visibilidad'],SQL);
  $tipo_seleccion_responsable = $_REQUEST["tipo_seleccion_responsable"];
  // Campos opcionales 
  $indicador->descripcion = isset($_REQUEST['descripcion'])?sanitize($_REQUEST['descripcion'],SQL):null;    
  $indicador->periodicidad = isset($_REQUEST['periodicidad'])?sanitize($_REQUEST['periodicidad'],SQL):null;    
  $indicador->calculo = isset($_REQUEST['calculo'])?sanitize($_REQUEST['calculo'],SQL):null;    
  $indicador->fuente_informacion = isset($_REQUEST['fuente_informacion'])?sanitize($_REQUEST['fuente_informacion'],SQL):null;    
  $indicador->nivel_desagregacion = isset($_REQUEST['nivel_desagregacion'])?sanitize($_REQUEST['nivel_desagregacion'],SQL):null;
  $indicador->id_tipo_agregacion = isset($_REQUEST['id_tipo_agregacion'])?sanitize($_REQUEST['id_tipo_agregacion'], INT):0;
  $indicador->fuente_datos = isset($_REQUEST['fuente_datos'])?sanitize($_REQUEST['fuente_datos'],SQL):null;   
  $indicador->desagregado = isset($_REQUEST['tipo_seleccion_responsable'])?sanitize($_REQUEST['tipo_seleccion_responsable'],SQL):null;   
  $indicador->evidencia = isset($_REQUEST['evidencia'])?sanitize($_REQUEST['evidencia'],SQL):null;    
  $indicador->historicos = isset($_REQUEST['historicos'])?sanitize($_REQUEST['historicos'],SQL):null;    
  $indicador->unidad_generadora = isset($_REQUEST['unidad_generadora'])?sanitize($_REQUEST['unidad_generadora'],SQL):null;
  $indicador->interpretacion = isset($_REQUEST['interpretacion'])?sanitize($_REQUEST['interpretacion'],SQL):null;
  $indicador->indicadores_relacionados = isset($_REQUEST['indicadores_relacionados'])?sanitize($_REQUEST['indicadores_relacionados'],SQL):null;    

  $indicador->fecha_creacion = date("Y-m-d");
  if ($indicador->save())
  {
    // Si el indicador es nuevo grabamos subunidades
    if (!isset($id_indicador))
    {
      $subunidades = isset($_REQUEST["subunidades"])?$_REQUEST["subunidades"]:array();
      if (count($subunidades) > 0)
      {
        foreach ($subunidades as $subunidad)
        {
          $indicador_subunidad = new indicador_subunidad();
          $indicador_subunidad->id_indicador = $indicador->id;
					$indicador_subunidad->id_entidad = $subunidad;
					//comprueba si la medición va a ser centralizada o para cada responsable de subunidad
					//si es para cada responsable de subunidad, se le asigna como responsable de la medición
					//el reponsable de la unidad. Si no exite este se le asigna como resposable de medición
					//el responsable de medicion de la unidad superior.
          switch ($tipo_seleccion_responsable)
					{
						case 0:
							$indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
						break;
						case 1:
							$usuario_entidad = new usuario_entidad();
							// Cargamos al responsable de la unidad para echarle el muerto 
							// Luego el podrá echárselo a otro
							if ($usuario_entidad->load("id_entidad = $subunidad AND id_rol = 1"))
							{
								$indicador_subunidad->id_usuario = $usuario_entidad->id_usuario;
							}
							else
							{
								$indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
							}
						break;
						case 2:
							$indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
						break;
						default:
							$indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
					}
          $indicador_subunidad->save();
        }
      }
      if (isset($_REQUEST["criterios_efqm"]))
      {
        // Grabamos los criterios EFQM en los que este indicador influye (pueden ser uno o dos)
        foreach ($_REQUEST["criterios_efqm"] as $id_criterio_efqm)
        {
          $criterio_efqm_indicador = new criterio_efqm_indicador();
          $criterio_efqm_indicador->id_indicador = $indicador->id;
          $criterio_efqm_indicador->id_criterio_efqm = $id_criterio_efqm;
          $criterio_efqm_indicador->save();
        }
      }
    }
    else
    {
      // Si el indicador ya existía hay que currarselo de otra forma
      //Primero borramos los existentes ¿no habrá otra forma más elegante?
      $criterio_efqm_indicador = new criterio_efqm_indicador();
      while ($criterio_efqm_indicador->load("id_indicador = $indicador->id"))
      {
        $criterio_efqm_indicador->delete();
      }
      // Ahora damos de alta los que vienen en el formulario
      if (isset($_REQUEST["criterios_efqm"]))
      {
        // Grabamos los criterios EFQM en los que este indicador influye (pueden ser uno o dos)
        foreach ($_REQUEST["criterios_efqm"] as $id_criterio_efqm)
        {
          $criterio_efqm_indicador = new criterio_efqm_indicador();
          $criterio_efqm_indicador->id_indicador = $indicador->id;
          $criterio_efqm_indicador->id_criterio_efqm = $id_criterio_efqm;
          $criterio_efqm_indicador->save();
        }
      }
			//lo mismo pero para las subunidades afectadas
			$indicador_subunidad = new indicador_subunidad();
			while ($indicador_subunidad->load("id_indicador = $id_indicador"))
      {
        $indicador_subunidad->delete();
      }
			if (isset($_REQUEST["subunidades"]))
      {
        foreach ($_REQUEST["subunidades"] as $id_subunidad)
        {
          $indicador_subunidad = new indicador_subunidad();
          $indicador_subunidad->id_indicador = $id_indicador;
          $indicador_subunidad->id_entidad = $id_subunidad;
          switch ($indicador->desagregado)
					{
						case 0:
							$indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
						break;
						case 1:
							$usuario_entidad = new usuario_entidad();
							// Cargamos al responsable de la unidad para echarle el muerto 
							// Luego el podrá echárselo a otro
							if ($usuario_entidad->load("id_entidad = $id_subunidad AND id_rol = 1"))
							{
								$indicador_subunidad->id_usuario = $usuario_entidad->id_usuario;
							}
							else
							{
								$indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
							}
						break;
						case 2:
							$indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
						break;
						default:
							$indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
					}
          $indicador_subunidad->save();
        }
      }
    }
    header("Location: index.php?page=indicador_mostrar&id_indicador=$indicador->id&id_entidad=$id_entidad&aviso=$aviso");
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
