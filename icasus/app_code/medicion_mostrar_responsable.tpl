<script>
var usuario = '{$usuario}';
var hoy = '{$hoy}';
{literal}
jQuery(document).ready(function() {
	$('.editar').hide();
	$('#etiqueta_editar').hide();
});
// Modificación de etiquetas
function etiqueta_cancelar()
{
	$('#etiqueta_editar').hide();
	$('#etiqueta_mostrar').show();
}
function etiqueta_editar()
{
	$('#etiqueta_editar').show();
	$('#etiqueta_mostrar').hide();
}
function etiqueta_modificar(id,etiqueta)
{
	var value = $('[name=etiqueta_medicion]').val();
	$.post("index.php?page=medicion_etiqueta_modificar_asin",{id2:id,etiqueta:value},function(){
		$('#etiqueta_editar').hide();
		$('#etiqueta_mostrar').show();
		$('#etiqueta_mostrar').html('<a href="javascript:void(0)" onclick="etiqueta_editar()">'+value+'</a>');
  });
}
// Modificación de las fechas del periodo
function fecha_modificar(id,label)
{
	var value = $('[name='+label+'Year]').val()+'-'+$('[name='+label+'Month]').val()+'-'+$('[name='+label+'Day]').val();
	$.post("index.php?page=medicion_fecha_modificar_asin",{id2:id,fecha:value,etiqueta:label},function(){
		$('#'+label+'_e').hide();
		$('#'+label+'_m').show();
		var value2 = $('[name='+label+'Day]').val()+'-'+$('[name='+label+'Month]').val()+'-'+$('[name='+label+'Year]').val();
		var cadena = '<a href="javascript:void(0)" onclick="fecha_editar(\''+label+'\')">'+value2+'</a>';
		$('#'+label+'_m').html(cadena);
	});
}
function fecha_cancelar(id)
{ 
	$('#'+id+'_e').hide();
	$('#'+id+'_m').show();
}
function fecha_editar(id)
{
	$('#'+id+'_m').hide();
	$('#'+id+'_e').show();
}

// Modificacion de valores
function editar(id,valor)
{
  $('#s_'+id).html(
  "<input id='v_"+id+"' type='text' value='"+valor+"'><a href='javascript:void(0)' onclick='grabar("+id+")'> <img title='Grabar' src='https://r2h2.us.es/comun/icons/ff16/disk.png'></a>                                 <a href='javascript:void(0)' onclick='cancelar("+id+",\""+valor+"\")'><img title='Cancelar' src='https://r2h2.us.es/comun/icons/ff16/cross.png'></a>");
} 
function grabar(id)
{ 
        var value = $('#v_'+id).val();
       	value = value.replace(',','.');
				if (value != '')
        {
        	if (isNaN(value)== false)
					{
        		//value = Math.round(value*100)/100;
            $.post("index.php?page=valor_grabar_asin",{id2:id,valor:value},function(){
            	$('#s_'+id).html('<a href="javascript:void(0)" onclick="editar('+id+','+value+')">'+value+'</a>');      
            	$('#fe_'+id).html(hoy);      
            	$('#usuario_'+id).html(usuario);      
            });
					}
					else
					{
            alert('Está intentando introducir un dato que no es reconocido como número.');
					}
        }
        else
        {
            alert('Está intentando introducir un valor vacio. Puede cancelar.');
        }
}
function cancelar(id,valor)
{
  $('#s_'+id).html('<a href="javascript:void(0)" onclick="editar('+id+','+valor+')">'+valor+'</a>');      
}
{/literal}
</script>
<p>
  <a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/time.png' /> Volver a las mediciones</a> &nbsp;
  <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> Volver al indicador</a> &nbsp;
</p>

<h3>Datos de la medición</h3>
<p><b>Etiqueta: </b><span id="etiqueta_mostrar"><a href="javascript:void(0)" onclick="etiqueta_editar()">{if $medicion->etiqueta != NULL}{$medicion->etiqueta}{else}----{/if}</a></span>
<span id="etiqueta_editar"><input name="etiqueta_medicion" type="text" value="{$medicion->etiqueta}">
<a href="javascript:void(0)" onclick="javascript:etiqueta_modificar('{$medicion->id}','etiqueta_mostrar')"><img title='Grabar etiqueta' src='https://r2h2.us.es/comun/icons/ff16/disk.png'align="absmiddle"></a>
<a href="javascript:void(0)" onclick="javascript:etiqueta_cancelar()"><img title='Cancelar etiqueta' src='https://r2h2.us.es/comun/icons/ff16/cross.png'align="absmiddle"></a>
</span></b></p>

<p><b>Inicio del periodo: </b><span id="pi_m" class="fecha"><a href="javascript:void(0)" onclick="fecha_editar('pi')">{if $medicion->periodo_inicio}{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}{else}----{/if}</a></span>
<span id="pi_e" class="editar">{html_select_date field_order="DMY" prefix="pi" month_format="%m" time=$medicion->periodo_inicio start_year="2010"} 
	<a href="javascript:void(0)" onclick="javascript:fecha_modificar('{$medicion->id}','pi')"><img title='Grabar' src='https://r2h2.us.es/comun/icons/ff16/disk.png'align="absmiddle"></a> 
	<a href="javascript:void(0)" onclick="javascript:fecha_cancelar('pi')"><img title='Cancelar' src='https://r2h2.us.es/comun/icons/ff16/cross.png'align="absmiddle"></a>
</span>
</p>

<p><b>Fin del periodo: </b><span id="pf_m" class="fecha"><a href="javascript:void(0)"onclick="fecha_editar('pf')">{if $medicion->periodo_fin}{$medicion->periodo_fin|date_format:"%d-%m-%Y"}{else}----{/if}</a></span>
	<span id="pf_e" class="editar">{html_select_date field_order="DMY" prefix="pf" month_format="%m" time=$medicion->periodo_fin start_year="2010"} 
	<a href="javascript:void(0)" onclick="javascript:fecha_modificar('{$medicion->id}','pf')"><img title='Grabar' src='https://r2h2.us.es/comun/icons/ff16/disk.png'align="absmiddle"></a> 
	<a href="javascript:void(0)" onclick="javascript:fecha_cancelar('pf')"><img title='Cancelar' src='https://r2h2.us.es/comun/icons/ff16/cross.png'align="absmiddle"></a>
</span>
</p>

<p><b>Inicio grabación: </b><span id="gi_m" class="fecha"><a href="javascript:void(0)" onclick="fecha_editar('gi')">{if $medicion->grabacion_inicio}{$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}{else}----{/if}</a></span>
<span id="gi_e" class="editar">{html_select_date field_order="DMY" prefix="gi" month_format="%m" time=$medicion->grabacion_inicio start_year="2010"} 
	<a href="javascript:void(0)" onclick="javascript:fecha_modificar('{$medicion->id}','gi')"><img title='Grabar' src='https://r2h2.us.es/comun/icons/ff16/disk.png'align="absmiddle"></a> 
	<a href="javascript:void(0)" onclick="javascript:fecha_cancelar('gi')"><img title='Cancelar' src='https://r2h2.us.es/comun/icons/ff16/cross.png'align="absmiddle"></a>
</span>
</p>

<p><b>Fin grabación: </b><span id="gf_m" class=""><a href="javascript:void(0)" onclick="fecha_editar('gf')">{if $medicion->grabacion_fin}{$medicion->grabacion_fin|date_format:"%d-%m-%Y"}{else}----{/if}</a></span>
<span id="gf_e" class="editar">{html_select_date field_order="DMY" prefix="gf" month_format="%m" time=$medicion->grabacion_fin start_year="2010"}
	<a href="javascript:void(0)" onclick="javascript:fecha_modificar('{$medicion->id}','gf')"><img title='Grabar' src='https://r2h2.us.es/comun/icons/ff16/disk.png'align="absmiddle"></a> 
	<a href="javascript:void(0)" onclick="javascript:fecha_cancelar('gf')"><img title='Cancelar' src='https://r2h2.us.es/comun/icons/ff16/cross.png'align="absmiddle"></a>
</span>
</p>


<h3>Valores</h3>
{if $valores}
  <table>
    <thead>
      <tr>
        <th>Unidad</th>
        <th>Valor</th>
        <th>Fecha recogida</th>
        <th>Usuario que graba</th>
      </tr>
    </thead>
    <tbody>
      {foreach $valores as $valor}
        <tr>
          <td>{$valor->entidad->nombre}</td>
					{assign var=valordato value=$valor->valor}

					{if $valordato == NULL} {$valordato = '"---"'}{/if}

          <td><span id ="s_{$valor->id}"><a href="javascript:void(0)" onclick="editar('{$valor->id}','{$valordato}')">{$valordato}</a></span></td>
          <td><span id ="fe_{$valor->id}">{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</span></td>
          <td><span id ="usuario_{$valor->id}">{$valor->usuario->nombre} {$valor->usuario->apellidos}</span></td>
        </tr>
      {/foreach}
    </tbody>
  </table>
  
  <img src="index.php?page=grafica_indicador_segregado&id_indicador={$indicador->id}&medicion={$medicion->etiqueta}" width="600" height="550" alt="Valores del indicador recogidos en cada subunidad para esta medición" />
{else}
  <p class="error">Error: no existen valores pendientes ni recogidos para esta medición</p>
{/if}
