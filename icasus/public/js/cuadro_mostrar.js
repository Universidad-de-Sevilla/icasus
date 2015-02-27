//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/cuadro_mostrar.js
// Desarrolladores: Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Incluye el código JavaScript para el fichero cuadro_mostrar.tpl que gestiona 
//las gráficas de los cuadros de mando.
//----------------------------------------------------------------------------

//Diaĺogo de confirmación para el botón de borrar panel
$(".borrar").on('click', function (evento) {
    var boton_borrar, id_panel;
    boton_borrar = $(this);
    id_panel = $(this).data("id_panel");
    $('#nombre_panel').html(boton_borrar.data('nombre_panel'));
    $("#dialogo_borrar_panel").dialog({
        autoOpen: true, modal: true,
        title: "Borrar Panel",
        buttons: [
            {
                text: "Cancelar",
                class: 'red',
                style: 'color:white;',
                click: function () {
                    $(this).dialog("close");
                }
            },
            {
                text: "Confirmar",
                class: 'green',
                style: 'color:white;',
                click: function () {
                    $(this).dialog("close");
                    $.ajax({
                        url: "index.php?page=panel_borrar&ajax=true&id_panel=" + id_panel,
                        success: function (datos) {
                            $(boton_borrar).parent().siblings('.section').html('<h4>Borrando ...</h4>');
                            boton_borrar.parents(".box").remove();
                        }
                    });
                }
            }

        ]
    });
    evento.preventDefault();
});

//----------------------------------------------------------------------------------------
//GRÁFICAS DE LOS PANELES
//----------------------------------------------------------------------------------------

//Paneles de líneas
$('.panel_linea').each(function () {
    var contenedor = $(this).attr('id');
    var id_panel = $(this).data("id_panel");
    var titulo = $(this).data("titulo_panel");
    var periodicidad = $(this).data("periodicidad");
    var fecha_inicio = $(this).data("fecha_inicio");
    var fecha_fin = $(this).data("fecha_fin");
    var fecha_inicio_es = (new Date(fecha_inicio)).toLocaleDateString();
    var fecha_fin_es = (new Date(fecha_fin)).toLocaleDateString();
    //Ancho de la leyenda del gráfico
    var ancho_leyenda = $(this).width() - ($(this).width() / 20);
    //Leyenda donde irań los indicadores relacionados
    var leyenda = $(this).next('.leyenda');
    leyenda.append('<p><h4>Indicador/es:</h4><p>');
    //Guarda el identificador de los indicadores representados para evitar 
    //la repetición de nombres y de valores de referencia
    var indicadores_procesados = new Array();
    //Guarda los datos de todas las series de cada indicador del panel
    var totalDataseries = new Array();

    //Obtenemos la lista de indicadores que forman el panel 
    //y los recorremos para sacar su serie
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function (indicadores) {
        $.each(indicadores, function (index, indicador) {

            var urlApi = "api_publica.php?metodo=get_valores_con_timestamp&id=" + indicador.id +
                    "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin +
                    "&periodicidad=" + periodicidad;

            //Contenedor para los datos del gráfico
            var chartSerie = new HighchartSerie();

            if (periodicidad === "anual") {
                chartSerie.categoryType = "año";
            }
            else {
                chartSerie.categoryType = "medicion";
            }

            $.ajax({
                url: urlApi,
                type: "GET",
                dataType: "json",
                success: onDataReceived
            });

            function onDataReceived(datos) {
                datos.forEach(function (dato) {
                    //Si es un Total
                    if (indicador.id_entidad == 0) {
                        if (!dato.etiqueta_mini && !dato.referencia
                                && (dato.valor !== null)) {
                            chartSerie.add(dato);
                        }
                    }
                    //Si es una Unidad
                    else {
                        if (indicador.id_entidad == dato.id_unidad
                                && (dato.valor !== null)) {
                            chartSerie.add(dato, true);
                        }
                    }
                    //Si es una referencia
                    if (dato.referencia && (dato.valor !== null)
                            && indicadores_procesados.indexOf(indicador.id) === -1) {
                        chartSerie.add(dato);
                    }
                });

                //Incluye en listado de indicadores el indicador relacionado si no estaba ya
                if (indicadores_procesados.indexOf(indicador.id) === -1) {
                    leyenda.append('<p style="font-size:0.9em">\n\<a href="index.php?page=medicion_listar&id_indicador=' + indicador.id
                            + '" style="border:0">' + indicador.nombre + '</a></p>');
                    indicadores_procesados.push(indicador.id);
                }

                // Pide las series de datos a chartSerie
                var dataseries = chartSerie.getLinealSerie(indicador.nombre);
                // Si es no anual ocultamos valores de referencia
                if (chartSerie.categoryType !== "año") {
                    dataseries.forEach(function (dataserie, index) {
                        if (index !== 0) {
                            dataserie.visible = false;
                        }
                    });
                }

                //Sacar los datos de la dataserie y hacer un push en 
                //total_dataseries donde el nombre es el del indicador.
                dataseries.forEach(function (dataserie) {
                    totalDataseries.push(dataserie);
                });

                //Gráfico de líneas
                var chart1 = new Highcharts.Chart({
                    chart: {
                        renderTo: contenedor
                    },
                    title: {
                        text: titulo + ' ' + '(' + fecha_inicio_es + ' a ' + fecha_fin_es + ')',
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
                                    return this.y ? ((Math.round(this.y * 100)) / 100) : null;
                                }
                            }
                        }
                    },
                    legend: {
                        width: ancho_leyenda
                    },
                    series: totalDataseries
                });
            }
        });
    });
});

//Paneles de barras
$(".panel_barra").each(function () {
    var contenedor = $(this).attr('id');
    var id_panel = $(this).data("id_panel");
    var titulo = $(this).data("titulo_panel");
    var periodicidad = $(this).data("periodicidad");
    //Ancho de la leyenda del gráfico
    var ancho_leyenda = $(this).width() - ($(this).width() / 20);
    //Leyenda donde irań los indicadores relacionados
    var leyenda = $(this).next('.leyenda');
    leyenda.append('<p><h4>Indicador base (gráfico de barras):</h4><p>');
    //Guarda los totales del indicador base
    var totales = new Array();
    //Guarda los datos de todas las series de cada indicador del panel
    var totalDataseries = new Array();

    //Obtenemos la lista de indicadores que forman el panel 
    //y los recorremos para sacar su serie
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function (indicadores) {
        $.each(indicadores, function (index, indicador) {

            var urlApi = "api_publica.php?metodo=get_valores_con_timestamp&id=" + indicador.id
                    + "&periodicidad=" + periodicidad;

            // contenedor para los datos del indicador
            var chartSerie = new HighchartSerie();

            $.ajax({
                url: urlApi,
                type: "GET",
                dataType: "json",
                success: onDataReceived
            });

            function onDataReceived(datos) {
                datos.forEach(function (dato) {
                    if (dato.etiqueta_mini) {
                        chartSerie.add(dato);
                    }
                    //Total para el indicador base
                    else if (dato.id_unidad == 0 && index === 0) {
                        var pos = dato.medicion + ' - ' + indicador.nombre;
                        totales[pos] = parseFloat(dato.valor);
                    }
                });

                //Actualizamos la leyenda
                if (index === 0 && indicadores.length > 1) {
                    //Incluye en la leyenda el indicador base
                    leyenda.append('<p style="font-size:0.9em">\n\<a href="index.php?page=medicion_listar&id_indicador=' + indicador.id
                            + '" style="border:0">' + indicador.nombre + '</a></p>');
                    leyenda.append('<p><h4>Indicador/es complementarios (gráfico/s de líneas):</h4><p>');

                }
                else {
                    //Incluye en la leyenda el indicador relacionado
                    leyenda.append('<p style="font-size:0.9em">\n\<a href="index.php?page=medicion_listar&id_indicador=' + indicador.id
                            + '" style="border:0">' + indicador.nombre + '</a></p>');
                }

                // Pide las series de datos a chartSerie
                var dataseries;
                //Indicador base gráfico de barras
                if (index === 0) {
                    dataseries = chartSerie.getBarSerie(indicador.nombre);
                    // Hacemos visible el último año
                    dataseries[dataseries.length - 1].visible = true;
                    dataseries[dataseries.length - 1].selected = true;
                }
                else if (index !== 0) {
                    dataseries = chartSerie.getLinealSerie(indicador.nombre);
                    //Ocultamos los últimos años
                    for (var i = 0, n = dataseries.length - 1; i !== n; i++) {
                        dataseries[i].visible = false;
                    }
                }

                //Sacar los datos de la dataserie y hacer un push en 
                //total_dataseries donde el nombre es el del indicador.
                dataseries.forEach(function (dataserie) {
                    totalDataseries.push(dataserie);
                });

                //Gráfico combinado (barras y líneas)
                var chart1 = new Highcharts.Chart({
                    chart: {
                        renderTo: contenedor
                    },
                    title: {
                        text: titulo,
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
                                    return this.y ? ((Math.round(this.y * 100)) / 100) : null;
                                }
                            },
                            events: {
                                // Pintamos la media al hacer click en él.
                                legendItemClick: function (event) {
                                    if (this.visible) {
                                        chart1.yAxis[0].removePlotLine(this.name);
                                    } else {
                                        chart1.yAxis[0].addPlotLine({
                                            label: {
                                                text: Math.round(totales[this.name] * 100) / 100,
                                                x: -28,
                                                y: 5,
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
                                    return this.y ? ((Math.round(this.y * 100)) / 100) : null;
                                }
                            }
                        }
                    },
                    legend: {
                        width: ancho_leyenda
                    },
                    series: totalDataseries
                });
//                 Pinta la media del último grupo de datos (último periodo)
                chart1.getSelectedSeries().forEach(function (selected) {
                    chart1.yAxis[0].addPlotLine({
                        label: {
                            text: Math.round(totales[selected.name] * 100) / 100,
                            x: -28,
                            y: 5,
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
    });
});

//Paneles de tarta
$(".panel_tarta").each(function () {
    var contenedor = $(this).attr('id');
    var id_panel = $(this).data("id_panel");
    var titulo = $(this).data("titulo_panel");
    var id_medicion = $(this).data("id_medicion");
    //Ancho de la leyenda del gráfico
    var ancho_leyenda = $(this).width() - ($(this).width() / 20);
    //Variables para guardar el nombre y total de la medición solicitada
    var medicion, total = 0;
    //Leyenda donde ira el indicador relacionado
    var leyenda = $(this).next('.leyenda');
    leyenda.append('<p><h4>Indicador:</h4><p>');

    //Obtenemos la lista de indicadores que forman el panel 
    //y los recorremos para sacar su serie
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function (indicadores) {
        $.each(indicadores, function (index, indicador) {

            var urlApi = "api_publica.php?metodo=get_valores_con_timestamp&id=" + indicador.id;

            // contenedor para los datos del gráfico
            var chartSerie = new HighchartSerie();

            //Incluye en la leyenda el indicador relacionado
            leyenda.append('<p style="font-size:0.9em"><a href="index.php?page=medicion_listar&id_indicador=' + indicador.id
                    + '" style="border:0">' + indicador.nombre + '</a></p>');

            $.ajax({
                url: urlApi,
                type: "GET",
                dataType: "json",
                success: onDataReceived
            });

            function onDataReceived(datos) {
                datos.forEach(function (dato) {
                    if (dato.etiqueta_mini && dato.id_medicion == id_medicion) {
                        chartSerie.add(dato);
                        total += parseFloat(dato.valor);
                        if (!medicion) {
                            medicion = dato.medicion;
                        }
                    }
                });

                //Redondeamos el total
                total = ((Math.round(total * 100)) / 100);

                //Pide las series de datos a chartSerie
                var dataseries = chartSerie.getPieSerie();

                //Gráfico de tarta
                var chart1 = new Highcharts.Chart({
                    chart: {
                        renderTo: contenedor
                    },
                    title: {
                        text: titulo,
                        style: {"fontSize": "14px"}
                    },
                    subtitle: {
                        text: 'Medición: ' + medicion + ' Total: ' + total + ' (100%)'
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
                                    return this.y ? ((Math.round(this.y * 100)) / 100)
                                            + ' (' + (Math.round(this.percentage * 100) / 100) + '%)' : null;
                                }
                            }
                        }
                    },
                    tooltip: {
                        formatter: function () {
                            html = '<span style="font-size: 10px">' + this.key + '</span><br/>';
                            html += '<span >\u25CF</span> ' + this.series.name + ': <b>' + this.y
                                    + ' (' + (Math.round(this.percentage * 100) / 100) + '%)' + '</b><br/>';
                            return html;
                        }
                    },
                    legend: {
                        width: ancho_leyenda
                    },
                    series: dataseries
                });
            }
        });
    });
});

//Paneles de tabla
$(".panel_tabla").each(function () {
    var id_panel = $(this).data("id_panel");
    var leyenda = $(this).next('.leyenda');
    leyenda.insertBefore($(this));
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function (indicadores) {
        // De momento cogemos solo el primer indicador por si viene mas de uno 
        var indicador = indicadores[0];
        leyenda.html('<h4>' + indicador.nombre + '</h4>');
        $.getJSON("api_publica.php?metodo=get_valores_con_timestamp&id=" + indicador.id, function (datos) {
            var items = [];
            // Tomamos la entidad a mostrar del panel_indicador actual
            var id_entidad = indicador.id_entidad;
            $.each(datos, function (i, dato) {
                var paridad;
                if (dato.id_unidad == id_entidad)
                {
                    if (i % 2 === 0) {
                        paridad = "odd";
                    } else {
                        paridad = "even";
                    }
                    items.push('<tr class="' + paridad + '"><td>' + dato.medicion + '</td><td>' + dato.valor + '</td></tr>');
                }
            });
            $('<table />', {'class': 'static',
                'data-id_indicador': indicador.id,
                html: items.join('')
            }).appendTo('#panel_' + id_panel);
        });
    });
});

//Paneles de tabla multi
//Se usa en "la biblioteca en cifras"
//Solo pinta años completos de momento
//Es una función "digna de mejora"
$(".panel_tabla_multi").each(function () {
    var fecha_inicio = $(this).attr("data-fecha_inicio");
    var fecha_fin = $(this).attr("data-fecha_fin");
    var id_panel = $(this).data("id_panel");
    var leyenda = $(this).next('.leyenda');
    var altura;
    var apiURL;
    var htmlTabla;
    var cuenta_indicadores;

    leyenda.insertBefore($(this));
    leyenda.html('<h4>Poner algo aquí</h4>');

    fecha = new Date(fecha_inicio);
    anio_inicio = fecha.getFullYear();
    fecha = new Date(fecha_fin);
    anio_fin = fecha.getFullYear();
    htmlTabla += "<thead><tr><th></th>";
    for (anio = anio_inicio; anio <= anio_fin; anio++) {
        htmlTabla += "<th>" + anio + "</th>";
    }
    htmlTabla += "</tr></thead>";

    apiURL = "api_publica.php?metodo=get_indicadores_panel_con_datos&id=" + id_panel
            + "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin;

    $.getJSON(apiURL, function (indicadores) {
        $.each(indicadores, function (i, datos) {
            var indicador = datos.indicador;
            var paridad;
            if (i % 2 === 0) {
                paridad = "odd";
            } else {
                paridad = "even";
            }
            htmlTabla += '<tr class="' + paridad + '"><td>' + indicador.nombre + '</td>';
            anio = anio_inicio;
            $.each(datos.valores, function (j, valor) {
                // Comprueba que el valor corresponde a la columna del año 
                while (valor.anio > anio + j) {
                    htmlTabla += '<td>&nbsp;</td>';
                    anio++;
                }
                htmlTabla += '<td>' + valor.valor + '</td>';
            });
            htmlTabla += '</tr>';
            cuenta_indicadores = i;
        });
        $('<table />', {'class': 'static', html: htmlTabla}).appendTo('#panel_' + id_panel);
        //Ajustamos la altura de la gráfica y del contenedor según el número de indicadores del panel
        altura = (200 + (25 * cuenta_indicadores));
        $("#panel_" + id_panel).css("height", altura + "px");
        $("#panel_" + id_panel).closest(".alturo").css("height", altura + "px");
    });
});

//Paneles de métrica
$(".panel_metrica").each(function () {
    var id_panel = $(this).data("id_panel");
    var id_medicion = $(this).data("id_medicion");
    //Leyenda donde ira el indicador relacionado
    var leyenda = $(this).next('.leyenda');
    leyenda.append('<p><h4>Indicador:</h4><p>');
    var medicion; //etiqueta de la medición a mostrar
    var unidad; //etiqueta de la unidad a mostrar

    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function (indicadores) {
        // De momento cogemos solo el primer indicador por si viene mas de uno 
        var indicador = indicadores[0];

        $.getJSON("api_publica.php?metodo=get_valores_con_timestamp&id=" + indicador.id).done(function (datos) {
            var html = "";
            // Tomamos la entidad a mostrar del panel_indicador actual
            var id_entidad = indicador.id_entidad;
            //Si es un total
            if (id_entidad == 0) {
                var total = 0;
                $.each(datos, function (i, dato) {
                    if (dato.id_medicion == id_medicion && dato.etiqueta_mini)
                    {
                        total += parseFloat(dato.valor);
                        //Guardamos la medición y la unidad perteneciente
                        if (!medicion && !unidad) {
                            medicion = dato.medicion;
                            unidad = 'Total';
                        }
                    }
                });
                //Redondeamos el total
                total = ((Math.round(total * 100)) / 100);
                html = "<p style='font-size:2em; color:maroon; padding:20px 0 0 0; text-align:center; line-height:6px;'>" + total + "</p>";
                html += "<p style='padding:0 0 20px 0; text-align: center;line-height: 10px;'><strong>Valor Total</strong></p>";
            }
            //Si es una unidad
            else {
                var valor = 0;
                $.each(datos, function (i, dato) {
                    if (dato.id_medicion == id_medicion && id_entidad == dato.id_unidad)
                    {
                        valor = parseFloat(dato.valor);
                        //Guardamos la medición y la unidad perteneciente
                        if (!medicion && !unidad) {
                            medicion = dato.medicion;
                            unidad = dato.unidad;
                        }
                    }
                });
                //Redondeamos el valor
                valor = ((Math.round(valor * 100)) / 100);
                html = "<p style='font-size:2em; color:maroon; padding:20px 0 0 0; text-align:center; line-height:6px;'>" + valor + "</p>";
                html += "<p style='padding:0 0 20px 0; text-align: center;line-height: 10px;'><strong>" + unidad + "</strong></p>";
            }
            $('<div/>', {'class': 'centrado',
                html: html
            }).appendTo('#panel_' + id_panel);

            leyenda.append('<p style="font-size:0.9em"><a href="index.php?page=medicion_listar&id_indicador=' + indicador.id
                    + '" style="border:0">' + indicador.nombre + ' - ' + unidad + ' (' + medicion + ')</a></p>');
        });
    });
});