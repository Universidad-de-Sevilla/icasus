<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: usuario_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra los datos de un usuario y las entidades, procesos e indicadores/datos bajo
// su responsabilidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;
//Variables para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();
$logicaMedicion = new LogicaMedicion();

if (filter_has_var(INPUT_GET, 'id_usuario'))
{
    $id_usuario = filter_input(INPUT_GET, 'id_usuario', FILTER_SANITIZE_NUMBER_INT);
    $persona = new Usuario();
    $persona->load_joined("id = $id_usuario");
    $smarty->assign('persona', $persona);

    //Obtener todos los usuarios para avanzar o retroceder 
    $usuarios = $persona->Find('1=1');
    $smarty->assign("usuarios", $usuarios);
    $cont = 0;
    foreach ($usuarios as $user)
    {
        if ($id_usuario == $user->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    // Sólo administradores de Icasus pueden ver todas las responsabilidades de un usuario
    $admin = false;
    foreach ($usuario->entidades as $entidad)
    {
        if ($entidad->id_entidad == 1 && ($entidad->id_rol == 1 || $entidad->id_rol == 2))
        {
            $admin = true;
        }
    }
    $smarty->assign('admin', $admin);

    // Procesos propiedad del usuario
    $proceso = new Proceso();
    $procesos_propios = $proceso->Find_joined("id_propietario=$persona->id");
    $smarty->assign('procesos_propios', $procesos_propios);

    // Indicadores bajo la responsabilidad de este usuario
    $indicador = new Indicador();
    $indicadores = $indicador->Find_joined_ultima_medicion("(id_responsable = $persona->id OR id_responsable_medicion = $persona->id) AND id_proceso IS NOT NULL AND archivado IS NULL");
    $smarty->assign("indicadores_propios", $indicadores);

    // Datos bajo la responsabilidad de este usuario
    $datos = $indicador->Find_joined_ultima_medicion("(id_responsable = $persona->id OR id_responsable_medicion = $persona->id) AND id_proceso IS NULL AND archivado IS NULL");
    $smarty->assign("datos_propios", $datos);

    // Cuadros de mando del usuario
    $cuadro = new Cuadro();
    $cuadros = $cuadro->Find_joined("id_usuario = $persona->id");
    $smarty->assign('cuadros_propios', $cuadros);

    if (is_array($indicadores) && is_array($datos))
    {
        $indicadores_datos = array_merge($indicadores, $datos);
    }
    if (is_array($indicadores) && !is_array($datos))
    {
        $indicadores_datos = $indicadores;
    }
    if (is_array($datos) && !is_array($indicadores))
    {
        $indicadores_datos = $datos;
    }

    if ($indicadores_datos)
    {
        // Valores totales de las últimas mediciones
        $totales = array();
        $valor = new Valor();
        foreach ($indicadores_datos as $indicador)
        {
            $valores = $valor->find("id_medicion=" . $indicador->medicion->id);
            $total = $logicaIndicador->calcular_total($indicador, $valores, $indicador->medicion->etiqueta);
            $totales[$indicador->id] = $total;
        }
        $smarty->assign('totales', $totales);

        //Control (Status) de valores límite y metas
        $valor_referencia = new Valor_referencia();
        $valor_referencia_medicion = new Valor_referencia_medicion();
        $medicion_lim = array();
        $medicion_obj = array();
        $status = array();
        //Incializamos ambos arrays de referencias a null por defecto
        foreach ($indicadores_datos as $indicador)
        {
            $medicion_lim[$indicador->id] = NULL;
            $medicion_obj[$indicador->id] = NULL;
        }
        foreach ($indicadores_datos as $indicador)
        {
            $valores_referencia = $valor_referencia->Find("id_indicador = $indicador->id");
            if ($valores_referencia)
            {
                foreach ($valores_referencia as $valor_referencia)
                {
                    $existe = $valor_referencia_medicion->Load("id_valor_referencia=$valor_referencia->id AND id_medicion=" . $indicador->medicion->id);
                    if (!$existe)
                    {
                        $valor_referencia_medicion = new Valor_referencia_medicion();
                        $valor_referencia_medicion->id_valor_referencia = $valor_referencia->id;
                        $valor_referencia_medicion->id_medicion = $indicador->medicion->id;
                        $valor_referencia_medicion->save();
                    }
                }
                $valores_referencia_medicion = $valor_referencia_medicion->Find_joined("id_medicion=" . $indicador->medicion->id);
                if ($valores_referencia_medicion)
                {
                    foreach ($valores_referencia_medicion as $valor_referencia_medicion)
                    {
                        //Es la referencia Límite
                        if (strpos($valor_referencia_medicion->valor_referencia->nombre, 'mite') !== false)
                        {
                            $medicion_lim[$indicador->id] = $valor_referencia_medicion->valor;
                        }
                        //Es la referencia Meta
                        if (strpos($valor_referencia_medicion->valor_referencia->nombre, 'eta') !== false)
                        {
                            $medicion_obj[$indicador->id] = $valor_referencia_medicion->valor;
                        }
                    }
                }
                $status[$indicador->id] = $logicaMedicion->calcular_status_medicion($indicador->inverso, $totales[$indicador->id], $medicion_lim[$indicador->id], $medicion_obj[$indicador->id]);
            }
        }

        $smarty->assign('medicion_obj', $medicion_obj);
        $smarty->assign('medicion_lim', $medicion_lim);
        $smarty->assign('status', $status);
    }
    $smarty->assign('_javascript', array('inicio'));
    $nombre_pagina = $persona->nombre . ' ' . $persona->apellidos;
    $smarty->assign('_nombre_pagina', $nombre_pagina);
    $plantilla = "usuario_mostrar.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
