<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Valor.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los valores recogidos para cada indicador
//---------------------------------------------------------------------------------------------------

class Valor extends ADOdb_Active_Record
{
    public $_table = 'valores';
    public $entidad;
    public $usuario;
    public $medicion;
    public $indicador;
    // Propiedades que persisten en BD
    public $id;
    public $activo;
    public $fecha_recogida;
    public $id_entidad;
    public $id_medicion;
    public $id_usuario;
    public $observaciones;
    public $valor;
    public $valor_parcial;

    //Activa/desactiva los valores de una subunidad según parametros
    public function valores_activar_periodos($id_indicador, $id_subunidad, $activar, $inicio, $fin)
    {
        $medicion = new Medicion();
        $mediciones = $medicion->find("id_indicador = $id_indicador AND date_format(periodo_inicio,'%Y') between '$inicio' AND '$fin' ORDER BY periodo_inicio");
        foreach ($mediciones as $medicion) {
            $valor = new Valor();
            $valor->load("id_medicion = $medicion->id AND id_entidad = $id_subunidad");
            $valor->activo = $activar;
            $valor->save();
        }
    }

    public function valores_activar($id_indicador, $id_subunidad, $activar)
    {
        $medicion = new Medicion();
        $mediciones = $medicion->find("id_indicador = $id_indicador");
        foreach ($mediciones as $medicion) {
            $valor = new Valor();
            $valor->load("id_medicion = $medicion->id AND id_entidad = $id_subunidad");
            $valor->activo = $activar;
            $valor->save();
        }
    }

    public function Find_joined($condicion)
    {
        /** @var array $valores */
        $valores = $this->Find($condicion);
        if ($valores) {
            foreach ($valores as & $valor) {
                $valor->entidad = new Entidad();
                $valor->entidad->load("id = $valor->id_entidad");

                $valor->usuario = new Usuario();
                $valor->usuario->load("id = $valor->id_usuario");
            }
            usort($valores, array($this, "compara_por_etiquetas"));
        }
        return $valores;
    }

    public function Find_joined_indicador($condicion)
    {
        $valores = $this->Find($condicion);
        if ($valores) {
            foreach ($valores as & $valor) {
                $valor->medicion = new Medicion();
                $valor->medicion->load("id = $valor->id_medicion");
                $id_indicador = $valor->medicion->id_indicador;
                $valor->indicador = new Indicador();
                $valor->indicador->load("id = $id_indicador");
            }
        }
        return $valores;
    }

    public function load_joined($id)
    {
        if ($this->load("id = $id")) {
            $this->entidad = new Entidad();
            $this->entidad->load("id = $this->id_entidad");

            $this->usuario = new Usuario();
            $this->usuario->load("id = $this->id_usuario");

            return $this;
        } else {
            return false;
        }
    }

    // Define la función personalizada para ordenar
    static function compara_por_etiquetas($a, $b)
    {
        return $a->entidad->etiqueta > $b->entidad->etiqueta;
    }

    //función para mostrar los datos en control
    public function filtro_onlyear($fecha, $cadena)
    {
        $db = $this->DB();
        $sql = "SELECT  v.id as id_valor, m.id as id_medicion,p.nombre as proceso,
            p.id as id_proceso,e.etiqueta as unidad, 
            i.nombre as indicador, i.id_entidad as entidad_del_indicador,i.control,
            i.id as id_indicador,e.id as id_entidad,m.etiqueta as fecha, 
            v.valor FROM `valores` v
			LEFT JOIN mediciones m ON v.id_medicion = m.id
			LEFT JOIN entidades e ON v.id_entidad = e.id
			LEFT JOIN indicadores i ON m.id_indicador = i.id
			LEFT JOIN procesos p ON p.id = i.id_proceso
			WHERE v.valor IS NULL
			$cadena
                        AND i.archivado IS NULL
			AND v.activo = 1 
			AND DATE_FORMAT( m.periodo_inicio, '%Y' ) = $fecha
			ORDER BY  i.nombre,e.etiqueta";
        return $db->getall($sql);
    }

    //función para mostrar los datos en control agrupados
    public function filtro_onlyear_agrupados($fecha, $cadena)
    {
        $db = $this->DB();
        $sql = "SELECT  COUNT(v.id) as subunidades, v.id as id_valor, m.id as id_medicion,p.nombre as proceso,
            p.id as id_proceso, i.nombre as indicador, 
            i.id_entidad as entidad_del_indicador,i.id as id_indicador,i.control,
            e.id as id_entidad,m.etiqueta as fecha,u.id as id_usuario,
            u.nombre as nombre_responsable,u.apellidos as apellidos_responsable,
            um.nombre as nombre_responsable_med,um.apellidos as apellidos_responsable_med,
            v.valor FROM `valores` v
			LEFT JOIN mediciones m ON v.id_medicion = m.id
			LEFT JOIN entidades e ON v.id_entidad = e.id
			LEFT JOIN indicadores i ON m.id_indicador = i.id
                        LEFT JOIN usuarios u ON i.id_responsable = u.id
                        LEFT JOIN usuarios um ON i.id_responsable_medicion = um.id
			LEFT JOIN procesos p ON p.id = i.id_proceso
			WHERE v.valor IS NULL
			$cadena
                        AND i.archivado IS NULL
			AND v.activo = 1 
			AND DATE_FORMAT( m.periodo_inicio, '%Y' ) = $fecha
			GROUP BY  i.id,m.id ORDER BY i.nombre,m.etiqueta";
        return $db->getall($sql);
    }

    //función para mostrar los datos en control modificados
    public function filtro_onlyear_modificados($fecha, $cadena)
    {
        $db = $this->DB();
        $sql = "SELECT  v.id as id_valor,v.fecha_recogida, m.id as id_medicion,p.nombre as proceso,
            p.id as id_proceso,e.etiqueta as unidad, 
            i.nombre as indicador, i.id_entidad as entidad_del_indicador,i.control,
            i.id as id_indicador,e.id as id_entidad,m.etiqueta as fecha, 
            v.valor FROM `valores` v
			LEFT JOIN mediciones m ON v.id_medicion = m.id
			LEFT JOIN entidades e ON v.id_entidad = e.id
			LEFT JOIN indicadores i ON m.id_indicador = i.id
			LEFT JOIN procesos p ON p.id = i.id_proceso
			WHERE v.valor IS NOT NULL
			$cadena
                        AND i.archivado IS NULL
			AND v.activo = 1 
			AND (DATE_FORMAT( m.periodo_inicio, '%Y' ) = $fecha
                        OR DATE_FORMAT( v.fecha_recogida, '%Y' ) = $fecha)
			ORDER BY  m.periodo_inicio,v.fecha_recogida, i.nombre";
        return $db->getall($sql);
    }
}
