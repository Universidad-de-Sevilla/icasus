<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/ILogicaIndicador.php
// Tipo: definicion de Interfaz
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Interface que contendra los métodos para la Lógica de Negocio 
// de los Indicadores/Datos en Icasus.
//--------------------------------------------------------------------------

interface ILogicaIndicador
{

    //-----------------------------------------------------------------
    //MEDICIONES
    //-----------------------------------------------------------------
    //Genera las mediciones de un Indicador/Dato a partir de su Histórico. 
    //El tipo es: "indicador" o "dato"
    public function generar_mediciones($indicador, $tipo);

    //Borra del Indicador/Dato que recibe como parámetro la medición cuyo 
    //identificador recibe también como parámetro
    //El tipo es: "indicador" o "dato"
    public function borrar_medicion($indicador, $tipo, $id_medicion);

    //Borra todas las mediciones del indicador 
    //cuyo identificador recibe como parámetro
    //El tipo es: "indicador" o "dato"
    public function borrar_mediciones($indicador, $tipo);

    //-----------------------------------------------------------------------------
    // FUNCIONES PARA EL CÁLCULO DE DEPENDENCIAS 
    // EN INDICADORES/DATOS CALCULADOS
    //-----------------------------------------------------------------------------
    //Función que guarda los indicadores/datos de los que depende el 
    //indicador/dato calculado cuyo identificador recibe como parámetro
    public function guardar_dependencias($id);

    //Función que borra los indicadores/datos de los que depende el indicador/dato 
    //calculado cuyo identificador recibe como parámetro
    public function borrar_dependencias($id);

    //Función que devuelve los indicadores/datos de los que depende 
    //el indicador/dato cuyo identificador recibe como parámetro
    public function calcular_dependencias($id);

    //Función que devuelve los indicadores/datos sobre los que influye el 
    //indicador/dato cuyo identificador recibe como parámetro
    public function calcular_influencias($id);

    //--------------------------------------------------------------------------
    //UNIDADES
    //--------------------------------------------------------------------------
    //Borra todas las Unidades vinculadas al Indicador/Dato cuyo identificador 
    //recibe como parámetro
    public function borrar_unidades($id);

    //-----------------------------------------------------------------------------
    // FUNCIONES PARA ACTUALIZAR LAS UNIDADES EN LAS QUE SE MIDE UN INDICADOR/DATO
    //------------------------------------------------------------------------------
    // Actualiza mediciones y genera un valor en blanco para cada una de las unidades 
    // asociadas al Indicador/Dato en función de la fecha actual y su periodicidad 
    // cuando cambiamos el tipo de agregación
    public function actualizar_mediciones($indicador);

    // Actualiza mediciones activando/desactivando las Unidades 
    // asociadas al Indicador/Dato en función de la fecha actual y su periodicidad 
    // cuando cambiamos las Unidades en Indicadores/Datos Agregados
    public function actualizar_subunidades($indicador);
}
