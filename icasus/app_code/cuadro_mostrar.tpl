<div class="button_bar clearfix">
    {if $cuadro->id_usuario == $_usuario->id}
        <a href='index.php?page=panel_nuevo&id_cuadro={$cuadro->id}&id_entidad=14'><img 
                src='/icons/ff16/application_add.png' />{$smarty.const.TXT_PANEL_AGREGAR}</a> &nbsp;
        <a href='index.php?page=cuadro_editar&id_cuadro={$cuadro->id}&id_entidad=14'><img 
                src='/icons/ff16/table_edit.png' />{$smarty.const.TXT_EDIT_PROP}</a> &nbsp;
        {/if}
    <a href='index.php?page=cuadro_listar&id_entidad=14'><img 
            src='/icons/ff16/table.png' />{$smarty.const.TXT_VOLVER_LIST}</a> &nbsp;
</div>

<!-- dialogo para borrar paneles -->
<div id="dialogo_borrar_panel" class="dialog_content narrow ui-dialog-content ui-widget-content">
    <div class="block" style="opacity: 1;" >
        <div class="section" style="padding:20px">
            <p>{$smarty.const.MSG_PANEL_BORRAR} "<b><span id="nombre_panel"></span></b>" </p>
        </div>
    </div>
</div>

<!-- fin dialogo para borrar paneles -->
<div class="box grid_16">
    <div class="section">
        <p>{$cuadro->comentarios}</p>
    </div>
</div>

{if $paneles}
    {foreach $paneles as $panel}
        <div class="box grid_{$panel->ancho}" style="float:left;">
            <div class="block alturo" style="height:320px">
                <div class="titulo-panel">
                    <strong>{$panel->nombre}</strong> 
                    <a class="borrar pull-right ihidden" data-nombre_panel="{$panel->nombre}" href="#"><img src="/icons/ff16/cancel.png" /></a>
                    &nbsp; 
                    <a class="editar pull-right hidden" data-nombre_panel="{$panel->nombre}" href="#"><img src="/icons/ff16/application_add.png" /></a>
                </div>
                <div class="section">
                    <div class="panel {$panel->tipo->clase_css}" id="panel_{$panel->id}" data-idpanel="{$panel->id}" 
                         data-id_medicion="{$panel->id_medicion}" data-fecha_inicio="{$panel->fecha_inicio}" 
                         data-fecha_fin="{$panel->fecha_fin}" data-ancho="{$panel->ancho}"
                         data-periodicidad="{$panel->periodicidad}"></div>
                    <div class="leyenda"></div>
                </div>
            </div>
        </div>
    {/foreach}
{/if}

{literal}
    <script src="theme/danpin/scripts/flot/jquery.flot.min.js" type="text/javascript"></script>		
    <script src="theme/danpin/scripts/flot/jquery.flot.time.js" type="text/javascript"></script>
    <script src="theme/danpin/scripts/flot/jquery.flot.pie.min.js" type="text/javascript"></script>		
    <script src="theme/danpin/scripts/flot/jquery.flot.orderBars.js" type="text/javascript"></script>		

    <script>
        //$(".titulo-panel").on('mouseover', function(evento) { });

        $(".borrar").on('click', function (evento) {
            var boton_borrar, idpanel;
            boton_borrar = $(this);
            id_panel = boton_borrar.parents().find(".panel").data("idpanel");
            $('#nombre_panel').html(boton_borrar.data('nombre_panel'));
            $("#dialogo_borrar_panel").dialog({
                autoOpen: true, modal: true,
                buttons: [
                    {
                        text: "Confirmar",
                        "class": 'green',
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
                    },
                    {
                        text: "Cancelar",
                        "class": 'red text_only has_text',
                        click: function () {
                            $(this).dialog("close");
                        }
                    }
                ]
            });
            evento.preventDefault();
        });

        // Función para pintar los tooltips en las gráficas
        function showTooltip(x, y, contents) {
            $("<div id='tooltip'>" + contents + "</div>").css({
                position: "absolute",
                display: "none",
                top: y + 5,
                left: x + 5,
                width: "200 px",
                border: "1px solid #fdd",
                padding: "2px",
                "background-color": "#fee",
                "z-index": 1000,
                opacity: 0.80
            }).appendTo("body").fadeIn(200);
        }

        /* --- Comienza la magia --- */
        $(".panel_linea").each(function (index) {
            var datos_flot = [];
            var id_panel = $(this).data("idpanel");
            var leyenda = $(this).next(".leyenda");
            var fecha_inicio = $(this).data("fecha_inicio");
            var fecha_fin = $(this).data("fecha_fin");
            var periodicidad = $(this).data("periodicidad");
            var indice = 0; //Lo he puesto a mano porque no se como evitar el problema con el index del each para agregar las referencias cuando existan

            $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function (indicadores) {
                $.each(indicadores, function (index, indicador) {
                    $.getJSON("api_publica.php?metodo=get_valores_con_timestamp&id=" + indicador.id +
                            "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin +
                            "&periodicidad=" + periodicidad).done(function (datos) {
                        var items = [];
                        var referencias = [];
                        var referencia_nombre;
                        var unidad;
                        var etiqueta_indicador;
                        var id_entidad = indicador.id_entidad;
                        $.each(datos, function (i, dato) {
                            if (dato.id_unidad == id_entidad)
                            {
                                unidad = dato.unidad; //guarrerida española
                                items.push([dato.periodo_fin, dato.valor]);
                            }
                            // Comprobamos si es valor referencia 
                            // TODO: puede haber más de una referencia
                            else if (dato.referencia == true)
                            {
                                referencias.push([dato.periodo_fin, dato.valor]);
                                referencia_nombre = dato.unidad;
                            }
                        });
                        etiqueta_indicador = '<a href="index.php?page=medicion_listar&id_indicador=' + indicador.id + '" target="_blank">' + indicador.nombre + '</a> (' + unidad + ')';
                        datos_flot[indice] = {label: etiqueta_indicador, color: index, data: items, points: {show: true}};
                        indice++;
                        // Prepara los datos de referencia
                        if (referencias.length > 0)
                        {
                            datos_flot[indice] = {label: referencia_nombre, color: "green", data: referencias, points: {show: true}};
                            indice++;
                        }
                        var opciones = {
                            series: {lines: {show: true}},
                            label: {show: true},
                            legend: {container: leyenda},
                            xaxis: {mode: "time",
                                minTickSize: [1, "year"],
                                /* Restamos y sumamos 2 días para que la escala de tiempo esté completa*/
                                min: (new Date(fecha_inicio)).getTime() - 172800000,
                                max: (new Date(fecha_fin)).getTime() + 172800000
                            },
                            grid: {hoverable: true},
                            colors: ['maroon', 'darkblue', 'orange', 'goldenrod', 'pink', 'yellow', 'brown']
                        };
                        console.log(datos_flot);
                        $("#panel_" + id_panel).css("height", 200 - index * 12 + "px");
                        $.plot($("#panel_" + id_panel), datos_flot, opciones);

                        // Pinta el tooltip cuando pasamos el cursor sobre un punto de la gráfica
                        var previousPoint = null;
                        $("#panel_" + id_panel).bind("plothover", function (event, pos, item) {
                            if (item) {
                                if (previousPoint != item.dataIndex) {
                                    previousPoint = item.dataIndex;
                                    $("#tooltip").remove();
                                    var x = item.datapoint[0].toFixed(2),
                                            y = item.datapoint[1].toFixed(2),
                                            fecha = new Date(item.datapoint[0]),
                                            fecha_espania = fecha.getDate() + "/" + (fecha.getMonth() + 1) + "/" + fecha.getFullYear();
                                    showTooltip(item.pageX, item.pageY, fecha_espania + " - " + y + " - " + item.series.label);
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
                            if (dato.unidad != "Total")
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
                        if (index == 0)
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
                            if (previousPoint != item.dataIndex) {
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
                        if (dato.id_medicion == id_medicion)
                        {
                            // Si id_unidad es 0 se trata del valor total, en otro caso es el parcial de una subunidad
                            if (dato.id_unidad == 0)
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
            var id_panel = $(this).data("idpanel");
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
                            if (i % 2 == 0) {
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
            var id_panel = $(this).data("idpanel");
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
                    if (i % 2 == 0) {
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
            var id_panel = $(this).data("idpanel");
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
                        if ((dato.id_unidad == id_entidad || dato.id_unidad == '0') && dato.id_medicion == id_medicion)
                        {
                            if (id_entidad != '0')
                            {
                                if (dato.id_unidad != '0')
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
    </script>
{/literal}
