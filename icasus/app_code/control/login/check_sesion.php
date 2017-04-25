<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: login/check_sesion.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Comprueba si hay una sesión activa
//------------------------------------------------------------------------------

$resultado = 0; //Por defecto
if (isset($_SESSION['usuario']))
{
    //Sesión activa
    $resultado = 1;
}

$smarty->assign('resultado', $resultado);
$plantilla = 'login/check_sesion.tpl';
