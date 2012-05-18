<h2>Modificar L&iacute;nea Estrat&eacute;gica</h2>

<div style="border:1px solid #07a; padding:10px;margin-top:20px">{$linea->titulo|htmlentities}</div>
<div class="arena-i">
<form action="" method="post" id="modlinea" name="modlinea" onsubmit="return validamodlinea(this)">
<table width=100%">
<tr>
<th><div align="left">N&uacute;mero:</div></th>
<td>
<input name="orden" type="text" value="{$linea->idorden}" />
</td>
</tr>
<tr>
<th><div align="left">T&iacute;tulo:</div></th>
<td>
<textarea name="titulo" style="width:100%">{$linea->titulo|htmlentities}</textarea>
</td>
</tr>
<tr>
<th><div align="left">Descripci&oacute;n</div></th>
<td>
<textarea name="descripcion" style="width:100%">{$linea->descripcion|htmlentities}</textarea>
</td>
</tr>


<tr>
<th>
</th>
<td><input name="modlinea" type="hidden" value="modlinea" />
<input name="modificar" type="submit" value="Modificar Linea Estrat&eacute;gica"/>
</td>
</tr>
</table>

</form>
</div>

