<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cartas/servicio_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un Servicio
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_servicio') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $id_servicio = filter_input(INPUT_GET, 'id_servicio', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos del Servicio
    $servicio = new Servicio();
    if ($servicio->load_joined("id = $id_servicio"))
    {
        $carta = $servicio->carta;
        $compromiso = new Compromiso();
        $compromisos_servicio = $compromiso->Find("id_servicio=$id_servicio");
        if (!$compromisos_servicio && $control)
        {
            $exito = MSG_SERVICIO_BORRADO . ' S.' . $servicio->indice . '. ' . $servicio->nombre;
            $servicio->delete();

            header("Location: index.php?page=carta_mostrar&id_carta=$carta->id&id_entidad=$id_entidad&exito=$exito#carta_servicios");
        }
        else
        {
            $aviso = MSG_SERVICIO_BORRAR;
            header("Location: index.php?page=servicio_mostrar&id_servicio=$id_servicio&id_entidad=$id_entidad&aviso=$aviso");
        }
    }
    else
    {
        $error = ERR_SERVICIO_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=$error");
}
