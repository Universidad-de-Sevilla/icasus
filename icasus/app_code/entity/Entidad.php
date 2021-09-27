<?php

class Entidad extends ADOdb_Active_Record
{
    public $_table = 'icasus_entidad';
    public $id;
    public $anotaciones;
    public $codigo;
    public $es_organica;
    public $etiqueta;
    public $etiqueta_mini;
    public $fin;
    public $frecuencia;
    public $id_madre;
    public $ict;
    public $inicio;
    public $mapa;
    public $nombre;
    public $objeto;
    public $orden;
    public $web;
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

    /**
     * Obtener subunidades de una unidad con sus valores de todas las mediciones del indicador.
     * @param int $id_indicador
     * @param int $id_entidad
     * @param int|null $limite
     * @return Entidad|null
     */
    public function find_subunidades_mediciones(int $id_indicador, int $id_entidad, int $limite = null): ?array
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
            $ids_mediciones = implode(',', array_column($mediciones, 'id'));
            $valor = new Valor();
            $valores = $valor->find("id_entidad = {$subunidad->id} AND id_medicion IN ($ids_mediciones)");
            foreach ($valores as $valor)
            {
                $medicion = array_column($mediciones, null, 'id')[$valor->id_medicion] ?? null;
                if ($medicion) {
                    $medicion->medicion_valor = $valor;
                }
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
            $this->madre = new Entidad();
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
