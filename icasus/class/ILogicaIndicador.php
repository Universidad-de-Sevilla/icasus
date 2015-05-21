<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/ILogicaIndicador.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Interface que contendra los métodos para la Lógica de Negocio 
// de los Indicadores/Datos en Icasus.
//--------------------------------------------------------------------------

interface ILogicaIndicador
{

    //-----------------------------------------------------------------
    //GENERACIÓN DE MEDICIONES
    //-----------------------------------------------------------------
    //Genera las mediciones de un Indicador/Dato para el año actual en 
    //función de su periodicidad. El tipo es: "indicador" o "dato"
    function generar_mediciones($indicador, $tipo);

    //-----------------------------------------------------------------------------
    // FUNCIONES PARA EL CÁLCULO DE DEPENDENCIAS 
    // EN INDICADORES/DATOS CALCULADOS
    //-----------------------------------------------------------------------------
    //Función que guarda los indicadores/datos de los que depende el 
    //indicador/dato calculado cuyo identificador recibe como parámetro
    function guardar_dependencias($id);

    //Función que borra los indicadores/datos de los que depende el indicador/dato 
    //calculado cuyo identificador recibe como parámetro
    function borrar_dependencias($id);
    
    //Función que devuelve los indicadores/datos de los que depende 
    //el indicador/dato cuyo identificador recibe como parámetro
    function calcular_dependencias($id);

    //-----------------------------------------------------------------------------
    // FUNCIONES PARA ACTUALIZAR LAS UNIDADES EN LAS QUE SE MIDE UN INDICADOR/DATO
    //------------------------------------------------------------------------------
    // Actualiza mediciones y genera un valor en blanco para cada una de las unidades 
    // asociadas al Indicador/Dato en función de la fecha actual y su periodicidad
    function actualizar_mediciones($indicador);
}
