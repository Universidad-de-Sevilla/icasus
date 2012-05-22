{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Nueva unidad</h3>
<form method='post' action='index.php?page=entidad_crear' id='formentidad' class='datos'>
<input type='hidden' name='id_entidad' id='id_entidad' value=1 />
<p><label for='nombre'>Nombre unidad</label> &nbsp; <span class='grey'>(requerido)</span>
<input type='text' name='nombre' id='nombre' class='inp' value='{$entidad.nombre}' /></p>

<p><label for='codigo'>C&oacute;digo</label> &nbsp;<br /> 
<input type='text' name='codigo' id='codigo' class='inp' value='{$entidad.codigo}' /></p>

<p><label for='id_padre'>Unidad superior</label> &nbsp; <br />
<select name='id_padre' id='id_padre' class='inp'>
{foreach from=$entidades item=padre}
	<option value='{$padre.id_entidad}'>{$padre.nombre} ({$padre.codigo})
	</option>
{/foreach}
</select></p>

<p><label for='web'>Página web</label> &nbsp; <br />
<input type='text' name='web' id='web' class='inp' value='{$entidad.web}' /></p>

<p><input type='submit' class='submit' value='Grabar' name='entidad_submit' /></p>
