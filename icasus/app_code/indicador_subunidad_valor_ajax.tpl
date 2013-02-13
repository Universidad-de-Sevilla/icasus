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
{elseif $modulo == 'mostrar_valores' OR $modulo == 'activar_individualmente'}
 <table class="static">
    <thead>
    <tr>
      <th></th><th>Subunidades</th>
      {foreach from=$mediciones item=medicion}
        <th>{$medicion->etiqueta}</th>
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
          <img src="/icons/ff16/tick_grey.png" alt="icono desactivar" title="Desactivar todas las mediciones de {$subunidades->nombre} ">
        </a> 
        <a class="desactivar_subunidad show_values modal" 
          data-id_indicador = "{$indicador->id}" 
          data-id_entidad = "{$subunidades->id_madre}" 
          data-id_subunidad = "{$subunidades->id}" 
          data-subunidad = "{$subunidades->nombre}" 
          data-activar = "1">
        <img src="/icons/ff16/tick.png" alt="icono activar" title="Activar todas las mediciones de {$subunidades->nombre} ">
        </a></td><td>{$subunidades->nombre}</td>
      {foreach from=$subunidades->mediciones item=medicion}
      <td class="{if $medicion->medicion_valor->activo == 0}valor_inactivo{else}valor_activo{/if}">
          <span class="modal_activar_una_medicion"  data-etiqueta="{$medicion->etiqueta}" data-id_indicador="{$indicador->id}" data-id_entidad="{$entidad->id}"  data-activo="{$medicion->medicion_valor->activo}" data-subunidad="{$subunidades->nombre}" data-id_medicion="{$medicion->id}" data-id_subunidad="{$subunidades->id}" data-asignada="{$medicion->medicion_valor->_saved}">
						{if $medicion->medicion_valor->_saved == 1}  
							{if $medicion->medicion_valor->valor == ''}---{else}{$medicion->medicion_valor->valor}{/if}
						{else}
							.
						{/if}
					</span>
        </td>
{/foreach}
      </tr>
    {/foreach}
    </tbody>
  </table>
{/if}
