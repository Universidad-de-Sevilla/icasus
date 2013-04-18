<style>
.hidden {
  display: none;
}

.leyenda {
  line-height: 14px;
  border: 1px solid #D8DCDE;
  background: #EDF1F3;
  padding: 2px 4px;
  margin-bottom: 5px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
}

.leyenda p{
  color: #545454;
  font-size: 10px;
  line-height: 14px;
  }

.leyenda table {
  margin-bottom: 0;
}

.flat_area h2 {
  padding: 2px 6px 2px;
  margin: 0px;
  font-weight: normal;
  font-size: 14px;
  border: 1px solid #FFF;
  border-left: 1px solid #F8F8F8;
  border-right: 1px solid #F8F8F8;
  line-height: 24px;
  text-indent: 0px;
  text-shadow: 0 0 0 #FFF !important;
}

.pull-right {
  float: right;
}

.block > .section > ul.mediciones {
  list-style: none;
}

.block > .section > ul.mediciones > li {
  display: inline;
  margin: 10px;
  border: 0;
}
</style>

<div class="section">
  <p>{$cuadro->comentarios}</p>
</div>

{foreach $paneles as $panel}
  <div class="box grid_{$panel->ancho}" style="float:left;">
    <div class="block" style="height:300px">
      <h2>{$panel->nombre}</h2>
      <h2 class="hidden edita"><img src="" alt="editar"></h2>
      <div class="section">
        <div class="{$panel->tipo->clase_css}" id="panel_{$panel->id}" data-idpanel="{$panel->id}" 
          data-id_medicion_inicio="{$panel->id_medicion_inicio}" data-id_medicion_fin="{$panel->id_medicion_fin}"></div>
        <div class="leyenda"></div>
      </div>
    </div>
  </div>
{/foreach}

{literal}
<script src="theme/danpin/scripts/flot/jquery.flot.min.js" type="text/javascript"></script>		
<script src="theme/danpin/scripts/flot/jquery.flot.pie.min.js" type="text/javascript"></script>		
<script src="theme/danpin/scripts/flot/jquery.flot.orderBars.js" type="text/javascript"></script>		

<script>
  // No hace falta llamar a jquery, ya lo hace "alguien" por nosotros
  
  /* --- Comienza la magia --- */ 
  $(".panel_linea").each(function(index) {
    var datos_flot = [];
    var id_panel = $(this).data("idpanel");
    console.log("Soy el " + id_panel);
    var leyenda = $(this).next(".leyenda");
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function(indicadores) {
      $.each(indicadores, function(index, indicador) {
        $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id).done(function(datos) {
          var items = [];
          // Tomamos la entidad a mostrar del panel_indicador actual
          var id_entidad = indicador.id_entidad;
          $.each(datos, function(i, dato) {
            if(dato.id_unidad == id_entidad)
            {
              items.push([dato.medicion, dato.valor]);
            }
          });
          datos_flot[index] = {label: indicador.nombre, color: index, data: items };
          var opciones = {
            series: { lines: { show: true }, points: { show: true } },
            label: { show: true },
            legend: { container: leyenda },
            xaxis: { tickDecimals: 0 },
            grid: { hoverable: true },
            colors: ['maroon', 'darkolivegreen', 'orange', 'green', 'pink', 'yellow', 'brown']
          };
          $("#panel_" + id_panel).css("height", 200 - index * 12 + "px");
          $.plot($("#panel_" + id_panel), datos_flot, opciones);
        }); 
      });
    });
  });


  $(".panel_barra").each(function(index) {
    var datos_flot = [];
    var id_panel = $(this).data("idpanel");
    console.log("Soy el " + id_panel);
    var leyenda = $(this).next(".leyenda");
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function(indicadores) {
      $.each(indicadores, function(index, indicador) {
        $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id, function(datos) {
          var items = [];
          var subunidad_actual = "Total";
          $.each(datos, function(i, dato) {
            if(dato.unidad == subunidad_actual)
            {
              var medicion = dato.medicion + index / 5;
              items.push([medicion, dato.valor]);
            }
          });
          datos_flot[index] = {label: indicador.nombre, color: index, data: items };
          var opciones = {
            series: { bars: {  show: true, barWidth: 0.9, fill: 0.8, align:"center", horizontal: false }},
            legend: { container: leyenda },
            xaxis: { tickDecimals: 0 },
            grid: { hoverable: true },
            colors: ['maroon', 'darkolivegreen', 'orange', 'green', 'pink', 'yellow', 'brown']
          };
          $("#panel_" + id_panel).css("height", 200 - index * 12 + "px");
          $.plot($("#panel_" + id_panel), datos_flot, opciones);
        }); 
      });
    });
  });
 

  $(".panel_tarta").each(function(index) {
    var datos_flot = [];
    var total;
    var id_medicion = $(this).data("id_medicion_inicio");
    var id_panel = $(this).data("idpanel");
    console.log("Soy el " + id_panel);
    var leyenda = $(this).next('.leyenda');
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function(indicadores) {
      var indicador = indicadores[0];
      $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id, function(datos) {
        var items = [];
        $.each(datos, function(i, dato) {
          if(dato.id_medicion == id_medicion) 
          {
            // Si id_unidad es 0 se trata del valor total, en otro caso es el parcial de una subunidad
            if (dato.id_unidad == 0)
            {
              total = dato.valor;
              medicion = dato.medicion;
            }
            else
            { 
              datos_flot.push({label:dato.unidad, data: parseFloat(dato.valor)});
              medicion = dato.medicion;
            }
          }
        });
        //opciones =  { series: { pie: { show: true, radius: 1, label: { show: true, radius: 2/3, threshold: 0.05 } } }, legend: { show: false } };
        var opciones= { 
          series: { pie: { show: true, label: {threshold: 0.04} } },
          grid: { hoverable: true },
          legend: { show: false } 
        };

        // Cuando se pase el cursor sobre la tarta aparecerán los valores de cada porción
        $("#panel_" + id_panel).bind("plothover", function (event, pos, item) {
          // alert("You clicked at " + pos.x + ", " + pos.y);
          if (item) 
          {
            leyenda.html("<div style='width:4px;height:0;border:5px solid " + item.series.color + ";float:left'></div> <h4>" + item.series.label + ": " + item.series.data[0][1] + " (" + Math.round(item.series.percent) + "%)</h4>");
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
 

  $(".panel_tabla").each(function(index) {
    var datos_flot = [];
    var id_panel = $(this).data("idpanel");
    console.log("Soy el " + id_panel);
    var leyenda = $(this).next('.leyenda');
    leyenda.insertBefore($(this));
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function(indicadores) {
      // De momento cogemos solo el primer indicador por si viene mas de uno 
      indicador = indicadores[0];
      leyenda.html('<h4>' + indicador.nombre + '</h4>');
      $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id, function(datos) {
        items = [];
        subunidad_actual = "Total";
        $.each(datos, function(i, dato) {
          if(dato.unidad == subunidad_actual)
          {
            if (i%2 == 0) {paridad = "odd";} else {paridad = "even";}
            items.push('<tr class="' + paridad +'"><td>' + dato.medicion + '</td><td>' + dato.valor + '</td></tr>');
          }
        });
        $('<table />', {'class': 'static', 
                        'data-id_indicador': indicador.id, 
                        html: items.join('')
                       }).appendTo('#panel_' + id_panel);
      }); 
    });
  });

  $(".panel_metrica").each(function(index) {
    var datos_flot = [];
    var id_panel = $(this).data("idpanel");
    console.log("Soy el " + id_panel);
    var leyenda = $(this).next('.leyenda');
    leyenda.insertBefore($(this));
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function(indicadores) {
      // De momento cogemos solo el primer indicador por si viene mas de uno 
      indicador = indicadores[0];
      leyenda.html('<h4>' + indicador.nombre + '</h4>');
      $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id, function(datos) {
        items = [];
        subunidad_actual = "Total";
        $.each(datos, function(i, dato) {
          if(dato.unidad == subunidad_actual)
          {
            if (i%2 == 0) {paridad = "odd";} else {paridad = "even";}
            items.push('<tr class="' + paridad +'"><td>' + dato.medicion + '</td><td>' + dato.valor + '</td></tr>');
          }
        });
        $('<table />', {'class': 'static', 
                        'data-id_indicador': indicador.id, 
                        html: items.join('')
                       }).appendTo('#panel_' + id_panel);
      }); 
    });
  });


  // Función para hacer búsquedas dentro de un array
  // devuelve la posición si un array contiene a otro o -1 si no lo contiene 
  function indexOfArray(val, array)
  {
    var
      hash = {},
      indexes = {},
      i, j;
    for(i = 0; i < array.length; i++)
    {
      hash[array[i]] = i;
    }
    return (hash.hasOwnProperty(val)) ? hash[val] : -1;
  };
</script>
{/literal}
