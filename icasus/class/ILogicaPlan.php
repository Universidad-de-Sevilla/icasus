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
    //en los objetivos operacionales. Recibe el identificador de dicho objetivo 
    //y el año de la ejecución.
    public function actualizar_ejecucion_plan($id_objop, $anyo);
}
