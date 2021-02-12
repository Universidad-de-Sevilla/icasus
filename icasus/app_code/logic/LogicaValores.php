<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: logic/LogicaValores.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Clase que implementa los métodos para la Lógica de Negocio 
// de los Valores en Icasus.
//--------------------------------------------------------------------------

class LogicaValores implements ILogicaValores
{

    //Calcula la media del conjunto de valores que recibe como parámetro.
    public function media($valores)
    {
        $suma = 0;
        $num_valores = 0;
        foreach ($valores as $valor)
        {
            if ($valor->valor !== null)
            {
                $suma += $valor->valor;
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

    //Calcula el sumatorio del conjunto de valores que recibe como parámetro.
    public function sumatorio($valores)
    {
        $suma = 0;
        foreach ($valores as $valor)
        {
            if ($valor->valor !== null)
            {
                $suma += $valor->valor;
            }
        }
        return $suma;
    }

    //Calcula el maximo del conjunto de valores que recibe como parámetro.
    public function maximo($valores)
    {
        $maximo = 0;
        foreach ($valores as $valor)
        {
            if ($valor->valor !== null && $valor->valor > $maximo)
            {
                $maximo = $valor->valor;
            }
        }
        return $maximo;
    }

    //Calcula la mediana del conjunto de valores que recibe como parámetro.
    public function mediana($valores)
    {
        $numeros = array();
        foreach ($valores as $valor)
        {
            if ($valor->valor !== null)
            {
                array_push($numeros, $valor->valor);
            }
        }
        if ($numeros)
        {
            sort($numeros, SORT_NUMERIC);
            $med = (int) floor((count($numeros) / 2));
            return (count($numeros) % 2 != 0) ? $numeros[$med] : ($numeros[$med - 1] + $numeros[$med]) / 2;
        }
        else
        {
            return 0;
        }
    }

    //TODO: esta función apesta pero no me atrevo a tocarla
    //Calcula el total de forma manual tomando el valor de la Unidad madre 
    //del indicador/dato del conjunto de valores que recibe como parámetro.
    public function manual($indicador, $valores)
    {
        foreach ($valores as $valor)
        {
            if ($valor->id_entidad == $indicador->id_entidad)
            {
                return $valor->valor;
            }
        }
    }

}
