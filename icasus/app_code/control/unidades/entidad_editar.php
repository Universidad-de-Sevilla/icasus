<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: unidades/entidad_editar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Edición de entidades existentes
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load_joined("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    if ($control)
    {
        // Si vienen todos los datos necesarios del formulario grabamos
        if (filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'etiqueta') && filter_has_var(INPUT_POST, 'etiqueta_mini') && filter_has_var(INPUT_POST, 'codigo') && filter_has_var(INPUT_POST, 'id_padre'))
        {
            $nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
            $etiqueta = filter_input(INPUT_POST, 'etiqueta', FILTER_SANITIZE_STRING);
            $etiqueta_mini = filter_input(INPUT_POST, 'etiqueta_mini', FILTER_SANITIZE_STRING);
            $id_padre = filter_input(INPUT_POST, 'id_padre', FILTER_SANITIZE_NUMBER_INT);
            $web = filter_has_var(INPUT_POST, 'web') ? filter_input(INPUT_POST, 'web', FILTER_SANITIZE_URL) : '';
            $organica = filter_input(INPUT_POST, 'organica', FILTER_SANITIZE_NUMBER_INT);
            if ($organica == NULL)
            {
                $organica = 0;
            }
            $codigo = filter_has_var(INPUT_POST, 'codigo') ? filter_input(INPUT_POST, 'codigo', FILTER_SANITIZE_STRING) : '';
            $anotaciones = filter_input(INPUT_POST, 'anotaciones', FILTER_SANITIZE_STRING);
            if ($entidad->actualizar($id_entidad, $id_padre, $nombre, $etiqueta, $etiqueta_mini, $web, $organica, $codigo, $anotaciones))
            {
                $smarty->assign('entidad', $entidad);
                $exito = MSG_UNID_EDITADA;
                header("location:index.php?page=entidad_mostrar&id_entidad=$entidad->id&exito=$exito");
            }
            else
            {
                $error = ERR_UNID_EDIT;
                header("location:index.php?page=entidad_mostrar&id_entidad=$entidad->id&error=$error");
            }
        }
        // Si no vienen datos mostramos el formulario
        else
        {
            $madre = $entidad->madre;
            $entidades = $entidad->find("id_madre = 0 OR id_madre = 1 OR id_madre=$madre->id_madre ORDER BY nombre");
            $smarty->assign('_nombre_pagina', TXT_UNID_EDIT . ': ' . $entidad->nombre);
            $smarty->assign('entidades', $entidades);
            $plantilla = 'unidades/entidad_editar.tpl';
        }
    }
    else
    {
        $error = ERR_PERMISOS;
        header("Location: index.php?page=entidad_mostrar&id_entidad=$id_entidad&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
