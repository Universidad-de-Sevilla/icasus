<p>
  <a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/time.png' /> Volver a las mediciones</a> &nbsp;
  <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> Volver al indicador</a> &nbsp;
</p>

<h3>Datos de la medición</h3>
<p><b>Etiqueta: </b>{$medicion->etiqueta}</b></p>
<p><b>Inicio del periodo: </b>{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}</b></p>
<p><b>Fin del periodo: </b>{$medicion->periodo_fin|date_format:"%d-%m-%Y"}</b></p>
<p><b>Inicio grabación: </b>{$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}</b></p>
<p><b>Fin grabación: </b>{$medicion->grabacion_fin|date_format:"%d-%m-%Y"}</b></p>


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
          <td>{$valor->valor}</td>
          <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
          <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>
        </tr>
      {/foreach}
    </tbody>
  </table>
  
  <img src="index.php?page=grafica_indicador_segregado&id_indicador={$indicador->id}&medicion={$medicion->etiqueta}" width="600" height="550" alt="Valores del indicador recogidos en cada subunidad para esta medición" />
{else}
  <p class="error">Error: no existen valores pendientes ni recogidos para esta medición</p>
{/if}
