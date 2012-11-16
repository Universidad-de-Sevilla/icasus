<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: consulta_avanzada.php
//---------------------------------------------------------------------------------------------------
// Consulta a los datos e indicadores, permitiendo hacer operaciones matemáticas sencillas entre ellos.
//  - Genera una tabla de resultados y una gráfica
//  - Permite elegir subunidades
//  - Permite acotar los periodos de medición deseados
//---------------------------------------------------------------------------------------------------

if (isset($_REQUEST['id_indicador']) AND isset($_REQUEST['funcion']))
{
  $id_indicador = sanitize($_REQUEST['id_indicador']);
  $funcion = sanitize($_REQUEST['funcion']);
  $valor = new valor();
  $adodb = $valor->DB();

  if (is_function($funcion))
  {
    $funcion;
  }

  function get_valores_indicador()
  {
    $consulta = "SELECT mediciones.etiqueta, entidades.etiqueta, valores.valor, valores.observaciones 
                FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
                INNER JOIN entidades ON entidades.id = valores.id_entidad
                WHERE mediciones.id_indicador = $id_indicador AND valor IS NOT NULL;"
    $db->Execute($consulta);
    return $resultado;
  }
}
else
{
  $error = "Faltan parámetros para cargar esta página";
}

?>
