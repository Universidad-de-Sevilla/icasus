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

    //Genera las mediciones de un Indicador/Dato para el año que recibe 
    //como parámetro en Indicadores/Datos con periodicidad Bienal. 
    //El tipo es: "indicador" o "dato"
    public function generar_medicion_bienal($indicador, $anyo, $tipo);

    //Genera las mediciones de un Indicador/Dato para el año que recibe 
    //como parámetro en función de su periodicidad. 
    //El tipo es: "indicador" o "dato"
    public function generar_mediciones_por_anyo($indicador, $anyo, $tipo);

    //Borra del Indicador/Dato que recibe como parámetro la medición cuyo 
    //identificador recibe también como parámetro
    //El tipo es: "indicador" o "dato"
    public function borrar_medicion($indicador, $tipo, $id_medicion);

    //Borra todas las mediciones del indicador 
    //cuyo identificador recibe como parámetro
    //El tipo es: "indicador" o "dato"
    public function borrar_mediciones($indicador, $tipo);

    //Calcula el total del indicador que recibe como parámetro para el conjunto 
    //de valores que también recibe como parámetro y en función de su tipo de agregación 
    //si es no agregado devolverá null.
    public function calcular_total($indicador, $valores);

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

    //------------------------------------------------------------------------
    //CRITERIOS EFQM
    //-------------------------------------------------------------------------
    //Asigna el criterio efqm cuyo id recibe al indicador cuyo identificador
    //tambien recibe como parámetro
    public function grabar_criterio_efqm($id, $id_efqm);

    //Borra todos los criterios efqm del indicador cuyo identificador recibe como parámetro
    public function borrar_criterios_efqm($id);
}
