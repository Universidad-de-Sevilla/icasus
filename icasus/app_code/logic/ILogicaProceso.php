<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: logic/ILogicaProceso.php
// Tipo: definicion de Interfaz
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Interface que contendra los métodos para la Lógica de Negocio 
// de los Procesos en Icasus.
//--------------------------------------------------------------------------

interface ILogicaProceso
{

    //Comprueba los permisos del usuario sobre un proceso
    public function comprobar_responsable_proceso($id_usuario, $proceso);
}
