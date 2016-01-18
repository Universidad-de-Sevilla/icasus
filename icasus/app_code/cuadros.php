<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadros.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista todos los cuadros de mando
//---------------------------------------------------------------------------------------------------

$cuadro = new Cuadro();
$cuadros = $cuadro->Find_joined("id_usuario = $usuario->id");
$smarty->assign('cuadros_propios', $cuadros);

$cuadros_public = $cuadro->Find_joined("privado = 0");
$smarty->assign('cuadros_publicos', $cuadros_public);

$plantilla = 'cuadros.tpl';
$smarty->assign('_javascript', array('cuadro_listar'));
$smarty->assign('_nombre_pagina', TXT_CUADROS_MANDO_US);
