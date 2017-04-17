<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicadores/datos_rebiun.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Controlador para la página datos_rebiun.tpl
//--------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);
    $subentidades = $entidad->Find("id_madre = $id_entidad");
    $entidades_autorizadas = array();
    define('DATOS_REBIUN', '(5219,5102,5099,5100,5103,5104,5106,5107,5142)');
    //Grabamos mediciones del año anterior
    $anyo = idate('Y') - 1;
    $medicion = new Medicion();
    $mediciones = $medicion->Find("etiqueta like '$anyo%' AND id_indicador IN " . DATOS_REBIUN);
    $mediciones_anyo = array();
    if ($mediciones)
    {
        foreach ($mediciones as $med)
        {
            array_push($mediciones_anyo, $med->id);
        }
        $mediciones_sql = '(' . implode(',', $mediciones_anyo) . ')';

        // Recorre las unidades que tiene asignadas el usuario para encontrar las que tiene con rol de responsable
        foreach ($usuario->entidades as $usuario_entidad)
        {
            //Solamente entro en aquellas en las que es responsable
            if ($usuario_entidad->id_rol == 1 OR $usuario_entidad->id_rol == 2)
            {
                //Recorre las subunidades
                foreach ($subentidades as $subentidad)
                {
                    // Comprueba si el usuario es miembro de la subunidad actual
                    if ($usuario_entidad->id_entidad == $subentidad->id)
                    {
                        // Añade la subunidad actual al array de entidades autorizadas
                        $entidades_autorizadas[] = $subentidad;
                        $valor = new Valor();
                        $valores = $valor->Find_joined_indicador("id_entidad = $subentidad->id AND id_medicion IN " . "$mediciones_sql");
                        $subentidad->valores = $valores;
                    }
                }
            }
        }
        if (count($entidades_autorizadas) > 0)
        {
            $smarty->assign("id_usuario", $usuario->id);
            $smarty->assign("entidades", $entidades_autorizadas);
            $smarty->assign("valores", $valores);
            $smarty->assign('_javascript', array('datos_rebiun'));
            $smarty->assign("_nombre_pagina", TXT_DATOS_REBIUN_RECOGIDA);
            $plantilla = "indicadores/datos_rebiun.tpl";
        }
        else
        {
            $error = ERR_PERMISOS;
            header("location:index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
        }
    }
    else
    {
        $aviso = MSG_MED_NO_REBIUN;
        header("location:index.php?page=indicador_listar&id_entidad=$id_entidad&aviso=$aviso");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
