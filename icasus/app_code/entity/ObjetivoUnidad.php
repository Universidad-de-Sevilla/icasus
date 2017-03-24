<?php

//----------------------------------------------------------------------------------
// Proyecto: Icasus
// Fichero: entity/ObjetivoUnidad.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//----------------------------------------------------------------------------------
// Mapea la tabla objetivos_unidades de la base de datos.
//----------------------------------------------------------------------------------

class ObjetivoUnidad extends ADOdb_Active_Record
{

    public $_table = 'objetivos_unidades';
    public $entidad;

    public function Find_entidades($criterio)
    {
        $objetivo_subunidades = $this->Find($criterio);
        if ($objetivo_subunidades)
        {
            foreach ($objetivo_subunidades as $objetivo_subunidad)
            {
                $objetivo_subunidad->entidad = new Entidad();
                $objetivo_subunidad->entidad->load("id = $objetivo_subunidad->id_entidad");
            }
            usort($objetivo_subunidades, array($this, 'ordenarPorEtiqueta'));
        }
        return $objetivo_subunidades;
    }

    //Ordena las subunidades de un Indicador/Dato por su etiqueta
    private function ordenarPorEtiqueta($a, $b)
    {
        $cadena1 = Util::quitar_tildes($a->entidad->etiqueta);
        $cadena2 = Util::quitar_tildes($b->entidad->etiqueta);
        return strcasecmp($cadena1, $cadena2);
    }

}
