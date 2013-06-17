<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: volcado_grabar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba el contenido de un  fichero (en principio CSV) en la base de datos
//---------------------------------------------------------------------------------------------------

$indicador = new indicador();

//global $DB;
//print_r($DB);
$DB = $indicador->DB();
echo $DB->Insert_ID();
//echo $DB->date();
//echo $DB->Date();
print_r($DB);
?>

