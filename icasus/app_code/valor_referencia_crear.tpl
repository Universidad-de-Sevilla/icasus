<!-- Cuadro de dialogo oculto para crear nuevo valor de referencia -->
<div class="display_none">
    <div id="crear_referencia" class="dialog_content narrow " title="{$smarty.const.TXT_VAL_REF_NUEVO}">
        <div class="block">
            <form method="post" action="" id="formcrearreferencia" name="formcrearreferencia" class="validate_form">
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_ETIQUETA}</label>
                    <div><b><input  type='text' name='c-etiqueta' value="" class="text required"/></b><div class="required_tag"></div></div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_NOMBRE}</label>
                    <div><b><input  type='text' name='c-nombre' value="" class="text required"/></b><div class="required_tag"</div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_VISIB_GRAFIC}</label>
                    <div><b><input  type='radio' name='c-grafica' value="1" class="required" checked/> {$smarty.const.TXT_SI} <input  type='radio' name='c-grafica' value="0" class="required"/>{$smarty.const.TXT_NO}</b><div class="required_tag"></div></div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_ACTIVO}</label>
                    <div><b><input  type='radio' name='c-activo' value="1" checked class="required"/> {$smarty.const.TXT_SI} <input  type='radio' name='c-activo' value="0" class="required"/>{$smarty.const.TXT_NO}</b><div class="required_tag"></div></div>
                </fieldset>
                <input type="hidden"  name="c-id_indicador" value="{$indicador->id}"/>
                <div class="button_bar clearfix">
                    <button class="green send_right" type="button" value="{$smarty.const.TXT_GRABAR}" name="valor_nuevo_crear" id="valor_nuevo_crear">
                        <span>{$smarty.const.TXT_GRABAR}</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Cuadro de dialogo oculto para editar valor de referencia -->
<div class="display_none">
    <div id="editar_referencia" class="dialog_content narrow " title="{$smarty.const.TXT_VAL_REF_EDIT}">
        <div class="block">
            <form method="post" action="" id="formeditarreferencia" name="formeditarreferencia" class="validate_form">
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_ETIQUETA}</label>
                    <div><b><input  type='text' id="e-etiqueta" name='e-etiqueta' value='' class="text required" /></b><div class="required_tag"></div></div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_NOMBRE}</label>
                    <div><b><input  type='text' id="e-nombre" name='e-nombre' value='' class="text required" /></b><div class="required_tag"></div></div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_VISIB_GRAFIC}</label>
                    <div><b><input  type='radio' name='e-grafica' id="e-grafica-1" value="1" class="required"/> {$smarty.const.TXT_SI} <input  type='radio' name='e-grafica' id="e-grafica-0"  value="0" class="required"/>{$smarty.const.TXT_NO}</b><div class="required_tag"></div></div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_ACTIVO}</label>
                    <div><b><input  type='radio' name='e-activo' id="e-activo-1" value="1" class="required" /> {$smarty.const.TXT_SI}<input  type='radio' name='e-activo' id="e-activo-0" value="0" class="required"/>{$smarty.const.TXT_NO}</b><div class="required_tag"></div></div>
                </fieldset>
                <input type="hidden"  name="e-id_indicador" value="{$indicador->id}"/>
                <div class="button_bar clearfix">
                    <button class="green send_right" type="button" value="{$smarty.const.TXT_GRABAR}" name="valor_editar" id="valor_editar">
                        <span>{$smarty.const.TXT_GRABAR}</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="box grid_16">
    <form action='index.php?page=valor_referencia_crear&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}' method='post' onsubmit="return confirm('{$smarty.const.MSG_VALS_REF_CONFIRM_BORRAR}');">
        <div class="button_bar clearfix">
            {if $permiso}
                <a href='javascript:void(0)' class="dialog_button" data-dialog="crear_referencia" >
                    <img src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF_CREAR}
                </a>&nbsp;&nbsp;
                <a href="javascript:void(0)" onClick="$(this).closest('form').submit();" >
                    <img src='/icons/ff16/tag_blue_delete.png' /> {$smarty.const.TXT_VAL_REF_BORRAR}
                </a>&nbsp;&nbsp;
            {/if}
            <a href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_VOLVER}</a>&nbsp;&nbsp;
            <a href="index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}"><img src ="/icons/ff16/chart_curve.png"> {$smarty.const.TXT_VOLVER} {$tipo}</a>       
        </div>
        <div id="dt1" class="no_margin">
            <table class='display datatable'>
                <thead>
                    <tr>
                        {if $permiso}
                            <th></th>
                            {/if}
                        <th>{$smarty.const.FIELD_ETIQUETA}</th>
                        <th>{$smarty.const.FIELD_VAL_REF}</th>
                        <th>{$smarty.const.FIELD_VISIB_GRAFIC}</th>
                        <th>{$smarty.const.FIELD_ACTIVO}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$indicador->valores_referencia item=item}
                        <tr class="gradeX">
                            {if $permiso}
                                <td style="text-align: center">
                                    <input type="checkbox" name='id_val_ref[]' value="{$item->id}"/>
                                </td>
                                <td><a href="javascript:void(0)" data-dialog="editar_referencia" class="dialog_button " title="{$smarty.const.TXT_VAL_REF_EDIT}" id="l-etiqueta-{$item->id}" value="{$item->etiqueta}">{$item->etiqueta|htmlentities}</a></td>
                                <td><a href="javascript:void(0)" data-dialog="editar_referencia" class="dialog_button " title="{$smarty.const.TXT_VAL_REF_EDIT}" id="l-nombre-{$item->id}" value="{$item->nombre}">{$item->nombre|htmlentities}</a></td>
                                <td>
                                    <a href="javascript:void(0)" data-dialog="editar_referencia" class="dialog_button " title="{$smarty.const.TXT_VAL_REF_EDIT}" id="l-grafica-{$item->id}" value="{$item->grafica}">
                                        {if $item->grafica}
                                            {$smarty.const.TXT_SI}
                                        {else}
                                            {$smarty.const.TXT_NO}
                                        {/if}
                                    </a>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" data-dialog="editar_referencia" class="dialog_button " title="{$smarty.const.TXT_VAL_REF_EDIT}" id="l-activo-{$item->id}" value="{$item->activo}">
                                        {if $item->activo}
                                            {$smarty.const.TXT_SI}
                                        {else}
                                            {$smarty.const.TXT_NO}
                                        {/if}
                                    </a>
                                </td>
                            {else}
                                <td>{$item->etiqueta|htmlentities}</td>
                                <td>{$item->nombre|htmlentities}</td>
                                <td>
                                    {if $item->grafica}
                                        {$smarty.const.TXT_SI}
                                    {else}
                                        {$smarty.const.TXT_NO}
                                    {/if}
                                </td>
                                <td>
                                    {if $item->activo}
                                        {$smarty.const.TXT_SI}
                                    {else}
                                        {$smarty.const.TXT_NO}
                                    {/if}
                                </td>
                            {/if}
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </form>
</div>
