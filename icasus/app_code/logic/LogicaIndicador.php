<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: logic/LogicaIndicador.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Clase que implementa los métodos para la Lógica de Negocio 
// de los Indicadores en Icasus.
//--------------------------------------------------------------------------

class LogicaIndicador implements ILogicaIndicador
{

    //Variable para llamar a la Lógica de Negocio de las Mediciones
    private $logicaMedicion;
    //Variable para llamar a la Lógica de Negocio de los Valores
    private $logicaValores;

    public function __construct()
    {
        $this->logicaMedicion = new LogicaMedicion();
        $this->logicaValores = new LogicaValores();
    }

    //--------------------------------------------------------------------------
    //UNIDADES
    //--------------------------------------------------------------------------
    //Borra todas las Unidades vinculadas al Indicador/Dato cuyo identificador 
    //recibe como parámetro
    public function borrar_unidades($id)
    {
        $indicador_subunidad = new Indicador_subunidad();
        while ($indicador_subunidad->load("id_indicador = $id"))
        {
            $indicador_subunidad->delete();
        }
    }

    //-----------------------------------------------------------------
    //MEDICIONES
    //-----------------------------------------------------------------
    //Genera las mediciones de un Indicador/Dato a partir de su Histórico.
    public function generar_mediciones($indicador, $anyo)
    {
        //Primero generamos mediciones para los Indicadores/Datos Calculados 
        //cuyo cálculo dependa del Indicador/Dato actual
        $this->generar_mediciones_indicadores_dependientes($indicador, $anyo);

        if ($indicador->periodicidad == 'Bienal')
        {
            for ($i = $anyo; $i < idate('Y') + 1; $i += 2)
            {
                $this->generar_medicion_bienal($indicador, $i);
            }
        }
        else
        {
            for ($i = $anyo; $i < idate('Y') + 1; $i++)
            {
                $this->generar_mediciones_por_anyo($indicador, $i);
            }
        }
    }

    //Genera mediciones para todos los Indicadores cuyo cálculo 
    //dependa del Indicador que recibe como parámetro
    private function generar_mediciones_indicadores_dependientes($indicador, $anyo)
    {
        $indicador_dependencia = new Indicador_dependencia();
        $indicadores_dependientes = $indicador_dependencia->Find("id_operando=$indicador->id");
        foreach ($indicadores_dependientes as $indicador_dependiente)
        {
            $indicador = new Indicador();
            $indicador->load("id=$indicador_dependiente->id_calculado");
            if ($indicador->id_proceso)
            {
                $this->generar_mediciones($indicador, $anyo);
            }
            else
            {
                $this->generar_mediciones($indicador, $anyo);
            }
        }
    }

    //Genera las mediciones de un Indicador/Dato para el año que recibe 
    //como parámetro en Indicadores/Datos con periodicidad Bienal.
    public function generar_medicion_bienal($indicador, $anyo)
    {
        $medicion = new Medicion();
        $etiqueta = $anyo . '-' . ($anyo + 1);
        //Comprobamos primero si ya exite la medición
        if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
        {
            $exito = MSG_MED_EXISTE;
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&exito=$exito");
        }
        else
        {
            $periodo_inicio = $anyo . '-01-01';
            $periodo_fin = $anyo + 1 . '-12-31';
            $grabacion_fin = $anyo + 2 . '-04-30';
            $medicion->id_indicador = $indicador->id;
            $medicion->periodo_inicio = $periodo_inicio;
            $medicion->periodo_fin = $periodo_fin;
            $medicion->grabacion_inicio = $periodo_inicio;
            $medicion->grabacion_fin = $grabacion_fin;
            $medicion->etiqueta = $etiqueta;
            $medicion->observaciones = '';
            $medicion->save();
            // Generamos un valor nulo para cada una de las unidades 
            // asociadas al Indicador/Dato en la medición dada
            $this->logicaMedicion->generar_valores_medicion($medicion);
            //Generamos valores de referencia para la medición
            $this->logicaMedicion->generar_valores_referencia_medicion($medicion);

            $exito = MSG_MED_GENERADA;
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&exito=$exito");
        }
    }

    //Genera las mediciones de un Indicador/Dato para el año que recibe 
    //como parámetro en función de su periodicidad.
    public function generar_mediciones_por_anyo($indicador, $anyo)
    {
        //Generamos mediciones en función de la periodicidad
        //Anual
        if ($indicador->periodicidad == 'Anual')
        {
            $this->generar_medicion_anual($indicador, $anyo);
        }
        //Semestral
        else if ($indicador->periodicidad == 'Semestral')
        {
            $this->generar_mediciones_semestrales($indicador, $anyo);
        }
        //Cuatrimestral
        else if ($indicador->periodicidad == 'Cuatrimestral')
        {
            $this->generar_mediciones_cuatrimestrales($indicador, $anyo);
        }
        //Trimestral
        else if ($indicador->periodicidad == 'Trimestral')
        {
            $this->generar_mediciones_trimestrales($indicador, $anyo);
        }
        //Mensual
        else
        {
            $this->generar_mediciones_mensuales($indicador, $anyo);
        }
    }

    //Genera una medición Anual
    private function generar_medicion_anual($indicador, $anyo)
    {
        $medicion = new Medicion();
        $etiqueta = $anyo;
        //Comprobamos primero si ya exite la medición
        if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
        {
            $exito = MSG_MED_EXISTE;
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&exito=$exito");
        }
        else
        {
            $periodo_inicio = $anyo . '-01-01';
            $periodo_fin = $anyo . '-12-31';
            $grabacion_fin = $anyo + 1 . '-04-30';
            $medicion->id_indicador = $indicador->id;
            $medicion->periodo_inicio = $periodo_inicio;
            $medicion->periodo_fin = $periodo_fin;
            $medicion->grabacion_inicio = $periodo_inicio;
            $medicion->grabacion_fin = $grabacion_fin;
            $medicion->etiqueta = $etiqueta;
            $medicion->observaciones = '';
            $medicion->save();
            // Generamos un valor nulo para cada una de las unidades 
            // asociadas al Indicador/Dato en la medición dada
            $this->logicaMedicion->generar_valores_medicion($medicion);
            //Generamos valores de referencia para la medición
            $this->logicaMedicion->generar_valores_referencia_medicion($medicion);

            $exito = MSG_MED_GENERADA;
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&exito=$exito");
        }
    }

    //Genera las mediciones Semestrales
    private function generar_mediciones_semestrales($indicador, $anyo)
    {
        for ($i = 1; $i != 3; $i++)
        {
            $this->generar_medicion_semestral($indicador, $anyo, $i);
        }
    }

    //Genera una medición semestral
    private function generar_medicion_semestral($indicador, $anyo, $indice)
    {
        $medicion = new Medicion();
        $etiqueta = $anyo . '.' . $indice . 'S';
        //Comprobamos primero si ya exite la medición
        if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
        {
            $exito = MSG_MED_EXISTE;
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&exito=$exito");
        }
        else
        {
            $periodo_inicio = array($anyo . '-01-01', $anyo . '-07-01');
            $periodo_fin = array($anyo . '-06-30', $anyo . '-12-31');
            if (Util::esBisiesto($anyo + 1))
            {
                $grabacion_fin = array($anyo . '-08-31', $anyo + 1 . '-02-29');
            }
            else
            {
                $grabacion_fin = array($anyo . '-08-31', $anyo + 1 . '-02-28');
            }
            $medicion->id_indicador = $indicador->id;
            $medicion->periodo_inicio = $periodo_inicio[$indice - 1];
            $medicion->periodo_fin = $periodo_fin[$indice - 1];
            $medicion->grabacion_inicio = $periodo_inicio[$indice - 1];
            $medicion->grabacion_fin = $grabacion_fin[$indice - 1];
            $medicion->etiqueta = $etiqueta;
            $medicion->observaciones = '';
            $medicion->save();
            // Generamos un valor en blanco para cada una de las unidades 
            // asociadas al Indicador/Dato en la medición dada
            $this->logicaMedicion->generar_valores_medicion($medicion);
            //Generamos valores de referencia para la medición
            $this->logicaMedicion->generar_valores_referencia_medicion($medicion);

            $exito = MSG_MED_GENERADA;
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&exito=$exito");
        }
    }

    //Genera las mediciones cuatrimestrales 
    private function generar_mediciones_cuatrimestrales($indicador, $anyo)
    {
        for ($i = 1; $i != 4; $i++)
        {
            $this->generar_medicion_cuatrimestral($indicador, $anyo, $i);
        }
    }

    //Genera una medición cuatrimestral
    private function generar_medicion_cuatrimestral($indicador, $anyo, $indice)
    {
        $medicion = new Medicion();
        $etiqueta = $anyo . '.' . $indice . 'C';
        //Comprobamos primero si ya exite la medición
        if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
        {
            $exito = MSG_MED_EXISTE;
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&exito=$exito");
        }
        else
        {
            $periodo_inicio = array($anyo . '-01-01', $anyo . '-05-01', $anyo . '-09-01');
            $periodo_fin = array($anyo . '-04-30', $anyo . '-08-31', $anyo . '-12-31');
            if (Util::esBisiesto($anyo + 1))
            {
                $grabacion_fin = array($anyo . '-06-30', $anyo . '-10-31', $anyo + 1 . '-02-29');
            }
            else
            {
                $grabacion_fin = array($anyo . '-06-30', $anyo . '-10-31', $anyo + 1 . '-02-28');
            }
            $medicion->id_indicador = $indicador->id;
            $medicion->periodo_inicio = $periodo_inicio[$indice - 1];
            $medicion->periodo_fin = $periodo_fin[$indice - 1];
            $medicion->grabacion_inicio = $periodo_inicio[$indice - 1];
            $medicion->grabacion_fin = $grabacion_fin[$indice - 1];
            $medicion->etiqueta = $etiqueta;
            $medicion->observaciones = '';
            $medicion->save();
            // Generamos un valor en blanco para cada una de las unidades 
            // asociadas al Indicador/Dato en la medición dada
            $this->logicaMedicion->generar_valores_medicion($medicion);
            //Generamos valores de referencia para la medición
            $this->logicaMedicion->generar_valores_referencia_medicion($medicion);

            $exito = MSG_MED_GENERADA;
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&exito=$exito");
        }
    }

    //Genera las mediciones trimestrales 
    private function generar_mediciones_trimestrales($indicador, $anyo)
    {
        for ($i = 1; $i != 5; $i++)
        {
            $this->generar_medicion_trimestral($indicador, $anyo, $i);
        }
    }

    //Genera una medición trimestral
    private function generar_medicion_trimestral($indicador, $anyo, $indice)
    {
        $medicion = new Medicion();
        $etiqueta = $anyo . '.' . $indice . 'T';
        //Comprobamos primero si ya exite la medición
        if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
        {
            $exito = MSG_MED_EXISTE;
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&exito=$exito");
        }
        else
        {
            $periodo_inicio = array($anyo . '-01-01', $anyo . '-04-01', $anyo . '-07-01', $anyo . '-10-01');
            $periodo_fin = array($anyo . '-03-31', $anyo . '-06-30', $anyo . '-09-30', $anyo . '-12-31');
            if (Util::esBisiesto($anyo + 1))
            {
                $grabacion_fin = array($anyo . '-05-31', $anyo . '-08-31', $anyo . '-11-30', $anyo + 1 . '-02-29');
            }
            else
            {
                $grabacion_fin = array($anyo . '-05-31', $anyo . '-08-31', $anyo . '-11-30', $anyo + 1 . '-02-28');
            }
            $medicion->id_indicador = $indicador->id;
            $medicion->periodo_inicio = $periodo_inicio[$indice - 1];
            $medicion->periodo_fin = $periodo_fin[$indice - 1];
            $medicion->grabacion_inicio = $periodo_inicio[$indice - 1];
            $medicion->grabacion_fin = $grabacion_fin[$indice - 1];
            $medicion->etiqueta = $etiqueta;
            $medicion->observaciones = '';
            $medicion->save();
            // Generamos un valor en blanco para cada una de las unidades 
            // asociadas al Indicador/Dato en la medición dada
            $this->logicaMedicion->generar_valores_medicion($medicion);
            //Generamos valores de referencia para la medición
            $this->logicaMedicion->generar_valores_referencia_medicion($medicion);

            $exito = MSG_MED_GENERADA;
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&exito=$exito");
        }
    }

    //Genera las mediciones mensuales
    private function generar_mediciones_mensuales($indicador, $anyo)
    {
        for ($i = 1; $i != 13; $i++)
        {
            $this->generar_medicion_mensual($indicador, $anyo, $i);
        }
    }

    //Genera una medición mensual
    private function generar_medicion_mensual($indicador, $anyo, $indice)
    {
        $medicion = new Medicion();
        if ($indice < 10)
        {
            $etiqueta = $anyo . '.0' . $indice;
        }
        else
        {
            $etiqueta = $anyo . '.' . $indice;
        }
        //Comprobamos primero si ya exite la medición
        if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
        {
            $exito = MSG_MED_EXISTE;
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&exito=$exito");
        }
        else
        {
            $periodo_inicio = array($anyo . '-01-01', $anyo . '-02-01',
                $anyo . '-03-01', $anyo . '-04-01', $anyo . '-05-01',
                $anyo . '-06-01', $anyo . '-07-01', $anyo . '-08-01',
                $anyo . '-09-01', $anyo . '-10-01', $anyo . '-11-01',
                $anyo . '-12-01');
            //Si el año es bisiesto añadimos un día a Febrero
            if (Util::esBisiesto($anyo))
            {
                $periodo_fin = array($anyo . '-01-31', $anyo . '-02-29',
                    $anyo . '-03-31', $anyo . '-04-30',
                    $anyo . '-05-31', $anyo . '-06-30',
                    $anyo . '-07-31', $anyo . '-08-31',
                    $anyo . '-09-30', $anyo . '-10-31',
                    $anyo . '-11-30', $anyo . '-12-31');
                $grabacion_fin = array($anyo . '-02-29', $anyo . '-03-31',
                    $anyo . '-04-30', $anyo . '-05-31',
                    $anyo . '-06-30', $anyo . '-07-31',
                    $anyo . '-08-31', $anyo . '-09-30',
                    $anyo . '-10-31', $anyo . '-11-30',
                    $anyo . '-12-31', $anyo + 1 . '-01-31');
            }
            else
            {
                $periodo_fin = array($anyo . '-01-31', $anyo . '-02-28',
                    $anyo . '-03-31', $anyo . '-04-30',
                    $anyo . '-05-31', $anyo . '-06-30',
                    $anyo . '-07-31', $anyo . '-08-31',
                    $anyo . '-09-30', $anyo . '-10-31',
                    $anyo . '-11-30', $anyo . '-12-31');
                $grabacion_fin = array($anyo . '-02-28', $anyo . '-03-31',
                    $anyo . '-04-30', $anyo . '-05-31',
                    $anyo . '-06-30', $anyo . '-07-31',
                    $anyo . '-08-31', $anyo . '-09-30',
                    $anyo . '-10-31', $anyo . '-11-30',
                    $anyo . '-12-31', $anyo + 1 . '-01-31');
            }
            $medicion->id_indicador = $indicador->id;
            $medicion->periodo_inicio = $periodo_inicio[$indice - 1];
            $medicion->periodo_fin = $periodo_fin[$indice - 1];
            $medicion->grabacion_inicio = $periodo_inicio[$indice - 1];
            $medicion->grabacion_fin = $grabacion_fin[$indice - 1];
            $medicion->etiqueta = $etiqueta;
            $medicion->observaciones = '';
            $medicion->save();
            // Generamos un valor en blanco para cada una de las unidades 
            // asociadas al Indicador/Dato en la medición dada
            $this->logicaMedicion->generar_valores_medicion($medicion);
            //Generamos valores de referencia para la medición
            $this->logicaMedicion->generar_valores_referencia_medicion($medicion);

            $exito = MSG_MED_GENERADA;
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&exito=$exito");
        }
    }

    //Borra del Indicador/Dato que recibe como parámetro la medición cuyo 
    //identificador recibe también como parámetro.
    public function borrar_medicion($indicador, $id_medicion)
    {
        $medicion = new Medicion();
        $medicion->load("id = $id_medicion");
        $sin_dependencias = true;
        //Comprobar si el indicador influye en otros si es asi no se podra borrar la medicion
        $indicadores_dependientes = $this->calcular_influencias($indicador->id);
        //Si influye comprobamos las mediciones existentes
        if ($indicadores_dependientes)
        {
            foreach ($indicadores_dependientes as $indicador_dependiente)
            {
                $mediciones = $medicion->Find("id_indicador = $indicador_dependiente->id ORDER BY periodo_inicio");
                foreach ($mediciones as $med)
                {
                    if ($med->etiqueta === $medicion->etiqueta)
                    {
                        $sin_dependencias = false;
                    }
                }
            }
        }
        //Si no influye podemos borrar
        if ($sin_dependencias)
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
                $exito = MSG_MED_BORRADA;
                $estado = "exito=$exito";
            }
            $adodb->CompleteTrans();
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&$estado");
        }
        else
        {
            $aviso = ERR_MED_BORRAR;
            $estado = "aviso=$aviso";
            header("location:index.php?page=medicion_listar&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&$estado");
        }
    }

    //-----------------------------------------------------------------------------
    // FUNCIONES PARA EL CÁLCULO DE TOTALES
    // EN INDICADORES/DATOS
    //-----------------------------------------------------------------------------
    //Calcula el total del indicador que recibe como parámetro para el conjunto 
    //de valores que también recibe como parámetro y en función de su tipo de agregación 
    //por defecto devolverá null.
    public function calcular_total($indicador, $valores, $etiqueta)
    {
        $total = null;
        //Significa que la medición no es centralizada
        if ($valores)
        {
            if (count($valores) > 1)
            {
                $total = $this->calcular_total_agregacion($indicador, $valores, $etiqueta);
            }
            //La medición esta centralizada por tanto sólo tenemos un valor
            else
            {
                $total = $valores[0]->valor;
            }
        }
        return $total;
    }

    private function calcular_total_agregacion($indicador, $valores, $etiqueta)
    {
        switch ($indicador->id_tipo_agregacion)
        {
            //Media
            case 1:
                {
                    return $this->logicaValores->media($valores);
                }
            //Sumatorio
            case 2:
                {
                    return $this->logicaValores->sumatorio($valores);
                }
            //Máximo
            case 3:
                {
                    return $this->logicaValores->maximo($valores);
                }
            //Manual
            case 4:
                {
                    //Cálculo real de la mediana de los valores, no utilizado.
                    //return $this->logicaValores->mediana($valores);
                    //Recoge el total del valor que tenga la Unidad madre
                    return $this->logicaValores->manual($indicador, $valores);
                }
            //Heredado de sus influyentes (sólo en indicadores/datos calculados)
            case 6:
                {
                    return $this->calcular_total_heredado($indicador, $etiqueta);
                }
            default:return null;
        }
    }

    //Calcula el total del indicador que recibe como parámetro del total de sus
    //indicadores inluyentes que también recibe como parámetros
    private function calcular_total_heredado($indicador, $etiqueta)
    {
        // Recorremos la cadena $calculo para sacar y calcular las variables
        // Almacenamos el resultado en $formula
        $es_variable = false;
        $formula = "";
        $calculo = str_split($indicador->calculo);
        foreach ($calculo as $elemento)
        {
            if ($elemento == "[")
            {
                $variable = "";
                $es_variable = true;
                continue;
            }
            if ($elemento == "]")
            {
                if (is_numeric($variable))
                {
                    $id_operando = (int) $variable;
                    $operando = new Indicador();
                    $operando->Load("id=$id_operando");
                    $valores = $this->indicador_valores_medicion($operando, $etiqueta);
                    $valor_total = $this->calcular_total($operando, $valores, $etiqueta);
                    //Si no se puede calcular un operando devolvemos null para evitar
                    //errores de parseo
                    if ($valor_total === NULL)
                    {
                        return NULL;
                    }
                    else
                    {
                        $formula .= "$valor_total";
                    }
                }
                $es_variable = false;
                continue;
            }
            if ($es_variable)
            {
                $variable .= $elemento;
            }
            else
            {
                $formula .= $elemento;
            }
        }
        // Calcula el resultado de la formula y guarda el valor final 
        eval("\$valor_final = $formula;");
        $total = $valor_final;
        return $total;
    }

    //Calcula el total anual del indicador/dato que recibe como parámetro para la 
    //unidad/subunidad y el año que también recibe parámetros
    //y en función de su tipo de agregación 
    public function calcular_total_temporal($indicador, $subunidad, $anyo)
    {
        switch ($indicador->id_tipo_agregacion_temporal)
        {
            //Media
            case 1:
                {
                    return $this->calcular_total_temporal_media($indicador, $subunidad, $anyo);
                }
            //Sumatorio
            case 2:
                {
                    return $this->calcular_total_temporal_sumatorio($indicador, $subunidad, $anyo);
                }
            //Máximo
            case 3:
                {
                    return $this->calcular_total_temporal_maximo($indicador, $subunidad, $anyo);
                }
            //Evolutivo
            case 5:
                {
                    return $this->calcular_total_temporal_evolutivo($indicador, $subunidad, $anyo);
                }
            default:return null;
        }
    }

    //Calcula el total anual para un indicador/dato con agregacion temporal: media
    private function calcular_total_temporal_media($indicador, $subunidad, $anyo)
    {
        //Si es el total en un indicador/dato agregado
        if ($indicador->id_tipo_agregacion != 0 && $indicador->id_tipo_agregacion != 4 && $subunidad->id == $indicador->id_entidad)
        {
            $medicion = new Medicion();
            $valor = new Valor();
            $totales = array();
            $mediciones = $medicion->Find("id_indicador = $indicador->id AND etiqueta LIKE '$anyo%' ORDER BY periodo_inicio DESC");
            foreach ($mediciones as $medicion)
            {
                $valores = $valor->Find("id_medicion=$medicion->id");
                $total = $this->calcular_total($indicador, $valores, $medicion->etiqueta);
                $valor_total = new Valor();
                $valor_total->valor = $total;
                array_push($totales, $valor_total);
            }
            return $this->logicaValores->media($totales);
        }
        else
        {

            $valores = array();
            //Tomamos sólo los valores del año
            foreach ($subunidad->mediciones as $medicion)
            {
                if (strpos($medicion->etiqueta, '' . $anyo . '') !== false)
                {
                    array_push($valores, $medicion->medicion_valor);
                }
            }
            return $this->logicaValores->media($valores);
        }
    }

    //Calcula el total anual para un indicador/dato con agregacion temporal: sumatorio
    private function calcular_total_temporal_sumatorio($indicador, $subunidad, $anyo)
    {
        //Si es el total en un indicador/dato agregado
        if ($indicador->id_tipo_agregacion != 0 && $indicador->id_tipo_agregacion != 4 && $subunidad->id == $indicador->id_entidad)
        {
            $medicion = new Medicion();
            $valor = new Valor();
            $totales = array();
            $mediciones = $medicion->Find("id_indicador = $indicador->id AND etiqueta LIKE '$anyo%' ORDER BY periodo_inicio DESC");
            foreach ($mediciones as $medicion)
            {
                $valores = $valor->Find("id_medicion=$medicion->id");
                $total = $this->calcular_total($indicador, $valores, $medicion->etiqueta);
                $valor_total = new Valor();
                $valor_total->valor = $total;
                array_push($totales, $valor_total);
            }
            return $this->logicaValores->sumatorio($totales);
        }
        else
        {
            $valores = array();
            //Tomamos sólo los valores del año
            foreach ($subunidad->mediciones as $medicion)
            {
                if (strpos($medicion->etiqueta, '' . $anyo . '') !== false)
                {
                    array_push($valores, $medicion->medicion_valor);
                }
            }
            return $this->logicaValores->sumatorio($valores);
        }
    }

    //Calcula el total anual para un indicador/dato con agregacion temporal: máximo
    private function calcular_total_temporal_maximo($indicador, $subunidad, $anyo)
    {
        //Si es el total en un indicador/dato agregado
        if ($indicador->id_tipo_agregacion != 0 && $indicador->id_tipo_agregacion != 4 && $subunidad->id == $indicador->id_entidad)
        {
            $medicion = new Medicion();
            $valor = new Valor();
            $totales = array();
            $mediciones = $medicion->Find("id_indicador = $indicador->id AND etiqueta LIKE '$anyo%' ORDER BY periodo_inicio DESC");
            foreach ($mediciones as $medicion)
            {
                $valores = $valor->Find("id_medicion=$medicion->id");
                $total = $this->calcular_total($indicador, $valores, $medicion->etiqueta);
                $valor_total = new Valor();
                $valor_total->valor = $total;
                array_push($totales, $valor_total);
            }
            return $this->logicaValores->maximo($totales);
        }
        else
        {
            $valores = array();
            //Tomamos sólo los valores del año
            foreach ($subunidad->mediciones as $medicion)
            {
                if (strpos($medicion->etiqueta, '' . $anyo . '') !== false)
                {
                    array_push($valores, $medicion->medicion_valor);
                }
            }
            return $this->logicaValores->maximo($valores);
        }
    }

    //Calcula el total anual para un indicador/dato con agregacion temporal: evolutivo
    private function calcular_total_temporal_evolutivo($indicador, $subunidad, $anyo)
    {
        //Si es el total en un indicador/dato agregado
        if ($indicador->id_tipo_agregacion != 0 && $indicador->id_tipo_agregacion != 4 && $subunidad->id == $indicador->id_entidad)
        {
            $medicion = new Medicion();
            $valor = new Valor();
            $totales = array();
            $mediciones = $medicion->Find("id_indicador = $indicador->id AND etiqueta LIKE '$anyo%' ORDER BY periodo_inicio DESC");
            foreach ($mediciones as $medicion)
            {
                $valores = $valor->Find("id_medicion=$medicion->id");
                $total = $this->calcular_total($indicador, $valores, $medicion->etiqueta);
                array_push($totales, $total);
            }
            if ($totales)
            {
                return $totales[0];
            }
            else
            {
                return NULL;
            }
        }
        else
        {
            $mediciones = array();
            //Tomamos sólo las mediciones del año
            foreach ($subunidad->mediciones as $medicion)
            {
                if (strpos($medicion->etiqueta, '' . $anyo . '') !== false)
                {
                    array_push($mediciones, $medicion);
                }
            }
            if ($mediciones)
            {
                return $mediciones[0]->medicion_valor->valor;
            }
            else
            {
                return NULL;
            }
        }
    }

    //-----------------------------------------------------------------------------
    // FUNCIONES PARA EL CÁLCULO DE DEPENDENCIAS 
    // EN INDICADORES/DATOS CALCULADOS
    //-----------------------------------------------------------------------------
    //Función que guarda los indicadores/datos de los que depende el 
    //indicador/dato calculado cuyo identificador recibe como parámetro
    public function guardar_dependencias($id)
    {
        $indicador_calculado = new Indicador();
        $indicador_calculado->load("id=$id");
        $calculo = str_split($indicador_calculado->calculo);
        $es_variable = false;
        // Recorremos la cadena $calculo para sacar los 
        // indicadores/datos influyentes
        foreach ($calculo as $elemento)
        {
            if ($elemento == "[")
            {
                $variable = "";
                $es_variable = true;
                continue;
            }
            if ($elemento == "]")
            {
                //Es el id de un indicador/dato del que depende
                if (is_numeric($variable))
                {
                    //Lo guardamos en la tabla de indicadores_dependencias
                    $this->guarda_dependencia($id, (int) $variable);
                }
                $es_variable = false;
            }
            if ($es_variable)
            {
                $variable .= $elemento;
            }
        }
    }

    //Función que guarda una dependencia de un indicador/dato de otro 
    //cuyos identificadores recibe como parámetros
    private function guarda_dependencia($id_calculado, $id_operando)
    {
        $indicador_dependencia = new Indicador_dependencia();
        $indicador_dependencia->id_calculado = $id_calculado;
        $indicador_dependencia->id_operando = $id_operando;
        $indicador_dependencia->Save();
    }

    //Función que borra los indicadores/datos de los que depende el indicador/dato 
    //calculado cuyo identificador recibe como parámetro
    public function borrar_dependencias($id)
    {
        $indicador_dependencia = new Indicador_dependencia();
        while ($indicador_dependencia->load("id_calculado = $id"))
        {
            $indicador_dependencia->delete();
        }
    }

    public function calcular_dependencias($id)
    {
        $indicadores_influyentes = array();
        $indicador_dependencia = new Indicador_dependencia();
        $indicadores_dependencias = $indicador_dependencia->Find("id_calculado=$id");
        foreach ($indicadores_dependencias as $indicador_dependiente)
        {
            $indicador_influye = new Indicador();
            $indicador_influye->load("id=$indicador_dependiente->id_operando");
            $indicadores_influyentes[] = $indicador_influye;
        }
        return $indicadores_influyentes;
    }

    //Función que devuelve los indicadores/datos sobre los que influye el 
    //indicador/dato cuyo identificador recibe como parámetro
    public function calcular_influencias($id)
    {
        $indicadores_dependientes = array();
        $indicador_dependencia = new Indicador_dependencia();
        $indicadores_dependencias = $indicador_dependencia->Find("id_operando=$id");
        foreach ($indicadores_dependencias as $indicador_dependiente)
        {
            $indicador_depende = new Indicador();
            $indicador_depende->load("id=$indicador_dependiente->id_calculado");
            $indicadores_dependientes[] = $indicador_depende;
        }
        return $indicadores_dependientes;
    }

    //Función que actualiza el valor de los indicadores calculados que 
    //dependen de aquel cuyo id pasamos para la medición cuya etiqueta damos y para la 
    //entidad cuyo id pasamos también como parámetro
    public function actualizar_valor_indicadores_calculados($id, $etiqueta, $id_entidad)
    {
        $indicadores_dependientes = $this->calcular_influencias($id);
        if ($indicadores_dependientes)
        {
            foreach ($indicadores_dependientes as $indicador_dependiente)
            {
                $this->actualizar_valor_indicadores_calculados($indicador_dependiente->id, $etiqueta, $id_entidad);
                $this->actualizar_valor($indicador_dependiente, $etiqueta, $id_entidad);
            }
        }
    }

    //Función que calcula y graba el valor de un Indicador/Dato calculado. 
    //Recibe como parámetros el Indicador/Dato calculado la etiqueta de la medición
    //y el id_entidad del valor a actualizar
    public function actualizar_valor($indicador, $etiqueta, $id_entidad)
    {
        //Variable que nos dirá si es factible el cálculo
        $calculable = true;
        $indicadores_influyentes = $this->calcular_dependencias($indicador->id);
        foreach ($indicadores_influyentes as $indicador_influyente)
        {
            //Comprobamos que la periodicidad de todos los indicadores 
            //implicados sea la misma
            if ($indicador->periodicidad !== $indicador_influyente->periodicidad)
            {
                $calculable = false;
            }
        }
        if ($calculable)
        {
            //Si el Indicador/Dato se mide de forma centralizada en la Unidad superior 
            //entonces calculamos totales  de los influyentes y a partir de la 
            //fórmula calculamos y grabamos el valor
            if ($indicador->id_tipo_agregacion == 0)
            {
                $this->actualizar_valor_centralizado($indicador, $etiqueta);
            }
            else
            {
                $this->actualizar_valor_agregado($indicador, $etiqueta, $id_entidad);
            }
        }
    }

    //Función que calcula el valor para un Indicador/Dato calculado 
    //que se mide de forma centralizada en la medición cuya etiqueta se pasa como parámetro
    private function actualizar_valor_centralizado($indicador, $etiqueta)
    {
        // Recorremos la cadena $calculo para sacar y calcular las variables
        // Almacenamos el resultado en $formula
        $es_variable = false;
        $formula = "";
        $calculo = str_split($indicador->calculo);
        foreach ($calculo as $elemento)
        {
            if ($elemento == "[")
            {
                $variable = "";
                $es_variable = true;
                continue;
            }
            if ($elemento == "]")
            {
                if (is_numeric($variable))
                {
                    $id_operando = (int) $variable;
                    $operando = new Indicador();
                    $operando->Load("id=$id_operando");
                    $valores = $this->indicador_valores_medicion($operando, $etiqueta);
                    $valor_total = $this->calcular_total($operando, $valores, $etiqueta);
                    $formula .= "$valor_total";
                }
                $es_variable = false;
                continue;
            }
            if ($es_variable)
            {
                $variable .= $elemento;
            }
            else
            {
                $formula .= $elemento;
            }
        }
        // Calcula el resultado de la formula y guarda el valor final 
        eval("\$valor_final = $formula;");

        //Grabamos el valor
        $valor = new Valor();
        $medicion = new Medicion();
        $medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'");
        $valor->load("id_medicion=$medicion->id");
        $valor->valor = $valor_final;
        $valor->Save();
    }

    //Función que calcula el valor para un Indicador/Dato calculado 
    //que se mide como agregado de subunidades
    private function actualizar_valor_agregado($indicador, $etiqueta, $id_entidad)
    {
        //En este caso comprobaremos primero que el Indicador/Dato calculado se 
        //mida para la entidad en la que hemos introducido valores en sus 
        //Indicadores/Datos influyentes
        $medicion = new Medicion();
        $medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'");
        $valor = new Valor();
        //Si se mide entonces calculamos
        if ($valor->load("id_medicion=$medicion->id AND id_entidad=$id_entidad"))
        {
            // Recorremos la cadena $calculo para sacar y calcular las variables
            // Almacenamos el resultado en $formula
            $es_variable = false;
            $formula = "";
            $calculo = str_split($indicador->calculo);
            foreach ($calculo as $elemento)
            {
                if ($elemento == "[")
                {
                    $variable = "";
                    $es_variable = true;
                    continue;
                }
                if ($elemento == "]")
                {
                    if (is_numeric($variable))
                    {
                        $id_operando = (int) $variable;
                        $operando = new Indicador();
                        $operando->Load("id=$id_operando");
                        //Recuperar el valor para la entidad
                        $valores = $this->indicador_valores_medicion($operando, $etiqueta);
                        foreach ($valores as $val)
                        {
                            if ($val->id_entidad == $id_entidad)
                            {
                                $valor_total = $val->valor;
                            }
                        }
                        $formula .= "$valor_total";
                    }
                    $es_variable = false;
                    continue;
                }
                if ($es_variable)
                {
                    $variable .= $elemento;
                }
                else
                {
                    $formula .= $elemento;
                }
            }
            // Calcula el resultado de la formula y guarda el valor final 
            eval("\$valor_final = $formula;");

            //Grabamos el valor
            $valor->valor = $valor_final;
            $valor->Save();
        }
    }

    //---------------------------------------------------------------------------
    //VALORES
    //-----------------------------------------------------------------------------
    //Devuelve todos los valores del Indicador/Dato para la medición 
    //cuya etiqueta recibe como parámetro
    public function indicador_valores_medicion($indicador, $etiqueta_medicion)
    {
        $valor = new Valor();
        $medicion = new Medicion();
        $medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta_medicion'");
        return $valor->Find("id_medicion=$medicion->id");
    }

    //Devuelve el valor total del año  para la referencia que recibe como parámetro 
    //del indicador/dato con periodicidad intranual que también recibe como parámetro
    public function calcular_ref_anual($indicador, $valores_referencia, $anyo, $referencia)
    {
        switch ($indicador->id_tipo_agregacion_temporal)
        {
            //Media
            case 1:
                {
                    return $this->calcular_ref_anual_media($indicador, $valores_referencia, $anyo, $referencia);
                }
            //Sumatorio
            case 2:
                {
                    return $this->calcular_ref_anual_sumatorio($indicador, $valores_referencia, $anyo, $referencia);
                }
            //Máximo
            case 3:
                {
                    return $this->calcular_ref_anual_maximo($indicador, $valores_referencia, $anyo, $referencia);
                }
            //Evolutivo
            case 5:
                {
                    return $this->calcular_ref_anual_evolutivo($indicador, $valores_referencia, $anyo, $referencia);
                }
            default:return null;
        }
    }

    //Calcula el valor de referencia anual para un indicador/dato 
    //con agregacion temporal: media
    private function calcular_ref_anual_media($indicador, $valores_referencia, $anyo, $referencia)
    {
        //Extraemos los valores de referencia del año en cuestión para ello obtenemos
        //primero las mediciones del año
        $medicion = new Medicion();
        $valores_ref_anyo = array();
        $valor_referencia_medicion = new Valor_referencia_medicion();
        $mediciones = $medicion->Find("id_indicador = $indicador->id AND etiqueta LIKE '$anyo%' ORDER BY periodo_inicio DESC");
        foreach ($mediciones as $medicion)
        {
            //Vemos la referencias para las mediciones de ese año
            $medicion_referencias = $valor_referencia_medicion->Find_joined("id_medicion=$medicion->id");
            if ($medicion_referencias)
            {
                foreach ($medicion_referencias as $med_ref)
                {
                    //Si es la referencia deseada
                    if (strpos($med_ref->valor_referencia->nombre, $referencia))
                    {
                        $valor = new Valor();
                        $valor->valor = $med_ref->valor;
                        array_push($valores_ref_anyo, $valor);
                    }
                }
            }
        }
        return $this->logicaValores->media($valores_ref_anyo);
    }

    //Calcula el valor de referencia anual para un indicador/dato 
    //con agregacion temporal: sumatorio
    private function calcular_ref_anual_sumatorio($indicador, $valores_referencia, $anyo, $referencia)
    {
        //Extraemos los valores de referencia del año en cuestión para ello obtenemos
        //primero las mediciones del año
        $medicion = new Medicion();
        $valores_ref_anyo = array();
        $valor_referencia_medicion = new Valor_referencia_medicion();
        $mediciones = $medicion->Find("id_indicador = $indicador->id AND etiqueta LIKE '$anyo%' ORDER BY periodo_inicio DESC");
        foreach ($mediciones as $medicion)
        {
            //Vemos la referencias para las mediciones de ese año
            $medicion_referencias = $valor_referencia_medicion->Find_joined("id_medicion=$medicion->id");
            if ($medicion_referencias)
            {
                foreach ($medicion_referencias as $med_ref)
                {
                    //Si es la referencia deseada
                    if (strpos($med_ref->valor_referencia->nombre, $referencia))
                    {
                        $valor = new Valor();
                        $valor->valor = $med_ref->valor;
                        array_push($valores_ref_anyo, $valor);
                    }
                }
            }
        }
        return $this->logicaValores->sumatorio($valores_ref_anyo);
    }

    //Calcula el valor de referencia anual para un indicador/dato 
    //con agregacion temporal: máximo
    private function calcular_ref_anual_maximo($indicador, $valores_referencia, $anyo, $referencia)
    {
        //Extraemos los valores de referencia del año en cuestión para ello obtenemos
        //primero las mediciones del año
        $medicion = new Medicion();
        $valores_ref_anyo = array();
        $valor_referencia_medicion = new Valor_referencia_medicion();
        $mediciones = $medicion->Find("id_indicador = $indicador->id AND etiqueta LIKE '$anyo%' ORDER BY periodo_inicio DESC");
        foreach ($mediciones as $medicion)
        {
            //Vemos la referencias para las mediciones de ese año
            $medicion_referencias = $valor_referencia_medicion->Find_joined("id_medicion=$medicion->id");
            if ($medicion_referencias)
            {
                foreach ($medicion_referencias as $med_ref)
                {
                    //Si es la referencia deseada
                    if (strpos($med_ref->valor_referencia->nombre, $referencia))
                    {
                        $valor = new Valor();
                        $valor->valor = $med_ref->valor;
                        array_push($valores_ref_anyo, $valor);
                    }
                }
            }
        }
        return $this->logicaValores->maximo($valores_ref_anyo);
    }

    //Calcula el valor de referencia anual para un indicador/dato 
    //con agregacion temporal: evolutivo
    private function calcular_ref_anual_evolutivo($indicador, $valores_referencia, $anyo, $referencia)
    {
        //Extraemos los valores de referencia del año en cuestión para ello obtenemos
        //primero las mediciones del año
        $medicion = new Medicion();
        $valor_referencia_medicion = new Valor_referencia_medicion();
        $mediciones = $medicion->Find("id_indicador = $indicador->id AND etiqueta LIKE '$anyo%' ORDER BY periodo_inicio DESC");
        foreach ($mediciones as $medicion)
        {
            //Vemos la referencias para las mediciones de ese año
            $medicion_referencias = $valor_referencia_medicion->Find_joined("id_medicion=$medicion->id");
            if ($medicion_referencias)
            {
                foreach ($medicion_referencias as $med_ref)
                {
                    //Si es la referencia deseada
                    if (strpos($med_ref->valor_referencia->nombre, $referencia))
                    {
                        return $med_ref->valor;
                    }
                }
            }
        }
        return NULL;
    }

    //-----------------------------------------------------------------------------
    // FUNCIONES PARA ACTUALIZAR LAS UNIDADES EN LAS QUE SE MIDE UN INDICADOR/DATO
    //------------------------------------------------------------------------------
    // Actualiza mediciones y genera un valor en blanco para cada una de las unidades 
    // asociadas al Indicador/Dato en función de la fecha actual y su periodicidad 
    // cuando cambiamos el tipo de agregación
    public function actualizar_mediciones($indicador)
    {
        //Año y fecha actuales
        $anyo = date('Y');
        $fecha = date('Y-m-d');
        //Periodicidad Bienal
        if ($indicador->periodicidad == 'Bienal')
        {
            $mediciones_actualizables = $this->actualizar_mediciones_bienales($indicador, $anyo);
        }
        //Periodicidad Anual
        else if ($indicador->periodicidad == 'Anual')
        {
            $mediciones_actualizables = $this->actualizar_mediciones_anuales($indicador, $anyo);
        }
        //Periodicidad Semestral
        else if ($indicador->periodicidad == 'Semestral')
        {
            $mediciones_actualizables = $this->actualizar_mediciones_semestrales($indicador, $anyo, $fecha);
        }
        //Periodicidad Cuatrimestral
        else if ($indicador->periodicidad == 'Cuatrimestral')
        {
            $mediciones_actualizables = $this->actualizar_mediciones_cuatrimestrales($indicador, $anyo, $fecha);
        }
        //Periodicidad Trimestral
        else if ($indicador->periodicidad == 'Trimestral')
        {
            $mediciones_actualizables = $this->actualizar_mediciones_trimestrales($indicador, $anyo, $fecha);
        }
        //Periodicidad mensual
        else
        {
            $mediciones_actualizables = $this->actualizar_mediciones_mensuales($indicador, $anyo, $fecha);
        }
        foreach ($mediciones_actualizables as $medicion)
        {
            //Borramos todos los valores de las mediciones a actualizar
            $this->logicaMedicion->borrar_valores_medicion($medicion->id);
            //Generamos valores nulos
            $this->logicaMedicion->generar_valores_medicion($medicion);
        }
    }

    // Actualiza mediciones activando/desactivando las Unidades 
    // asociadas al Indicador/Dato en función de la fecha actual y su periodicidad 
    // cuando cambiamos las Unidades en Indicadores/Datos Agregados
    public function actualizar_subunidades($indicador)
    {
        //Año y fecha actuales
        $anyo = date('Y');
        $fecha = date('Y-m-d');
        //Periodicidad Bienal
        if ($indicador->periodicidad == 'Bienal')
        {
            $mediciones_actualizables = $this->actualizar_mediciones_bienales($indicador, $anyo);
        }
        //Periodicidad Anual
        else if ($indicador->periodicidad == 'Anual')
        {
            $mediciones_actualizables = $this->actualizar_mediciones_anuales($indicador, $anyo);
        }
        //Periodicidad Semestral
        else if ($indicador->periodicidad == 'Semestral')
        {
            $mediciones_actualizables = $this->actualizar_mediciones_semestrales($indicador, $anyo, $fecha);
        }
        //Periodicidad Cuatrimestral
        else if ($indicador->periodicidad == 'Cuatrimestral')
        {
            $mediciones_actualizables = $this->actualizar_mediciones_cuatrimestrales($indicador, $anyo, $fecha);
        }
        //Periodicidad Trimestral
        else if ($indicador->periodicidad == 'Trimestral')
        {
            $mediciones_actualizables = $this->actualizar_mediciones_trimestrales($indicador, $anyo, $fecha);
        }
        //Periodicidad mensual
        else
        {
            $mediciones_actualizables = $this->actualizar_mediciones_mensuales($indicador, $anyo, $fecha);
        }
        foreach ($mediciones_actualizables as $medicion)
        {
            $this->logicaMedicion->actualizar_subunidades_medicion($medicion);
        }
    }

    //Devuelve las mediciones a actualizar en un Indicador/Dato con periodicidad 
    //bienal para el año que recibe como parámetro
    private function actualizar_mediciones_bienales($indicador, $anyo)
    {
        $medicion = new Medicion();
        $etiqueta = $anyo - 1;
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo-%' "
                        . "OR etiqueta LIKE '$etiqueta-%')");
    }

    //Devuelve las mediciones a actualizar en un Indicador/Dato con periodicidad 
    //anual para el año que recibe como parámetro
    private function actualizar_mediciones_anuales($indicador, $anyo)
    {
        $medicion = new Medicion();
        return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo'");
    }

    //Devuelve las mediciones a actualizar en un Indicador/Dato con periodicidad 
    //semestral en el año que recibe como parámetro y en función de la fecha que 
    //también recibe como parámetro
    private function actualizar_mediciones_semestrales($indicador, $anyo, $fecha)
    {
        $medicion = new Medicion();
        //Estamos en el segundo Semestre
        if ($fecha > $anyo . "-06-30")
        {
            return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo.2S'");
        }
        //Estamos en el primer Semestre
        else
        {
            return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo%'");
        }
    }

    //Devuelve las mediciones a actualizar en un Indicador/Dato con periodicidad 
    //cuatrimestral en el año que recibe como parámetro y en función de la fecha que 
    //también recibe como parámetro
    private function actualizar_mediciones_cuatrimestrales($indicador, $anyo, $fecha)
    {
        $medicion = new Medicion();
        //Estamos en el primer Cuatrimestre
        if ($fecha < $anyo . "-05-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo%'");
        }
        //Estamos en el segundo Cuatrimestre
        else if ($fecha >= $anyo . "-05-01" && $fecha < $anyo . "-09-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.2C' "
                            . "OR etiqueta LIKE '$anyo.3C')");
        }
        //Estamos en el tercer Cuatrimestre
        else
        {
            return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo.3C'");
        }
    }

    //Devuelve las mediciones a actualizar en un Indicador/Dato con periodicidad 
    //trimestral en el año que recibe como parámetro y en función de la fecha que 
    //también recibe como parámetro
    private function actualizar_mediciones_trimestrales($indicador, $anyo, $fecha)
    {
        $medicion = new Medicion();
        //Estamos en el primer Trimestre
        if ($fecha < $anyo . "-04-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo%'");
        }
        //Estamos en el segundo Trimestre
        else if ($fecha >= $anyo . "-04-01" && $fecha < $anyo . "-07-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.2T' "
                            . "OR etiqueta LIKE '$anyo.3T' "
                            . "OR etiqueta LIKE '$anyo.4T')");
        }
        //Estamos en el tercer Trimestre
        else if ($fecha >= $anyo . "-07-01" && $fecha < $anyo . "-10-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.3T' "
                            . "OR etiqueta LIKE '$anyo.4T')");
        }
        //Estamos en el cuarto Trimestre
        else
        {
            return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo.4T'");
        }
    }

    //Devuelve las mediciones a actualizar en un Indicador/Dato con periodicidad 
    //mensual en el año que recibe como parámetro y en función de la fecha que 
    //también recibe como parámetro
    private function actualizar_mediciones_mensuales($indicador, $anyo, $fecha)
    {
        $medicion = new Medicion();
        //Estamos en Enero
        if ($fecha < $anyo . "-02-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo%'");
        }
        //Estamos en Febrero
        else if ($fecha >= $anyo . "-02-01" && $fecha < $anyo . "-03-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.02' "
                            . "OR etiqueta LIKE '$anyo.03' "
                            . "OR etiqueta LIKE '$anyo.04'"
                            . "OR etiqueta LIKE '$anyo.05'"
                            . "OR etiqueta LIKE '$anyo.06'"
                            . "OR etiqueta LIKE '$anyo.07'"
                            . "OR etiqueta LIKE '$anyo.08'"
                            . "OR etiqueta LIKE '$anyo.09'"
                            . "OR etiqueta LIKE '$anyo.10'"
                            . "OR etiqueta LIKE '$anyo.11'"
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Marzo
        else if ($fecha >= $anyo . "-03-01" && $fecha < $anyo . "-04-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.03' "
                            . "OR etiqueta LIKE '$anyo.04'"
                            . "OR etiqueta LIKE '$anyo.05'"
                            . "OR etiqueta LIKE '$anyo.06'"
                            . "OR etiqueta LIKE '$anyo.07'"
                            . "OR etiqueta LIKE '$anyo.08'"
                            . "OR etiqueta LIKE '$anyo.09'"
                            . "OR etiqueta LIKE '$anyo.10'"
                            . "OR etiqueta LIKE '$anyo.11'"
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Abril
        else if ($fecha >= $anyo . "-04-01" && $fecha < $anyo . "-05-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.04' "
                            . "OR etiqueta LIKE '$anyo.05'"
                            . "OR etiqueta LIKE '$anyo.06'"
                            . "OR etiqueta LIKE '$anyo.07'"
                            . "OR etiqueta LIKE '$anyo.08'"
                            . "OR etiqueta LIKE '$anyo.09'"
                            . "OR etiqueta LIKE '$anyo.10'"
                            . "OR etiqueta LIKE '$anyo.11'"
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Mayo
        else if ($fecha >= $anyo . "-05-01" && $fecha < $anyo . "-06-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.05' "
                            . "OR etiqueta LIKE '$anyo.06'"
                            . "OR etiqueta LIKE '$anyo.07'"
                            . "OR etiqueta LIKE '$anyo.08'"
                            . "OR etiqueta LIKE '$anyo.09'"
                            . "OR etiqueta LIKE '$anyo.10'"
                            . "OR etiqueta LIKE '$anyo.11'"
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Junio
        else if ($fecha >= $anyo . "-06-01" && $fecha < $anyo . "-07-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.06' "
                            . "OR etiqueta LIKE '$anyo.07'"
                            . "OR etiqueta LIKE '$anyo.08'"
                            . "OR etiqueta LIKE '$anyo.09'"
                            . "OR etiqueta LIKE '$anyo.10'"
                            . "OR etiqueta LIKE '$anyo.11'"
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Julio
        else if ($fecha >= $anyo . "-07-01" && $fecha < $anyo . "-08-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.07' "
                            . "OR etiqueta LIKE '$anyo.08'"
                            . "OR etiqueta LIKE '$anyo.09'"
                            . "OR etiqueta LIKE '$anyo.10'"
                            . "OR etiqueta LIKE '$anyo.11'"
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Agosto
        else if ($fecha >= $anyo . "-08-01" && $fecha < $anyo . "-09-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.08' "
                            . "OR etiqueta LIKE '$anyo.09'"
                            . "OR etiqueta LIKE '$anyo.10'"
                            . "OR etiqueta LIKE '$anyo.11'"
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Septiembre
        else if ($fecha >= $anyo . "-09-01" && $fecha < $anyo . "-10-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.09' "
                            . "OR etiqueta LIKE '$anyo.10'"
                            . "OR etiqueta LIKE '$anyo.11'"
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Octubre
        else if ($fecha >= $anyo . "-10-01" && $fecha < $anyo . "-11-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.10' "
                            . "OR etiqueta LIKE '$anyo.11'"
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Noviembre
        else if ($fecha >= $anyo . "-11-01" && $fecha < $anyo . "-12-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.11' "
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Diciembre
        else
        {
            return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo.12'");
        }
    }

    //------------------------------------------------------------------------
    //CRITERIOS EFQM
    //-------------------------------------------------------------------------
    //Asigna el criterio efqm cuyo id recibe al indicador cuyo identificador
    //tambien recibe como parámetro
    public function grabar_criterio_efqm($id, $id_efqm)
    {
        $criterio_efqm_indicador = new Criterio_efqm_indicador();
        $criterio_efqm_indicador->id_indicador = $id;
        $criterio_efqm_indicador->id_criterio_efqm = $id_efqm;
        $criterio_efqm_indicador->save();
    }

    //Borra todos los criterios efqm del indicador cuyo identificador recibe como parámetro
    public function borrar_criterios_efqm($id)
    {
        $criterio_efqm_indicador = new Criterio_efqm_indicador();
        while ($criterio_efqm_indicador->load("id_indicador = $id"))
        {
            $criterio_efqm_indicador->delete();
        }
    }

}
