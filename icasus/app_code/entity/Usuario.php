<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: entity/Usuario.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
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

}
