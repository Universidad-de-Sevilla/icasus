<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: pagina_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Crea una nueva pagina en icasus, en principio para la ayuda
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;

//if (isset($_POST['alias']) && isset($_POST['titulo']) && isset($_POST['contenido'])) 
if (filter_has_var(INPUT_POST, 'alias') && filter_has_var(INPUT_POST, 'titulo') && filter_has_var(INPUT_POST, 'contenido'))
{
    // Guardamos los datos que vienen del formulario
    $pagina = new Pagina();
//    $pagina->alias = $pagina->alieniza($_POST['alias']);
    $pagina->alias = $pagina->alieniza(filter_input(INPUT_POST, 'alias'));
//    $pagina->titulo = $_POST['titulo'];
    $pagina->titulo = filter_input(INPUT_POST, 'titulo');
//    $pagina->contenido = $_POST['contenido'];
    $pagina->contenido = filter_input(INPUT_POST, 'contenido');
    $pagina->modified = time();
    $pagina->save();
    $smarty->assign('pagina', $pagina);
    $smarty->assign('_nombre_pagina', TXT_MANUAL . ': ' . $pagina->titulo);
    $smarty->assign('aviso', MSG_PAG_NUEVA_OK);
    $plantilla = 'pagina_mostrar.tpl';
}
else
{
    // Mostramos el formulario
    $smarty->assign('_nombre_pagina', TXT_PAG_AYUDA_NUEVA);
    $plantilla = 'pagina_crear.tpl';
}

