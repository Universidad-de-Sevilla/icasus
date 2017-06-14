<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Normativa.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Mapea la tabla normativas de la base de datos
//---------------------------------------------------------------------------------------------------

class Normativa extends ADOdb_Active_Record
{

    public $_table = 'normativas';
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
        $normativas = $this->Find($criterio);
        if ($normativas)
        {
            foreach ($normativas as $normativa)
            {
                $carta = new Carta();
                $carta->load("id= $normativa->id_carta");
                $normativa->carta = $carta;
            }
        }
        return $normativas;
    }

}
