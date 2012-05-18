<form method="post" action="" name="convocatoria">

<a href="javascript:void(0);"
onclick="javascript:mostrarDIV('convocatoria_grabar.php','&id_acta={$acta->id_acta}&lugar='+document.getElementById('lugar').value+
'&dia='+document.convocatoria.cfechaDay.value+'&mes='+document.convocatoria.cfechaMonth.value+'&ano='+document.convocatoria.cfechaYear.value+'&hora='+document.convocatoria.choraHour.value+'&minuto='+document.convocatoria.choraMinute.value,'ventana')">
<img src='iconos/16x16/disk.png' style="margin:10px 0 0 0"> Grabar</a>

<table class="estilo1_acta">
  <tr>
    <td colspan="2" scope="col">Lugar<br />
<input type="text" id="lugar" name="lugar" value="{$acta->lugar}" style="width:95%"/></td>
  </tr>
  <tr>
    <td>Fecha de inicio<br />
{html_select_date field_order='DMY' prefix="cfecha" month_format='%m' end_year="+1"  time=$acta->fecha}</td>
    <td>Hora inicio<br />
{html_select_time use_24_hours=true prefix="chora" display_seconds=false  time=$acta->fecha}</td>
  </tr>
</table>


</form>
{include file="convocatoria_listado.tpl"}
{include file="convocatoria_acciones.tpl"}

