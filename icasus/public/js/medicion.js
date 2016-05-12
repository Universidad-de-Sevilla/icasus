//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/medicion.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Funciones de la plantilla medicion.tpl
// -------------------------------------------------------

//Variables: Valor mínimo y máximo permitido
var valor_min = $("#valors").data("valor_min");
var valor_max = $("#valors").data("valor_max");

//Fechas de inicio y fin de grabación
var grabacion_inicio = $("#gi").data("grabacion_inicio");
var grabacion_fin = $("#gf").data("grabacion_fin");

actualizaGrafica();

function actualizaGrafica() {
    //Panel de tarta
    $("#container").each(function () {
        var contenedor = $(this).attr('id');
        var nomIndicador = $(this).data("nombre_indicador");
        var id_indicador = $(this).data("id_indicador");
        var id_medicion = $(this).data("id_medicion");
        //Variables para guardar el nombre y total de la medición solicitada
        var medicion, total = 0;

        var urlApi = "api_publica.php?metodo=get_valores_con_timestamp&id=" + id_indicador;

        // contenedor para los datos del gráfico
        var chartSerie = new HighchartSerie();

        $.ajax({
            url: urlApi,
            type: "GET",
            dataType: "json",
            success: onDataReceived
        });

        function onDataReceived(datos) {
            //Buscamos la medición para luego obtener su total
            while (!medicion) {
                datos.forEach(function (dato) {
                    if (dato.id_medicion == id_medicion) {
                        medicion = dato.medicion;
                    }
                });
            }
            datos.forEach(function (dato) {
                if (dato.etiqueta_mini && dato.id_medicion == id_medicion) {
                    chartSerie.add(dato);
                }
                //Guardamos el total
                if (medicion == dato.medicion && dato.id_unidad == 0) {
                    total = parseFloat(dato.valor);
                }
            });

            //Redondeamos el total
            total = Highcharts.numberFormat(total, 2);

            //Pide las series de datos a chartSerie
            var dataseries = chartSerie.getPieSerie();

            //Gráfico de tarta
            pintaGrafico({
                chart: {
                    renderTo: contenedor,
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
                    text: 'Medición: ' + medicion + ' Total: ' + total
                },
                exporting: {
                    filename: nomIndicador + '(Medición: ' + medicion + ')'
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
                    }
                },
                plotOptions: {
                    series: {
                        dataLabels: {
                            enabled: true,
                            format: '{y:,.2f} ({percentage:,.2f} %)'
                        }
                    }
                },
                tooltip: {
                    pointFormat: '<span style="color:{point.color}">\u25CF</span> {series.name}: <b>{point.y:,.2f} ({point.percentage:,.2f} %)</b><br/>'
                },
                series: dataseries
            });
        }
    });
}

//Edición de la medición
function fila_editar(medicion, id_valor)
{
    $('#valors').load("index.php?page=medicion_ajax&modulo=editarfila&ajax=true&id_medicion=" + medicion + "&id_valor=" + id_valor);
}

function fila_grabar(id_valor, medicion)
{
    var value = $('[name=v_' + id_valor + ']').val();
    var fecha_actual = new Date();
    var fecha_inicio = new Date(grabacion_inicio);
    var fecha_fin = new Date(grabacion_fin);
    value = value.replace(',', '.');
    $('#intervalo').text('[' + valor_min + ', ' + valor_max + '].');
    $('#periodo').text('(' + fecha_inicio.toLocaleDateString() + ' al ' + fecha_fin.toLocaleDateString() + ').');

    //Comprobamos que estemos dentro del periodo de grabación
    if ((fecha_actual >= fecha_inicio) && (fecha_actual <= fecha_fin)) {
        if (value !== '')
        {
            if (isNaN(value) === false)
            {
                //Si hay un intervalo [min,max]
                if ($.isNumeric(valor_min) && $.isNumeric(valor_max)) {
                    if (value < valor_min || value > valor_max) {
                        $('#dialogo_valor_intervalo').modal('show');
                    }
                    else {
                        $.ajax({
                            type: "POST",
                            url: "index.php?page=medicion_ajax&modulo=grabarfila&ajax=true",
                            data: {"id_valor": id_valor, "valor": value},
                            success: function (response) {
                                $('#valors').load("index.php?page=medicion_ajax&modulo=cancelarfila&ajax=true&id_medicion=" + medicion);
                                $('#grafica').load("index.php?page=medicion_ajax&modulo=grafica&ajax=true&id_medicion=" + medicion);
                            }
                        });
                    }
                }
                //Si hay un valor mínimo
                else if ($.isNumeric(valor_min) && !$.isNumeric(valor_max)) {
                    if (value < valor_min) {
                        $('#dialogo_valor_intervalo').modal('show');
                    }
                    else {
                        $.ajax({
                            type: "POST",
                            url: "index.php?page=medicion_ajax&modulo=grabarfila&ajax=true",
                            data: {"id_valor": id_valor, "valor": value},
                            success: function (response) {
                                $('#valors').load("index.php?page=medicion_ajax&modulo=cancelarfila&ajax=true&id_medicion=" + medicion);
                                $('#grafica').load("index.php?page=medicion_ajax&modulo=grafica&ajax=true&id_medicion=" + medicion);
                            }
                        });
                    }
                }
                //Si hay un valor máximo
                else if ($.isNumeric(valor_max) && !$.isNumeric(valor_min)) {
                    if (value > valor_max) {
                        $('#dialogo_valor_intervalo').modal('show');
                    }
                    else {
                        $.ajax({
                            type: "POST",
                            url: "index.php?page=medicion_ajax&modulo=grabarfila&ajax=true",
                            data: {"id_valor": id_valor, "valor": value},
                            success: function (response) {
                                $('#valors').load("index.php?page=medicion_ajax&modulo=cancelarfila&ajax=true&id_medicion=" + medicion);
                                $('#grafica').load("index.php?page=medicion_ajax&modulo=grafica&ajax=true&id_medicion=" + medicion);
                            }
                        });
                    }
                }
                //Si no hay definida ninguna restricción en cuanto a los valores 
                else {
                    $.ajax({
                        type: "POST",
                        url: "index.php?page=medicion_ajax&modulo=grabarfila&ajax=true",
                        data: {"id_valor": id_valor, "valor": value},
                        success: function (response) {
                            $('#valors').load("index.php?page=medicion_ajax&modulo=cancelarfila&ajax=true&id_medicion=" + medicion);
                            $('#grafica').load("index.php?page=medicion_ajax&modulo=grafica&ajax=true&id_medicion=" + medicion);
                        }
                    });
                }
            }
            else if (value === "---")
            {
                $.post("index.php?page=medicion_ajax&modulo=anularvalor&ajax=true", {id_valor: id_valor}, function () {
                    $('#valors').load("index.php?page=medicion_ajax&modulo=cancelarfila&ajax=true&id_medicion=" + medicion);
                    $('#grafica').load("index.php?page=medicion_ajax&modulo=grafica&ajax=true&id_medicion=" + medicion);
                });
            }
            else
            {
                $('#dialogo_valor_num').modal('show');
            }
        }
        else
        {
            $('#dialogo_valor_nulo').modal('show');
        }
    }
    else {
        $('#dialogo_valor_periodo').modal('show');
    }
}

function fila_cancelar(medicion)
{
    $('#valors').load("index.php?page=medicion_ajax&modulo=cancelarfila&ajax=true&id_medicion=" + medicion);
}

function etiqueta_editar(medicion, content)
{
    $('#' + content).load("index.php?page=medicion_ajax&modulo=editaretiqueta&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
}

function observaciones_editar(medicion, content)
{
    $('#' + content).load("index.php?page=medicion_ajax&modulo=editarobservaciones&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
}

function etiqueta_editar_grabar(content, medicion, tag)
{
    var value = $("[name=" + tag + "]").val();
    if (value === '') {
        $('#dialogo_etiqueta_nula').modal('show');
    }
    else {
        $.post("index.php?page=medicion_ajax&modulo=grabaretiqueta&ajax=true", {id_medicion: medicion, contenedor: content, valor: value}, function () {
            $('#' + content).load("index.php?page=medicion_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
            location.reload();
        });
    }
}

function observaciones_editar_grabar(content, medicion, tag)
{
    var value = $("[name=" + tag + "]").val();
    $.post("index.php?page=medicion_ajax&modulo=grabarobservaciones&ajax=true", {id_medicion: medicion, contenedor: content, valor: value}, function () {
        $('#' + content).load("index.php?page=medicion_ajax&modulo=cancelarobservaciones&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
    });
}

function etiqueta_editar_cancelar(content, medicion)
{
    $('#' + content).load("index.php?page=medicion_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
}

function observaciones_editar_cancelar(content, medicion)
{
    $('#' + content).load("index.php?page=medicion_ajax&modulo=cancelarobservaciones&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
}

function fecha_editar(medicion, content)
{
    $('#' + content).load("index.php?page=medicion_ajax&modulo=editaretiqueta&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
}

function fecha_grabar(medicion, content)
{
    var dia = $("[name=" + content + "Day]").val();
    var mes = $("[name=" + content + "Month]").val();
    var year = $("[name=" + content + "Year]").val();
    var value = year + "-" + mes + "-" + dia;
    $.post("index.php?page=medicion_ajax&modulo=grabaretiqueta&ajax=true", {id_medicion: medicion, contenedor: content, valor: value}, function () {
        $('#' + content).load("index.php?page=medicion_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
        $('#valors').load(location.reload());
    });
}

function fecha_cancelar(content, medicion)
{
    $('#' + content).load("index.php?page=medicion_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
}

function referencia_editar(id)
{
    $('#referencia_' + id).load("index.php?page=medicion_ajax&modulo=editarvalorreferencia&ajax=true&id_referencia=" + id);
}

function referencia_grabar(id)
{
    var value = $("[name=input_referencia_" + id + "]").val();
    value = value.replace(',', '.');

    if (value !== '')
    {
        if (isNaN(value) === false)
        {
            $.post("index.php?page=medicion_ajax&modulo=grabarvalorreferencia&ajax=true", {id_referencia: id, valor: value}, function () {
                $('#referencia_' + id).load("index.php?page=medicion_ajax&modulo=cancelarvalorreferencia&ajax=true&id=" + id);
                $('#valors').load(location.reload());
            });
        }
        else if (value === "---")
        {
            $.post("index.php?page=medicion_ajax&modulo=anularvalorreferencia&ajax=true", {id_referencia: id}, function () {
                $('#referencia_' + id).load("index.php?page=medicion_ajax&modulo=cancelarvalorreferencia&ajax=true&id=" + id);
                $('#valors').load(location.reload());
            });
        }
        else
        {
            $('#dialogo_valor_num').modal('show');
        }
    }
    else
    {
        $('#dialogo_valor_nulo').modal('show');
    }
}

function referencia_cancelar(id)
{
    $('#referencia_' + id).load("index.php?page=medicion_ajax&modulo=cancelarvalorreferencia&ajax=true&id=" + id);
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
        i++;
    }
};

//Actualización del gráfico
$('#tab_med_datos').click(function () {
    actualizaGrafica();
});

//Tablas de valores
tablas_valores = $('#tabla_valores').DataTable({
    "bPaginate": false,
    "bSort": false,
    fixedHeader: true,
    dom: "<'row'<'col-sm-12'>>" +
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-12'>>"
});

//Reajustamos las cabeceras de las datatables al cambiar de pestaña
$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    tablas_valores.fixedHeader.adjust();
});

//Reajustamos las cabeceras de las datatables al hacer scroll
$('.table-responsive').on('scroll', function () {
    tablas_valores.fixedHeader.adjust();
});