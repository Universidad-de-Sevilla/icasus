<h2>Mapa Estrat&eacute;gico de la Unidad - {$entidad} </h2>

<div style="color:#000;padding:1em;">
  {foreach from=$informe item=lista}
   {if $linea_anterior != $lista.lineati}
     <div>
        <b>{$lista.lineaord}.- {$lista.lineati|htmlentities}:</b>
     </div>
   {/if}
   {if $objetivo_anterior != $lista.objetivoti }
     <div style="margin:5px 0 0 50px;">
     <b>{$lista.lineaord}.{$lista.objetivoord}.-{$lista.objetivoti|htmlentities}.</b>
     </div>
   {/if}
   <div style="margin:10px 0 0 80px;padding:5px;border:1px solid #07a">
     <p><b>{$lista.lineaord}.{$lista.objetivoord}.{$lista.accionord}.-</b>
     {$lista.accionti|htmlentities}</p>
	<table width="100%">
	<tr>
	<th width="25%">Responsable:</th><td>{$lista.accionres|htmlentities}</td>
	</tr>
        <tr>
        <th>Meta:</th><td>{$lista.accionmeta|htmlentities}</td>
        </tr>
	<tr>
        <th>Plazo:</th><td>{$lista.accionplazo|htmlentities}</td>
        </tr>
	</table>
   </div>
   {capture assign=linea_anterior}{$lista.lineati}{/capture}
   {capture assign=objetivo_anterior}{$lista.objetivoti}{/capture}
  {/foreach}
</div>

