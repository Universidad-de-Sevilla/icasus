<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: datos_rebiun.php
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

define('ENTIDAD_MADRE', 14);
define('MEDICIONES', '(795,796,799)');
$entidades_autorizadas = array();

$entidad = new entidad();
$subentidades = $entidad->Find("id_madre = ". ENTIDAD_MADRE);

// Recorre las unidades que tiene asignadas el usuario para encontrar las que tiene con rol de responsable
foreach($usuario->entidades as $usuario_entidad)
{
  if($usuario_entidad->id_rol == 1)
  {
    //Comprueba si se trata de una de las subunidades de la unidad ENTIDAD_MADRE
    foreach($subentidades as $subentidad)
    {
      if($usuario_entidad->id_entidad == $subentidad->id)
      {
        $valor = new valor();
        $valores = $valor->Find_joined_indicador("id_entidad = $subentidad->id AND id_medicion IN " . MEDICIONES);
        $subentidad->valores = $valores;
        $entidades_autorizadas[] = $subentidad;
      }
    }
  }
}

if (count($entidades_autorizadas) > 0)
{

  $smarty->assign("id_usuario", $usuario->id);
  $smarty->assign("entidades", $entidades_autorizadas);
  $smarty->assign("valores", $valores);
  $smarty->assign("_nombre_pagina", "Recogida Datos Rebiun");
  $plantilla = "datos_rebiun.tpl";
}
else
{
  $error = "No tiene permisos para acceder a este módulo de la aplicación";
  header("location:index.php?page=error&error=$error");
}
?>
