<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/Entidad.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Gestiona las entidades
//--------------------------------------------------------------------------

class Entidad extends ADOdb_Active_Record
{

    public $_table = 'entidades';
    public $indicadores;
    public $valores;
    public $madre;
    public $usuario;
    public $mediciones;

    //obtener subunidades de una unidad con sus valores de las mediciones del indicador elegidas por el usuario.
    public function find_subunidades_mediciones_periodos($id_indicador, $id_entidad, $inicio, $fin)
    {
        $subunidades = $this->find("id = $id_entidad OR id_madre = $id_entidad ORDER BY etiqueta");
        foreach ($subunidades as $subunidad)
        {
            $medition = new Medicion();
            $meditions = $medition->find("id_indicador = $id_indicador AND date_format(periodo_inicio,'%Y') between '$inicio' AND '$fin' ORDER BY periodo_inicio DESC");
            foreach ($meditions as $medi)
            {
                $valor = new Valor();
                $valor->load("id_entidad = $subunidad->id AND id_medicion = $medi->id");
                $medi->medicion_valor = $valor;
            }
            $subunidad->mediciones = $meditions;
        }
        return $subunidades;
    }

    //obtener subunidades de una unidad con sus valores de todas las mediciones del indicador.
    public function find_subunidades_mediciones($id_indicador, $id_entidad, $limite = null)
    {
        $subunidades = $this->find("id = $id_entidad OR id_madre = $id_entidad ORDER BY etiqueta");
        foreach ($subunidades as $subunidad)
        {
            $medicion = new Medicion();
            if ($limite)
            {
                $mediciones = $medicion->Find("id_indicador = $id_indicador ORDER BY periodo_inicio DESC LIMIT $limite");
            }
            else
            {
                $mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio DESC");
            }

            foreach ($mediciones as $medicion)
            {
                $valor = new Valor();
                $valor->load("id_entidad = $subunidad->id AND id_medicion = $medicion->id");
                $medicion->medicion_valor = $valor;
            }
            $subunidad->mediciones = $mediciones;
        }
        return $subunidades;
    }

    // Devuelve los datos de una entidad con los de su entidad madre y con los usuarios vinculados
    public function load_joined($condicion)
    {
        if ($this->load($condicion))
        {
            $this->madre = new Entidad;
            $this->madre->load("id = $this->id_madre");

            $usuarios = new Usuario_entidad();
            $this->usuario = $usuarios->Find_usuarios("id_entidad = $this->id ");

            return true;
        }
        else
        {
            return false;
        }
    }

    public function informe_entidad_indicador($condicion)
    {
        $dptos = $this->find("codigo LIKE '$condicion%'");
        foreach ($dptos as $dpto)
        {
            //indicadores de la unidad
            $indicador = new Indicador();
            $indicadores = $indicador->find_valor("id_entidad = $dpto->id_entidad");
            $dpto->indicadores = $indicadores;
        }
        return $dptos;
    }

    public function actas_grupo($id_entidad)
    {
        $grupos = $this->find('id_madre=' . $id_entidad);
        if ($grupos)
        {
            foreach ($grupos as $grupo)
            {
                $acta = new acta();
                $actas = $acta->find('id_entidad=' . $grupo->id_entidad);
                $grupo->numero_actas = count($actas);
            }
            return $grupos;
        }
        else
        {
            return false;
        }
    }

    public function seguimiento_dpto($periodos, $codigos)
    {
        $dptos = $this->find("codigo LIKE 'UE01-%' ORDER BY nombre");
        foreach ($codigos as $codigo)
        {
            $codes = $codes . "codigo LIKE '" . $codigo . "'";
            if (next($codigos) == true)
            {
                $codes = $codes . " OR ";
            }
        }
        foreach ($dptos as $dpto)
        {
            $indicador = new Indicador();
            $indicadores = $indicador->find_valor("id_entidad = $dpto->id_entidad AND ($codes)");
            $dpto->indicadores = $indicadores;
        }
        return $dptos;
    }

    public function seguimiento_entidad($periodos, $codigos, $grupo, $dato)
    {
        $db = $this->DB();
        $entidades = $this->find("codigo LIKE '$grupo-%'");
        foreach ($entidades as $entidad)
        {
            foreach ($codigos as $codigo)
            {
                foreach ($periodos as $periodo)
                {
                    $sql = "SELECT i.id_indicador,i.codigo,year(from_unixtime(v.fecha_recogida)) AS fecha, count(*) as numero, v.valor as valor FROM entidad e 
								 LEFT JOIN indicador i ON i.id_entidad = e.id
								 LEFT JOIN valor v ON i.id_indicador = v.id_indicador
								 WHERE e.id = $entidad->id
								 AND i.codigo LIKE '$grupo-%-" . $codigo . "' 
								 AND year(from_unixtime(v.fecha_recogida)) = " . $periodo;
                    $cuenta = $db->execute($sql);
                    $code[$codigo][$periodo] = $cuenta->fields[$dato];
                }
            }
            $entidad->indicadores = $code;
        }
        return $entidades;
    }

    public function actualizar($id_entidad, $id_padre, $nombre, $etiqueta, $etiqueta_mini, $web, $organica, $codigo, $anotaciones)
    {
        $this->load("id = $id_entidad");
        $this->id_madre = $id_padre;
        $this->nombre = $nombre;
        $this->etiqueta = $etiqueta;
        $this->etiqueta_mini = $etiqueta_mini;
        $this->web = $web;
        $this->es_organica = $organica;
        $this->codigo = $codigo;
        $this->anotaciones = $anotaciones;
        if ($this->save())
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}
