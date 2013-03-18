 <table class="static"
	data-id_indicador="{$indicador->id}" 
	data-id_entidad="{$entidad->id}" 
 >
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
      <tr
				data-subunidad="{$subunidades->nombre}" 
				data-id_subunidad="{$subunidades->id}">
				<td>
				<input type="checkbox" class="activar_all" value="">
				</td>
				<td>{$subunidades->nombre}</td>
      {foreach from=$subunidades->mediciones item=medicion}
        <td 
					data-etiqueta="{$medicion->etiqueta}" 
					data-id_medicion="{$medicion->id}" 
				>
				{if $medicion->medicion_valor->_saved == 1}  
						<input class="activar_uno"  type="checkbox" {if $medicion->medicion_valor->activo == 1}checked="checked"{/if}>
						<input type="text" value="{$medicion->medicion_valor->valor}" {if $medicion->medicion_valor->activo != 1}disabled="disabled"{/if}>
				{else}
						<span class="no_asignada" style="color:grey">No asignado</span>
				{/if}
        </td>
      {/foreach}
      </tr>
    {/foreach}
    </tbody>
  </table>
