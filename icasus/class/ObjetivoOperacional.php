<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/ObjetivoOperacional.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Mapea la tabla objetivos_operacionales de la base de datos
//---------------------------------------------------------------------------------------------------

class ObjetivoOperacional extends ADOdb_Active_Record
{

    public $_table = 'objetivos_operacionales';
    public $objest;

    public function load_joined($condicion)
    {
        if ($this->load($condicion))
        {
            $this->objest = new ObjetivoEstrategico();
            $this->objest->load("id = $this->id_objest");
            return true;
        }
        else
        {
            return false;
        }
    }

    public function Find_joined($criterio)
    {
        $objetivos_op = $this->Find($criterio);
        if ($objetivos_op)
        {
            foreach ($objetivos_op as $obj)
            {
                $objest = new ObjetivoEstrategico();
                $objest->load("id= $obj->id_objest");
                $obj->objest = $objest;
            }
        }
        return $objetivos_op;
    }

}
