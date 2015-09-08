<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/LogicaUsuario.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Clase que implementa los métodos para la Lógica de Negocio 
// de los Usuarios en Icasus.
//--------------------------------------------------------------------------

class LogicaUsuario implements ILogicaUsuario
{

    //Devuelve el rol que ocupa el usuario (parámetro) para la 
    //entidad cuyo identificador tambien recibe como parámetro
    public function getRol($usuario, $id_entidad)
    {
        $rol = null;
        foreach ($usuario->entidades as $entidad_usuario)
        {
            if ($entidad_usuario->id_entidad == $id_entidad)
            {
                $rol = $entidad_usuario->rol->nombre;
            }
        }
        $entidad = new Entidad();
        $entidad->load("id=$id_entidad");
        if ($rol == null AND $entidad->id_madre != 0)
        {
            return $this->getRol($usuario, $entidad->id_madre);
        }
        return $rol;
    }

}
