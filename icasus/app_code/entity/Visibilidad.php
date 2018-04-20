<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Visibilidad.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Gestiona los distintos tipo de visibilidad de un indicador
//---------------------------------------------------------------------------------------------------

class Visibilidad extends ADOdb_Active_Record
{
    public $_table = 'icasus_visibilidad';
    public $id;
    public $nombre;
    public $descripcion;
}
