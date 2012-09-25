<p></p>
{if $cuadromandos}
 <div class="box grid_16 single_datatable">
    <h2 class="box_head grad_grey_dark"><a href='index.php?page=cuadromando_crear' title="Crear nuevo cuadro de mando"><img 	src='/icons/ff16/table_add.png' alt='icono' /> Crear nuevo cuadro de mando</a></h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
   	<div id="dt1" class="no_margin">
      <table class="display datatable"> 
<thead>
	<tr><th>Nombre</th><th>Indicadores</th><!--<th>Acciones</th>--></tr>
</thead>
<tbody>
	{foreach from=$cuadromandos item=cuadromando}
		<tr>
		<td><a href="index.php?page=cuadromando_mostrar&id={$cuadromando->id}">{$cuadromando->nombre}</a></td> 
		<td>{$cuadromando->indicadores|@count}</td>
		<!-- <td><a href="index.php?page=cuadromando_mostrar&id={$cuadromando->id}">Ver</a> - <a href="index.php?page=cuadromando_editar&id={$cuadromando->id}">Editar</a></td>-->
		</tr>
	{/foreach}
</tbody>	
</table>
  </div>
 </div> 
{else}
<p class='aviso'>No ha definido ningún cuadro de mando todavía</p>
{/if}
