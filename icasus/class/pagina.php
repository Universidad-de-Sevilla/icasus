<?php
//----------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: class/pagina.php
//----------------------------------------------------------------------------
// Creación y edición de páginas dinamicas en html 
//----------------------------------------------------------------------------

class pagina extends ADOdb_Active_Record
{
  public $_table = "paginas";

	function alieniza($alias)
	{
		return strtr($alias, 
			"???????¥µÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýÿ ", 
			"SOZsozYYuAAAAAAACEEEEIIIIDNOOOOOOUUUUYsaaaaaaaceeeeiiiionoooooouuuuyy_");
	}
}
?>
