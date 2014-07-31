  $(".panel_barra").each(function(index) {
    var datos_flot = [];
    var opciones =[];
    var id_panel = $(this).data("idpanel");
    var leyenda = $(this).next(".leyenda");
    var fecha_inicio = $(this).data("fecha_inicio");
    var fecha_fin = $(this).data("fecha_fin");
    var periodicidad = $(this).data("periodicidad");
	
	alert(id_panel);
	

    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function(indicadores) {

      $.each(indicadores, function(index, indicador) {
        var url = "api_publica.php?metodo=get_valores_indicador_agrupado&id=" + indicador.id + "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin + "&periodicidad=" + periodicidad;
        console.log(url);
        $.getJSON(url, function(datos) {
          var items = []; // valores que hay que pintar en la gráfica
          var unidades = []; //array con las subunidades que vienen en los datos para pintar el eje X
          var total; // valor medio o suma de todas las subunidades
          var etiqueta_indicador = '<a href="index.php?page=medicion_listar&id_indicador=' + indicador.id + '" target="_blank">' + indicador.nombre + '</a>';

          // Recorre los datos que vienen de la api y los mete en el array items 
          // a la vez que preparo las unidades para etiquetar el eje horizontal
          $.each(datos, function(i, dato) {
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
              bars: { show: true, order: 1, barWidth: 0.5, fill: 0.6, align:'center', horizontal: false }
            };

            // La línea con el total
            var marcas = [ { color: "maroon", yaxis: { from: total, to: total } } ];

            opciones = {
              legend: { container: leyenda },
              xaxis: { ticks: unidades, min: -0.5 , max: datos.length - 1.5},
              grid: {
                backgroundColor: { colors: [ "#eee", "#eee" ] },
                borderWidth: { top: 1, right: 1, bottom: 1, left: 1 },
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
              lines:{ show: true }, 
              points:{ show: true }};
          }

          console.log(datos_flot);
          $("#panel_" + id_panel).css("height", 200 - index * 12 + "px");
          $.plot($("#panel_" + id_panel), datos_flot,  opciones );

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
