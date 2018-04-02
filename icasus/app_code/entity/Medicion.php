<?php

//----------------------------------------------------------------------------------
// Proyecto: Icasus
// Fichero: entity/Medicion.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
// Descripcion: gestiona las mediciones de un indicador
//----------------------------------------------------------------------------------

class Medicion extends ADOdb_Active_Record
{
    public $_table = 'icasus_medicion';
    public $medicion_valor;
    public $indicador;
    public $id;
    public $id_indicador;
    public $etiqueta;
    public $periodo_inicio;
    public $periodo_fin;
    public $grabacion_inicio;
    public $grabacion_fin;
    public $observaciones;


    public function load_joined($condicion)
    {
        if ($this->load($condicion)) {
            $this->indicador = new Indicador();
            $this->indicador->load_joined("id = $this->id_indicador");
            return true;
        } else {
            return false;
        }
    }

    public function find_joined_subunidad_valor($id_indicador, $id_entidad)
    {
        $mediciones = $this->find("id_indicador = $id_indicador");
        if ($mediciones) {
            foreach ($mediciones as $medicion) {
                $sql = "SELECT  m.etiqueta,m.id,v.id_medicion,m.id,v.id_entidad,v.valor
					FROM icasus_medicion m
					LEFT JOIN icasus_valor v ON m.id = v.id_medicion
					WHERE m.id = $medicion->id
					AND v.id_entidad =$id_entidad";
                $db = $this->DB();
                $medicion_valor = $db->execute($sql);
                if ($medicion_valor->_numOfRows == 0) {
                    $valor = $medicion_valor->_numOfRows;
                } else {
                    if ($medicion_valor->fields["valor"] == '') {
                        $valor = 'NULL';
                    } else {
                        $valor = $medicion_valor->fields["valor"];
                    }
                    $valor = $medicion_valor;
                }
                $medicion->medicion_valor = $valor;
            }
        }
        return $mediciones;
    }

    //obtener array de los años selecionados por el usuario para mostrar los valores
    public function mediciones_periodos($id_indicador, $inicio, $fin)
    {
        $periodo = $this->find("id_indicador = $id_indicador AND date_format(periodo_inicio,'%Y') between '$inicio' AND '$fin' ORDER BY periodo_inicio DESC");
        return $periodo;
    }

    //obtener registros únicos de fechas de medición para el selector de periodos en	
    public function find_year_mediciones($id_indicador)
    {
        $years_mediciones = $this->find("id_indicador = $id_indicador  GROUP BY date_format(periodo_inicio,'%Y') ORDER BY periodo_inicio");
        return $years_mediciones;
    }

    public function find_joined_indicador($condicion)
    {
        $mediciones = $this->Find($condicion);
        if ($mediciones) {
            foreach ($mediciones as $medicion) {
                $medicion->indicador = new Indicador();
                $medicion->indicador->load("id = $medicion->id_indicador");
            }
        }
        return $mediciones;
    }
}