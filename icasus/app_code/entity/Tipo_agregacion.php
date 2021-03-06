<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Tipo_agregacion.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Gestiona los distintos tipo de agregacion de un indicador
//------------------------------------------------------------------------------

class Tipo_agregacion extends ADOdb_Active_Record
{
    public $_table = 'icasus_tipo_agregacion';
    public $id;
    public $descripcion;
    public $operador;
    public $explicacion;
}
