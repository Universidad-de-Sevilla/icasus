{if $entidades_usuario }
  <div class="box grid_16">
    <h2 class="box_head grad_grey_dark">Unidades del usuario</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
      <table class="static">
        <thead><tr><th>C&oacute;digo</th><th>Unidad</th><th>Rol</th><th>Acciones</th></tr></thead>
        <tbody>
        {foreach from=$entidades_usuario item=entidad}
           <tr>
            <td>{$entidad->entidad->codigo}</td>
            <td><a href='index.php?page=entidad_datos&id_entidad={$entidad->entidad->id}'>{$entidad->entidad->nombre}</a></td>
            <td>{$entidad->rol->nombre}</td>
            <td>
              <a href='index.php?page=cuadrounidad&id_entidad={$entidad->entidad->id}'> Cuadro resumen</a> - 
              <a href='index.php?page=consulta_avanzada&id_entidad={$entidad->entidad->id}'> Consultas</a> -
              <a href='index.php?page=proceso_listar&id_entidad={$entidad->entidad->id}'> Procesos</a> -
              <a href='index.php?page=indicador_listar&id_entidad={$entidad->entidad->id}'>Indicadores</a> - 
              <a href='index.php?page=dato_listar&id_entidad={$entidad->entidad->id}'>Datos</a> 
              <!--
              <a href="index.php?page=plan_estrategico/plan_listar&id_entidad={$entidad->entidad->id}&entidad={$entidad->entidad->nombre|htmlentities}">Planificaci&oacute;n</a> -
              <a href='index.php?page=grupo/acta_listar&id_entidad={$entidad->entidad->id}' title="Ver las actas de este equipo">Actas</a> 
              -->
							{if $entidad->rol->id == 1 OR $entidad->rol->id == 2}
              - <a href='index.php?page=control&modulo=inicio&id_entidad={$entidad->entidad->id}'> Control</a>
							{/if}
            </td>
          </tr>
        {/foreach}
        </tbody>
      </table>
  </div>
{else}
  <div class="alert alert_red">No tiene asignada ninguna unidad</div>
{/if}

{if $indicadores}
  <div class="box grid_16 single_datatable">
    <h2 class="box_head grad_grey_dark">Indicadores a su cargo</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
   	<div id="dt1" class="no_margin">
      <table class="display datatable"> 
      <thead> 
       <tr>  
        <th>Código</th>
        <th>Nombre</th>
       </tr> 
      </thead> 
        <tbody>
          {foreach $indicadores as $indicador}
            <tr class="gradeX">
              <td>{$indicador->codigo}</td>
              <td><a href="index.php?page=indicador_mostrar&id_indicador={$indicador->id}">{$indicador->nombre}</a></td>
            </tr>
          {/foreach}  
        </tbody>
      </table>
  </div>
 </div> 
{/if}

{if $mediciones_usuario}
  <div class="box grid_16 single_datatable">
    <h2 class="box_head grad_grey_dark">Mediciones a su cargo</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
   	<div id="dt1" class="no_margin">
      <table class="display datatable"> 
      <thead> 
       <tr>  
        <th>Código</th>
            <th>Nombre</th>
            <th>Pendientes</th>
       </tr> 
      </thead> 
        <tbody>
           {foreach $mediciones_usuario as $medicion_usuario}
            <tr class="gradeX">
              <td>{$medicion_usuario->codigo}</td>
              <td><a href="index.php?page=indicador_mostrar&id_indicador={$medicion_usuario->id}">{$medicion_usuario->nombre}</a></td>
              <td>{$medicion_usuario->valores_pendientes}
                  {if $medicion_usuario->valores_pendientes > 0}
                   | <a href="index.php?page=medicion_listar&id_indicador={$medicion_usuario->id}&id_entidad={$medicion_usuario->id_entidad}">grabar</a>
                  {/if}
              </td>
            </tr>
          {/foreach}  
        </tbody>
      </table>
  </div>
 </div> 
{/if}
