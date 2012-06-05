<h3>Lista de procesos</h3>        
<p><a href="index.php?page=proceso_crear&id_entidad={$entidad->id}"><img 
        src='/icons/ff16/cog_add.png' /> Crear nuevo proceso</a></p>

{if $procesos}                   
    <table class='listing' id='sortable'>
    <thead>                       

        <tr><th>Código</th><th>Nombre</th><th>Propietario</th><th>Tipo</th><th>Acciones</th></tr>
    </thead>                      
    <tbody>                       
        {foreach from=$procesos item=proceso}
            <tr>                  
            <td nowrap>{$proceso->codigo}</td>
            <td><a href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}"><b>{$proceso->nombre}</b></a></td>
            <td>{$proceso->propietario->nombre} {$proceso->propietario->apellidos}</td>               
            <td>{$proceso->alcance}</td>
            <td><a href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">Ver</a>
            - <a href="index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">Editar</a>
            - <a href='index.php?page=proceso_borrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'
            onClick='return confirmar();'>Borrar</a></td>           
            </tr>
        {/foreach}
    </tbody>
    </table>
{else}
    <p class='aviso'>No se ha definido ningún proceso para esta entidad</p>
{/if}
