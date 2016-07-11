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

    //Media: calcula la media de un array de valores
    static function media($valores)
    {
        $suma = 0;
        $num_valores = 0;
        foreach ($valores as $valor)
        {
            if ($valor !== null)
            {
                $suma = $suma + $valor;
                $num_valores++;
            }
        }
        if ($num_valores !== 0)
        {
            return ($suma / $num_valores);
        }
        else
        {
            return 0;
        }
    }

}
