<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadro_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los cuadros de mando definidos por este usuario
//---------------------------------------------------------------------------------------------------

$cuadro = new Cuadro();
$cuadros = $cuadro->Find("id_usuario = $usuario->id");
$smarty->assign('cuadros_propios', $cuadros);

$cuadros_public = $cuadro->Find("privado = 0");
$smarty->assign('cuadros_publicos', $cuadros_public);

$plantilla = 'cuadro_listar.tpl';
$smarty->assign('_nombre_pagina', TXT_CUADROS_MANDO);

