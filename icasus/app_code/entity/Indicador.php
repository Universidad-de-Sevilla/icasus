<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: entity/Indicador.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Gestiona los indicadores y los indicadores-dato
//------------------------------------------------------------------------------

class Indicador extends ADOdb_Active_Record
{
    public $_table = 'icasus_indicador';
    public $entidad;
    public $proceso;
    public $responsable;
    public $responsable_medicion;
    public $valores;
    public $valores_referencia;
    public $visibilidad;
    public $criterios_efqm;
    public $valores_pendientes;
    public $medicion;
    public $tipo_agregacion;
    public $tipo_agregacion_temporal;

    // Campos de la tabla
    public $id;
    public $id_entidad;
    public $id_proceso;
    public $id_responsable;
    public $id_responsable_medicion;
    public $id_visibilidad;
    public $id_tipo_agregacion_temporal;
    public $codigo;
    public $nombre;
    public $descripcion;
    public $formulacion;
    public $calculo;
    public $periodicidad;
    public $fuente_informacion;
    public $id_tipo_agregacion;
    public $fuente_datos;
    public $desagregado;
    public $evidencia;
    public $historicos;
    public $unidad_generadora;
    public $interpretacion;
    public $fecha_creacion;
    public $version;
    public $observaciones;
    public $valor_min;
    public $valor_max;
    public $inverso;
    public $archivado;
    public $control;


    public function find_medicion_joined($criterio)
    {
        $indicadores = $this->find($criterio);
        if ($indicadores) {
            foreach ($indicadores as $indicador) {
                $medicion = new Medicion();
                $mediciones = $medicion->find("id_indicador = $indicador->id");
                $indicador->medicion = $mediciones;
            }
        }
        return $indicadores;
    }

    public function load_joined($criterio)
    {
        if ($this->load($criterio)) {
            $proceso = new Proceso();
            $proceso->load_joined("id = $this->id_proceso");
            $this->proceso = $proceso;

            $responsable_medicion = new Usuario();
            $responsable_medicion->load("id = $this->id_responsable_medicion");
            $this->responsable_medicion = $responsable_medicion;

            $responsable = new Usuario();
            $responsable->load("id = $this->id_responsable");
            $this->responsable = $responsable;

            $visibilidad = new Visibilidad();
            $visibilidad->load("id = $this->id_visibilidad");
            $this->visibilidad = $visibilidad;

            $criterio = new Criterio_efqm_indicador();
            $criterios = $criterio->Find_joined("id_indicador = $this->id");
            $this->criterios_efqm = $criterios;

            $valor_referencia = new Valor_referencia();
            $valores_referencia = $valor_referencia->Find("id_indicador = $this->id");
            $this->valores_referencia = $valores_referencia;

            $tipo_agregacion = new Tipo_agregacion();
            $tipo_agregacion->load("id = $this->id_tipo_agregacion");
            $this->tipo_agregacion = $tipo_agregacion;

            $tipo_agregacion_temporal = new Tipo_agregacion();
            $tipo_agregacion_temporal->load("id = $this->id_tipo_agregacion_temporal");
            $this->tipo_agregacion_temporal = $tipo_agregacion_temporal;

            return true;
        } else {
            return false;
        }
    }

    public function Find_joined($criterio)
    {
        $indicadores = $this->Find($criterio);
        if ($indicadores) {
            foreach ($indicadores as $indicador) {
                $entidad = new Entidad();
                $entidad->load("id= $indicador->id_entidad");
                $indicador->entidad = $entidad;

                $proceso = new Proceso();
                $proceso->load("id = $indicador->id_proceso");
                $indicador->proceso = $proceso;

                $responsable = new Usuario();
                $responsable->load("id = $indicador->id_responsable");
                $indicador->responsable = $responsable;

                $responsable_medicion = new Usuario();
                $responsable_medicion->load("id = $indicador->id_responsable_medicion");
                $indicador->responsable_medicion = $responsable_medicion;

                $visibilidad = new Visibilidad();
                $visibilidad->load("id = $indicador->id_visibilidad");
                $indicador->visibilidad = $visibilidad;

                $tipo_agregacion = new Tipo_agregacion();
                $tipo_agregacion->load("id = $this->id_tipo_agregacion");
                $indicador->tipo_agregacion = $tipo_agregacion;

                $tipo_agregacion_temporal = new Tipo_agregacion();
                $tipo_agregacion_temporal->load("id = $this->id_tipo_agregacion_temporal");
                $indicador->tipo_agregacion_temporal = $tipo_agregacion_temporal;
            }
        }
        return $indicadores;
    }

    public function Find_joined_ultima_medicion($criterio)
    {
        $indicadores = $this->Find($criterio);
        if ($indicadores) {
            foreach ($indicadores as $indicador) {
                $entidad = new Entidad();
                $entidad->load("id= $indicador->id_entidad");
                $indicador->entidad = $entidad;

                $proceso = new Proceso();
                $proceso->load("id = $indicador->id_proceso");
                $indicador->proceso = $proceso;

                $responsable = new Usuario();
                $responsable->load("id = $indicador->id_responsable");
                $indicador->responsable = $responsable;

                $responsable_medicion = new Usuario();
                $responsable_medicion->load("id = $indicador->id_responsable_medicion");
                $indicador->responsable_medicion = $responsable_medicion;

                $visibilidad = new Visibilidad();
                $visibilidad->load("id = $indicador->id_visibilidad");
                $indicador->visibilidad = $visibilidad;

                $query = "SELECT m.id FROM icasus_medicion m JOIN icasus_valor v ON m.id = v.id_medicion "
                    . "WHERE m.id_indicador=$indicador->id AND v.valor is NOT NULL ORDER BY m.periodo_inicio DESC LIMIT 1";
                $adodb = $this->DB();
                $array_result = $adodb->getall($query);

                $medicion = new Medicion();
                if ($array_result) {
                    $id_medicion = $array_result[0][0];
                    $medicion->Load("id= $id_medicion");
                }
                $indicador->medicion = $medicion;
            }
        }
        return $indicadores;
    }

    public function Find_con_pendientes($condicion, $usuario_id)
    {
        $indicadores = $this->Find($condicion);
        if ($indicadores) {
            $query = "SELECT count(*) FROM icasus_indicador_subunidad insu
            INNER JOIN icasus_medicion me ON insu.id_indicador = me.id_indicador
            INNER JOIN icasus_valor va ON me.id = va.id_medicion
            WHERE insu.id_entidad = va.id_entidad
            AND insu.id_usuario  = {$usuario_id}
            AND va.valor_parcial is NULL
            AND insu.id_indicador = ";

            $adodb = $this->DB();

            foreach ($indicadores as $indicador) {
                $resultset = $adodb->Execute($query . $indicador->id);
                $indicador->valores_pendientes = $resultset->fields[0];
            }
        }
        return $indicadores;
    }

    // Obtiene los valores introducidos en este indicador con la fecha de recogida como campo clave
    public function obtener_valores()
    {
        $datos = array();
        $db = $this->DB();
        $query = "SELECT * FROM icasus_valor WHERE id_indicador = $this->id_indicador ORDER BY fecha_recogida";
        $resultado = $db->Execute($query);
        while (!$resultado->EOF) {
            $datos[$resultado->fields['fecha_recogida']] = $resultado->fields;
            $resultado->MoveNext();
        }
        if (sizeof($datos) > 0) {
            $this->valores = $datos;
            return true;
        } else {
            return false;
        }
    }

    public function indicador_publico()
    {
        if ($indicadores = $this->find("id_visibilidad = 2")) {
            foreach ($indicadores as $indicador) {
                $entidad = new Entidad();
                $entidad->load("id_entidad = $indicador->id_entidad");
                $indicador->entidad = $entidad->nombre;
            }
            return $indicadores;
        } else {
            return false;
        }
    }

    // Devuelve los indicadores con su valores
    public function find_valor($condicion)
    {
        $indicadores = $this->find($condicion);
        if ($indicadores) {
            foreach ($indicadores as $indicador) {
                $valor = new Valor();
                $valors = $valor->find("id_indicador = " . $indicador->id_indicador . " ORDER BY fecha_recogida DESC");
                $indicador->valores = $valors;
            }
        }
        //print_r($indicadores);
        return $indicadores;
    }

    // Permiso del usuario para asignar una subunidad a un indicador desde medicion_crear_ajax.php
    public function permiso_crear_medicion($id_usuario, $id_indicador, $control)
    {
        if ($control OR $this->load("id = $id_indicador AND (id_responsable = $id_usuario OR id_responsable_medicion = $id_usuario)")) {
            return true;
        } else {
            return false;
        }
    }


    public function find_sin_mediciones($id_entidad, $fecha, $cadena)
    {
        $sql = "SELECT i.id as id_indicador,i.id_entidad, i.nombre as indicador, i.control,"
            . "p.nombre as proceso, p.id as id_proceso "
            . "FROM icasus_indicador i "
            . "LEFT JOIN icasus_proceso p ON i.id_proceso = p.id "
            . "WHERE i.id NOT IN (SELECT id_indicador FROM icasus_medicion m "
            . "WHERE DATE_FORMAT( m.periodo_inicio, '%Y' ) = $fecha OR DATE_FORMAT( m.periodo_fin, '%Y' ) = $fecha) "
            . "AND i.id_entidad = {$id_entidad} "
            . "AND i.archivado is NULL $cadena";
        $db = $this->DB();
        return $db->getall($sql);
    }
}
