//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/plan_mostrar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Código javascript para plan_mostrar.tpl
//----------------------------------------------------------------------------

//Barras de botones
$(document).ready(function () {
    var botones_ficha = $('#botones_ficha').html();
    var botones_linea = $('#botones_linea').html();
    var botones_indics = $('#botones_indics').html();
    var botones_archivo = $('#botones_archivo').html();
    $('#btn_ficha').addClass('dt-buttons btn-group pull-right').append(botones_ficha);
    $('#tabla_lineas_filter').append(botones_linea);
    $('#tabla_indics_control_filter').append(botones_indics);
    $('#tabla_archivos_filter').append(botones_archivo);
});

//Borrado de líneas estratégicas
$('#dialogo_confirmar_borrado_linea').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre = button.data('nombre');
    var id_linea = button.data('id_linea');
    var id_entidad = button.data('id_entidad');
    var modal = $(this);
    var link = 'index.php?page=linea_borrar&id_entidad=' + id_entidad + '&id_linea=' + id_linea;
    modal.find('#nombre_linea').text(nombre);
    modal.find('#borrar').attr('href', link);
});

//Borrado de objetivos estratégicos
$('#dialogo_confirmar_borrado_objest').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre = button.data('nombre');
    var id_entidad = button.data('id_entidad');
    var id_objest = button.data('id_objest');
    var modal = $(this);
    var link = 'index.php?page=objest_borrar&id_objest=' + id_objest + '&id_entidad=' + id_entidad;
    modal.find('#nombre_objest').text(nombre);
    modal.find('#borrar').attr('href', link);
});

//Borrado de objetivos operacionales
$('#dialogo_confirmar_borrado_objop').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre = button.data('nombre');
    var id_objop = button.data('id_objop');
    var id_entidad = button.data('id_entidad');
    var modal = $(this);
    var link = 'index.php?page=objop_borrar&id_entidad=' + id_entidad + '&id_objop=' + id_objop;
    modal.find('#nombre_objop').text(nombre);
    modal.find('#borrar').attr('href', link);
});

//Resúmenes
$('#anyo').on('change', function () {
    var id_plan = $('#anyo').data('id_plan');
    var anyo = $('#anyo').val();
    $('#plan_anyo').html("<h4 class='text-center'><i class='fa fa-spinner fa-pulse'></i></h4>");
    $.ajax({
        url: "index.php?page=plan_ajax&ajax=true&modulo=mostrar&id_plan=" + id_plan + "&anyo=" + anyo,
        success: function () {
            $('#plan_anyo').load("index.php?page=plan_ajax&ajax=true&modulo=mostrar&id_plan=" + id_plan + "&anyo=" + anyo);
        }
    });
});

//Resultados
$('#page-wrapper').on('click', '.editar', function () {
    var id_plan = $(this).data('id_plan');
    var anyo = $(this).data('anyo');
    $('#page-wrapper #resultado_' + anyo).children('textarea').attr('readonly', false);
    $("#page-wrapper #edicion_" + anyo).load("index.php?page=plan_ajax&ajax=true&modulo=editar_resultado&id_plan=" + id_plan + "&anyo=" + anyo);
});

//Grabación de resultados
$('#page-wrapper').on('click', '.grabar', function () {
    var id_plan = $(this).data('id_plan');
    var anyo = $(this).data('anyo');
    var resultado = $('#page-wrapper #resultado_' + anyo).children('textarea').val();
    $.ajax({
        type: "POST",
        data: {'resultado': resultado},
        url: "index.php?page=plan_ajax&ajax=true&modulo=grabar_resultado&id_plan=" + id_plan + "&anyo=" + anyo,
        success: function () {
            $("#page-wrapper #edicion_" + anyo).load("index.php?page=plan_ajax&ajax=true&modulo=cancelar_edicion&id_plan=" + id_plan + "&anyo=" + anyo);
            $("#page-wrapper #resultado_" + anyo).load("index.php?page=plan_ajax&ajax=true&modulo=cancelar_resultado&id_plan=" + id_plan + "&anyo=" + anyo);
        }
    });
});

//Cancelar edición
$('#page-wrapper').on('click', '.cancelar', function () {
    var id_plan = $(this).data('id_plan');
    var anyo = $(this).data('anyo');
    $("#page-wrapper #edicion_" + anyo).load("index.php?page=plan_ajax&ajax=true&modulo=cancelar_edicion&id_plan=" + id_plan + "&anyo=" + anyo);
    $("#page-wrapper #resultado_" + anyo).load("index.php?page=plan_ajax&ajax=true&modulo=cancelar_resultado&id_plan=" + id_plan + "&anyo=" + anyo);
});


$('.objop').on('show.bs.collapse', function () {
    var num_indic = $(this).data('num_indic');
    if (num_indic) {
        $('#dialogo_cargando_paneles').modal('show');
        var id = $(this).attr('id');
        // Para cada contenedor de clase highchart vamos a pintar el gráfico
        $('.' + id + '.highchart').each(function (index) {
            var id_panel = $(this).attr('id');
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
                if (datos) {
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
                    if (chartSerie.categoryType !== "año" && chartSerie.categoryType !== "bienal") {
                        dataseries.forEach(function (dataserie, index) {
                            if (index !== 0) {
                                dataserie.visible = false;
                            }
                        });
                    }
                }
                //Gráfico de línea
                pintaGrafico({
                    chart: {
                        renderTo: id_panel,
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

                //Carga de los paneles completada
                if (num_indic === index + 1) {
                    $('#dialogo_cargando_paneles').modal('hide');
                }
            }
        });
    }
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

//Ajuste de las gráficas al tamaño del carrousel
$('.carousel').on('slide.bs.carousel', function () {
    setTimeout(function () {
        $(window).trigger('resize');
    }, 1);
});