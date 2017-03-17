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
global $usuario;

// Sólo administradores de Icasus pueden editar páginas
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
    if (filter_has_var(INPUT_GET, 'id_pagina'))
    {
        $pagina = new Pagina();
        $id_pagina = filter_input(INPUT_GET, 'id_pagina', FILTER_SANITIZE_NUMBER_INT);
        $pagina->load("id=$id_pagina");
        $smarty->assign('pagina', $pagina);
        $smarty->assign('_nombre_pagina', TXT_PAG_EDIT . ': ' . $pagina->titulo);
        if (filter_has_var(INPUT_POST, 'titulo') && filter_has_var(INPUT_POST, 'alias') && filter_has_var(INPUT_POST, 'contenido'))
        {
            $pagina->titulo = filter_input(INPUT_POST, 'titulo');
            $pagina->alias = $pagina->alieniza(filter_input(INPUT_POST, 'alias'));
            $pagina->contenido = filter_input(INPUT_POST, 'contenido');
            $pagina->modified = time();
            $pagina->save();
            $exito = MSG_PAG_EDIT_OK;
            header("Location: index.php?page=pagina_mostrar&alias=$pagina->alias&exito=$exito");
        }
        else
        {
            $pagina->load("id=$id_pagina");
            $plantilla = 'ayuda/pagina_editar.tpl';
        }
    }
    else
    {
        // Si no vienen datos suficientes en el post ni el get lanzamos error
        $error = ERR_PARAM;
        header("location:index.php?page=error&error=$error");
    }
}
else
{
    $error = ERR_PERMISOS;
    header("location:index.php?page=error&error=$error");
}
