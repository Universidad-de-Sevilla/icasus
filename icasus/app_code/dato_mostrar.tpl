<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_DATO_MEDICIONES}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                <a href='index.php?page=dato_listar&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/chart_bar.png' /> {$smarty.const.TXT_DATOS_LIST}</a>&nbsp;&nbsp;
                <a href='index.php?page=dato_editar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/chart_bar_edit.png'  /> {$smarty.const.TXT_EDIT}</a>&nbsp;&nbsp;
                <a href='index.php?page=dato_borrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' onClick='return confirmar();'><img 
                        src='/icons/ff16/chart_bar_delete.png'  /> {$smarty.const.TXT_BORRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_MOSTRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_responsable&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/user_medicion.png' /> {$smarty.const.FIELD_RESP_MED}</a>&nbsp;&nbsp;
                <a href='index.php?page=indicador_subunidad_valor&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/tag_blue.png' /> {$smarty.const.TXT_VALS_EDIT}</a>&nbsp;&nbsp;
                <a href='index.php?page=valor_referencia_crear&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}</a>
            </div>

            <!-- GRÁFICAS -->
            {if $mediciones}
                <div style="background: white; margin:10px;">
                    <h3 style="margin: 0 0 20px 0;">{$smarty.const.TXT_HISTORICO}</h3>
                </div>

                {if $dato->periodicidad != "Anual"}
                    <div style="background: white; margin:10px;">
                        <h3 style="margin: 0 0 20px 0;">{$smarty.const.TXT_2_ULT_ANYO} ({$smarty.now|date_format:'%Y' - 1} / {$smarty.now|date_format:'%Y'})</h3>
                    </div>
                {/if}

                {if $paneles}
                    {foreach $paneles as $panel}
                        <div class="box grid_{$panel->ancho}" style="float:left;">
                            <div class="block alturo" style="height:320px">
                                <!--
                                <div class="titulo-panel">
                                  <strong>{$panel->nombre}</strong>
                                </div>
                                -->
                                <div class="section">
                                    <div class="highchart {$panel->tipo->clase_css}" id="panel_{$panel->id}" data-id_indicador="{$dato->id}" data-nombre_indicador="{$dato->nombre}" data-fecha_inicio="{$panel->fecha_inicio}" data-fecha_fin="{$panel->fecha_fin}" data-periodicidad="{$panel->periodicidad}"></div>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                {/if}
            {else}
                <p class="aviso">{$smarty.const.MSG_INDIC_NO_VAL}</p>
            {/if}
            <!-- //GRÁFICAS -->

        </div><!-- //.block -->
    </div><!-- //toggle_container -->
</div><!-- //box grid_16 -->

<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_DATO_PARAM}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                <a href='index.php?page=dato_listar&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/chart_bar.png' /> {$smarty.const.TXT_DATOS_LIST}</a>&nbsp;&nbsp;
                <a href='index.php?page=dato_editar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/chart_bar_edit.png'  /> {$smarty.const.TXT_EDIT}</a>&nbsp;&nbsp;
                <a href='index.php?page=dato_borrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' onClick='return confirmar();'><img 
                        src='/icons/ff16/chart_bar_delete.png'  /> {$smarty.const.TXT_BORRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_MOSTRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_responsable&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/user_medicion.png' /> {$smarty.const.FIELD_RESP_MED}</a>&nbsp;&nbsp;
                <a href='index.php?page=indicador_subunidad_valor&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/tag_blue.png' /> {$smarty.const.TXT_VALS_EDIT}</a>&nbsp;&nbsp;
                <a href='index.php?page=valor_referencia_crear&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}</a>
            </div>

            <div class="columns clearfix">
                <div class="col_40">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_COD}</label>
                        <div>
                            {$dato->codigo}
                        </div>
                    </fieldset>
                </div>
                <div class="col_60">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_NOMBRE}</label>
                        <div>
                            {$dato->nombre}
                        </div>
                    </fieldset>
                </div>
            </div><!-- //.colums .clearfix -->
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_DESC}</label>
                <div>
                    {$dato->descripcion}
                </div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_CALCULO}</label>
                <div>
                    {$dato->calculo}
                </div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_RESP_DATO}</label>
                <div>
                    {$dato->responsable->nombre} {$dato->responsable->apellidos} 
                    {if $dato->responsable->puesto} - {$dato->responsable->puesto} {/if}
                </div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_RESP_MED}</label>
                <div>
                    {$dato->responsable_medicion->nombre} {$dato->responsable_medicion->apellidos} 
                    {if $dato->responsable_medicion->puesto} - {$dato->responsable_medicion->puesto} {/if}
                </div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_FUENTE_DAT}</label>
                <div>{$dato->fuente_datos}&nbsp;</div>	
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_DAT_REL}</label>
                <div>{$dato->indicadores_relacionados}&nbsp;</div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_HISTORICO}</label>
                <div>{$dato->historicos}&nbsp;</div>
            </fieldset>
            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_PERIOD}</label>
                        <div>{$dato->periodicidad}&nbsp;</div>
                    </fieldset>
                </div>
                <div class="col_50">
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_VISIBILIDAD}</label>	
                        <div>{$dato->visibilidad->nombre|htmlentities}&nbsp;</div>
                    </fieldset>
                </div>
            </div>
            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_UNID_GEN}</label>
                        <div>{$dato->unidad_generadora}&nbsp;</div>
                    </fieldset>
                </div>
                <div class="col_50">
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_CALC_TOTAL}</label>
                        <div>
                            {$dato->tipo_agregacion->descripcion}
                        </div>
                    </fieldset>
                </div>
            </div>

            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_SUBUNID_AFECT}</label>
                <div>
                    {if $dato_subunidades}
                        <ul>
                            {foreach $dato_subunidades as $dato_subunidad}
                                <li><a href="index.php?entidad_datos&id_entidad={$dato_subunidad->entidad->id}">{$dato_subunidad->entidad->nombre}</a></li>
                                {/foreach}
                        </ul>
                    {else}
                        {$smarty.const.MSG_DATO_NO_SUBUNID_ASIG}
                    {/if}
                </div>
            </fieldset>
        </div><!-- //.block -->
    </div><!-- //.toggle_container -->
</div><!-- //.box .grid_16 -->

<script src="js/highcharts.js" type="text/javascript"></script>
<script src="js/highchartStruct.js" type="text/javascript"></script>
<script src="js/exporting.js"></script>
<script src="js/indicador_dato_mostrar.js" type="text/javascript"></script>
