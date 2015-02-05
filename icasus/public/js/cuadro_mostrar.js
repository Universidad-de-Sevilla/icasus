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

    //Leyenda donde irań los indicadores relacionados
    var leyenda = $(this).next('.leyenda');
    leyenda.append('<p><h4>Indicador/es:</h4><p>');

    //Guarda los datos de todas las series de cada indicador del panel
    var totalDataseries = new Array();

    //Obtenemos la lista de indicadores que forman el panel 
    //y los recorremos para sacar su serie
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function (indicadores) {
        $.each(indicadores, function (index, indicador) {

            var urlApi = "api_publica.php?metodo=get_valores_con_timestamp&id=" + indicador.id +
                    "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin +
                    "&periodicidad=" + periodicidad;

            // contenedor para los datos del gráfico
            var chartSerie = new HighchartSerie();

            if (periodicidad === "anual") {
                chartSerie.categoryType = "año";
            }
            else {
                chartSerie.categoryType = "medicion";
            }

            //Incluye en la leyenda el indicador relacionado
            leyenda.append('<p style="font-size:0.9em">\n\<a href="index.php?page=medicion_listar&id_indicador=' + indicador.id
                    + '" style="border:0">' + indicador.nombre + '</a></p>');

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

                //Sacar los datos de la dataserie y hacer un push en 
                //total_dataseries donde el nombre es el del indicador.
                for (dataserie in dataseries) {
                    totalDataseries.push(dataserie);
                }
            }
        });
        //Una vez obtenido el totalDataseries pintamos el gráfico
        var chart1 = new Highcharts.Chart({
            chart: {
                height: 300,
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
            series: totalDataseries
        });
    });
});

//Paneles de barras
$(".panel_barra").each(function () {
    var contenedor = $(this).attr('id');
    var id_panel = $(this).data("id_panel");
    var titulo = $(this).data("titulo_panel");
    var periodicidad = $(this).data("periodicidad");
    var fecha_inicio = $(this).data("fecha_inicio");
    var fecha_fin = $(this).data("fecha_fin");
    var fecha_inicio_es = (new Date(fecha_inicio)).toLocaleDateString();
    var fecha_fin_es = (new Date(fecha_fin)).toLocaleDateString();

    //Leyenda donde irań los indicadores relacionados
    var leyenda = $(this).next('.leyenda');
    leyenda.append('<p><h4>Indicador base:</h4><p>');

    //Guarda los datos de todas las series de cada indicador del panel
    var totalDataseries = new Array();

    //Obtenemos la lista de indicadores que forman el panel 
    //y los recorremos para sacar su serie
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function (indicadores) {
        $.each(indicadores, function (index, indicador) {

            var urlApi = "api_publica.php?metodo=get_valores_con_timestamp&id=" + indicador.id +
                    "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin +
                    "&periodicidad=" + periodicidad;

            // contenedor para los datos del indicador
            var chartSerie = new HighchartSerie();
            //Si el indicador no es el primero(barras) 
            if (index !== 0) {

                if (periodicidad === "anual") {
                    chartSerie.categoryType = "año";
                }
                else {
                    chartSerie.categoryType = "medicion";
                }
            }

            //Actualizamos la leyenda
            if (index === 0 && indicadores.length > 1) {
                //Incluye en la leyenda el indicador base
                leyenda.append('<p style="font-size:0.9em">\n\<a href="index.php?page=medicion_listar&id_indicador=' + indicador.id
                        + '" style="border:0">' + indicador.nombre + '</a></p>');
                leyenda.append('<p><h4>Indicador/es complementarios:</h4><p>');

            }
            else {
                //Incluye en la leyenda el indicador relacionado
                leyenda.append('<p style="font-size:0.9em">\n\<a href="index.php?page=medicion_listar&id_indicador=' + indicador.id
                        + '" style="border:0">' + indicador.nombre + '</a></p>');
            }
            $.ajax({
                url: urlApi,
                type: "GET",
                dataType: "json",
                success: onDataReceived
            });

            function onDataReceived(datos) {
                datos.forEach(function (dato) {
                    //Primer indicador: gráfico de barras
                    if (index === 0) {
                        datos.forEach(function (d) {
                            if (d.etiqueta_mini) {
                                chartSerie.add(d);
                            } else if (d.id_unidad === '0') {
                                totales[d.medicion] = parseFloat(d.valor);
                            }
                        });
                    }
                    //Resto indicadores: gráfico de lineas
                    else {
                        // Agrega los que no tienen etiqueta_mini (total y referencias)
                        // descarta las mediciones de unidades (no sirven aquí)
                        if (!dato.etiqueta_mini && (dato.valor !== null)) {
                            chartSerie.add(dato);
                        }
                    }
                });

                var dataseries = [];
                // El primer indicador lo pintamos como gráfico de barras
                if (index === 0) {
                    dataseries = chartSerie.getBarSerie();
                    dataseries[dataseries.length - 1].visible = true;
                    dataseries[dataseries.length - 1].selected = true;
                }
                //El resto de indicadores se pintan con gráficos de líneas
                else {
                    // Pide las series de datos a chartSerie
                    // A saber: Totales y Valores de referencia
                    dataseries = chartSerie.getLinealSerie();
                    // Si no es anual ocultamos valores de referencia
                    if (chartSerie.categoryType !== "año") {
                        dataseries.forEach(function (indice, dataserie) {
                            if (indice !== 0) {
                                dataserie.visible = false;
                            }
                        });
                    }
                }
                //Sacar los datos de la dataserie y hacer un push en 
                //total_dataseries donde el nombre es el del indicador
                for (dataserie in dataseries) {
                    totalDataseries.push(dataserie);
                }
            }
        });
        //Una vez obtenido el totalDataseries pintamos el gráfico
        var chart1 = new Highcharts.Chart({
            chart: {
                height: 300,
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
            series: totalDataseries
        });
    });
});

//Paneles de tarta
$(".panel_tarta").each(function () {
    var contenedor = $(this).attr('id');
    var id_panel = $(this).data("id_panel");
    var titulo = $(this).data("titulo_panel");
    var periodicidad = $(this).data("periodicidad");
    var fecha_inicio = $(this).data("fecha_inicio");
    var fecha_fin = $(this).data("fecha_fin");
    var fecha_inicio_es = (new Date(fecha_inicio)).toLocaleDateString();
    var fecha_fin_es = (new Date(fecha_fin)).toLocaleDateString();

    //Guarda los datos de todas las series de cada indicador del panel
    var totalDataseries = new Array();

    //Leyenda donde ira el indicador relacionado
    var leyenda = $(this).next('.leyenda');
    leyenda.append('<p><h4>Indicador:</h4><p>');

    //Obtenemos la lista de indicadores que forman el panel 
    //y los recorremos para sacar su serie
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function (indicadores) {
        $.each(indicadores, function (index, indicador) {

            var urlApi = "api_publica.php?metodo=get_valores_con_timestamp&id=" + indicador.id +
                    "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin +
                    "&periodicidad=" + periodicidad;

            // contenedor para los datos del gráfico
            var chartSerie = new HighchartSerie();

            //Incluye en la leyenda el indicador relacionado
            leyenda.append('<p style="font-size:0.9em">\n\<a href="index.php?page=medicion_listar&id_indicador=' + indicador.id
                    + '" style="border:0">' + indicador.nombre + '</a></p>');

            $.ajax({
                url: urlApi,
                type: "GET",
                dataType: "json",
                success: onDataReceived
            });

            function onDataReceived(datos) {
                datos.forEach(function (dato) {
                    if (d.etiqueta_mini) {
                        chartSerie.add(d);
                    } else if (d.id_unidad === '0') {
                        totales[d.medicion] = parseFloat(d.valor);
                    }
                });

                var serie = chartSerie.getPieSerie();
                //Hacemos visible el último año
                serie[serie.length - 1].visible = true;
                serie[serie.length - 1].selected = true;

                //Sacar los datos de la dataserie y hacer un push en 
                //total_dataseries donde el nombre es el del indicador
                for (dataserie in dataseries) {
                    totalDataseries.push(dataserie);
                }
            }
        });
    });

    //Una vez obtenido el totalDataseries pintamos el gráfico
    var chart1 = new Highcharts.Chart({
        chart: {
            height: 300,
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
        series: totalDataseries
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
                if (dato.id_unidad === id_entidad)
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

    console.log(apiURL);
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

//Paneles de métricas
$(".panel_metrica").each(function () {
    var medicion; //etiqueta de la medición a mostrar
    var id_panel = $(this).data("id_panel");
    var ancho = $(this).data("ancho");
    var leyenda = $(this).next('.leyenda');
    var id_medicion = $(this).data("id_medicion");

    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function (indicadores) {
        // De momento cogemos solo el primer indicador por si viene mas de uno 
        var indicador = indicadores[0];

        $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id, function (datos) {
            var html = "";
            // Tomamos la entidad a mostrar del panel_indicador actual
            var id_entidad = indicador.id_entidad;
            $.each(datos, function (i, dato) {
                if ((dato.id_unidad === id_entidad || dato.id_unidad === '0') && dato.id_medicion === id_medicion)
                {
                    if (id_entidad !== '0')
                    {
                        if (dato.id_unidad !== '0')
                        {
                            html += "<p style='font-size:" + (ancho * 2 - dato.valor.length * 0.4) + "em; padding: 20px 0 10px 0; text-align: center;'>" + dato.valor + "</p>";
                            html += "<p style='text-align: center; line-height: 10px;'>" + dato.unidad + "</p>";
                        }
                        else
                        {
                            html += "<p style='font-size:2em; padding:20px 0 0 0; text-align:center; line-height:6px;'>" + dato.valor + "</p>";
                            html += "<p style='padding:0 0 20px 0; text-align: center;line-height: 10px;'><strong>Valor total</strong></p>";
                        }
                    }
                    else
                    {
                        html += "<p style='font-size:" + (ancho * 2 - dato.valor.length * 0.4) + "em; padding: 30px 0px; text-align: center;'>" + dato.valor + "</p>";
                    }
                    medicion = dato.medicion;
                }
            });
            $('<div/>', {'class': 'centrado',
                html: html
            }).appendTo('#panel_' + id_panel);
            leyenda.html('<p style="font-size:0.9em"><a href="index.php?page=medicion_listar&id_indicador=' + indicador.id
                    + '" target="_blank" style="border:0">' + indicador.nombre + '</a> - <strong>Medición:</strong> ' + medicion + '</p>');
        });
    });
});