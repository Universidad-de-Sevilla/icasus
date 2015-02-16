<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicador_datos_informe.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra todos los parametros de un indicador y la gráfica de los valores introducidos
//---------------------------------------------------------------------------------------------------
global $basedatos;

//if (isset($_GET['id_indicador']))
if (filter_has_var(INPUT_GET, 'id_indicador'))
{
//	$id_indicador = sanitize($_GET['id_indicador'],16); 
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $indicador = new Indicador($basedatos);
    $indicador->obtener_datos($id_indicador);
    $valores = $indicador->listar_valores($id_indicador);
    $entidad = new Entidad($basedatos);
    $entidad->obtener_datos($indicador->datos['id_entidad']);
    $_nombre_pagina = utf8_encode($entidad->datos['nombre']);
//empezamos el rtf
    $null = null;
//defino los tips de letra
    $arial8 = new Font(8, 'Arial', '#000000');
    $arial8azul = new Font(8, 'Arial', '#0077aa');
//defino el formato de los parrafos
    $parF = new ParFormat('left');
//creo el objeto rtf
    $rtf = new Rtf();
//creamos la cabecera
    $header = &$rtf->addHeader('all');
    $header->addImage('theme/usevilla/logo.jpg', $null);
    $header->writeText('<tab>' . TXT_INDIC_PROP . utf8_decode($_nombre_pagina) . '<tab><chdate>', new Font(), new ParFormat('right'));
//configuración de tamaño y márgenes de la página
    $sect = &$rtf->addSection();
    $sect->setPaperWidth(21);
    $sect->setPaperHeight(29.5);
    $marginTop = 2;
    $marginBottom = 2;
    $marginLeft = 3;
    $marginRight = 3;
    $sect->setMargins($marginLeft, $marginTop, $marginRight, $marginBottom);
    $sect->writeText(' ', $null, $null);
    $table = &$sect->addTable();
//Añado 12 filas de altura 1
    $table->addRows(13, 0.5);
//Divido las filas en 2 columnas de 2 y 10 de ancho
    $table->addColumnsList(array(4, 12));
//Relleno la tabla
    $table->writeToCell(1, 1, FIELD_COD . ' ' . FIELD_PROC . ':', $arial8azul, $null);
    $table->writeToCell(1, 2, $indicador->datos['codigo_proceso'], $arial8, $null);

    $table->writeToCell(2, 1, FIELD_NOMBRE . ' ' . FIELD_PROC . ':', $arial8azul, $null);
    $table->writeToCell(2, 2, $indicador->datos['proceso'], $arial8, $null);

    $table->writeToCell(3, 1, FIELD_COD . ' ' . FIELD_INDIC . ':', $arial8azul, $null);
    $table->writeToCell(3, 2, $indicador->datos['codigo'], $arial8, $null);

    $table->writeToCell(4, 1, FIELD_DATOS . ' ' . FIELD_INDIC . ':', $arial8azul, $null);
    $table->writeToCell(4, 2, $indicador->datos['nombre'], $arial8, $null);

    $table->writeToCell(5, 1, FIELD_DESC . ':', $arial8azul, $null);
    $table->writeToCell(5, 2, $indicador->datos['descripcion'], $arial8, $null);

    $table->writeToCell(6, 1, FIELD_FORM . ':', $arial8azul, $null);
    $table->writeToCell(6, 2, $indicador->datos['formulacion'], $arial8, $null);

    $table->writeToCell(7, 1, FIELD_OBJ . ':', $arial8azul, $null);
    $table->writeToCell(7, 2, $indicador->datos['objetivo'], $arial8, $null);

    $table->writeToCell(8, 1, FIELD_OBJP . ':', $arial8azul, $null);
    $table->writeToCell(8, 2, $indicador->datos['objetivo_estrategico'], $arial8, $null);

    $table->writeToCell(9, 1, FIELD_OBJC . ':', $arial8azul, $null);
    $table->writeToCell(9, 2, $indicador->datos['objetivo_carta'], $arial8, $null);

    $table->writeToCell(10, 1, FIELD_STANDARD . ':', $arial8azul, $null);
    $table->writeToCell(10, 2, 'estandar'/* $indicador->datos['estandar'] */, $arial8, $null);

    $table->writeToCell(11, 1, FIELD_FUENTE . ':', $arial8azul, $null);
    $table->writeToCell(11, 2, $indicador->datos['fuente'], $arial8, $null);

    $table->writeToCell(12, 1, FIELD_PERIOD . ':', $arial8azul, $null);
    $table->writeToCell(12, 2, $indicador->datos['periodicidad'], $arial8, $null);

    $table->writeToCell(13, 1, FIELD_RESP . ':', $arial8azul, $null);
    $table->writeToCell(13, 2, $indicador->datos['apellidos_responsable'] . ", " . $indicador->datos['nombre_responsable'], $arial8, $null);
//Gráfica del Indicador
    $sect->writeText(TXT_GRAFIC_INDIC_VAL, new Font(), $parF);
    $sect->addImage(IC_DIR_BASE . 'cache/indicador' . $id_indicador . '.png', $null);
//Pie de página
    $footer = &$rtf->addFooter('all');
    $footer->writeText(TXT_INFORME_IC . '<tab><tab>página <pagenum>', new Font(), new ParFormat('right'));

    $rtf->sendRtf(FIELD_INFORM . '_' . FIELD_INDIC . $id_indicador);
}
else
{
    echo ERR_INFORM_INDIC;
}


