<h3>Unidades del usuario</h3>
{if $entidades_usuario }
  <div class="box grid_16">
      <table class="static">
        <thead><tr><th>C&oacute;digo</th><th>Unidad</th><th>Rol</th><th>Acciones</th></tr></thead>
        <tbody>
        {foreach from=$entidades_usuario item=entidad}
           <tr>
            <td>{$entidad->entidad->codigo}</td>
            <td>{$entidad->entidad->nombre}</td>
            <td>{$entidad->rol->nombre}</td>
            <td>
            <a href='index.php?page=entidad_datos&id_entidad={$entidad->entidad->id}'>Ver</a> - 
            <a href='index.php?page=indicador_listar&id_entidad={$entidad->entidad->id}'>Indicadores</a> - 
            <a href='index.php?page=proceso_listar&id_entidad={$entidad->entidad->id}'> Procesos</a> 
            <!--
            <a href="index.php?page=plan_estrategico/plan_listar&id_entidad={$entidad->entidad->id}&entidad={$entidad->entidad->nombre|htmlentities}">Planificaci&oacute;n</a> -
            <a href='index.php?page=grupo/acta_listar&id_entidad={$entidad->entidad->id}' title="Ver las actas de este equipo">Actas</a> 
            -->
          </td>
          </tr>
        {/foreach}
        </tbody>
      </table>
  </div>
{else}
  <p class='aviso'>No tiene asignada ninguna unidad</p>
{/if}


{if $indicadores_subunidades}
  <h3>Indicadores a su cargo</h3>
  <div class="box grid_16 single_datatable">
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
           {foreach $indicadores_subunidades as $indicador_subunidad}
            <tr class="gradeX">
              <td>{$indicador_subunidad->indicador->codigo}</td>
              <td><a href="index.php?page=indicador_mostrar&id_indicador={$indicador_subunidad->indicador->id}">{$indicador_subunidad->indicador->nombre}</a></td>
              <td>{$indicador_subunidad->mediciones_pendientes}
                  {if $indicador_subunidad->mediciones_pendientes > 0}
                   | <a href="index.php?page=medicion_subunidad_listar&id_indicador={$indicador_subunidad->indicador->id}">grabar</a>
                  {/if}
              </td>
            </tr>
          {/foreach}  
        </tbody>
      </table>
  </div>
 </div> 
{/if}
