{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
{$pagina->contenido}
<p>&nbsp;</p>
<p><a href="index.php?page=pagina_editar&id_pagina={$pagina->id}">Editar página</a>&nbsp;-&nbsp;
	<a href="index.php?page=pagina_crear">Nueva página</a>&nbsp;-&nbsp;
	<a href='index.php?page=pagina_mostrar&alias=indice'>Volver al índice</a></p>
