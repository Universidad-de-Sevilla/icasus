<h2> Crear una  Acci&oacute;n para  un Objetivo</h2>
<div class="arena-i">
<form action="" method="post" id="crearaccion" name="crearaccion" onsubmit="return validacrearaccion(this)">
<table width="100%">
<tr>
<th width="18%"><div align="left">L&iacute;nea:</div></th>
<td width="82%">
<select id="linea" name="linea" onchange="javascript:llamarasincrono('plan_estrategico/select_dependiente.php?id_entidad={$id_entidad}', 'objetivo');" style="width:100%">
<option value="0">Seleccionar una L&iacute;nea ... </option>
{foreach from=$linea item=li}
<option value="{$li.id}">{$li.idorden} :: {$li.titulo|htmlentities|truncate:65:"...":true} </option>
{/foreach}
</select></td>
</tr>
<tr>
<th><div align="left">Objetivo:</div></th>
<td>
<div id="objetivo">
<select name="objetivo" id="objetivo" disabled="disabled">
<option value="0">Seleccionar un Objetivo para esta Acci&oacute;n &nbsp;</option>
</select>
</div></td>
</tr>
<tr>
<th><div align="left">N&uacute;mero:</div></th>
<td><input type="text" name="orden" /></td>
</tr>
<th><div align="left">T&iacute;tulo:</div></th>
<td>
<textarea name="titulo" style="width:100%"></textarea>            </td>
</tr>
<tr>
  <th><div align="left">Descripci&oacute;n:</div></th>
  <td><textarea name="descripcion" style="width:100%"></textarea></td>
</tr>
<tr>
  <th><p align="left">Plazo:</p>    </th>
  <td><input type="text" name="plazo" /></td>
</tr>
<tr>
  <th><div align="left">Responsable:</div></th>
  <td>
<input type="text" name="responsable" tyle="width:75%" />
  </td>
</tr>
<tr>
  <th><div align="left">Meta:</div></th>
  <td><input type="text" name="meta" tyle="width:75%"/></td>
</tr>
<tr>
<th><div align="left">Fecha:</div></th>
<td><input type='text' id='date2' size="10" maxlength="10" name="fecha" class="borde" value="No usuar"/>
        <input type='button' id='for_date2' value='&nbsp;' onclick='showCalender(this)' class="boton2"  /></td>
</tr>
<tr>
<th><div align="left">
	<input name="crearaccion" type="hidden" value="crearaccion" />
</div></th>
<td><input name="entrar" type="submit" value="Insertar Acci&oacute;n"/></td>
</tr>
</table>

</form>
</div>

