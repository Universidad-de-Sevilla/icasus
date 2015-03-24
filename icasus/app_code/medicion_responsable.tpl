<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_UNIDS_MEDS_INDIC}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">	
            <div class="button_bar clearfix">
                <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <img src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_VOLVER} {$tipo}</a>
            </div>
            {if $indicadores_subunidades }
                <table class="static">
                    <thead><tr><th>{$smarty.const.FIELD_UNID}</th><th>{$smarty.const.FIELD_RESP_GRABAR}</th><th>{$smarty.const.FIELD_PUESTO}</th><th>{$smarty.const.FIELD_CAMBIO_A}</th></tr></thead>
                    <tbody>
                        {foreach from=$indicadores_subunidades item=indicador_subunidad}
                            <tr>
                                <td>{$indicador_subunidad->entidad->nombre}</td>
                                <td>{$indicador_subunidad->usuario->nombre} {$indicador_subunidad->usuario->apellidos}</td>
                                <td>{$indicador_subunidad->usuario->puesto}</td>
                                <td>
                                    {if $indicador_subunidad->entidad->usuario}
                                        <select id="{$indicador_subunidad->id}" name="responsable" class="identificador">
                                            <option value="0">{$smarty.const.TXT_SEL_RESP_GRABAR}</option>
                                            {foreach from=$indicador_subunidad->entidad->usuario item=item}
                                                {if $item->id_usuario != $indicador_subunidad->id_usuario}
                                                    <option value="{$item->usuario->id}">{$item->usuario->nombre} {$item->usuario->apellidos}</option>
                                                {/if}
                                            {/foreach}
                                        </select>
                                    {/if}
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            {else}
                <div class="alert alert_blue"><img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
                    {$smarty.const.MSG_MED_NO_ASIG}
                </div>
            {/if}
        </div>
    </div>
</div>

<script src="js/medicion_responsable.js" type="text/javascript"></script>