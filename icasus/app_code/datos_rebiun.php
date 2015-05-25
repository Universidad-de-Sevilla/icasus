<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: datos_rebiun.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

define('ENTIDAD_MADRE', 14);
//define('MEDICIONES', '(1649,1648,1508,1515,1541,1646,1647,1686)');
define('MEDICIONES', '(2289,2255,2256,2253,2252,2249,2248,2198,2197)');
$entidades_autorizadas = array();

$entidad = new Entidad();
// Para no perder la pista de la unidad actual
$entidad->load("id = 14");
$smarty->assign('entidad', $entidad);

$subentidades = $entidad->Find("id_madre = " . ENTIDAD_MADRE);

// Recorre las unidades que tiene asignadas el usuario para encontrar las que tiene con rol de responsable
foreach ($usuario->entidades as $usuario_entidad)
{
    //Solamente entro en aquellas en las que es responsable
    if ($control || $usuario_entidad->id_rol == 1 OR $usuario_entidad->id_rol == 2)
    {
        //Recorre las subunidades de la unidad ENTIDAD_MADRE
        foreach ($subentidades as $subentidad)
        {
            // Comprueba si el usuario es miembro de la subunidad actual
//            if ($usuario_entidad->id_entidad == $subentidad->id)
            {
                // Añade la subunidad actual al array de entidades autorizadas
                $entidades_autorizadas[] = $subentidad;
                $valor = new Valor();
                $valores = $valor->Find_joined_indicador("id_entidad = $subentidad->id AND id_medicion IN " . MEDICIONES);
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
    $smarty->assign("_nombre_pagina", TXT_DATOS_REBIUN_RECOGIDA);
    $plantilla = "datos_rebiun.tpl";
}
else
{
    $error = ERR_NO_AUT_MOD;
    header("location:index.php?page=error&error=$error");
}

