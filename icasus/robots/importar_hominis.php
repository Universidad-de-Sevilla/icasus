<?php
//--------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: droid/importar_hominis.php
//--------------------------------------------------------------------------
//
// Actualización de los datos de personas a partir de hominis
//
//--------------------------------------------------------------------------
include_once('../app_code/app_config.php');
$query = "";

$link = mysql_connect(IC_DB_HOST, IC_DB_LOGIN, IC_DB_CLAVE);
mysql_select_db(IC_DB_DATABASE);

$ruta_completa = IC_DIR_BASE . 'droid/hominis_files/';
echo "Procesando $ruta_completa ...";

if ($directorio = opendir($ruta_completa))
{
  $query = "DELETE FROM hominis;";
  $result = mysql_query($query);

  //$query = "";

  while (false !== ($archivo = readdir($directorio)))
  {
    if (mime_content_type($ruta_completa . $archivo) == "text/plain")
    {
      echo "\nProcesando fichero $ruta_completa" . "$archivo";
      $row = 1;
      if (($handle = fopen($ruta_completa . $archivo, "r")) !== FALSE) 
      {
        while (($line = fgetcsv($handle, 1000, ";")) !== FALSE) 
        {
          $query = "INSERT INTO hominis (nif, apellidos_nombre, cce, desc_cce, grupo, nivel, trj, desc_trj, sit_adva, desc_sitadva, plaza, des_plaza, nrpt, subunidad, unidad, centro_destino, jornada, sexo, email, fecha_nacimiento, titulacion, dnisl, uvus, nombre, apellidos) VALUES (";
          $num = count($line);
          $row++;
          for ($c=0; $c < $num; $c++) 
          {
            $cell = $line[$c];
            if ($c == 0)
            {
              if (substr($cell,0,1)<='9')
              {
                // Quitamos la letra de los nif españoles para dni_sin_letra
                $dni = explode('-', $cell);
                $dnisl = $dni[0];
              }
              else
              {
                // El dni_sin_letra para extranjeros lleva letras pero no guiones
                $dnisl = str_replace('-', '', $cell);
              }
              // Este es para el nif sin guión
              $cell = str_replace('-', '', $cell);
              // Como es la primera columna no lleva coma
            }
            elseif ($c == 1)
            {
              // Convierte "apellidos, nombre" en nombre y apellidos
              $apellidos_nombre = explode(', ', $cell); 
              $apellidos = $apellidos_nombre[0];
              $nombre = $apellidos_nombre[1];
              $query .= ",";
            }
            elseif ($c == 18)
            {
              $correo = explode('@', $cell);
              $uvus = $correo[0];
              $query .= ",";
            }
            elseif ($c == 19)
            {
              $fn = explode('/', $cell);
              $cell = $fn[2] . '/' . $fn[1] . '/' . $fn[0];
              $query .= ",";
            }
            else
            {
              $query .= ",";
            }
            $query .= "'$cell'";
          }
          $query .= ",'$dnisl','$uvus','$nombre','$apellidos'); ";
          $result = mysql_query($query);
          if (!$result)
          {
            print(mysql_error());
          }
        }
        fclose($handle);
      }
    }
  }
  closedir($directorio);

  print("\n" . $query . "\n");
  
  // Ahora comienza el volcado de la tabla 'hominis' a la tabla 'personas'
  $mensaje = '';

  //$query4 = "SELECT * FROM persona WHERE personas.unidad IS NOT NULL AND personas.unidad <> '' AND personas.nif NOT IN (SELECT nif FROM hominis);";
 
  // Insertamos nuevas personas en la tabla persona desde la tabla hominis
  $query1 = "INSERT INTO personas ( nif, apellidos, nombre, codigo_cce, descripcion_cce, grupo, nivel, t_r_juridico, situacion_admin, codigo_plaza, puesto_trabajo, codigo_rpt, subunidad, unidad, centro_destino, turno, sexo, correo3, fecha_nacimiento, titulacion, dni_sin_letra, uvus) SELECT nif, apellidos, nombre, cce, desc_cce, grupo, nivel, trj, desc_sitadva, plaza, des_plaza, nrpt, subunidad, unidad, centro_destino, jornada, sexo, email, fecha_nacimiento, titulacion, dnisl, uvus FROM hominis WHERE (nif Not In (SELECT nif FROM personas));";
  if ($result = mysql_query($query1))
  {
    $mensaje .= "\nPersonas nuevas agregadas";
  }
  else
  {
    $mensaje .= "\n" . mysql_error();
  }
  
  // Modificar datos de personas existentes (están en activo pero han cambiado de plaza)
  $query2 = "UPDATE personas, hominis SET personas.apellidos = hominis.apellidos, personas.nombre = hominis.nombre, personas.descripcion_cce = hominis.desc_cce, personas.codigo_cce = hominis.cce, personas.grupo = hominis.grupo, personas.nivel = hominis.nivel, personas.puesto_trabajo = hominis.des_plaza, personas.codigo_rpt = hominis.nrpt, personas.subunidad = hominis.subunidad, personas.unidad = hominis.unidad, personas.centro_destino = hominis.centro_destino, personas.t_r_juridico = hominis.trj, personas.situacion_admin = hominis.desc_sitadva, personas.codigo_plaza = hominis.plaza, personas.turno = hominis.jornada, personas.sexo = hominis.sexo, personas.correo3 = hominis.email, personas.fecha_nacimiento = hominis.fecha_nacimiento, personas.titulacion = hominis.titulacion, personas.dni_sin_letra =  hominis.dnisl WHERE personas.nif = hominis.nif;";
  if ($result = mysql_query($query2))
  {
   $mensaje .= "\nPersonas existentes modificadas";
  }
  else
  {
    $mensaje .= "\n" . mysql_error();
  }
  
  
  // Dejamos en blanco los campos relativos a la plaza de personas que cesan actividad
  $query3 = "UPDATE personas SET personas.descripcion_cce = '', personas.codigo_cce = '', personas.grupo = '', personas.nivel = '', personas.puesto_trabajo = '', personas.codigo_rpt = '', personas.subunidad = '', personas.unidad = '', personas.centro_destino = '', personas.t_r_juridico = '', personas.situacion_admin = '', personas.codigo_plaza = '', personas.telefono_trabajo = '', personas.turno = '', personas.validador2 = '', personas.validador1 = '' WHERE (((personas.nif) Not In (SELECT nif FROM hominis)));";
  if ($result = mysql_query($query3))
  {
    $mensaje .= "\nPersonas cesadas con plazas en blanco";
  }
  else
  {
    $mensaje .= "\n" . mysql_error();
  }

  // Comprobamos si hay duplicados
  // $query = "SELECT apellidos, nombre, COUNT(*) AS duplicado FROM personas GROUP BY apellidos, nombre HAVING duplicado > 1";
  
  print ($mensaje . "\n");
} 

