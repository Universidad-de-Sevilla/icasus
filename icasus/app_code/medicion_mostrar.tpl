<h3>Datos de la medición</h3>
<p><b>Indicador: </b>{$indicador->codigo} - {$indicador->nombre}</p>
<p><b>Etiqueta: </b>{$medicion->etiqueta}</b></p>
<p><b>Inicio del periodo: </b>{$medicion->periodo_inicio}</b></p>
<p><b>Fin del periodo: </b>{$medicion->periodo_fin}</b></p>
<p><b>Inicio grabación: </b>{$medicion->grabacion_inicio}</b></p>
<p><b>Fin grabación: </b>{$medicion->grabacion_fin}</b></p>


<h3>Valores</h3>
{foreach $valores as $valor}
  <p>{$valor->id_unidad}: {$valor->valor}</p>
{/foreach}
