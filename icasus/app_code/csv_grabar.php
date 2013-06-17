<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: csv_grabar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba el contenido de un  fichero CSV en la base de datos
//---------------------------------------------------------------------------------------------------

if (isset($_FILES))
{
  //print_r($_FILES['fichero_csv']);
  foreach ($_FILES["fichero_csv"]["error"] as $key => $error)
  {
    // Esto es una guarrería pero está sacada del manual oficial de php.net
    // así que es una "guarrerida oficial"
    if ($error == UPLOAD_ERR_OK) 
    {
      $tmp_name = $_FILES["fichero_csv"]["tmp_name"][$key];
      $name= $_FILES["fichero_csv"]["name"][$key];
      $linea = 1;
      $manejador = fopen($tmp_name, "r");

      if ($manejador !== FALSE) 
      {
        while (($datos = fgetcsv($manejador, 1000, ",")) !== FALSE) 
        {
          $num = count($datos);
          echo "<p> $num campos en linea $linea: <br /></p>\n";
          $linea++;
          for ($campo=0; $campo < $num; $campo++) 
          {
            echo $datos[$campo] . "<br />\n";
          }
        }
        fclose($manejador);
      }
      $indicador = new indicador();
    }
  }
  $error = 'Hola';
  header("Location: index.php?page=csv_importar&error=$error");
}
else
{
  $error = 'No se ha especificado ningún archivo para subir';
  header("Location: index.php?page=csv_importar&error=$error");
}
?>
