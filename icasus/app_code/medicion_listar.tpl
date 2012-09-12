<div class="box grid_16 single_datatable">
  <div class="button_bar clearfix">
    <a href="index.php?page=medicion_crear&id_{$tipo}={$indicador->id}"><img src='/icons/ff16/time.png' /> Agregar medición</a> &nbsp; &nbsp; &nbsp;
    <a href='index.php?page=dato_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> Volver al {$tipo}</a> &nbsp;
  </div>

  {if $mediciones}
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
          <td><a href="index.php?page=medicion_editar&id_medicion={$medicion->id}&tipo={$tipo}">Mostrar</a></td>
        </tr>
      {/foreach}
    </tbody>
    </table>
  </div>
  {else}
    <div class="alert alert_blue">
      <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
      Todavía no se han establecido mediciones para este {$tipo}
    </div>
  {/if}
</div>
