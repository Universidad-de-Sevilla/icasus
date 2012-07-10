<h2>Modificar Acci&oacute;n Estrat&eacute;gica</h2>
<div style="border:1px solid #07a; padding:10px;margin-top:20px" >{$accion.titulo|htmlentities}
</div>
<div class="arena-i">
<form action="" method="post" id="modaccion" name="modaccion" onsubmit="return validamodaccion(this)">
<table width="100%">
<tr>
<th width="18%"><div align="left">L&iacute;nea:</div></th>
<td width="22%">
<select id="linea" name="linea" onchange="javascript: llamarasincrono('plan_estrategico/select_dependiente.php?id_entidad={$accion.id_entidad}', 'objetivo');">
<option value="0">Seleccionar una Linea .....</option>
{foreach from=$linea item=li}
<option value="{$li.id}" {if $accion.idlinea == $li.id }selected="selected" {/if}>{$li.idorden} :: {$li.titulo|htmlentities|truncate:65:"...":true} </option>
{/foreach}
</select>		
</td>
</tr>
<tr>
<th><div align="left">Objetivo:</div></th>
<td>
<div id="objetivo">
<select name="objetivo" id="objetivo" >
<option value="0">Seleccionar un Objetivo ...</option>
{foreach from=$objetivo item=li}
<option value="{$li.id}" {if $accion.idobjetivo == $li.id }selected="selected" {/if}>{$li.idorden} :: {$li.titulo|htmlentities|truncate:65:"...":true}</option>
{/foreach}
</select>
</div>		
</td>
</tr>
<tr>
<th><div align="left">N&uacute;mero:</div></th>
<td><input type="text" name="orden" value="{$accion.idorden}"/></td>
</tr>
<tr>
<th width="161"><div align="left">T&iacute;tulo:</div></th>
<td width="539">
<textarea name="titulo" style="width:100%">{$accion.titulo|htmlentities}</textarea>		</td>
</tr>
<tr>
<th><div align="left">Descripci&oacute;n</div></th>
<td>
<textarea name="descripcion" style="width:100%">{$accion.descripcion|htmlentities}</textarea>		</td>
</tr>
<tr>
  <th><p align="left">Plazo:</p>    </th>
  <td><input type="text" name="plazo"  value="{$accion.plazo|htmlentities}"/></td>
</tr>
<tr>
  <th><div align="left">Responsable:</div></th>
  <td><textarea name="responsable"  style="width:75%">{$accion.responsable|htmlentities}</textarea></td>
</tr>
<tr>
  <th><div align="left">Meta:</div></th>
  <td><textarea name="meta"  style="width:75%">{$accion.meta|htmlentities}</textarea></td>
</tr>
<tr>
<th><div align="left">Fecha:</div></th>
<td><input type='text' id='date2' size="10" maxlength="10" name="fecha" class="borde" value="{$accion.fecha|date_format:'%d-%m-%Y'}"/>
        <input type='button' id='for_date2' value='&nbsp;' onclick='showCalender(this)' class="boton2"  /></td>
</tr> 
<tr>
<th><div align="left">
<input name="modaccion" type="hidden" value="modaccion" />
</div></th>
<td><input name="entrar" type="submit" value="Modificar Acci&oacute;n"/></td>
</tr>
</table>

</form>
</div>

