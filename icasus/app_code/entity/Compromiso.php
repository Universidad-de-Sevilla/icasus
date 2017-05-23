<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Compromiso.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Mapea la tabla compromisos de la base de datos
//---------------------------------------------------------------------------------------------------

class Compromiso extends ADOdb_Active_Record
{

    public $_table = 'compromisos';
    public $servicio;

    public function load_joined($condicion)
    {
        if ($this->load($condicion))
        {
            $this->servicio = new Servicio();
            $this->servicio->load_joined("id=$this->id_servicio");
            return true;
        }
        else
        {
            return false;
        }
    }

    public function Find_joined($criterio)
    {
        $compromisos = $this->Find($criterio);
        if ($compromisos)
        {
            foreach ($compromisos as $comp)
            {
                $servicio = new Servicio();
                $servicio->load("id= $comp->id_servicio");
                $comp->servicio = $servicio;
            }
        }
        return $compromisos;
    }

}
