<table id="tabla_valores" class="table table-striped table-hover" data-id_indicador="{$indicador->id}" data-id_entidad="{$entidad->id}">
    <thead>
        <tr>
            <th></th>
            <th>{$smarty.const.FIELD_SUBUNIDS}</th>
                {foreach from=$mediciones item=medicion}
                <th>{$medicion->etiqueta}</th>
                {/foreach}
        </tr>
    </thead>
    <tbody>
        {foreach from=$subunidades_mediciones item=subunidades}
            <tr data-subunidad="{$subunidades->etiqueta}" data-id_subunidad="{$subunidades->id}">
                <td style="white-space: nowrap">
                    <i title="{$smarty.const.TXT_MED_ACT_TODAS}" class="fa fa-check-square-o fa-fw activar_all clickable"></i>
                    <i title="{$smarty.const.TXT_MED_DESACT_TODAS}" class="fa fa-square-o fa-fw desactivar_all clickable"></i>
                </td>
                <td>
                    <span class="label label-primary">{$subunidades->etiqueta}</span>
                </td>
                {foreach from=$subunidades->mediciones item=medicion}
                    <td data-etiqueta="{$medicion->etiqueta}" data-id_medicion="{$medicion->id}">
                        {if $medicion->medicion_valor->_saved == 1}  
                            <input class="form-control activar_uno"  type="checkbox"
                                   data-toggle="toggle" data-on="{$smarty.const.TXT_VAL_ACTIVO}"
                                   data-onstyle="success" data-offstyle="danger" data-size="mini"
                                   data-off="{$smarty.const.TXT_VAL_INACTIVO}"
                                   data-id_valor="{$medicion->medicion_valor->id}"
                                   {if $medicion->medicion_valor->activo == 1}checked="checked"{/if}>
                            <input title="{$smarty.const.TXT_VAL_INSERT}" id="{$medicion->medicion_valor->id}" class="actualizar_dato" data-id_valor="{$medicion->medicion_valor->id}" type="text" {if $medicion->medicion_valor->valor !== NULL}value="{$medicion->medicion_valor->valor|round:'2'}"{/if} {if $medicion->medicion_valor->activo == 0}disabled="disabled"{/if}>
                        {else}
                            <span title="{$smarty.const.TXT_MED_ASIG}" class="badge no_asignada clickable">{$smarty.const.TXT_NO_ASIG}</span>
                        {/if}
                    </td>
                {/foreach}
            </tr>
        {/foreach}
    </tbody>
</table>