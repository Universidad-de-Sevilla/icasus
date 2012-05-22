<h2>Mapa Estrat&eacute;gico de la Unidad - {$entidad} </h2>

<div style="background: #e9e9e9;color:#000;padding:1em;">
  {foreach from=$informe item=lista}
   {if $linea_anterior != $lista.lineati}
     <div style="border:1px solid #07a;padding:1em">
        <b>{$lista.lineaord}.- {$lista.lineati|htmlentities}:</b>
     </div>
   {/if}
   {if $objetivo_anterior != $lista.objetivoti }
     <div style="margin-left:50px; padding:10pxi 0 0;border-bottom:1px solid #d60;margin-top:10px">
     <b>{$lista.lineaord}.{$lista.objetivoord}.-{$lista.objetivoti|htmlentities}.</b>
     </div>
   {/if}
   <div style="margin-left:80px;">
     <p><b>{$lista.lineaord}.{$lista.objetivoord}.{$lista.accionord}.-</b>
     {$lista.accionti|htmlentities}</p>
   </div>
   {capture assign=linea_anterior}{$lista.lineati}{/capture}
   {capture assign=objetivo_anterior}{$lista.objetivoti}{/capture}
  {/foreach}
</div>

