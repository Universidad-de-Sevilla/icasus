<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/Fichero.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los ficheros asociados a un objeto (unidad, proceso, indicador)
//---------------------------------------------------------------------------------------------------

class Fichero extends ADOdb_Active_Record
{

    public $_table = 'ficheros';
    public $usuario;

    public function find_joined($condicion)
    {
        $ficheros = $this->find($condicion);
        if ($ficheros)
        {
            foreach ($ficheros as $fichero)
            {
                $usuario = new Usuario();
                $usuario->load("id = $fichero->id_usuario");
                $fichero->usuario = $usuario;
            }
        }
        return $ficheros;
    }

}
