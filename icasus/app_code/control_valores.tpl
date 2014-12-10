<table class="display datatable"> 
    <thead>
        <tr><th>{$smarty.const.FIELD_PROC}</th><th>{$smarty.const.FIELD_UNID}</th><th>{$smarty.const.FIELD_INDIC}</th><th>{$smarty.const.FIELD_FECHA}</th><th>{$smarty.const.FIELD_VAL}</th><th>{$smarty.const.TXT_CANCEL}</th></tr>
    </thead>
    <tbody>
        {foreach from=$valores item=valor}
            <tr>
                <td>
                    {if $valor.cod_proceso == ''}
                        {$smarty.const.FIELD_DATOS}
                    {else}
                        <span style="display:none">{$valor.proceso}</span> {$valor.cod_proceso}
                    {/if}
                </td>
                <td>{$valor.unidad}</td>
                <td>
                    <a href="index.php?page=indicador_mostrar&id_indicador={$valor.id_indicador}&id_entidad={$valor.entidad_del_indicador}" title="{$smarty.const.TXT_INDIC_IR}">{$valor.indicador}</a>
                </td>
                <td>{$valor.fecha}</td>
                <td>{if $valor.valor == NULL}<a href="index.php?page=medicion_editar&id_medicion={$valor.id_medicion}&tipo={if $valor.cod_proceso == ''}dato{else}indicador{/if}">{$smarty.const.TXT_NULO}</a>{/if}</td>
                <td style="text-align: center">
                    <a class="borrar" data-id_valor="{$valor.id_valor}" data-nombre_val="{$valor.indicador}" data-nombre_unid="{$valor.unidad}" href="#"><img src="/icons/ff16/cancel.png" /></a>
                </td>
            </tr>
        {/foreach}
    </tbody>	
</table>

<!-- dialogo para cancelar el control de valores -->
<div id="dialogo_borrar_control" class="dialog_content narrow ui-dialog-content ui-widget-content">
    <div class="block" style="opacity: 1;" >
        <div class="section" style="padding:20px">
            <p>{$smarty.const.MSG_VAL_DESACT} "<b><span id="nombre_unid"></span> - <span id="nombre_val"></span></b>" </p>
        </div>
    </div>
</div>

<script src="js/control_valores.js" type="text/javascript"></script>
