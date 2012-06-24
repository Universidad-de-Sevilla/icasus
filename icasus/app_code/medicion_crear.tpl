 <h2>Indicador: {$indicador->codigo} - {$indicador->nombre}</h2>

<form name="medicion" id="medicion" action="index.php?page=medicion_grabar" method="post">
  <input type="hidden" name="id_indicador" value="{$indicador->id}" />
  
  <p><label for="etiqueta">Etiqueta</label>
  <input type="input" name="etiqueta" /></p>
  
  <p><label for="periodo_inicio">Inicio del periodo</label>
	{html_select_date field_order='DMY' start_year="-10"  end_year="+5" prefix="pi" month_format='%m'}
  </p>

  <p><label for="periodo_fin">Fin del periodo</label>
	{html_select_date field_order='DMY' start_year="-10" end_year="+5" prefix="pf" month_format='%m'}
 </p>

  <p><label for="grabacion_inicio">Inicio de grabación</label>
	{html_select_date field_order='DMY' start_year="-10"  end_year="+5" prefix="gi" month_format='%m'}
  </p>
  
  <p><label for="grabacion_fin">Fin de grabación</label>
	{html_select_date field_order='DMY' start_year="-10" end_year="+5" prefix="gf" month_format='%m'}
  </p>
  
  <fieldset >
    <legend>Valores de Referencia</legend>
    {if $valores_referencia}
      {foreach $valores_referencia as $valor_referencia}
        <p><label for="valor_referencia[{$valor_referencia->id}]">{$valor_referencia->etiqueta}
        <input type="input" name="valor_referencia[{$valor_referencia->id}]" />
        </p>
      {/foreach}
    {else}
      <p>No se han definido valores de referencia para este indicador</p>
    {/if}
  </fieldset>
  
  <p><input type="submit" value="Grabar" /></p>
</form>
