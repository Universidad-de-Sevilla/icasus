<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: usuario_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra los datos de un usuario y las entidades a las que pertenece
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_usuario'))
{
    $id_usuario = filter_input(INPUT_GET, 'id_usuario', FILTER_SANITIZE_NUMBER_INT);
    $persona = new Usuario();
    $persona->load_joined("id = $id_usuario");
    $smarty->assign('persona', $persona);

    $nombre_pagina = $persona->nombre . ' ' . $persona->apellidos;
    $smarty->assign('_nombre_pagina', $nombre_pagina);
    $plantilla = "usuario_mostrar.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=inicio&error=$error");
}
