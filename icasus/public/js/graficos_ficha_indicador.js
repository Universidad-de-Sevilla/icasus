// Script basado en flot para mostrar gráficos anuales e intra anuales en la ficha de un indicador o un dato

  $(".panel_flot").each(function(index) {
    var id_panel = $(this).attr('id');
    var id_indicador = $(this).data('id_indicador');
    var nombre_indicador = $(this).data('nombre_indicador');
    var leyenda = $(this).next(".leyenda");
    var fecha_inicio = $(this).data("fecha_inicio");
    var fecha_fin = $(this).data("fecha_fin");
    var periodicidad = $(this).data("periodicidad");
    var peticion_api = "api_publica.php?metodo=get_valores_con_timestamp&id=" + id_indicador + "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin + "&periodicidad=" + periodicidad;
    //console.log(peticion_api);
    $.getJSON(peticion_api).done(function(datos) {
      var datos_flot = []; // Atención: tiene que ser siempre un array aunque sólo tenga un elemento
      var items = [];
      var referencias = [];
      var referencia_nombre;
      var etiqueta_indicador;
      var escala_tiempo;
      $.each(datos, function(i, dato) {
        if(dato.id_unidad == 0)
        {
          items.push([dato.periodo_fin, dato.valor]);
        }
        // Comprobamos si es valor referencia 
        // TODO: puede haber más de una referencia
        else if(dato.referencia == true)
        {
          referencias.push([dato.periodo_fin, dato.valor]);
          referencia_nombre = dato.unidad;
        }
      });

      // Prepara los datos del indicador
      etiqueta_indicador = '<a href="index.php?page=medicion_listar&id_indicador=' + id_indicador + '" target="_blank">' + nombre_indicador + '</a>';
      datos_flot[0] = {label: etiqueta_indicador, color: index, data: items, points: { show: true } };

      // Prepara los datos de referencia
      if (referencias.length > 0)
      {
        datos_flot[1] = {label: referencia_nombre, color: "green", data:referencias, points: { show: true }};
      }

      escala_tiempo = (periodicidad == "anual")?"year":"month";

      var opciones = {
        series: { lines: { show: true }},
        label: { show: true },
        legend: { container: leyenda },
        xaxis: { mode: "time",
                minTickSize: [1, escala_tiempo],
                /* Restamos días para ajustar la escala gráfica de tiempo */ 
                min: (new Date(fecha_inicio)).getTime() - 2000000000, 
                max: (new Date(fecha_fin)).getTime() + 2500000000  
                },
        grid: { hoverable: true },
        colors: ['maroon', 'darkblue', 'orange', 'goldenrod', 'pink', 'yellow', 'brown']
      };
      $("#" + id_panel).css("height", 200 - index * 12 + "px");
      $.plot($("#" + id_panel), datos_flot, opciones);

      // Pinta el tooltip cuando pasamos el cursor sobre un punto de la gráfica
      var previousPoint = null;
      $("#" + id_panel).bind("plothover", function (event, pos, item) {
        if (item) {
          if (previousPoint != item.dataIndex) {
            previousPoint = item.dataIndex;
            $("#tooltip").remove();
            var y = item.datapoint[1].toFixed(2),
            fecha = new Date(item.datapoint[0]),
            fecha_espania = fecha.getDate() + "/" + (fecha.getMonth()+1) + "/" + fecha.getFullYear();
            showTooltip(item.pageX, item.pageY, fecha_espania +  " - " + y + " - " + item.series.label);
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
