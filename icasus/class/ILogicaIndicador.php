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
}
