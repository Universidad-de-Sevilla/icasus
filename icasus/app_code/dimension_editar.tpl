{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h2>Editar dimensi&oacute;n</h2>

<form action='index.php?page=dimension_editar' method="post" class="datos" name="formeditar">
	<input type='hidden' name='id' value='{$dimension->id}' />
	<p><label for='nombre'>Nombre</label> 
	<input name='nombre' class='inp' value='{$dimension->nombre}' /></p>
	<p><input type='submit' name='submitcrear' value='Aceptar' /></p>
</form>
