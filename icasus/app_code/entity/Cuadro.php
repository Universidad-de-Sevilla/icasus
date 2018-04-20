<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Cuadro.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Gestiona los cuadros de mando de un usuario
//---------------------------------------------------------------------------------------------------

class Cuadro extends ADOdb_Active_Record
{
    public $_table = 'icasus_cuadro';
    public $entidad;
    public $usuario;
    public $nombre;
    public $id_usuario;
    public $privado;
    public $comentarios;
    public $id_entidad;


    public function load_joined($condicion)
    {
        if ($this->load($condicion)) {
            $this->entidad = new Entidad();
            $this->entidad->load("id = $this->id_entidad");

            $this->usuario = new Usuario();
            $this->usuario->load("id = $this->id_usuario");

            return true;
        } else {
            return false;
        }
    }

    public function Find_joined($criterio)
    {
        $cuadros = $this->Find($criterio);
        if ($cuadros) {
            foreach ($cuadros as $cuadro) {
                $entidad = new Entidad();
                $entidad->load("id= $cuadro->id_entidad");
                $cuadro->entidad = $entidad;

                $usuario = new Usuario();
                $usuario->load("id= $cuadro->id_usuario");
                $cuadro->usuario = $usuario;
            }
        }
        return $cuadros;
    }
}
