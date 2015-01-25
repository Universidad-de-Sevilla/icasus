<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: panel_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba los paneles nuevos
//---------------------------------------------------------------------------------------------------
//if (!empty($_REQUEST["id_cuadro"]) OR ! empty($_REQUEST["id_entidad"]) OR ! empty($_REQUEST["nombre"]) OR ! empty($_REQUEST["orden"])OR ! empty($_REQUEST["tipo"]) OR ! empty($_REQUEST["ancho"]) OR ! empty($_REQUEST["id_indicador"]))
if (filter_has_var(INPUT_POST, 'id_cuadro') OR filter_has_var(INPUT_POST, 'id_entidad')
        OR filter_has_var(INPUT_POST, 'nombre') OR filter_has_var(INPUT_POST, 'orden')
        OR filter_has_var(INPUT_POST, 'tipo') OR filter_has_var(INPUT_POST, 'ancho') OR filter_has_var(INPUT_POST, 'id_indicador'))
{
    $panel = new Panel();
//    $panel->id_cuadro = sanitize($_REQUEST["id_cuadro"], INT);
    $panel->id_cuadro = filter_input(INPUT_POST, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
//    $panel->nombre = sanitize($_REQUEST["nombre"], SQL);
    $panel->nombre = filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $panel->id_paneltipo = sanitize($_REQUEST["tipo"], INT);
    $panel->id_paneltipo = filter_input(INPUT_POST, 'tipo', FILTER_SANITIZE_NUMBER_INT);
//    $panel->id_medicion = sanitize($_REQUEST["id_medicion"], INT);
    $panel->id_medicion = filter_input(INPUT_POST, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
//    $panel->fecha_inicio = sanitize($_REQUEST["inicioYear"], INT) . '-' . sanitize($_REQUEST["inicioMonth"], INT) . '-' . sanitize($_REQUEST["inicioDay"], INT);
    $panel->fecha_inicio = filter_input(INPUT_POST, 'inicioYear', FILTER_SANITIZE_NUMBER_INT) . '-' . filter_input(INPUT_POST, 'inicioMonth', FILTER_SANITIZE_NUMBER_INT) . '-' . filter_input(INPUT_POST, 'inicioDay', FILTER_SANITIZE_NUMBER_INT);
//    $panel->fecha_fin = sanitize($_REQUEST["finYear"], INT) . '-' . sanitize($_REQUEST["finMonth"], INT) . '-' . sanitize($_REQUEST["finDay"], INT);
    $panel->fecha_fin = filter_input(INPUT_POST, 'finYear', FILTER_SANITIZE_NUMBER_INT) . '-' . filter_input(INPUT_POST, 'finMonth', FILTER_SANITIZE_NUMBER_INT) . '-' . filter_input(INPUT_POST, 'finDay', FILTER_SANITIZE_NUMBER_INT);
//    $panel->orden = sanitize($_REQUEST["orden"], SQL);
    $panel->orden = filter_input(INPUT_POST, 'orden', FILTER_SANITIZE_NUMBER_INT);
//    $panel->ancho = sanitize($_REQUEST["ancho"], SQL);
    $panel->ancho = filter_input(INPUT_POST, 'ancho', FILTER_SANITIZE_NUMBER_INT);
//    $panel->periodicidad = isset($_REQUEST["periodicidad"]) ? sanitize($_REQUEST["periodicidad"], SQL) : "todo";
    $panel->periodicidad = filter_has_var(INPUT_POST, 'periodicidad') ? filter_input(INPUT_POST, 'periodicidad', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : "todo";

    // Cuando se trata de un año completamos meses y días para coger el año completo 
//    if (isset($_REQUEST["fecha"]))
    if (filter_has_var(INPUT_POST, 'fecha'))
    {
//        $panel->fecha_inicio = $_REQUEST['fecha'] . "-01-01";
        $panel->fecha_inicio = filter_input(INPUT_POST, 'fecha') . "-01-01";
//        $panel->fecha_fin = $_REQUEST['fecha'] . "-12-31";
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
        switch ($panel->id_paneltipo)
        {
            case 1:
                // Panel Métrica
                $panel_indicador = new Panel_indicador();
                $panel_indicador->id_panel = $panel->id;
//                $panel_indicador->id_indicador = sanitize($_REQUEST["id_indicador"], INT);
                $panel_indicador->id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
//                $panel_indicador->id_entidad = sanitize($_REQUEST["id_subunidad"], INT);
                $panel_indicador->id_entidad = filter_input(INPUT_POST, 'id_subunidad', FILTER_SANITIZE_NUMBER_INT);
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
//                $elementos = count($_REQUEST["id_indicadores"]);
                $elementos = count(filter_input(INPUT_POST, 'id_indicadores'));
                for ($i = 0; $i < $elementos; $i++)
                {
                    $panel_indicador = new Panel_indicador();
                    $panel_indicador->id_panel = $panel->id;
//                    $panel_indicador->id_indicador = sanitize($_REQUEST["id_indicadores"][$i], INT);
                    $panel_indicador->id_indicador = filter_input(INPUT_POST, 'id_indicadores[$i]', FILTER_SANITIZE_NUMBER_INT);
//                    $panel_indicador->id_entidad = sanitize($_REQUEST["id_subunidades"][$i], INT);
                    $panel_indicador->id_entidad = filter_input(INPUT_POST, 'id_subunidades[$i]', FILTER_SANITIZE_NUMBER_INT);
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
//                $panel_indicador->id_indicador = sanitize($_REQUEST["id_indicador"], INT);
                $panel_indicador->id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
//                $panel_indicador->id_entidad = sanitize($_REQUEST["id_entidad"], INT);
                $panel_indicador->id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
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
//                $elementos = count($_REQUEST["id_indicadores"]);
                $elementos = count(filter_input(INPUT_POST, 'id_indicadores'));
                for ($i = 0; $i < $elementos; $i++)
                {
                    $panel_indicador = new Panel_indicador();
                    $panel_indicador->id_entidad = 0;
                    $panel_indicador->id_panel = $panel->id;
//                    $panel_indicador->id_indicador = sanitize($_REQUEST["id_indicadores"][$i], INT);
                    $panel_indicador->id_indicador = filter_input(INPUT_POST, 'id_indicadores[$i]', FILTER_SANITIZE_NUMBER_INT);
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
                $subunidades = filter_input(INPUT_POST, 'id_subunidades');
//                foreach ($_REQUEST["id_subunidades"] as $subunidad)
                foreach ($subunidades as $subunidad)
                {
                    $panel_indicador = new Panel_indicador();
                    $panel_indicador->id_panel = $panel->id;
//                    $panel_indicador->id_indicador = sanitize($_REQUEST["id_indicador"], INT);
                    $panel_indicador->id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
//                    $panel_indicador->id_entidad = sanitize($subunidad, INT);
                    $panel_indicador->id_entidad = filter_var(INPUT_POST, $subunidad, FILTER_SANITIZE_NUMBER_INT);
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

