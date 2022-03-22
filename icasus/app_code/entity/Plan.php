<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Plan.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es), Ramón M. Gómez (ramongomez@us.es)
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
     * Obtener planes estratégicos de una entidad.
     * @param string $criterio
     * @return array|null
     */
    public function Find_joined(string $criterio): ?array
    {
        $planes = $this->Find($criterio);
        if ($planes)
        {
            foreach ($planes as $plan)
            {
                $entidad = new Entidad();
                $entidad->load("id = '$plan->id_entidad'");
                $plan->entidad = $entidad;
            }
        } else {
            $planes = null;
        }
        return $planes;
    }

    /**
     * Obtiene los id. de los indicadores de control del plan estratégico.
     * @param int $id_plan
     * @return array
     */
    public function find_indicadores_control_plan(int $id_plan): array
    {
        $sql = <<<EOT
SELECT DISTINCT ii.id
FROM icasus_indicador ii
    JOIN icasus_objetivo_indicador ioi on ii.id = ioi.id_indicador
    JOIN icasus_objetivo_operacional ioo on ioi.id_objop = ioo.id
    JOIN icasus_objetivo_estrategico ioe on ioo.id_objest = ioe.id
    JOIN icasus_linea il on ioe.id_linea = il.id
    JOIN icasus_plan ip on il.id_plan = ip.id
WHERE ip.id = '$id_plan' AND ioi.control = 1;
EOT;
        $db = $this->DB();
        return $db->getAll($sql);
    }
}
