<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: entidad_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página principal de una Unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load_joined("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    // Obtenemos los procesos de la unidad sus indicadores y datos
    $smarty->assign('procesos_propios', $procesos);
    $i = new Indicador();
    $indicadores = array();
    foreach ($procesos as $proceso)
    {
        $indicadores_proc = $i->find("id_proceso = $proceso->id AND id_entidad = $id_entidad");
        $indicadores[$proceso->id] = $indicadores_proc;
    }
    $smarty->assign('indicadores', $indicadores);
    $smarty->assign('datos', $datos);

    //Subunidades
    $subentidad = new Entidad();
    $subentidades = $subentidad->Find("id_madre = $id_entidad ORDER by codigo");
    $smarty->assign('subentidades', $subentidades);

    //Usuarios
    $usuario_entidad = new Usuario_entidad;
    $usuarios = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
    $smarty->assign('usuarios', $usuarios);

    $anio_fin = date('Y') - 1;
    $smarty->assign('anio_fin', $anio_fin);

    $smarty->assign('_javascript', array('entidad_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_UNID . ': ' . $entidad->nombre);
    $plantilla = "entidad_mostrar.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?error=$error");
}
