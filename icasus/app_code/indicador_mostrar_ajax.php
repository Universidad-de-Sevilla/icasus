<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: indicador_crear.php
//---------------------------------------------------------------------------------------------------
// Creación de nuevos indicadores
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (isset($_REQUEST["id_entidad"]) AND isset($_REQUEST["id_indicador"]))
{
	$id_indicador = sanitize($_REQUEST["id_indicador"],2);
	$id_entidad = sanitize($_REQUEST["id_entidad"],2);

	$indicador = new indicador();
	$indicador->load ("id = $id_indicador");

	$entidad = new entidad();
	$entidad->load("id = $id_entidad");

	$usuario_entidad = new usuario_entidad();
	$usuario_entidad->load("id_entidad = $id_entidad AND rol = 1");

	//vemos cual es el usuairo que debe cumplimentar las mediciones segun campo segregado
	if ($indicador->desagregado == 0 OR $indicador->desagregado == 2)
	{
		$id_usuario = $indicador->id_responsable_medicion;
	}
	elseif ($indicador->desagregado == 1)
	{
		$id_usuario = $usuario_entidad->id_usuario;
	}
	else
	{
		$id_usuario = $indicador->id_responsable_medicion;
	}

	$indicador_subunidad = new indicador_subunidad();
	if ($indicador_subunidad->load("id_indicador= $id_indicador AND id_entidad = $id_entidad"))
	{
		$indicador_subunidad->delete();
	}
	else
	{
		$indicador_subunidad->id_indicador = $id_indicador;
		$indicador_subunidad->id_entidad = $id_entidad;
		$indicador_subunidad->id_usuario = $id_usuario;
		if ($indicador_subunidad->save())
		{
  /*
	escribir el exito en el log ya que al ser ajax no se ve en la página
	*/
		}
		else
		{
  /*
	escribir el error en el log ya que al ser ajax no se ve en la página
	*/
		}
	}
}
else
{
  /*
	escribir el error en el log ya que al ser ajax no se ve en la página
*/	
}
?>
