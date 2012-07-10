{if $acta->asuntos}
  <table width="95%" style="margin:20px;border:1px dotted #07a">
  <tr> <th>Acción</th><th>Nº</th><th>Asunto a tratar</th></tr>
  {foreach from=$acta->asuntos item=asunto}
  <tr>
    <td>
    <a href="javascript:void(0);" 
	onclick="javascript:
	if ( confirm('¿Desea borrar el asunto nº {$asunto->numero},\n{$asunto->asunto} ?'))
	{literal}{{/literal}mostrarDIV('asunto_borrar.php','&id_acta={$acta->id_acta}&id_asunto={$asunto->id_asunto}','ventana');
	{literal}}{/literal}" title="Borrar asunto"><img src='iconos/16x16/application_delete.png' title="Borrar asunto"/></a>
 
    <a href="javascript:void(0);" 
	onclick="javascript:mostrarDIV('asunto_editar.php','&id_acta={$acta->id_acta}&id_asunto={$asunto->id_asunto}','ventana');" title="Editar asunto">
	<img src='iconos/16x16/application_edit.png' /></a>
	</td> 
    <td id="numero-{$asunto->id_asunto}">{$asunto->numero}</td><td width="100%" id="asunto-{$asunto->id_asunto}">{$asunto->asunto}</td>
  </tr>
  {/foreach}
  </table>
{else}
  <p class="aviso">No hay asuntos a tratar definidos para este acta</p>
{/if}
