<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: class/Indicador.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Gestiona los indicadores y los indicadores-dato
//------------------------------------------------------------------------------

class Indicador extends ADOdb_Active_Record
{

    public $_table = 'indicadores';
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

    public function find_medicion_joined($criterio)
    {
        $indicadores = $this->find($criterio);
        if ($indicadores)
        {
            foreach ($indicadores as $indicador)
            {
                $medicion = new Medicion();
                $mediciones = $medicion->find("id_indicador = $indicador->id");
                $indicador->medicion = $mediciones;
            }
        }
        return $indicadores;
    }

    public function load_joined($criterio)
    {
        if ($this->load($criterio))
        {
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
        }
        else
        {
            return false;
        }
    }

    public function Find_joined($criterio)
    {
        $indicadores = $this->Find($criterio);
        if ($indicadores)
        {
            foreach ($indicadores as $indicador)
            {
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
        if ($indicadores)
        {
            foreach ($indicadores as $indicador)
            {
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

                $query = "SELECT m.id FROM mediciones m JOIN valores v ON m.id = v.id_medicion "
                        . "WHERE m.id_indicador=$indicador->id AND v.valor is NOT NULL ORDER BY m.periodo_inicio DESC LIMIT 1";
                $adodb = $this->DB();
                $array_result = $adodb->getall($query);

                $medicion = new Medicion();
                $id_medicion = $array_result[0][0];
                $medicion->Load("id= $id_medicion");
                $indicador->medicion = $medicion;
            }
        }
        return $indicadores;
    }

    public function Find_con_pendientes($condicion, $usuario_id)
    {
        $indicadores = $this->Find($condicion);
        if ($indicadores)
        {
            $query = "SELECT count(*) FROM indicadores_subunidades insu
            INNER JOIN mediciones me ON insu.id_indicador = me.id_indicador
            INNER JOIN valores va ON me.id = va.id_medicion
            WHERE insu.id_entidad = va.id_entidad
            AND insu.id_usuario  = {$usuario_id}
            AND va.valor_parcial is NULL
            AND insu.id_indicador = ";

            $adodb = $this->DB();

            foreach ($indicadores as $indicador)
            {
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
        $query = "SELECT * FROM valor WHERE id_indicador = $this->id_indicador ORDER BY fecha_recogida";
        $resultado = $db->Execute($query);
        while (!$resultado->EOF)
        {
            $datos[$resultado->fields['fecha_recogida']] = $resultado->fields;
            $resultado->MoveNext();
        }
        if (sizeof($datos) > 0)
        {
            $this->valores = $datos;
            return true;
        }
        else
        {
            return false;
        }
    }

    public function indicador_publico()
    {
        if ($indicadores = $this->find("id_visibilidad = 2"))
        {
            foreach ($indicadores as $indicador)
            {
                $entidad = new Entidad();
                $entidad->load("id_entidad = $indicador->id_entidad");
                $indicador->entidad = $entidad->nombre;
            }
            return $indicadores;
        }
        else
        {
            return false;
        }
    }

    // Devuelve los indicadores con su valores
    public function find_valor($condicion)
    {
        $indicadores = $this->find($condicion);
        if ($indicadores)
        {
            foreach ($indicadores as $indicador)
            {
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
        if ($control OR $this->load("id = $id_indicador AND (id_responsable = $id_usuario OR id_responsable_medicion = $id_usuario)"))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public function rebiun_2012_detalle()
    {
        $sql = " SELECT i.codigo, i.nombre as indicador, e.etiqueta as subunidad, u.login as medidor, v.valor
    FROM indicadores i
    INNER JOIN mediciones m ON m.id_indicador = i.id
    INNER JOIN valores v ON v.id_medicion = m.id
    INNER JOIN entidades e ON e.id = v.id_entidad
    INNER JOIN usuarios u ON u.id = v.id_usuario
    WHERE m.etiqueta = 2012 AND i.codigo LIKE 'R%'
    ORDER BY i.codigo, e.etiqueta";
        $db = $this->DB();
        return $db->getall($sql);
    }

    public function rebiun_2012_suma()
    {
        $sql = "SELECT i.codigo, i.nombre as indicador, m.etiqueta, SUM(v.valor) as valor
    FROM indicadores i
    INNER JOIN mediciones m ON m.id_indicador = i.id
    INNER JOIN valores v ON v.id_medicion = m.id
    WHERE (m.etiqueta = 2012 OR m.etiqueta = 2011) AND i.codigo LIKE 'R%' AND id_tipo_agregacion = 2
    GROUP BY i.codigo, i.nombre, m.etiqueta
    ORDER BY i.codigo";
        $db = $this->DB();
        return $db->getall($sql);
    }

    public function rebiun_2012_promedio()
    {
        $sql = "SELECT i.codigo, i.nombre as indicador, m.etiqueta, AVG(v.valor) as valor
    FROM indicadores i
    INNER JOIN mediciones m ON m.id_indicador = i.id
    INNER JOIN valores v ON v.id_medicion = m.id
    WHERE (m.etiqueta = 2012 OR m.etiqueta = 2011) AND i.codigo LIKE 'R%' AND id_tipo_agregacion = 1
    GROUP BY i.codigo, i.nombre, m.etiqueta
    ORDER BY i.codigo";
        $db = $this->DB();
        return $db->getall($sql);
    }

    public function find_sin_mediciones($id_entidad, $fecha)
    {
        $sql = "SELECT i.id as id_indicador,i.id_entidad, i.nombre as indicador, "
                . "p.nombre as proceso, p.codigo as cod_proceso, p.id as id_proceso "
                . "FROM indicadores i "
                . "LEFT JOIN procesos p ON i.id_proceso = p.id "
                . "WHERE i.id NOT IN (SELECT id_indicador FROM mediciones m "
                . "WHERE DATE_FORMAT( m.periodo_inicio, '%Y' ) = $fecha) "
                . "AND i.id_entidad = {$id_entidad}";
        $db = $this->DB();
        return $db->getall($sql);
    }

}
