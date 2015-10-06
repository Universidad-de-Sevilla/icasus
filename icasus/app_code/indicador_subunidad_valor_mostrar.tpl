<div class="table-responsive">
    <table class="table table-striped table-hover" data-id_indicador="{$indicador->id}" data-id_entidad="{$entidad->id}">
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
                    <td>
                        <i title="{$smarty.const.TXT_ACT_DESACT}" class="fa fa-plus-square-o fa-fw activar_all" style="cursor:pointer"></i>
                    </td>
                    <td>{$subunidades->etiqueta}</td>
                    {foreach from=$subunidades->mediciones item=medicion}
                        <td data-etiqueta="{$medicion->etiqueta}" data-id_medicion="{$medicion->id}">
                            {if $medicion->medicion_valor->_saved == 1}  
                                <input class="form-control activar_uno"  type="checkbox"
                                       data-toggle="toggle" data-on="{$smarty.const.TXT_VAL_ACTIVO}"
                                       data-onstyle="success" data-offstyle="danger" data-size="mini"
                                       data-off="{$smarty.const.TXT_VAL_DESACTIVO}"
                                       {if $medicion->medicion_valor->activo == 1}checked="checked"{/if}>
                                <input class="actualizar_dato" data-id_valor="{$medicion->medicion_valor->id}" type="text" value="{$medicion->medicion_valor->valor}" {if $medicion->medicion_valor->activo != 1}disabled="disabled"{/if}>
                            {else}
                                <span title="{$smarty.const.TXT_ACT_DESACT}" class="badge no_asignada" style="cursor:pointer">{$smarty.const.TXT_NO_ASIG}</span>
                            {/if}
                        </td>
                    {/foreach}
                </tr>
            {/foreach}
        </tbody>
    </table>
</div>