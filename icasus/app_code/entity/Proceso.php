<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: entity/Proceso.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona los procesos
//---------------------------------------------------------------------------------------------------
class Proceso extends ADOdb_Active_Record
{

    public $_table = 'procesos';
    public $propietario;
    public $error; //propiedad de uso interno para almacenar los errores
    public $madre;
    public $cuadro;
    public $entidad;
    public $indicadores = array();

    //devuelve los procesos de los indicadores de la unidad superior
    public function proceso_indicador_superior($id_unidad)
    {
        $entidad = new Entidad();
        $entidad->load("id = $id_unidad");

        $procesos = $this->find("id_entidad = $entidad->id_madre");

        return $procesos;
    }

    //devuelve los procesos de los indicadores segregados los cuales son medidos por una subunidad
    public function procesos_indicadores_segregados($id_unidad)
    {
        $db = $this->DB();
        $query = "SELECT insu.id_indicador,insu.id_entidad,i.id_proceso,p.nombre as nombre_proceso,e.nombre as nombre_entidad FROM indicadores_subunidades insu 
							INNER JOIN indicadores i ON insu.id_indicador = i.id 
							INNER JOIN procesos p ON i.id_proceso = p.id 
							INNER JOIN entidades e ON p.id_entidad = e.id 
							WHERE insu.id_entidad = $id_unidad AND insu.id_indicador 
							NOT IN (SELECT id FROM indicadores  WHERE id_entidad = $id_unidad) GROUP BY i.id_proceso";
        $procesos = $db->getall($query);

        return $procesos;
    }

    //devuelve los procesos de un entidad con los indicadores propios.
    public function find_joined_indicadores($condicion)
    {
        $procesos = $this->find($condicion);
        foreach ($procesos as & $proceso)
        {
            $indicador = new Indicador();
            $proceso->indicadores = $indicador->find("id_proceso = $proceso->id");
        }
        return $procesos;
    }

    public function load_joined($condition)
    {
        if ($this->load($condition))
        {
            $propietario = new Usuario();
            $propietario->load("id = $this->id_propietario");
            $this->propietario = $propietario;

            if ($this->id_madre)
            {
                $madre = new Proceso();
                $madre->load("id = $this->id_madre");
                $this->madre = $madre;
            }
            if ($this->id_cuadro)
            {
                $cuadro = new Cuadro();
                $cuadro->load("id = $this->id_cuadro");
                $this->cuadro = $cuadro;
            }
            return true;
        }
        else
        {
            return false;
        }
    }

    public function Find_joined($condition)
    {
        $procesos = $this->Find($condition);
        if ($procesos)
        {
            foreach ($procesos as $proceso)
            {
                $entidad = new Entidad();
                $entidad->load("id=$proceso->id_entidad");
                $proceso->entidad = $entidad;

                $propietario = new Usuario();
                $propietario->load("id = $proceso->id_propietario");
                $proceso->propietario = $propietario;

                //pasar nombre del proceso madre
                $madre = new Proceso();
                $madre->load("id = $proceso->id_madre");
                $proceso->madre = $madre;
            }
        }
        return $procesos;
    }

    public function borrar($id_proceso)
    {
        // Carga el proceso
        if ($this->load("id= $id_proceso"))
        {
            // Comprueba que no tenga indicadores asociados
            $indicador = new Indicador();
            if ($indicador->Find("id_proceso = $id_proceso") OR $this->Find("id_madre = $id_proceso"))
            {
                // Informa de error
                $this->error = "No se puede borrar un proceso con indicadores o subprocesos asociados";
                return false;
            }
            else
            {
                // Borra el proceso
                $this->delete();
                return true;
            }
        }
        else
        {
            // Informa de error
            $this->error = "No existe el proceso";
            return false;
        }
    }

}
