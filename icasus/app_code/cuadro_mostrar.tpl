<style>
.hidden {
  display: none;
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
  <div class="box grid_{$panel->ancho}">
    <div class="block" style="height:300px">
      <h2>{$panel->nombre}</h2>
      <h2 class="hidden edita"><img src="" alt="editar"></h2>
      <div class="section">
        <div class="{$panel->tipo->clase_css}" id="panel_{$panel->id}" data-idpanel="{$panel->id}">
        </div>
      </div>
    </div>
  </div>
{/foreach}

{literal}
<script src="theme/danpin/scripts/flot/jquery.flot.min.js" type="text/javascript"></script>		
<script src="theme/danpin/scripts/flot/jquery.flot.pie.min.js" type="text/javascript"></script>		
<script>
  // No hace falta llamar a jquery, ya lo hace "alguien" por nosotros
  
  /* --- Comienza la magia --- */ 
  $(".panel_linea").each(function(index) {
    var datos_flot = [];
    id_panel = $(this).data("idpanel");
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function(indicadores) {
      $.each(indicadores, function(index, indicador) {
        $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id, function(datos) {
          items = [];
          subunidad_actual = "Total";
          $.each(datos, function(i, dato) {
            if(dato.unidad == subunidad_actual)
            {
              items.push([dato.medicion, dato.valor]);
            }
          });
          datos_flot[index] = {label: indicador.nombre, color: index, data: items };
          var opciones = prepararOpciones();
          $("#panel_" + id_panel).css("height", "250px");
          $.plot($("#panel_" + id_panel), datos_flot, opciones);
        }); 
      });
    });
  });


  $(".panel_barra").each(function(index) {
    var datos_flot = [];
    var id_panel = $(this).data("idpanel");
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function(indicadores) {
      $.each(indicadores, function(index, indicador) {
        $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id, function(datos) {
          items = [];
          subunidad_actual = "Total";
          $.each(datos, function(i, dato) {
            if(dato.unidad == subunidad_actual)
            {
              items.push([dato.medicion, dato.valor]);
            }
          });
          datos_flot[index] = {label: indicador.nombre, color: index, data: items };
          opciones = {
            series: { bars: {  show: true, barWidth: 0.3, fill: 0.8, align:"center", horizontal: false }},
            legend: { position:"ne" },
            colors: ['maroon', 'darkolivegreen', 'orange', 'green', 'pink', 'yellow', 'brown']
          };
          $("#panel_" + id_panel).css("height", "250px");
          $.plot($("#panel_" + id_panel), datos_flot, opciones);
        }); 
      });
    });
  });
 

  $(".panel_tarta").each(function(index) {
    var datos_flot = [];
    var id_panel = $(this).data("idpanel");
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function(indicadores) {
      indicador = indicadores[0];
        $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id, function(datos) {
          items = [];
          medicion = "2010";
          $.each(datos, function(i, dato) {
            if(dato.medicion == medicion)
            {
              datos_flot.push({label:dato.unidad, data: dato.valor});
              //items.push([dato.unidad, dato.valor]);
            }
          });
     datos_flot = [ { label: "Series1",  data: 10}, { label: "Series2",  data: 30}, { label: "Series3",  data: 90}, { label: "Series4",  data: 70}, { label: "Series5",  data: 80}, { label: "Series6",  data: 110} ];
          //datos_flot[index] = {label: indicador.nombre, color: index, data: items };
          opciones = {
            series: { pie: {  show: true }},
            legend: { position:"ne" },
          };
          $("#panel_" + id_panel).css("height", "250px");
          $.plot($("#panel_" + id_panel), datos_flot, opciones);
          console.log(datos_flot)
        }); 
    });
  });
 

  $(".panel_tabla").each(function(index) {
    var datos_flot = [];
    var id_panel = $(this).data("idpanel");
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function(indicadores) {
      // De momento cogemos solo el primer indicador por si viene mas de uno 
      indicador = indicadores[0];
      $('<h3 />', {html: indicador.nombre}).appendTo('#panel_' + id_panel);
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


  // Esto no es una funcion sino un recordatorio de como se ponen las barras en horizontal
  function opcionesBarras(e)
  {
      opciones = {
        series: { bars: {  show: true, barWidth: 0.1, fill: 0.7, align:"center", horizontal: true }},
        legend: { position:"ne" },
        yaxis: { ticks: ejeY },
        colors: ['maroon', 'darkolivegreen', 'orange', 'green', 'pink', 'yellow', 'brown']
      };
  }

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
