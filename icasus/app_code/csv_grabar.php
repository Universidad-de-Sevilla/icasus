<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: csv_grabar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba el contenido de un  fichero CSV en la base de datos
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;
global $usuario;
$usuario_entidad = new usuario_entidad();

if (isset($_FILES, $_REQUEST['id_entidad']))
{
	$id_entidad = sanitize($_REQUEST['id_entidad'],INT);

  // Comprobamos que el usuario esté autorizado
  if ($usuario_entidad->comprobar_responsable_entidad($usuario->id, $id_entidad))
  {
    $ficheros_procesados = 0;
    $registros_grabados = 0; //los que realmente se graban 
    $registros_ajenos = 0; // los que no pertenecen a la entidad actual
    $registros_totales = 0;

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
          $ficheros_procesados ++;
          while (($datos = fgetcsv($manejador, 1000, ",", "'")) !== FALSE) 
          {
            $registros_totales ++;
            $medicion = new medicion();
            $medicion->id_indicador = $datos[0];
            $medicion->periodo_inicio = $datos[1];
            $medicion->periodo_fin = $datos[2];
            $medicion->etiqueta = $datos[3];
            // Comprobamos que el indicador pertenece a la entidad actual o a su madre
            // Podría optimizarse comprobando si el indicador a cambiado respecto al anterior
            $indicador = new indicador();
            $entidad = new entidad();
            $indicador->load("id = $medicion->id_indicador");
            $entidad->load("id = $indicador->id_entidad");
            if ($indicador->id_entidad == $id_entidad OR $entidad->id_madre == $id_entidad)
            {         
              if ($medicion->save())
              {
                $valor = new valor();
                $valor->id_medicion = $medicion->id;
                $valor->id_usuario = $usuario->id;
                $valor->id_entidad = $id_entidad;
                $valor->fecha_recogida = date('Y-m-d h:m:i');
                $valor->valor_parcial = $datos[4];
                $valor->valor = $datos[4];
                if ($valor->save())
                {
                  $registros_grabados ++;
                }
              }
            }
            else
            {
              $registros_ajenos ++;
            }
          }
          fclose($manejador);
        }
        // $indicador = new indicador();
      }
    }
    $aviso = "Se han procesado $ficheros_procesados ficheros y $registros_totales mediciones. Se han grabado $registros_grabados mediciones."; 
    header("Location: index.php?page=csv_importar&id_entidad=$id_entidad&aviso=$aviso");
  }
  else
  {
    $error = 'No tiene autorización para importar datos en esta unidad';
    header('location:index.php?error=' . $error);
  }

}
else
{
  $error = 'No se ha especificado ningún archivo para subir';
  header("Location: index.php?page=csv_importar&error=$error");
}
?>
