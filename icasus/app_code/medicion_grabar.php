<?php
//------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_grabar.php
//------------------------------------------------------------------------------
// Graba una nueva medición de un indicador
//------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

//datos periodo
$periodo_inicio = sanitize($_REQUEST["piYear"],INT)."-".sanitize($_REQUEST["piMonth"],INT)."-".sanitize($_REQUEST["piDay"],INT);
$periodo_fin = sanitize($_REQUEST["pfYear"],INT)."-".sanitize($_REQUEST["pfMonth"],INT)."-".sanitize($_REQUEST["pfDay"],INT);
$grabacion_inicio = sanitize($_REQUEST["giYear"],INT)."-".sanitize($_REQUEST["giMonth"],INT)."-".sanitize($_REQUEST["giDay"],INT);
$grabacion_fin = sanitize($_REQUEST["gfYear"],INT)."-".sanitize($_REQUEST["gfMonth"],INT)."-".sanitize($_REQUEST["gfDay"],INT);

if (isset($_REQUEST["id_indicador"], $_REQUEST["tipo"], $periodo_inicio, $periodo_fin, $grabacion_inicio, $grabacion_fin))
{
	$tipo = sanitize($_REQUEST["tipo"], SQL);
  $medicion = new medicion();
	$medicion->id_indicador = sanitize($_REQUEST["id_indicador"], INT);
  $medicion->periodo_inicio = $periodo_inicio;
  $medicion->periodo_fin =  $periodo_fin;
  $medicion->grabacion_inicio = $grabacion_inicio; 
  $medicion->grabacion_fin = $grabacion_fin; 
	$medicion->etiqueta = empty($_REQUEST["etiqueta"]) ? null : sanitize($_REQUEST["etiqueta"],SQL);
  if ($medicion->save())
  {
		if (isset($_REQUEST["valor_referencia"]))
		{
			foreach($_REQUEST["valor_referencia"] as $id_valor_referencia=>$valor)
			{
				$valor_referencia_medicion = new valor_referencia_medicion();
//				$valor_referencia_medicion->load("id = $id_valor_referencia");
				$valor_referencia_medicion->id_valor_referencia = $id_valor_referencia;
				$valor_referencia_medicion->valor = $valor;
				$valor_referencia_medicion->id_medicion = $medicion->id;
				$valor_referencia_medicion->save();
			}
		}

    // Grabamos un valor en blanco a cada una de las unidades asociadas al indicador
    $indicador_subunidad = new indicador_subunidad();
    $indicadores_subunidades = $indicador_subunidad->Find("id_indicador = $medicion->id_indicador"); 
    $numero_subunidades = count($indicadores_subunidades);
    foreach($indicadores_subunidades as $indicador_subunidad)
    {
      $valor = new valor();
      $valor->id_entidad = $indicador_subunidad->id_entidad;
      $valor->id_medicion = $medicion->id;
      $valor->activo = 1;
      $valor->save();
    }
    $aviso = "Se ha agregado correctamente una nueva medición con $numero_subunidades unidades afectadas";
    header("location:index.php?page=medicion_listar&id_{$tipo}=$medicion->id_indicador&aviso=$aviso");
  }
  else
  {
    $error = "Ha ocurrido un error al grabar la medición, inténtelo de nuevo o contacte con los administradores de Icasus";
    header("location:index.php?page=medicion_listar&id_{$tipo}=$medicion->id_indicador&error=$error");
  }
}
else
{
  $error = "Faltan datos para procesar la petición de creación de medición.";
  header("location:index.php?error=$error");
}
