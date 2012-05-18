{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Editando grupo</h3>
<form method='post' action='index.php?page=grupo/grupo_editar' name='formentidad' id='formentidad' class="datos">
	<input type='hidden' name='id_entidad' id='id_entidad' value='{$entidad.id_entidad}' />
	<input type='hidden' name='id_padre' id='id_padre' value='{$entidad.id_padre}' />
	
	<p><label for='nombre'>Nombre grupo</label> &nbsp; <span class='grey'>(requerido)</span><br />
	<input type='text' name='nombre' id='nombre' class='inp' value='{$entidad.nombre}' /></p>
	
	<p><label for='codigo'>C&oacute;digo</label> &nbsp; <br />
	<input type='text' name='codigo' id='codigo' class='inp' value='{$entidad.codigo}' /></p>

	<p><label for='objeto'>Finalidad</label> &nbsp; <br />
	<input type='text' name='objeto' id='objeto' class='inp' value='{$entidad.objeto}' /></p>
	
	<p><label for='frecuencia'>Frecuencia</label> &nbsp; <br />
	<input type='text' name='frecuencia' id='frecuencia' class='inp' value='{$entidad.frecuencia}' /></p>
	
	<p><input type='button' class='submit-btn' value='Grabar' name='entidad_submit' 
	onclick='javascript:entidad_validar();' /></p>
</form>
