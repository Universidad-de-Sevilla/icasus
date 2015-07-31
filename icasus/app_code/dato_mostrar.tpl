<!-- INDICADORES/DATOS CALCULADOS -->
{if $dato->calculo}
    <div class="box grid_16">
        <div class="toggle_container">
            <h2 class="box_head grad_grey_dark" >
                <img style="float:left" src="theme/danpin/images/icons/small/white/alert_2.png">
                {$smarty.const.TXT_CALC_AUTO}
            </h2>
            <a href="#" class="grabber"></a>
            <a href="#" class="toggle"></a>
            <div class="block">
                <div class="button_bar clearfix">
                    {if $_control}
                        <a href='index.php?page=dato_crear&id_entidad={$dato->id_entidad}'>
                            <img src='/icons/ff16/chart_bar_add.png' /> {$smarty.const.TXT_DATO_CREAR}
                        </a>&nbsp;&nbsp;
                    {/if}
                    <a href='index.php?page=dato_editar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                        <img src='/icons/ff16/chart_bar_edit.png'  /> {$smarty.const.TXT_EDIT}</a>&nbsp;&nbsp;
                    <a href='index.php?page=dato_borrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' 
                       onClick="return confirm('{$smarty.const.MSG_DATO_CONFIRM_BORRAR}');">
                        <img src='/icons/ff16/chart_bar_delete.png'  /> {$smarty.const.TXT_BORRAR}</a>&nbsp;&nbsp;
                    <a href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                        <img src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_MOSTRAR}</a>&nbsp;&nbsp;
                    <a href='index.php?page=medicion_responsable&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                        <img src='/icons/ff16/user_medicion.png' /> {$smarty.const.FIELD_RESP_MED}
                    </a>&nbsp;&nbsp;
                    {if !$dato->calculo}
                        <a href='index.php?page=indicador_subunidad_valor&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                            <img src='/icons/ff16/tag_blue_edit.png' /> {$smarty.const.TXT_VAL_EDIT}
                        </a>&nbsp;&nbsp;
                    {/if}
                    <a href='index.php?page=valor_referencia_crear&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                        <img src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}</a>
                </div>
                <div style="margin:10px;">
                    <p>{$smarty.const.TXT_DEPENDE}</p>
                    <ul>
                        {foreach $indicadores_influyentes as $indicador_influyente}
                            {if $indicador_influyente->id_proceso}
                                <li> 
                                    <a href='index.php?page=indicador_mostrar&id_indicador={$indicador_influyente->id}&id_entidad={$entidad->id}' 
                                       title="{$smarty.const.TXT_INDIC_MOSTRAR}: {$indicador_influyente->nombre}">
                                        <img src='/icons/ff16/chart_curve.png' /> {$indicador_influyente->nombre}
                                    </a>
                                </li>
                            {else}
                                <li> 
                                    <a href='index.php?page=dato_mostrar&id_dato={$indicador_influyente->id}&id_entidad={$entidad->id}' 
                                       title="{$smarty.const.TXT_DATO_MOSTRAR}: {$indicador_influyente->nombre}">
                                        <img src='/icons/ff16/chart_bar.png' /> {$indicador_influyente->nombre}
                                    </a>
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                </div>
            </div>
        </div>
    </div>
{/if}
<!-- //INDICADORES/DATOS CALCULADOS -->

<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_REP_GRAFIC}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                {if $_control}
                    <a href='index.php?page=dato_crear&id_entidad={$dato->id_entidad}'>
                        <img src='/icons/ff16/chart_bar_add.png' /> {$smarty.const.TXT_DATO_CREAR}
                    </a>&nbsp;&nbsp;
                {/if}
                <a href='index.php?page=dato_editar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                    <img src='/icons/ff16/chart_bar_edit.png'  /> {$smarty.const.TXT_EDIT}</a>&nbsp;&nbsp;
                <a href='index.php?page=dato_borrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' 
                   onClick="return confirm('{$smarty.const.MSG_DATO_CONFIRM_BORRAR}');">
                    <img src='/icons/ff16/chart_bar_delete.png'  /> {$smarty.const.TXT_BORRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                    <img src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_MOSTRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_responsable&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                    <img src='/icons/ff16/user_medicion.png' /> {$smarty.const.FIELD_RESP_MED}</a>&nbsp;&nbsp;
                    {if !$dato->calculo}
                    <a href='index.php?page=indicador_subunidad_valor&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                        <img src='/icons/ff16/tag_blue_edit.png' /> {$smarty.const.TXT_VAL_EDIT}</a>&nbsp;&nbsp;
                    {/if}
                <a href='index.php?page=valor_referencia_crear&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                    <img src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}</a>
            </div>

            <!-- GRÁFICAS -->
            <div style="margin:10px;">
                {if $pinta_grafico}
                    {if $paneles}
                        {foreach $paneles as $panel}
                            <div class="box grid_{$panel->ancho}" style="float:left;">
                                <div class="block">
                                    <div class="titulo-panel">
                                        <strong>{$panel->nombre}</strong>&nbsp;{$smarty.const.TXT_GRAFICO_AUMENTAR}
                                    </div>
                                    <div class="section">
                                        <div class="highchart {$panel->tipo->clase_css}" 
                                             id="panel_{$panel->id}" 
                                             data-id_indicador="{$dato->id}" 
                                             data-nombre_indicador="{$dato->nombre}"
                                             data-valor_min="{$dato->valor_min}" 
                                             data-valor_max="{$dato->valor_max}"
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
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_DATO_PARAM}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                {if $_control}
                    <a href='index.php?page=dato_crear&id_entidad={$dato->id_entidad}'>
                        <img src='/icons/ff16/chart_bar_add.png' /> {$smarty.const.TXT_DATO_CREAR}
                    </a>&nbsp;&nbsp;
                {/if}
                <a href='index.php?page=dato_editar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                    <img src='/icons/ff16/chart_bar_edit.png'  /> {$smarty.const.TXT_EDIT}</a>&nbsp;&nbsp;
                <a href='index.php?page=dato_borrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' 
                   onClick="return confirm('{$smarty.const.MSG_DATO_CONFIRM_BORRAR}');">
                    <img src='/icons/ff16/chart_bar_delete.png'  /> {$smarty.const.TXT_BORRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                    <img src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_MOSTRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_responsable&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                    <img src='/icons/ff16/user_medicion.png' /> {$smarty.const.FIELD_RESP_MED}</a>&nbsp;&nbsp;
                    {if !$dato->calculo}
                    <a href='index.php?page=indicador_subunidad_valor&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                        <img src='/icons/ff16/tag_blue_edit.png' /> {$smarty.const.TXT_VAL_EDIT}</a>&nbsp;&nbsp;
                    {/if}
                <a href='index.php?page=valor_referencia_crear&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                    <img src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}</a>
            </div>
            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_ID}</label>
                        <div>
                            {$dato->id}
                        </div>
                    </fieldset>
                </div>
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_COD}</label>
                        <div>
                            {$dato->codigo}
                        </div>
                    </fieldset>
                </div>
            </div><!-- //.colums .clearfix -->
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_NOMBRE}</label>
                <div>
                    {$dato->nombre}
                </div>
            </fieldset>
            {if $dato->descripcion != ""}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_DESC}</label>
                    <div>
                        {$dato->descripcion}
                    </div>
                </fieldset>
            {/if} 
            {if $dato->observaciones != ""}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_OBSERV}</label>
                    <div>
                        {$dato->observaciones}
                    </div>
                </fieldset>
            {/if}
            {if $dato->calculo}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_CALCULO}</label>
                    <div>
                        {$dato->calculo}
                    </div>
                </fieldset>
            {/if}
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

            {if $dato->fuente_informacion != ""}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_FUENTE_INFO}</label>
                    <div>{$dato->fuente_informacion}&nbsp;</div>
                </fieldset>
            {/if}

            {if $dato->fuente_datos != ""}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_FUENTE_DAT}</label>
                    <div>{$dato->fuente_datos}&nbsp;</div>	
                </fieldset>
            {/if}

            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_HISTORICO}</label>
                <div>{$dato->historicos}&nbsp;</div>
            </fieldset>

            <fieldset title="{$smarty.const.TXT_INTERVALO}" class="label">
                <label>{$smarty.const.FIELD_INTERVALO}</label>
                <div class="columns clearfix">
                    {if $dato->valor_min ==NULL}
                        <div class="col_50">
                            <fieldset class="label_side">
                                <label>{$smarty.const.FIELD_VALOR_MIN}</label>
                                <div>{$smarty.const.TXT_NO_ASIG}</div>
                            </fieldset>
                        </div>
                    {else}
                        <div class="col_50">
                            <fieldset class="label_side">
                                <label>{$smarty.const.FIELD_VALOR_MIN}</label>
                                <div>{$dato->valor_min}</div>
                            </fieldset>
                        </div>
                    {/if}
                    {if $dato->valor_max ==NULL}   
                        <div class="col_50">
                            <fieldset class="label_side">
                                <label>{$smarty.const.FIELD_VALOR_MAX}</label>
                                <div>{$smarty.const.TXT_NO_ASIG}</div>
                            </fieldset>
                        </div>
                    {else}
                        <div class="col_50">
                            <fieldset class="label_side">
                                <label>{$smarty.const.FIELD_VALOR_MAX}</label>
                                <div>{$dato->valor_max}</div>
                            </fieldset>
                        </div>
                    {/if}
                </div>
            </fieldset>

            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_VISIBILIDAD}</label>	
                        <div>{$dato->visibilidad->nombre|htmlentities}&nbsp;</div>
                    </fieldset>
                </div>
                <div class="col_50">
                    {if $dato->unidad_generadora != ""}
                        <fieldset class="label">
                            <label>{$smarty.const.FIELD_UNID_GEN}</label>
                            <div>{$dato->unidad_generadora}&nbsp;</div>
                        </fieldset>
                    {/if}
                </div>   
            </div>

            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_PERIOD}</label>
                        <div>{$dato->periodicidad}&nbsp;</div>
                    </fieldset>
                </div>
                <div class="col_50">
                    <fieldset title="{$smarty.const.TXT_CALCULO_TOTAL_ANUAL}" class="label">
                        <label>{$smarty.const.FIELD_CALC_TOTAL_ANUAL}</label>
                        <div>
                            {$dato->tipo_agregacion_temporal->descripcion}
                        </div>
                    </fieldset>
                </div>
            </div>

            <div class="columns clearfix">
                <div class="col_60">
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_SUBUNID_AFECT}</label>
                        <div>
                            {if $dato_subunidades}
                                <ul>
                                    {foreach $dato_subunidades as $dato_subunidad}
                                        <li><a href="index.php?page=entidad_datos&id_entidad={$dato_subunidad->entidad->id}">{$dato_subunidad->entidad->etiqueta}</a></li>
                                        {/foreach}
                                </ul>
                            {else}
                                {$smarty.const.MSG_DATO_NO_SUBUNID_ASIG}
                            {/if}
                        </div>
                    </fieldset>
                </div>
                <div class="col_40">
                    <fieldset title="{$smarty.const.TXT_CALCULO_TOTAL}" class="label">
                        <label>{$smarty.const.FIELD_CALC_TOTAL}</label>
                        <div>
                            {$dato->tipo_agregacion->descripcion}
                        </div>
                    </fieldset>
                </div>
            </div>
        </div><!-- //.block -->
    </div><!-- //.toggle_container -->
</div><!-- //.box .grid_16 -->

<!-- INDICADORES/DATOS DEPENDIENTES -->
{if $indicadores_dependientes}
    <div class="box grid_16">
        <div class="toggle_container">
            <h2 class="box_head grad_grey_dark" >
                {$smarty.const.TXT_INDIC_DAT_DEPENDIENTES}
            </h2>
            <a href="#" class="grabber"></a>
            <a href="#" class="toggle"></a>
            <div class="block">
                <div class="button_bar clearfix">
                    {if $_control}
                        <a href='index.php?page=dato_crear&id_entidad={$dato->id_entidad}'>
                            <img src='/icons/ff16/chart_bar_add.png' /> {$smarty.const.TXT_DATO_CREAR}
                        </a>&nbsp;&nbsp;
                    {/if}
                    <a href='index.php?page=dato_editar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                        <img src='/icons/ff16/chart_bar_edit.png'  /> {$smarty.const.TXT_EDIT}</a>&nbsp;&nbsp;
                    <a href='index.php?page=dato_borrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' 
                       onClick="return confirm('{$smarty.const.MSG_DATO_CONFIRM_BORRAR}');">
                        <img src='/icons/ff16/chart_bar_delete.png'  /> {$smarty.const.TXT_BORRAR}</a>&nbsp;&nbsp;
                    <a href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                        <img src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_MOSTRAR}</a>&nbsp;&nbsp;
                    <a href='index.php?page=medicion_responsable&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                        <img src='/icons/ff16/user_medicion.png' /> {$smarty.const.FIELD_RESP_MED}
                    </a>&nbsp;&nbsp;
                    {if !$dato->calculo}
                        <a href='index.php?page=indicador_subunidad_valor&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                            <img src='/icons/ff16/tag_blue_edit.png' /> {$smarty.const.TXT_VAL_EDIT}
                        </a>&nbsp;&nbsp;
                    {/if}
                    <a href='index.php?page=valor_referencia_crear&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                        <img src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}</a>
                </div>
                <div style="margin:10px;">
                    <p>{$smarty.const.TXT_INFLUYE}</p>
                    <ul>
                        {foreach $indicadores_dependientes as $indicador_dependiente}
                            {if $indicador_dependiente->id_proceso}
                                <li> 
                                    <a href='index.php?page=indicador_mostrar&id_indicador={$indicador_dependiente->id}&id_entidad={$entidad->id}' 
                                       title="{$smarty.const.TXT_INDIC_MOSTRAR}: {$indicador_dependiente->nombre}">
                                        <img src='/icons/ff16/chart_curve.png' /> {$indicador_dependiente->nombre}
                                    </a>
                                </li>
                            {else}
                                <li> 
                                    <a href='index.php?page=dato_mostrar&id_dato={$indicador_dependiente->id}&id_entidad={$entidad->id}' 
                                       title="{$smarty.const.TXT_DATO_MOSTRAR}: {$indicador_dependiente->nombre}">
                                        <img src='/icons/ff16/chart_bar.png' /> {$indicador_dependiente->nombre}
                                    </a>
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                </div>
            </div>
        </div>
    </div>
{/if}
<!-- //INDICADORES/DATOS DEPENDIENTES -->

<script src="js/highcharts/highcharts.js" type="text/javascript"></script>
<script src="js/highcharts/exporting.js" type="text/javascript"></script>
<script src="js/highcharts/Conjunto.js" type="text/javascript"></script>
<script src="js/highcharts/HighchartSerie.js" type="text/javascript"></script>
<script src="js/indicador_dato_mostrar.js" type="text/javascript"></script>
