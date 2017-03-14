<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: logic/LogicaProceso.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Clase que implementa los métodos para la Lógica de Negocio 
// de los Procesos en Icasus.
//--------------------------------------------------------------------------

class LogicaProceso implements ILogicaProceso
{

    //Comprueba los permisos del usuario sobre un proceso
    public function comprobar_responsable_proceso($id_usuario, $proceso)
    {
        //Propietarios de los procesos
        if ($proceso->id_propietario == $id_usuario)
        {
            return true;
        }
        //Comprobamos la herencia para los subprocesos
        if ($proceso->madre->id > 0)
        {
            return $this->comprobar_responsable_proceso($id_usuario, $proceso->madre);
        }
        return false;
    }

}
