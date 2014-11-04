<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: class/usuario.php
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona los usuarios 
//---------------------------------------------------------------------------------------------------
class Usuario extends ADOdb_Active_Record
{

    //Propiedades de la clase
    public $_table = 'usuarios';
    public $entidades = array();
    public $grupos = array();

    public function load_joined($condicion)
    {
        if ($this->load($condicion))
        {
            $usuario_entidad = new Usuario_entidad();
            $this->entidades = $usuario_entidad->Find_entidades("id_usuario = $this->id");
            return true;
        }
        else
        {
            return false;
        }
    }

    //TODO: eliminar tras comprobar que no se usa
    //Devuelve las entidades a las que pertenece el usuario con sus respectivas subentidades
    public function entidades()
    {
        $entidades = $usuario_entidad->Find_entidades("id_usuario = $this->id");
    }

    public function Find_sql($where)
    {
        $db = $this->DB();
        $sql = "SELECT * FROM usuarios WHERE $where";

        $rs = $db->getall($sql);
        return $rs;
    }

}
