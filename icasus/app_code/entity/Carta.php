<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Carta.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es), Ramón M. Gómez (ramongomez@us.es)
//---------------------------------------------------------------------------------------------------
// Mapea la tabla cartas de la base de datos
//---------------------------------------------------------------------------------------------------

class Carta extends ADOdb_Active_Record
{
    public $_table = 'icasus_carta';
    public $id_entidad;
    public $id_cuadro;
    public $fecha;
    public $mision;
    public $valores;
    public $entidad;
    public $cuadro;
    public $nombre;
    public $archivado;

    /**
     * @return string
     */
    public function __toString(): string
    {
        return $this->nombre;
    }

    /**
     * @param string $condicion
     * @return bool
     */
    public function load_joined(string $condicion): bool
    {
        if ($this->load($condicion)) {
            $this->entidad = new Entidad();
            $this->entidad->load("id = $this->id_entidad");

            if ($this->id_cuadro) {
                $cuadro = new Cuadro();
                $cuadro->load("id = $this->id_cuadro");
                $this->cuadro = $cuadro;
            }
            return true;
        } else {
            return false;
        }
    }

    /**
     * @param string $criterio
     * @return bool
     */
    public function Find_joined(string $criterio): bool
    {
        $cartas = $this->Find($criterio);
        if ($cartas) {
            foreach ($cartas as $carta) {
                $entidad = new Entidad();
                $entidad->load("id= $carta->id_entidad");
                $carta->entidad = $entidad;
            }
        }
        return $cartas;
    }
}
