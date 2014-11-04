<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/projects/icasus/)
// Archivo: clase/acta.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los cuadros de mandos o colecciones de indicadores 
//---------------------------------------------------------------------------------------------------

class Acuerdo extends ADOdb_Active_Record
{
	var $_table = 'acta_acuerdos';

	function borrar($condicion)
	{
                $this->load($condicion);
                if ($this->delete())
                {
                	return true;
                }
                else
                {
                        return false;
                }

	}
function ultimo_acuerdo($condicion)
    {
        $db = $this->DB();
        $query="SELECT MAX(numero) as ultimo FROM acta_acuerdos WHERE id_acta = $condicion";
        $valor = $db->execute($query);
        return $valor->fields['ultimo']+1;
    }

}

