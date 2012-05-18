{if $acta->acuerdos}
  <table width="95%" style="margin:20px;border:1px dotted #07a">
  <tr> <th>Acción</th><th>Nº</th><th>Acuerdo tomados</th></tr>
  {foreach from=$acta->acuerdos item=acuerdo}
  <tr>
    <td>
    <a href="javascript:void(0);" 
	onclick="javascript:
	if ( confirm('¿Desea borrar el acuerdo nº {$acuerdo->numero},\n{$acuerdo->acuerdo} ?'))
	{literal}{{/literal}mostrarDIV('acuerdo_borrar.php','&id_acta={$acta->id_acta}&id_acuerdo={$acuerdo->id_acuerdo}','ventana');
	{literal}}{/literal}" title="Borrar acuerdo"><img src='iconos/16x16/page_delete.png' title="Borrar acuerdo"/></a>
 
    <a href="javascript:void(0);" 
	onclick="javascript:mostrarDIV('acuerdo_editar.php','&id_acta={$acta->id_acta}&id_acuerdo={$acuerdo->id_acuerdo}','ventana');" title="Editar
acuerdo">
	<img src='iconos/16x16/page_edit.png' /></a>
	</td> 
    <td id="numero-{$acuerdo->id_acuerdo}">{$acuerdo->numero}</td><td width="100%" >{$acuerdo->acuerdo}</td>
  </tr>
  {/foreach}
  </table>
{else}
  <p class="aviso">No hay acuerdos tomados para este acta</p>
{/if}
