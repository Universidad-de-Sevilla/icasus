<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra los datos asociados a una medicion, si el usuario está autorizado 
// le permite editarlos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variables para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();
$logicaMedicion = new LogicaMedicion();

if (filter_has_var(INPUT_GET, 'id_medicion'))
{
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $tipo = filter_input(INPUT_GET, 'tipo', FILTER_SANITIZE_STRING);
    $smarty->assign("tipo", $tipo);

    $medicion = new Medicion();
    $medicion->load("id = $id_medicion");
    $smarty->assign("medicion", $medicion);

    $indicador = new Indicador();
    $indicador->load("id = $medicion->id_indicador");
    $smarty->assign("indicador", $indicador);

    //Proceso del indicador
    if ($tipo == 'indicador')
    {
        $proceso = new Proceso();
        $proceso->load_joined("id = $indicador->id_proceso");
        $smarty->assign('proceso', $proceso);
    }

    //Obtener todas las mediciones para avanzar o retroceder 
    $mediciones = $medicion->Find("id_indicador = $indicador->id ORDER BY periodo_inicio");
    $smarty->assign("mediciones", $mediciones);
    $cont = 0;
    foreach ($mediciones as $med)
    {
        if ($id_medicion == $med->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //comprobar permisos para cambiar mediciones tanto para responsables del indicador como
    //de la medición o responsables de la unidad
    $permiso_editar = false;
    $permiso_unidad = false;
    if ($control)
    {
        $permiso_unidad = true;
    }
    $smarty->assign('permiso_unidad', $permiso_unidad);
    if ($control OR $indicador->id_responsable == $usuario->id
            OR $indicador->id_responsable_medicion == $usuario->id)
    {
        $permiso_editar = true;
    }
    $smarty->assign('permiso_editar', $permiso_editar);

    $valor = new Valor();
    $valores = $valor->Find_joined_jjmc($id_medicion, $usuario->id);
    $smarty->assign("valores", $valores);

    //Prepara el gráfico de tarta si hay valores
    $pinta_grafico = false;
    if ($valores)
    {
        foreach ($valores as $val)
        {
            if ($val->valor != null)
            {
                $pinta_grafico = true;
            }
        }
        if ($pinta_grafico)
        {
            $panel = new Panel();
            $panel->nombre = TXT_VALS_SUBUNID;
            $smarty->assign("panel", $panel);
        }
    }
    $smarty->assign("pinta_grafico", $pinta_grafico);

    //Calculamos el total de la medición
    $total = $logicaIndicador->calcular_total($indicador, $valores, $medicion->etiqueta);
    $tipo_agregacion = new Tipo_agregacion();
    $tipo_agregacion->Load("id=$indicador->id_tipo_agregacion");
    $smarty->assign("agregacion", $tipo_agregacion->descripcion);
    $smarty->assign("total", $total);

    //Buscar todos valores ref del indicador y recorrer si no existe entrada 
    //en la tabla valores_ref _med creamos entrada y despues asignamos a la plantilla
    $valor_referencia_medicion = new Valor_referencia_medicion();
    $valor_referencia = new Valor_referencia();
    $valores_referencia = $valor_referencia->Find("id_indicador = $indicador->id");
    if ($valores_referencia)
    {
        foreach ($valores_referencia as $valor_referencia)
        {
            $existe = $valor_referencia_medicion->Load("id_valor_referencia=$valor_referencia->id AND id_medicion=$id_medicion");
            if (!$existe)
            {
                $valor_referencia_medicion = new Valor_referencia_medicion();
                $valor_referencia_medicion->id_valor_referencia = $valor_referencia->id;
                $valor_referencia_medicion->id_medicion = $id_medicion;
                $valor_referencia_medicion->save();
            }
        }
        $valores_referencia_medicion = $valor_referencia_medicion->Find_joined("id_medicion = $id_medicion");
        $smarty->assign("valores_referencia_medicion", $valores_referencia_medicion);

        //Control (Status) de valores límite y metas
        $medicion_lim = null;
        $medicion_obj = null;
        if ($valores_referencia_medicion)
        {
            foreach ($valores_referencia_medicion as $med_ref)
            {
                //Es la referencia Límite
                if (strpos($med_ref->valor_referencia->nombre, 'mite'))
                {
                    $medicion_lim = $med_ref->valor;
                    $smarty->assign('medicion_lim', $medicion_lim);
                }
                //Es la referencia Meta
                if (strpos($med_ref->valor_referencia->nombre, 'eta'))
                {
                    $medicion_obj = $med_ref->valor;
                    $smarty->assign('medicion_obj', $medicion_obj);
                }
            }
            $status = $logicaMedicion->calcular_status_medicion($indicador->inverso, $total, $medicion_lim, $medicion_obj);
            $smarty->assign('status', $status);
        }
    }

    $indisub = new Indicador_subunidad();
    $indicador_subunidades = $indisub->find("id_usuario = $usuario->id AND id_indicador = $indicador->id");
    $smarty->assign('indicador_subunidades', $indicador_subunidades);

    $entidad = new Entidad();
    $entidad->load("id = $indicador->id_entidad");
    $smarty->assign('entidad', $entidad);

    //Vemos si influye en otros Indicadores/Datos
    $indicadores_dependientes = $logicaIndicador->calcular_influencias($indicador->id);
    $smarty->assign('indicadores_dependientes', $indicadores_dependientes);

    //Si es calculado vemos los Indicadores/Datos de los que depende
    $indicadores_influyentes = $logicaIndicador->calcular_dependencias($indicador->id);
    $smarty->assign("indicadores_influyentes", $indicadores_influyentes);

    $smarty->assign("usuario", $usuario);
    $smarty->assign("_nombre_pagina", FIELD_MED . ": " . " $medicion->etiqueta - $indicador->nombre");
    $smarty->assign('_javascript', array('medicion'));
    $plantilla = "medicion.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
