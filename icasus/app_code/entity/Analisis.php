<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Analisis.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Mapea la tabla analisis de la base de datos
//---------------------------------------------------------------------------------------------------

class Analisis extends ADOdb_Active_Record
{
    public $_table = 'icasus_analisis';
    public $indicador;
    public $id;
    public $id_indicador;
    public $anyo;
    public $analisis;
    public $plan_accion;

    public function load_joined($condicion)
    {
        if ($this->load($condicion)) {
            $this->indicador = new Indicador();
            $this->indicador->load("id = $this->id_indicador");
            return true;
        } else {
            return false;
        }
    }

    public function Find_joined($criterio)
    {
        $analisis = $this->Find($criterio);
        if ($analisis) {
            foreach ($analisis as $ana) {
                $indicador = new Indicador();
                $indicador->load("id= $ana->id_indicador");
                $ana->indicador = $indicador;
            }
        }
        return $analisis;
    }
}
