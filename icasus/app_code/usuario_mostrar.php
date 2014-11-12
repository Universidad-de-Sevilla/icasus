<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: usuario_mostrar.php
//---------------------------------------------------------------------------------------------------
// Muestra los datos de un usuario y las entidades a las que pertenece
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;
global $usuario;

if ($_REQUEST['id_usuario'])
{
    $id_usuario = sanitize($_REQUEST['id_usuario'], INT);
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
