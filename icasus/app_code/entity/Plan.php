<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Plan.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Mapea la tabla planes de la base de datos
//---------------------------------------------------------------------------------------------------

class Plan extends ADOdb_Active_Record
{
    public $_table = 'icasus_plan';
    public $entidad;
    public $id;
    public $id_entidad;
    public $anyo_inicio;
    public $duracion;
    public $mision;
    public $vision;
    public $valores;
    public $fce;
    public $titulo;
    public $ejecucion;

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
        $planes = $this->Find($criterio);
        if ($planes)
        {
            foreach ($planes as $plan)
            {
                $entidad = new Entidad();
                $entidad->load("id= $plan->id_entidad");
                $plan->entidad = $entidad;
            }
        }
        return $planes;
    }
}
