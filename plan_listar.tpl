{if $error}<p class='error'>{$error}</p>{/if}
{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $linea}
<h3>Lineas</h3>
<table width='100%'><thead><tr><th>Orden</th><th>Lineas</th></tr></thead>
<tbody>
{foreach from=$linea item=plan}
   <tr>
    <td>{$plan.idorden}</td>
    <td>{$plan.titulo|htmlentities}</td>
    <td><img src='theme/usevilla/iconos/modificar.gif' /></td>
    <td><img src='theme/usevilla/iconos/borrar.gif' /></td>
   </tr>
{/foreach}
</tbody></table>
{else}
<p class='aviso'>No se ha definido ninguna linea</p>
{/if}

{if $objetivo}
<h3>Objetivos</h3>
<table width='100%' ><thead><tr><th>Orden</th><th>Objetivos</th></tr></thead>
<tbody>
{foreach from=$objetivo item=plan}
   <tr>
    <td>{$plan.idlinea}.{$plan.idorden}</td>
    <td>{$plan.titulo|htmlentities}</td>
    <td><img src='theme/usevilla/iconos/modificar.gif' /></td>
    <td><img src='theme/usevilla/iconos/borrar.gif' /></td>
   </tr>
{/foreach}
</tbody></table>
{else}
<p class='aviso'>No se ha definido ningun objetivo</p>
{/if}

{if $accion}
<h3>Acciones</h3>
<table width='100%' ><thead><tr><th>Orden</th><th>Acciones</th></tr></thead>
<tbody>
{foreach from=$accion item=plan}
   <tr>
    <td>{$plan.lineaorden}.{$plan.objetivoorden}.{$plan.accionorden}</td>
    <td>{$plan.titulo|htmlentities}</td>
    <td><img src='theme/usevilla/iconos/modificar.gif' /></td>
    <td><img src='theme/usevilla/iconos/borrar.gif' /></td>
   </tr>
{/foreach}
</tbody></table>
{else}
<p class='aviso'>No se ha definido ninguna accion</p>
{/if}

