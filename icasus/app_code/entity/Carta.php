<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Carta.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Mapea la tabla cartas de la base de datos
//---------------------------------------------------------------------------------------------------

class Carta extends ADOdb_Active_Record
{

    public $_table = 'cartas';
    public $entidad;
    public $cuadro;

    public function load_joined($condicion)
    {
        if ($this->load($condicion))
        {
            $this->entidad = new Entidad();
            $this->entidad->load("id = $this->id_entidad");

            if ($this->id_cuadro)
            {
                $cuadro = new Cuadro();
                $cuadro->load("id = $this->id_cuadro");
                $this->cuadro = $cuadro;
            }
            return true;
        }
        else
        {
            return false;
        }
    }

    public function Find_joined($criterio)
    {
        $cartas = $this->Find($criterio);
        if ($cartas)
        {
            foreach ($cartas as $carta)
            {
                $entidad = new Entidad();
                $entidad->load("id= $carta->id_entidad");
                $carta->entidad = $entidad;
            }
        }
        return $cartas;
    }

}
