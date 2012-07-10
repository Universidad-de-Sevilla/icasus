<script>
{literal}
	function fila_editar(medicion,id_valor)
	{
		$('#valors').load("index.php?page=medicion_editar_ajax&modulo=editarfila&ajax=true&id_medicion="+medicion+"&id_valor="+id_valor);
	}
	function fila_grabar(id,medicion)
	{
		var value = $('[name=v_'+id+']').val();
		value = value.replace(',','.');
		if (value != '')
	  {
		if (isNaN(value)== false)
			{
				$.post("index.php?page=medicion_editar_ajax&modulo=grabarfila&ajax=true",{id2:id,valor:value},function(){
					$('#valors').load("index.php?page=medicion_editar_ajax&modulo=cancelarfila&ajax=true&id_medicion="+medicion);
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
		$('#valors').load("index.php?page=medicion_editar_ajax&modulo=cancelarfila&ajax=true&id_medicion="+medicion);
	}

	function etiqueta_editar(medicion,content)
	{
		$('#'+content).load("index.php?page=medicion_editar_ajax&modulo=editaretiqueta&ajax=true&id_medicion="+medicion+"&contenedor="+content);
	} 
	function etiqueta_editar_grabar(content,medicion,tag)
	{
		var value = $("[name="+tag+"]").val();
		$.post("index.php?page=medicion_editar_ajax&modulo=grabaretiqueta&ajax=true",{id_medicion:medicion,contenedor:content,valor:value},function(){
			$('#'+content).load("index.php?page=medicion_editar_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion="+medicion+"&contenedor="+content);
		});	
	}
	function etiqueta_editar_cancelar(content,medicion)
	{
		$('#'+content).load("index.php?page=medicion_editar_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion="+medicion+"&contenedor="+content);
	}
	function fecha_editar(medicion,content)
	{
		$('#'+content).load("index.php?page=medicion_editar_ajax&modulo=editaretiqueta&ajax=true&id_medicion="+medicion+"&contenedor="+content);
	} 
	function fecha_grabar(medicion,content)
	{
		
		var dia = $("[name="+content+"Day]").val();
		var mes = $("[name="+content+"Month]").val();
		var year = $("[name="+content+"Year]").val();
		var value = year+"-"+mes+"-"+dia;
		$.post("index.php?page=medicion_editar_ajax&modulo=grabaretiqueta&ajax=true",{id_medicion:medicion,contenedor:content,valor:value},function(){
			$('#'+content).load("index.php?page=medicion_editar_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion="+medicion+"&contenedor="+content);
		});	
	}
	function fecha_cancelar(content,medicion)
	{
		$('#'+content).load("index.php?page=medicion_editar_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion="+medicion+"&contenedor="+content);
	}
	function referencia_editar(id)
	{
		$('#referencia_'+id).load("index.php?page=medicion_editar_ajax&modulo=editarvalorreferencia&ajax=true&id_referencia="+id);
	} 
	function referencia_grabar(id)
	{
		var value = $("[name=input_referencia_"+id+"]").val();
		value = value.replace(',','.');
 
    if (value != '')
    {
    	if (isNaN(value)== false)
     	{
				$.post("index.php?page=medicion_editar_ajax&modulo=grabarvalorreferencia&ajax=true",{id_referencia:id,valor:value},function(){
				$('#referencia_'+id).load("index.php?page=medicion_editar_ajax&modulo=cancelarvalorreferencia&ajax=true&id="+id);
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
	function referencia_cancelar(id)
	{
		$('#referencia_'+id).load("index.php?page=medicion_editar_ajax&modulo=cancelarvalorreferencia&ajax=true&id="+id);
	} 
{/literal} 
</script>
<div class="box grid_16">
  <div class="section">
  <a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/time.png' /> Volver a las mediciones</a> &nbsp; &nbsp; &nbsp;
  <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> Volver al indicador</a> &nbsp;
  </div>
</div>

<div class="box grid_16">
  <h2 class="box_head grad_grey_dark">Gráfica de la medición actual</h2>
  <a href="#" class="grabber"></a>
  <a href="#" class="toggle"></a>
  {if $valores}
    <img src="index.php?page=grafica_indicador_segregado&id_indicador={$indicador->id}&medicion={$medicion->etiqueta}"     width="600" height="550" alt="Valores del indicador recogidos en cada subunidad para esta medición" />
  {else}
    <div class="alert alert_red">Error: no existen valores pendientes ni recogidos para esta medición</div>
  {/if}
</div>

<div class="box grid_16">
  <h2 class="box_head grad_grey_dark">Valor o conjunto de valores de la medición actual</h2>
  <a href="#" class="grabber"></a>
  <a href="#" class="toggle"></a>
  {if $valores}
  <div id="valors">
		<table class="static">
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
          <td>
							{if $valor->autorizado == 1 OR  $indicador->id_responsable == $usuario->id}
								<a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}','{$valor->id}')">{if $valor->valor == NULL}---{else}{$valor->valor}{/if}</a>
							{else}
								{if $valor->valor == NULL}---{else}{$valor->valor}{/if}
							{/if}
				</td>
          <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
          <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>
        </tr>
      {/foreach}
    </tbody>
  </table>
  </div>
  {else}
    <div class="alert alert_red">Error: no existen valores pendientes ni recogidos para esta medición</div>
  {/if}
</div>

<div class="box grid_16">
  <h2 class="box_head grad_grey_dark">Datos de la medición</h2>
  <a href="#" class="grabber"></a>
  <a href="#" class="toggle"></a>
  <div class="toggle_container">
    <div class="block">
    <!-- Los datos de la medición pueden ser editados solo por el responsable del indicador -->
    {if $usuario->id  == $indicador->id_responsable}
      <fieldset class="label_side">
        <label>Etiqueta</label>
        <div>
        <span id="et">
          <a href="javascript:void(0)" onclick="javascript:etiqueta_editar('{$medicion->id}','et','etiqueta')">{if $medicion->etiqueta != NULL}{$medicion->etiqueta}{else}----{/if}</a>
        </span>
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Inicio del periodo</label>
        <div>
        <span id="pi">
          <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}','pi')">{if $medicion->periodo_inicio}{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}{else}----{/if}</a>
        </span>
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Fin del periodo</label>
        <div>
        <span id="pf">
          <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}','pf')">{if $medicion->periodo_fin}{$medicion->periodo_fin|date_format:"%d-%m-%Y"}{else}----{/if}</a>
        </span>
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Inicio grabación</label>
        <div>
        <span id="gi">
          <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}','gi')">{if $medicion->grabacion_inicio}{$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}{else}----{/if}</a>
        </span>
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Fin grabación</label>
        <div>
        <span id="gf">
          <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}','gf')">{if $medicion->grabacion_fin}{$medicion->grabacion_fin|date_format:"%d-%m-%Y"}{else}----{/if}</a>
        </span>
        </div>
      </fieldset>
      {if $valores_referencia_mediciones}
        {foreach $valores_referencia_mediciones as $valor_referencia_medicion}
          <fieldset class="label_side">
            <label>{$valor_referencia_medicion->valor_referencia->etiqueta}</label>
            <div><span id="referencia_{$valor_referencia_medicion->id}">
            <a href="javascript:void(0)" onclick="referencia_editar('{$valor_referencia_medicion->id}')">{if $valor_referencia_medicion->valor == NULL}---{else}{$valor_referencia_medicion->valor}{/if}</a></span></div>
          </fieldset>
        {/foreach}
      {else}
        <fieldset class="label_side">
          <div>No se han definido valores de referencia para este indicador</div>
        </fieldset>
      {/if}
    {else}
      <fieldset class="label_side">
        <label>Etiqueta</label>
        <div>{$medicion->etiqueta}	</div>
      </fieldset>
      <fieldset class="label_side">
        <label>Inicio del periodo</label>
        <div>{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}	</div>
      </fieldset>
      <fieldset class="label_side">
        <label>Fin del periodo</label>
        <div>{$medicion->periodo_fin|date_format:"%d-%m-%Y"}	</div>
      </fieldset>
      <fieldset class="label_side">
        <label>Inicio grabación</label>
        <div>{$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}	</div>
      </fieldset>
      <fieldset class="label_side">
        <label>Fin grabación</label>
        <div>{$medicion->grabacion_fin|date_format:"%d-%m-%Y"}	</div>
      </fieldset>
      {if $valores_referencia_mediciones}
        {foreach $valores_referencia_mediciones as $valor_referencia_medicion}
          <fieldset class="label_side">
            <label>{$valor_referencia_medicion->valor_referencia->etiqueta}</label>
            <div>{$valor_referencia_medicion->valor}</div>
          </fieldset>
        {/foreach}
      {else}
        <fieldset class="label_side">
          <div>No se han definido valores de referencia para este indicador</div>
        </fieldset>
      {/if}
    {/if}
    </div>
  </div>
</div>
