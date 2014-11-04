<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: panel_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba los paneles nuevos
//---------------------------------------------------------------------------------------------------

if (!empty($_REQUEST["id_cuadro"]) OR !empty($_REQUEST["id_entidad"]) OR !empty($_REQUEST["nombre"])  OR !empty($_REQUEST["orden"])OR !empty($_REQUEST["tipo"]) OR !empty($_REQUEST["ancho"]) OR !empty($_REQUEST["id_indicador"]))
{
	$panel = new Panel();
	$panel->id_cuadro =sanitize($_REQUEST["id_cuadro"],INT); 
	$panel->nombre = sanitize($_REQUEST["nombre"],SQL);
	$panel->id_paneltipo = sanitize($_REQUEST["tipo"],INT);
	$panel->id_medicion = sanitize($_REQUEST["id_medicion"],INT);
	$panel->fecha_inicio = sanitize($_REQUEST["inicioYear"],INT).'-'.sanitize($_REQUEST["inicioMonth"],INT).'-'.sanitize($_REQUEST["inicioDay"],INT);
	$panel->fecha_fin = sanitize($_REQUEST["finYear"],INT).'-'.sanitize($_REQUEST["finMonth"],INT).'-'.sanitize($_REQUEST["finDay"],INT);
	$panel->orden = sanitize($_REQUEST["orden"],SQL);
	$panel->ancho = sanitize($_REQUEST["ancho"],SQL);
  $panel->periodicidad = isset($_REQUEST["periodicidad"])?sanitize($_REQUEST["periodicidad"],SQL):"todo";

  // Cuando se trata de un año completamos meses y días para coger el año completo 
	if (isset($_REQUEST["fecha"]))
	{
		$panel->fecha_inicio = $_REQUEST['fecha']."-01-01";
		$panel->fecha_fin = $_REQUEST['fecha']."-12-31";
	}

  // Si se trata de una medición concreta cogemos las fechas de la propia medición
  if ($panel->id_medicion > 0)
  {
    $medicion = new Medicion();
    $medicion->load("id = $panel->id_medicion");
    $panel->fecha_inicio = $medicion->periodo_inicio;
    $panel->fecha_fin = $medicion->periodo_fin;
  }

	if ($panel->save())
	{
		switch($panel->id_paneltipo)
		{
			case 1:
        // Panel Métrica
				$panel_indicador = new Panel_indicador();
				$panel_indicador->id_panel = $panel->id;
				$panel_indicador->id_indicador = sanitize($_REQUEST["id_indicador"],INT);
				$panel_indicador->id_entidad = sanitize($_REQUEST["id_subunidad"],INT);
				$panel_indicador->mostrar_referencias = 1;
				if ($panel_indicador->save())
				{
					header("location:index.php?page=cuadro_mostrar&id=$panel->id_cuadro");
				}
				else
				{
					//error no se grabó correctamente
				}
        break;

			case 2:
        // Panel Línea
				$elementos = count($_REQUEST["id_indicadores"]);
				for($i=0;$i < $elementos;$i++)
				{
					$panel_indicador = new Panel_indicador();
					$panel_indicador->id_panel = $panel->id;
					$panel_indicador->id_indicador = sanitize($_REQUEST["id_indicadores"][$i],INT);
					$panel_indicador->id_entidad = sanitize($_REQUEST["id_subunidades"][$i],INT);
					$panel_indicador->mostrar_referencias = 1;
					if ($panel_indicador->save())
					{
					  header("location:index.php?page=cuadro_mostrar&id=$panel->id_cuadro");
					}
          else
          { 
            //error, no se grabó correctamente
          }
				}
        break;

			case 3:
        // Panel Tarta
				$panel_indicador = new Panel_indicador();
				$panel_indicador->id_panel = $panel->id;
				$panel_indicador->id_indicador = sanitize($_REQUEST["id_indicador"],INT);
				$panel_indicador->id_entidad = sanitize($_REQUEST["id_entidad"],INT);
				$panel_indicador->mostrar_referencias = 1;
				if ($panel_indicador->save())
				{
					header("location:index.php?page=cuadro_mostrar&id=$panel->id_cuadro");
				}
				else
				{
					//error no se grabó correctamente
				}
        break;

			case 4:
        // Panel Barras
				$elementos = count($_REQUEST["id_indicadores"]);
				for($i=0;$i < $elementos;$i++)
				{
					$panel_indicador = new Panel_indicador();
					$panel_indicador->id_entidad = 0;
					$panel_indicador->id_panel = $panel->id;
					$panel_indicador->id_indicador = sanitize($_REQUEST["id_indicadores"][$i],INT);
					//se utiliza en el antiguo.
					//$panel_indicador->id_entidad = sanitize($_REQUEST["id_subunidades"][$i],INT);
					$panel_indicador->mostrar_referencias = 1;
					if ($panel_indicador->save())
					{
            header("location:index.php?page=cuadro_mostrar&id=$panel->id_cuadro");
					}
          else
          {
            //error no se grabó correctamente
          }
				}
        break;

			case 5:
        // Panel Tabla
				foreach($_REQUEST["id_subunidades"] as $subunidad)
				{
					$panel_indicador = new Panel_indicador();
					$panel_indicador->id_panel = $panel->id;
					$panel_indicador->id_indicador = sanitize($_REQUEST["id_indicador"],INT);
					$panel_indicador->id_entidad = sanitize($subunidad,INT);
					$panel_indicador->mostrar_referencias = 1;
					$panel_indicador->save();
				}
				header("location:index.php?page=cuadro_mostrar&id=$panel->id_cuadro");
		  	break;
        
		} //switch
	}
  else
  {
    // No se ha podido grabar el panel
    // TODO: Tratar error
  }
}
else
{ 
  // TODO: gestionar errores
}
?>
