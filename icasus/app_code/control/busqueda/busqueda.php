<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: busqueda/busqueda.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra los resultados de la búsqueda general
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'texto_buscar'))
{
    $texto = filter_input(INPUT_GET, 'texto_buscar', FILTER_SANITIZE_STRING);
    $smarty->assign('texto', $texto);
    //Para hacer búsqueda case insensitive:
    $textob = strtoupper($texto);

    //Usuarios
    $usuario = new Usuario();
    $usuarios = $usuario->Find("upper(login) LIKE '%$textob%' OR upper(nombre) LIKE '%$textob%' OR upper(apellidos) LIKE '%$textob%'");
    $smarty->assign('usuarios', $usuarios);
    $ids_usuarios = array();
    foreach ($usuarios as $usuario)
    {
        array_push($ids_usuarios, $usuario->id);
    }
    $ids_usuarios_st = join("','", $ids_usuarios);

    //Buscar entidades
    $entidad = new Entidad();
    $entidades = $entidad->Find("(upper(nombre) LIKE '%$textob%' OR upper(codigo) LIKE '%$textob%') AND es_organica = 1");
    $smarty->assign('entidades', $entidades);

    //Buscar procesos
    $proceso = new Proceso();
    $procesos = $proceso->Find_joined("upper(nombre) LIKE '%$textob%' OR upper(codigo) LIKE '%$textob%' OR id_propietario IN ('$ids_usuarios_st')");
    $smarty->assign('procesos', $procesos);

    //Buscar indicadores/datos
    $indicador = new Indicador();
    $indicadores = $indicador->Find_joined("(upper(nombre) LIKE '%$textob%' OR upper(codigo) LIKE '%$textob%') OR id_responsable IN ('$ids_usuarios_st') OR id_responsable_medicion IN ('$ids_usuarios_st')");
    $smarty->assign('indicadores', $indicadores);

    //Buscar cuadros de mando
    $cuadro = new Cuadro();
    $cuadros_public = $cuadro->Find_joined("(upper(nombre) LIKE '%$textob%' OR id_usuario IN ('$ids_usuarios_st')) AND privado=0");
    $smarty->assign('cuadros_publicos', $cuadros_public);

    //Buscar planes estratégicos
    $plan = new Plan();
    $planes = $plan->Find_joined("upper(titulo) LIKE '%$textob%' OR CAST(anyo_inicio as char) LIKE '%$textob%' OR CAST((anyo_inicio+duracion-1) as char) LIKE '%$textob%'");
    $smarty->assign('planes', $planes);

    //Buscar líneas estratégicas
    $linea = new Linea();
    $lineas = $linea->Find_joined("upper(nombre) LIKE '%$textob%'");
    $smarty->assign('lineas', $lineas);

    //Buscar objetivos estratégicos
    $objest = new ObjetivoEstrategico();
    $objests = $objest->Find_joined("upper(nombre) LIKE '%$textob%'");
    $smarty->assign('objests', $objests);

    //Buscar objetivos operacionales
    $objop = new ObjetivoOperacional();
    $objops = $objop->Find_joined("upper(nombre) LIKE '%$textob%' OR id_responsable IN ('$ids_usuarios_st')");
    $smarty->assign('objops', $objops);

    //Buscar Cartas de Servicios
    $carta = new Carta();
    $cartas = $carta->Find_joined("fecha LIKE '%$textob%'");
    $smarty->assign('cartas', $cartas);

    //Buscar Servicios
    $servicio = new Servicio();
    $servicios = $servicio->Find_joined("upper(nombre) LIKE '%$textob%'");
    $smarty->assign('servicios', $servicios);

    //Buscar Compromisos
    $compromiso = new Compromiso();
    $compromisos = $compromiso->Find_joined("upper(nombre) LIKE '%$textob%'");
    $smarty->assign('compromisos', $compromisos);

    $smarty->assign("_nombre_pagina", TXT_BUSCAR_RESUL . '"' . $texto . '"');
    $plantilla = "busqueda/busqueda.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
