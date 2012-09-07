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
								{if $valor->valor == NULL}---{else}{$valor->valor}.{/if}
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
