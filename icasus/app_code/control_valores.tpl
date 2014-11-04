<table class="display datatable"> 
    <thead>
        <tr><th>{$smarty.const.FIELD_PROC}</th><th>{$smarty.const.FIELD_UNID}</th><th>{$smarty.const.FIELD_INDIC}</th><th>{$smarty.const.FIELD_FECHA}</th><th>{$smarty.const.FIELD_VAL}</th></tr>
    </thead>
    <tbody>
        {foreach from=$valores item=valor}
            <tr>
                <td>
                    {if $valor.cod_proceso == ''}
                        {$smarty.const.TXT_DATOS}
                    {else}
                        <span style="display:none">{$valor.proceso}</span> {$valor.cod_proceso}
                    {/if}
                </td>
                <td>{$valor.unidad}</td>
                <td>
                    <a href="index.php?page=indicador_mostrar&id_indicador={$valor.id_indicador}&id_entidad={$valor.entidad_del_indicador}" title="Ir al indicador">{$valor.indicador}</a>
                </td>
                <td>{$valor.fecha}</td>
                <td>{if $valor.valor == NULL}<a href="index.php?page=medicion_editar&id_medicion={$valor.id_medicion}&tipo={if $valor.cod_proceso == ''}dato{else}indicador{/if}">{$smarty.const.TXT_NULL}</a>{/if}</td>
            </tr>
        {/foreach}
    </tbody>	
</table>

