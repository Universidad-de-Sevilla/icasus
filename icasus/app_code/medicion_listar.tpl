<p>
  <a href="index.php?page=medicion_crear&id_indicador={$indicador->id}"><img src='/icons/ff32/time.png' /> Agregar medición</a> &nbsp; &nbsp;
  <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff32/chart_curve.png' /> Volver al indicador</a> &nbsp;
</p>
<h2>Indicador: {$indicador->codigo} - {$indicador->nombre}</h2>
{if $mediciones}
  <table>
    <thead>
      <tr>
        <th>Etiqueta</th>
        <th>Fecha inicio periodo</th>
        <th>Fecha fin periodo</th>
        <th>Fecha inicio grabacion</th>
        <th>Fecha fin grabacion</th>
        <th>Acciones</th>
      </tr>
    </thead>

    <tbody>
      {foreach $mediciones as $medicion}
        <tr>
          <td nowrap>{$medicion->etiqueta}</td>
          <td>{$medicion->periodo_inicio}</td>
          <td>{$medicion->periodo_fin}</td>
          <td>{$medicion->grabacion_inicio}</td>
          <td>{$medicion->grabacion_fin}</td>
          <td><a href="index.php?page=medicion_editar&id_medicion={$medicion->id}">Editar</a></td>
      {/foreach}
    </tbody>
  </table>

{else}
  <p class="aviso">Todavía no se han establecido mediciones para este indicador</p>
{/if}
