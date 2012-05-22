{if $aviso}<p class='aviso'> {$aviso}</p>{/if}
{if $error}<p class='error'> {$error}</p>{/if}
<h2>Editando página</h2>
<form name='formpagina' id='formpagina' action='index.php?page=pagina_editar' class='datos' method='post'>
	
	<input type='hidden' id='id_pagina' name='id_pagina' value='{$pagina->id}' />

	<p><label for='titulo'>Título</label> <span class='grey'>(requerido, puedes explayarte)</span><br />
	<input class='inp' type='text' id='titulo' name='titulo' value='{$pagina->titulo}' /></p>
	
	<p><label for='alias'>Alias</label> <span class='grey'>(requerido, se muy breve)</span><br />
	<input type='text' id='alias' name='alias'  value='{$pagina->alias}' /></p>
	
	<p><label for="contenido">Contenido de la página</label> <span class="grey">(requerido)</span><br />
	<textarea name="contenido" class="inp" rows="25">{$pagina->contenido}</textarea>
	</p>

	<p><input type='submit' id='submit' name='submit' class='submit' value='Guardar' /> </p>

</form>
