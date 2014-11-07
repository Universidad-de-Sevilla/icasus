<div><h1 style="color: #999999; font-weight: normal;">{$smarty.const.TXT_FOOTER}</h1>
<h2>{$smarty.const.TXT_PAGE_TITULO}</h2>
</div>
{$pagina->contenido}
<p>&nbsp;</p>
<p>
  <a href="index.php?page=pagina_editar&id_pagina={$pagina->id}">{$smarty.const.TXT_PAGE_EDIT}</a>&nbsp;-&nbsp;
	<a href="index.php?page=pagina_crear">{$smarty.const.TXT_NEW_PAGE}</a>&nbsp;-&nbsp;
	<a href='index.php?page=pagina_mostrar&alias=indice'>{$smarty.const.TXT_VOLVER_INDICE}</a>
</p>
