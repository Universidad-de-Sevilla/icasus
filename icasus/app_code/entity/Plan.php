<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Plan.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
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
    public $archivado;

    /**
     * @return string
     */
    public function __toString(): string
    {
        return $this->anyo_inicio . " - " . ($this->anyo_inicio + $this->duracion - 1);
    }

    /**
     * @param string $condicion
     * @return bool
     */
    public function load_joined(string $condicion): bool
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

    /**
     * @param string $criterio
     * @return bool
     */
    public function Find_joined(string $criterio): bool
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
