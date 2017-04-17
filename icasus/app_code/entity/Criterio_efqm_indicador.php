<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Criterio_efqm_indicador.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Gestiona los indicadores
//---------------------------------------------------------------------------------------------------

class Criterio_efqm_indicador extends ADOdb_Active_Record
{

    public $_table = 'criterios_efqm_indicadores';
    public $criterio_efqm;

    public function Find_joined($criterio)
    {
        $criterios_efqm_indicadores = $this->Find($criterio);
        if ($criterios_efqm_indicadores)
        {
            foreach ($criterios_efqm_indicadores as $criterio_efqm_indicador)
            {
                $criterio_efqm = new Criterio_efqm();
                $criterio_efqm->load("id = $criterio_efqm_indicador->id_criterio_efqm");
                $criterio_efqm_indicador->criterio_efqm = $criterio_efqm;
            }
        }
        return $criterios_efqm_indicadores;
    }

}
