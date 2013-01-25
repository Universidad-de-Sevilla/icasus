{if $modulo == 'seleccionar_años'}
<fieldset class="label">
	<label>Fín del período</label>
	<div>
		<select name="fin"  id="fin" class="select_box">
			{foreach from=$years item=year}
         {if $year->periodo_inicio|truncate:4:'' >= $year_inicio} <option value="{$year->periodo_inicio|truncate:4:''}" >{$year->periodo_inicio|truncate:4:''}</option>{/if}
			{/foreach}
		</select>
		<div class="required_tag"></div>
	</div>
</fieldset>
{elseif $modulo == 'mostrar_valores'}
 <table class="static">
    <thead>
    <tr>
      <th></th><th>Subunidades ajax</th>
      {foreach from=$mediciones item=medicion}
        <th>{$medicion->etiqueta} ({$medicion->id})</th>
      {/foreach}
    </tr>
    </thead>
    <tbody>
    {foreach from=$subunidades_mediciones item=subunidades}
      <tr><td>
        <a class="desactivar_subunidad show_values modal" 
          data-id_indicador = " {$indicador->id}"
          data-id_entidad = "{$subunidades->id_madre}" 
          data-id_subunidad = "{$subunidades->id}" 
          data-subunidad = "{$subunidades->nombre}" 
          data-activar = "0">
          <img src="/icons/ff16/chart_curve_add.png" alt="icono desactivar" title="Desactivar todas las mediciones de {$subunidades->nombre} ">
        </a> 
        <a class="desactivar_subunidad show_values modal" 
          data-id_indicador = "{$indicador->id}" 
          data-id_entidad = "{$subunidades->id_madre}" 
          data-id_subunidad = "{$subunidades->id}" 
          data-subunidad = "{$subunidades->nombre}" 
          data-activar = "1">
        <img src="/icons/ff16/chart_curve_add.png" alt="icono activar" title="Activar todas las mediciones de {$subunidades->nombre} ">
        </a></td><td>{$subunidades->nombre} ->{$subunidades->id}</td>
      {foreach from=$subunidades->mediciones item=medicion}
        <td class="{if $medicion->medicion_valor->activo == 0}valor_inactivo{else}valor_activo{/if}">
          {if $medicion->medicion_valor->_saved == 1}  
            {if $medicion->medicion_valor->valor == ''}---{else}{$medicion->medicion_valor->valor}{/if}
          {/if}
        </td>
      {/foreach}
      </tr>
    {/foreach}
    </tbody>
  </table>
{/if}
