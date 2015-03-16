<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/Indicador_cuadro.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona los indicadores incluidos en un cuadro de mando
//---------------------------------------------------------------------------------------------------

class Indicador_cuadro extends ADOdb_Active_Record
{

    public $_table = 'indicadores_cuadros';
    public $indicador;

    public function find_joined($id_cuadromando)
    {
        $is = $this->find("id_cuadromando = $id_cuadromando");
        foreach ($is as $item)
        {
            $i = new Indicador();
            $i->load("id = $item->id_indicador");
            $is->indicador = $i;
        }
        return $is;
    }

}
