<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Borra la medición, los valores y los valores de referencia asociados a ella
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_medicion') AND filter_has_var(INPUT_GET, 'tipo') AND filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);

    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $tipo = filter_input(INPUT_GET, 'tipo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

    $medicion = new Medicion();
    $medicion->load("id = $id_medicion");
    $indicador = new Indicador();
    $indicador->load("id = $medicion->id_indicador");

    // Comprobamos si el usuario tiene autorización
    $usuario_entidad = new Usuario_entidad();
    if ($usuario_entidad->load("id_usuario=$usuario->id AND id_entidad=$indicador->id_entidad AND (id_rol = 1 OR id_rol =2)"))
    {
        $autorizado = true;
    }
    else if ($indicador->id_responsable == $usuario->id OR $indicador->id_responsable_medicion == $usuario->id)
    {
        $autorizado = true;
    }
    else
    {
        $autorizado = false;
    }

    if ($autorizado)
    {
        $adodb = $medicion->db();
        // Consulta para borrar los valores
        $query1 = "DELETE FROM valores WHERE id_medicion = $id_medicion;\n";

        // Consulta para borrar los registros relacionados de la tabla valor_referencia_medicion
        $query2 = "DELETE FROM valores_referencia_mediciones WHERE id_medicion = $id_medicion;\n";

        // Consulta para borrar la medición
        $query3 = "DELETE FROM mediciones WHERE id = $id_medicion;\n";

        // Comenzamos una transacción de manera que se borre todo o nada
        $adodb->StartTrans();
        $adodb->Execute($query1);
        $adodb->Execute($query2);
        $adodb->Execute($query3);
        if ($adodb->HasFailedTrans())
        {
            $error = ERR_OP_BD;
            $estado = "error=$error";
        }
        else
        {
            $aviso = MSG_MED_BORRADA;
            $estado = "aviso=$aviso";
        }
        $adodb->CompleteTrans();

        header("location:index.php?page=medicion_listar&id_{$tipo}=$indicador->id&id_entidad=$id_entidad&$estado");
    }
    else
    {
        $error = ERR_AUT;
        header("location:index.php?page=medicion_editar&id_medicion=$id_medicion&id_entidad=$id_entidad&tipo=$tipo&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?error=$error");
}

