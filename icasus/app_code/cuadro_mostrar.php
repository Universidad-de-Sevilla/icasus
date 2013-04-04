<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadro_mostrar.php
//---------------------------------------------------------------------------------------------------
// Muestra un cuadro de mando con todos sus paneles
//---------------------------------------------------------------------------------------------------

if (isset($_REQUEST))
{
  $id_cuadro = 1;
  $cuadro = new cuadro();
  $cuadro->load("id = $id_cuadro");
  $smarty->assign("cuadro", $cuadro);

  $panel = new panel();
  $paneles = $panel->Find_joined("id_cuadro = $id_cuadro");
  $smarty->assign("paneles", $paneles);

  $smarty->assign("_nombre_pagina", "$cuadro->nombre");
  $plantilla = "cuadro_mostrar.tpl";
}
else
{
  $error = "Parametros insuficientes para mostrar el widget";
  header("location:index.php?page=error&error=$error");
}
?>
