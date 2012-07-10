<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: nota_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba las notas en la tabla usuario
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$id_usuario=$usuario->id_usuario;
$nota=sanitize($_POST['notas'],2);

$usuario->mis_notas = $nota;
if ($usuario->save())
{
    $aviso = "Se han guardado los cambios correctamente.";
    header("location:index.php?page=nota_mostrar&aviso=$aviso");
}
else
{
    $error = "Hubo un problema, no se han podido guardar los cambios.";
    header("location:index.php?page=nota_mostrar&error=$error");
}
?>
