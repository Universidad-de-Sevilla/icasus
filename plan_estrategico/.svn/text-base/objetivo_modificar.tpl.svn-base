<h2>Modificar Objetivo Estrat&eacute;gico</h2>
<div style="border:1px solid #07a; padding:10px;margin-top:20px" >{$objetivo.titulo|htmlentities}</div>
<div class="arena-i">
<form action="" method="post" id="modobjetivo" name="modobjetivo" onsubmit="return validamodobjetivo(this)">
<table width="100%">

<tr>
<th width="18%"><div align="left">L&iacute;neas:</div></th>
<td width="82%">
<select name="linea" width="100%">
<option value="0" >Seleccionar una L&iacute;nea Estrat&eacute;gica</option>
{foreach from=$linea item=li}
<option value="{$li.id}" {if $li.id == $objetivo.idlinea} selected="selected"{/if}>{$li.idorden} :: {$li.titulo|htmlentities|truncate:65:"...":true} </option>
{/foreach}

</select>
</td>
</tr>
<tr>
<th width="161"><div align="left">N&uacute;mero:</div></th>
<td width="539">
<input name="orden" type="text" value="{$objetivo.idorden}" />
</td>
</tr>
<tr>
<th width="161"><div align="left">T&iacute;tulo:</div></th>
<td width="539">
<textarea name="titulo" style="width:100%">{$objetivo.titulo|htmlentities}</textarea>
</td>
</tr>
<tr>
<th><div align="left">Descripci&oacute;n</div></th>
<td>
<textarea name="descripcion" style="width:100%">{$objetivo.descripcion|htmlentities}</textarea>
</td>
</tr>


<tr>
<th>
</th>
<td>
<div align="left">
<input name="modobjetivo" type="hidden" value="modobjetivo" />
<input name="modificar" type="submit" value="Modificar Objetivo"/>
</div>

</td>
</tr>
</table>

</form>
</div>

