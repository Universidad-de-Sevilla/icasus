<?php

//----------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: class/Pagina.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
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
