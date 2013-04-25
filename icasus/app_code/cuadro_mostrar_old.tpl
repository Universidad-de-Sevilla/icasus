{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>{$_nombre_pagina}</h3>
<p>
  <a href='index.php?page=cuadro_listar'>
   <img src='iconos/16x16/table.png'  alt='icono cuadro'/>Listar
  </a> &nbsp; 
  <a href='index.php?page=cuadro_editar&id={$cuadro->id}'>
   <img src='iconos/16x16/table_edit.png'  alt='icono cuadro lapiz'/>Editar
  </a> &nbsp; 
  <a href='index.php?page=cuadro_crear&id={$cuadro->id}'>
   <img src='iconos/16x16/table_add.png'  alt='icono cuadro signo mas'/>Crear
  </a> &nbsp; 
  <a href="index.php?page=cuadro_exportar_excel&id={$cuadro->id}">
   <img src='iconos/16x16/page_excel.png' alt='icono excel' /> Exportar a Excel
  </a> &nbsp;
  <a href="index.php?page=cuadro_exportar_word&id={$cuadro->id}">
   <img src='iconos/16x16/page_word.png' alt='icono word' /> Exportar a Word
  </a>
</p>

{if $cuadro->comentarios}<div class="marcosimple"><p>{$cuadro->comentarios}</p></div>{/if}
{if $indicadores}
	<table>
		{foreach from=$indicadores item=indicador}

		{/foreach}
	</table>
	{foreach from=$indicadores item=indicador}
		<div class='marcosimple'>
		<h3><a
		href="index.php?page=indicador_datos&id_indicador={$indicador->id_indicador}">{$indicador->codigo}</a>
		{$indicador->nombre}</h3>
		<strong>proceso:</strong> {$indicador->proceso->nombre}
		<br /><strong>descripci&oacute;n:</strong> {$indicador->descripcion}
		<br /><strong>formulaci&oacute;n:</strong> {$indicador->formulacion}
		<p><img src='theme/usevilla/leyenda500.png' alt='Leyenda' /><br /><img src='{$indicador->ruta_imagen}' alt='grafica del indicador' /></p>
		</div>
	{/foreach}
{else}

	<p class='aviso'>No hay indicadores definidos para este cuadro de mandos.</p>
{/if}	

