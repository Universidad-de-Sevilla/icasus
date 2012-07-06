<div class="box grid_16">
  <div class="block">	
    <div class="section clearfix">
        <span class="light">
          <a href="index.php?page=proceso_crear&id_entidad={$entidad->id}"><img src='/icons/ff16/cog_add.png' /> Crear proceso</a>
        </span>
        <span>
          <a href="index.php?page=entidad_datos&id_entidad={$entidad->id}"><img 
          src='/icons/ff16/chart_organisation.png' /> Ficha de Unidad</a>
        </span>
    </div>
    {if $procesos}                   
      <table class="static"> 
        <thead>                       
          <tr><th>ID</th><th>Código</th><th>Nombre</th><th>Propietario</th><th>Acciones</th></tr>
        </thead>                      
        <tbody>                       
          {foreach from=$procesos item=proceso}
            <tr>    
            <td>{$proceso->id}</td>
            <td nowrap>{$proceso->codigo}</td>
            <td><a href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}"><b>{$proceso->nombre}</b></a></td>
            <td>{$proceso->propietario->nombre} {$proceso->propietario->apellidos}</td>               
            <td><a href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">Ver</a>
            - <a href="index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">Editar</a>
            - <a href='index.php?page=proceso_borrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'
            onClick='return confirmar();'>Borrar</a></td>           
            </tr>
          {/foreach}
        </tbody>
      </table>
    {else}
        <div class="section">
          <p>No se ha definido ningún proceso para esta entidad</p>
        </div>
    {/if}
   </div>
</div>	   
