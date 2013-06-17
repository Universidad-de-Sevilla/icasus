<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: volcado_grabar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba el contenido de un  fichero (en principio CSV) en la base de datos
//---------------------------------------------------------------------------------------------------

if (isset($_FILES))
{
  
  $row = 1;
  $manejador = fopen($_FILES[0], "r");

  if ($manejador !== FALSE) 
  {
    while (($data = fgetcsv($manejador, 1000, ",")) !== FALSE) 
    {
      $num = count($data);
      echo "<p> $num fields in line $row: <br /></p>\n";
      $row++;
      for ($c=0; $c < $num; $c++) 
      {
        echo $data[$c] . "<br />\n";
      }
    }
    fclose($manejador);
  }
  $indicador = new indicador();
}
else
{
  $error = 'No se ha especificado ningún archivo para subir';
  header("Location: index.php?page=volcado_subir&error=$error");
}


//global $DB;
//print_r($DB);
//$DB = $indicador->DB();
//echo $DB->Insert_ID();
//echo $DB->date();
//echo $DB->Date();
//print_r($DB);
?>

