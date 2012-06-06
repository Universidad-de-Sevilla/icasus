<h2>Indicador: {$indicador->codigo} - {$indicador->nombre}</h2>

<form name="medicion" id="medicion" action="index.php?page=medicion_grabar" method="post">
  <input type="hidden" name="id_indicador" value="{$indicador->id}" />
  
  <p><label for="etiqueta">Etiqueta</label>
  <input type="input" name="etiqueta" /></p>
  
  <p><label for="periodo_inicio">Inicio del periodo</label>
  <input type="input" name="periodo_inicio" /></p>

  <p><label for="periodo_fin">Fin del periodo</label>
  <input type="input" name="periodo_fin" /></p>

  <p><label for="grabacion_inicio">Inicio de grabación</label>
  <input type="input" name="grabacion_inicio" /></p>
  
  <p><label for="grabacion_fin">Fin de grabación</label>
  <input type="input" name="grabacion_fin" /></p>
  
  <h4>Unidades/subunidades implicadas</h4>
    <input type="checkbox" name="incluye_unidad" checked /> {$entidad->nombre}<hr />
  {foreach $subunidades as $subunidad}
    <input type="checkbox" name="subunidades()" value="{$subunidad->id}" checked /> {$subunidad->nombre}<br />
  {/foreach}
  
  <p><input type="submit" value="Grabar" /></p>
</form>
