<?php
/**
 * Migrar datos de indicadores de Icasus 1 a Icasus 3
 * @author Ramón M. gómez <ramongomez@us.es>
 * @note Este script debe ejecutarse con el comando "php" desde una terminal.
 */

include(__DIR__ . '/../app_code/app_config.php');

// Abrir conexiones a BD
$ic1 = mysqli_connect(ICASUS1_DB_HOST, ICASUS1_DB_LOGIN, ICASUS1_DB_CLAVE, ICASUS1_DB_DATABASE);
$ic3 = mysqli_connect(IC_DB_HOST, IC_DB_LOGIN, IC_DB_CLAVE, IC_DB_DATABASE);
if (!$ic1 or !$ic3) {
    echo "*** Error de conexión a la BD.\n";
    exit(1);
}

// Ids. de las entidades a migrar
$id_entidades = [88];

foreach ($id_entidades as $id_entidad) {
    $indicadores = consultar($ic1, "SELECT * FROM indicador WHERE id_entidad = $id_entidad;");
    foreach ($indicadores as $ind) {
        $resp = consultar($ic1, "SELECT * FROM usuario WHERE id_usuario = ${ind['id_responsable']};")[0];
        // Obtener responsable
        $resp3 = consultar($ic3, "SELECT * FROM icasus_usuario WHERE login = '${resp['login']}';")[0] ?? null;
        if (null === $resp3) {
            // Insertar los nuevos responsables basándose en datos de AA_personas
            $persona = consultar($ic3, "SELECT * FROM AA_personas WHERE uvus = '${resp['login']}';")[0] ?? null;
            if (null === $persona) {
                echo "*** El usuario '${resp['login']}' no existe.\n";
                continue;
            }
            $sql = "INSERT INTO icasus_usuario (login, nombre, apellidos, nif, correo) " .
                   "VALUES ('${persona['uvus']}', '${persona['nombre']}', " .
                   "'${persona['apellidos']}', '${persona['nif']}', '${persona['correo1']}');";
            if (!mysqli_query($ic3, $sql)) {
                echo "*** Error al crear el usuario '${resp['login']}'.\n";
                continue;
            }
            $id = mysqli_insert_id($ic3);
            echo "Creado usuario '${resp['login']}' con id. '$id'.\n";
            $sql = "INSERT INTO icasus_usuario_entidad (id_usuario, id_entidad, id_rol) VALUES ($id, $id_entidad, 3);";
            if (mysqli_query($ic3, $sql)) {
                echo "Nuevo usuario con id. '$id' añadido a la entidad con id. '$id_entidad'.\n";
            }
            $resp3 = consultar($ic3, "SELECT * FROM icasus_usuario WHERE id = " . $id)[0] ?? null;
        }
        $proc = consultar($ic1, "SELECT * FROM proceso WHERE id_proceso = '${ind['id_proceso']}';")[0] ?? null;
        // Obtener proceso
        $proc3 = consultar($ic3, "SELECT * FROM icasus_proceso WHERE codigo = '${proc['codigo']}';")[0] ?? null;
        if (null === $proc3) {
            echo "*** El proceso '${proc['codigo']}' no existe.\n";
            continue;
        }
        // Crear indicador, si no existe
        $ind3 = consultar($ic3, "SELECT * FROM icasus_indicador WHERE codigo = '${ind['codigo']}';")[0] ?? null;
        if (null === $ind3) {
            $sql = "INSERT INTO icasus_indicador (id_entidad, id_proceso, id_responsable, id_responsable_medicion, "
                . "id_visibilidad, codigo, nombre, descripcion, formulacion, periodicidad, fuente_informacion, "
                . "fuente_datos, fecha_creacion) VALUES ("
                . "$id_entidad' ${proc3['id']}, ${resp3['id']}, ${resp3['id']}, '${ind['id_visibilidad']}', '${ind['codigo']}', "
                . "'" . iconv("UTF-8", "ISO-8859-1//TRANSLIT", $ind['nombre']) . "', "
                . "'" . iconv("UTF-8", "ISO-8859-1//TRANSLIT", $ind['descripcion']) . "', "
                . "'" . iconv("UTF-8", "ISO-8859-1//TRANSLIT", $ind['formulacion']) . "', "
                . "CASE '{$ind['periodicidad']}' WHEN '1' THEN 'Mensual' WHEN '3' THEN 'Trimestral' WHEN '6' THEN 'Semestral' WHEN '12' THEN 'Anual' END, "
                . "'" . iconv("UTF-8", "ISO-8859-1//TRANSLIT", $ind['fuente']) . "', "
                . "'" . iconv("UTF-8", "ISO-8859-1//TRANSLIT", $ind['fuente']) . "', "
                . "'${$ind['fecha_creacion']}';";
            if (!mysqli_query($ic3, $sql)) {
                echo "*** Error al crear el indicador '${ind['codigo']}'.\n";
                continue;
            } else {
                $id_ind3 = mysqli_insert_id($ic3);
                echo "Creado nuevo indicador '${ind['codigo']}' con id. '$id'.\n";
            }
            $ind3 = consultar($ic3, "SELECT * FROM icasus_indicador WHERE id = " . $id_ind3)[0] ?? null;
        }
        // Leer valores
        $valores = consultar($ic1, "SELECT * FROM valor WHERE id_indicador = ${ind['id_indicador']};");
	    foreach ($valores as $val) {
            // Crear medición
            $sql = "INSERT INTO icasus_medicion (id_indicador, etiqueta, periodo_inicio, periodo_fin, "
                . "grabacion_inicio, grabacion_fin) VALUES ("
                 . "$id_ind3, YEAR(${val['f_entrada']}), "
                 . "CONCAT(YEAR(${val['f_entrada']}), '-01-01'), CONCAT(YEAR(${val['f_entrada']}), '-12-31'), "
                 . "'${val['f_entrada']}', '${val['f_entrada']}');";
            if (!mysqli_query($ic3, $sql)) {
                echo "*** Error al crear medición con fecha '${val['f_entrada']}' del indicador '${ind['codigo']}'.\n";
                continue;
	        } else {
                $id_med3 = mysqli_insert_id($ic3);
                echo "Creada medición con id '$id_med3' del indicador '${ind3['id']}'.\n";
	        }
            // Crear valor
            $sql = "INSERT INTO icasus_valor (id_medicion, id_entidad, id_usuario, valor, valor_parcial, "
                . "fecha_recogida, activo, observaciones) VALUES ("
                . "$id_med3, $id_entidad, ${val['id_usuario']}, '${val['valor']}', '${val['valor']}', "
                . "'${val['f_recogida']}', 1, '${val['observaciones']}');";
            if (!mysqli_query($ic3, $sql)) {
                echo "*** Error al crear valor para la medición con id. '$id_med3' del indicador '${ind['codigo']}'.\n";
            } else {
                $id_val3 = mysqli_insert_id($ic3);
                echo "Creada valor con id '$id_val3' asociado a la medición '$id_med3'.\n";
            }
        }
    }
}

// Cerrar conexiones
mysqli_close($ic1);
mysqli_close($ic3);


/**
 * Consultar la BD
 * @param mysqli $conexion Conector de la BD
 * @param string $sql Consulta SQL
 * @return array Datos obtenidos
 */
function consultar(mysqli $conexion, string $sql): array {
	$salida = [];
	$res = mysqli_query($conexion, $sql);
	while ($fila = mysqli_fetch_array($res)) {
		$salida[] = $fila;
	}
	return $salida;
}
