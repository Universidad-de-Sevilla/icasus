<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: datos_rebiun_grabar.php
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
global $usuario;
global $plantilla;
$plantilla = "plantilla_blanca.tpl";

$autorizado = false;

if (isset($_REQUEST['id_valor']) &&  isset($_REQUEST['id_entidad']) && isset($_REQUEST['valor_parcial']))
{
  //Comprobamos si el usuario es responsable en la unidad donde quiere grabar
  foreach($usuario->entidades as $usuario_entidad)
  {
    if($usuario_entidad->id_entidad == $_REQUEST['id_entidad'] && $usuario_entidad->id_rol == 1)
    {
      $autorizado = true;
    }
  }

  if ($autorizado)
  {
    $valor = new valor();
    $id_valor = sanitize($_REQUEST['id_valor'], INT);
    $valor->load("id = $id_valor");
    $valor->valor_parcial = sanitize($_REQUEST['valor_parcial'], FLOAT); 
    $valor->id_usuario = $usuario->id;
    $valor->fecha_recogida = date("Y-m-d");           
    $valor->save();
  }
}
?>
