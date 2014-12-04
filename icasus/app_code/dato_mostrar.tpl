<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_DATO_PARAM}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                <a href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_MOSTRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=dato_listar&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_LIST_TODOS}</a>&nbsp;&nbsp;
                <a href='index.php?page=dato_editar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/chart_curve_edit.png'  /> {$smarty.const.TXT_EDIT}</a>&nbsp;&nbsp;
                <a href='index.php?page=dato_borrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' onClick='return confirmar();'><img 
                        src='/icons/ff16/chart_curve_delete.png'  />{$smarty.const.TXT_BORRAR}</a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_responsable&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/user_medicion.png' /> {$smarty.const.FIELD_RESP_MED}</a>&nbsp;&nbsp;
                <a href='index.php?page=indicador_subunidad_valor&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/tag_blue.png' /> {$smarty.const.TXT_VALS_EDIT}</a>&nbsp;&nbsp;
                <a href='index.php?page=valor_referencia_crear&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                        src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}</a>
            </div>

            <!-- GRÁFICAS -->
            {if $mediciones}
                <div style="margin:10px;">
                    <!--
                    <div class="highchart" id="anuales" style="width:100%;" data-id_indicador="{$dato->id}" data-nombre_indicador="{$dato->nombre}" data-fecha_inicio="{$dato->historicos}-01-01" data-fecha_fin="{$smarty.now|date_format:'%Y' - 1}-12-31" data-periodicidad="anual"> </div>
                    </div>
                
                    {if $dato->periodicidad != "Anual"}
                      <div style="background: white; padding:20px 40px; margin:10px;">
                        <h3 style="margin: 0 0 20px 0;">Dos últimos años ({$smarty.now|date_format:'%Y' - 1} / {$smarty.now|date_format:'%Y'})</h3>
                        <div class="highchart" id="ultimas" data-id_indicador="{$dato->id}" data-nombre_indicador="{$dato->nombre}" data-periodicidad="todos" data-fecha_inicio="{$smarty.now|date_format:'%Y' - 2}-01-01" data-fecha_fin="{$smarty.now|date_format:'%Y-%m-%d'}" data-periodicidad="todos"></div>
                      </div>
                    {/if}
                    -->

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
                                        <div class="highchart {$panel->tipo->clase_css}" id="panel_{$panel->id}" data-id_indicador="{$dato->id}" data-nombre_indicador="{$dato->nombre} "data-idpanel="{$panel->id}" data-id_medicion="{$panel->id_medicion}" data-fecha_inicio="{$panel->fecha_inicio}" data-fecha_fin="{$panel->fecha_fin}" data-ancho="{$panel->ancho}" data-periodicidad="{$panel->periodicidad}"></div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    {/if}
                {else}
                    <p class="aviso">{$smarty.const.MSG_INDIC_NO_VAL}</p>
                {/if}
                <!-- //GRÁFICAS -->

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
            </div><!-- .block -->
        </div><!-- .toggle_container -->
    </div><!-- .box .grid_16 -->

    <div class="box grid_16">
        <div class="toggle_container">
            <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_DATO_MEDICIONES}</h2>
            <a href="#" class="grabber"></a>
            <a href="#" class="toggle"></a>
            <div class="block">
                <div class="button_bar clearfix">
                    <a href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
                            src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_MOSTRAR}</a>						
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
                    <p class="aviso">{$smarty.const.MSG_INDIC_NO_MED}</p>
                {/if}
            </div>
        </div><!-- toggle_container -->
    </div><!-- box grid_16 -->

    <script src="js/graficos_ficha_indicador.js" type="text/javascript"></script>
    <script src="js/highcharts.js" type="text/javascript"></script>
    <script src="js/highchartStruct.js" type="text/javascript"></script>
    <script src="js/exporting.js"></script>
    {literal}
        <script type="text/javascript">
                    // Para cada contenedor de clase highchart vamos a pintar el gráfico
                    $('.highchart').each(function () {
                        var idPanel = $(this).attr('id');
                        var idIndicador = $(this).data("id_indicador");
                        var nomIndicador = $(this).data("nombre_indicador");
                        var periodicidad = $(this).data("periodicidad");
                        var fecha_inicio = $(this).data("fecha_inicio");
                        var fecha_fin = $(this).data("fecha_fin");
                        var milisegundosAnio = 31540000000;
                        var dataseries = [];
                        var chartSerie = new highchartSerie(); // contenedor para los datos del gráfico
                        if (periodicidad === "anual") {
                            chartSerie.categoryType = "año";
                        }
                        else {
                            chartSerie.categoryType = "medicion";
                        }
                        var urlApi = "api_publica.php?metodo=get_valores_con_timestamp&id=" + idIndicador + "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin + "&periodicidad=" + periodicidad;

                        $.ajax({
                            url: urlApi,
                            type: "GET",
                            dataType: "json",
                            success: onDataReceived
                        });

                        function onDataReceived(datos) {
                            datos.forEach(function (dato) {
                                // Agrega los que no tienen etiqueta_mini (total y referencias)
                                // descarta las mediciones de unidades (no sirven aquí)
                                if (!dato.etiqueta_mini && (dato.valor !== null)) {
                                    chartSerie.add(dato);
                                }
                            });
                            // Pide las series de datos a chartSerie
                            // A saber: Totales y Valores de referencia
                            dataseries = chartSerie.getLinealSerie();
                            // Si no es anual ocultamos valores de referencia
                            if (chartSerie.categoryType !== "año") {
                                dataseries.forEach(function (dataserie, index) {
                                    if (index !== 0) {
                                        dataserie.visible = false;
                                    }
                                });
                            }
                            var chart1 = new Highcharts.Chart({
                                chart: {
                                    type: 'line',
                                    height: 300,
                                    renderTo: idPanel
                                },
                                title: {
                                    text: nomIndicador + '(' + fecha_inicio + " a " + fecha_fin + ")",
                                    style: {"color": "grey", "fontSize": "12px"}
                                },
                                exporting: {
                                    enabled: true
                                },
                                xAxis: {
                                    type: 'category'
                                },
                                yAxis: {
                                    title: {
                                        text: 'valores'
                                    }
                                },
                                plotOptions: {
                                    series: {
                                        dataLabels: {
                                            enabled: true,
                                            formatter: function () {
                                                return this.y ? ((Math.round(this.y * 100)) / 100) : null;
                                            }
                                        }
                                    }
                                },
                                series: dataseries
                            });
                        }
                    });
        </script>
    {/literal}
