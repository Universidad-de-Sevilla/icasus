<!-- división modal activar uno -->
<div id="modal_activar_uno" class="dialog_content narrow ui-dialog-content ui-widget-content">
    <div class="block" style="opacity: 1;" >
        <div class="section" style="padding:20px">
            <p>{$smarty.const.TXT_CONFIRM} <b><span id="msg_activacion_uno"></span></b> {$smarty.const.TXT_MED_ESTA}.</p>
        </div>
    </div>
</div>
<!-- //división modal activar uno -->

<!-- división modal asignar una unidad a una medición -->
<div id="modal_asignar_una_medicion" class="dialog_content narrow ui-dialog-content ui-widget-content">
    <div class="block" style="opacity: 1;" >
        <div class="section" style="padding:20px">
            <p>{$smarty.const.TXT_INDIC_CONFIRM_ASIG_MED}</p>
            <p>{$smarty.const.TXT_INDIC_ACT_MED}: <input type="checkbox" id="activo" name="activo" value="1" checked="checked">
            </p>
        </div>
    </div>
</div>
<!-- //división modal asignar una unidad a una medición -->

<!-- división modal confirmación de desactivación de las mediciones completas de una subunidad para un indicador -->
<div id="modal_activar_all" class="dialog_content narrow ui-dialog-content ui-widget-content">
    <div class="block" style="opacity: 1;" >
        <div class="section" style="padding:20px">
            <p>{$smarty.const.TXT_CONFIRM}:<br />
                <input  name="activo_all" type="radio" value="1" checked="checked">{$smarty.const.TXT_MED_ACT_TODAS}<br />
                <input name="activo_all" type="radio" value="0">{$smarty.const.TXT_MED_DESACT_TODAS}
            </p>
        </div>
    </div>
</div>
<!-- //división modal confirmación de desactivación de las mediciones completas de una subunidad para un indicador -->

<!-- división seleccionar periodos a consultar -->
<div style="opacity: 1;" class="box grid_16">
    <h2 class="box_head">{$smarty.const.TXT_RANGO_FECHAS}</h2>
    <div style="display: block;" class="toggle_container">
        <div style="opacity: 1;" class="block">
            <div class="button_bar clearfix">
                <a href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
                        src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_MOSTRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
                        src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_VOLVER} {$tipo}</a>         
            </div>
            <form method="post" action="">
                <input type="hidden" name="id_indicador" id="id_indicador" value="{$indicador->id}">
                <input type="hidden" name="id_entidad" id="id_entidad" value="{$entidad->id}">
                <div class="columns clearfix">
                    <div class="col_50">
                        <fieldset class="label">
                            <label>{$smarty.const.FIELD_INICIO_PERIODO}</label>
                            <div>
                                <select id="inicio" name="inicio" class="select_box">
                                    <option value="0">{$smarty.const.TXT_SEL}</option>
                                    {foreach from=$years item=year}
                                        <option value="{$year->periodo_inicio|truncate:4:''}" data-id_indicador="{$indicador->id}">{$year->periodo_inicio|truncate:4:''}</option>
                                    {/foreach}
                                </select>
                                <div class="required_tag"></div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col_50" id="end_year">
                    </div>
                </div>
            </form>
            <div class="button_bar clearfix">
                <button id="btn_mostrar"
                        data-id_indicador="{$indicador->id}"
                        data-id_entidad="{$entidad->id}"
                        class="green send_right text_only has_text">
                    <span>{$smarty.const.TXT_MOSTRAR}</span>
                </button>
            </div>
        </div>
    </div>
</div>
<!-- //división seleccionar periodos a consultar -->

<!-- división muestra valores de subunidades-mediciones -->
<div style="opacity: 1;" class="box grid_16">
    <div style="opacity: 1;overflow-x:auto" class="block" id="mostrar_valores">	
        {include file="indicador_subunidad_valor_mostrar.tpl"}
    </div>
</div>
<!-- //división muestra valores de subunidades-mediciones -->

<script src="js/indicador_subunidad_valor.js" type="text/javascript"></script>

