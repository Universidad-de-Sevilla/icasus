<h3>
  <a href="index.php?page=medicion_crear&id_indicador={$indicador->id}"><img src='/icons/ff16/time.png' /> Agregar medición</a> &nbsp; &nbsp; &nbsp;
  <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> Volver al indicador</a> &nbsp;
</h3>

{if $mediciones}
  <div class="box grid_16 single_datatable">
    <div id="dt1" class="no_margin">
      <table class="display datatable"> 
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
          <tr class="gradeX">
            <td nowrap>{$medicion->etiqueta}</td>
            <td>{$medicion->periodo_inicio}</td>
            <td>{$medicion->periodo_fin}</td>
            <td>{$medicion->grabacion_inicio}</td>
            <td>{$medicion->grabacion_fin}</td>
            <td><a href="index.php?page=medicion_mostrar&id_medicion={$medicion->id}">Mostrar</a> - Editar - Borrar</td>
        {/foreach}
      </tbody>
      </table>
    </div>
  </div>
{else}
  <p class="aviso">Todavía no se han establecido mediciones para este indicador</p>
{/if}
