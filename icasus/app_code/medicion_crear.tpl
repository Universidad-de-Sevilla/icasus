<div><h2>{$indicador->codigo} - {$indicador->nombre}</h2></div>
<form name="medicion" id="medicion" action="index.php?page=medicion_grabar" method="post" class="validate_form">
    <input type="hidden" name="id_indicador" value="{$indicador->id}" />
    <input type="hidden" name="tipo" value="{$tipo}" />
    <div style="opacity: 1;" class="box tabs" id="tab_crear_medicion">
        <ul class="tab_header">
            <li><a href="#medicion" >{$smarty.const.FIELD_MED}</a></li>
            <li><a href="#referencia" >{$smarty.const.FIELD_VAL_REF}</a></li>
            <li><a href="#subunidades" >{$smarty.const.FIELD_SUBUNID_AFECT}</a></li>
        </ul>
        <div style="opacity: 1;" id="medicion" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
            <p>&nbsp;</p>
            <fieldset>
                <label>{$smarty.const.FIELD_ETIQUETA}</label>
                <div>
                    <input type="input" name="etiqueta" id="etiqueta" class="text required" /></p>
                    <div class="required_tag"></div>
                </div>
            </fieldset>
            <fieldset>
                <label>{$smarty.const.FIELD_OBSERV}</label>
                <div>
                    <textarea name="observaciones" id="observaciones" /></textarea>
                </div>
            </fieldset>
            <div class="columns clearfix">
                <div class="col_25">
                    <fieldset >
                        <label>{$smarty.const.FIELD_INICIO_PERIODO}</label>
                        <div>
                            {html_select_date field_order='DMY' start_year="-10"  end_year="+5" time=$smarty.now  prefix="pi" month_format='%m'}
                        </div>
                    </fieldset>
                </div>
                <div class="col_25">
                    <fieldset >
                        <label>{$smarty.const.FIELD_FIN_PERIODO}</label>
                        <div>
                            {html_select_date field_order='DMY' start_year="-10" end_year="+5" time=$smarty.now  prefix="pf" month_format='%m'}
                        </div>
                    </fieldset>
                </div>
                <div class="col_25">
                    <fieldset >
                        <label>{$smarty.const.FIELD_INICIO_GRABACION}</label>
                        <div>
                            {html_select_date field_order='DMY' start_year="-10"  end_year="+5" time=$smarty.now prefix="gi" month_format='%m'}
                        </div>
                    </fieldset>
                </div>
                <div class="col_25">
                    <fieldset >
                        <label>{$smarty.const.FIELD_FIN_GRABACION}</label>
                        <div>
                            {html_select_date field_order='DMY' start_year="-10" end_year="+5" time=$smarty.now prefix="gf" month_format='%m'}
                        </div>
                    </fieldset>
                </div>
            </div><!-- fin columns clearfix -->
            <div class="button_bar clearfix">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="green send_right" type="submit" name="proceso_submit" value='{$smarty.const.TXT_GRABAR}'>
                    <span>{$smarty.const.TXT_GRABAR}</span>
                </button>
            </div>
        </div><!--fin tab medicion -->

        <div style="opacity: 1;" id="referencia" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
            <p>&nbsp;</p>
            {*if $tipo == "indicador"*}
                <fieldset >
                    {if $valores_referencia}
                        {foreach $valores_referencia as $valor_referencia}
                            <label>{$valor_referencia->etiqueta}</label>
                            <div>
                                <input type="input" name="valor_referencia[{$valor_referencia->id}]" class="text"/>
                            </div>
                        {/foreach}
                    {else}
                        <div class="alert dismissible alert_blue">
                            <img src="images/icons/small/white/alert_2.png" height="24" width="24">
                            {$smarty.const.MSG_INDIC_NO_VAL_REF}
                        </div>
                    {/if}
                </fieldset>
            {*else}
                <div class="alert dismissible alert_blue">
                    <img src="images/icons/small/white/alert_2.png" height="24" width="24">
                    {$smarty.const.MSG_DATO_NO_VAL_REF}
                </div>
            {/if*}
            <div class="button_bar clearfix">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="green send_right" type="submit" name="proceso_submit" value='{$smarty.const.TXT_GRABAR}' >
                    <span>{$smarty.const.TXT_GRABAR}</span>
                </button>
            </div>
        </div><!--fin tab referencia -->

        <div style="opacity: 1;" id="subunidades" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
            <p>&nbsp;</p>
            <fieldset class="label_side">
                <div id="div_subunidades" class="column clearfix" style="display:">
                    <div class="col_50">
                        {foreach name="subunidad" from=$subunidades item=subunidad}
                            {assign var="total" value=$subunidades|@count/2+2}
                            {if $smarty.foreach.subunidad.iteration == $total|floor}</div><div class="col_50">{/if}
                            <input type="checkbox" name="subunidades[]" data-indicador="{$indicador->id}" value="{$subunidad->id}" class="subunidad"
                                   {foreach $indicador_subunidades as $indicador_subunidad}
                                       {if $indicador_subunidad->id_entidad == $subunidad->id} checked{/if}
                                   {/foreach}
                                   /> {$subunidad->etiqueta}<br />
                        {/foreach}
                    </div>
                </div>
            </fieldset>
            <div class="button_bar clearfix">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="green send_right" type="submit"  name="proceso_submit" value='{$smarty.const.TXT_GRABAR}'>
                    <span>{$smarty.const.TXT_GRABAR}</span>
                </button>
            </div>
        </div><!--fin tab subunidades -->
    </div><!--fin id=tab_crear_medicion -->
</form>

<script src="js/medicion_crear.js" type="text/javascript"></script>
