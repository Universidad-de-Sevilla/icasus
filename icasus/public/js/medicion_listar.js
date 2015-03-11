//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/medicion_listar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Muestra las gráficas para las mediciones en el fichero medicion_listar.tpl
//----------------------------------------------------------------------------

// Variables
var idIndicador = $("#container").data("id_indicador");
var nomIndicador = $("#container").data("nombre_indicador");
// Contenedor para los datos del gráfico
var chartSerie = new HighchartSerie();
var totales = [];

// Consulta a la base de datos
$.ajax({
    url: "api_publica.php?metodo=get_valores_con_timestamp&id=" + idIndicador,
    type: "GET",
    dataType: "json",
    success: onDataReceived
});

// Guardado de datos en HighchartSerie y totales para las medias
function onDataReceived(datos) {
    datos.forEach(function (d) {
        if (d.etiqueta_mini) {
            chartSerie.add(d);
        } else if (d.id_unidad == 0) {
            totales[d.medicion] = parseFloat(d.valor);
        }
    });
}

// Pinta y configura el gráfico resumen de valores por subunidad
$(document).ajaxComplete(function () {
    var serie = chartSerie.getBarSerie();
    // Hacemos visible el último año
    serie[serie.length - 1].visible = true;
    serie[serie.length - 1].selected = true;
    // Gráfico de barras
    var chart1 = new Highcharts.Chart({
        chart: {
            renderTo: 'container',
            options3d: {
                enabled: true,
                alpha: 5,
                depth: 80
            }
        },
        credits: {
            enabled: false
        },
        title: {
            text: nomIndicador,
            style: {"fontSize": "14px"}
        },
        exporting: {
            enabled: true
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: 'Valores'
            }
        },
        plotOptions: {
            series: {
                events: {
                    // Pintamos la media al hacer click en él.
                    legendItemClick: function (event) {
                        if (this.visible) {
                            chart1.yAxis[0].removePlotLine(this.name);
                        } else {
                            chart1.yAxis[0].addPlotLine({
                                label: {
                                    text: '<span title="Total ' + this.name + ': ' + Math.round(totales[this.name] * 100) / 100 + '">Total: <b>'
                                            + Math.round(totales[this.name] * 100) / 100 + '</b></span>',
                                    x: -60,
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
                    formatter: function () {
                        return this.y ? Math.round(this.y * 100) / 100 : null;
                    }
                },
                depth: 20
            }
        },
        series: serie
    });
    // Pinta la media del último grupo de datos (último periodo)
    chart1.getSelectedSeries().forEach(function (selected) {
        chart1.yAxis[0].addPlotLine({
            label: {
                text: '<span title="Total ' + selected.name + ': ' + Math.round(totales[selected.name] * 100) / 100 + '">Total: <b>'
                        + Math.round(totales[selected.name] * 100) / 100 + '</b></span>',
                x: -60,
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
});

// Pinta las gráficas con los totales anuales e intraanuales
$('.highchart').each(function () {
    var idPanel = $(this).attr('id');
    var idIndicador = $(this).data("id_indicador");
    var nomIndicador = $(this).data("nombre_indicador");
    var periodicidad = $(this).data("periodicidad");
    var fecha_inicio = $(this).data("fecha_inicio");
    var fecha_fin = $(this).data("fecha_fin");
    var fecha_inicio_es = (new Date(fecha_inicio)).toLocaleDateString();
    var fecha_fin_es = (new Date(fecha_fin)).toLocaleDateString();
    // Contenedor para los datos del gráfico
    var chartSerie = new HighchartSerie();

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
        var dataseries = chartSerie.getLinealSerie();
        // Si no es anual ocultamos valores de referencia
        if (chartSerie.categoryType !== "año") {
            dataseries.forEach(function (dataserie, index) {
                if (index !== 0) {
                    dataserie.visible = false;
                }
            });
        }
        //Gráfico de líneas
        var chart1 = new Highcharts.Chart({
            chart: {
                renderTo: idPanel,
                options3d: {
                    enabled: true,
                    depth: 10
                }
            },
            credits: {
                enabled: false
            },
            title: {
                text: nomIndicador + ' (' + fecha_inicio_es + ' a ' + fecha_fin_es + ')',
                style: {"fontSize": "14px"}
            },
            exporting: {
                enabled: true
            },
            xAxis: {
                type: 'category'
            },
            yAxis: {
                title: {
                    text: 'Valores'
                }
            },
            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        formatter: function () {
                            return this.y ? Math.round(this.y * 100) / 100 : null;
                        }
                    }
                }
            },
            series: dataseries
        });
    }
});