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

    //Obtener todas las unidades para avanzar o retroceder 
    $unidades = $entidad->Find("es_organica = 1");
    $smarty->assign("unidades", $unidades);
    $cont = 0;
    foreach ($unidades as $unid)
    {
        if ($id_entidad == $unid->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Cambio de carácter orgánico vía ajax
    if (filter_has_var(INPUT_GET, 'organica'))
    {
        $organica = filter_input(INPUT_GET, 'organica', FILTER_SANITIZE_NUMBER_INT);
        $entidad->es_organica = $organica;
        $entidad->Save();
    }

    //Usuarios
    $usuarios = $entidad->usuario;
    $smarty->assign('usuarios', $usuarios);

    //Comprobamos si es la entidad principal del usuario
    $principal = false;
    if ($entidad->usuario)
    {
        foreach ($entidad->usuario as $user)
        {
            if ($usuario->id == $user->id_usuario && $user->principal)
            {
                $principal = true;
            }
        }
    }
    $smarty->assign('principal', $principal);

    //Subunidades
    $subentidad = new Entidad();
    $subentidades = $subentidad->Find("id_madre = $id_entidad ORDER by codigo");
    $smarty->assign('subentidades', $subentidades);

    //Archivos
    $archivo = new Fichero();
    $archivos = $archivo->find_joined("id_objeto = $id_entidad AND tipo_objeto = 'unidad' AND visible=1");
    $smarty->assign('archivos', $archivos);

    //Resumen
    $anio_fin = date('Y');
    $smarty->assign('anio_fin', $anio_fin);
    $smarty->assign('procesos', $procesos);
    $i = new Indicador();
    $indicadores = array();
    foreach ($procesos as $proceso)
    {
        $indicadores_proc = $i->find("id_proceso = $proceso->id AND id_entidad = $id_entidad AND archivado IS NULL");
        $indicadores[$proceso->id] = $indicadores_proc;
    }
    $smarty->assign('indicadores', $indicadores);
    $datos = $i->Find("id_entidad = $id_entidad AND id_proceso IS NULL AND archivado is NULL");
    $smarty->assign('datos', $datos);

    $smarty->assign('_javascript', array('entidad_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_UNID . ': ' . $entidad->nombre);
    $plantilla = "entidad_mostrar.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
