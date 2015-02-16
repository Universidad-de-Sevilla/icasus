<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/valor_referencia_medicion.php
//-------------------------------------------------------------------------------
// Descripcion: Gestiona los valores de referencia en relacion con las mediciones
//-------------------------------------------------------------------------------

class Valor_referencia_medicion extends ADOdb_Active_Record
{

    public $_table = 'valores_referencia_mediciones';
    public $medicion;
    public $valor_referencia;

    public function Find_joined($condicion)
    {
        if ($valores_referencia_mediciones = $this->Find($condicion))
        {
            foreach ($valores_referencia_mediciones as & $valor_referencia_medicion)
            {
                $valor_referencia_medicion->valor_referencia = new Valor_referencia();
                $valor_referencia_medicion->valor_referencia->load("id = $valor_referencia_medicion->id_valor_referencia");
            }
            return $valores_referencia_mediciones;
        }
        else
        {
            return false;
        }
    }

}
