//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/entidad_mostrar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Muestra los gráficos de los indicadores y datos en entidad_mostrar.tpl
//----------------------------------------------------------------------------

$('.proceso').click(function () {
    var id_proceso = $(this).data('id_proceso');
    // Para cada contenedor de clase highchart vamos a pintar el gráfico
    $('.' + id_proceso + '.highchart').each(function () {
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
            //Gráfico de línea
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
                    filename: nomIndicador + ' (' + fecha_inicio_es + ' al ' + fecha_fin_es + ')'
                },
                xAxis: {
                    type: 'category'
                },
                yAxis: {
                    title: {
                        text: 'Valores'
                    },
                    min: valor_min,
                    max: valor_max,
                    tickInterval: tickInterval
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
});

//Función que pinta nuestra gráfica
function pintaGrafico(chartOptions) {
    $(document).ready(function () {
        // Añadimos evento al hacer click en el gráfico
        chartOptions.chart.events.click = function () {
            hs.htmlExpand(document.getElementById(chartOptions.chart.renderTo), {
                width: 9999,
                height: 9999,
                allowWidthReduction: true
            }, {
                chartOptions: chartOptions
            });
        };
        var chart = new Highcharts.Chart(chartOptions);
    });
}

//Crea un nuevo gráfico con un popup de Highslide
var i = 0; //Contador de popus
hs.zIndexCounter = 2000; //z-index del popup
hs.Expander.prototype.onAfterExpand = function () {
    if (this.custom.chartOptions) {
        var chartOptions = this.custom.chartOptions;
        chartOptions.chart.height = 600;
        chartOptions.chart.renderTo = $('.highslide-body')[i];
        chartOptions.chart.events.click = function () {
        };
        var hsChart = new Highcharts.Chart(chartOptions);
        i++;
    }
};