<?php

//----------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: entity/Pagina.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//----------------------------------------------------------------------------
// Creación y edición de páginas dinamicas en html 
//----------------------------------------------------------------------------

class Pagina extends ADOdb_Active_Record
{
    public $_table = "icasus_pagina";
    public $id;
    public $titulo;
    public $contenido;
    public $alias;
    public $modified;

    function alieniza($alias)
    {
        return strtr($alias, "???????¥µÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýÿ ", "SOZsozYYuAAAAAAACEEEEIIIIDNOOOOOOUUUUYsaaaaaaaceeeeiiiionoooooouuuuyy_");
    }
}
