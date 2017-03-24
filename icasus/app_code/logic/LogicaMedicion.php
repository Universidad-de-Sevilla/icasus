<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: logic/LogicaMedicion.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Clase que implementa los métodos para la Lógica de Negocio 
// de las Mediciones en Icasus.
//--------------------------------------------------------------------------

class LogicaMedicion implements ILogicaMedicion
{

    //Colores para el status de una medición
//    private $mejorable = 'red';
//    private $aceptable = 'yellow';
//    private $logrado = 'green';

    private $mejorable = 'danger';
    private $aceptable = 'warning';
    private $logrado = 'success';

    // Genera un valor nulo para cada una de las unidades asociadas 
    // al Indicador/Dato en la medición dada que recibe como parámetro
    public function generar_valores_medicion($medicion)
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

    // Actualiza las unidades asociadas al Indicador/Dato en la 
    // medición dada que recibe como parámetro y en función de la lista de 
    // unidades que también recibe como parámetro
    public function actualizar_subunidades_medicion($medicion)
    {
        $indicador_subunidad = new Indicador_subunidad();
        $indicador_subunidades = $indicador_subunidad->Find("id_indicador = $medicion->id_indicador");
        $indicador_subunidades_id = array();
        $valor = new Valor();
        $valores_medicion = $valor->Find("id_medicion=$medicion->id");
        //Obtenemos los ids de las nuevas subunidades
        foreach ($indicador_subunidades as $indicador_subunidad)
        {
            array_push($indicador_subunidades_id, $indicador_subunidad->id_entidad);
        }
        //Actualizamos los valores de la medicion
        foreach ($valores_medicion as $valor_medicion)
        {
//            //Si se media antes pero ahora no lo desactivamos
//            if (!in_array($valor_medicion->id_entidad, $indicador_subunidades_id))
//            {
//                $valor->Load("id=$valor_medicion->id");
//                $valor->activo = 0;
//                $valor->Save();
//            }
//            //Si no se media, pero antes si (existia) y ahora también activamos el valor
//            if (in_array($valor_medicion->id_entidad, $indicador_subunidades_id))
//            {
//                $valor->Load("id=$valor_medicion->id");
//                $valor->activo = 1;
//                $valor->Save();
//            }
            //Si se media antes pero ahora no, lo borramos
            if (!in_array($valor_medicion->id_entidad, $indicador_subunidades_id))
            {
                $valor->Load("id=$valor_medicion->id");
                $valor->Delete();
            }
        }
        //Si no existia  un valor para esa Unidad 
        //(nunca se midió hasta hoy) lo generamos
        foreach ($indicador_subunidades_id as $indicador_subunidad_id)
        {
            if (!$valor->Load("id_medicion=$medicion->id AND id_entidad=$indicador_subunidad_id"))
            {
                $valor = new Valor();
                $valor->id_entidad = $indicador_subunidad_id;
                $valor->id_medicion = $medicion->id;
                $valor->activo = 1;
                $valor->save();
            }
        }
    }

    //Devuelve el status para una medición en función de su estimación(inverso),
    //su valor total y sus valores de referencia
    public function calcular_status_medicion($inverso, $valor, $limite, $meta)
    {
        $status = null;
        //Estimación descendente
        if ($inverso)
        {
            $status = $this->calcular_status_medicion_descendente($valor, $limite, $meta);
        }
        //Estimación ascendente
        else
        {
            $status = $this->calcular_status_medicion_ascendente($valor, $limite, $meta);
        }
        return $status;
    }

    //Devuelve el status para una medición estimada descendentemente
    private function calcular_status_medicion_descendente($valor, $limite, $meta)
    {
        if ($limite && $meta)
        {
            if ($valor > $limite)
            {
                return $this->mejorable;
            }
            else if ($valor <= $meta)
            {
                return $this->logrado;
            }
            else
            {
                return $this->aceptable;
            }
        }
        if ($meta && !$limite)
        {
            if ($valor <= $meta)
            {
                return $this->logrado;
            }
            else
            {
                return $this->mejorable;
            }
        }
        if ($limite && !$meta)
        {
            if ($valor > $limite)
            {
                return $this->mejorable;
            }
            else
            {
                return $this->logrado;
            }
        }
        return NULL;
    }

    //Devuelve el status para una medición estimada ascendentemente
    private function calcular_status_medicion_ascendente($valor, $limite, $meta)
    {
        if ($limite && $meta)
        {
            if ($valor < $limite)
            {
                return $this->mejorable;
            }
            else if ($valor >= $meta)
            {
                return $this->logrado;
            }
            else
            {
                return $this->aceptable;
            }
        }
        if ($meta && !$limite)
        {
            if ($valor >= $meta)
            {
                return $this->logrado;
            }
            else
            {
                return $this->mejorable;
            }
        }
        if ($limite && !$meta)
        {
            if ($valor < $limite)
            {
                return $this->mejorable;
            }
            else
            {
                return $this->logrado;
            }
        }
        return NULL;
    }

    //Genera valores nulos para los valores de referencia de la medición que 
    //recibe como parámetro de un Indicador/Dato
    public function generar_valores_referencia_medicion($medicion)
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

    //Borra todos los valores de la medición cuyo identificador recibe 
    //como parámetro
    public function borrar_valores_medicion($id)
    {
        $valor = new Valor();
        $valores_borrar = $valor->Find("id_medicion=$id");
        foreach ($valores_borrar as $valor_borrar)
        {
            $valor->Load("id=$valor_borrar->id");
            $valor->Delete();
        }
    }

}
