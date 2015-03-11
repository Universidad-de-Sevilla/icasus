<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_INDIC_MED}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
               <!-- <a href='index.php?page=indicador_listar&id_entidad={$indicador->id_entidad}'><img
                        src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_INDIC_LIST}</a>&nbsp;&nbsp;-->
                <a href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img
                        src='/icons/ff16/chart_curve_edit.png'  /> {$smarty.const.TXT_EDIT}</a>&nbsp;&nbsp;
                <a href='index.php?page=indicador_borrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                   onClick="return confirm('{$smarty.const.MSG_INDIC_CONFIRM_BORRAR}');">
                    <img src='/icons/ff16/chart_curve_delete.png'  /> {$smarty.const.TXT_BORRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img
                        src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_MOSTRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_responsable&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img
                        src='/icons/ff16/user_medicion.png' /> {$smarty.const.FIELD_RESP_MED}</a>&nbsp;&nbsp;
                <a href='index.php?page=indicador_subunidad_valor&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img
                        src='/icons/ff16/tag_blue.png' /> {$smarty.const.TXT_VAL_EDIT}</a>&nbsp;&nbsp;
                <a href='index.php?page=valor_referencia_crear&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img
                        src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}</a> 
            </div>

            <!-- GRÁFICAS -->
            <div style="margin:10px;">
                {if $mediciones}
                    {if $paneles}
                        {foreach $paneles as $panel}
                            <div class="box grid_{$panel->ancho}" style="float:left;">
                                <div class="block">
                                    <div class="titulo-panel">
                                        <strong>{$panel->nombre}</strong>
                                    </div>
                                    <div class="section">
                                        <div class="highchart {$panel->tipo->clase_css}" 
                                             id="panel_{$panel->id}" 
                                             data-id_indicador="{$indicador->id}" 
                                             data-nombre_indicador="{$indicador->nombre}" 
                                             data-fecha_inicio="{$panel->fecha_inicio}" 
                                             data-fecha_fin="{$panel->fecha_fin}" 
                                             data-periodicidad="{$panel->periodicidad}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    {/if}
                {else}
                    <div class="alert alert_blue">
                        <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
                        {$smarty.const.MSG_INDIC_NO_VAL}
                    </div>
                {/if}
            </div>
            <!-- //GRÁFICAS -->

        </div><!-- //.block -->
    </div><!-- //toggle_container -->
</div><!-- //box grid_16 -->

<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_INDIC_PARAM}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                <!--<a href='index.php?page=indicador_listar&id_entidad={$indicador->id_entidad}'><img
                        src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_INDIC_LIST}</a>&nbsp;&nbsp;-->
                <a href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img
                        src='/icons/ff16/chart_curve_edit.png'  /> {$smarty.const.TXT_EDIT}</a>&nbsp;&nbsp;
                <a href='index.php?page=indicador_borrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                   onClick="return confirm('{$smarty.const.MSG_INDIC_CONFIRM_BORRAR}');">
                    <img src='/icons/ff16/chart_curve_delete.png'  /> {$smarty.const.TXT_BORRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img
                        src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_MOSTRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_responsable&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img
                        src='/icons/ff16/user_medicion.png' /> {$smarty.const.FIELD_RESP_MED}</a>&nbsp;&nbsp;
                <a href='index.php?page=indicador_subunidad_valor&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img
                        src='/icons/ff16/tag_blue.png' /> {$smarty.const.TXT_VAL_EDIT}</a>&nbsp;&nbsp;
                <a href='index.php?page=valor_referencia_crear&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img
                        src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}</a> 
            </div>
            {if $indicador->calculo}
                <div class="alert alert_blue">
                    <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
                    {$smarty.const.TXT_CALC_AUTO}
                </div>
            {/if}
            <div class="columns clearfix">
                <div class="col_40">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_COD}</label>
                        <div>
                            {$indicador->codigo}
                        </div>
                    </fieldset>
                </div>
                <div class="col_60">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_PROC}</label>
                        <div>
                            <a href="index.php?page=proceso_mostrar&id_proceso={$indicador->proceso->id}&id_entidad={$indicador->id_entidad}">{$indicador->proceso->codigo} - {$indicador->proceso->nombre}</a>
                        </div>
                    </fieldset>
                </div>
            </div>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_NOMBRE}</label>
                <div>
                    {$indicador->nombre}
                </div>
            </fieldset>
            {if $indicador->descripcion != ""}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_DESC}</label>
                    <div>
                        {$indicador->descripcion}
                    </div>
                </fieldset>
            {/if}
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_FORM}</label>
                <div>
                    {$indicador->formulacion}
                </div>
            </fieldset>
            {if $indicador->calculo}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_CALCULO}</label>
                    <div>
                        {$indicador->calculo}
                    </div>
                </fieldset>
            {/if}
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_RESP_SEG}</label>
                <div>
                    {$indicador->responsable->nombre} {$indicador->responsable->apellidos}
                    {if $indicador->responsable->puesto} - {$indicador->responsable->puesto} {/if}
                </div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_RESP_MED}</label>
                <div>
                    {$indicador->responsable_medicion->nombre} {$indicador->responsable_medicion->apellidos}
                    {if $indicador->responsable_medicion->puesto} - {$indicador->responsable_medicion->puesto} {/if}
                </div>
            </fieldset>
            {if $indicador->fuente_informacion != ""}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_FUENTE_INFO}</label>
                    <div>{$indicador->fuente_informacion}&nbsp;</div>
                </fieldset>
            {/if}
            {if $indicador->fuente_datos != ""}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_FUENTE_DAT}</label>
                    <div>{$indicador->fuente_datos}&nbsp;</div>
                </fieldset>
            {/if}
            {if $indicador->evidencia != ""}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_MET}</label>
                    <div>{$indicador->evidencia}&nbsp;</div>
                </fieldset>
            {/if}
            {if $indicador->historicos != ""}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_HISTORICO}</label>
                    <div>{$indicador->historicos}&nbsp;</div>
                </fieldset>
            {/if}
            {if $indicador->interpretacion != ""}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_INTERP}</label>
                    <div>{$indicador->interpretacion}&nbsp;</div>
                </fieldset>
            {/if}
            {if $indicador->indicadores_relacionados != ""}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_INDIC_REL}</label>
                    <div>{$indicador->indicadores_relacionados}&nbsp;</div>
                </fieldset>
            {/if}
            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_EFQM}</label>
                        <div>
                            {if is_array($indicador->criterios_efqm)}
                                <ul> 
                                    {foreach $indicador->criterios_efqm as $indicador_criterio_efqm}
                                        {if $indicador_criterio_efqm->id_criterio_efqm != 0}
                                            <li> {$indicador_criterio_efqm->criterio_efqm->codigo} - {$indicador_criterio_efqm->criterio_efqm->nombre}</li>
                                            {/if}  
                                        {/foreach}
                                </ul>
                            {else}
                                {$smarty.const.MSG_NO_DEF}
                            {/if}
                        </div>
                    </fieldset>
                </div>
                <div class="col_50">
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_CALC_TOTAL}</label>
                        <div>
                            {$indicador->tipo_agregacion->descripcion}
                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_PERIOD}</label>
                        <div>{$indicador->periodicidad}&nbsp;</div>
                    </fieldset>
                </div>
                <div class="col_50">
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_VISIBILIDAD}</label>
                        <div>{$indicador->visibilidad->nombre|htmlentities}&nbsp;</div>
                    </fieldset>
                </div>
            </div>
            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_NIVEL_DES}</label>
                        <div>{$indicador->nivel_desagregacion}&nbsp;</div>
                    </fieldset>
                </div>
                <div class="col_50">
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_UNID_GEN}</label>
                        <div>{$indicador->unidad_generadora}&nbsp;</div>
                    </fieldset>
                </div>
            </div>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_SUBUNID_AFECT}</label>
                <div>
                    {if $indicador_subunidades}
                        <ul>
                            {foreach $indicador_subunidades as $indicador_subunidad}
                                <li><a href="index.php?page=entidad_datos&id_entidad={$indicador_subunidad->entidad->id}">{$indicador_subunidad->entidad->nombre}</a></li>
                                {/foreach}
                        </ul>
                    {else}
                        {$smarty.const.MSG_INDIC_NO_SUBUNID_ASIG}
                    {/if}
                </div>
            </fieldset>
        </div>
    </div>
</div>

<script src="js/highcharts.js" type="text/javascript"></script>
<script src="js/highcharts-3d.js" type="text/javascript"></script>
<script src="js/exporting.js"></script>
<script src="js/Conjunto.js" type="text/javascript"></script>
<script src="js/HighchartSerie.js" type="text/javascript"></script>
<script src="js/indicador_dato_mostrar.js" type="text/javascript"></script>