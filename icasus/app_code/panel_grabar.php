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
	$panel = new panel();
	$panel->id_cuadro =sanitize($_REQUEST["id_cuadro"],INT); 
	$panel->nombre = sanitize($_REQUEST["nombre"],SQL);
	$panel->id_paneltipo = sanitize($_REQUEST["tipo"],INT);
	$panel->id_medicion = sanitize($_REQUEST["id_medicion"],INT);
	$panel->fecha_inicio = sanitize($_REQUEST["inicioYear"],INT).'-'.sanitize($_REQUEST["inicioMonth"],INT).'-'.sanitize($_REQUEST["inicioDay"],INT);
	$panel->fecha_fin = sanitize($_REQUEST["finYear"],INT).'-'.sanitize($_REQUEST["finMonth"],INT).'-'.sanitize($_REQUEST["finDay"],INT);
	$panel->orden = sanitize($_REQUEST["orden"],SQL);
	$panel->ancho = sanitize($_REQUEST["ancho"],SQL);

	//No usamos periodicidad de momento
  //$panel->periodicidad = sanitize($_REQUEST["periodicidad"],SQL);

	if ($panel->save())
	{
		switch($panel->id_paneltipo)
		{
			case 1:
				$panel_indicador = new panel_indicador();
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
				$elementos = count($_REQUEST["id_indicadores"]);
				for($i=0;$i < $elementos;$i++)
				{
					$panel_indicador = new panel_indicador();
					$panel_indicador->id_panel = $panel->id;
					$panel_indicador->id_indicador = sanitize($_REQUEST["id_indicadores"][$i],INT);
					$panel_indicador->id_entidad = sanitize($_REQUEST["id_subunidades"][$i],INT);
					$panel_indicador->mostrar_referencias = 1;
					if (!$panel_indicador->save())
					{
						echo 'error no se grabó correctamente';
					}
				}
					header("location:index.php?page=cuadro_mostrar&id=$panel->id_cuadro");
			break;
			case 3:
				$panel_indicador = new panel_indicador();
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
				$elementos = count($_REQUEST["id_indicadores"]);
				for($i=0;$i < $elementos;$i++)
				{
					$panel_indicador = new panel_indicador();
					$panel_indicador->id_panel = $panel->id;
					$panel_indicador->id_indicador = sanitize($_REQUEST["id_indicadores"][$i],INT);
					$panel_indicador->id_entidad = sanitize($_REQUEST["id_subunidades"][$i],INT);
					$panel_indicador->mostrar_referencias = 1;
					if (!$panel_indicador->save())
					{
						echo 'error no se grabó correctamente';
					}
				}
					header("location:index.php?page=cuadro_mostrar&id=$panel->id_cuadro");
			break;
			case 5:
				foreach($_REQUEST["id_subunidades"] as $subunidad)
				{
					$panel_indicador = new panel_indicador();
					$panel_indicador->id_panel = $panel->id;
					$panel_indicador->id_indicador = sanitize($_REQUEST["id_indicador"],INT);
					$panel_indicador->id_entidad = sanitize($subunidad,INT);
					$panel_indicador->mostrar_referencias = 1;
					if (!$panel_indicador->save())
					{
						//error no se ha grabado
					}
				}
					header("location:index.php?page=cuadro_mostrar&id=$panel->id_cuadro");
			break;
		}
	}
	else
	{
		//error no se grabó correctamente
	}
}
else
{
	//faltan parámetros
}
?>
