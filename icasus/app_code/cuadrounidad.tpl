
<h3>Indicadores propios de la Unidad</h3>
{if $indicadores_propios}
<ul>
{foreach from=$indicadores_propios item=item}
<li id="{$item->id}" class="ver">{$item->id} - {$item->nombre}</li>
<li id="grafica_{$item->id}" style="display:"><img src="index.php?page=grafica_indicador_agregado&id_indicador={$item->id}"></li>
{/foreach}
</ul>
{else}
Esta Unidad no tiene indicadores propios
{/if}
<h3>Indicadores desagregados en los que mide la Unidad</h3>
{if $indicadores_desagregados}
<ul>
{foreach from=$indicadores_desagregados item=item}
<li id="{$item.id}" class="ver">{$item.id} - {$item.nombre}</li>
<li id="grafica_{$item.id}" style="display:"><img src="index.php?page=grafica_indicador_agregado&id_indicador={$item.id}"></li>
{/foreach}
</ul>
{else}
Esta Unidad no mide indicadores desagregados
{/if}
