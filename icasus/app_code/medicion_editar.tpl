<div class="box grid_16">
    <div class="button_bar clearfix">
        <a href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_VOLVER}</a>&nbsp;&nbsp;
        <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_VOLVER} {$tipo}</a>&nbsp;&nbsp;
            {if $permiso_editar}
            <a class='confirmar' href='index.php?page=medicion_borrar&id_medicion={$medicion->id}&tipo={$tipo}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_BORRAR}</a>&nbsp;&nbsp;
            {/if}
        <span class="pull-right">
            {if $indice gt 0}
                <a href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[$indice-1]->id}&tipo={$tipo}'>
                    <img src='/icons/ff16/arrow_left.png' /> {$smarty.const.TXT_ANT}
                </a>&nbsp;&nbsp;
            {/if}
            {if $indice lt (count($mediciones)-1)}
                <a href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[$indice+1]->id}&tipo={$tipo}'>
                    <img src='/icons/ff16/arrow_right.png' /> {$smarty.const.TXT_SIG}
                </a>
            {/if}
        </span>
    </div>
</div>

<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_MED_VALORES}</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    {if $valores}
        <div id="valors">
            <table class="static">
                <thead>
                    <tr>
                        <th>{$smarty.const.FIELD_UNID}</th>
                        <th>{$smarty.const.FIELD_VAL}</th>
                        <th>{$smarty.const.FIELD_FECHA_RECOGIDA}</th>
                        <th>{$smarty.const.FIELD_USER_GRABA}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $valores as $valor}
                        <tr>
                            <td>{$valor->entidad->etiqueta}</td>
                            <td>
                                {if $valor->autorizado == 1 OR  $indicador->id_responsable == $usuario->id OR $indicador->id_responsable_medicion == $usuario->id}
                                    <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">{if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}</a>
                                {else}
                                {if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}
                            {/if}
                        </td>
                        <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                        <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
{else}
    <div class="alert alert_red">{$smarty.const.ERR_MED_NO_VAL}</div>
{/if}
</div>

<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_MED_DATOS}</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class="toggle_container">
        <div class="block">
            {if $permiso_editar == true}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_ETIQUETA}</label>
                    <div>
                        <span id="et">
                            <a href="javascript:void(0)" onclick="javascript:etiqueta_editar('{$medicion->id}', 'et', 'etiqueta');">{if $medicion->etiqueta != NULL}{$medicion->etiqueta}{else}----{/if}</a>
                        </span>
                    </div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_INICIO_PERIODO}</label>
                    <div>
                        <span id="pi">
                            <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'pi');">{if $medicion->periodo_inicio}{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}{else}----{/if}</a>
                        </span>
                    </div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_FIN_PERIODO}</label>
                    <div>
                        <span id="pf">
                            <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'pf');">{if $medicion->periodo_fin}{$medicion->periodo_fin|date_format:"%d-%m-%Y"}{else}----{/if}</a>
                        </span>
                    </div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_INICIO_GRABACION}</label>
                    <div>
                        <span id="gi">
                            <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'gi');">{if $medicion->grabacion_inicio}{$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}{else}----{/if}</a>
                        </span>
                    </div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_FIN_GRABACION}</label>
                    <div>
                        <span id="gf">
                            <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'gf');">{if $medicion->grabacion_fin}{$medicion->grabacion_fin|date_format:"%d-%m-%Y"}{else}----{/if}</a>
                        </span>
                    </div>
                </fieldset>
                {if isset($valores_referencia_medicion)}
                    {foreach $valores_referencia_medicion as $valor_referencia_medicion}
                        <fieldset class="label_side">
                            <label>{$valor_referencia_medicion->valor_referencia->etiqueta}</label>
                            <div><span id="referencia_{$valor_referencia_medicion->id}">
                                    <a href="javascript:void(0)" onclick="referencia_editar('{$valor_referencia_medicion->id}');">{if $valor_referencia_medicion->valor == NULL}---{else}{$valor_referencia_medicion->valor|round:"2"}{/if}</a></span></div>
                        </fieldset>
                    {/foreach}
                {else}
                    <fieldset class="label_side">
                        <div>{$smarty.const.MSG_INDIC_NO_VAL_REF}</div>
                    </fieldset>
                {/if}
            {else}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_ETIQUETA}</label>
                    <div>{$medicion->etiqueta}  </div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_INICIO_PERIODO}</label>
                    <div>{$medicion->periodo_inicio|date_format:"%d-%m-%Y"} </div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_FIN_PERIODO}</label>
                    <div>{$medicion->periodo_fin|date_format:"%d-%m-%Y"}  </div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_INICIO_GRABACION}</label>
                    <div>{$medicion->grabacion_inicio|date_format:"%d-%m-%Y"} </div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_FIN_GRABACION}</label>
                    <div>{$medicion->grabacion_fin|date_format:"%d-%m-%Y"}  </div>
                </fieldset>
                {if isset($valores_referencia_medicion)}
                    {foreach $valores_referencia_medicion as $valor_referencia_medicion}
                        <fieldset class="label_side">
                            <label>{$valor_referencia_medicion->valor_referencia->etiqueta}</label>
                            <div>{$valor_referencia_medicion->valor|round:"2"}</div>
                        </fieldset>
                    {/foreach}
                {else}
                    <fieldset class="label_side">
                        <div>{$smarty.const.MSG_INDIC_NO_VAL_REF}</div>
                    </fieldset>
                {/if}
            {/if}
        </div>
    </div>
</div>
{literal}
    <script>
        $('a.confirmar').click(function (event)
        {
            event.preventDefault();
            var url = $(this).attr('href');
            var confirm_box = confirm('Pulse "Aceptar" para borrar esta Medición. Recuerde que se borrarán los Valores y los Valores de Referencia recogidos para esta Medición.');
            if (confirm_box)
            {
                window.location = url;
            }
        });
    </script>
{/literal}
