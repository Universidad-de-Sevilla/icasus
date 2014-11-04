{if $modulo == 'propio'}
	{if $indicadores}
	{foreach from=$indicadores item=item}
	<div style="margin-top:5px;border:1px solid #c9c9c9">
		<div style="padding:5px; background: #f6f6f6;">
      <a href="index.php?page=indicador_mostrar&id_indicador={$item->id}&id_entidad={$item->id_entidad}">{$item->codigo}</a> - 
      <b>{$item->nombre}</b><br />
      <b>Interpretación:</b> {$item->interpretacion}
    </div>
		<div style="background: white; padding:20px 40px; margin:10px;">
    <div class="panel_flot" id="{$item->id}" data-id_indicador="{$item->id}" data-nombre_indicador="{$item->nombre}" data-fecha_inicio="{$item->historicos}-01-01" data-fecha_fin="{$smarty.now|date_format:'%Y' - 1}-12-31" data-periodicidad="anual"></div>
    <div class="leyenda"></div>
  </div>
			<!-- <img src="index.php?page=grafica_indicador_agregado&id_indicador={$item->id}" alt="gráfica completa con los valores medios del indicador"/> -->
	</div>
	{/foreach}
	{else}
		<p>
		{$smarty.const.MSG_PROC_NO_INDIC}
		</p>
	{/if}
{/if}

{if $modulo == 'segregado'}
	{if $indicadores_segregados}
		{foreach from=$indicadores_segregados item=item}
			<div style="margin-top:10px;border:1px solid #c9c9c9">
        <div style="padding:5px; background: #f6f6f6;">
          <a href="index.php?page=indicador_mostrar&id_indicador={$item.id}&id_entidad={$item.id_entidad}">{$item.codigo}</a> - 
          <b>{$item.nombre}</b><br />
          <b>Interpretación:</b> {$item.interpretacion}
        </div>
				<div>
					<img src="index.php?page=grafica_indicador_segregado&id_indicador={$item.id}" alt="gráfica completa con los valores medios del indicador"/>
				</div>
			</div>
		{/foreach}
	{else}
		 <p> 
			{$smarty.const.MSG_PROC_NO_INDIC}
		 </p>
	{/if}
{/if}

{if $modulo == 'superior'}
	{if $indicadores_superior}
		{foreach from=$indicadores_superior item=item}
			<div style="margin-top:5px;border:1px solid #c9c9c9">
        <div style="padding:5px; background: #f6f6f6;">
          <a href="index.php?page=indicador_mostrar&id_indicador={$item->id}&id_entidad={$item->id_entidad}">{$item->codigo}</a> - 
          <b>{$item->nombre}</b><br />
          <b>Interpretación:</b> {$item->interpretacion}
        </div>
				<div>
<div style="background: white; padding:20px 40px; margin:10px;">
    <div class="panel_flot" id="{$item->id}" data-id_indicador="{$item->id}" data-nombre_indicador="{$item->nombre}" data-fecha_inicio="{$item->historicos}-01-01" data-fecha_fin="{$smarty.now|date_format:'%Y' - 1}-12-31" data-periodicidad="anual"></div>
    <div class="leyenda"></div>
  </div>
					<!-- <img src="index.php?page=grafica_indicador_agregado&id_indicador={$item->id}" alt="gráfica completa con los valores medios del indicador"/> -->
				</div>
			</div>
		{/foreach}
	{else}
			<p> 
				{$smarty.const.MSG_PROC_NO_INDIC}
			</p>
	{/if}
{/if}

<script src="theme/danpin/scripts/flot/jquery.flot.min.js" type="text/javascript"></script>		
<script src="theme/danpin/scripts/flot/jquery.flot.time.js" type="text/javascript"></script>
<script src="js/graficos_ficha_indicador.js" type="text/javascript"></script>
