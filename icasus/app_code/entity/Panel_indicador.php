<?php

class Panel_indicador extends ADOdb_Active_Record
{
    public $_table = 'icasus_panel_indicador';
    public $indicador;
    public $id;
    public $id_panel;
    public $id_indicador;
    public $id_entidad;
    public $mostrar_referencias;

    // Devuelve un array de paneles con los panel_indicador asociados a cada uno
    public function load_joined($condicion)
    {
        if ($this->load($condicion)) {
            $this->indicador = new Indicador();
            $this->indicador->load("id = $this->id_indicador");

            return true;
        }

        return false;
    }

    public function borrar_indicadores($condicion)
    {
        /** @var ADOConnection $db */
        $db = $this->DB();
        $sql = /** @lang mysql */ "DELETE FROM icasus_panel_indicador WHERE $condicion";
        $db->execute($sql);
    }

}
