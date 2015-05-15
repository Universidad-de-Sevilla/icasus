<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/LogicaIndicador.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Clase que implementa los métodos para la Lógica de Negocio 
// de los Indicadores/Datos en Icasus.
//--------------------------------------------------------------------------

class LogicaIndicador implements ILogicaIndicador
{

    //-----------------------------------------------------------------------------
    // FUNCIONES PARA EL CÁLCULO DE DEPENDENCIAS 
    // EN INDICADORES/DATOS CALCULADOS
    //-----------------------------------------------------------------------------
    //Función que guarda los indicadores/datos de los que depende el 
    //indicador/dato calculado cuyo identificador recibe como parámetro
    public function guardar_dependencias($id)
    {
        $indicador_calculado = new Indicador();
        $indicador_calculado->load("id=$id");
        $calculo = str_split($indicador_calculado->calculo);
        $es_variable = false;
        // Recorremos la cadena $calculo para sacar los 
        // indicadores/datos influyentes
        foreach ($calculo as $elemento)
        {
            if ($elemento == "[")
            {
                $variable = "";
                $es_variable = true;
                continue;
            }
            if ($elemento == "]")
            {
                //Es el id de un indicador/dato del que depende
                if (is_numeric($variable))
                {
                    //Lo guardamos en la tabla de indicadores_dependencias
                    $this->guarda_dependencia($id, (int) $variable);
                }
                $es_variable = false;
            }
            if ($es_variable)
            {
                $variable .= $elemento;
            }
        }
    }

    //Función que guarda una dependencia de un indicador/dato de otro 
    //cuyos identificadores recibe como parámetros
    public function guarda_dependencia($id_calculado, $id_operando)
    {
        $indicador_dependencia = new Indicador_dependencia();
        $indicador_dependencia->id_calculado = $id_calculado;
        $indicador_dependencia->id_operando = $id_operando;
        $indicador_dependencia->Save();
    }

    //Función que borra los indicadores/datos de los que depende el indicador/dato 
    //calculado cuyo identificador recibe como parámetro
    public function borrar_dependencias($id)
    {
        $indicador_dependencia = new Indicador_dependencia();
        while ($indicador_dependencia->load("id_calculado = $id"))
        {
            $indicador_dependencia->delete();
        }
    }

}
