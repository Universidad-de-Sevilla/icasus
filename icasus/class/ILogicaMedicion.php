<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/ILogicaMedicion.php
// Tipo: definicion de Interfaz
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Interface que contendra los métodos para la Lógica de Negocio 
// de las Mediciones en Icasus.
//--------------------------------------------------------------------------

interface ILogicaMedicion
{

    // Genera un valor nulo para cada una de las unidades asociadas 
    // al Indicador/Dato en la medición dada que recibe como parámetro
    public function generar_valores_medicion($medicion);

    // Actualiza las unidades asociadas al Indicador/Dato en la 
    // medición dada que recibe como parámetro y en función de la lista de 
    // unidades que también recibe como parámetro
    public function actualizar_subunidades_medicion($medicion);

    //Genera valores nulos para los valores de referencia de la medición que 
    //recibe como parámetro de un Indicador/Dato
    public function generar_valores_referencia_medicion($medicion);

    //Devuelve el status para una medición en función de su estimación(inverso),
    //su valor total y sus valores de referencia
    public function calcular_status_medicion($inverso, $valor, $limite, $meta);

    //Borra todos los valores de la medición cuyo identificador recibe 
    //como parámetro
    public function borrar_valores_medicion($id);
}
