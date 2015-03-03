// -------------------------------------------------------
// Proyecto Icasus
// Funciones de la plantilla medicion_editar.tpl
// -------------------------------------------------------

//Diaĺogo de confirmación para el botón de borrar medición
$('a.confirmar').click(function (event)
{
    event.preventDefault();
    var url = $(this).attr('href');
    var confirm_box = confirm('Pulse "Aceptar" para borrar esta Medición. Recuerde que se borrarán los Valores y los Valores de Referencia recogidos para esta Medición.');
    if (confirm_box)
    {
        window.location = url;
    }
});

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
                renderTo: contenedor,
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            credits: {
                enabled: false
            },
            title: {
                text: nomIndicador,
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
                },
                pie: {
                    depth: 25
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
            series: dataseries
        });
    }
});

//Edición de la medición
function fila_editar(medicion, id_valor)
{
    $('#valors').load("index.php?page=medicion_editar_ajax&modulo=editarfila&ajax=true&id_medicion=" + medicion + "&id_valor=" + id_valor);
}

function fila_grabar(id_valor, medicion)
{
    var value = $('[name=v_' + id_valor + ']').val();
    value = value.replace(',', '.');
    if (value !== '')
    {
        if (isNaN(value) === false)
        {
            $.ajax({
                type: "POST",
                url: "index.php?page=medicion_editar_ajax&modulo=grabarfila&ajax=true",
                data: {"id_valor": id_valor, "valor": value},
                success: function (response) {
                    $('#valors').load("index.php?page=medicion_editar_ajax&modulo=cancelarfila&ajax=true&id_medicion=" + medicion);
                }
            });
            /*
             * $.post("index.php?page=medicion_editar_ajax&modulo=grabarfila&ajax=true",{id_valor:id_valor, valor:value},function(){
             $('#valors').load("index.php?page=medicion_editar_ajax&modulo=cancelarfila&ajax=true&id_medicion="+medicion);
             });
             */
        }
        else if (value === "---")
        {
            $.post("index.php?page=medicion_editar_ajax&modulo=anularvalor&ajax=true", {id_valor: id_valor}, function () {
                $('#valors').load("index.php?page=medicion_editar_ajax&modulo=cancelarfila&ajax=true&id_medicion=" + medicion);
            });
        }
        else
        {
            alert('Está intentando introducir un dato que no es reconocido como número.');
        }
    }
    else
    {
        alert('Está intentando introducir un valor vacio.\nPuede restituir el valor anterior pulsando el icono "X" (cancelar). \nPuede dejarlo en blanco (nulo) introduciendo tres guiones seguidos (---)');
    }
}

function fila_cancelar(medicion)
{
    $('#valors').load("index.php?page=medicion_editar_ajax&modulo=cancelarfila&ajax=true&id_medicion=" + medicion);
}

function etiqueta_editar(medicion, content)
{
    $('#' + content).load("index.php?page=medicion_editar_ajax&modulo=editaretiqueta&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
}

function observaciones_editar(medicion, content)
{
    $('#' + content).load("index.php?page=medicion_editar_ajax&modulo=editarobservaciones&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
}

function etiqueta_editar_grabar(content, medicion, tag)
{
    var value = $("[name=" + tag + "]").val();
    $.post("index.php?page=medicion_editar_ajax&modulo=grabaretiqueta&ajax=true", {id_medicion: medicion, contenedor: content, valor: value}, function () {
        $('#' + content).load("index.php?page=medicion_editar_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
    });
}

function observaciones_editar_grabar(content, medicion, tag)
{
    var value = $("[name=" + tag + "]").val();
    $.post("index.php?page=medicion_editar_ajax&modulo=grabarobservaciones&ajax=true", {id_medicion: medicion, contenedor: content, valor: value}, function () {
        $('#' + content).load("index.php?page=medicion_editar_ajax&modulo=cancelarobservaciones&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
    });
}

function etiqueta_editar_cancelar(content, medicion)
{
    $('#' + content).load("index.php?page=medicion_editar_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
}

function observaciones_editar_cancelar(content, medicion)
{
    $('#' + content).load("index.php?page=medicion_editar_ajax&modulo=cancelarobservaciones&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
}

function fecha_editar(medicion, content)
{
    $('#' + content).load("index.php?page=medicion_editar_ajax&modulo=editaretiqueta&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
}

function fecha_grabar(medicion, content)
{

    var dia = $("[name=" + content + "Day]").val();
    var mes = $("[name=" + content + "Month]").val();
    var year = $("[name=" + content + "Year]").val();
    var value = year + "-" + mes + "-" + dia;
    $.post("index.php?page=medicion_editar_ajax&modulo=grabaretiqueta&ajax=true", {id_medicion: medicion, contenedor: content, valor: value}, function () {
        $('#' + content).load("index.php?page=medicion_editar_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
    });
}

function fecha_cancelar(content, medicion)
{
    $('#' + content).load("index.php?page=medicion_editar_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion=" + medicion + "&contenedor=" + content);
}

function referencia_editar(id)
{
    $('#referencia_' + id).load("index.php?page=medicion_editar_ajax&modulo=editarvalorreferencia&ajax=true&id_referencia=" + id);
}

function referencia_grabar(id)
{
    var value = $("[name=input_referencia_" + id + "]").val();
    value = value.replace(',', '.');

    if (value !== '')
    {
        if (isNaN(value) === false)
        {
            $.post("index.php?page=medicion_editar_ajax&modulo=grabarvalorreferencia&ajax=true", {id_referencia: id, valor: value}, function () {
                $('#referencia_' + id).load("index.php?page=medicion_editar_ajax&modulo=cancelarvalorreferencia&ajax=true&id=" + id);
            });
        }
        else if (value === "---")
        {
            $.post("index.php?page=medicion_editar_ajax&modulo=anularvalorreferencia&ajax=true", {id_referencia: id}, function () {
                $('#referencia_' + id).load("index.php?page=medicion_editar_ajax&modulo=cancelarvalorreferencia&ajax=true&id=" + id);
            });
        }
        else
        {
            alert('Está intentando introducir un dato que no es reconocido como número.');
        }
    }
    else
    {
        alert('Está intentando introducir un valor vacio.\n\nPuede restituir el valor con [cancelar].\nPuede dejarlo en blanco (nulo) introduciendo tres guiones seguidos (---).');
    }
}

function referencia_cancelar(id)
{
    $('#referencia_' + id).load("index.php?page=medicion_editar_ajax&modulo=cancelarvalorreferencia&ajax=true&id=" + id);
}

