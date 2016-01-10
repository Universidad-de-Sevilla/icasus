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
$('#btn_incluir').click(agregarIndicador);//Comentar para selección por tabla

$('.receptor').click(activarReceptor);

//Descomentar para selección por tabla
//$('.indicador').click(agregarIndicador);

$('.medicion').click(mostrarMedicion);

/* --- Las funciones --- */
function agregarIndicador()
{
    //var id_indicador = $(this).attr('id_indicador'); descomentar para selección por tabla
    var id_indicador = $('#indicadores').val();//Comentar para selección por tabla
    var serie = $(".activo").data("serie");
    if ($("#resultados").hasClass('hidden')) {
        $('#resultados').removeClass('hidden');
    }
    $(".activo").empty();
    //descomentar para selección por tabla
    //$(this).clone().appendTo('.activo').wrap("<div />").after('<a id="borra' + serie + '" title="Retirar de la consulta" class="pull-right clickable" style="color:#950717"><i class="fa fa-times fa-fw"></i></a>').toggleClass("indicador escogido");

    //Comentar las 4 siguientes líneas para selección por tabla
    var nombre_indicador = $('#indicadores option:selected').text();
    $(".activo").append('<span title="' + nombre_indicador + '" class="escogido">' + nombre_indicador + '</span>');
    $(".escogido").attr('id_indicador', id_indicador);
    $(".activo").append('<a id="borra' + serie + '" title="Retirar de la consulta" class="pull-right clickable" style="color:#950717"><i class="fa fa-times fa-fw"></i></a>');

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
        if (dato.referencia && (dato.valor !== null)) {
            chartSerie.add(dato, true);
        }
    });
    // Pide las series de datos a chartSerie
    // A saber: Totales y Valores de referencia
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
    // A saber: Totales y Valores de referencia
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
    var serieHighchartResul = [];
    var totalDataResul = [];
    var nombre_consulta = '(';
    var activar_resultado = false;//Activa la visualización del resultado de operaciones
    $('.operador').each(function (i, operador)
    {
        var operacion = $(operador).find('option:selected').attr('value');
        var serie = $(operador).data('serie');
        if (operacion !== 'cotejar')
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
                    if (operacion === 'suma')
                    {
                        nombre_consulta += ' + ' + dataserieAux[0].name;
                        for (i = 0; i < totalDataResul.length; i++) {
                            totalDataResul[i].y += totalesAux[i].y;
                        }

                    }
                    else if (operacion === 'cociente')
                    {
                        nombre_consulta += ') / ' + dataserieAux[0].name;
                        for (i = 0; i < totalDataResul.length; i++) {
                            totalDataResul[i].y /= totalesAux[i].y;
                        }

                    }
                    else if (operacion === 'porcentaje')
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
                    alert("No se puede calcular con los parámetros actuales");
                }
            }
        }
        //Cotejamos
        else {
            var dataserieCot = datos[serie];
            if (serie === 0) {
                dataserieCot.forEach(function (dataserie) {
                    serieHighchartResul.push(dataserie);
                });
                if (datos[serie + 1] && !datos[serie + 2]) {
                    dataserieCot = datos[serie + 1];
                    dataserieCot.forEach(function (dataserie) {
                        serieHighchartResul.push(dataserie);
                    });
                }
            }
            else {
                if (datos[serie + 1] && !datos[serie + 2]) {
                    dataserieCot = datos[serie + 1];
                    dataserieCot.forEach(function (dataserie) {
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
    var serie = $(this).closest(".receptor").data("serie");
    datos_json[serie] = [];
    delete datos[serie];
    totalDataseries = [];
    delete datosB[serie];
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
    $(this).closest('.receptor').empty();
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