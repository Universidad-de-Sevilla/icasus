<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/projects/icasus/)
// Archivo: clase/hilo.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona el foro 
//---------------------------------------------------------------------------------------------------

class hilo extends ADOdb_Active_Record
{
	var $_table = 'hilos';
	var $usuario;
    function load_joined($condition)
        {
                if ($this->load($condition))
                {
                        $usuario = new ado_usuario();
                        $usuario->load_joined("id_usuario = $this->id_usuario");
                        $this->usuario = $usuario;
                        
                        return true; 
                }
                else
                {
                        return false;
                }
        }

	function Find_joined($condition)
        {
                if ($hilos = $this->Find($condition))
                {
                        foreach ($hilos as $hilo)
                        {
                                //le anade el login del usuario
        				$usuario_id = new ado_usuario();
                        $usuario_id->load("id_usuario = $hilo->id_usuario");
		        		$hilo->login = $usuario_id->login;
				
                        }
                        return $hilos;
                }
                else
                {
                        return false;
                }
        }
}
?>
