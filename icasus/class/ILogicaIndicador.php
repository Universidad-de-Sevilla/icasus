<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/ILogicaIndicador.php
// Tipo: definicion de Interfaz
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Interface que contendra los métodos para la Lógica de Negocio 
// de los Indicadores en Icasus.
//--------------------------------------------------------------------------

interface ILogicaIndicador
{

    //-----------------------------------------------------------------
    //MEDICIONES
    //-----------------------------------------------------------------
    //Genera las mediciones de un Indicador/Dato a partir del año que recibe 
    //como parámetro.
    public function generar_mediciones($indicador, $anyo);

    //Genera las mediciones de un Indicador/Dato para el año que recibe 
    //como parámetro en Indicadores/Datos con periodicidad Bienal.
    public function generar_medicion_bienal($indicador, $anyo);

    //Genera las mediciones de un Indicador/Dato para el año que recibe 
    //como parámetro en función de su periodicidad.
    public function generar_mediciones_por_anyo($indicador, $anyo);

    //Borra del Indicador/Dato que recibe como parámetro la medición cuyo 
    //identificador recibe también como parámetro.
    public function borrar_medicion($indicador, $id_medicion);

    //-----------------------------------------------------------------------------
    // FUNCIONES PARA EL CÁLCULO DE TOTALES
    // EN INDICADORES/DATOS
    //-----------------------------------------------------------------------------
    //Calcula el total del indicador/dato que recibe como parámetro para el conjunto 
    //de valores y para la medición cuya etiqueta también recibe parámetros
    //y en función de su tipo de agregación 
    public function calcular_total($indicador, $valores, $etiqueta);

    //Calcula el total anual del indicador/dato que recibe como parámetro para la 
    //unidad/subunidad y el año que también recibe parámetros
    //y en función de su tipo de agregación 
    public function calcular_total_temporal($indicador, $subunidad, $anyo);

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

    //Función que actualiza el valor de los indicadores calculados que 
    //dependen de aquel cuyo id pasamos para la medición cuya etiqueta damos y para la 
    //entidad cuyo id pasamos también como parámetro 
    public function actualizar_valor_indicadores_calculados($id, $etiqueta_medicion, $id_entidad);

    //Función que calcula y graba el valor de un Indicador/Dato calculado. 
    //Recibe como parámetros el Indicador/Dato calculado la etiqueta de la medición
    //y el id_entidad del valor a actualizar
    public function actualizar_valor($indicador, $etiqueta, $id_entidad);

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

    //---------------------------------------------------------------------------
    //VALORES
    //-----------------------------------------------------------------------------
    //Devuelve todos los valores del Indicador/Dato para la medición 
    //cuya etiqueta recibe como parámetro
    public function indicador_valores_medicion($indicador, $etiqueta_medicion);

    //Devuelve el valor total del año  para la referencia que recibe como parámetro 
    //del indicador/dato con periodicidad intranual que también recibe como parámetro
    public function calcular_ref_anual($indicador, $valores_referencia, $anyo, $referencia);
}
