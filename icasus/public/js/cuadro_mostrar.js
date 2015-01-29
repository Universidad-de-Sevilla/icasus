/* 
 * Incluye el código JavaScript para el fichero cuadro_mostrar.tpl que gestiona 
 * las gráficas de los cuadros de mando.
 */

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

    //Guarda los datos de todas las series de cada indicador del panel
    var total_dataseries = new Array();

    //Obtenemos la lista de indicadores que forman el panel
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function (indicadores) {
        $.each(indicadores, function (indicador) {

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
                dataseries = chartSerie.getLinealSerie();
                // Si no es anual ocultamos valores de referencia
                if (chartSerie.categoryType !== "año") {
                    dataseries.forEach(function (dataserie, index) {
                        if (index !== 0) {
                            dataserie.visible = false;
                        }
                    });
                }
                total_dataseries = total_dataseries.concat(dataseries);
            }
        });

        var chart1 = new Highcharts.Chart({
            chart: {
                type: 'line',
                height: 300,
                renderTo: contenedor
            },
            title: {
                text: titulo + ' ' + '(' + fecha_inicio + ' a ' + fecha_fin + ')',
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
                    text: 'valores'
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
            series: total_dataseries
        });
    });
});

//Paneles de barras
$(".panel_barra").each(function () {
    var contenedor = $(this).attr('id');
    var id_panel = $(this).data("id_panel");
    var titulo = $(this).data("titulo_panel");
    var fecha_inicio = $(this).data("fecha_inicio");
    var fecha_fin = $(this).data("fecha_fin");
    var periodicidad = $(this).data("periodicidad");

    //Guarda los datos de todas las series de cada indicador del panel
    var total_dataseries = new Array();

    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function (indicadores) {

        $.each(indicadores, function (index, indicador) {
            var url = "api_publica.php?metodo=get_valores_indicador_agrupado&id=" + indicador.id + "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin + "&periodicidad=" + periodicidad;

            $.getJSON(url, function (datos) {
                var items = []; // valores que hay que pintar en la gráfica
                var unidades = []; //array con las subunidades que vienen en los datos para pintar el eje X
                var total; // valor medio o suma de todas las subunidades
                var etiqueta_indicador = '<a href="index.php?page=medicion_listar&id_indicador=' + indicador.id + '" target="_blank">' + indicador.nombre + '</a>';

                // Recorre los datos que vienen de la api y los mete en el array items 
                // a la vez que preparo las unidades para etiquetar el eje horizontal
                $.each(datos, function (i, dato) {
                    if (dato.unidad !== "Total")
                    {
                        items.push([i, dato.valor]);
                        unidades.push([i, dato.etiqueta_mini]);
                    }
                    else
                    {
                        total = dato.valor;
                    }
                });

                // El primer indicador lo pintamos como barra
                if (index === 0)
                {
                    datos_flot[index] = {
                        label: etiqueta_indicador,
                        color: index,
                        data: items,
                        bars: {show: true, order: 1, barWidth: 0.5, fill: 0.6, align: 'center', horizontal: false}
                    };

                    // La línea con el total
                    var marcas = [{color: "maroon", yaxis: {from: total, to: total}}];

                    opciones = {
                        legend: {container: leyenda},
                        xaxis: {ticks: unidades, min: -0.5, max: datos.length - 1.5},
                        grid: {
                            backgroundColor: {colors: ["#eee", "#eee"]},
                            borderWidth: {top: 1, right: 1, bottom: 1, left: 1},
                            markings: marcas,
                            hoverable: true
                        },
                        colors: ['maroon', 'darkolivegreen', 'orange']
                    };
                }
                else
                {
                    datos_flot[index] = {
                        label: etiqueta_indicador,
                        color: index,
                        data: items,
                        lines: {show: true},
                        points: {show: true}};
                }
            }); //fin llamada api get_valores_indicador
        });
    });
});


$(".panel_barra").each(function (index) {
    var datos_flot = [];
    var opciones = [];
    var id_panel = $(this).data("idpanel");
    var leyenda = $(this).next(".leyenda");
    var fecha_inicio = $(this).data("fecha_inicio");
    var fecha_fin = $(this).data("fecha_fin");
    var periodicidad = $(this).data("periodicidad");

    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function (indicadores) {

        $.each(indicadores, function (index, indicador) {
            var url = "api_publica.php?metodo=get_valores_indicador_agrupado&id=" + indicador.id + "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin + "&periodicidad=" + periodicidad;
            console.log(url);
            $.getJSON(url, function (datos) {
                var items = []; // valores que hay que pintar en la gráfica
                var unidades = []; //array con las subunidades que vienen en los datos para pintar el eje X
                var total; // valor medio o suma de todas las subunidades
                var etiqueta_indicador = '<a href="index.php?page=medicion_listar&id_indicador=' + indicador.id + '" target="_blank">' + indicador.nombre + '</a>';

                // Recorre los datos que vienen de la api y los mete en el array items 
                // a la vez que preparo las unidades para etiquetar el eje horizontal
                $.each(datos, function (i, dato) {
                    if (dato.unidad !== "Total")
                    {
                        items.push([i, dato.valor]);
                        unidades.push([i, dato.etiqueta_mini]);
                    }
                    else
                    {
                        total = dato.valor;
                    }
                });

                // El primer indicador lo pintamos como barra
                if (index === 0)
                {
                    datos_flot[index] = {
                        label: etiqueta_indicador,
                        color: index,
                        data: items,
                        bars: {show: true, order: 1, barWidth: 0.5, fill: 0.6, align: 'center', horizontal: false}
                    };

                    // La línea con el total
                    var marcas = [{color: "maroon", yaxis: {from: total, to: total}}];

                    opciones = {
                        legend: {container: leyenda},
                        xaxis: {ticks: unidades, min: -0.5, max: datos.length - 1.5},
                        grid: {
                            backgroundColor: {colors: ["#eee", "#eee"]},
                            borderWidth: {top: 1, right: 1, bottom: 1, left: 1},
                            markings: marcas,
                            hoverable: true
                        },
                        colors: ['maroon', 'darkolivegreen', 'orange']
                    };
                }
                else
                {
                    datos_flot[index] = {
                        label: etiqueta_indicador,
                        color: index,
                        data: items,
                        lines: {show: true},
                        points: {show: true}};
                }

                console.log(datos_flot);
                $("#panel_" + id_panel).css("height", 200 - index * 12 + "px");
                $.plot($("#panel_" + id_panel), datos_flot, opciones);

            }); //fin llamada api get_valores_indicador

            // Pinta el tooltip cuando pasamos el cursor sobre un punto de la gráfica
            var previousPoint = null;
            $("#panel_" + id_panel).bind("plothover", function (event, pos, item) {
                if (item) {
                    if (previousPoint !== item.dataIndex) {
                        previousPoint = item.dataIndex;
                        $("#tooltip").remove();
                        var x = item.datapoint[0].toFixed(2),
                                y = item.datapoint[1].toFixed(2),
                                z = item.datapoint[0];
                        var fecha = (new Date(z)).getDate() + "/" + (new Date(z)).getMonth() + "/" + (new Date(z)).getFullYear();
                        showTooltip(item.pageX, item.pageY, y + " - " + item.series.label);
                        console.log(item);
                    }
                }
                else
                {
                    $("#tooltip").remove();
                    previousPoint = null;
                }
            }); // termina código para tooltip
        });
    });
});

$(".panel_tarta").each(function (index) {
    var datos_flot = [];
    var total; // valor total del indicador para esta medición
    var medicion; //etiqueta de la medición que vamos a mostrar
    var id_medicion = $(this).data("id_medicion");
    var id_panel = $(this).data("idpanel");
    var leyenda = $(this).next('.leyenda');
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function (indicadores) {
        var indicador = indicadores[0];
        $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id, function (datos) {
            var items = [];
            $.each(datos, function (i, dato) {
                if (dato.id_medicion === id_medicion)
                {
                    // Si id_unidad es 0 se trata del valor total, en otro caso es el parcial de una subunidad
                    if (dato.id_unidad === 0)
                    {
                        total = dato.valor;
                        medicion = dato.medicion;
                    }
                    else
                    {
                        datos_flot.push({label: dato.unidad, data: parseFloat(dato.valor)});
                        medicion = dato.medicion;
                    }
                }
            });
            //opciones =  { series: { pie: { show: true, radius: 1, label: { show: true, radius: 2/3, threshold: 0.05 } } }, legend: { show: false } };
            var opciones = {
                //series: { pie: { show: true, label: {threshold: 0.04} } },
                series:
                        {
                            pie: {
                                show: true,
                                label: {
                                    show: true,
                                    formatter: function (label, series)
                                    {
                                        return '<div style="font-size:x-small;text-align:center;padding:2px;color:'
                                                + series.color + ';">' + label + '<br/>' + series.data[0][1] + '</div>';
                                    },
                                    threshold: 0.05
                                }
                            }
                        },
                grid: {hoverable: true},
                legend: {show: false}
            };

            // Cuando se pase el cursor sobre la tarta aparecerán los valores de cada porción
            $("#panel_" + id_panel).bind("plothover", function (event, pos, item) {
                // alert("You clicked at " + pos.x + ", " + pos.y);
                if (item)
                {
                    leyenda.html("<div style='width:4px;height:0;border:5px solid " + item.series.color + ";float:left'></div> <h4>" + item.series.label + ": " + Math.round(item.series.percent) + "% (" + item.series.data[0][1] + ")</h4>");
                }
                else
                {
                    leyenda.html('<p>' + indicador.nombre + ' - Medición: <strong>' + medicion +
                            '</strong> - Total: <strong>' + total + '</strong></p>');
                }
            });
            $("#panel_" + id_panel).css("height", "200px");
            $.plot($("#panel_" + id_panel), datos_flot, opciones);
            leyenda.html('<p style="font-size:10px;">' + indicador.nombre + ' - Medición: <strong>' + medicion +
                    '</strong> - Total: <strong>' + total + '</strong></p>');
        });
    });
});


$(".panel_tabla").each(function (index) {
    var datos_flot = [];
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

// Se usa en "la biblioteca en cifras"
// Solo pinta años completos de momento
// Es una función "digna de mejora"
$(".panel_tabla_multi").each(function (index) {
    var datos_flot = [];
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


$(".panel_metrica").each(function (index) {
    var datos_flot = [];
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


