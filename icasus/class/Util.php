<?php

//----------------------------------------------------------------------------------
// Proyecto: Icasus
// Fichero: class/Util.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//----------------------------------------------------------------------------------
// Clase que contiene métodos estáticos de utilidad para la aplicación
//----------------------------------------------------------------------------------

class Util
{

    //Saneamiento SQL
    static function mysqlCleaner($data)
    {
        return(stripslashes(mysql_real_escape_string($data)));
    }
    
    //Fechas: calcula si un año es o no bisiesto
    static function esBisiesto($year)
    {
        if ((!($year % 4) && ($year % 100)) || !($year % 400))
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }

}
