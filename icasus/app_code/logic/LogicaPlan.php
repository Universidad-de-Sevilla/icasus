<?php

//--------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: logic/LogicaValores.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripcion: Clase que implementa los métodos para la Lógica de Negocio 
// de los Planes Estratégicos en Icasus.
//--------------------------------------------------------------------------

class LogicaPlan implements ILogicaPlan
{

    //---------------------------------------------------------------------------
    //EJECUCIONES ANUALES
    //---------------------------------------------------------------------------
    //Actualiza los grados de ejecución de un plan cuando se graban valores 
    //en los objetivos operacionales. Recibe el identificador del objetivo 
    //estratégico y el año de la ejecución.
    public function actualizar_ejecucion_anual($id_objest, $anyo)
    {
        //Obtenemos los objetivos operacionales con el mismo objetivo estratégico
        $objop = new ObjetivoOperacional();
        $objops = $objop->Find("id_objest=$id_objest");
        $valores = [];
        $pesos = [];
        foreach ($objops as $obj)
        {
            $ejecucion_anual = new Ejecucion();
            $ejecucion_anual->load("id_objop=$obj->id AND anyo=$anyo");
            if ($ejecucion_anual->activo)
            {
                $valores[] = $ejecucion_anual->valor;
                $pesos[] = $obj->peso;
            }
        }
        //Grabamos el resultado
        $ejecucion_total = new Ejecucion();
        //Si existe actualizamos el grado de ejecución
        if ($ejecucion_total->load("id_objest=$id_objest AND anyo=$anyo"))
        {
            $ejecucion_total->valor = Util::media_ponderada($valores, $pesos);
        }
        //Si no existe creamos el grado de ejecución
        else
        {
            $ejecucion_total->id_objest = $id_objest;
            $ejecucion_total->anyo = $anyo;
            $ejecucion_total->valor = Util::media_ponderada($valores, $pesos);
            $ejecucion_total->activo = 1;
        }
        $ejecucion_total->Save();
        //Actualizado el objetivo estratégico pasamos a la línea
        $objest = new ObjetivoEstrategico();
        $objest->load("id=$id_objest");
        $this->actualizar_ejecucion_anual_linea($objest->id_linea, $anyo);
    }

    //Actualiza el grado de ejecución para el año que recibe como parámetro
    //de la línea cuyo identificador recibe como parámetro.
    public function actualizar_ejecucion_anual_linea($id_linea, $anyo)
    {
        //Obtenemos los objetivos estratégicos dentro de la misma línea
        $objest = new ObjetivoEstrategico();
        $objests = $objest->Find("id_linea=$id_linea");
        $valores = [];
        foreach ($objests as $obj)
        {
            $ejecucion_anual = new Ejecucion();
            $ejecucion_anual->load("id_objest=$obj->id AND anyo=$anyo");
            $valores[] = $ejecucion_anual->valor;
        }
        //Grabamos el resultado
        $ejecucion_total = new Ejecucion();
        //Si existe actualizamos el grado de ejecución
        if ($ejecucion_total->load("id_linea=$id_linea AND anyo=$anyo"))
        {
            $ejecucion_total->valor = Util::media($valores);
        }
        //Si no existe creamos el grado de ejecución
        else
        {
            $ejecucion_total->id_linea = $id_linea;
            $ejecucion_total->anyo = $anyo;
            $ejecucion_total->valor = Util::media($valores);
            $ejecucion_total->activo = 1;
        }
        $ejecucion_total->Save();
        //Actualizada la línea pasamos al plan
        $linea = new Linea();
        $linea->load("id=$id_linea");
        $this->actualizar_ejecucion_anual_plan($linea->id_plan, $anyo);
    }

    //Actualiza el grado de ejecución para el año que recibe como parámetro
    //del plan cuyo identificador recibe como parámetro.
    public function actualizar_ejecucion_anual_plan($id_plan, $anyo)
    {
        //Obtenemos las líneas estratégicas dentro del mismo plan
        $linea = new Linea();
        $lineas = $linea->Find("id_plan=$id_plan");
        $valores = [];
        foreach ($lineas as $linea)
        {
            $ejecucion_anual = new Ejecucion();
            $ejecucion_anual->load("id_linea=$linea->id AND anyo=$anyo");
            $valores[] = $ejecucion_anual->valor;
        }

        //Grabamos el resultado
        $ejecucion_total = new Ejecucion();
        //Si existe actualizamos el grado de ejecución
        if ($ejecucion_total->load("id_plan=$id_plan AND anyo=$anyo"))
        {
            $ejecucion_total->valor = Util::media($valores);
        }
        //Si no existe creamos el grado de ejecución
        else
        {
            $ejecucion_total->id_plan = $id_plan;
            $ejecucion_total->anyo = $anyo;
            $ejecucion_total->valor = Util::media($valores);
            $ejecucion_total->activo = 1;
        }
        $ejecucion_total->Save();
    }

    //---------------------------------------------------------------------------
    //EJECUCIONES GLOBALES
    //---------------------------------------------------------------------------
    //Actualiza los grados globales de ejecución de un plan al que pertenece
    //el identificador de objetivo operacional que recibe como parámetro
    public function actualizar_ejecucion_global($id_objop)
    {
        $objop = new ObjetivoOperacional();
        $objop->load("id=$id_objop");
        //Obtenemos las ejecuciones del objetivo operacional para todos los años
        $ejecucion = new Ejecucion();
        $ejecuciones_anuales = $ejecucion->Find("id_objop=$id_objop");
        $valores = [];
        foreach ($ejecuciones_anuales as $ejecucion_anual)
        {
            if ($ejecucion_anual->activo)
            {
                $valores[] = $ejecucion_anual->valor;
            }
        }
        //Grabamos el resultado
        $objop->ejecucion = Util::media($valores);
        $objop->Save();
        //Actualizado el objetivo operacional pasamos al estratégico
        $this->actualizar_ejecucion_global_objest($objop->id_objest);
    }

    //Actualiza el grado de ejecucion global del objetivo estratégico cuyo 
    //identificador recibe como parámetro
    public function actualizar_ejecucion_global_objest($id_objest)
    {
        $objest = new ObjetivoEstrategico();
        $objest->load("id=$id_objest");
        //Obtenemos las ejecuciones del objetivo estratégico para todos los años
        $ejecucion = new Ejecucion();
        $ejecuciones_anuales = $ejecucion->Find("id_objest=$id_objest");
        $valores = [];
        foreach ($ejecuciones_anuales as $ejecucion_anual)
        {
            $valores[] = $ejecucion_anual->valor;
        }
        //Grabamos el resultado
        $objest->ejecucion = Util::media($valores);
        $objest->Save();
        //Actualizado el objetivo estratégico pasamos a la línea
        $this->actualizar_ejecucion_global_linea($objest->id_linea);
    }

    //Actualiza el grado de ejecucion global de la línea cuyo 
    //identificador recibe como parámetro
    public function actualizar_ejecucion_global_linea($id_linea)
    {
        $linea = new Linea();
        $linea->load("id=$id_linea");
        //Obtenemos las ejecuciones de la línea para todos los años
        $ejecucion = new Ejecucion();
        $ejecuciones_anuales = $ejecucion->Find("id_linea=$id_linea");
        $valores = [];
        foreach ($ejecuciones_anuales as $ejecucion_anual)
        {
            $valores[] = $ejecucion_anual->valor;
        }
        //Grabamos el resultado
        $linea->ejecucion = Util::media($valores);
        $linea->Save();
        //Actualizada la línea pasamos al plan
        $this->actualizar_ejecucion_global_plan($linea->id_plan);
    }

    //Actualiza el grado de ejecucion global del plan cuyo 
    //identificador recibe como parámetro
    public function actualizar_ejecucion_global_plan($id_plan)
    {
        $plan = new Plan();
        $plan->load("id=$id_plan");
        //Obtenemos las ejecuciones del plan para todos los años
        $ejecucion = new Ejecucion();
        $ejecuciones_anuales = $ejecucion->Find("id_plan=$id_plan");
        $valores = [];
        foreach ($ejecuciones_anuales as $ejecucion_anual)
        {
            $valores[] = $ejecucion_anual->valor;
        }
        //Grabamos el resultado
        $plan->ejecucion = Util::media($valores);
        $plan->Save();
    }

}
