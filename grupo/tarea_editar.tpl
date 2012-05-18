<a href="javascript:void(0);"
onclick="javascript:
mostrarDIV('tarea_actualizar.php','&id_tarea={$tarea->id_tarea}&id_acta={$acta->id_acta}&numero='+document.getElementById('numero').value+
'&tarea='+document.getElementById('tar').value+
'&responsable='+document.tarea_editada.responsable.value+
'&fiDay='+document.tarea_editada.fiDay.value+
'&fiMonth='+document.tarea_editada.fiMonth.value+
'&fiYear='+document.tarea_editada.fiYear.value+
'&adDay='+document.tarea_editada.adDay.value+
'&adMonth='+document.tarea_editada.adMonth.value+
'&adYear='+document.tarea_editada.adYear.value+
'&esDay='+document.tarea_editada.esDay.value+
'&esMonth='+document.tarea_editada.esMonth.value+
'&esYear='+document.tarea_editada.esYear.value,'ventana')">
<img src='iconos/16x16/disk.png' style="margin:10px 0 0 0"> Actualizar</a>

<form method="post" action="" name="tarea_editada">
<table class="estilo1_acta">       
<tr>
    <td scope="col">Número<br /><input type="text"  id="numero" value="{$tarea->numero}"/></td>
    <td colspan="2" scope="col">Responsable<br /><select name="responsable" id="responsable">
{foreach from=$acta->usuarios item=usuario}                        
<option value="{$usuario->id_usuario}" 
{if $usuario->id_usuario == $tarea->id_usuario} selected {/if} >
{$usuario->nombre_usuario} {$usuario->apellidos_usuario}</option>   
{/foreach}
</select></td>             
  </tr>
  <tr>
    <td colspan="3">Tarea<br /><textarea name="tar" id="tar" rows="4" style="width:95%"/>{$tarea->tarea}</textarea></td>
  </tr>
  <tr>
<td>Fecha adjudicación<br />                                                     
{html_select_date field_order='DMY' prefix="ad"  month_format='%m' time=$tarea->adjudicacion}</td>         
<td>Fecha estimada<br />   
{html_select_date field_order='DMY' prefix="es" month_format='%m' time=$tarea->estimada}</td>
<td>
Fecha finalización<br />
{html_select_date field_order='DMY' prefix="fi" month_format='%m' time=$tarea->finalizacion}
</td>
</tr>
</table>
</form>

{include file="tareas_listado.tpl"}
