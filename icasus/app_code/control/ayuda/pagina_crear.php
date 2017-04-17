<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: ayuda/pagina_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Crea una nueva pagina en icasus, en principio para la ayuda
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;
global $usuario;

// Sólo administradores de Icasus pueden crear páginas
$admin = false;
foreach ($usuario->entidades as $entidad)
{
    if ($entidad->id_entidad == 1 && ($entidad->id_rol == 1 || $entidad->id_rol == 2))
    {
        $admin = true;
    }
}

if ($admin)
{
    if (filter_has_var(INPUT_POST, 'alias') && filter_has_var(INPUT_POST, 'titulo') && filter_has_var(INPUT_POST, 'contenido'))
    {
        // Guardamos los datos que vienen del formulario
        $pagina = new Pagina();
        $pagina->alias = $pagina->alieniza(filter_input(INPUT_POST, 'alias'));
        $pagina->titulo = filter_input(INPUT_POST, 'titulo', FILTER_SANITIZE_STRING);
        $pagina->contenido = filter_input(INPUT_POST, 'contenido');
        $pagina->modified = time();
        $pagina->save();
        $smarty->assign('pagina', $pagina);
        $smarty->assign('_nombre_pagina', TXT_AYUDA . ': ' . $pagina->titulo);
        $smarty->assign('exito', MSG_PAG_NUEVA_OK);
        $plantilla = 'pagina_mostrar.tpl';
    }
    else
    {
        // Mostramos el formulario
        $smarty->assign('_nombre_pagina', TXT_PAG_CREAR);
        $plantilla = 'ayuda/pagina_crear.tpl';
    }
}
else
{
    $error = ERR_PERMISOS;
    header("location:index.php?page=error&error=$error");
}
