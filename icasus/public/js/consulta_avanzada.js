//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/consulta_avanzada.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Incluye el código JavaScript para el fichero consulta_avanzada.tpl
//----------------------------------------------------------------------------

/* --- Comienza la magia --- */
var medicion_actual = 'Todos'; // Variable para guardar la medición donde estamos actualmente
var nombres = [];// Contiene los nombres de los indicadores añadidos a la consulta 
var datos_json = [];// Los datos de cada serie sin procesar
var datos = []; // Los datos de cada serie ya procesados para líneas
var datosB = []; // Los datos de cada serie ya procesados para barras
// Guarda los datos de todas las series de cada indicador del panel de líneas
var totalDataseries = new Array();
// Guarda los datos de todas las series de cada indicador del panel de barras
var totalDataseriesB = new Array();

$('.receptor:first').toggleClass('activo');
/* --- La declaración de eventos --- */
$('#btn_mostrar_resultado1, #btn_mostrar_resultado2').click(calcularResultado);
$('.label_receptor').click(function () {
    $(this).next('.receptor').trigger('click');
});
$('#btn_incluir').click(agregarIndicador);
$('#btn_quitar').click(quitarIndicador);
$('.receptor').click(activarReceptor);
$('.medicion').click(mostrarMedicion);

/* --- Las funciones --- */
function agregarIndicador()
{
    var id_indicador = $('#indicadores').val();
    var serie = $(".activo").data("serie");
    if ($("#resultados").hasClass('hidden')) {
        $('#resultados').removeClass('hidden');
    }
    if (!$("#sin_resultados").hasClass('hidden')) {
        $('#sin_resultados').addClass('hidden');
    }
    if ($("#btn_mostrar_resultado1").hasClass('hidden')) {
        $('#btn_mostrar_resultado1').removeClass('hidden');
    }
    if ($("#btn_quitar").hasClass('hidden')) {
        $('#btn_quitar').removeClass('hidden');
    }

    $(".activo").empty();
    $('.op' + serie).removeClass('hidden');
    var nombre_indicador = $('#indicadores option:selected').text();
    $(".activo").append('<span title="' + nombre_indicador + '" class="escogido">' + nombre_indicador + '</span>');
    $(".escogido").attr('id_indicador', id_indicador);
    $.getJSON('api_publica.php?metodo=get_subunidades_indicador&id=' + id_indicador, function (data) {
        var items = [];
        items.push('<option id="total" title="Total">Total</option>');
        $.each(data, function (i, subunidad) {
            items.push('<option id="' + subunidad.id + '" title="' + subunidad.etiqueta + '">' + subunidad.etiqueta + '</option>');
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
    nombres[serie] = nombre_indicador;
    $.getJSON("api_publica.php?metodo=get_valores_con_timestamp&id=" + id_indicador, function (data) {
        datos_json[serie] = data;
        datos[serie] = prepararDatos(data, serie);
        //Sacar los datos de la dataserie y hacer un push en 
        //total_dataseries
        datos[serie].forEach(function (dataserie) {
            totalDataseries.push(dataserie);
        });
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
                text: 'Todos',
                style: {"fontSize": "14px"}
            },
            subtitle: {
                text: 'Haga click sobre el gráfico para aumentarlo'
            },
            exporting: {
                filename: 'consulta'
            },
            xAxis: {
                type: 'category'
            },
            yAxis: {
                title: {
                    text: 'Valores'
                },
                labels: {
                    format: '{value:.2f}'
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
            series: totalDataseries
        });
        // Después de mostrar el indicador activamos el siguiente receptor
        $(".activo").nextAll(".receptor:first").trigger("click");
    });
}

function mostrarIndicadorSubunidad()
{
    var serie = $(".activo").data("serie");
    mostrarIndicador(serie);
}

function mostrarMedicion(e)
{
    e.preventDefault();
    $('.medicion.actual').removeClass('actual');
    $(this).addClass('actual');
    medicion_actual = $(this).text();
    if (medicion_actual === "Todos")
    {
        if (totalDataseries.length > 0) {
            pintaGrafico({
                chart: {
                    renderTo: 'grafica',
                    events: {}
                },
                credits: {
                    enabled: false
                },
                title: {
                    text: 'Todos',
                    style: {"fontSize": "14px"}
                },
                subtitle: {
                    text: 'Haga click sobre el gráfico para aumentarlo'
                },
                exporting: {
                    filename: 'consulta'
                },
                xAxis: {
                    type: 'category'
                },
                yAxis: {
                    title: {
                        text: 'Valores'
                    },
                    labels: {
                        format: '{value:.2f}'
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
                series: totalDataseries
            });
        }
    }
    else //Medición concreta
    {
        $.each(datos_json, function (i, dato_json) {
            datosB[i] = prepararDatosB(dato_json, i);
            datosB[i].forEach(function (dataserie) {
                totalDataseriesB.push(dataserie);
            });
        });

        if (totalDataseriesB.length > 0) {
            pintaGrafico({
                chart: {
                    renderTo: 'grafica',
                    events: {}
                },
                credits: {
                    enabled: false
                },
                title: {
                    text: medicion_actual,
                    style: {"fontSize": "14px"}
                },
                subtitle: {
                    text: 'Haga click sobre el gráfico para aumentarlo'
                },
                exporting: {
                    filename: 'consulta'
                },
                xAxis: {
                    type: 'category'
                },
                yAxis: {
                    title: {
                        text: 'Valores'
                    },
                    labels: {
                        format: '{value:.2f}'
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
                series: totalDataseriesB
            });
        }
        else {
            $('#med_actual').text(medicion_actual);
            $('#dialogo_sin_val').modal('show');
        }
    }
}

function prepararDatos(data, serie)
{
    //Actualizamos todas las series
    delete datos[serie];
    totalDataseries = [];
    //Sacar los datos de la dataserie y hacer un push en 
    //total_dataseries
    datos.forEach(function (serie) {
        serie.forEach(function (dataserie) {
            totalDataseries.push(dataserie);
        });
    });
    var subunidad_actual = $('.activo').find('.subunidades').find("option:selected").text();
    var chartSerie = new HighchartSerie();
    chartSerie.categoryType = "año";
    data.forEach(function (dato) {
        // Seleccionamos sólo los datos de la unidad 
        if (dato.unidad === subunidad_actual && (dato.valor !== null)) {
            chartSerie.add(dato, true);
        }
        // Se incluyen también los valores de referencia
//        if (dato.referencia && (dato.valor !== null)) {
//            chartSerie.add(dato, true);
//        }
    });
    // Pide las series de datos a chartSerie
    var dataseries = chartSerie.getLinealSerie(nombres[serie], serie);
    return dataseries;
}

function prepararDatosB(data, serie)
{
    //Actualizamos todas las series
    delete datosB[serie];
    totalDataseriesB = [];
    //Sacar los datos de la dataserie y hacer un push en 
    //total_dataseries
    datosB.forEach(function (serie) {
        serie.forEach(function (dataserie) {
            totalDataseriesB.push(dataserie);
        });
    });
    var chartSerie = new HighchartSerie();

    data.forEach(function (dato) {
        // Seleccionamos sólo los datos de la unidad 
        if (dato.medicion === medicion_actual && dato.unidad !== "Total"
                && !dato.referencia) {
            chartSerie.add(dato);
        }
    });
    // Pide las series de datos a chartSerie
    var dataseries = chartSerie.getBarSerie(nombres[serie]);
    // Hacemos visible
    if (dataseries.length > 0) {
        dataseries[dataseries.length - 1].visible = true;
        dataseries[dataseries.length - 1].selected = true;
    }
    return dataseries;
}

function calcularResultado()
{
    var serieHighchartResul = [];//Array de series finales resultado
    var totalDataResul = [];//Array con los cálculos de las series
    var nombre_consulta = '(';
    var activar_resultado = false;//Activa la visualización del resultado de operaciones
    var operacion = [];//Array con las operaciones
    $('.operador').each(function (i, operador)
    {
        var serie = $(operador).data('serie');
        operacion[serie] = $(operador).find('option:selected').attr('value');
        if (operacion[serie] !== 'cotejar')
        {
            activar_resultado = true;
            // Si es el primer operando inicializamos el array resultado con sus datos
            if (totalDataResul.length === 0)
            {
                var dataserie = datos[serie];
                nombre_consulta += dataserie[0].name;
                // Seleccionamos la primera, no queremos valores de referencia
                dataserie[0].data.forEach(function (datos) {
                    totalDataResul.push($.extend(true, {}, datos));
                });
            }
            if (datos[serie + 1]) {
                var dataserieAux = datos[serie + 1];
                //No tenemos en cuenta los datos de valores de referencia
                var totalesAux = dataserieAux[0].data;
                // Comprobamos que ninguna de las dos series que operan esté vacia
                if (totalDataResul.length > 0 && totalesAux.length > 0)
                {
                    if (operacion[serie] === 'suma')
                    {
                        nombre_consulta += ' + ' + dataserieAux[0].name;
                        for (i = 0; i < totalDataResul.length; i++) {
                            totalDataResul[i].y += totalesAux[i].y;
                        }

                    }
                    else if (operacion[serie] === 'cociente')
                    {
                        nombre_consulta += ') / ' + dataserieAux[0].name;
                        for (i = 0; i < totalDataResul.length; i++) {
                            totalDataResul[i].y /= totalesAux[i].y;
                        }

                    }
                    else if (operacion[serie] === 'porcentaje')
                    {
                        nombre_consulta += ' % ' + dataserieAux[0].name;
                        for (i = 0; i < totalDataResul.length; i++) {
                            //no funciona el operando *= como queremos, de ahi que se vuelva a dividir
                            totalDataResul[i].y /= (totalesAux[i].y / 100);
                        }
                    }
                }
                else
                {
                    $('#dialogo_no_cal').modal('show');
                }
            }
        }
        //Cotejamos
        else {
            if (serie === 0) {
                datos[0].forEach(function (dataserie) {
                    serieHighchartResul.push(dataserie);
                });
            }
            else if (serie === 3) {
                if (operacion[serie - 1] === 'cotejar' && datos[serie]) {
                    datos[serie].forEach(function (dataserie) {
                        serieHighchartResul.push(dataserie);
                    });
                }
                if (datos[4]) {
                    datos[4].forEach(function (dataserie) {
                        serieHighchartResul.push(dataserie);
                    });
                }
            }
            else {
                if (operacion[serie - 1] === 'cotejar' && datos[serie]) {
                    datos[serie].forEach(function (dataserie) {
                        serieHighchartResul.push(dataserie);
                    });
                }
            }
        }
    });
    //Cerramos paréntesis abiertos
    if (nombre_consulta.indexOf(')') === -1) {
        nombre_consulta += ')';
    }
    //Incluimos el resultado
    if (activar_resultado) {
        serieHighchartResul.push({
            type: 'line',
            name: nombre_consulta,
            data: totalDataResul,
            color: '#4CAE4C'
        });
    }
    //Pintamos el gráfico
    pintaGrafico({
        chart: {
            renderTo: 'grafica',
            events: {}
        },
        credits: {
            enabled: false
        },
        title: {
            text: 'Resultado de la consulta',
            style: {"fontSize": "14px"}
        },
        subtitle: {
            text: 'Haga click sobre el gráfico para aumentarlo'
        },
        exporting: {
            filename: 'consulta'
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: 'Valores'
            },
            labels: {
                format: '{value:.2f}'
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
        series: serieHighchartResul
    });
}

function activarReceptor()
{
    $('.receptor').removeClass('activo');
    $(this).toggleClass('activo');
}

function quitarIndicador()
{
    //Actualizamos todas las series
    var serie = $('.activo').data('serie');
    var serie_ant = serie - 1;

    if (serie > 0 && !datos[4]) {
        datos_json[serie_ant] = [];
        delete datos[serie_ant];
        delete datosB[serie_ant];
        $('.receptor.op' + serie_ant).empty();
        $('.op' + serie_ant).addClass('hidden');
        $('.receptor').removeClass('activo');
        $('.receptor.op' + serie_ant).addClass('activo');

    }
    else {
        datos_json[serie] = [];
        delete datos[serie];
        delete datosB[serie];
        $('.receptor.op' + serie).empty();
        $('.op' + serie).addClass('hidden');
    }

    totalDataseries = [];
    totalDataseriesB = [];
    //Sacar los datos de la dataserie y hacer un push en 
    //total_dataseries
    datos.forEach(function (serie) {
        serie.forEach(function (dataserie) {
            totalDataseries.push(dataserie);
        });
    });
    datosB.forEach(function (serie) {
        serie.forEach(function (dataserie) {
            totalDataseriesB.push(dataserie);
        });
    });

    if (medicion_actual === "Todos")
    {
        if (totalDataseries.length > 0) {
            pintaGrafico({
                chart: {
                    renderTo: 'grafica',
                    events: {}
                },
                credits: {
                    enabled: false
                },
                title: {
                    text: 'Todos',
                    style: {"fontSize": "14px"}
                },
                subtitle: {
                    text: 'Haga click sobre el gráfico para aumentarlo'
                },
                exporting: {
                    filename: 'consulta'
                },
                xAxis: {
                    type: 'category'
                },
                yAxis: {
                    title: {
                        text: 'Valores'
                    },
                    labels: {
                        format: '{value:.2f}'
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
                series: totalDataseries
            });
        }
        else {
            $('#resultados').addClass('hidden');
            $('#btn_quitar').addClass('hidden');
            $('#btn_mostrar_resultado1').addClass('hidden');
            $('#sin_resultados').removeClass('hidden');
        }
    }
    else
    {
        if (totalDataseriesB.length > 0) {
            pintaGrafico({
                chart: {
                    renderTo: 'grafica',
                    events: {}
                },
                credits: {
                    enabled: false
                },
                title: {
                    text: medicion_actual,
                    style: {"fontSize": "14px"}
                },
                subtitle: {
                    text: 'Haga click sobre el gráfico para aumentarlo'
                },
                exporting: {
                    filename: 'consulta'
                },
                xAxis: {
                    type: 'category'
                },
                yAxis: {
                    title: {
                        text: 'Valores'
                    },
                    labels: {
                        format: '{value:.2f}'
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
                series: totalDataseriesB
            });
        }
        else {
            $('#resultados').addClass('hidden');
            $('#btn_quitar').addClass('hidden');
            $('#btn_mostrar_resultado1').addClass('hidden');
            $('#sin_resultados').removeClass('hidden');
        }
    }
}

//Datatables
$(document).ready(function () {
    $('.datatable_consulta').DataTable({
        "pagingType": "full_numbers"
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
                allowWidthReduction: true,
                preserveContent: false
            }, {
                chartOptions: chartOptions
            });
        };
        var chart = new Highcharts.Chart(chartOptions);
    });
}

//Crea un nuevo gráfico con un popup de Highslide
hs.zIndexCounter = 2000; //z-index del popup
hs.Expander.prototype.onAfterExpand = function () {
    if (this.custom.chartOptions) {
        var chartOptions = this.custom.chartOptions;
        if (!this.hasChart) {
            chartOptions.chart.renderTo = $('.highslide-body')[0];
            chartOptions.chart.height = $('.highslide-body').parent().height();
            chartOptions.chart.events.click = function () {
            };
            var hsChart = new Highcharts.Chart(chartOptions);
        }
        this.hasChart = true;
    }
}; 