<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: clase/fichero.php
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
        foreach ($ficheros as $fichero)
        {
            $usuario = new Usuario();
            $usuario->load("id = $fichero->id_usuario");
            $fichero->usuario = $usuario;
        }
        return $ficheros;
    }

}
