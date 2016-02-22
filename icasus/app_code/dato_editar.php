<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: dato_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Formulario para modificar los datos (los datos son indicadores recortados)
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_dato') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_dato = filter_input(INPUT_GET, 'id_dato', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $usuario_entidad = new Usuario_entidad;
    // Comprobamos permisos
    if ($control || $dato->id_responsable == $usuario->id)
    {
        $dato = new Indicador();
        $dato->load_joined("id = $id_dato");
        $smarty->assign('dato', $dato);

        $entidad = new Entidad();
        $entidad->load("id = $dato->id_entidad");
        $smarty->assign('entidad', $entidad);

        $subunidades = $entidad->Find("id_madre = $dato->id_entidad ORDER BY etiqueta");
        $smarty->assign('subunidades', $subunidades);

        $visibilidad = new Visibilidad;
        $visibilidades = $visibilidad->Find("1=1");
        $smarty->assign("visibilidades", $visibilidades);

        $tipo_agregacion = new Tipo_agregacion();
        $tipos_agregacion = $tipo_agregacion->Find("true ORDER BY id");
        $smarty->assign("tipos_agregacion", $tipos_agregacion);

        $usuario_entidad = new Usuario_entidad();
        $usuarios_entidades = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
        $smarty->assign('usuarios_entidades', $usuarios_entidades);

        $dato_subunidad = new Indicador_subunidad();
        $dato_subunidades = $dato_subunidad->Find_entidades("id_indicador = $id_dato");
        $smarty->assign("dato_subunidades", $dato_subunidades);

        $smarty->assign('_javascript', array('dato_editar'));
        $smarty->assign('_nombre_pagina', TXT_DATO_EDIT . ": " . $dato->nombre);
        $plantilla = 'dato_editar.tpl';
    }
    else
    {
        // El usuario no tiene permisos avisamos error
        $error = ERR_DATO_EDIT_NO_AUT;
        header("Location:index.php?page=dato_mostrar&id_dato=$id_dato&error=$error");
    }
}
else
{
    // Faltan parametros avisamos error
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
