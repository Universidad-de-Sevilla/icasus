//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/graficas_mostrar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Muestra las gráficas para las mediciones en el fichero graficas_mostrar.tpl
//----------------------------------------------------------------------------

$(function () {

    actualizaGraficas();

    //Función que actualiza las gráficas
    function actualizaGraficas() {
        $('#container').each(function () {
            //Variables
            var idIndicador = $(this).data("id_indicador");
            var nomIndicador = $(this).data("nombre_indicador");
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

            //Fechas
            var fecha_inicio = $(this).data("fecha_inicio");
            var fecha_fin = $(this).data("fecha_fin");
            var fecha_inicio_es = (new Date(fecha_inicio)).toLocaleDateString();
            var fecha_fin_es = (new Date(fecha_fin)).toLocaleDateString();

            //Indicadores/datos intranuales con agregación manual de unidades
            var id_entidad = $(this).data("id_entidad");
            var id_tipo_agregacion = $(this).data("agregacion");

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
                }, totales);
            }
        });

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
    }

    //Función que pinta nuestra gráfica
    function pintaGrafico(chartOptions, totales) {
        // Añadimos evento al hacer click en el gráfico
        chartOptions.chart.events.click = function () {
            hs.htmlExpand(document.getElementById(chartOptions.chart.renderTo), {
                width: 9999,
                height: 9999,
                allowWidthReduction: true
            }, {
                chartOptions: chartOptions,
                totales: totales
            });
        };
        var chart = new Highcharts.Chart(chartOptions);
        if (totales) {
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
            if (this.custom.totales) {
                var totales = this.custom.totales;
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

    //Muestra el selector de los años de las mediciones
    $('#inicio').on('change', function () {
        var id_indicador = $('#btn_mostrar').data('id_indicador');
        $("#inicio option:selected").each(function () {
            var elegido = $(this).val();
            var parametros = "&id_indicador=" + id_indicador + "&inicio=" + elegido;
            $.ajax({
                url: "index.php?page=graficas_ajax&ajax=true&modulo=seleccionar_anyos" + parametros,
                success: function (datos) {
                    $("#end_year").html(datos);
                }
            });

        });
    });

    //Muestra en las gráficas los valores que están entre los períodos seleccionados
    $('#btn_mostrar').on('click', function () {
        var id_indicador = $(this).data('id_indicador');
        var inicio = $("#inicio").val();
        var fin = $("#fin").val();
        var parametros = "&id_indicador=" + id_indicador + "&inicio=" + inicio + "&fin=" + fin;
        $('#dialogo_cargando_paneles').modal('show');
        $.ajax({
            url: "index.php?page=graficas_ajax&ajax=true&modulo=mostrar" + parametros,
            success: function (datos) {
                $("#graficas").html(datos);
                actualizaGraficas();
                $('#dialogo_cargando_paneles').modal('hide');
            }
        });
    });
});