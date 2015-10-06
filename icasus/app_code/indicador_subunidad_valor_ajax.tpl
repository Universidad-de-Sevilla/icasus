{if $modulo == 'seleccionar_años'}
    <label for="fin">{$smarty.const.FIELD_FIN_PERIODO}</label>            
    <select class="form-control" name="fin" id="fin">
        {foreach from=$years item=year}
            {if $year->periodo_inicio|truncate:4:'' >= $year_inicio} <option value="{$year->periodo_inicio|truncate:4:''}" >{$year->periodo_inicio|truncate:4:''}</option>{/if}
        {/foreach}
    </select>                
{elseif $modulo == 'mostrar_valores' OR $modulo == 'asignar_una_medicion' OR $modulo == 'activar_all' OR $modulo == 'activar_uno'}
    {include file="indicador_subunidad_valor_mostrar.tpl"}
{/if}

{*Recargamos chosen-select tras petición ajax*}
<script>
    $('#fin').chosen({
        disable_search_threshold: 10,
        no_results_text: "Oops, no se encuentran registros coincidentes"
    });
</script>