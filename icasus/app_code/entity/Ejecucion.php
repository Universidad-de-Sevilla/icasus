<?php

//----------------------------------------------------------------------------------
// Proyecto: Icasus
// Fichero: entity/Ejecucion.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//----------------------------------------------------------------------------------
// Mapea la tabla ejecuciones de la base de datos
//----------------------------------------------------------------------------------

class Ejecucion extends ADOdb_Active_Record
{
    public $_table = 'icasus_ejecucion';
    public $id;
    public $id_plan;
    public $id_linea;
    public $id_objest;
    public $id_objop;
    public $anyo;
    public $valor;
    public $activo;
    public $resultado;
}
