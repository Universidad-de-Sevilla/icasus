<?php

//----------------------------------------------------------------------------------
// Proyecto: Icasus
// Fichero: entity/Usuario_entidad.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//----------------------------------------------------------------------------------
// Gestiona las entidades de un usuario y los usuarios de una entidad
//----------------------------------------------------------------------------------

class Usuario_entidad extends ADOdb_Active_Record
{

    public $_table = 'usuarios_entidades';
    public $asiste;
    public $entidad;
    public $rol;
    public $usuario;
    public $indicadores_entidad; //cuadromando_crear.php

    //Devuelve todas las entidades de un usuario con sus indicadores

    public function Find_entidades_indicadores($id_usuario)
    {
        $ues = $this->Find("id_usuario = $id_usuario");
        if ($ues)
        {
            foreach ($ues as $item)
            {

                $is = new Indicador_subunidad();
                $iss = $is->find_indicadores_con_valores("id_entidad = $item->id_entidad");
                $item->indicadores_entidad = $iss;

                $e = new Entidad();
                $e->load("id = $item->id_entidad");
                $item->entidad = $e;
            }
        }
        return $ues;
    }

    public function Find_entidades($condicion)
    {
        $usuarios_entidades = $this->Find($condicion);
        if ($usuarios_entidades)
        {
            foreach ($usuarios_entidades as $usuario_entidad)
            {
                $entidad = new Entidad();
                $entidad->load("id = $usuario_entidad->id_entidad");
                $usuario_entidad->entidad = $entidad;
                $usuario_entidad->rol = new Rol();
                $usuario_entidad->rol->load("id = $usuario_entidad->id_rol");
            }
            usort($usuarios_entidades, array($this, "compara_por_etiqueta"));
        }
        return $usuarios_entidades;
    }

    public function Find_usuarios($condicion)
    {
        $usuarios_entidades = $this->Find($condicion);
        if ($usuarios_entidades)
        {
            foreach ($usuarios_entidades as $usuario_entidad)
            {
                $usuario_entidad->usuario = new Usuario();
                $usuario_entidad->usuario->load("id = $usuario_entidad->id_usuario");
                $usuario_entidad->rol = new Rol();
                $usuario_entidad->rol->load("id = $usuario_entidad->id_rol");
            }
            usort($usuarios_entidades, array($this, "compara_por_apellidos"));
        }
        return $usuarios_entidades;
    }

    // Función auxiliar para devolver un listado de usuarios ordenados por apellidos
    // Se usa en: Find_usuarios()
    function compara_por_etiqueta($a, $b)
    {
        $al = strtolower($a->entidad->etiqueta);
        $bl = strtolower($b->entidad->etiqueta);
        if ($al == $bl)
        {
            return 0;
        }
        return ($al > $bl) ? +1 : -1;
    }

    // Función auxiliar para devolver un listado de usuarios ordenados por apellidos
    // Se usa en: Find_usuarios()
    function compara_por_apellidos($a, $b)
    {
        $al = strtolower($a->usuario->apellidos);
        $bl = strtolower($b->usuario->apellidos);
        if ($al == $bl)
        {
            return 0;
        }
        return ($al > $bl) ? +1 : -1;
    }

    //funcion para comprobrar los permisos de las actas
    public function acta_permisos($id_usuario, $id_entidad, $id_rol)
    {
        $permiso = $this->load('id_usuario =' . $id_usuario . ' AND id_entidad = ' . $id_entidad . ' AND id_rol = ' . $id_rol);
        return $permiso;
    }

    public function desasignar_usuario($id_entidad, $id_usuario)
    {
        if ($this->load("id_entidad = $id_entidad AND id_usuario = $id_usuario"))
        {
            if ($this->delete())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }

    // Permisos de usuarios
    public function permiso_crear_medicion($id_usuario, $id_entidad)
    {
        if ($this->load("id_usuario=$id_usuario AND id_entidad=$id_entidad AND (id_rol = 1 OR id_rol =2)"))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public function comprobar_responsable_entidad($id_usuario, $id_entidad)
    {
        //Permisos del usuario en la unidad
        if ($this->load("id_usuario=$id_usuario AND id_entidad=$id_entidad AND (id_rol = 1 OR id_rol =2)"))
        {
            return true;
        }
        //Comprobamos la herencia en las subunidades
        if ($id_entidad != 1)
        {
            $entidad = new Entidad();
            $entidad->load("id=$id_entidad");
            return $this->comprobar_responsable_entidad($id_usuario, $entidad->id_madre);
        }
        return false;
    }

}
