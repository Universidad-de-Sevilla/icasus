<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/Cuadro.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Gestiona los cuadros de mando de un usuario
//---------------------------------------------------------------------------------------------------

class Cuadro extends ADOdb_Active_Record
{

    public $_table = 'cuadros';
    public $entidad;

    public function load_joined($condicion)
    {
        if ($this->load($condicion))
        {
            $this->entidad = new Entidad();
            $this->entidad->load("id = $this->id_entidad");
            return true;
        }
        else
        {
            return false;
        }
    }

    public function Find_joined($criterio)
    {
        $cuadros = $this->Find($criterio);
        if ($cuadros)
        {
            foreach ($cuadros as $cuadro)
            {
                $entidad = new Entidad();
                $entidad->load("id= $cuadro->id_entidad");
                $cuadro->entidad = $entidad;
            }
        }
        return $cuadros;
    }

}
