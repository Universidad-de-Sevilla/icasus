 <h2>Indicador: {$indicador->codigo} - {$indicador->nombre}</h2>

<form name="medicion" id="medicion" action="index.php?page=medicion_grabar" method="post">
  <input type="hidden" name="id_indicador" value="{$indicador->id}" />
  
  <p><label for="etiqueta">Etiqueta</label>
  <input type="input" name="etiqueta" /></p>
  
  <p><label for="periodo_inicio">Inicio del periodo</label>
	{html_select_date field_order='DMY' end_year=$smarty.now|date_format:"%Y"+2 prefix="pi" month_format='%m'}
  </p>

  <p><label for="periodo_fin">Fin del periodo</label>
	{html_select_date field_order='DMY' end_year=$smarty.now|date_format:"%Y"+2 prefix="pf" month_format='%m'}
 </p>

  <p><label for="grabacion_inicio">Inicio de grabación</label>
	{html_select_date field_order='DMY' end_year=$smarty.now|date_format:"%Y"+2 prefix="gi" month_format='%m'}
  </p>
  
  <p><label for="grabacion_fin">Fin de grabación</label>
	{html_select_date field_order='DMY' end_year=$smarty.now|date_format:"%Y"+2 prefix="gf" month_format='%m'}
  </p>
  
  <h4>Unidades/subunidades implicadas</h4>
    <input type="checkbox" name="id_unidades[]" value="{$entidad->id}" checked /> {$entidad->nombre}<hr />
    {foreach $subunidades as $subunidad}
      <input type="checkbox" name="id_unidades[]" value="{$subunidad->id}" checked /> {$subunidad->nombre}<br />
    {/foreach}
  
  <p><input type="submit" value="Grabar" /></p>
</form>
