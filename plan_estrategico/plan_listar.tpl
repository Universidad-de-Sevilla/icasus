{if $error}<p class='error'>{$error}</p>{/if}
{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $linea}
<h3>Lineas</h3>
<table width='100%'><thead><tr><th width="5%">Orden</th><th width="75%">Lineas</th><th width="20%">Acciones</th></tr></thead>
<tbody>
{foreach from=$linea item=plan}
   <tr>
    <td>{$plan.idorden}</td>
    <td>{$plan.titulo|htmlentities}</td>
    <td><a href="index.php?page=plan_estrategico/linea_modificar&id={$plan.id}&id_entidad={$plan.id_entidad}">Modificar</a> | <a href="index.php?page=plan_estrategico/borrar&id={$plan.id}&id_entidad={$plan.id_entidad}&elemento=linea"> Borrar</a></td>

   </tr>
{/foreach}
</tbody></table>
{else}
<p class='aviso'>No se ha definido ninguna linea</p>
{/if}

{if $objetivo}
<h3>Objetivos</h3>
<table width='100%' ><thead><tr><th width="5%">Orden</th><th width="75%">Objetivos</th><th width="20%">Acciones</th></tr></thead>
<tbody>
{foreach from=$objetivo item=plan}
   <tr>
    <td>{$plan.ordenlinea}.{$plan.ordenobjetivo}</td>
    <td>{$plan.titulo|htmlentities}</td>
    <td><a href="index.php?page=plan_estrategico/objetivo_modificar&id={$plan.id}&id_entidad={$plan.id_entidad}">Modificar</a> | <a href="index.php?page=plan_estrategico/borrar&id={$plan.id}&id_entidad={$plan.id_entidad}&elemento=objetivo">Borrar</a></td>
   </tr>
{/foreach}
</tbody></table>
{else}
<p class='aviso'>No se ha definido ningun objetivo</p>
{/if}

{if $accion}
<h3>Acciones</h3>
<table width='100%' ><thead><tr><th width="5%">Orden</th><th width="75%">Acciones</th><th width="20%">Acciones</th></tr></thead>
<tbody>
{foreach from=$accion item=plan}
   <tr>
    <td>{$plan.lineaorden}.{$plan.objetivoorden}.{$plan.accionorden}</td>
    <td>{$plan.titulo|htmlentities}</td>
    <td><a href="index.php?page=plan_estrategico/accion_modificar&id={$plan.id}&id_entidad={$plan.id_entidad}">Modificar</a> | <a href="index.php?page=plan_estrategico/borrar&id={$plan.id}&id_entidad={$plan.id_entidad}&elemento=accion">Borrar</a></td>
   </tr>
{/foreach}
</tbody></table>
{else}
<p class='aviso'>No se ha definido ninguna accion</p>
{/if}

