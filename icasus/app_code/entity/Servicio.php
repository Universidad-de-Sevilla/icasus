<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Servicio.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Mapea la tabla servicios de la base de datos
//---------------------------------------------------------------------------------------------------

class Servicio extends ADOdb_Active_Record
{

    public $_table = 'servicios';
    public $carta;

    public function load_joined($condicion)
    {
        if ($this->load($condicion))
        {
            $this->carta = new Carta();
            $this->carta->load_joined("id=$this->id_carta");
            return true;
        }
        else
        {
            return false;
        }
    }

    public function Find_joined($criterio)
    {
        $servicios = $this->Find($criterio);
        if ($servicios)
        {
            foreach ($servicios as $serv)
            {
                $carta = new Carta();
                $carta->load_joined("id= $serv->id_carta");
                $serv->carta = $carta;
            }
        }
        return $servicios;
    }

}
