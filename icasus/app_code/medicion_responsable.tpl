{literal}
    <script>
        $(document).ready(function () {
            $('select.identificador').change(function () {
                var id_usuario = this.value;
                var id_indsub = $(this).attr('id');
                if (id_usuario != 0)
                {
                    $.post("index.php?page=medicion_responsable_ajax&modulo=grabar&ajax=true", {id: id_indsub, id_usuario: id_usuario}, function () {
                        location.reload();
                    });
                }
            });
        });
    </script>
{/literal}

<div class="box grid_16">
    <h3>{$smarty.const.TXT_UNIDS_MEDS_INDIC}</h3>
    <div class="button_bar clearfix">
        <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
                src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_VOLVER} {$tipo}</a> &nbsp;
    </div>
    {if $indicadores_subunidades }
        <div class="block">	
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
                </tbody></table>
        </div>
    </div>
{else}
    <div class="alert alert_blue">{$smarty.const.MSG_MED_NO_ASIG}</div>
{/if}
