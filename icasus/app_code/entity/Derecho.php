<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Derecho.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Mapea la tabla derechos de la base de datos
//---------------------------------------------------------------------------------------------------

class Derecho extends ADOdb_Active_Record
{

    public $_table = 'derechos';
    public $carta;

    public function load_joined($condicion)
    {
        if ($this->load($condicion))
        {
            $this->carta = new Carta();
            $this->carta->load("id = $this->id_carta");
            return true;
        }
        else
        {
            return false;
        }
    }

    public function Find_joined($criterio)
    {
        $derechos = $this->Find($criterio);
        if ($derechos)
        {
            foreach ($derechos as $derecho)
            {
                $carta = new Carta();
                $carta->load("id= $derecho->id_carta");
                $derecho->carta = $carta;
            }
        }
        return $derechos;
    }

}
