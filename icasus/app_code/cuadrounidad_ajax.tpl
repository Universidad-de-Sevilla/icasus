{if $modulo == 'propio'}
	{if $indicadores}
	{foreach from=$indicadores item=item}
	<div style="margin-top:5px;border:1px solid #c9c9c9">
		<div style="padding:5px; background: #f6f6f6;">
      <a href="index.php?page=indicador_mostrar&id_indicador={$item->id}&id_entidad={$item->id_entidad}">{$item->codigo}</a> - 
      <b>{$item->nombre}</b><br />
      <b>Interpretación:</b> {$item->interpretacion}
    </div>
		<div>
			<img src="index.php?page=grafica_indicador_agregado&id_indicador={$item->id}" alt="gráfica completa con los valores medios del indicador"/>
		</div>
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
			Este proceso no tiene indicadores.
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
					<img src="index.php?page=grafica_indicador_agregado&id_indicador={$item->id}" alt="gráfica completa con los valores medios del indicador"/>
				</div>
			</div>
		{/foreach}
	{else}
			<p> 
				Este proceso no tiene indicadores.
			</p>
	{/if}
{/if}
