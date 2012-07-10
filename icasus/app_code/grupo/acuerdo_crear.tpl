<a href="javascript:void(0);"
onclick="
javascript:mostrarDIV('acuerdo_grabar.php','&id_acta={$acta->id_acta}&numero='+document.getElementById('numero').value+'&acuerdo='+document.getElementById('acuer').value,'ventana')">
<img src='iconos/16x16/disk.png'style="margin:10px 0 0 0">  Grabar</a>

<table class="estilo1_acta">
<tr><td>Número: <br /><input type="text" name="numero" id="numero" value="{$ultimo}"/></td></tr>
<tr><td>Acuerdo: <br /><textarea name="acuer"  id="acuer" rows="4" cols="55%"/></textarea></td></tr>
</table>

{include file="acuerdos_listado.tpl"}
