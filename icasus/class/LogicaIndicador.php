<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/LogicaIndicador.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Clase que implementa los métodos para la Lógica de Negocio 
// de los Indicadores/Datos en Icasus.
//--------------------------------------------------------------------------

class LogicaIndicador implements ILogicaIndicador
{

    //Variable para llamar a la Lógica de Negocio de las Mediciones
    private $logicaMedicion;

    public function __construct()
    {
        $this->logicaMedicion = new LogicaMedicion();
    }

    //-----------------------------------------------------------------
    //GENERACIÓN DE MEDICIONES
    //-----------------------------------------------------------------
    //Genera las mediciones de un Indicador/Dato a partir de su Histórico. 
    //El tipo es: "indicador" o "dato"
    function generar_mediciones($indicador, $tipo)
    {
        //Primero generamos mediciones para los Indicadores/Datos Calculados 
        //cuyo cálculo dependa del Indicador/Dato actual
        $this->generar_mediciones_indicadores_dependientes($indicador);

        for ($i = $indicador->historicos; $i < idate('Y') + 1; $i++)
        {
            $this->generar_mediciones_por_anyo($indicador, $i, $tipo);
        }
    }

    //Genera mediciones para todos los Indicadores cuyo cálculo 
    //dependa del Indicador que recibe como parámetro
    function generar_mediciones_indicadores_dependientes($indicador)
    {
        $indicador_dependencia = new Indicador_dependencia();
        $indicadores_dependientes = $indicador_dependencia->Find("id_operando=$indicador->id");
        foreach ($indicadores_dependientes as $indicador_dependiente)
        {
            $indicador = new Indicador();
            $indicador->load("id=$indicador_dependiente->id_calculado");
            if ($indicador->id_proceso)
            {
                $this->generar_mediciones($indicador, "indicador");
            }
            else
            {
                $this->generar_mediciones($indicador, "dato");
            }
        }
    }

    //Genera las mediciones de un Indicador/Dato para el año que recibe 
    //como parámetro en función de su periodicidad. El tipo es: "indicador" o "dato"
    public function generar_mediciones_por_anyo($indicador, $anyo, $tipo)
    {
        //Primero generamos mediciones para los Indicadores/Datos Calculados 
        //cuyo cálculo dependa del Indicador/Dato actual
//        $this->generar_mediciones_indicadores_dependientes($indicador, $anyo);

        //Generamos mediciones en función de la periodicidad
        //Anual
        if ($indicador->periodicidad == 'Anual')
        {
            $this->generar_medicion_anual($indicador, $anyo, $tipo);
        }
        //Semestral
        else if ($indicador->periodicidad == 'Semestral')
        {
            $this->generar_mediciones_semestrales($indicador, $anyo, $tipo);
        }
        //Cuatrimestral
        else if ($indicador->periodicidad == 'Cuatrimestral')
        {
            $this->generar_mediciones_cuatrimestrales($indicador, $anyo, $tipo);
        }
        //Trimestral
        else if ($indicador->periodicidad == 'Trimestral')
        {
            $this->generar_mediciones_trimestrales($indicador, $anyo, $tipo);
        }
        //Mensual
        else
        {
            $this->generar_mediciones_mensuales($indicador, $anyo, $tipo);
        }
    }

    //Genera una medición Anual
    function generar_medicion_anual($indicador, $anyo, $tipo)
    {
        $medicion = new Medicion();
        $etiqueta = $anyo;
        //Comprobamos primero si ya exite la medición
        if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
        {
            $aviso = MSG_MED_EXISTE;
            header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
        }
        else
        {
            $periodo_inicio = $anyo . '-01-01';
            $periodo_fin = $anyo . '-12-31';
            $medicion->id_indicador = $indicador->id;
            $medicion->periodo_inicio = $periodo_inicio;
            $medicion->periodo_fin = $periodo_fin;
            $medicion->grabacion_inicio = $periodo_inicio;
            $medicion->grabacion_fin = $periodo_fin;
            $medicion->etiqueta = $etiqueta;
            $medicion->observaciones = '';
            $medicion->save();
            // Generamos un valor nulo para cada una de las unidades 
            // asociadas al Indicador/Dato en la medición dada
            $this->logicaMedicion->generar_valores_medicion($medicion);
            //Generamos valores de referencia para la medición
            $this->logicaMedicion->generar_valores_referencia_medicion($medicion);

            $aviso = MSG_MEDS_GENERADA;
            header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
        }
    }

    //Genera las mediciones Semestrales
    function generar_mediciones_semestrales($indicador, $anyo, $tipo)
    {
        for ($i = 1; $i != 3; $i++)
        {
            $this->generar_medicion_semestral($indicador, $anyo, $tipo, $i);
        }
    }

    //Genera una medición semestral
    function generar_medicion_semestral($indicador, $anyo, $tipo, $indice)
    {
        $medicion = new Medicion();
        $etiqueta = $anyo . '.' . $indice . 'S';
        //Comprobamos primero si ya exite la medición
        if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
        {
            $aviso = MSG_MED_EXISTE;
            header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
        }
        else
        {
            $periodo_inicio = array($anyo . '-01-01', $anyo . '-07-01');
            $periodo_fin = array($anyo . '-06-30', $anyo . '-12-31');
            $medicion->id_indicador = $indicador->id;
            $medicion->periodo_inicio = $periodo_inicio[$indice - 1];
            $medicion->periodo_fin = $periodo_fin[$indice - 1];
            $medicion->grabacion_inicio = $periodo_inicio[$indice - 1];
            $medicion->grabacion_fin = $periodo_fin[$indice - 1];
            $medicion->etiqueta = $etiqueta;
            $medicion->observaciones = '';
            $medicion->save();
            // Generamos un valor en blanco para cada una de las unidades 
            // asociadas al Indicador/Dato en la medición dada
            $this->logicaMedicion->generar_valores_medicion($medicion);
            //Generamos valores de referencia para la medición
            $this->logicaMedicion->generar_valores_referencia_medicion($medicion);

            $aviso = MSG_MEDS_GENERADA;
            header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
        }
    }

    //Genera las mediciones cuatrimestrales 
    function generar_mediciones_cuatrimestrales($indicador, $anyo, $tipo)
    {
        for ($i = 1; $i != 4; $i++)
        {
            $this->generar_medicion_cuatrimestral($indicador, $anyo, $tipo, $i);
        }
    }

    //Genera una medición cuatrimestral
    function generar_medicion_cuatrimestral($indicador, $anyo, $tipo, $indice)
    {
        $medicion = new Medicion();
        $etiqueta = $anyo . '.' . $indice . 'C';
        //Comprobamos primero si ya exite la medición
        if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
        {
            $aviso = MSG_MED_EXISTE;
            header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
        }
        else
        {
            $periodo_inicio = array($anyo . '-01-01', $anyo . '-05-01', $anyo . '-09-01');
            $periodo_fin = array($anyo . '-04-30', $anyo . '-08-31', $anyo . '-12-31');
            $medicion->id_indicador = $indicador->id;
            $medicion->periodo_inicio = $periodo_inicio[$indice - 1];
            $medicion->periodo_fin = $periodo_fin[$indice - 1];
            $medicion->grabacion_inicio = $periodo_inicio[$indice - 1];
            $medicion->grabacion_fin = $periodo_fin[$indice - 1];
            $medicion->etiqueta = $etiqueta;
            $medicion->observaciones = '';
            $medicion->save();
            // Generamos un valor en blanco para cada una de las unidades 
            // asociadas al Indicador/Dato en la medición dada
            $this->logicaMedicion->generar_valores_medicion($medicion);
            //Generamos valores de referencia para la medición
            $this->logicaMedicion->generar_valores_referencia_medicion($medicion);

            $aviso = MSG_MEDS_GENERADA;
            header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
        }
    }

    //Genera las mediciones trimestrales 
    function generar_mediciones_trimestrales($indicador, $anyo, $tipo)
    {
        for ($i = 1; $i != 5; $i++)
        {
            $this->generar_medicion_trimestral($indicador, $anyo, $tipo, $i);
        }
    }

    //Genera una medición trimestral
    function generar_medicion_trimestral($indicador, $anyo, $tipo, $indice)
    {
        $medicion = new Medicion();
        $etiqueta = $anyo . '.' . $indice . 'T';
        //Comprobamos primero si ya exite la medición
        if ($medicion->load("id_indicador=$indicador->id AND etiqueta LIKE '$etiqueta'"))
        {
            $aviso = MSG_MED_EXISTE;
            header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
        }
        else
        {
            $periodo_inicio = array($anyo . '-01-01', $anyo . '-04-01', $anyo . '-07-01', $anyo . '-10-01');
            $periodo_fin = array($anyo . '-03-31', $anyo . '-06-30', $anyo . '-09-30', $anyo . '-12-31', $anyo . '-05-31',);
            $medicion->id_indicador = $indicador->id;
            $medicion->periodo_inicio = $periodo_inicio[$indice - 1];
            $medicion->periodo_fin = $periodo_fin[$indice - 1];
            $medicion->grabacion_inicio = $periodo_inicio[$indice - 1];
            $medicion->grabacion_fin = $periodo_fin[$indice - 1];
            $medicion->etiqueta = $etiqueta;
            $medicion->observaciones = '';
            $medicion->save();
            // Generamos un valor en blanco para cada una de las unidades 
            // asociadas al Indicador/Dato en la medición dada
            $this->logicaMedicion->generar_valores_medicion($medicion);
            //Generamos valores de referencia para la medición
            $this->logicaMedicion->generar_valores_referencia_medicion($medicion);

            $aviso = MSG_MEDS_GENERADA;
            header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
        }
    }

    //Genera las mediciones mensuales
    function generar_mediciones_mensuales($indicador, $anyo, $tipo)
    {
        for ($i = 1; $i != 13; $i++)
        {
            $this->generar_medicion_mensual($indicador, $anyo, $tipo, $i);
        }
    }

    //Genera una medición mensual
    function generar_medicion_mensual($indicador, $anyo, $tipo, $indice)
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
            $aviso = MSG_MED_EXISTE;
            header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
        }
        else
        {
            $periodo_inicio = array($anyo . '-01-01', $anyo . '-02-01',
                $anyo . '-03-01', $anyo . '-04-01', $anyo . '-05-01',
                $anyo . '-06-01', $anyo . '-07-01', $anyo . '-08-01',
                $anyo . '-09-01', $anyo . '-10-01', $anyo . '-11-01',
                $anyo . '-12-01');
            //Si el año es bisiesto añadimos un día a Febrero
            if (Util::esBisiesto(Date('Y')))
            {
                $periodo_fin = array($anyo . '-01-31', $anyo . '-02-29',
                    $anyo . '-03-31', $anyo . '-04-30',
                    $anyo . '-05-31', $anyo . '-06-30',
                    $anyo . '-07-31', $anyo . '-08-31',
                    $anyo . '-09-30', $anyo . '-10-31',
                    $anyo . '-11-30', $anyo . '-12-31');
            }
            else
            {
                $periodo_fin = array($anyo . '-01-31', $anyo . '-02-28',
                    $anyo . '-03-31', $anyo . '-04-30',
                    $anyo . '-05-31', $anyo . '-06-30',
                    $anyo . '-07-31', $anyo . '-08-31',
                    $anyo . '-09-30', $anyo . '-10-31',
                    $anyo . '-11-30', $anyo . '-12-31');
            }
            $medicion->id_indicador = $indicador->id;
            $medicion->periodo_inicio = $periodo_inicio[$indice - 1];
            $medicion->periodo_fin = $periodo_fin[$indice - 1];
            $medicion->grabacion_inicio = $periodo_inicio[$indice - 1];
            $medicion->grabacion_fin = $periodo_fin[$indice - 1];
            $medicion->etiqueta = $etiqueta;
            $medicion->observaciones = '';
            $medicion->save();
            // Generamos un valor en blanco para cada una de las unidades 
            // asociadas al Indicador/Dato en la medición dada
            $this->logicaMedicion->generar_valores_medicion($medicion);
            //Generamos valores de referencia para la medición
            $this->logicaMedicion->generar_valores_referencia_medicion($medicion);

            $aviso = MSG_MEDS_GENERADA;
            header("location:index.php?page=medicion_listar&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
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
    public function guarda_dependencia($id_calculado, $id_operando)
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

    function calcular_dependencias($id)
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

    //-----------------------------------------------------------------------------
    // FUNCIONES PARA ACTUALIZAR LAS UNIDADES EN LAS QUE SE MIDE UN INDICADOR/DATO
    //------------------------------------------------------------------------------
    // Actualiza mediciones y genera un valor en blanco para cada una de las unidades 
    // asociadas al Indicador/Dato en función de la fecha actual y su periodicidad
    function actualizar_mediciones($indicador)
    {
        //Año y fecha actuales
        $anyo = date('Y');
        $fecha = date('Y-m-d');
        //Periodicidad Anual
        if ($indicador->periodicidad == 'Anual')
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

    //Devuelve las mediciones a actualizar en un Indicador/Dato con periodicidad 
    //anual para el año que recibe como parámetro
    function actualizar_mediciones_anuales($indicador, $anyo)
    {
        $medicion = new Medicion();
        return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo'");
    }

    //Devuelve las mediciones a actualizar en un Indicador/Dato con periodicidad 
    //semestral en el año que recibe como parámetro y en función de la fecha que 
    //también recibe como parámetro
    function actualizar_mediciones_semestrales($indicador, $anyo, $fecha)
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
    function actualizar_mediciones_cuatrimestrales($indicador, $anyo, $fecha)
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
    function actualizar_mediciones_trimestrales($indicador, $anyo, $fecha)
    {
        $medicion = new Medicion();
        //Estamos en el primer Trimestre
        if ($fecha < $anyo . "-04-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo%'");
        }
        //Estamos en el segundo Trimestre
        else if (fecha >= $anyo . "-04-01" && $fecha < $anyo . "-07-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.2T' "
                            . "OR etiqueta LIKE '$anyo.3T' "
                            . "OR etiqueta LIKE '$anyo.4T')");
        }
        //Estamos en el tercer Trimestre
        else if (fecha >= $anyo . "-07-01" && $fecha < $anyo . "-10-01")
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
    function actualizar_mediciones_mensuales($indicador, $anyo, $fecha)
    {
        $medicion = new Medicion();
        //Estamos en Enero
        if ($fecha < $anyo . "-02-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo%'");
        }
        //Estamos en Febrero
        else if (fecha >= $anyo . "-02-01" && $fecha < $anyo . "-03-01")
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
        else if (fecha >= $anyo . "-03-01" && $fecha < $anyo . "-04-01")
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
        else if (fecha >= $anyo . "-04-01" && $fecha < $anyo . "-05-01")
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
        else if (fecha >= $anyo . "-05-01" && $fecha < $anyo . "-06-01")
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
        else if (fecha >= $anyo . "-06-01" && $fecha < $anyo . "-07-01")
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
        else if (fecha >= $anyo . "-07-01" && $fecha < $anyo . "-08-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.07' "
                            . "OR etiqueta LIKE '$anyo.08'"
                            . "OR etiqueta LIKE '$anyo.09'"
                            . "OR etiqueta LIKE '$anyo.10'"
                            . "OR etiqueta LIKE '$anyo.11'"
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Agosto
        else if (fecha >= $anyo . "-08-01" && $fecha < $anyo . "-09-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.08' "
                            . "OR etiqueta LIKE '$anyo.09'"
                            . "OR etiqueta LIKE '$anyo.10'"
                            . "OR etiqueta LIKE '$anyo.11'"
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Septiembre
        else if (fecha >= $anyo . "-09-01" && $fecha < $anyo . "-10-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.09' "
                            . "OR etiqueta LIKE '$anyo.10'"
                            . "OR etiqueta LIKE '$anyo.11'"
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Octubre
        else if (fecha >= $anyo . "-10-01" && $fecha < $anyo . "-11-01")
        {
            return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.10' "
                            . "OR etiqueta LIKE '$anyo.11'"
                            . "OR etiqueta LIKE '$anyo.12')");
        }
        //Estamos en Noviembre
        else if (fecha >= $anyo . "-11-01" && $fecha < $anyo . "-12-01")
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

}
