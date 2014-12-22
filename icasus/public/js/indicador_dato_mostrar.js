//Muestra los gráficos de los indicadores y datos
//en los ficheros indicador_mostrar.tpl y dato_mostrar.tpl

// Para cada contenedor de clase highchart vamos a pintar el gráfico
$('.highchart').each(function () {
    var idPanel = $(this).attr('id');
    var idIndicador = $(this).data("id_indicador");
    var nomIndicador = $(this).data("nombre_indicador");
    var periodicidad = $(this).data("periodicidad");
    var fecha_inicio = $(this).data("fecha_inicio");
    var fecha_fin = $(this).data("fecha_fin");
    //var milisegundosAnio = 31540000000;
    var dataseries = [];
    var chartSerie = new HighchartSerie(); // contenedor para los datos del gráfico
    if (periodicidad === "anual") {
        chartSerie.categoryType = "año";
    }
    else {
        chartSerie.categoryType = "medicion";
    }
    var urlApi = "api_publica.php?metodo=get_valores_con_timestamp&id=" + idIndicador + "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin + "&periodicidad=" + periodicidad;

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
        var chart1 = new Highcharts.Chart({
            chart: {
                type: 'line',
                height: 300,
                renderTo: idPanel
            },
            title: {
                text: nomIndicador + '(' + fecha_inicio + " a " + fecha_fin + ")",
                style: {"color": "grey", "fontSize": "12px"}
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
            series: dataseries
        });
    }
});

