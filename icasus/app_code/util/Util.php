<?php

//----------------------------------------------------------------------------------
// Proyecto: Icasus
// Fichero: util/Util.php
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

    //Calcula el maximo del array de valores que recibe como parámetro.
    static function maximo(array $valores)
    {
        $maximo = null;
        foreach ($valores as $valor)
        {
            if ($valor !== null && $valor > $maximo)
            {
                $maximo = $valor;
            }
        }
        return $maximo;
    }

    //Calcula el sumatorio del array de valores que recibe como parámetro.
    static function sumatorio(array $valores)
    {
        $suma = null;
        foreach ($valores as $valor)
        {
            if ($valor !== null)
            {
                $suma = $suma + $valor;
            }
        }
        return $suma;
    }

    //Media: calcula la media de un array de valores
    static function media(array $valores)
    {
        if (count($valores))
        {
            return array_sum($valores) / count($valores);
        }
        else
        {
            return 0;
        }
    }

    //Media: calcula la media ponderada para un array de valores y otro de pesos
    static function media_ponderada(array $valores, array $pesos)
    {
        if (count($valores))
        {
            $suma = 0;
            foreach ($valores as $index => $valor)
            {
                $suma = $suma + ($valor * $pesos[$index]);
            }
            return $suma / array_sum($pesos);
        }
        else
        {
            return 0;
        }
    }

    //Elimina las tildes de una cadena
    static function quitar_tildes($cadena)
    {
        $no_permitidas = array("á", "é", "í", "ó", "ú", "Á", "É", "Í", "Ó", "Ú", "ñ", "À", "Ã", "Ì", "Ò", "Ù", "Ã™", "Ã ", "Ã¨", "Ã¬", "Ã²", "Ã¹", "ç", "Ç", "Ã¢", "ê", "Ã®", "Ã´", "Ã»", "Ã‚", "ÃŠ", "ÃŽ", "Ã”", "Ã›", "ü", "Ã¶", "Ã–", "Ã¯", "Ã¤", "«", "Ò", "Ã", "Ã„", "Ã‹");
        $permitidas = array("a", "e", "i", "o", "u", "A", "E", "I", "O", "U", "n", "N", "A", "E", "I", "O", "U", "a", "e", "i", "o", "u", "c", "C", "a", "e", "i", "o", "u", "A", "E", "I", "O", "U", "u", "o", "O", "i", "a", "e", "U", "I", "A", "E");
        $texto = str_replace($no_permitidas, $permitidas, $cadena);
        return $texto;
    }

}
