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

//if (isset($_REQUEST['alias']) OR isset($_REQUEST['id_pagina']))
if (filter_has_var(INPUT_GET, 'alias') or filter_has_var(INPUT_GET, 'id_pagina'))
{
//    $alias = isset($_REQUEST['alias']) ? sanitize($_REQUEST['alias'], SQL) : '';
    $alias = filter_has_var(INPUT_GET, 'alias') ? filter_input(INPUT_GET, 'alias', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : '';
//    $id_pagina = isset($_REQUEST['id_pagina']) ? sanitize($_REQUEST['id_pagina'], INT) : 0;
    $id_pagina = filter_has_var(INPUT_GET, 'id_pagina') ? filter_input(INPUT_GET, 'id_pagina', FILTER_SANITIZE_NUMBER_INT) : 0;
}
else
{
    // Mostramos la página índicia
    $alias = 'indice';
    $id_pagina = 0;
}
$pagina = new Pagina();
$pagina->load("alias = '$alias' OR id=$id_pagina");
$smarty->assign('pagina', $pagina);
$smarty->assign('_nombre_pagina', TXT_AYUDA . ': ' . $pagina->titulo);
$plantilla = 'pagina_mostrar.tpl';

