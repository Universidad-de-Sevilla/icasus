<!-- Crear una nueva linea del plan -->
{if $clinea}
{if $lineacreada}
{$okanuncio}ceaaaaaada
{$lineacreada}
{else}
<h2> Crear una L&iacute;nea Estrat&eacute;gica</h2>
<div>
<form action="" method="post" id="crearlinea" name="crearlinea" onsubmit="return validacrearlinea(this)">
<table width="100%">
<tr>
<th width="18%"><div align="left">Estado:</div></th>
<td width="82%">
<select name="estado">
<option value="1" selected="selected">Activo</option>
<option value="0">Desactivado</option>
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
<input name="crearlinea" type="hidden" value="crearlinea" />
</div></th>
<td><input name="entrar" type="submit" value="Insertar Linea Estrat&eacute;gica"/></td>
</tr>
</table>
</form>
</div>
{/if}{/if}


<!-- Crear un objetivo para una linea determinada -->
{if $cobjetivo}
<h2> Crear Objetivo para L&iacute;nea Estrat&eacute;gica</h2>
<div class="arena-i">
<form action="" method="post" id="crearobjetivo" name="crearobjetivo" onsubmit="return validacrearobjetivo(this)">
<table width="100%">
<tr>
<th width="18%"><div align="left">L&iacute;neas:</div></th>
<td width="82%">
<select name="linea" style="width:100%">
<option value="0">Seleccionar una L&iacute;nea Estrat&eacute;gica &nbsp;</option>
{foreach from=$linea item=li}
<option value="{$li.id}">{$li.idorden} :: {$li.titulo|htmlentities|truncate:55:"...":true} </option>
{/foreach}

</select>               </td>
</tr>
<tr>
<th><div align="left">N&uacute;mero:</div></th>
<td><input type="text" name="orden" /></td>
</tr>
<tr>
<th ><div align="left">Estado:</div></th>
<td >
<select name="estado">
<option value="1" selected="selected">Activo</option>
<option value="0">Desactivado</option>
</select>               </td>
</tr>
<tr>
<th width="161"><div align="left">T&iacute;tulo:</div></th>
<td width="539">
<textarea name="titulo" style="width:100%"></textarea>            </td>
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
{/if}

<!-- Crear una accion nueva -->
{if $caccion}
<h2> Crear una  Acci&oacute;n para  un Objetivo</h2>
<div class="arena-i">
<form action="" method="post" id="crearaccion" name="crearaccion" onsubmit="return validacrearaccion(this)">
<table width="100%">
<tr>
<th width="18%"><div align="left">L&iacute;nea:</div></th>
<td width="82%">
<select id="linea" name="linea" onchange="javascript: llamarasincrono('select_dependientes.php', 'objetivo');">
<option value="0">Seleccionar una L&iacute;nea ... </option>
{foreach from=$linea item=li}
<option value="{$li.id}">{$li.idorden} :: {$li.titulo|htmlentities|truncate:55:"...":true} </option>
{/foreach}
</select></td>
</tr>
<tr>
<th width="25%"><div align="left">Objetivo:</div></th>
<td width="75%">
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
<tr>
<th ><div align="left">Estado:</div></th>
<td >
<select name="estado">
<option value="1" selected="selected">Activo</option>
<option value="0">Desactivado</option>
</select>               </td>
</tr>
<tr>
<th width="161"><div align="left">T&iacute;tulo:</div></th>
<td width="539">
<textarea name="titulo" ></textarea>            </td>
</tr>
<tr>
  <th><div align="left">Descripci&oacute;n:</div></th>
  <td><textarea name="descripcion" ></textarea></td>
</tr>
<tr>
  <th><p align="left">Plazo:</p>    </th>
  <td><input type="text" name="plazo" /></td>
</tr>
<tr>
  <th><div align="left">Responsable:</div></th>
  <td><select name="responsable">
  <option value="">Seleccionar un responsable .....</option>
  {foreach item=lista from=$empleados}
  <option value="{$lista.ApellidosyNombre|htmlentities}">{$lista.ApellidosyNombre|htmlentities}</option>
  {/foreach}
  </select></td>
</tr>
<tr>
  <th><div align="left">Meta:</div></th>
  <td><input type="text" name="meta" /></td>
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
{/if}
