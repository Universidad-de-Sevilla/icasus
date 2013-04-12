<style>
.hidden {
  display: none;
}

.pietiqueta {
  border: 1px solid #058DC7;
  border: 1px solid #D8DCDE;
  background: #E6F4FA;
  background: #EDF1F3;
  padding: 4px 6px;
}

.leyenda {
  /*display: none;*/
  border: 1px solid #D8DCDE;
  background: #EDF1F3;
  padding: 2px 4px;
  margin-bottom: 5px;
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
        <div class="{$panel->tipo->clase_css}" id="panel_{$panel->id}" data-idpanel="{$panel->id}"></div>
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
    var leyenda = $(this).next(".leyenda");
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function(indicadores) {
      $.each(indicadores, function(index, indicador) {
        $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id).done(function(datos) {
          var items = [];
          var subunidad_actual = "Total";
          $.each(datos, function(i, dato) {
            if(dato.unidad == subunidad_actual)
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
    var id_panel = $(this).data("idpanel");
    var leyenda = $(this).next('.leyenda');
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function(indicadores) {
      var indicador = indicadores[0];
      $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id, function(datos) {
        var items = [];
        var medicion = "2010";
        $.each(datos, function(i, dato) {
          if(dato.medicion == medicion) 
          {
            if (dato.unidad != "Total")
            {
              datos_flot.push({label:dato.unidad, data: parseFloat(dato.valor)});
            }
            else
            { 
              total = dato.valor;
            }
          }
        });
        //opciones = { series: { pie: {  show: true }}, legend: { show:"false" } };
        //opciones =  { series: { pie: { show: true, radius: 1, label: { show: true, radius: 2/3, threshold: 0.05 } } }, legend: { show: false } };
        var opciones= { 
          series: { pie: { show: true, label: {threshold: 0.03} } },
          grid: { hoverable: true },
          legend: { show: false } 
        };

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

/*
  // Prepara las opciones para crear un gráfico con flot
  function prepararOpciones(datos)
  {
    var opciones = {
      series: { lines: { show: true }, points: { show: true } },
      legend: { position:"ne" },
      xaxis: { tickDecimals: 0 },
      colors: ['maroon', 'darkolivegreen', 'orange', 'green', 'pink', 'yellow', 'brown']
    };
    return opciones;
  };
*/
  /*
  $(".panel_linea").each(function(index) {
    var datos_flot = [];
    id_panel = $(this).data("idpanel");
    console.log(id_panel);
    console.log(datos_flot[0]);
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function(indicadores) {
      $.each(indicadores, function(index, indicador) {
        //$.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id, function(datos) {
        $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id).done(function(datos) {
          items = [];
          subunidad_actual = "Total";
          $.each(datos, function(i, dato) {
            if(dato.unidad == subunidad_actual)
            {
              items.push([dato.medicion, dato.valor]);
            }
          });
          datos_flot[index] = {label: indicador.nombre, color: index, data: items };
          var opciones = {
            series: { lines: { show: true }, points: { show: true } },
            legend: { position:"ne" },
            xaxis: { tickDecimals: 0 },
            colors: ['maroon', 'darkolivegreen', 'orange', 'green', 'pink', 'yellow', 'brown']
          };
          $("#panel_" + id_panel).css("height", "250px");
          $.plot($("#panel_" + id_panel), datos_flot, opciones);
          console.log(index + ":" + datos_flot[0].label)
        }); 
      });
    });
  });
  */

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
