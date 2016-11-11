<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: panel_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba los paneles nuevos
//---------------------------------------------------------------------------------------------------

$panel = new Panel();
$panel_indicador = new Panel_indicador();

if (filter_has_var(INPUT_POST, 'id_cuadro') && filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'orden') && filter_has_var(INPUT_POST, 'tipo') && filter_has_var(INPUT_POST, 'ancho'))
{
    $id_cuadro = filter_input(INPUT_POST, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
    $id_ent = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $nombre_panel = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $orden = filter_input(INPUT_POST, 'orden', FILTER_SANITIZE_NUMBER_INT);
    $tipo = filter_input(INPUT_POST, 'tipo', FILTER_SANITIZE_NUMBER_INT);
    $ancho = filter_input(INPUT_POST, 'ancho', FILTER_SANITIZE_NUMBER_INT);

    // Datos genéricos del panel
    $panel->id_cuadro = $id_cuadro;
    $panel->nombre = $nombre_panel;
    $panel->orden = $orden;
    $panel->id_paneltipo = $tipo;
    $panel->ancho = $ancho;
    $panel->id_medicion = filter_input(INPUT_POST, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $panel->periodicidad = filter_has_var(INPUT_POST, 'periodicidad') ? filter_input(INPUT_POST, 'periodicidad', FILTER_SANITIZE_STRING) : "todos";
    $panel->anyos_atras = filter_has_var(INPUT_POST, 'anyos_atras') ? filter_input(INPUT_POST, 'anyos_atras', FILTER_SANITIZE_NUMBER_INT) : null;
    $panel->anyo_inicio = filter_has_var(INPUT_POST, 'anyo_inicio') ? filter_input(INPUT_POST, 'anyo_inicio', FILTER_SANITIZE_NUMBER_INT) : null;
    $panel->anyo_fin = filter_has_var(INPUT_POST, 'anyo_fin') ? filter_input(INPUT_POST, 'anyo_fin', FILTER_SANITIZE_NUMBER_INT) : null;

    //Guardamos los datos genéricos y comprobamos el tipo del panel
    if ($panel->save())
    {
        $panel_indicador->id_panel = $panel->id;
        $panel_indicador->mostrar_referencias = 1;

        //Comprobamos el tipo de panel
        switch ($panel->id_paneltipo)
        {
            // Panel Métrica
            case 1:
                if (filter_has_var(INPUT_POST, 'id_indicador') && filter_has_var(INPUT_POST, 'id_subunidad'))
                {
                    $id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
                    $id_entidad = filter_input(INPUT_POST, 'id_subunidad', FILTER_SANITIZE_NUMBER_INT);
                    $panel_indicador->id_indicador = $id_indicador;
                    $panel_indicador->id_entidad = $id_entidad;
                    if ($panel_indicador->save())
                    {
                        $exito = MSG_PANEL_CREADO . ' ' . $nombre_panel;
                        $smarty->assign("exito", $exito);
                        header("Location: index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&exito=$exito");
                    }
                    else
                    {
                        // Error no se ha salvado el panel a la BD
                        $error = ERR_GUARDAR;
                        header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
                    }
                }
                else
                {
                    //Error faltan parámetros
                    $error = ERR_PARAM;
                    header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
                }
                break;

            // Panel Línea y Panel Barra
            case 2:
            case 7:
                $post_array = filter_input_array(INPUT_POST);
                $id_indicadores = $post_array['id_indicadores'];
                $id_subunidades = $post_array['id_subunidades'];
                $elementos = count($id_indicadores);
                if ($id_indicadores && $id_subunidades)
                {
                    for ($i = 0; $i != $elementos; $i++)
                    {
                        $panel_indicador = new Panel_indicador();
                        $panel_indicador->id_panel = $panel->id;
                        $panel_indicador->mostrar_referencias = 1;
                        $panel_indicador->id_indicador = filter_var($id_indicadores[$i], FILTER_SANITIZE_NUMBER_INT);
                        $panel_indicador->id_entidad = filter_var($id_subunidades[$i], FILTER_SANITIZE_NUMBER_INT);
                        if ($panel_indicador->save())
                        {
                            $exito = MSG_PANEL_CREADO . ' ' . $nombre_panel;
                            $smarty->assign("exito", $exito);
                            header("Location: index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&exito=$exito");
                        }
                        else
                        {
                            // Error no se ha salvado el panel a la BD
                            $error = ERR_GUARDAR;
                            header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
                        }
                    }
                }
                else
                {
                    //Error faltan parámetros
                    $error = ERR_PARAM;
                    header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
                }
                break;

            // Panel Tarta
            case 3:
                if (filter_has_var(INPUT_POST, 'id_indicador') && filter_has_var(INPUT_POST, 'id_entidad'))
                {
                    $id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
                    $id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
                    $panel_indicador->id_indicador = $id_indicador;
                    $panel_indicador->id_entidad = $id_entidad;
                    if ($panel_indicador->save())
                    {
                        $exito = MSG_PANEL_CREADO . ' ' . $nombre_panel;
                        $smarty->assign("exito", $exito);
                        header("Location: index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&exito=$exito");
                    }
                    else
                    {
                        // Error no se ha salvado el panel a la BD
                        $error = ERR_GUARDAR;
                        header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
                    }
                }
                else
                {
                    //Error faltan parámetros
                    $error = ERR_PARAM;
                    header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
                }
                break;

            // Panel Mixto
            case 4:
                $post_array = filter_input_array(INPUT_POST);
                $id_indicadores = $post_array['id_indicadores'];
                if ($id_indicadores)
                {
                    foreach ($id_indicadores as $id_indicador)
                    {
                        $panel_indicador = new Panel_indicador();
                        $panel_indicador->id_panel = $panel->id;
                        $panel_indicador->mostrar_referencias = 1;
                        $panel_indicador->id_entidad = 0;
                        $panel_indicador->id_indicador = filter_var($id_indicador, FILTER_SANITIZE_NUMBER_INT);
                        if ($panel_indicador->save())
                        {
                            $exito = MSG_PANEL_CREADO . ' ' . $nombre_panel;
                            $smarty->assign("exito", $exito);
                            header("Location: index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&exito=$exito");
                        }
                        else
                        {
                            // Error no se ha salvado el panel a la BD
                            $error = ERR_GUARDAR;
                            header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
                        }
                    }
                }
                else
                {
                    //Error faltan parámetros
                    $error = ERR_PARAM;
                    header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
                }
                break;

            // Panel Tabla
            case 5:
                $id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
                $post_array = filter_input_array(INPUT_POST);
                $subunidades = $post_array['id_subunidades'];
                if ($id_indicador && $subunidades)
                {
                    foreach ($subunidades as $subunidad)
                    {
                        $panel_indicador = new Panel_indicador();
                        $panel_indicador->id_panel = $panel->id;
                        $panel_indicador->mostrar_referencias = 1;
                        $panel_indicador->id_indicador = $id_indicador;
                        $panel_indicador->id_entidad = filter_var($subunidad, FILTER_SANITIZE_NUMBER_INT);
                        if ($panel_indicador->save())
                        {
                            $exito = MSG_PANEL_CREADO . ' ' . $nombre_panel;
                            $smarty->assign("exito", $exito);
                            header("Location: index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&exito=$exito");
                        }
                        else
                        {
                            // Error no se ha salvado el panel a la BD
                            $error = ERR_GUARDAR;
                            header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
                        }
                    }
                }
                else
                {
                    //Error faltan parámetros
                    $error = ERR_PARAM;
                    header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
                }
                break;

            //Panel tabla_multi
            case 6:
                $id_entidad = filter_input(INPUT_POST, 'id_subunidad', FILTER_SANITIZE_NUMBER_INT);
                $post_array = filter_input_array(INPUT_POST);
                $id_indicadores = $post_array['id_indicadores'];
                if ($id_indicadores)
                {
                    foreach ($id_indicadores as $id_indicador)
                    {
                        $panel_indicador = new Panel_indicador();
                        $panel_indicador->id_panel = $panel->id;
                        $panel_indicador->mostrar_referencias = 1;
                        $panel_indicador->id_entidad = $id_entidad;
                        $panel_indicador->id_indicador = filter_var($id_indicador, FILTER_SANITIZE_NUMBER_INT);
                        if ($panel_indicador->save())
                        {
                            $exito = MSG_PANEL_CREADO . ' ' . $nombre_panel;
                            $smarty->assign("exito", $exito);
                            header("Location: index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&exito=$exito");
                        }
                        else
                        {
                            // Error no se ha salvado el panel a la BD
                            $error = ERR_GUARDAR;
                            header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
                        }
                    }
                }
                else
                {
                    //Error faltan parámetros
                    $error = ERR_PARAM;
                    header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
                }
                break;
        } //switch
    }
    else
    {
        // Error no se ha salvado el panel a la BD
        $error = ERR_GUARDAR;
        header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
    }
}
else
{
    //Error faltan parámetros
    $error = ERR_PARAM;
    header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_ent&error=$error");
}
