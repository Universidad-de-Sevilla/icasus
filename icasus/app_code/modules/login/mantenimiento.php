<?php

//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: mantenimiento.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>, 
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripción: controlador para la página de mantenimiento
//--------------------------------------------------------------------------

global $smarty;
global $plantilla;
$smarty->assign('_nombre_pagina', TXT_BIENVENIDO);
$plantilla = 'login/mantenimiento.tpl';
