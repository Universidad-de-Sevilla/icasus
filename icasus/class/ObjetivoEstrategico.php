<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/ObjetivoEstrategico.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Mapea la tabla objetivos_estrategicos de la base de datos
//---------------------------------------------------------------------------------------------------

class ObjetivoEstrategico extends ADOdb_Active_Record
{

    public $_table = 'objetivos_estrategicos';
    public $linea;

    public function load_joined($condicion)
    {
        if ($this->load($condicion))
        {
            $this->linea = new Linea();
            $this->linea->load_joined("id = $this->id_linea");
            return true;
        }
        else
        {
            return false;
        }
    }

    public function Find_joined($criterio)
    {
        $objetivos_est = $this->Find($criterio);
        if ($objetivos_est)
        {
            foreach ($objetivos_est as $obj)
            {
                $linea = new Linea();
                $linea->load_joined("id= $obj->id_linea");
                $obj->linea = $linea;
            }
        }
        return $objetivos_est;
    }

}
