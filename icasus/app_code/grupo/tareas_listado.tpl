{if $acta->tareas}
<table width="95%" style="margin:20px;border:1px dotted #07a">
<tr><th>Acción</th><th>Nº</th><th>Usuario</th><th>Tarea</th><th>Adjudicación</th><th>Estimación</th><th>Finalización</th></tr>
{foreach from=$acta->tareas item=tarea}
<tr>
<td>

<a href="javascript:void(0);" 
    onclick="javascript:
    if ( confirm('¿Desea borrar el tarea nº {$tarea->numero},\n{$tarea->tarea} ?'))
    {literal}{{/literal}mostrarDIV('tarea_borrar.php','&id_acta={$acta->id_acta}&id_tarea={$tarea->id_tarea}','ventana');
    {literal}}{/literal}" title="Borrar tarea"><img src='iconos/16x16/plugin_delete.png' title="Borrar tarea"/></a>

<a href="javascript:void(0);" 
    onclick="javascript:mostrarDIV('tarea_editar.php','&id_acta={$acta->id_acta}&id_tarea={$tarea->id_tarea}','ventana');" title="Editar tarea">
    <img src='iconos/16x16/plugin_edit.png' /></a>                  

</td>
<td>{$tarea->numero}</td>  
<td>{$tarea->nombre}</td>
<td>{$tarea->tarea}</td>
<td>{$tarea->adjudicacion|date_format:"%d-%m-%Y"}</td>
<td>{$tarea->estimada|date_format:"%d-%m-%Y"}</td>       
<td>{$tarea->finalizacion|date_format:"%d-%m-%Y"}</td>
</tr>                       
{/foreach}                  
</table>                      

{else}
  <p class="aviso">No hay tareas definidas en este acta</p>     
{/if}
