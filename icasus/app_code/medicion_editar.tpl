<script>
{literal}
function fila_editar(medicion,valor)
{
	$('#valors').load("index2.php?page=medicion_editar_fila_asin&id_medicion="+medicion+"&id_valor="+valor);
}
function fila_grabar(id,medicion)
{
	var value = $('[name=v_'+id+']').val();
	value = value.replace(',','.');
	if (value != '')
  {
   	if (isNaN(value)== false)
		{
			$.post('index.php?page=valor_grabar_asin',{id2:id,valor:value},function(){
				$('#valors').load("index2.php?page=medicion_editar_fila_cancelar_asin&id_medicion="+medicion);
			});
		}
		else
		{
  	  alert('Está intentando introducir un dato que no es reconocido como número.');
		}
  }
  else
  {
    alert('Está intentando introducir un valor vacio.\n\nPuede restituir el valor con [cancelar].');
  }

}
function fila_cancelar(medicion)
{
	$('#valors').load("index2.php?page=medicion_editar_fila_cancelar_asin&id_medicion="+medicion);
}
function medicion_editar(medicion,content)
{
	$('#'+content).load("index2.php?page=medicion_editar_asin&id_medicion="+medicion+"&contenedor="+content);
}
function medicion_editar_grabar()
{

}
function medicion_editar_cancelar()
{

}
{/literal}
</script>
<p>
  <a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/time.png' /> Volver a las mediciones</a> &nbsp;
  <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> Volver al indicador</a> &nbsp;
</p>

<h3>Datos de la medición</h3>
<p><b>Etiqueta: </b>
	<span id="et">
		<a href="javascript:void(0)" onclick="javascript:medicion_editar('{$medicion->id}','et')">{if $medicion->etiqueta != NULL}{$medicion->etiqueta}{else}----{/if}</a>
	</span>
</p>

<p><b>Inicio del periodo: </b>
	<span id="pi">
		<a href="javascript:void(0)" onclick="medicion_editar('{$medicion->id}','pi')">{if $medicion->periodo_inicio}{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}{else}----{/if}</a>
	</span>
</p>

<p><b>Fin del periodo: </b>
	<span id="pf">
		<a href="javascript:void(0)" onclick="medicion_editar('{$medicion->id}','pf')">{if $medicion->periodo_inicio}{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}{else}----{/if}</a>
	</span>
</p>

<p><b>Inicio grabación: </b>
	<span id="gi">
		<a href="javascript:void(0)" onclick="medicion_editar('{$medicion->id}','gi')">{if $medicion->periodo_inicio}{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}{else}----{/if}</a>
	</span>
</p>

<p><b>Fin grabación: </b>
	<span id="gf">
		<a href="javascript:void(0)" onclick="medicion_editar('{$medicion->id}','gf')">{if $medicion->periodo_inicio}{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}{else}----{/if}</a>
	</span>
</p>


<h3>Valores</h3>
{if $valores}
<div id="valors">
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
        <tr id="fila_{$valor->id}">
          <td>{$valor->entidad->nombre}</td>
          <td><a id="td_{$valor->id}" href="javascript:void(0)" onclick="fila_editar('{$medicion->id}','{$valor->id}')">{$valor->valor}</a></td>
          <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
          <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>
        </tr>
      {/foreach}
    </tbody>
  </table>
  <img src="index.php?page=grafica_indicador_segregado&id_indicador={$indicador->id}&medicion={$medicion->etiqueta}" width="600" height="550" alt="Valores del indicador recogidos en cada subunidad para esta medición" />
</div>
{else}
  <p class="error">Error: no existen valores pendientes ni recogidos para esta medición</p>
{/if}
