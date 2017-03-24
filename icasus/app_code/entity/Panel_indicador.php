<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Panel_indicador.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Gestiona los paneles de un cuadro de mando
//---------------------------------------------------------------------------------------------------

class Panel_indicador extends ADOdb_Active_Record
{

    public $_table = 'panel_indicadores';
    public $indicador;

    // Devuelve un array de paneles con los panel_indicador asociados a cada uno
    public function load_joined($condicion)
    {
        if ($this->load($condicion))
        {
            $this->indicador = new Indicador();
            $this->indicador->load("id = $this->id_indicador");
        }
        else
        {
            return false;
        }
    }

    public function borrar_indicadores($condicion)
    {
        $db = $this->DB();
        $sql = "DELETE FROM panel_indicadores WHERE $condicion";
        $db->execute($sql);
    }

}
