<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicador_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Formulario para modificar los datos de un indicador
//--------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

// Comprobamos que vengan los datos mínimos necesarios
if (filter_has_var(INPUT_GET, 'id_indicador') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $indicador = new Indicador();
    $indicador->load_joined("id = $id_indicador");
    $smarty->assign('indicador', $indicador);

    //Proceso del indicador
    if ($indicador->id_proceso)
    {
        $proceso = $indicador->proceso;
        $smarty->assign('proceso', $proceso);
    }

    // Comprueba permisos para el usuario: responsable unidad, responsable delegado,
    // responsable indicador, responsable medicion
    $usuario_entidad = new Usuario_entidad();
    if ($control || $indicador->id_responsable == $usuario->id)
    {
        $entidad = new Entidad();
        $entidad->load("id = $indicador->id_entidad");
        $subunidades = $entidad->Find("id_madre = $indicador->id_entidad ORDER BY etiqueta");
        $smarty->assign('entidad', $entidad);
        $smarty->assign('subunidades', $subunidades);

        $proceso = new Proceso();
        $procesos = $proceso->Find("id_entidad = $indicador->id_entidad");
        $smarty->assign('procesos', $procesos);

        $criterio_efqm = new Criterio_efqm();
        $criterios_efqm = $criterio_efqm->Find("1 = 1");
        $smarty->assign("criterios_efqm", $criterios_efqm);

        $visibilidad = new Visibilidad;
        $visibilidades = $visibilidad->Find("1=1");
        $smarty->assign("visibilidades", $visibilidades);

        $tipo_agregacion = new Tipo_agregacion();
        $tipos_agregacion = $tipo_agregacion->Find("true ORDER BY id");
        $smarty->assign("tipos_agregacion", $tipos_agregacion);

        $usuario_entidad = new Usuario_entidad();
        $usuarios_entidades = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
        $smarty->assign('usuarios_entidades', $usuarios_entidades);

        $indicador_subunidad = new Indicador_subunidad();
        $indicador_subunidades = $indicador_subunidad->Find_entidades("id_indicador = $id_indicador");
        $smarty->assign("indicador_subunidades", $indicador_subunidades);

        $smarty->assign('_nombre_pagina', TXT_INDIC_EDIT . ': ' . $indicador->nombre);
        $smarty->assign('_javascript', array('indicador_editar'));
        $plantilla = 'indicadores/indicador_editar.tpl';
    }
    else
    {
        // El usuario no tiene permisos avisamos error
        $error = ERR_PERMISOS;
        header("Location:index.php?page=indicador_mostrar&id_indicador=$id_indicador&id_entidad=$id_entidad&error=$error");
    }
}
else
{
    // Faltan parametros avisamos error
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
