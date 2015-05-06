<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: medicion_generar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Genera las mediciones de un Indicador/Dato para el año actual en 
// función de su periodicidad
//------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_indicador'))
{
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $tipo = "indicador";
}
else if (filter_has_var(INPUT_GET, 'id_dato'))
{
    $id_indicador = filter_input(INPUT_GET, 'id_dato', FILTER_SANITIZE_NUMBER_INT);
    $tipo = "dato";
}
else
{
    $error = ERR_MED_CREAR;
    header("location:index.php?page=entidad_listar&error=$error");
}

$valor_referencia = new Valor_referencia();
$valores_referencia = $valor_referencia->Find("id_indicador = $id_indicador");

$smarty->assign("valores_referencia", $valores_referencia);

$indicador = new Indicador;
if ($indicador->load("id = $id_indicador"))
{
    $id_entidad = $indicador->id_entidad;

    //comprobar permisos para cambiar mediciones tanto para responsables del
    //indicador como de la medición o responsables de la unidad
    if ($control OR $indicador->id_responsable == $usuario->id
            OR $indicador->id_responsable_medicion == $usuario->id)
    {
        $permiso_generar = true;
    }
    else
    {
        $permiso_generar = false;
    }

    if ($permiso_generar)
    {
        generar_mediciones($indicador, $tipo);
        //        generar_mediciones_indicadores_dependientes($indicador, $tipo);
    }
    else
    {
        // El usuario no tiene permisos avisamos error
        $error = ERR_MED_AUT . " $tipo";
        header("Location:index.php?page=" . $tipo . "_mostrar&id_$tipo=$id_indicador&error=$error");
    }
}
else
{
    $error = "$tipo " . ERR_MED_TIPO_NO_BD;
    header("location:index.php?error=$error");
}

//-----------------------------------------------------------------
//GENERACIÓN DE MEDICIONES
//-----------------------------------------------------------------
//Genera las mediciones de un Indicador/Dato para el año actual en 
//función de su periodicidad
function generar_mediciones($indicador, $tipo)
{
    //Generamos mediciones en función de la periodicidad
    //Anual
    if ($indicador->periodicidad == 'Anual')
    {
        generar_medicion_anual($indicador, $tipo);
    }
    //Semestral
    else if ($indicador->periodicidad == 'Semestral')
    {
        generar_mediciones_semestrales($indicador, $tipo);
    }
    //Cuatrimestral
    else if ($indicador->periodicidad == 'Cuatrimestral')
    {
        generar_mediciones_cuatrimestrales($indicador, $tipo);
    }
    //Trimestral
    else if ($indicador->periodicidad == 'Trimestral')
    {
        generar_mediciones_trimestrales($indicador, $tipo);
    }
    //Mensual
    else
    {
        generar_mediciones_mensuales($indicador, $tipo);
    }
}

//Genera una medición Anual
function generar_medicion_anual($indicador, $tipo)
{
    $medicion = new Medicion();
    $etiqueta = Date('Y');
    //Comprobamos primero si ya exite la medición
    if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
    {
        $aviso = MSG_MED_EXISTE;
        header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
    }
    else
    {
        $periodo_inicio = Date('Y') . '-01-01';
        $periodo_fin = Date('Y') . '-12-31';
        $medicion->id_indicador = $indicador->id;
        $medicion->periodo_inicio = $periodo_inicio;
        $medicion->periodo_fin = $periodo_fin;
        $medicion->grabacion_inicio = $periodo_inicio;
        $medicion->grabacion_fin = $periodo_fin;
        $medicion->etiqueta = $etiqueta;
        $medicion->observaciones = '';
        $medicion->save();
        // Generamos un valor en blanco para cada una de las unidades 
        // asociadas al Indicador/Dato en la medición dada
        generar_valores_medicion($medicion);
        //Generamos valores de referencia para la medición
        generar_valores_referencia_medicion($medicion);

        $aviso = MSG_MEDS_GENERADA;
        header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
    }
}

//Genera las mediciones Semestrales
function generar_mediciones_semestrales($indicador, $tipo)
{
    for ($i = 1; $i != 3; $i++)
    {
        generar_medicion_semestral($indicador, $tipo, $i);
    }
}

//Genera una medición semestral
function generar_medicion_semestral($indicador, $tipo, $indice)
{
    $medicion = new Medicion();
    $etiqueta = Date('Y') . '.' . $indice . 'S';
    //Comprobamos primero si ya exite la medición
    if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
    {
        $aviso = MSG_MED_EXISTE;
        header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
    }
    else
    {
        if ($indice == 1)
        {
            $periodo_inicio = Date('Y') . '-01-01';
            $periodo_fin = Date('Y') . '-06-30';
        }
        else
        {
            $periodo_inicio = Date('Y') . '-07-01';
            $periodo_fin = Date('Y') . '-12-31';
        }
        $medicion->id_indicador = $indicador->id;
        $medicion->periodo_inicio = $periodo_inicio;
        $medicion->periodo_fin = $periodo_fin;
        $medicion->grabacion_inicio = $periodo_inicio;
        $medicion->grabacion_fin = $periodo_fin;
        $medicion->etiqueta = $etiqueta;
        $medicion->observaciones = '';
        $medicion->save();
        // Generamos un valor en blanco para cada una de las unidades 
        // asociadas al Indicador/Dato en la medición dada
        generar_valores_medicion($medicion);
        //Generamos valores de referencia para la medición
        generar_valores_referencia_medicion($medicion);

        $aviso = MSG_MEDS_GENERADA;
        header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
    }
}

//Genera las mediciones cuatrimestrales 
function generar_mediciones_cuatrimestrales($indicador, $tipo)
{
    for ($i = 1; $i != 4; $i++)
    {
        generar_medicion_cuatrimestral($indicador, $tipo, $i);
    }
}

//Genera una medición cuatrimestral
function generar_medicion_cuatrimestral($indicador, $tipo, $indice)
{
    $medicion = new Medicion();
    $etiqueta = Date('Y') . '.' . $indice . 'C';
    //Comprobamos primero si ya exite la medición
    if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
    {
        $aviso = MSG_MED_EXISTE;
        header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
    }
    else
    {
        if ($indice == 1)
        {
            $periodo_inicio = Date('Y') . '-01-01';
            $periodo_fin = Date('Y') . '-04-30';
        }
        else if ($indice == 2)
        {
            $periodo_inicio = Date('Y') . '-05-01';
            $periodo_fin = Date('Y') . '-08-31';
        }
        else
        {
            $periodo_inicio = Date('Y') . '-09-01';
            $periodo_fin = Date('Y') . '-12-31';
        }
        $medicion->id_indicador = $indicador->id;
        $medicion->periodo_inicio = $periodo_inicio;
        $medicion->periodo_fin = $periodo_fin;
        $medicion->grabacion_inicio = $periodo_inicio;
        $medicion->grabacion_fin = $periodo_fin;
        $medicion->etiqueta = $etiqueta;
        $medicion->observaciones = '';
        $medicion->save();
        // Generamos un valor en blanco para cada una de las unidades 
        // asociadas al Indicador/Dato en la medición dada
        generar_valores_medicion($medicion);
        //Generamos valores de referencia para la medición
        generar_valores_referencia_medicion($medicion);

        $aviso = MSG_MEDS_GENERADA;
        header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
    }
}

//Genera las mediciones trimestrales 
function generar_mediciones_trimestrales($indicador, $tipo)
{
    for ($i = 1; $i != 5; $i++)
    {
        generar_medicion_trimestral($indicador, $tipo, $i);
    }
}

//Genera una medición trimestral
function generar_medicion_trimestral($indicador, $tipo, $indice)
{
    $medicion = new Medicion();
    $etiqueta = Date('Y') . '.' . $indice . 'T';
    //Comprobamos primero si ya exite la medición
    if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
    {
        $aviso = MSG_MED_EXISTE;
        header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
    }
    else
    {
        if ($indice == 1)
        {
            $periodo_inicio = Date('Y') . '-01-01';
            $periodo_fin = Date('Y') . '-03-31';
        }
        else if ($indice == 2)
        {
            $periodo_inicio = Date('Y') . '-04-01';
            $periodo_fin = Date('Y') . '-06-30';
        }
        else if ($indice == 3)
        {
            $periodo_inicio = Date('Y') . '-07-01';
            $periodo_fin = Date('Y') . '-09-30';
        }
        else
        {
            $periodo_inicio = Date('Y') . '-10-01';
            $periodo_fin = Date('Y') . '-12-31';
        }
        $medicion->id_indicador = $indicador->id;
        $medicion->periodo_inicio = $periodo_inicio;
        $medicion->periodo_fin = $periodo_fin;
        $medicion->grabacion_inicio = $periodo_inicio;
        $medicion->grabacion_fin = $periodo_fin;
        $medicion->etiqueta = $etiqueta;
        $medicion->observaciones = '';
        $medicion->save();
        // Generamos un valor en blanco para cada una de las unidades 
        // asociadas al Indicador/Dato en la medición dada
        generar_valores_medicion($medicion);
        //Generamos valores de referencia para la medición
        generar_valores_referencia_medicion($medicion);

        $aviso = MSG_MEDS_GENERADA;
        header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
    }
}

//Genera las mediciones mensuales
function generar_mediciones_mensuales($indicador, $tipo)
{
    for ($i = 1; $i != 13; $i++)
    {
        generar_medicion_mensual($indicador, $tipo, $i);
    }
}

//Genera una medición mensual
function generar_medicion_mensual($indicador, $tipo, $indice)
{
    $medicion = new Medicion();
    if ($indice < 10)
    {
        $etiqueta = Date('Y') . '.0' . $indice;
    }
    else
    {
        $etiqueta = Date('Y') . '.' . $indice;
    }
    //Comprobamos primero si ya exite la medición
    if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
    {
        $aviso = MSG_MED_EXISTE;
        header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
    }
    else
    {
        if ($indice == 1)
        {
            $periodo_inicio = Date('Y') . '-01-01';
            $periodo_fin = Date('Y') . '-01-31';
        }
        else if ($indice == 2)
        {
            $periodo_inicio = Date('Y') . '-02-01';
            if (esBisiesto(Date('Y')))
            {
                $periodo_fin = Date('Y') . '-02-29';
            }
            else
            {
                $periodo_fin = Date('Y') . '-02-28';
            }
        }
        else if ($indice == 3)
        {
            $periodo_inicio = Date('Y') . '-03-01';
            $periodo_fin = Date('Y') . '-03-31';
        }
        else if ($indice == 4)
        {
            $periodo_inicio = Date('Y') . '-04-01';
            $periodo_fin = Date('Y') . '-04-30';
        }
        else if ($indice == 5)
        {
            $periodo_inicio = Date('Y') . '-05-01';
            $periodo_fin = Date('Y') . '-05-31';
        }
        else if ($indice == 6)
        {
            $periodo_inicio = Date('Y') . '-06-01';
            $periodo_fin = Date('Y') . '-06-30';
        }
        else if ($indice == 7)
        {
            $periodo_inicio = Date('Y') . '-07-01';
            $periodo_fin = Date('Y') . '-07-31';
        }
        else if ($indice == 8)
        {
            $periodo_inicio = Date('Y') . '-08-01';
            $periodo_fin = Date('Y') . '-08-31';
        }
        else if ($indice == 9)
        {
            $periodo_inicio = Date('Y') . '-09-01';
            $periodo_fin = Date('Y') . '-09-30';
        }
        else if ($indice == 10)
        {
            $periodo_inicio = Date('Y') . '-10-01';
            $periodo_fin = Date('Y') . '-10-31';
        }
        else if ($indice == 11)
        {
            $periodo_inicio = Date('Y') . '-11-01';
            $periodo_fin = Date('Y') . '-11-30';
        }
        else
        {
            $periodo_inicio = Date('Y') . '-12-01';
            $periodo_fin = Date('Y') . '-12-31';
        }
        $medicion->id_indicador = $indicador->id;
        $medicion->periodo_inicio = $periodo_inicio;
        $medicion->periodo_fin = $periodo_fin;
        $medicion->grabacion_inicio = $periodo_inicio;
        $medicion->grabacion_fin = $periodo_fin;
        $medicion->etiqueta = $etiqueta;
        $medicion->observaciones = '';
        $medicion->save();
        // Generamos un valor en blanco para cada una de las unidades 
        // asociadas al Indicador/Dato en la medición dada
        generar_valores_medicion($medicion);
        //Generamos valores de referencia para la medición
        generar_valores_referencia_medicion($medicion);

        $aviso = MSG_MEDS_GENERADA;
        header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
    }
}

// Genera un valor en blanco para cada una de las unidades asociadas 
// al Indicador/Dato en la medición dada
function generar_valores_medicion($medicion)
{
    $indicador_subunidad = new Indicador_subunidad();
    $indicadores_subunidades = $indicador_subunidad->Find("id_indicador = $medicion->id_indicador");
    foreach ($indicadores_subunidades as $indicador_subunidad)
    {
        $valor = new Valor();
        $valor->id_entidad = $indicador_subunidad->id_entidad;
        $valor->id_medicion = $medicion->id;
        $valor->activo = 1;
        $valor->save();
    }
}

//Genera los valores de referencia para una medición de un Indicador/Dato
function generar_valores_referencia_medicion($medicion)
{
    //Valores de referencia
    $valor_referencia = new Valor_referencia();
    $valores_referencia = $valor_referencia->Find("id_indicador = $medicion->id_indicador");
    foreach ($valores_referencia as $valor_referencia)
    {
        $valor_referencia_medicion = new Valor_referencia_medicion();
        $valor_referencia_medicion->id_valor_referencia = $valor_referencia->id;
        $valor_referencia_medicion->valor = NULL;
        $valor_referencia_medicion->id_medicion = $medicion->id;
        $valor_referencia_medicion->save();
    }
}

//Calcula si un año es o no bisiesto
function esBisiesto($year)
{
    if ((!($year % 4) && ($year % 100)) || !($year % 400))
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
