<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: class/proceso.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona los procesos
//---------------------------------------------------------------------------------------------------
class proceso extends ADOdb_Active_Record
{
   //Propiedades de la clase
	var $_table = 'proceso';
	var $propietario;
    	var $error; //propiedad de uso interno para almacenar los errores
   	var $madre;

	function load_joined($condition)
	{
		if ($this->load($condition))
		{
			$propietario = new ado_usuario();
			$propietario->load("id_usuario = $this->id_propietario");
			$this->propietario = $propietario;
			return true;
		}
		else
		{
			return false;
		}
	}

	function Find_joined($condition)
	{
		if ($procesos = $this->Find($condition))
		{	
			foreach ($procesos as $proceso)
			{
				$propietario = new ado_usuario();
				$propietario->load("id_usuario = $proceso->id_propietario");
				
				$proceso->propietario = $propietario;
				//pasar nombre del proceso madre
				$madre = new proceso();
				$madre->load("id_proceso = $proceso->id_madre");
				$proceso->madre = $madre;			
			}
			return $procesos;
		}
		else
		{
			return false;
		}
	}

    function borrar($id_proceso)
    {
        // Carga el proceso
        if ($this->load("id_proceso = $id_proceso"))
        {   
            // Comprueba que no tenga indicadores asociados
            $indicador = new ado_indicador();
            if ($indicador->Find("id_proceso = $id_proceso") OR $this->Find("id_madre = $id_proceso"))
            {
                // Informa de error
                $this->error = "No se puede borrar un proceso con indicadores o subprocesos asociados";
                return false;
            }
            else
            {
                // Borra el proceso
                $this->delete();
                return true;
            }
        }
        else
        {
            // Informa de error
            $this->error = "No existe el proceso";
            return false;
        }
    }
} 
