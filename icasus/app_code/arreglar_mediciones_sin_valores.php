<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://forja.rediris.es/projects/icasus/)
// Archivo: 
// Tipo: controlador
//---------------------------------------------------------------------------------------------------

// Normalmente esta página está desactivada redirigiendo a inicio
// header("location: index.php");

$medicion = new medicion();
$db = $medicion->DB();

$query = "select id, id_indicador from mediciones where id_indicador >= 5000 AND id not in (Select id_medicion from valores) order by id_indicador;";
$huerfanitos = $db->getAll($query);
//print_r($huerfanitos);
foreach ($huerfanitos as $huerfanito)
{
  $indicador_subentidad = new indicador_subunidad();
  $subentidades = $indicador_subentidad->Find("id_indicador = " . $huerfanito["id_indicador"]);
  foreach ($subentidades as $subentidad)
  {
    $valor = new valor();
    $valor->id_medicion = $huerfanito["id"];
    $valor->id_entidad = $subentidad->id_entidad;
    $valor->save();
  }
}
?>
