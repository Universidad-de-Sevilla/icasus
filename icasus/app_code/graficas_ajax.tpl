<!-- Panel de Valores/Subunidad -->
<div class="col-lg-{$panel_res->ancho}">
    <div class="panel panel-red">
        <div class="panel-heading">
            <span class="panel-title"><i class="fa fa-bar-chart fa-fw"></i><strong> {$panel_res->nombre}</strong> {$smarty.const.TXT_GRAFICO_AUMENTAR}</span>
            <i class="fa fa-chevron-up pull-right clickable"></i>
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">
            {if $grafica_valores}
                <div  id="container"
                      data-id_indicador="{$indicador->id}"
                      data-nombre_indicador="{$indicador->nombre}"
                      data-periodicidad="{$panel_res->periodicidad}"
                      data-valor_min="{$indicador->valor_min}"
                      data-valor_max="{$indicador->valor_max}"
                      data-fecha_inicio="{$panel_res->fecha_inicio}"
                      data-fecha_fin="{$panel_res->fecha_fin}"
                      data-id_entidad="{$indicador->id_entidad}"
                      data-agregacion="{$indicador->id_tipo_agregacion}">
                </div>
            {else}
                <div class="alert alert-info alert-dismissible">
                    <i class="fa fa-info-circle fa-fw"></i> 
                    {$smarty.const.MSG_INDIC_NO_VAL_PERIODO}
                </div>
            {/if}
        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>
<!-- /.col-lg-{$panel->ancho} -->
<!-- /Panel de Valores/Subunidad -->

<!-- Paneles de líneas -->
{foreach $paneles as $panel}
    <div class="col-lg-{$panel->ancho}" >
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-line-chart fa-fw"></i><strong> {$panel->nombre}</strong> {$smarty.const.TXT_GRAFICO_AUMENTAR}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                {if $panel->id==1 && $grafica_historico || $panel->id==2 && $grafica_intranual}
                    <div class="highchart {*$panel->tipo->clase_css*}"
                         id="panel_{$panel->id}"
                         data-id_indicador="{$indicador->id}"
                         data-nombre_indicador="{$indicador->nombre}"
                         data-valor_min="{$indicador->valor_min}"
                         data-valor_max="{$indicador->valor_max}"
                         data-fecha_inicio="{$panel->fecha_inicio}"
                         data-fecha_fin="{$panel->fecha_fin}"
                         data-periodicidad="{$panel->periodicidad}">
                    </div>
                {else}
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_INDIC_NO_VAL_PERIODO}
                    </div>
                {/if}
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-{$panel->ancho} -->
{/foreach} 
<!-- /Paneles de líneas -->

{literal}
    <script defer>
        // Variables
        var idIndicador = $("#container").data("id_indicador");
        var nomIndicador = $("#container").data("nombre_indicador");
        var valor_min = null;
        var valor_max = null;
        var tickInterval = null;
        if ($.isNumeric($("#container").data("valor_min"))) {
            valor_min = $("#container").data("valor_min");
        }
        if ($.isNumeric($("#container").data("valor_max"))) {
            valor_max = $("#container").data("valor_max");
        }
        //Intervalo para las encuestas
        if (valor_min === 1 && valor_max === 9) {
            tickInterval = 1;
        }

        //Fechas
        var fecha_inicio = $("#container").data("fecha_inicio");
        var fecha_fin = $("#container").data("fecha_fin");
        var fecha_inicio_es = (new Date(fecha_inicio)).toLocaleDateString();
        var fecha_fin_es = (new Date(fecha_fin)).toLocaleDateString();

        //Indicadores/datos con intranuales con agregación manual de unidades
        var id_entidad = $("#container").data("id_entidad");
        var id_tipo_agregacion = $("#container").data("agregacion");

        // Contenedor para los datos del gráfico
        var chartSerie = new HighchartSerie();
        var totales = [];
        // Consulta a la base de datos
        $.ajax({
            url: "api_publica.php?metodo=get_valores_con_timestamp&id=" + idIndicador + "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin,
            type: "GET",
            dataType: "json",
            success: onDataReceived
        });
        // Guardado de datos en HighchartSerie y totales para las medias
        function onDataReceived(datos) {
            datos.forEach(function (d) {
                //Si el indicador/dato es manual no consideramos la unidad del mismo
                if (d.etiqueta_mini && !(d.id_unidad == id_entidad && id_tipo_agregacion === 4)) {
                    chartSerie.add(d);
                } else if (d.id_unidad == 0) {
                    totales[d.medicion] = parseFloat(d.valor);
                }
            });
            // Pinta y configura el gráfico resumen de valores por subunidad
            var serie = chartSerie.getBarSerie();
            // Hacemos visible el último año
            serie[serie.length - 1].visible = true;
            serie[serie.length - 1].selected = true;
            // Gráfico de barras
            pintaGrafico({
                chart: {
                    renderTo: 'container',
                    events: {}
                },
                credits: {
                    enabled: false
                },
                title: {
                    text: nomIndicador,
                    style: {"fontSize": "14px"}
                },
                subtitle: {
                    text: 'Período: ' + fecha_inicio_es + ' al ' + fecha_fin_es
                },
                exporting: {
                    filename: nomIndicador
                },
                xAxis: {
                    type: 'category'
                },
                yAxis: {
                    title: {
                        text: 'Valores'
                    },
                    labels: {
                        format: '{value:,.2f}'
                    },
                    min: valor_min,
                    max: valor_max,
                    tickInterval: tickInterval
                },
                plotOptions: {
                    series: {
                        events: {
                            // Pintamos la media al hacer click en él.
                            legendItemClick: function (event) {
                                if (this.visible) {
                                    this.chart.yAxis[0].removePlotLine(this.name);
                                } else {
                                    this.chart.yAxis[0].addPlotLine({
                                        label: {
                                            text: '<span title="Total ' + this.name + ': ' + Highcharts.numberFormat(totales[this.name]) + '">Total: <b>'
                                                    + Highcharts.numberFormat(totales[this.name]) + '</b></span>',
                                            x: -50,
                                            y: 10,
                                            useHTML: true,
                                            style: {
                                                color: this.color
                                            }
                                        },
                                        value: totales[this.name],
                                        color: this.color,
                                        width: 2,
                                        id: this.name
                                    });
                                }
                            }
                        }
                    },
                    column: {
                        dataLabels: {
                            enabled: true,
                            format: '{y:,.2f}'
                        }
                    }
                },
                tooltip: {
                    pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: <b>{point.y:,.2f}</b><br/>'
                },
                series: serie
            }, true);
        }

        // Pinta las gráficas con los totales anuales e intraanuales
        $('.highchart').each(function () {
            var idPanel = $(this).attr('id');
            var idIndicador = $(this).data("id_indicador");
            var nomIndicador = $(this).data("nombre_indicador");
            var periodicidad = $(this).data("periodicidad");
            var valor_min = null;
            var valor_max = null;
            var tickInterval = null;
            if ($.isNumeric($(this).data("valor_min"))) {
                valor_min = $(this).data("valor_min");
            }
            if ($.isNumeric($(this).data("valor_max"))) {
                valor_max = $(this).data("valor_max");
            }
            //Intervalo para las encuestas
            if (valor_min === 1 && valor_max === 9) {
                tickInterval = 1;
            }
            var fecha_inicio = $(this).data("fecha_inicio");
            var fecha_fin = $(this).data("fecha_fin");
            var fecha_inicio_es = (new Date(fecha_inicio)).toLocaleDateString();
            var fecha_fin_es = (new Date(fecha_fin)).toLocaleDateString();
            // Contenedor para los datos del gráfico
            var chartSerie = new HighchartSerie();
            if (periodicidad === "anual") {
                chartSerie.categoryType = "año";
            }
            else if (periodicidad === "bienal") {
                chartSerie.categoryType = "bienal";
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
                var dataseries = chartSerie.getLinealSerie();
                // Si no es anual o bienal ocultamos valores de referencia
                if (chartSerie.categoryType !== "año" && chartSerie.categoryType !== "bienal") {
                    dataseries.forEach(function (dataserie, index) {
                        if (index !== 0) {
                            dataserie.visible = false;
                        }
                    });
                }
                //Gráfico de líneas
                pintaGrafico({
                    chart: {
                        renderTo: idPanel,
                        events: {}
                    },
                    credits: {
                        enabled: false
                    },
                    title: {
                        text: nomIndicador,
                        style: {"fontSize": "14px"}
                    },
                    subtitle: {
                        text: 'Período: ' + fecha_inicio_es + ' al ' + fecha_fin_es
                    },
                    exporting: {
                        filename: nomIndicador
                    },
                    xAxis: {
                        type: 'category'
                    },
                    yAxis: {
                        title: {
                            text: 'Valores'
                        },
                        labels: {
                            format: '{value:,.2f}'
                        },
                        min: valor_min,
                        max: valor_max,
                        tickInterval: tickInterval
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y:,.2f}'
                            }
                        }
                    },
                    tooltip: {
                        pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: <b>{point.y:,.2f}</b><br/>'
                    },
                    series: dataseries
                });
            }
        });

        //Función que pinta nuestra gráfica
        function pintaGrafico(chartOptions, barras) {
            $(document).ready(function () {
                // Añadimos evento al hacer click en el gráfico
                chartOptions.chart.events.click = function () {
                    hs.htmlExpand(document.getElementById(chartOptions.chart.renderTo), {
                        width: 9999,
                        height: 9999,
                        allowWidthReduction: true
                    }, {
                        chartOptions: chartOptions,
                        barras: barras
                    });
                };
                var chart = new Highcharts.Chart(chartOptions);
                if (barras) {
                    // Pinta la media del último grupo de datos (último periodo)
                    chart.getSelectedSeries().forEach(function (selected) {
                        chart.yAxis[0].addPlotLine({
                            label: {
                                text: '<span title="Total ' + selected.name + ': ' + Highcharts.numberFormat(totales[selected.name]) + '">Total: <b>'
                                        + Highcharts.numberFormat(totales[selected.name]) + '</b></span>',
                                x: -50,
                                y: 10,
                                useHTML: true,
                                style: {
                                    color: selected.color
                                }
                            },
                            value: totales[selected.name],
                            color: selected.color,
                            width: 2,
                            id: selected.name
                        });
                    });
                }
            });
        }

        // Crea un nuevo gráfico con un popup de Highslide
        var i = 0; //Contador de popups
        hs.zIndexCounter = 2000; //z-index del popup
        hs.Expander.prototype.onAfterExpand = function () {
            if (this.custom.chartOptions) {
                var chartOptions = this.custom.chartOptions;
                chartOptions.chart.height = 600;
                chartOptions.chart.renderTo = $('.highslide-body')[i];
                chartOptions.chart.events.click = function () {
                };
                var hsChart = new Highcharts.Chart(chartOptions);
                if (this.custom.barras) {
                    // Pinta la media del último grupo de datos (último periodo)
                    hsChart.getSelectedSeries().forEach(function (selected) {
                        hsChart.yAxis[0].addPlotLine({
                            label: {
                                text: '<span title="Total ' + selected.name + ': ' + Highcharts.numberFormat(totales[selected.name]) + '">Total: <b>'
                                        + Highcharts.numberFormat(totales[selected.name]) + '</b></span>',
                                x: -50,
                                y: 10,
                                useHTML: true,
                                style: {
                                    color: selected.color
                                }
                            },
                            value: totales[selected.name],
                            color: selected.color,
                            width: 2,
                            id: selected.name
                        });
                    });
                }
                i++;
            }
        };
    </script>
{/literal}