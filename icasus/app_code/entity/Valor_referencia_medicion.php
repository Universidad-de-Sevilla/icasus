<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Valor_referencia_medicion.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//-------------------------------------------------------------------------------
// Descripcion: Gestiona los valores de referencia en relacion con las mediciones
//-------------------------------------------------------------------------------

class Valor_referencia_medicion extends ADOdb_Active_Record
{

    public $_table = 'valores_referencia_mediciones';
    public $medicion;
    public $valor_referencia;

    public function load_joined($condicion)
    {
        if ($this->load($condicion))
        {
            $this->valor_referencia = new Valor_referencia();
            $this->valor_referencia->load("id = $this->id_valor_referencia");
            return true;
        }
        else
        {
            return false;
        }
    }

    public function Find_joined($condicion)
    {
        $valores_referencia_mediciones = $this->Find($condicion);
        if ($valores_referencia_mediciones)
        {
            foreach ($valores_referencia_mediciones as & $valor_referencia_medicion)
            {
                $valor_referencia_medicion->valor_referencia = new Valor_referencia();
                $valor_referencia_medicion->valor_referencia->load("id = $valor_referencia_medicion->id_valor_referencia");
            }
        }
        return $valores_referencia_mediciones;
    }

}
