<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/ILogicaUsuario.php
// Tipo: definicion de Interfaz
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Interface que contendra los métodos para la Lógica de Negocio 
// de los Usuario en Icasus.
//--------------------------------------------------------------------------

interface ILogicaUsuario
{

    //Devuelve el rol que ocupa el usuario (parámetro) para la 
    //entidad cuyo identificador tambien recibe como parámetro
    public function getRol($usuario, $id_entidad);
}
