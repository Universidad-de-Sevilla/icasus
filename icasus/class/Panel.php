<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/Panel.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Gestiona los paneles de un cuadro de mando
//---------------------------------------------------------------------------------------------------

class Panel extends ADOdb_Active_Record
{

    public $_table = 'paneles';
    public $indicadores;
    public $tipo;

    // Devuelve un array de paneles con los panel_tipo y panel_indicador asociados a cada uno
    // Recibe una condición en formato WhereOrderBy
    public function Find_joined($condicion)
    {
        $paneles = $this->Find($condicion);
        if ($paneles)
        {
            foreach ($paneles as & $panel)
            {
                $panel_indicador = new Panel_indicador();
                $panel->indicadores = $panel_indicador->Find("id_panel = $panel->id");
                $panel->tipo = new Panel_tipo();
                $panel->tipo->load("id = $panel->id_paneltipo");
            }
            return $paneles;
        }
        else
        {
            return false;
        }
    }

    public function permiso_panel($id_usuario, $id_panel)
    {
        $db = $this->db();
        $sql = "SELECT * FROM cuadros c LEFT JOIN paneles p 
						ON p.id_cuadro = c.id 
						WHERE c.id_usuario = $id_usuario  AND p.id= $id_panel";

        $l = $db->execute($sql);
        if ($l->_numOfRows == 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public function borrar_panel($condicion)
    {
        $this->load($condicion);
        if ($this->delete())
        {
            $indicadores = new Panel_indicador();
            $indicadores->borrar_indicadores("id_panel = $this->id ");
        }
        else
        {
            //escribir error en log
        }
    }

}
