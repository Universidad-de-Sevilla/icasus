<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: clase_cvs.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: exporta e importa datos de ficheros en formato CVS (valores separados por comas)
//---------------------------------------------------------------------------------------------------
/*
class cvs {
    
    var $ruta_fichero;   
    var $dirbase;
   
   
    // Constructor
    // TODO: creo que no va a ser necesario
    function cvs ($dir_base) {
        // le paso esta variable al constructor porque no se porqué no la pilla del global
        $this->dir_base = $dir_base;
    }
    
   
   
    // Borra un fichero si existe antes de crearlo de nuevo
    // Quizas no haga falta si fopen machaca bien los ficheros existentes
    function borrar_fichero(){
        // Comprueba que el fichero existe antes de borrarlo
        if (file_exists($this->ruta_fichero)) {
            // Borra el fichero
            if (unlink($this->ruta_fichero)) { return true; }
            else { return false; }
        }
        else { return true; }
    }


    // Exporta los datos pasados como un array a un fichero cvs
    // Ejemplo de uso   
    // $archivo = new csv();
    // $url = $archivo->exportar_datos($datos,"indicadores",$id_indicador);

    function exportar_datos($datos,$tipo_datos,$identificador) {
        // Asignamos el nombre al nuevo fichero
        $this->asigna_nombre_fichero($tipo_datos, $identificador);
        // Antes de crear el fichero borramos el anterior para no saturar el disco duro
        $this->borrar_fichero($this->ruta_fichero);
        // Abre un fichero y lo asigna a un puntero
        if ($puntero_fichero = fopen($this->ruta_fichero,'w')) {
            foreach ($datos as $fila) {
                $nueva_fila = "\"";
                $primera_fila = "\"";
                foreach ($fila as $nombre => $valor) {
                    $nueva_fila .= $valor . "\";\"";
                    // TODO: Esto es una chapuza gorda
                    $primera_fila .= $nombre . "\";\"";
                }
                // Quitamos a la nueva fila la ultima comilla y la coma y agregamos salto de linea
                // Quizas el salto de linea no haga falta
                $nueva_fila = substr($nueva_fila, 0, -2) . "\n";
                $nueva_fila = utf8_decode($nueva_fila);
                $filas .= $nueva_fila; 
            }

            $primera_fila = substr($primera_fila, 0, -2) . "\n";
            $primera_fila = utf8_decode($primera_fila);
            fwrite($puntero_fichero,$primera_fila);
            fwrite($puntero_fichero,$filas);
            fclose($puntero_fichero);
			// Devuelve la url que lleva al fichero para poder descargarlo
			$url = dirname($_SERVER['REQUEST_URI']) . "/csv/" . basename($this->ruta_fichero);
			return $url;
            
        }
		else 
		{ 
			return false; 
		}
    }       
    
    //Asigna el nombre a un fichero en funcion del tipo de dato y del identificador
    function asigna_nombre_fichero($tipo_datos,$identificador) {
        switch ($tipo_datos) {
            case "indicadores":
                $nombre_fichero = "indicadores_entidad";
                 break;
            case "valores":
                $nombre_fichero = "valores_indicador";
                break;
        }
        // Completa con el identificador de la entidad o del indicador y la extension del archivo
        $nombre_fichero .= $identificador . ".csv";
        // Pega la ruta del directorio definidad en icasus.config
        //$this->ruta_fichero = $ic_dir_csv . $nombre_fichero;

        $this->ruta_fichero = $_SERVER['DOCUMENT_ROOT'] . $this->dir_base . "csv/" . $nombre_fichero;
        return $true;
    }
    
    function obtener_ruta_fichero() {
        return $this->ruta_fichero;
    }

    // Devuelve la url que lleva al fichero para poder descargarlo
    function obtener_url_fichero() {
        $url = dirname($_SERVER['REQUEST_URI']) . "/csv/" . basename($this->ruta_fichero);
        return $url;
    }
    
}
*/
?>
