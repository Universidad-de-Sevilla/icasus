<?php

//----------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: class/pagina.php
//----------------------------------------------------------------------------
// Creación y edición de páginas dinamicas en html 
//----------------------------------------------------------------------------

class Pagina extends ADOdb_Active_Record
{

    public $_table = "paginas";

    function alieniza($alias)
    {
        return strtr($alias, "???????¥µÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýÿ ", "SOZsozYYuAAAAAAACEEEEIIIIDNOOOOOOUUUUYsaaaaaaaceeeeiiiionoooooouuuuyy_");
    }

}
