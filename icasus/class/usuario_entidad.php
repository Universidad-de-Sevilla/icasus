<?php
/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4 */

/**----------------------------------------------------------------------------
 * File: usuario_entidad.php
 * Description: gestiona las entidades de un usuario y los usuarios de una entidad
 * ----------------------------------------------------------------------------
 * @author Juanan Ruiz <juanan@juananruiz.com>, Jesus Martin <jjmc@us.es>
 * @license http://www.opensource.org/licenses/bsd-license.php 
 ** ---------------------------------------------------------------------------- */ 

class usuario_entidad extends ADOdb_Active_Record { 
	var $_table='usuarios_entidades'; 
	var $asiste;	
	var $nombre_usuario;	
	var $apellidos_usuario;	

	function Find_entidades($condicion) 
	{ 
		if ($usuarios_entidades = $this->Find($condicion)) 
		{ 
			foreach ($usuarios_entidades as& $usuario_entidad) 
			{ 
				$entidad = new entidad(); 
				$id = $usuario_entidad->id_entidad; 
				$entidad->load("id = $id"); 
			}
      return $usuarios_entidades;
       
    }
    else
    {
      return false;
    }
  }
    
	//funcion antigua para generar los asistentes

	function join_usuarios_asiste($entidad,$acta)
	{
		if ($usuarios = $this->find($entidad))
		{
			foreach ($usuarios as $usuario)
			{
				$condicion = "id_usuario=".$usuario->id_usuario." AND ".$acta;
				$asistente = new asistente();
				$asistente->load($condicion);
				$usuario->asiste = $asistente->asistencia;
			
				$miembro = new ado_usuario();
				$miembro->load('id_usuario='.$usuario->id_usuario);
				$usuario->nombre_usuario = $miembro->nombre;
				$usuario->apellidos_usuario = $miembro->apellidos;

			}
		return $usuarios;
		}
	}
	//funcion para comprobr los permisos de las actas
	function acta_permisos($id_usuario,$id_entidad,$id_rol)
	{
		$permiso = $this->load('id_usuario ='.$id_usuario.' AND id_entidad = '.$id_entidad.' AND id_rol = '.$id_rol);
		return $permiso;
	}
}
?>
