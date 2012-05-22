{if $aviso}<p class='aviso'> {$aviso}</p>{/if}
{if $error}<p class='error'> {$error}</p>{/if}
<h2>Nueva página</h2>
<form name='formpagina' id='formpagina' action='index.php?page=pagina_crear' class='datos' method='post'>

	<p><label for='titulo'>Título</label> <span class='grey'>(requerido)</span><br />
	<input type='text' id='titulo' name='titulo' /></p>
	
	<p><label for='alias'>Alias</label> <span class='grey'>(requerido)</span><br />
	<input type='text' id='alias' name='alias' /></p>
	
	<p><label for='contenido'>Contenido de la página</label> <span class='grey'>(requerido)</span><br />
	<textarea name='contenido' class='inp' rows='25'></textarea></p>

	<input type='submit' class='submit' name='submit' value='Guardar' /> 

</form>
