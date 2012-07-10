<div class="box grid_16">
  <div class="block">	
    <div class="section clearfix" style="padding:5px;">
        <a href="index.php?page=proceso_crear&id_entidad={$entidad->id}"><img src='/icons/ff16/cog_add.png' /> Crear proceso</a> 
        &nbsp; &nbsp; &nbsp;
        <a href="index.php?page=entidad_datos&id_entidad={$entidad->id}"><img src='/icons/ff16/chart_organisation.png' /> Ficha de Unidad</a>
    </div>
  </div>
</div>
<div class="box grid_16">
  <div class="block">	
    {if $procesos}                   
      <table class="static"> 
        <thead>                       
          <tr class="gradeX"><th>ID</th><th>Código</th><th>Nombre</th><th>Propietario</th><th>Acciones</th></tr>
        </thead>                      
        <tbody>                       
          {foreach from=$procesos item=proceso}
            <tr class="gradeX">    
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
