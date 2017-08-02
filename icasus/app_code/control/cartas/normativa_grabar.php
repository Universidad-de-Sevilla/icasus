<?php

global $usuario;

if (filter_has_var(INPUT_POST, 'id_carta')
    && filter_has_var(INPUT_POST, 'nombre')
    && filter_has_var(INPUT_POST, 'enlace')
) {
    $normativa = new Normativa();
    $carta = new Carta();
    $exito = MSG_NORMATIVA_CREADA;
    // Si viene el id es que estamos editando una Normativa existente
    if (filter_has_var(INPUT_POST, 'id_normativa')) {
        $id_normativa = filter_input(INPUT_POST, 'id_normativa', FILTER_SANITIZE_NUMBER_INT);
        $exito = MSG_NORMATIVA_EDITADA;
        if ($normativa->load("id = $id_normativa") == false) {
            $error = ERR_NORMATIVA_EDIT;
            header("Location: index.php?page=error&error=error");
        }
    }
    $id_carta = filter_input(INPUT_POST, 'id_carta', FILTER_SANITIZE_NUMBER_INT);
    $carta->load("id = $id_carta");
    $normativa->id_carta = $id_carta;
    $normativa->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $normativa->enlace = filter_input(INPUT_POST, 'enlace', FILTER_SANITIZE_URL);
    $normativa->save();
    header("Location: index.php?page=normativa_mostrar&id_entidad=$carta->id_entidad&id_normativa=$normativa->id&exito=$exito");
} else {
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=error");
}
