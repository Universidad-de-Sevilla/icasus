<h3>Unidades del usuario</h3>
{if $entidades_usuario }
  <table>
      <thead><tr><th>C&oacute;digo</th><th>Unidad</th><th>Rol actual</th><th>Acciones</th></tr></thead>
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
  </tbody></table>
{else}
  <p class='aviso'>No tiene asignada ninguna unidad</p>
{/if}

{if $grupos_usuario}
  <h3>Equipos de Trabajo del usuario</h3>
  <table width="95%">
      <thead><tr><th>C&oacute;digo</th><th>Equipo</th><th colspan="4">Acciones</th></tr></thead>
      <tbody>
  {foreach from=$grupos_usuario item=grupo}
     <tr>
      <td>{$grupo.codigo}</td>
      <td>{$grupo.nombre}</td>
      <td>  
        {if $grupo.rol =='secretario'}
          <a href='index.php?page=grupo/grupo_datos&id_entidad={$grupo.id}' title="Ver y editar detalles del equipo">Editar</a> 
        {else}
          <a href='index.php?page=grupo/grupo_ver&id_entidad={$grupo.id}' title="Ver equipo">Ver</a>
        {/if}
     </td>		
     <td><a href='index.php?page=indicador_listar&id_entidad={$grupo.id}'>Indicadores</a> </td>
     <td><a href="index.php?page=plan_estrategico/plan_listar&id_entidad={$grupo.id}&entidad={$grupo.nombre|htmlentities}">Planificaci&oacute;n</a></td> 
     <td><a href='index.php?page=grupo/acta_listar&id_entidad={$grupo.id}' title="Ver las actas de este equipo">Actas</a></td>
     </tr>
  {/foreach}
  </tbody>
  </table>
{/if}

{if $indicadores_subunidades}
  <h3>Indicadores a su cargo</h3>
  <table>
    <thead>
      <tr>
        <th>Código</th>
        <th>Nombre</th>
        <th>Pendientes</th>
      </tr>
    <thead>
    <tbody>
      {foreach $indicadores_subunidades as $indicador_subunidad}
        <tr>
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
{/if}


