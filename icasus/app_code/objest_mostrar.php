<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: objest_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página principal de un objetivo estratégico
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_linea') AND filter_has_var(INPUT_GET, 'id_objest'))
{
    $id_objest = filter_input(INPUT_GET, 'id_objest', FILTER_SANITIZE_NUMBER_INT);
    $id_linea = filter_input(INPUT_GET, 'id_linea', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos del objetivo estratégico
    $objest = new ObjetivoEstrategico();
    $objest->load("id = $id_objest");
    $smarty->assign('objest', $objest);

    //Obtener todos los objetivos estratégicos para avanzar o retroceder 
    $objests = $objest->Find("id_linea = $id_linea");
    $smarty->assign("objests", $objests);
    $cont = 0;
    foreach ($objests as $obj)
    {
        if ($id_objest == $obj->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Obtenemos los datos de la línea y del plan
    $linea = new Linea();
    $linea->load_joined("id = $id_linea");
    $smarty->assign('linea', $linea);
    $smarty->assign('plan', $linea->plan);

    //Obtenemos sus ejecuciones anuales
    $ejecucion = new Ejecucion();
    $ejecucion_anual = array();
    for ($i = $linea->plan->anyo_inicio; $i <= ($linea->plan->anyo_inicio + $linea->plan->duracion); $i++)
    {
        if ($ejecucion->Load("id_objest=$objest->id AND anyo=$i"))
        {
            $ejecucion_anual[$i] = $ejecucion->valor;
        }
        else
        {
            $ejecucion_anual[$i] = 0;
        }
    }
    $smarty->assign("ejecucion_anual", $ejecucion_anual);

    $entidad = new Entidad();
    $id_entidad = $linea->plan->id_entidad;
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('objest_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_OBJ_EST . ": " . $linea->indice . "." . $objest->indice . ". " . $objest->nombre);
    $plantilla = 'objest_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
