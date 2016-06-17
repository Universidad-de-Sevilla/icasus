<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: objop_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripción: muestra el formulario que permite editar un objetivo operacional
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_objop'))
{
    $id_objop = filter_input(INPUT_GET, 'id_objop', FILTER_SANITIZE_NUMBER_INT);
    $objop = new ObjetivoOperacional();
    $objop->load_joined("id=$id_objop");

    //Permisos
    if ($control || $objop->id_responsable == $usuario->id)
    {
        $smarty->assign('objop', $objop);
        $smarty->assign('objest', $objop->objest);
        $smarty->assign('linea', $objop->objest->linea);

        $plan = new Plan();
        $id_plan = $objop->objest->linea->id_plan;
        $plan->load("id=$id_plan");
        $smarty->assign('plan', $plan);

        $entidad = new Entidad();
        $entidad->load("id=$plan->id_entidad");
        $smarty->assign('entidad', $entidad);
        $subunidades = $entidad->Find("id_madre = $entidad->id ORDER BY etiqueta");
        $smarty->assign('subunidades', $subunidades);

        //Responsable
        $usuario_entidad = new Usuario_entidad;
        $usuarios_entidad = $usuario_entidad->Find_usuarios("id_entidad = $entidad->id");
        $smarty->assign("usuarios_entidad", $usuarios_entidad);

        //Indicadores
        $indicador = new Indicador();
        $indicadores = $indicador->Find("id_entidad=$plan->id_entidad");
        $smarty->assign("indicadores", $indicadores);

        //Unidades
        $objetivo_subunidad = new ObjetivoUnidad();
        $objetivo_subunidades = $objetivo_subunidad->Find_entidades("id_objop = $id_objop");
        $smarty->assign("objetivo_subunidades", $objetivo_subunidades);

        //Validar índice de un objetivo operacional
        $id_linea = $objop->objest->id_linea;
        $objest = new ObjetivoEstrategico();
        $objests = $objest->Find_joined("id_linea=$id_linea");
        $smarty->assign('objests', $objests);
        $indices = array();
        foreach ($objests as $obj)
        {
            $indices[$obj->indice] = array();
            $objops = $objop->Find("id_objest=$obj->id");
            foreach ($objops as $o)
            {
                if ($objop->indice != $o->indice)
                {
                    array_push($indices[$obj->indice], $o->indice);
                }
                else if ($objop->id_objest != $obj->id)
                {
                    array_push($indices[$obj->indice], $o->indice);
                }
            }
        }
        $smarty->assign('elementos', $indices);

        $smarty->assign('_javascript', array('objop_editar'));
        $smarty->assign('_nombre_pagina', TXT_OBJOP_EDIT . ': ' . $objop->objest->linea->indice . '.' . $objop->objest->indice . '.' . $objop->indice . '. ' . $objop->nombre);
        $plantilla = 'objop_editar.tpl';
    }
    else
    {
        $error = ERR_PERMISOS;
        header("location:index.php?page=error&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
