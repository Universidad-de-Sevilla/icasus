<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/Cuadro.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Gestiona los cuadros de mando de un usuario
//---------------------------------------------------------------------------------------------------

class Cuadro extends ADOdb_Active_Record
{

    public $_table = 'cuadros';
    public $indicadores_cuadros;

    //No se si está función será útil
    public function find_joined($id_usuario)
    {
        $cuadros = $this->find("id_usuario = $id_usuario");
        if ($cuadros)
        {
            foreach ($cuadros as & $cuadro)
            {
                $indicador_cuadro = new Indicador_cuadro();
                $indicadores_cuadros = $indicador_cuadro->find_joined("id_cuadro = $cuadro->id");
                $cuadro->indicadores_cuadros = $indicadores_cuadros;
            }
            return $cuadros;
        }
        else
        {
            return false;
        }
    }

}
