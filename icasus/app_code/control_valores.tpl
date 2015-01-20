<div class="button_bar clear_fix">
    <h3>{$smarty.const.TXT_INDIC_DAT_MED_NULA}</h3>
</div>
<form action='index.php?page=control&modulo=inicio&id_entidad={$entidad->id}' method='post' class='formdiv' name='formdiv' onsubmit="return confirm('{$smarty.const.MSG_VALS_CONFIRM_DESACT}');">
    <table class="display datatable"> 
        <thead>
            <tr><th></th><th>{$smarty.const.FIELD_PROC}</th><th>{$smarty.const.FIELD_UNID}</th><th>{$smarty.const.FIELD_INDIC} / {$smarty.const.TXT_DATO}</th><th>{$smarty.const.FIELD_FECHA}</th><th>{$smarty.const.FIELD_VAL}</th></tr>
        </thead>
        <tbody>
            {foreach from=$valores item=valor}
                <tr>
                    <td><input type='checkbox' name='id_valor[]' value='{$valor.id_valor}'/></td>
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
                    <td>{if $valor.valor == NULL}<a href="index.php?page=medicion_editar&id_entidad={$valor.entidad_del_indicador}&id_medicion={$valor.id_medicion}&tipo={if $valor.cod_proceso == ''}dato{else}indicador{/if}">{$smarty.const.TXT_NULO}</a>{/if}</td>
                </tr>
            {/foreach}
        </tbody>	
    </table>
    <div class="button_bar clearfix">
        <button class="green send_right" type="submit" value="" name="enviar">
            <span>{$smarty.const.TXT_VALS_DESACT}</span>
        </button>
    </div>
</form>

<div class="button_bar clear_fix">
    <h3>{$smarty.const.TXT_INDIC_DAT_SIN_MED}</h3>
</div>
<table class="display datatable"> 
    <thead>
        <tr>
            <th>{$smarty.const.FIELD_PROC}</th>        
            <th>{$smarty.const.FIELD_INDIC} / {$smarty.const.TXT_DATO}</th>
        </tr>
    </thead>
    <tbody>
        {foreach from=$indicadores_sin_med item=indicador}
            <tr>
                <td>{$indicador.proceso}</td>
                <td>
                    <a href="index.php?page=indicador_mostrar&id_indicador={$indicador.id_indicador}&id_entidad={$indicador.id_entidad}" title="{$smarty.const.TXT_INDIC_IR}">
                        {$indicador.indicador}
                    </a>
                </td>
            </tr>
        {/foreach}
    </tbody>	
</table>
