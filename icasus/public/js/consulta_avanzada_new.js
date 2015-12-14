//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/consulta_avanzada.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Incluye el código JavaScript para el fichero consulta_avanzada.tpl
//----------------------------------------------------------------------------

/* --- Comienza la magia --- */
//Están son las series iniciales que pintamos en pantalla, se agregarán más cuando se llenen
var contador_series = 5;
var datos = []; //Los datos de cada serie ya procesados
var opciones; //Las opciones para mostrar los gráficos
var datos_json = []; //Contiene los valores de los indicadores tal como vienen de la petición a la API
$('.receptor:first').toggleClass('activo');

/* --- La declaración de eventos --- */
$('#btn_mostrar_resultado').click(calcularResultado);
$('.receptor').click(activarReceptor);
$('.indicador').click(agregarIndicador);
$('.medicion').click(mostrarMedicion);

/* --- Las funciones --- */
function agregarIndicador()
{
    var id_indicador = $(this).attr('id_indicador');
    var serie = $(".activo").data("serie");
    $(".activo").empty();
    $(this).clone().appendTo('.activo').wrap("<div />").after('<a id="borra' + serie + '" title="Retirar de la consulta" class="pull-right clickable" style="color:#950717"><i class="fa fa-times fa-fw"></i></a>').toggleClass("indicador escogido");
    $('#borra' + serie).bind('click', quitarIndicador);
    $.getJSON('api_publica.php?metodo=get_subunidades_indicador&id=' + id_indicador, function (data) {
        var items = [];
        items.push('<option id="total">Total</option>');
        $.each(data, function (i, subunidad) {
            items.push('<option id="' + subunidad.id + '">' + subunidad.etiqueta + '</option>');
        });
        $('<select/>', {
            'class': 'subunidades form-control chosen-select',
            html: items.join('')
        }).bind('change', mostrarIndicadorSubunidad).appendTo('.activo');
        // Activamos chosen-select
        $(".chosen-select").chosen({
            disable_search_threshold: 10,
            no_results_text: "Oops, no se encuentran registros coincidentes"
        });
        mostrarIndicador(serie);
    });
    return false;
}

function mostrarIndicador(serie) {
    var id_indicador = $('.activo').find('.escogido').attr('id_indicador');
    var nombre_indicador = $('.activo').find('.escogido').text();
    // Contenedor para los datos del gráfico
    var chartSerie = new HighchartSerie();
    chartSerie.categoryType = "año";
    $.getJSON("api_publica.php?metodo=get_valores_con_timestamp&id=" + id_indicador, function (data) {
//        generaTablaDatos(id_indicador, nombre_indicador, data, serie);
//        datos_json[serie] = {'serie': serie, 'nombre': nombre_indicador, 'data': data};
//        datos[serie] = prepararDatos(data, serie);
//        opciones = prepararOpciones(data);
//        $("#grafica").css("height", "400px");
//        $.plot($("#grafica"), datos, opciones);

        data.forEach(function (dato) {
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
        pintaGrafico({
            chart: {
                renderTo: 'grafica',
                events: {}
            },
            credits: {
                enabled: false
            },
            title: {
                text: nombre_indicador,
                style: {"fontSize": "14px"}
            },
            subtitle: {
                text: 'Haga click sobre el gráfico para aumentarlo'
            },
            exporting: {
                filename: nombre_indicador
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
    });
    // Después de mostrar el indicador activamos el siguiente receptor
    $(".activo").nextAll(".receptor:first").trigger("click");
}

function mostrarIndicadorSubunidad()
{
    var serie = $(".activo").data("serie");
    mostrarIndicador(serie);
}

//function generaTablaDatos(id_indicador, nombre_indicador, datos, serie)
//{
//    var items = [];
//    var subunidad_actual = $('.activo').find('.subunidades').find("option:selected").text();
//    items.push('<caption>' + nombre_indicador + ' (' + subunidad_actual + ')</caption>');
//    items.push('<thead><tr><th>Periodo</th><th>Valor</th></tr></thead>');
//    $.each(datos, function (i, dato) {
//        if (dato.unidad === subunidad_actual)
//        {
//            items.push('<tr><td>' + dato.medicion + '</td><td>' + dato.valor + '</td></tr>');
//        }
//    });
//    $('#tabla' + serie).empty();
//    $('<table />', {'class': 'table table-striped table-hover',
//        'data-id_indicador': id_indicador,
//        html: items.join('')
//    }).appendTo('#tabla' + serie);
//}

function generaTablaResultados(datos)
{
    var items = [];
    items.push('<caption>Resultados</caption>');
    items.push('<thead><tr><th>Periodo</th><th>Valor</th></tr></thead>');
    $.each(datos, function (i, dato) {
        items.push('<tr><td>' + dato[0] + '</td><td>' + dato[1].toFixed(2) + '</td></tr>');
    });
    $('#tablar').empty();
    $('<table />', {'class': 'table table-striped table-hover',
        'data-id_indicador': 0,
        html: items.join('')
    }).appendTo('#tablar');
}

function mostrarMedicion(e)
{
    e.preventDefault();
    $('.medicion.actual').removeClass('actual');
    $(this).addClass('actual');
    var medicion_actual = $(this).text();
    if (medicion_actual === "Todos")
    {
        opciones = {colors: ['maroon', 'darkolivegreen', 'orange', 'green', 'pink', 'yellow', 'brown']};
        $("#grafica").css("height", "400px");
        $.plot($("#grafica"), datos, opciones);
        console.log(opciones);
    }
    else
    {
        var subunidades = [];
        var ejeY = [];
        var datos_flot = [];
        $.each(datos_json, function (s, serie) {
            if (serie.data)
            {
                $.each(serie.data, function (i, dato) {
                    if (dato.medicion === medicion_actual && dato.unidad !== "Total")
                    {
                        if (subunidades.indexOf(dato.unidad) < 0) {
                            subunidades.push(dato.unidad);
                        }
                    }
                });
            }
        });
        subunidades.sort();
        subunidades.reverse();
        $.each(subunidades, function (s, subunidad) {
            ejeY.push([s, subunidad]);
        });

        $.each(datos_json, function (s, serie) {
            if (serie.data)
            {
                var items = [];
                nombre_indicador = serie.nombre;
                $.each(serie.data, function (i, dato) {
                    if (dato.medicion === medicion_actual && dato.unidad !== "Total")
                    {
                        // Incrementa el valor orden en función de la serie para que las barras no se solapen
                        orden = subunidades.indexOf(dato.unidad) + serie.serie / 5;
                        items.push([dato.valor, orden]);
                    }
                });
                datos_flot.push({label: nombre_indicador + '(' + medicion_actual + ')', color: s, data: items});
            }
        });

        opciones = {
            series: {bars: {show: true, barWidth: 0.1, fill: 0.7, align: "center", horizontal: true}},
            legend: {position: "ne"},
            yaxis: {ticks: ejeY},
            colors: ['maroon', 'darkolivegreen', 'orange', 'green', 'pink', 'yellow', 'brown']
        };
        //generaTablaMedicion(medicion_actual);
        alto = opciones.yaxis.ticks.length * 30 + 50 + "px";
        $("#grafica").css("height", alto);
        $.plot($("#grafica"), datos_flot, opciones);
    }
}

//// Tabla de datos de las mediciones, de momento no funciona ni se usa
//function generaTablaMedicion(medicion_actual)
//{
//    var contenido_tabla = [];
//    $.each(datos_json, function (s, serie) {
//        if (serie.data)
//        {
//            nombre_indicador = serie.nombre;
//            if (s % 2 === 0) {
//                paridad = "odd";
//            } else {
//                paridad = "even";
//            }
//            contenido_tabla.push('<tr class="' + paridad + '"><td>' + serie.nombre + '</td>');
//            $.each(datos_json, function (i, dato) {
//                if (dato.medicion === medicion_actual && dato.unidad !== "Total")
//                {
//                    contenido_tabla.push('<td>' + dato.valor + '</td>');
//                }
//            });
//        }
//    });
//    $('#tabla_medicion').empty();
//    $('<table />', {'class': 'static',
//        html: contenido_tabla.join('')
//    }).appendTo('#tabla_medicion');
//}

//function prepararDatos(datos, serie)
//{
//    var items = [];
//    var subunidad_actual = $('.activo').find('.subunidades').find("option:selected").text();
//    var nombre_indicador = $('.activo').find('.escogido').text();
//    $.each(datos, function (i, dato) {
//        if (dato.unidad === subunidad_actual)
//        {
//            items.push([dato.medicion, dato.valor]);
//        }
//    });
//    datos_flot = {label: nombre_indicador + '(' + subunidad_actual + ')', color: serie, data: items};
//    return datos_flot;
//}
//
//function prepararOpciones(datos)
//{
//    var opciones = {
//        series: {lines: {show: true}, points: {show: true}},
//        legend: {position: "ne"},
//        xaxis: {tickDecimals: 0},
//        colors: ['maroon', 'darkolivegreen', 'orange', 'green', 'pink', 'yellow', 'brown']
//    };
//    return opciones;
//}
//;

function calcularResultado()
{
    var resultado = [];
    $('.operador').each(function (indice, operador)
    {
        var operacion = $(operador).find('option:selected').attr('value');
        if (operacion !== 'cotejar')
        {
            var serie = $(operador).data('serie');
            // Si es el primer operando inicializamos el array resultado con sus datos
            if (resultado.length === 0)
            {
                // Recorremos cada una de las mediciones de la serie
                for (i = 0; i < datos[serie].data.length; i++)
                {
                    resultado[i] = [parseInt(datos[serie].data[i][0]), parseFloat(datos[serie].data[i][1])];
                }
            }
            // Comprobamos que ninguna de las dos series que operan esté vacia
            if (datos[serie].data.length > 0 && datos[serie + 1].data.length > 0)
            {
                for (i = 0; i < datos[serie].data.length; i++)
                {
                    if (operacion === 'cociente')
                    {
                        resultado[i][1] /= parseFloat(datos[serie + 1].data[i][1]);
                    }
                    else if (operacion === 'suma')
                    {
                        resultado[i][1] += parseFloat(datos[serie + 1].data[i][1]);
                    }
                    else if (operacion === 'porcentaje')
                    {
                        //no funciona el operando *= como queremos, de ahi que se vuelva a dividir
                        resultado[i][1] /= parseFloat(datos[serie + 1].data[i][1] / 100);
                    }
                }
            }
            else
            {
                alert("No puedo calcular con los parámetros actuales");
            }
            console.log(resultado);
        }
    });
    resultados = [{label: 'Resultado', data: resultado}];
    opciones_resultado = {
        series: {lines: {show: true}, points: {show: true}},
        xaxis: {tickDecimals: 0},
        legend: {position: 'ne'},
        colors: ['blue', 'black']
    };
    // Generamos la tabla de resultados a partir del array 'resultado'
    generaTablaResultados(resultado);
    // Generamos la grafica con los resultados a partir del objeto 'resultados'
    $.plot($("#grafica"), resultados, opciones_resultado);
}

function activarReceptor()
{
    $('.receptor').removeClass('activo');
    $(this).toggleClass('activo');
}

function quitarIndicador()
{
    serie = $(this).closest(".receptor").data("serie");
    delete datos.serie;
    delete datos_json.serie;
    $(this).closest('.receptor').empty();
    $("#tabla" + serie).empty();
    $("#grafica").css("height", "400px");
    $.plot($("#grafica"), datos, opciones);
}

//Datatables
$(document).ready(function () {
    $('.datatable_consulta').DataTable({
        "pagingType": "full_numbers"
    });
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
                        text: '<span title="Total ' + selected.name + ': ' + Math.round(totales[selected.name] * 100) / 100 + '">Total: <b>'
                                + Math.round(totales[selected.name] * 100) / 100 + '</b></span>',
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
                        text: '<span title="Total ' + selected.name + ': ' + Math.round(totales[selected.name] * 100) / 100 + '">Total: <b>'
                                + Math.round(totales[selected.name] * 100) / 100 + '</b></span>',
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