<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: logic/ILogicaValores.php
// Tipo: definicion de Interfaz
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Interface que contendra los métodos para la Lógica de Negocio 
// de los Valores en Icasus.
//--------------------------------------------------------------------------

interface ILogicaValores
{

    //Calcula la media del conjunto de valores que recibe como parámetro.
    public function media($valores);

    //Calcula el sumatorio del conjunto de valores que recibe como parámetro.
    public function sumatorio($valores);

    //Calcula el máximo del conjunto de valores que recibe como parámetro.
    public function maximo($valores);

    //Calcula la mediana del conjunto de valores que recibe como parámetro.
    public function mediana($valores);

    //Calcula el total de forma manual tomando el valor de la Unidad madre 
    //del indicador/dato del conjunto de valores que recibe como parámetro.
    public function manual($indicador, $valores);
}
