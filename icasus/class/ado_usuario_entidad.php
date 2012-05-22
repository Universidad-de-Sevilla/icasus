<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: class/ado_usuario.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona los usuarios (usa active record)
//---------------------------------------------------------------------------------------------------
class ado_usuario_entidad extends ADOdb_Active_Record { 
	var $_table='usuario_entidad'; 
        var $lista_indicadores;
	var $nombre;

	//carga los indicadores de las entidades a las que pertenece el usuario 
	//para crear un cuadro de mando
        function carga_entidades_indicadores($id_usuario)
	{
		if ($entidades = $this->Find($id_usuario))
		{
			foreach($entidades as $entidad) 
			{
				$indicador = new ado_indicador();
				$indicadores = $indicador->Find('id_entidad = '.$entidad->id_entidad);
				$entidad->lista_indicadores = $indicadores;

				$nombre_entidad = new ado_entidad();
				$nombre_entidad->Load('id_entidad = '.$entidad->id_entidad);
				$entidad->nombre = $nombre_entidad->nombre;

			}	
			return $entidades;
		}
		else
		{
			return false;
		}
	}
	
	//carga los indicadores de las entidades a las que pertenece el usuario 
	//que estan en un cuadro de mando del usuario
        function carga_entidades_indicadores_in_cuadromando($condicion,$id_cuadro)
	{
		if ($entidades = $this->Find($condicion))
                {
                        foreach($entidades as $entidad)
                        {
                                $indicador = new ado_indicador();
                                $indicadores = $indicador->Find("id_entidad = $entidad->id_entidad AND id_indicador IN (SELECT id_indicador 
                        	FROM indicadores_cuadros WHERE id_cuadromando = $id_cuadro)");
                                $entidad->lista_indicadores = $indicadores;
                                
				$nombre_entidad = new ado_entidad();
                                $nombre_entidad->Load('id_entidad = '.$entidad->id_entidad);
                                $entidad->nombre = $nombre_entidad->nombre;

                        }
                        return $entidades;
                }
                else
                {
                        return false;
                }
	
	}
	//carga los indicadores de las entidades a las que pertenece el usuario 
	//que estan en un cuadro de mando del usuario
        function carga_entidades_indicadores_out_cuadromando($condicion,$id_cuadro)
	{
		if ($entidades = $this->Find($condicion))
                {
                        foreach($entidades as $entidad)
                        {
                                $indicador = new ado_indicador();
                                //$indicadores = $indicador->Find('id_entidad = '.$entidad->id_entidad);
                                $indicadores = $indicador->Find("id_entidad = $entidad->id_entidad AND id_indicador NOT IN (SELECT id_indicador 
                                FROM indicadores_cuadros WHERE id_cuadromando = $id_cuadro)");
                                $entidad->lista_indicadores = $indicadores;

                                $nombre_entidad = new ado_entidad();
                                $nombre_entidad->Load('id_entidad = '.$entidad->id_entidad);
                                $entidad->nombre = $nombre_entidad->nombre;

                        }
                        return $entidades;
                }
                else
                {
                        return false;
                }
	
	}
}
?>
