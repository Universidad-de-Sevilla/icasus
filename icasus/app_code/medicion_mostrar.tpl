<p>
  <a href='index.php?page=indicador_datos&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> Volver al indicador</a> &nbsp;
</p>

<h3>Datos de la medición</h3>
<p><b>Etiqueta: </b>{$medicion->etiqueta}</b></p>
<p><b>Inicio del periodo: </b>{$medicion->periodo_inicio}</b></p>
<p><b>Fin del periodo: </b>{$medicion->periodo_fin}</b></p>
<p><b>Inicio grabación: </b>{$medicion->grabacion_inicio}</b></p>
<p><b>Fin grabación: </b>{$medicion->grabacion_fin}</b></p>


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
          <td>{$valor->fecha_recogida}</td>
          <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>
        </tr>
      {/foreach}
    </tbody>
  </table>
{else}
  <p class="error">Error: no existen valores pendientes ni recogidos para esta medición</p>
{/if}
