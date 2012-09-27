{if $modulo == 'propio'}
	{if $indicadores}
	{foreach from=$indicadores item=item}
	<div style="margin-top:10pxi;border:1px solid #c9c9c9">
		<p>
			<img src="index.php?page=grafica_indicador_agregado&id_indicador={$item->id}" alt="gráfica completa con los valores medios del indicador"/>
		</p>
				<p style="text-align:center">{$item->interpretacion}</p>
	</div>
	{/foreach}
	{else}
		<p>
			Este proceso no tiene indicadores.
		</p>
	{/if}
{/if}

{if $modulo == 'segregado'}
	{if $indicadores_segregados}
		{foreach from=$indicadores_segregados item=item}
			<div style="margin-top:10px;border:1px solid #c9c9c9">
				<p>
					<img src="index.php?page=grafica_indicador_agregado&id_indicador={$item.id}" alt="gráfica completa con los valores medios del indicador"/>
				<p/>
				<p style="text-align:center">{$item.interpretacion}</p>
			</div>
		{/foreach}
	{else}
		 <p> 
			Este proceso no tiene indicadores.
		 </p>
	{/if}
{/if}

{if $modulo == 'superior'}
	{if $indicadores_superior}
		{foreach from=$indicadores_superior item=item}
			<div style="margin-top:10px;border:1px solid #c9c9c9">
				<p>
					<img src="index.php?page=grafica_indicador_agregado&id_indicador={$item->id}" alt="gráfica completa con los valores medios del indicador"/>
				</p>
				<p style="text-align:center">{$item->interpretacion}</p>
			</div>
		{/foreach}
	{else}
			<p> 
				Este proceso no tiene indicadores.
			</p>
	{/if}
{/if}
