<a href="javascript:void(0);"
onclick="
javascript:mostrarDIV('tarea_grabar.php','&id_acta={$acta->id_acta}&numero='+
document.getElementById('numero').value+'&tarea='+
document.getElementById('tar').value+'&responsable='+
document.tarea_nueva.responsable.value+'&adDay='+
document.tarea_nueva.adDay.value+'&adMonth='+
document.tarea_nueva.adMonth.value+'&adYear='+
document.tarea_nueva.adYear.value+'&esDay='+
document.tarea_nueva.esDay.value+'&esMonth='+
document.tarea_nueva.esMonth.value+'&esYear='+
document.tarea_nueva.esYear.value,'ventana')">
<img src='iconos/16x16/disk.png'i style="margin:10px 0 0 0"> Grabar</a>

<form method="post" action="" style="margin:20px" name="tarea_nueva">
<table width="100%" style="border:1px dotted #07a">  
<tr>
    <td scope="col">Número<br /><input type="text"  id="numero" value="{$ultima}"/></td>
    <td colspan="2" scope="col">Responsable<br /><select name="responsable" id="responsable">
{foreach from=$acta->usuarios item=usuario}                        
<option value="{$usuario->id_usuario}" >{$usuario->nombre_usuario} {$usuario->apellidos_usuario}</option>
{/foreach}
</select></td>
  </tr>
  <tr>
    <td colspan="3">Tarea<br /><textarea name="tar" id="tar" rows="4" style="width:95%"/></textarea></td>
  </tr>
  <tr>
<td>Fecha adjudicación<br />                                          
{html_select_date field_order='DMY' prefix="ad"  month_format='%m'}</td>
<td>Fecha estimada<br />
{html_select_date field_order='DMY' prefix="es" month_format='%m'}</td>
<!--
<td>
Fecha finalización<br />
{html_select_date field_order='DMY' prefix="fi" month_format='%m' }
</td>
-->
</tr>
</table>
</form>

{include file="tareas_listado.tpl"}
