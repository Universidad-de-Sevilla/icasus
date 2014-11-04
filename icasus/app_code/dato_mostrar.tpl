<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_DATO_PARAM}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                <a href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/time.png' /> {$smarty.const.TXT_SHOW_MED}</a> &nbsp; &nbsp;
                <a href='index.php?page=dato_listar&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_LIST_TODOS}</a> &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <a href='index.php?page=dato_editar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/chart_curve_edit.png'  /> {$smarty.const.TXT_EDIT}</a> &nbsp;  &nbsp;
                <a href='index.php?page=dato_borrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' onClick='return confirmar();'><img 
                        src='/icons/ff16/chart_curve_delete.png'  />{$smarty.const.TXT_BORRAR}</a> &nbsp;  &nbsp;
                <a href='index.php?page=medicion_responsable&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/user_medicion.png' /> {$smarty.const.FIELD_RESP_MED}</a> &nbsp; &nbsp;
                <a href='index.php?page=indicador_subunidad_valor&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/tag_blue.png' /> {$smarty.const.TXT_EDIT_VAL}</a> &nbsp; &nbsp; &nbsp;
                <a href='index.php?page=valor_referencia_crear&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}</a> &nbsp;
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
                        <label>{$smarty.const.FIELD_NAME}</label>
                        <div>
                            {$dato->nombre}
                        </div>
                    </fieldset>
                </div>
            </div><!-- .colums .clearfix -->
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
                <label>{$smarty.const.TXT_SUBUNID_AFECT}</label>
                <div>
                    {if $dato_subunidades}
                        <ul>
                            {foreach $dato_subunidades as $dato_subunidad}
                                <li><a href="index.php?entidad_datos&id_entidad={$dato_subunidad->entidad->id}">{$dato_subunidad->entidad->nombre}</a></li>
                                {/foreach}
                        </ul>
                    {else}
                        {$smarty.const.MSG_NO_SUBUNID_DATO_ASIG}
                    {/if}
                </div>
            </fieldset>
        </div><!-- .block -->
    </div><!-- .toggle_container -->
</div><!-- .box .grid_16 -->

<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_MED_DATO}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                <a href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/time.png' /> {$smarty.const.TXT_SHOW_MED}</a>						
            </div>

            {if $mediciones}
              <!-- <p><img src="index.php?page=grafica_indicador_agregado&id_indicador={$dato->id}" alt="gráfica completa con los valores medios del indicador" /> -->
                <div style="background: white; padding:20px 40px; margin:10px;">
                    <h3 style="margin: 0 0 20px 0;">{$smarty.const.TXT_HISTORICO}</h3>
                    <div class="panel_flot" id="grafica_anual" data-id_indicador="{$dato->id}" data-nombre_indicador="{$dato->nombre}" data-fecha_inicio="{$dato->historicos}-01-01" data-fecha_fin="{$smarty.now|date_format:'%Y' - 1}-12-31" data-periodicidad="anual"></div>
                    <div class="leyenda"></div>
                </div>

                {if $dato->periodicidad != "Anual"} 
                    <div style="background: white; padding:20px 40px; margin:10px;">
                        <h3 style="margin: 0 0 20px 0;">{$smarty.const.TXT_2_ULT_ANYO} ({$smarty.now|date_format:'%Y' - 1} / {$smarty.now|date_format:'%Y'})</h3>
                        <div class="panel_flot" id="grafica_anio_anterior" data-id_indicador="{$dato->id}" data-nombre_indicador="{$dato->nombre}" data-periodicidad="todos" data-fecha_inicio="{$smarty.now|date_format:'%Y' - 1}-01-01" data-fecha_fin="{$smarty.now|date_format:'%Y-%m-%d'}" data-periodicidad="mensual"></div>
                        <div class="leyenda"></div>
                    </div>
                {/if}

            {else}
                <p class="aviso">{$smarty.const.MSG_NO_MED_INDIC}</p>
            {/if}
        </div>
    </div><!-- toggle_container -->
</div><!-- box grid_16 -->

<script src="theme/danpin/scripts/flot/jquery.flot.min.js" type="text/javascript"></script>		
<script src="theme/danpin/scripts/flot/jquery.flot.time.js" type="text/javascript"></script>
<script src="js/graficos_ficha_indicador.js" type="text/javascript"></script>
