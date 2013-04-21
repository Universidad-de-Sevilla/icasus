<?php
print_r($_POST);
if (!empty($_REQUEST["id_cuadro"]) OR !empty($_REQUEST["id_entidad"]) OR !empty($_REQUEST["nombre"])  OR !empty($_REQUEST["orden"])OR !empty($_REQUEST["tipo"]) OR !empty($_REQUEST["ancho"]) OR !empty($_REQUEST["id_indicador"]))
{
	$panel = new panel();
	$panel->id_cuadro =sanitize($_REQUEST["id_cuadro"],INT); 
	$panel->nombre = sanitize($_REQUEST["nombre"],SQL);
	$panel->id_paneltipo = sanitize($_REQUEST["tipo"],INT);
	$panel->id_medicion_inicio = sanitize($_REQUEST["id_medicion_inicio"],INT);
	$panel->id_medicion_fin = sanitize($_REQUEST["id_medicion_fin"],INT);
	$panel->orden = sanitize($_REQUEST["orden"],SQL);
	$panel->ancho = sanitize($_REQUEST["ancho"],SQL);

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
					//header("location:index.php?page=cuadro_listar");
				}
				else
				{
					//error no se grabó correctamente
				}
			break;
			case 3:
				$panel_indicador = new panel_indicador();
				$panel_indicador->id_panel = $panel->id;
				$panel_indicador->id_indicador = sanitize($_REQUEST["id_indicador"],INT);
				$panel_indicador->id_entidad = sanitize($_REQUEST["id_entidad"],INT);
				$panel_indicador->mostrar_referencias = 1;
				if ($panel_indicador->save())
				{
					//header("location:index.php?page=cuadro_listar");
				}
				else
				{
					//error no se grabó correctamente
				}
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
				//header("location:index.php?page=cuadro_listar");
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
