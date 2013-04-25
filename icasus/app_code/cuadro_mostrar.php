<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadro_mostrar.php
//---------------------------------------------------------------------------------------------------
// Muestra un cuadro de mando con todos sus paneles
//---------------------------------------------------------------------------------------------------

if (isset($_REQUEST["id"]))
{
  $id_cuadro = sanitize($_REQUEST["id"], INT);
  $cuadro = new cuadro();
  $cuadro->load("id = $id_cuadro AND (id_usuario = $usuario->id OR privado = 0)");
  $smarty->assign("cuadro", $cuadro);

  $panel = new panel();
  $paneles = $panel->Find_joined("id_cuadro = $id_cuadro ORDER BY orden");
  $smarty->assign("paneles", $paneles);

  $smarty->assign("_nombre_pagina", "$cuadro->nombre");
  $plantilla = "cuadro_mostrar.tpl";
}
else
{
  $error = "Parametros insuficientes para mostrar el cuadro de mando";
  header("location:index.php?page=error&error=$error");
}
?>
