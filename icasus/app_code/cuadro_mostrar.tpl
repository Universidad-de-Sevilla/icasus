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

.flat_area h3 {
  background: #EDF1F3;
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

.icon-remove {
  float: right;
}

</style>
{if $cuadro->id_usuario == $_usuario->id}
  <div class="button_bar clearfix">
    <a href='index.php?page=panel_nuevo&id_cuadro={$cuadro->id}&id_entidad=14'><img 
      src='/icons/ff16/application_add.png' /> Agregar Panel</a> &nbsp;
    <a href='index.php?page=cuadro_editar&id_cuadro={$cuadro->id}&id_entidad=14'><img 
      src='/icons/ff16/table_edit.png' /> Editar propiedades</a> &nbsp;
    <a href='index.php?page=cuadro_listar&id_entidad=14'><img 
      src='/icons/ff16/table.png' /> Volver al listado</a> &nbsp;
  </div>
{/if}
<!-- dialogo para borrar paneles -->
<div id="dialogo_borrar_panel" class="dialog_content narrow ui-dialog-content ui-widget-content">
	<div class="block" style="opacity: 1;" >
		<div class="section" style="padding:20px">
			<p>Va a borrar el panel "<b><span id="nombre_panel"></span></b>" de este cuadro de mando.</p>
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
      <div class="block" style="height:300px">
        <h3>{$panel->nombre} <a data-nombre_panel="{$panel->nombre}" class="icon-remove" href="#">X</a></h3>
        <h3 class="hidden edita"><img src="" alt="editar"></h3>
        <div class="section">
          <div class="panel {$panel->tipo->clase_css}" id="panel_{$panel->id}" data-idpanel="{$panel->id}" 
            data-id_medicion="{$panel->id_medicion}" data-id_fecha_inicio="{$panel->id_fecha_inicio}" 
            data-id_fecha_fin="{$panel->id_fecha_fin}" data-ancho="{$panel->ancho}"></div>
          <div class="leyenda"></div>
        </div>
      </div>
    </div>
  {/foreach}
{else}
  <p class="aviso">Aún no se han añadido paneles a este cuadro de mando. 
  <a href="index.php?page=panel_nuevo&id_cuadro={$cuadro->id}&id_entidad=14">¿A qué esperas?</a></p>
{/if}

{literal}
<script src="theme/danpin/scripts/flot/jquery.flot.min.js" type="text/javascript"></script>		
<script src="theme/danpin/scripts/flot/jquery.flot.pie.min.js" type="text/javascript"></script>		
<script src="theme/danpin/scripts/flot/jquery.flot.orderBars.js" type="text/javascript"></script>		

<script>
  // No hace falta llamar a jquery, ya lo hace "alguien" por nosotros
  
  $(".icon-remove").on('click', function(evento) {
    var boton_borrar, idpanel;
    boton_borrar = $(this);
		id_panel = boton_borrar.parents().find(".panel").data("idpanel");
		$('#nombre_panel').html(boton_borrar.data('nombre_panel'));
		$("#dialogo_borrar_panel").dialog({
		autoOpen: true,modal: true,
		buttons:[
		{
			text:"Confirmar",
			"class":'green',
			click:function(){
				$(this).dialog("close");	
				$.ajax({
					url:"index.php?page=panel_borrar&ajax=true&id_panel="+id_panel,
					success:function(datos){
						/*
					alert(datos);
						if (datos == 'Siparametros')
						{
						$(boton_borrar).parent().siblings('.section').html(datos);
						}
						else
						{
						$(boton_borrar).parent().siblings('.section').html('no ahya datsodatos');
						}
						$(boton_borrar).parent().siblings('.section').html('{literal}gggggg{/literal}');
						*/
						$(boton_borrar).parent().siblings('.section').html('<h4>Borrando ...</h4>');
						boton_borrar.parents(".box").remove();
					}
				})
			}
		},
		{
			text:"Cancelar",
			"class":'red text_only has_text',
			click:function(){
				$(this).dialog("close");	
			}
		}
		]
		});
		/*
		*/
    evento.preventDefault();
  });

  /* --- Comienza la magia --- */ 
  $(".panel_linea").each(function(index) {
    var datos_flot = [];
    var id_panel = $(this).data("idpanel");
    var leyenda = $(this).next(".leyenda");
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel).done(function(indicadores) {
      $.each(indicadores, function(index, indicador) {
        $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id).done(function(datos) {
          var items = [];
          var unidad;
          var etiqueta;
          var id_entidad = indicador.id_entidad;
          $.each(datos, function(i, dato) {
            if(dato.id_unidad == id_entidad)
            {
              unidad = dato.unidad; //guarrerida española
              items.push([dato.medicion, dato.valor]);
            }
          });
          etiqueta = '<a href="index.php?page=medicion_listar&id_indicador=' + indicador.id + '" target="_blank">' + indicador.nombre + '</a> (' + unidad + ')';
          datos_flot[index] = {label: etiqueta, color: index, data: items };
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
          var unidad;
          var etiqueta;
          var id_entidad = indicador.id_entidad;
          $.each(datos, function(i, dato) {
            if(dato.id_unidad == id_entidad)
            {
              //var medicion = dato.medicion + index / 5;
              var medicion = dato.medicion;
              unidad = dato.unidad; //guarrerida española
              items.push([medicion, dato.valor]);
            }
          });
          etiqueta = '<a href="index.php?page=medicion_listar&id_indicador=' + indicador.id + '" target="_blank">' + indicador.nombre + '</a> (' + unidad + ')';
          datos_flot[index] = {label: etiqueta, color: index, data: items };
          var opciones = {
            series: { bars: {  show: true, barWidth: 0.5, fill: 0.8, align:"center", horizontal: false }},
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
    var total; // valor total del indicador para esta medición
    var medicion; //etiqueta de la medición que vamos a mostrar
    var id_medicion = $(this).data("id_medicion");
    var id_panel = $(this).data("idpanel");
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
    var leyenda = $(this).next('.leyenda');
    leyenda.insertBefore($(this));
    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function(indicadores) {
      // De momento cogemos solo el primer indicador por si viene mas de uno 
      var indicador = indicadores[0];
      leyenda.html('<h4>' + indicador.nombre + '</h4>');
      $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id, function(datos) {
        var items = [];
        // Tomamos la entidad a mostrar del panel_indicador actual
        var id_entidad = indicador.id_entidad;
        $.each(datos, function(i, dato) {
          var paridad;
          if(dato.id_unidad == id_entidad)
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
    var medicion; //etiqueta de la medición a mostrar
    var id_panel = $(this).data("idpanel");
    var ancho = $(this).data("ancho");
    var leyenda = $(this).next('.leyenda');
    var id_medicion = $(this).data("id_medicion");

    $.getJSON("api_publica.php?metodo=get_indicadores_panel&id=" + id_panel, function(indicadores) {
      // De momento cogemos solo el primer indicador por si viene mas de uno 
      var indicador = indicadores[0];

      $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + indicador.id, function(datos) {
        var html = "";
        // Tomamos la entidad a mostrar del panel_indicador actual
        var id_entidad = indicador.id_entidad;
        $.each(datos, function(i, dato) {
          if((dato.id_unidad == id_entidad || dato.id_unidad == '0') && dato.id_medicion == id_medicion )
          {
            if (id_entidad != '0') 
            {
              if (dato.id_unidad != '0') 
              {
                html += "<p style='font-size:" + (ancho * 2 - dato.valor.length * 0.4) +"em; padding: 20px 0 5px 0; text-align: center;'>" + dato.valor + "</p>";
                html += "<p style='text-align: center; line-height: 10px;'><strong>Unidad: </strong>" + dato.unidad + "</p>";
              }
              else
              {
                html += "<p style='font-size:2em; padding:20px 0 0 0; text-align:center; line-height:6px;'>" + dato.valor + "</p>";
                html += "<p style='padding:0 0 20px 0; text-align: center;line-height: 10px;'><strong>Valor total</strong></p>";
              }
            }
            else
            {
              html += "<p style='font-size:" + (ancho * 2 - dato.valor.length * 0.4) +"em; padding: 30px 0px; text-align: center;'>" + dato.valor + "</p>";
            }
            medicion = dato.medicion;
          }
        });
        $('<div/>', {'class': 'centrado', 
                      html: html
                    }).appendTo('#panel_' + id_panel);
        leyenda.html('<p style="font-size:10px">' + indicador.nombre + ' - <strong>Medición:</strong> ' + medicion + '</p>');
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
