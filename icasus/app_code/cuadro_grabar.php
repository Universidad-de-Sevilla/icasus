<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: cuadro_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea un nuevo cuadro de mandos para un usuario
//---------------------------------------------------------------------------------------------------

// Comprueba que vienen los datos mínimos
if (isset($_POST['nombre']) && isset($_POST['privado'])) 
{
	// Guardamos los datos que vienen del formulario
	$cuadro = new cuadro();
  // Si viene el id es que estamos editando uno existente
	if (isset($_POST['id']))
	{
		$id = sanitize($_POST['id'],16);
		$cuadro->load("id = $id");
	}
	$cuadro->id_usuario = $usuario->id;
	$cuadro->nombre = sanitize($_POST['nombre'],2);
	$cuadro->privado = sanitize($_POST['privado'],16);
	$cuadro->comentarios = isset($_POST['comentarios'])?sanitize($_POST['comentarios'],2):'';
	$cuadro->save();
	header("Location: index.php?page=cuadro_mostrar&id=$cuadro->id");
}
else
{
	// Avisamos de error por falta de parametros
	$error = 'Faltan parámetros necesarios para crear un cuadro de mando';
	header("Location: index.php?page=cuadro_listar");
}

?>
