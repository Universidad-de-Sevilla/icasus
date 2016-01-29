<?php

//----------------------------------------------------------------------------------
// Proyecto: Icasus
// Fichero: class/Indicador_subunidad.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//----------------------------------------------------------------------------------
// Relaciona los indicadores con las subunidades y los responsables 
// de grabar valores
//----------------------------------------------------------------------------------

class Indicador_subunidad extends ADOdb_Active_Record
{

    public $_table = 'indicadores_subunidades';
    public $indicador;
    public $usuario;
    public $entidad;

    //DEPRECATED public $valores_pendientes; 
    //devuelve los indicadores en los que mide la unidad y no son propios de ella.
    public function indicador_segregado($id_unidad, $id_proceso)
    {
        $db = $this->DB();
        /*
          $query = "SELECT * FROM indicadores_subunidades insu
          INNER JOIN indicadores i ON insu.id_indicador = i.id
          WHERE insu.id_entidad = $id_unidad AND insu.id_indicador
          NOT IN (SELECT id FROM indicadores  WHERE id_entidad = $id_unidad)";
         */
        $query = "SELECT * FROM `indicadores_subunidades` insu
								LEFT JOIN indicadores i
								ON insu.id_indicador = i.id
								WHERE insu.id_entidad = $id_unidad AND i.id_proceso = $id_proceso
								AND insu.id_indicador NOT IN (SELECT id FROM indicadores WHERE id_entidad = $id_unidad)";
        $indicadores = $db->getall($query);
        return $indicadores;
    }

    public function Find_entidades_responsables($id_indicador, $id_usuario)
    {
        $indicador = new Indicador();
        $indicador->load("id = $id_indicador");
        $indicadores_subunidades = array();

        if ($indicador->id_responsable_medicion == $id_usuario OR $indicador->id_responsable == $id_usuario)
        {
            $indicadores_subunidades = $this->Find("id_indicador = $id_indicador");
        }
        //solo le sale las subunidades en las que tiene responsabilidad de grabación
        else
        {
            $indicadores_subunidades = $this->Find("id_usuario = $id_usuario AND id_indicador= $id_indicador");
        }
        if ($indicadores_subunidades)
        {
            foreach ($indicadores_subunidades as & $indicador_subunidad)
            {
                $indicador_subunidad->entidad = new Entidad();
                $indicador_subunidad->entidad->load_joined("id = $indicador_subunidad->id_entidad");

                $indicador_subunidad->usuario = new Usuario();
                $indicador_subunidad->usuario->load("id = $indicador_subunidad->id_usuario");
            }
            // Define la función personalizada para ordenar

            usort($indicadores_subunidades, array($this, "compara_por_etiquetas"));
        }
        return $indicadores_subunidades;
    }

    public function Find_entidades($criterio)
    {
        $indicadores_subunidades = $this->Find($criterio);
        if ($indicadores_subunidades)
        {
            foreach ($indicadores_subunidades as & $indicador_subunidad)
            {
                $indicador_subunidad->entidad = new Entidad();
                $indicador_subunidad->entidad->load("id = $indicador_subunidad->id_entidad");
            }
            usort($indicadores_subunidades, array($this, 'ordenarPorEtiqueta'));
        }
        return $indicadores_subunidades;
    }

    private function quitar_tildes($cadena)
    {
        $no_permitidas = array("á", "é", "í", "ó", "ú", "Á", "É", "Í", "Ó", "Ú", "ñ", "À", "Ã", "Ì", "Ò", "Ù", "Ã™", "Ã ", "Ã¨", "Ã¬", "Ã²", "Ã¹", "ç", "Ç", "Ã¢", "ê", "Ã®", "Ã´", "Ã»", "Ã‚", "ÃŠ", "ÃŽ", "Ã”", "Ã›", "ü", "Ã¶", "Ã–", "Ã¯", "Ã¤", "«", "Ò", "Ã", "Ã„", "Ã‹");
        $permitidas = array("a", "e", "i", "o", "u", "A", "E", "I", "O", "U", "n", "N", "A", "E", "I", "O", "U", "a", "e", "i", "o", "u", "c", "C", "a", "e", "i", "o", "u", "A", "E", "I", "O", "U", "u", "o", "O", "i", "a", "e", "U", "I", "A", "E");
        $texto = str_replace($no_permitidas, $permitidas, $cadena);
        return $texto;
    }

    //Ordena las subunidades de un Indicador/Dato por su etiqueta
    private function ordenarPorEtiqueta($a, $b)
    {
        $cadena1 = $this->quitar_tildes($a->entidad->etiqueta);
        $cadena2 = $this->quitar_tildes($b->entidad->etiqueta);
        return strcasecmp($cadena1, $cadena2);
    }

    //actualiza los registros de la tabla indicador_subunidad de manera asincrona
    //desde el controlador medicion_crear
    public function actualizar_subunidades($id_indicador, $id_entidad)
    {
        $indicator = new Indicador();
        $indicator->load("id = $id_indicador");

        //si existe el registro lo borra
        if ($this->load("id_indicador = $id_indicador AND id_entidad = $id_entidad"))
        {
            $this->delete();
        }
        else//si no existe lo crea
        {
            $this->id_indicador = $id_indicador;
            $this->id_entidad = $id_entidad;

            switch ($indicator->desagregado)
            {
                case 0:
                    $this->id_usuario = $indicator->id_responsable_medicion;
                    break;
                case 1:
                    $usuario_entidad = new Usuario_entidad();
                    // Cargamos al responsable de la unidad para echarle el muerto 
                    // Luego el podrá echárselo a otro
                    if ($usuario_entidad->load("id_entidad = $id_entidad AND id_rol = 1"))
                    {
                        $this->id_usuario = $usuario_entidad->id_usuario;
                    }
                    else
                    {
                        $this->id_usuario = $indicator->id_responsable_medicion;
                    }
                    break;
                case 2:
                    $this->id_usuario = $indicator->id_responsable_medicion;
                    break;
                default:
                    $this->id_usuario = $indicator->id_responsable_medicion;
            }
            $this->save();
        }
    }

    // Define la función personalizada para ordenar
    static function compara_por_etiquetas($a, $b)
    {
        return $a->entidad->etiqueta > $b->entidad->etiqueta;
    }

}
