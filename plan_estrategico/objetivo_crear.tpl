<h2>Crear Objetivo para L&iacute;nea Estrat&eacute;gica</h2>
<div class="arena-i">
<form action="" method="post" id="crearobjetivo" name="crearobjetivo" onsubmit="return validacrearobjetivo(this)">
<table width="100%">
<tr>
<th width="18%"><div align="left">L&iacute;neas:</div></th>
<td width="82%">
<select name="linea" style="width:100%">
<option value="0">Seleccionar una L&iacute;nea Estrat&eacute;gica &nbsp;</option>
{foreach from=$linea item=li}
<option value="{$li.id}">{$li.idorden} :: {$li.titulo|htmlentities|truncate:65:"...":true} </option>
{/foreach}

</select>               </td>
</tr>
<tr>
<th><div align="left">N&uacute;mero:</div></th>
<td><input type="text" name="orden" /></td>
</tr>
<tr>
<th><div align="left">T&iacute;tulo:</div></th>
<td>
<textarea name="titulo" style="width:100%" ></textarea>            </td>
</tr>
<tr>
<th><div align="left">Descripci&oacute;n</div></th>
<td>
<textarea name="descripcion" style="width:100%"></textarea>               </td>
</tr>
<tr>
<th><div align="left">
<input name="crearobjetivo" type="hidden" value="crearobjetivo" />
</div></th>
<td><input name="entrar" type="submit" value="Insertar Objetivo"/></td>
</tr>
</table>

</form>
</div>

