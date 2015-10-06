{if $modulo == 'seleccionar_años'}
<fieldset class="label">
	<label>{$smarty.const.FIELD_FIN_PERIODO}</label>
	<div>
		<select name="fin"  id="fin" class="select_box">
			{foreach from=$years item=year}
         {if $year->periodo_inicio|truncate:4:'' >= $year_inicio} <option value="{$year->periodo_inicio|truncate:4:''}" >{$year->periodo_inicio|truncate:4:''}</option>{/if}
			{/foreach}
		</select>
		<div class="required_tag"></div>
	</div>
</fieldset>
{elseif $modulo == 'mostrar_valores' OR $modulo == 'asignar_una_medicion' OR $modulo == 'activar_all' OR $modulo == 'activar_uno'}
	{include file="indicador_subunidad_valor_mostrar.tpl"}
{/if}
