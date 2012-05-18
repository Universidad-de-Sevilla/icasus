<?php
/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4 */

/**----------------------------------------------------------------------------
 * File: pagina.php
 * Type: class definition
 * Description: creación y edición de páginas dinamicas en html 
 * ----------------------------------------------------------------------------
 * @author Juanan Ruiz <juanan@juananruiz.com>
 * @copyright Juanan Ruiz <juanan@juananruiz.com>
 * @website http://icasus.forja.rediris.es/
 * @license http://www.opensource.org/licenses/bsd-license.php
 * @package Icasus
 * ----------------------------------------------------------------------------
 */

class pagina extends ADOdb_Active_Record
{

	function alieniza($alias)
	{
		return strtr($alias, 
			"???????¥µÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýÿ ", 
			"SOZsozYYuAAAAAAACEEEEIIIIDNOOOOOOUUUUYsaaaaaaaceeeeiiiionoooooouuuuyy_");
	}


	function haz_algo($vaariable)
	{
		$db = $this->DB();
		$query = "";
		$resultado = $db->Execute($query);
		while (!$resultado->EOF)
		{
			$datos[] = $resultado->fields;
			$resultado->MoveNext();
		}

		return $datos;
	}
}
?>
