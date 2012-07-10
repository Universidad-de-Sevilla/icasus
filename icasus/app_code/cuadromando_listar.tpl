{if $error}<p class='error'>{$error}</p>{/if}
{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
<p><a href='index.php?page=cuadromando_crear'><img 
	src='iconos/16x16/table_add.png' alt='icono' /> Crear nuevo cuadro de mando</a></p>
{if $cuadromandos}
<table class="datos">
<thead>
	<tr><th>Nombre</th><th>Indicadores</th><th>Acciones</th></tr>
</thead>
<tbody>
	{foreach from=$cuadromandos item=cuadromando}
		<tr>
		<td>{$cuadromando->nombre}</td> 
		<td>{$cuadromando->numero_indicadores}</td>
		<td><a href="index.php?page=cuadromando_mostrar&id={$cuadromando->id}">Ver</a> - <a href="index.php?page=cuadromando_editar&id={$cuadromando->id}">Editar</a></td>
		</tr>
	{/foreach}
</tbody>	
</table>
{else}
<p class='aviso'>No ha definido ningún cuadro de mando todavía</p>
{/if}
