<?php

//----------------------------------------------------------------------------------
// Proyecto: Icasus
// Fichero: entity/Rol.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
// Descripcion: gestiona los roles de usuario en una entidad, proceso o indicador
//----------------------------------------------------------------------------------

class Rol extends ADOdb_Active_Record
{
    public $_table = 'icasus_rol';
    public $id;
    public $nombre;
    public $orden;
    public $objeto;
}
