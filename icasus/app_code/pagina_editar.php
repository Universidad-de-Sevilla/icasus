<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: pagina_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Edita una pagina existente, en principio para la ayuda
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_pagina'))
{
    $pagina = new Pagina();
    $id_pagina = filter_input(INPUT_GET, 'id_pagina', FILTER_SANITIZE_NUMBER_INT);
    if (filter_has_var(INPUT_POST, 'titulo') && filter_has_var(INPUT_POST, 'alias') && filter_has_var(INPUT_POST, 'contenido'))
    {
        $pagina->load("id=$id_pagina");
        $pagina->titulo = filter_input(INPUT_POST, 'titulo');
        $pagina->alias = $pagina->alieniza(filter_input(INPUT_POST, 'alias'));
        $pagina->contenido = filter_input(INPUT_POST, 'contenido');
        $pagina->modified = time();
        $pagina->save();
        $smarty->assign('exito', MSG_PAG_EDIT_OK);
        $plantilla = 'pagina_mostrar.tpl';
    }
    else
    {
        $pagina->load("id=$id_pagina");
        $plantilla = 'pagina_editar.tpl';
    }
    $smarty->assign('pagina', $pagina);
    $smarty->assign('_nombre_pagina', TXT_AYUDA . ': ' . $pagina->titulo);
}
else
{
    // Si no vienen datos suficientes en el post ni el get lanzamos error
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
