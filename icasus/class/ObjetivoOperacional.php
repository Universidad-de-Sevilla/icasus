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
    public $responsable;

    public function load_joined($condicion)
    {
        if ($this->load($condicion))
        {
            $this->objest = new ObjetivoEstrategico();
            $this->objest->load_joined("id = $this->id_objest");
            $this->responsable = new Usuario();
            $this->responsable->load("id=$this->id_responsable");
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
                $objest->load_joined("id= $obj->id_objest");
                $obj->objest = $objest;
                $responsable = new Usuario();
                $responsable->load("id=$obj->id_responsable");
                $obj->responsable = $responsable;
            }
        }
        return $objetivos_op;
    }

}
