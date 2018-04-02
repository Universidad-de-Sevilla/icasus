<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entity/Panel_tipo.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Gestiona los tipos de paneles de un cuadro de mando
//---------------------------------------------------------------------------------------------------

class Panel_tipo extends ADOdb_Active_Record
{
    public $_table = 'icasus_panel_tipo';
    public $id;
    public $nombre;
    public $ancho_predeterminado;
    public $clase_css;
}
