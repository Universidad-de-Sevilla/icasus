<a href="index.php?page=medicion_crear&id_indicador={$indicador->id}"><img src="" /> Agregar medición</a>

{if $mediciones}
  <table>
    <thead>
      <tr>
        <th>Etiqueta</th>
        <th>Fecha inicio periodo</th>
        <th>Fecha fin periodo</th>
        <th>Fecha inicio grabacion</th>
        <th>Fecha fin grabacion</th>
      </tr>
    </thead>

    <tbody>
      {foreach $mediciones as $medicion}
        <tr>
          <td>{$medicion->etiqueta}</td>
          <td>{$medicion->periodo_inicio}</td>
          <td>{$medicion->periodo_fin}</td>
          <td>{$medicion->grabacion_inicio}</td>
          <td>{$medicion->grabacion_fin}</td>
      {/foreach}
    </tbody>
  </table>
{else}
  <p class="aviso">Todavía no se han establecido mediciones para este indicador</p>
{/if}
