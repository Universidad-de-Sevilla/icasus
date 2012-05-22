<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: nota_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba las notas en la tabla usuario
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $adodb;

$id_usuario=$operario->id_usuario;
$nota=sanitize($_POST['notas'],2);

$consulta="UPDATE usuario SET mis_notas ='$nota' WHERE id_usuario =$id_usuario";
if ($adodb->execute($consulta))
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
