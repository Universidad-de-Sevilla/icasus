<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: csv_grabar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba el contenido de un  fichero CSV en la base de datos
//---------------------------------------------------------------------------------------------------
global $usuario;

if (isset($_FILES, $_REQUEST['id_entidad']))
{
  foreach ($_FILES["fichero_csv"]["error"] as $indice => $error)
  {
    // Esto es una guarrería pero está sacada del manual oficial de php.net
    // así que es una "guarrerida oficial"
    if ($error == UPLOAD_ERR_OK) 
    {
      $tmp_name = $_FILES["fichero_csv"]["tmp_name"][$indice];
      $name= $_FILES["fichero_csv"]["name"][$indice];
      $manejador = fopen($tmp_name, "r");

      if ($manejador !== FALSE) 
      {
        while (($datos = fgetcsv($manejador, 1000, ",", "'")) !== FALSE) 
        {
          $num = count($datos);
          $medicion = new medicion();
          $medicion->id_indicador = $datos[0];
          $medicion->fecha_inicio = $datos[1];
          $medicion->fecha_inicio = $datos[2];
          $medicion->etiqueta = $datos[3];
          if ($medicion->save())
          {
            echo $medicion->id;
            $valor = new valor();
            $valor->id_medicion = $medicion->id;
            $valor->id_usuario = $usuario->id;
            $valor->id_entidad = $id_entidad;
            $valor->fecha_recogida = date('Y-m-d h:m:i');
            $valor->valor_parcial = $datos[4];
            $valor->valor = $datos[4];
            $valor->save();
          }
        }
        fclose($manejador);
      }
      $indicador = new indicador();
    }
  }
}
else
{
  $error = 'No se ha especificado ningún archivo para subir';
  header("Location: index.php?page=csv_importar&error=$error");
}
?>
