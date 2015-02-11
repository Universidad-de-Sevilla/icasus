<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: panel_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba los paneles nuevos
//---------------------------------------------------------------------------------------------------
$panel = new Panel();
$panel_indicador = new Panel_indicador();
$id_cuadro = filter_input(INPUT_POST, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
$nombre_panel= filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
$orden = filter_input(INPUT_POST, 'orden', FILTER_SANITIZE_NUMBER_INT);
$tipo = filter_input(INPUT_POST, 'tipo', FILTER_SANITIZE_NUMBER_INT);
$ancho = filter_input(INPUT_POST, 'ancho', FILTER_SANITIZE_NUMBER_INT);

$id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT); //??

if ($id_cuadro && $nombre_panel && $orden && $tipo && $ancho)
{
    // Datos genéricos del panel
    $panel->id_cuadro = $id_cuadro;
    $panel->nombre = $nombre_panel;
    $panel->orden = $orden;
    $panel->id_paneltipo = $tipo;
    $panel->ancho = $ancho;

    $panel->id_medicion = filter_input(INPUT_POST, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $panel->fecha_inicio = filter_input(INPUT_POST, 'inicioYear', FILTER_SANITIZE_NUMBER_INT) . '-' . filter_input(INPUT_POST, 'inicioMonth', FILTER_SANITIZE_NUMBER_INT) . '-' . filter_input(INPUT_POST, 'inicioDay', FILTER_SANITIZE_NUMBER_INT);
    $panel->fecha_fin = filter_input(INPUT_POST, 'finYear', FILTER_SANITIZE_NUMBER_INT) . '-' . filter_input(INPUT_POST, 'finMonth', FILTER_SANITIZE_NUMBER_INT) . '-' . filter_input(INPUT_POST, 'finDay', FILTER_SANITIZE_NUMBER_INT);
    $panel->periodicidad = filter_has_var(INPUT_POST, 'periodicidad') ? filter_input(INPUT_POST, 'periodicidad', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : "todo";

    // Cuando se trata de un año completamos meses y días para coger el año completo 
    if (filter_has_var(INPUT_POST, 'fecha'))
    {
        $panel->fecha_inicio = filter_input(INPUT_POST, 'fecha') . "-01-01";
        $panel->fecha_fin = filter_input(INPUT_POST, 'fecha') . "-12-31";
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
        $panel_indicador->id_panel = $panel->id;
        $panel_indicador->mostrar_referencias = 1;
        switch ($panel->id_paneltipo)
        {
            case 1:
                // Panel Métrica
                $id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
                $id_entidad = filter_input(INPUT_POST, 'id_subunidad', FILTER_SANITIZE_NUMBER_INT);
                if ($id_indicador && $id_entidad)
                {
                    $panel_indicador->id_indicador = $id_indicador;
                    $panel_indicador->id_entidad = $id_entidad;
                    if ($panel_indicador->save())
                    {
                        header("location:index.php?page=cuadro_mostrar&id=$panel->id_cuadro");
                    }
                    else
                    {
                        //error no se grabó correctamente
                    }
                }
                else
                {
                    //error faltan parámetros
                }
                break;

            case 2:
                // Panel Línea

                // ---- POR AQUÍ VAMOS --- //
                // ---- POR AQUÍ VAMOS --- //
                // ---- POR AQUÍ VAMOS --- //
                
                $elementos = count(filter_input(INPUT_POST, 'id_indicadores'));
                for ($i = 0; $i < $elementos; $i++)
                {
                    $panel_indicador->id_indicador = filter_input(INPUT_POST, 'id_indicadores[$i]', FILTER_SANITIZE_NUMBER_INT);
                    $panel_indicador->id_entidad = filter_input(INPUT_POST, 'id_subunidades[$i]', FILTER_SANITIZE_NUMBER_INT);
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
                $panel_indicador->id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
                $panel_indicador->id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
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
                $elementos = count(filter_input(INPUT_POST, 'id_indicadores'));
                for ($i = 0; $i < $elementos; $i++)
                {
                    $panel_indicador->id_entidad = 0;
                    $panel_indicador->id_indicador = filter_input(INPUT_POST, 'id_indicadores[$i]', FILTER_SANITIZE_NUMBER_INT);
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
                $post_array = filter_input_array(INPUT_POST, FILTER_SANITIZE_NUMBER_INT);
                $subunidades = $post_array['id_subunidades'];
                foreach ($subunidades as $subunidad)
                {
                    $panel_indicador->id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
                    $panel_indicador->id_entidad = filter_var($subunidad, FILTER_SANITIZE_NUMBER_INT);
                    $panel_indicador->save();
                }
                header("location:index.php?page=cuadro_mostrar&id=$panel->id_cuadro");
                break;
        } //switch
    }
    else
    {
        // Error no se ha salvado el panel a la BD
    }
}
else
{
    // TODO: gestionar errores
}

