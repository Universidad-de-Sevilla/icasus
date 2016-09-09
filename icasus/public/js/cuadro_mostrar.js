//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/cuadro_mostrar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero cuadro_mostrar.tpl que gestiona 
// las gráficas de los cuadros de mando.
//----------------------------------------------------------------------------

//Diaĺogo de confirmación para el botón de borrar panel
$('#dialogo_borrado_panel').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre_panel = button.data('nombre_panel');
    var id_panel = button.data('id_panel');
    var modal = $(this);
    modal.find('#nombre_panel').text(nombre_panel);
    $('#nombre_panel_borrado').text(nombre_panel);
    modal.find('#borrar').click(function () {
        $.ajax({
            url: "index.php?page=panel_borrar&ajax=true&id_panel=" + id_panel,
            success: function () {
                button.parents(".panel").remove();
                $('#dialogo_borrado_panel').modal('hide');
                $('#dialogo_notificar_borrado_panel').modal('show');
            }
        });
    });
});
$('#dialogo_borrado_panel').on('hide.bs.modal', function () {
    var modal = $(this);
    modal.find('#borrar').unbind('click');
});

//----------------------------------------------------------------------------------------
// PANELES DEL CUADRO DE MANDO
//----------------------------------------------------------------------------------------

//Unidad del cuadro de mando
var unidad_cuadro = $('#nombre_cuadro').data('id_unidad');
var nombre_unidad = $('#nombre_cuadro').data('nombre_unidad');

//Paneles de líneas
$('.panel_linea').each(function () {
    var contenedor = $(this).attr('id');
    var id_panel = $(this).data("id_panel");
    var titulo = $(this).data("titulo_panel");
    var periodicidad = $(this).data("periodicidad");
    var anyos_atras = $(this).data("anyos_atras");
    var anyo_fin = new Date().getFullYear() - 1;
    var fecha_inicio = anyo_fin - anyos_atras + '-01-01';
    var fecha_fin = anyo_fin + '-12-31';
    var fecha_inicio_es = (new Date(fecha_inicio)).toLocaleDateString();
    var fecha_fin_es = (new Date(fecha_fin)).toLocaleDateString();
    //Ancho de la leyenda del gráfico
    var ancho_leyenda = $(this).width() - ($(this).width() / 20);
    //Indicadores/datos del panel
    var panel_indics = $('#panel_indics_' + id_panel);
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
                    panel_indics.append('<li><a title="' + indicador.nombre + '" href="index.php?page=indicador_mostrar&id_indicador=' + indicador.id
                            + '&id_entidad=' + unidad_cuadro + '">' + indicador.nombre + '</a></li>');
                    indicadores_procesados.push(indicador.id);
                }

                // Pide las series de datos a chartSerie
                var dataseries = chartSerie.getLinealSerie(indicador.nombre, index);
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
                pintaGrafico({
                    chart: {
                        renderTo: contenedor,
                        events: {}
                    },
                    credits: {
                        enabled: false
                    },
                    title: {
                        text: titulo,
                        style: {"fontSize": "14px"}
                    },
                    subtitle: {
                        text: 'Período: ' + fecha_inicio_es + ' al ' + fecha_fin_es
                    },
                    exporting: {
                        filename: titulo + ' (' + fecha_inicio_es + ' al ' + fecha_fin_es + ')'
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
                                format: '{y:,.2f}'
                            }
                        }
                    },
                    tooltip: {
                        pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: <b>{point.y:,.2f}</b><br/>'
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
    //Indicadores/datos del panel
    var panel_indics = $('#panel_indics_' + id_panel);
    //Guarda el identificador de los indicadores representados para evitar 
    //la repetición de nombres y de valores de referencia
    var indicadores_procesados = new Array();
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

                //Incluye en listado de indicadores el indicador relacionado si no estaba ya
                if (indicadores_procesados.indexOf(indicador.id) === -1) {
                    panel_indics.append('<li><a title="' + indicador.nombre + '" href="index.php?page=indicador_mostrar&id_indicador=' + indicador.id
                            + '&id_entidad=' + unidad_cuadro + '">' + indicador.nombre + '</a></li>');
                    indicadores_procesados.push(indicador.id);
                }

                // Pide las series de datos a chartSerie
                var dataseries = [];
                //Indicador base gráfico de barras
                if (index === 0) {
                    dataseries = chartSerie.getBarSerie(indicador.nombre);
                    // Hacemos visible el último año
                    dataseries[dataseries.length - 1].visible = true;
                    dataseries[dataseries.length - 1].selected = true;
                }
                //Resto de indicadores gráficos de líneas
                else if (index !== 0) {
                    dataseries = chartSerie.getLinealSerie(indicador.nombre, index);
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
                pintaGrafico({
                    chart: {
                        renderTo: contenedor,
                        events: {}
                    },
                    credits: {
                        enabled: false
                    },
                    title: {
                        text: titulo,
                        style: {"fontSize": "14px"}
                    },
                    exporting: {
                        filename: titulo
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
                                format: '{y:,.2f}'
                            },
                            events: {
                                // Pintamos la media al hacer click en él.
                                legendItemClick: function (event) {
                                    if (this.visible) {
                                        this.chart.yAxis[0].removePlotLine(this.name);
                                    } else {
                                        this.chart.yAxis[0].addPlotLine({
                                            label: {
                                                text: '<span title="Total ' + this.name + ': ' + Highcharts.numberFormat(totales[this.name], 2) + '">Total: <b>'
                                                        + Highcharts.numberFormat(totales[this.name], 2) + '</b></span>',
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
                    legend: {
                        width: ancho_leyenda
                    },
                    series: totalDataseries
                }, totales);
            }
        });
    });
});

//Paneles de métrica
$(".panel_metrica").each(function () {
    var id_panel = $(this).data("id_panel");
    var id_medicion = $(this).data("id_medicion");
    //Indicadores/datos del panel
    var panel_indics = $('#panel_indics_' + id_panel);
    var medicion = '---'; //etiqueta de la medición a mostrar
    var unidad = '---'; //etiqueta de la unidad a mostrar

    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function (indicadores) {
        // De momento cogemos solo el primer indicador por si viene mas de uno 
        var indicador = indicadores[0];

        $.getJSON("api_publica.php?metodo=get_valores_con_timestamp&id=" + indicador.id).done(function (datos) {
            var html = "";
            // Tomamos la entidad a mostrar del panel_indicador actual
            var id_entidad = indicador.id_entidad;
            //Buscamos y guardamos la medición 
            while (medicion === '---') {
                $.each(datos, function (i, dato) {
                    if (dato.id_medicion == id_medicion)
                    {
                        medicion = dato.medicion;
                    }
                });
            }
            //Buscamos y guardamos la unidad
            while (unidad === '---') {
                $.each(datos, function (i, dato) {
                    if (id_entidad == dato.id_unidad)
                    {
                        unidad = dato.unidad;
                    }
                });
            }
            //Si es un valor total
            if (id_entidad == 0) {
                var total = '---';
                //Guardada la medición localizamos el total
                $.each(datos, function (i, dato) {
                    if (dato.medicion == medicion && dato.id_unidad == 0)
                    {
                        total = parseFloat(dato.valor);
                        //Redondeamos el total
                        total = Math.round(total * 100) / 100;
                    }
                });
                html = "<h3 title='Valor'><strong>" + total + "</strong></h3>";
                html += "<h4 title='Medición - Unidad'>" + medicion + " - " + nombre_unidad + "</h4>";
            }
            //Si es el valor de una unidad concreta
            else {
                var valor = '---';
                $.each(datos, function (i, dato) {
                    if (dato.medicion == medicion && id_entidad == dato.id_unidad)
                    {
                        valor = parseFloat(dato.valor);
                        //Redondeamos el valor
                        valor = Math.round(valor * 100) / 100;
                    }
                });
                html = "<h3 title='Valor'><strong>" + valor + "</strong></h3>";
                html += "<h4 title='Medición - Unidad'>" + medicion + " - " + unidad + "</h4>";
            }
            $('<div/>', {'class': 'text-center',
                html: html
            }).appendTo('#panel_' + id_panel);

            //Incluye en listado de indicadores el indicador relacionado
            panel_indics.append('<li><a title="' + indicador.nombre + '" href="index.php?page=indicador_mostrar&id_indicador=' + indicador.id
                    + '&id_entidad=' + unidad_cuadro + '">' + indicador.nombre + '</a></li>');
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
    //Indicadores/datos del panel
    var panel_indics = $('#panel_indics_' + id_panel);

    //Obtenemos la lista de indicadores que forman el panel 
    //y los recorremos para sacar su serie
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function (indicadores) {
        $.each(indicadores, function (index, indicador) {

            var urlApi = "api_publica.php?metodo=get_valores_con_timestamp&id=" + indicador.id;

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

                //Incluye en listado de indicadores el indicador relacionado
                panel_indics.append('<li><a title="' + indicador.nombre + '" href="index.php?page=indicador_mostrar&id_indicador=' + indicador.id
                        + '&id_entidad=' + unidad_cuadro + '">' + indicador.nombre + '</a></li>');

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
                        text: titulo,
                        style: {"fontSize": "14px"}
                    },
                    subtitle: {
                        text: 'Medición: ' + medicion + ' Total: ' + total
                    },
                    exporting: {
                        filename: titulo + '(Medición: ' + medicion + ')'
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
    var anyos_atras = $(this).data("anyos_atras");
    var anyo_fin = new Date().getFullYear() - 1;
    var fecha_inicio = anyo_fin - anyos_atras + '-01-01';
    var fecha_fin = anyo_fin + '-12-31';
    var unidad = '---'; //etiqueta de la unidad a mostrar
    //Indicadores/datos del panel
    var panel_indics = $('#panel_indics_' + id_panel);
    var htmlTabla = '<table id="tabla_simple' + id_panel + '" class="table table-striped table-hover">';
    //Creamos la cabecera de la tabla
    htmlTabla += "<thead><tr><th>Medición</th><th>Valor</th></tr></thead><tbody>";

    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function (indicadores) {
        // De momento cogemos solo el primer indicador por si viene mas de uno 
        var indicador = indicadores[0];

        //Incluye en listado de indicadores el indicador relacionado
        panel_indics.append('<li><a title="' + indicador.nombre + '" href="index.php?page=indicador_mostrar&id_indicador=' + indicador.id
                + '&id_entidad=' + unidad_cuadro + '">' + indicador.nombre + '</a></li>');

        $.getJSON("api_publica.php?metodo=get_valores_con_timestamp&id=" + indicador.id + "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin, function (datos) {
            // Tomamos la entidad a mostrar del panel_indicador actual
            var id_entidad = indicador.id_entidad;
            if (id_entidad == 0) {
                unidad = nombre_unidad;
            }
            $.each(datos, function (i, dato) {
                if (dato.id_unidad == id_entidad)
                {
                    htmlTabla += '<tr><td>' + dato.medicion + '</td><td><span class="badge">' + Math.round(dato.valor * 100) / 100 + '</span></td></tr>';
                    if (unidad === '---') {
                        unidad = dato.unidad;
                    }
                }
            });
            htmlTabla += '</tbody></table>';
            htmlTabla += "<h4 title='Unidad' class='text-center'>Unidad: " + unidad + "</h4>";
            $('#panel_' + id_panel).append(htmlTabla);
            $('#tabla_simple' + id_panel).DataTable({
                "pagingType": "full_numbers",
                "iDisplayLength": 25,
                dom: "<'row'<'col-sm-12'B>>" +
                        "<'row'<'col-sm-12'tr>>" +
                        "<'row'<'col-sm-5'><'col-sm-7'>>",
                buttons: [
                    {
                        extend: 'collection',
                        text: "<i title='Exportar' class='fa fa-share-square-o fa-fw'></i> <i class='fa fa-caret-down'></i>",
                        buttons: [
                            {extend: 'csv', text: "<i title='Exportar a CSV' class='fa fa-file-text-o fa-fw'></i> Exportar a CSV"},
                            {extend: 'excel', text: "<i title='Exportar a Excel' class='fa fa-file-excel-o fa-fw'></i> Exportar a Excel"},
                            {extend: 'print', text: "<i title='Imprimir/PDF' class='fa fa-print fa-fw'></i> Imprimir/PDF"}
                        ]
                    }
                ]
            });
        });
    });
});

//Paneles de tabla multi
//Se usa en "la biblioteca en cifras" y en datos Rebiun
$(".panel_tabla_multi").each(function () {
    var anyos_atras = $(this).data("anyos_atras");
    var fecha = new Date();
    var anio_inicio = fecha.getFullYear() - anyos_atras;
    var anio_fin = fecha.getFullYear() - 1;
    var fecha_inicio = anio_inicio + "-01-01";
    var fecha_fin = anio_fin + "-12-31";
    var id_panel = $(this).data("id_panel");
    var htmlTabla = ' <div class="table-responsive"><table id="tabla_multi' + id_panel + '" class="table table-striped table-hover">';

    //Creamos la cabecera de la tabla
    htmlTabla += "<thead><tr><th>Código</th><th>Nombre</th>";
    htmlTabla += "<th>" + anio_inicio + "</th><th>" + anio_fin + "</th>";
    htmlTabla += "<th>Evolución</th></tr></thead><tbody>";

    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function (indicadores) {
        $.each(indicadores, function (index, indicador) {

            htmlTabla += '<tr><td style="white-space:nowrap">' + indicador.codigo + '</td><td><a title="' + indicador.nombre + '" href="index.php?page=indicador_mostrar&id_indicador=' + indicador.id
                    + '&id_entidad=' + unidad_cuadro + '">' + indicador.nombre + '</a></td>';

            var urlApi = "api_publica.php?metodo=get_valores_con_timestamp&id=" + indicador.id +
                    "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin;

            $.ajax({
                url: urlApi,
                type: "GET",
                async: false,
                dataType: "json",
                success: onDataReceived
            });

            var valor_anio_inicio;
            var valor_anio_fin;
            var evolucion;

            function onDataReceived(datos) {
                valor_anio_inicio = null;
                valor_anio_fin = null;
                evolucion = null;
                datos.forEach(function (dato) {
                    //Buscamos el total del año inicial
                    if (dato.id_unidad == indicador.id_entidad && dato.medicion == anio_inicio) {
                        valor_anio_inicio = Math.round(dato.valor * 100) / 100;
                        htmlTabla += '<td title="Valor" style="white-space:nowrap">' + valor_anio_inicio + '</td>';
                    }
                    //Buscamos el total del año final
                    if (dato.id_unidad == indicador.id_entidad && dato.medicion == anio_fin && valor_anio_inicio !== null) {
                        valor_anio_fin = Math.round(dato.valor * 100) / 100;
                        htmlTabla += '<td title="Valor" style="white-space:nowrap">' + valor_anio_fin + '</td>';
                    }
                    if (dato.id_unidad == indicador.id_entidad && dato.medicion == anio_fin && valor_anio_inicio === null) {
                        valor_anio_fin = Math.round(dato.valor * 100) / 100;
                        htmlTabla += '<td style="white-space:nowrap">---</td><td title="Valor" style="white-space:nowrap">' + valor_anio_fin + '</td>';
                    }
                });
                //Si existen ambos totales calculamos su diferencia
                if (valor_anio_inicio !== null && valor_anio_fin !== null) {
                    evolucion = Math.round((valor_anio_fin - valor_anio_inicio) * 100) / 100;
                    if (evolucion > 0) {
                        htmlTabla += '<td title="Incremento" style="color:green;white-space:nowrap;font-weight:bold;">' + evolucion + '</td></tr>';
                    }
                    else if (evolucion < 0) {
                        htmlTabla += '<td title="Descenso" style="color:red;white-space:nowrap;font-weight:bold;">' + evolucion + '</td></tr>';
                    }
                    else {
                        htmlTabla += '<td title="Constante" style="white-space:nowrap;font-weight:bold;">Constante</td></tr>';
                    }
                }
            }
            // Si no obtenemos resultados
            if (valor_anio_inicio === null && valor_anio_fin === null) {
                htmlTabla += '<td style="white-space:nowrap">---</td>';
            }
            if (valor_anio_fin === null) {
                htmlTabla += '<td style="white-space:nowrap">---</td>';
            }
            if (evolucion === null) {
                htmlTabla += '<td style="white-space:nowrap">---</td>';
            }
        });
        htmlTabla += '</tbody></table></div>';
        $('#panel_' + id_panel).append(htmlTabla);
        $('#tabla_multi' + id_panel).DataTable({
            "pagingType": "full_numbers",
            "iDisplayLength": 25,
            fixedHeader: true,
            dom: "<'row'<'col-sm-2'B><'col-sm-5'l><'col-sm-5'f>>" +
                    "<'row'<'col-sm-12'tr>>" +
                    "<'row'<'col-sm-5'i><'col-sm-7'p>>",
            buttons: [
                {extend: 'colvis', text: "<i title='Ver columnas' class='fa fa-columns fa-fw'></i> <i class='fa fa-caret-down'></i>"},
                {
                    extend: 'collection',
                    text: "<i title='Exportar' class='fa fa-share-square-o fa-fw'></i> <i class='fa fa-caret-down'></i>",
                    buttons: [
                        {extend: 'csv', text: "<i title='Exportar a CSV' class='fa fa-file-text-o fa-fw'></i> Exportar a CSV"},
                        {extend: 'excel', text: "<i title='Exportar a Excel' class='fa fa-file-excel-o fa-fw'></i> Exportar a Excel"},
                        {extend: 'print', text: "<i title='Imprimir/PDF' class='fa fa-print fa-fw'></i> Imprimir/PDF"}
                    ]
                }
            ]
        });
    });
});

//Función que pinta nuestra gráfica
function pintaGrafico(chartOptions, totales) {
    $(document).ready(function () {
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
                        text: '<span title="Total ' + selected.name + ': ' + Highcharts.numberFormat(totales[selected.name], 2) + '">Total: <b>'
                                + Highcharts.numberFormat(totales[selected.name], 2) + '</b></span>',
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
        if (this.custom.totales) {
            var totales = this.custom.totales;
            // Pinta la media del último grupo de datos (último periodo)
            hsChart.getSelectedSeries().forEach(function (selected) {
                hsChart.yAxis[0].addPlotLine({
                    label: {
                        text: '<span title="Total ' + selected.name + ': ' + Highcharts.numberFormat(totales[selected.name], 2) + '">Total: <b>'
                                + Highcharts.numberFormat(totales[selected.name], 2) + '</b></span>',
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