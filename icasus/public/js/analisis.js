//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/analisis.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero analisis.tpl
//----------------------------------------------------------------------------

//Selección del análisis y el plan por años
$('#anyo').change(function () {
    var anyo = $(this).val();
    var id_indicador = $(this).data('id_indicador');
    $("#analisis_plan").load("index.php?page=analisis_ajax&ajax=true&modulo=mostrar&id_indicador=" + id_indicador + "&anyo=" + anyo);
    $.ajax({
        url: "index.php?page=analisis_ajax&ajax=true&modulo=grafica&id_indicador=" + id_indicador + "&anyo=" + anyo,
        success: function (datos) {
            $("#grafica").html(datos);
            actualizaGrafica();
        }
    });
});

//Gestión de Análisis
$('#page-wrapper').on('click', '#editar_analisis', function () {
    var id_indicador = $(this).data('id_indicador');
    var anyo = $(this).data('anyo');
    $("#page-wrapper #analisis").load("index.php?page=analisis_ajax&ajax=true&modulo=editar_analisis&id_indicador=" + id_indicador + "&anyo=" + anyo);
});

$('#page-wrapper').on('click', '#grabar_analisis', function () {
    var id_indicador = $(this).data('id_indicador');
    var anyo = $(this).data('anyo');
    var texto = $('#page-wrapper #texto_analisis').val();
    $.ajax({
        type: "POST",
        data: {'texto': texto},
        url: "index.php?page=analisis_ajax&ajax=true&modulo=grabar_analisis&id_indicador=" + id_indicador + "&anyo=" + anyo,
        success: function () {
            $("#page-wrapper #analisis").load("index.php?page=analisis_ajax&ajax=true&modulo=cancelar_analisis&id_indicador=" + id_indicador + "&anyo=" + anyo);
            $("#page-wrapper #tabla_analisis_plan").load("index.php?page=analisis_ajax&ajax=true&modulo=actualizar_tabla&id_indicador=" + id_indicador + "&anyo=" + anyo);
        }
    });
});

$('#page-wrapper').on('click', '#cancelar_analisis', function () {
    var id_indicador = $(this).data('id_indicador');
    var anyo = $(this).data('anyo');
    $("#page-wrapper #analisis").load("index.php?page=analisis_ajax&ajax=true&modulo=cancelar_analisis&id_indicador=" + id_indicador + "&anyo=" + anyo);
});

//Gestión de Planes de acción
$('#page-wrapper').on('click', '#editar_plan', function () {
    var id_indicador = $(this).data('id_indicador');
    var anyo = $(this).data('anyo');
    $("#page-wrapper #plan").load("index.php?page=analisis_ajax&ajax=true&modulo=editar_plan&id_indicador=" + id_indicador + "&anyo=" + anyo);
});

$('#page-wrapper').on('click', '#grabar_plan', function () {
    var id_indicador = $(this).data('id_indicador');
    var anyo = $(this).data('anyo');
    var texto = $('#page-wrapper #texto_plan').val();
    $.ajax({
        type: "POST",
        data: {'texto': texto},
        url: "index.php?page=analisis_ajax&ajax=true&modulo=grabar_plan&id_indicador=" + id_indicador + "&anyo=" + anyo,
        success: function () {
            $("#page-wrapper #plan").load("index.php?page=analisis_ajax&ajax=true&modulo=cancelar_plan&id_indicador=" + id_indicador + "&anyo=" + anyo);
            $("#page-wrapper #tabla_analisis_plan").load("index.php?page=analisis_ajax&ajax=true&modulo=actualizar_tabla&id_indicador=" + id_indicador + "&anyo=" + anyo);
        }
    });
});

$('#page-wrapper').on('click', '#cancelar_plan', function () {
    var id_indicador = $(this).data('id_indicador');
    var anyo = $(this).data('anyo');
    $("#page-wrapper #plan").load("index.php?page=analisis_ajax&ajax=true&modulo=cancelar_plan&id_indicador=" + id_indicador + "&anyo=" + anyo);
});

actualizaGrafica();

function actualizaGrafica() {
    // Pinta la gráfica con los totales anuales
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