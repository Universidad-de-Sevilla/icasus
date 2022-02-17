<?php
/**
 * Migrar datos de indicadores de Icasus 1 a Icasus 3
 * @author Ramón M. gómez <ramongomez@us.es>
 * @note Este script debe ejecutarse con el comando "php" desde una terminal.
 */

// Comprobar que se está ejecutando el comando "php" y verificar parámetros de entrada
if (PHP_SAPI !== 'cli') {
    echo "*** Solo ejecutable desde el comando php.\n";
    exit(1);
}
if ($argc < 2) {
    echo "*** Error de ejecución. Formato: php " . basename($argv[0]) . " listar | IdEntidad ...\n";
    exit(1);
}

// Fichero de configuración
include(__DIR__ . '/../app_code/app_config.php');

// Abrir conexiones a BD
$ic1 = @mysqli_connect(ICASUS1_DB_HOST, ICASUS1_DB_LOGIN, ICASUS1_DB_CLAVE, ICASUS1_DB_DATABASE);
$ic3 = @mysqli_connect(IC_DB_HOST, IC_DB_LOGIN, IC_DB_CLAVE, IC_DB_DATABASE);
if (!$ic1 or !$ic3) {
    echo "*** Error de conexión a la BD.\n";
    exit(1);
}

if ($argv[1] === 'listar') {
    echo "\tEntidades definidas en Icasus 1:\n";
    foreach (consultar($ic1, "SELECT id_entidad, codigo, nombre FROM entidad;") as $ent) {
        printf("%4d  %-30s  %s\n", $ent['id_entidad'], $ent['codigo'],
            iconv("UTF-8", "ISO-8859-1//TRANSLIT", $ent['nombre']));
    }
    exit();
}
// Ids de las entidades a migrar
$id_entidades = array_slice($argv, 1);
// Solicitar confirmación
echo "Migración de los indicadores de las entidades con id.: " . implode(', ', $id_entidades) . ".\n";
$seguir = readline("¿Continuar con la operación? (s/N): ");
if ($seguir !== "s") {
    exit(0);
}

foreach ($id_entidades as $id_entidad) {
    echo "Entidad con id. $id_entidad.";
    foreach (consultar($ic1, "SELECT * FROM indicador WHERE id_entidad = '$id_entidad';") as $ind) {
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
                . "id_visibilidad, id_tipo_agregacion_temporal, codigo, nombre, descripcion, formulacion, "
                . "periodicidad, fuente_informacion, id_tipo_agregacion, fuente_datos, fecha_creacion) VALUES ("
                . "$id_entidad, ${proc3['id']}, ${resp3['id']}, ${resp3['id']}, '${ind['id_visibilidad']}', 0, '${ind['codigo']}', "
                . "'" . iconv("UTF-8", "ISO-8859-1//TRANSLIT", $ind['nombre']) . "', "
                . "'" . iconv("UTF-8", "ISO-8859-1//TRANSLIT", $ind['descripcion']) . "', "
                . "'" . iconv("UTF-8", "ISO-8859-1//TRANSLIT", $ind['formulacion']) . "', "
                . "CASE '{$ind['periodicidad']}' WHEN '1' THEN 'Mensual' WHEN '3' THEN 'Trimestral' WHEN '6' THEN 'Semestral' WHEN '12' THEN 'Anual' END, "
                . "'" . iconv("UTF-8", "ISO-8859-1//TRANSLIT", $ind['fuente']) . "', 0, "
                . "'" . iconv("UTF-8", "ISO-8859-1//TRANSLIT", $ind['fuente']) . "', "
                . (isset($ind['fecha_creacion']) ? "'" . $ind['fecha_creacion'] . "'" : 'NULL') . ");";
            if (!mysqli_query($ic3, $sql)) {
                echo "*** Error al crear el indicador '${ind['codigo']}'.\n";
                continue;
            } else {
                $id_ind3 = mysqli_insert_id($ic3);
                echo "Creado nuevo indicador '${ind['codigo']}' con id. '$id_ind3'.\n";
            }
            $ind3 = consultar($ic3, "SELECT * FROM icasus_indicador WHERE id = " . $id_ind3)[0] ?? null;
        }
        // Leer valores
        $valores = consultar($ic1, "SELECT * FROM valor WHERE id_indicador = ${ind['id_indicador']};");
        foreach ($valores as $val) {
            $val3 = consultar($ic3, "SELECT * FROM icasus_medicion WHERE id_indicador = ${ind3['id']} AND "
                    . "etiqueta = ". date("Y", $val['fecha_recogida']) . ";")[0] ?? null;
            if (null === $val3) {
                // Crear medición
                $sql = "INSERT INTO icasus_medicion (id_indicador, etiqueta, periodo_inicio, periodo_fin, "
                    . "grabacion_inicio, grabacion_fin) VALUES ("
                    . "${ind3['id']}, '" . date("Y", $val['fecha_recogida']) . "', "
                    . "'" . date("Y-01-01", $val['fecha_recogida']) . "', "
                    . "'" . date("Y-12-31", $val['fecha_recogida']) . "', "
                    . "'" . date("Y-m-d", $val['fecha_recogida']) . "', "
                    . "'" . date("Y-m-d", $val['fecha_recogida']) . "');";
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
                    . "'" . date("Y-m-d", $val['fecha_recogida']) . "', 1, '${val['observaciones']}');";
                if (!mysqli_query($ic3, $sql)) {
                    echo "*** Error al crear valor para la medición con id. '$id_med3' del indicador '${ind['codigo']}'.\n";
                } else {
                    $id_val3 = mysqli_insert_id($ic3);
                    echo "Creada valor con id '$id_val3' asociado a la medición '$id_med3'.\n";
                }
            } else {
                echo "Valor ya migrado con id '{$val3['id']}'\n";
            }
        }
        // Actualizar el histórico del indicador con la medición más antigua
        $sql = "UPDATE icasus_indicador SET historicos = "
            . "(SELECT MIN(etiqueta) FROM icasus_medicion WHERE id_indicador = ${ind3['id']}) "
            . "WHERE id = ${ind3['id']};";
        mysqli_query($ic3, $sql);
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
