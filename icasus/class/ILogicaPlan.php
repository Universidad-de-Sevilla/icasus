<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/ILogicaPlan.php
// Tipo: definicion de Interfaz
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Interface que contendra los métodos para la Lógica de Negocio 
// de los Planes Estratégicos en Icasus.
//--------------------------------------------------------------------------

interface ILogicaPlan
{

    //Actualiza los grados de ejecución de un plan cuando se graban valores 
    //en los objetivos operacionales. Recibe el identificador del objetivo 
    //estratégico y el año de la ejecución.
    public function actualizar_ejecucion_anual($id_objest, $anyo);

    //Actualiza los grados globales de ejecución de un plan al que pertenece
    //el identificador de objetivo operacional que recibe como parámetro
    public function actualizar_ejecucion_global($id_objop);

    //Actualiza el grado de ejecucion global del objetivo estratégico cuyo 
    //identificador recibe como parámetro
    public function actualizar_ejecucion_global_objest($id_objest);
}
