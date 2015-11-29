<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: pagina_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra una pagina de ayuda
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (filter_has_var(INPUT_GET, 'alias') or filter_has_var(INPUT_GET, 'id_pagina'))
{
    $alias = filter_has_var(INPUT_GET, 'alias') ? filter_input(INPUT_GET, 'alias', FILTER_SANITIZE_STRING) : '';
    $id_pagina = filter_has_var(INPUT_GET, 'id_pagina') ? filter_input(INPUT_GET, 'id_pagina', FILTER_SANITIZE_NUMBER_INT) : 0;
}
else
{
    // Mostramos la página índice
    $alias = 'indice';
    $id_pagina = 0;
}
$pagina = new Pagina();
$pagina->load("alias = '$alias' OR id=$id_pagina");
$smarty->assign('pagina', $pagina);
$smarty->assign('_nombre_pagina', TXT_AYUDA . ': ' . $pagina->titulo);
$plantilla = 'pagina_mostrar.tpl';
