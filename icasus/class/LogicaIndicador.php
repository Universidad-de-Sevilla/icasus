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
    //Genera las mediciones de un Indicador/Dato para el año actual en 
    //función de su periodicidad. El tipo es: "indicador" o "dato"
    public function generar_mediciones($indicador, $tipo)
    {
        //Primero generamos mediciones para los Indicadores/Datos Calculados 
        //cuyo cálculo dependa del Indicador/Dato actual
        $this->generar_mediciones_indicadores_dependientes($indicador);

        //Generamos mediciones en función de la periodicidad
        //Anual
        if ($indicador->periodicidad == 'Anual')
        {
            $this->generar_medicion_anual($indicador, $tipo);
        }
        //Semestral
        else if ($indicador->periodicidad == 'Semestral')
        {
            $this->generar_mediciones_semestrales($indicador, $tipo);
        }
        //Cuatrimestral
        else if ($indicador->periodicidad == 'Cuatrimestral')
        {
            $this->generar_mediciones_cuatrimestrales($indicador, $tipo);
        }
        //Trimestral
        else if ($indicador->periodicidad == 'Trimestral')
        {
            $this->generar_mediciones_trimestrales($indicador, $tipo);
        }
        //Mensual
        else
        {
            $this->generar_mediciones_mensuales($indicador);
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
    function generar_mediciones_semestrales($indicador, $tipo)
    {
        for ($i = 1; $i != 3; $i++)
        {
            $this->generar_medicion_semestral($indicador, $tipo, $i);
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
            $periodo_inicio = array(Date('Y') . '-01-01', Date('Y') . '-07-01');
            $periodo_fin = array(Date('Y') . '-06-30', Date('Y') . '-12-31');
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
    function generar_mediciones_cuatrimestrales($indicador, $tipo)
    {
        for ($i = 1; $i != 4; $i++)
        {
            $this->generar_medicion_cuatrimestral($indicador, $tipo, $i);
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
            $periodo_inicio = array(Date('Y') . '-01-01', Date('Y') . '-05-01', Date('Y') . '-09-01');
            $periodo_fin = array(Date('Y') . '-04-30', Date('Y') . '-08-31', Date('Y') . '-12-31');
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
    function generar_mediciones_trimestrales($indicador, $tipo)
    {
        for ($i = 1; $i != 5; $i++)
        {
            $this->generar_medicion_trimestral($indicador, $tipo, $i);
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
            $periodo_inicio = array(Date('Y') . '-01-01', Date('Y') . '-04-01', Date('Y') . '-07-01', Date('Y') . '-10-01');
            $periodo_fin = array(Date('Y') . '-03-31', Date('Y') . '-06-30', Date('Y') . '-09-30', Date('Y') . '-12-31', Date('Y') . '-05-31',);
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
    function generar_mediciones_mensuales($indicador, $tipo)
    {
        for ($i = 1; $i != 13; $i++)
        {
            $this->generar_medicion_mensual($indicador, $tipo, $i);
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
            $periodo_inicio = array(Date('Y') . '-01-01', Date('Y') . '-02-01',
                Date('Y') . '-03-01', Date('Y') . '-04-01', Date('Y') . '-05-01',
                Date('Y') . '-06-01', Date('Y') . '-07-01', Date('Y') . '-08-01',
                Date('Y') . '-09-01', Date('Y') . '-10-01', Date('Y') . '-11-01',
                Date('Y') . '-12-01');
            //Si el año es bisiesto añadimos un día a Febrero
            if (Util::esBisiesto(Date('Y')))
            {
                $periodo_fin = array(Date('Y') . '-01-31', Date('Y') . '-02-29',
                    Date('Y') . '-03-31', Date('Y') . '-04-30',
                    Date('Y') . '-05-31', Date('Y') . '-06-30',
                    Date('Y') . '-07-31', Date('Y') . '-08-31',
                    Date('Y') . '-09-30', Date('Y') . '-10-31',
                    Date('Y') . '-11-30', Date('Y') . '-12-31');
            }
            else
            {
                $periodo_fin = array(Date('Y') . '-01-31', Date('Y') . '-02-28',
                    Date('Y') . '-03-31', Date('Y') . '-04-30',
                    Date('Y') . '-05-31', Date('Y') . '-06-30',
                    Date('Y') . '-07-31', Date('Y') . '-08-31',
                    Date('Y') . '-09-30', Date('Y') . '-10-31',
                    Date('Y') . '-11-30', Date('Y') . '-12-31');
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

}
