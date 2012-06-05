<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: class/proceso.php
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona los procesos
//---------------------------------------------------------------------------------------------------
class proceso extends ADOdb_Active_Record
{
	public $_table = 'procesos';
	public $propietario;
 	public $error; //propiedad de uso interno para almacenar los errores
 	public $madre;

	public function load_joined($condition)
	{
		if ($this->load($condition))
		{
			$propietario = new usuario();
			$propietario->load("id = $this->id_propietario");
			$this->propietario = $propietario;

      $madre = new proceso();
      $madre->load("id = $this->id_madre");
      $this->madre = $madre;			
			return true;
		}
		else
		{
			return false;
		}
	}

	public function Find_joined($condition)
	{
    $condition = "id_entidad = 5";
		if ($procesos = $this->Find($condition))
		{	
			foreach ($procesos as& $proceso)
			{
				$propietario = new usuario();
				$propietario->load("id = $proceso->id_propietario");
				$proceso->propietario = $propietario;
				
				//pasar nombre del proceso madre
				$madre = new proceso();
				$madre->load("id = $proceso->id_madre");
				$proceso->madre = $madre;			
			}
			return $procesos;
		}
		else
		{
			return false;
		}
	}

  public function borrar($id_proceso)
  {
      // Carga el proceso
      if ($this->load("id= $id_proceso"))
      {   
          // Comprueba que no tenga indicadores asociados
          $indicador = new indicador();
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
