<?php
global $smarty;
global $plantilla;

if ($_GET['error']) 
{
    $error = sanitize($_GET['error'], 2);
}
else if ($smarty->get_template_vars('error'))
{
    $error = $smarty->get_template_vars('error');
}
else
{
    $error = "Error desconocido";
}

$smarty->assign('_nombre_pagina','Error');
$smarty->assign('error', $error);
$plantilla = 'error.tpl';
?>
