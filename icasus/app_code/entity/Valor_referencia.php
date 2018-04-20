<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Valor_referencia.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Gestiona los valores de referencia de los indicadores 
//---------------------------------------------------------------------------------------------------

class Valor_referencia extends ADOdb_Active_Record
{
    public $_table = 'icasus_valor_referencia';
    public $id;
    public $id_indicador;
    public $activo;
    public $etiqueta;
    public $grafica;
    public $nombre;
}
