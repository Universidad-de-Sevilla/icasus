<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/Linea.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Mapea la tabla lineas de la base de datos
//---------------------------------------------------------------------------------------------------

class Linea extends ADOdb_Active_Record
{

    public $_table = 'lineas';
    public $plan;

    public function load_joined($condicion)
    {
        if ($this->load($condicion))
        {
            $this->plan = new Plan();
            $this->plan->load("id = $this->id_plan");
            return true;
        }
        else
        {
            return false;
        }
    }

    public function Find_joined($criterio)
    {
        $lineas = $this->Find($criterio);
        if ($lineas)
        {
            foreach ($lineas as $linea)
            {
                $plan = new Plan();
                $plan->load("id= $linea->id_plan");
                $linea->plan = $plan;
            }
        }
        return $lineas;
    }

}
