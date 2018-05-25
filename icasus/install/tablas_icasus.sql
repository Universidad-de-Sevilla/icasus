# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# ************************************************************

# Volcado de tabla icasus_analisis
# ------------------------------------------------------------

CREATE TABLE `icasus_analisis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_indicador` int(10) unsigned NOT NULL,
  `anyo` smallint(5) unsigned NOT NULL,
  `analisis` text,
  `plan_accion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_carta
# ------------------------------------------------------------

CREATE TABLE `icasus_carta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_entidad` int(11) unsigned NOT NULL,
  `id_cuadro` int(11) unsigned DEFAULT NULL,
  `fecha` date NOT NULL,
  `mision` text,
  `vision` text,
  `valores` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_compromiso
# ------------------------------------------------------------

CREATE TABLE `icasus_compromiso` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_servicio` int(10) unsigned NOT NULL,
  `indice` int(10) unsigned NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_compromiso_indicador
# ------------------------------------------------------------

CREATE TABLE `icasus_compromiso_indicador` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_compromiso` int(10) unsigned NOT NULL,
  `id_indicador` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_criterio_efqm
# ------------------------------------------------------------

CREATE TABLE `icasus_criterio_efqm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL DEFAULT '',
  `nombre` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_criterio_efqm_indicador
# ------------------------------------------------------------

CREATE TABLE `icasus_criterio_efqm_indicador` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_criterio_efqm` int(10) unsigned DEFAULT NULL,
  `id_indicador` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_cuadro
# ------------------------------------------------------------

CREATE TABLE `icasus_cuadro` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `privado` tinyint(1) NOT NULL DEFAULT '1',
  `comentarios` text CHARACTER SET utf8,
  `id_entidad` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_derecho
# ------------------------------------------------------------

CREATE TABLE `icasus_derecho` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carta` int(10) unsigned NOT NULL,
  `nombre` varchar(100) CHARACTER SET latin1 NOT NULL,
  `categoria` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `descripcion` text CHARACTER SET latin1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_ejecucion
# ------------------------------------------------------------

CREATE TABLE `icasus_ejecucion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_plan` int(10) unsigned DEFAULT NULL,
  `id_linea` int(10) unsigned DEFAULT NULL,
  `id_objest` int(10) unsigned DEFAULT NULL,
  `id_objop` int(10) unsigned DEFAULT NULL,
  `anyo` int(10) unsigned NOT NULL,
  `valor` double NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `resultado` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_entidad
# ------------------------------------------------------------

CREATE TABLE `icasus_entidad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orden` tinyint(4) DEFAULT NULL,
  `nombre` varchar(75) NOT NULL DEFAULT '',
  `etiqueta` varchar(50) NOT NULL DEFAULT '',
  `etiqueta_mini` varchar(12) DEFAULT NULL,
  `web` varchar(250) DEFAULT NULL,
  `id_madre` int(11) unsigned NOT NULL DEFAULT '1',
  `codigo` varchar(50) NOT NULL DEFAULT '',
  `anotaciones` text,
  `objeto` varchar(250) DEFAULT NULL,
  `ict` int(1) DEFAULT NULL,
  `frecuencia` varchar(250) DEFAULT NULL,
  `inicio` int(11) DEFAULT NULL,
  `fin` int(11) DEFAULT NULL,
  `es_organica` tinyint(1) DEFAULT NULL,
  `mapa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_fichero
# ------------------------------------------------------------

CREATE TABLE `icasus_fichero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_objeto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `descripcion` text,
  `tipo_objeto` varchar(200) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `extension` varchar(4) NOT NULL,
  `visible` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_indicador
# ------------------------------------------------------------

CREATE TABLE `icasus_indicador` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_entidad` int(11) unsigned DEFAULT '0',
  `id_proceso` int(11) unsigned DEFAULT NULL,
  `id_responsable` int(11) DEFAULT NULL COMMENT 'Responsable de seguimiento',
  `id_responsable_medicion` int(11) DEFAULT NULL,
  `id_visibilidad` tinyint(4) DEFAULT '1',
  `id_tipo_agregacion_temporal` int(11) DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT '',
  `descripcion` text,
  `formulacion` text,
  `calculo` varchar(250) DEFAULT NULL,
  `periodicidad` varchar(50) DEFAULT '',
  `fuente_informacion` varchar(250) DEFAULT '' COMMENT 'Origen o referencia del indicador',
  `id_tipo_agregacion` int(11) DEFAULT NULL,
  `fuente_datos` varchar(250) DEFAULT NULL,
  `desagregado` int(1) DEFAULT NULL COMMENT '0->No está desegregado, responable de medición 1->Esta desagregado, responsable de centro 2->Esta desagregado, responsable de medición',
  `evidencia` varchar(250) DEFAULT NULL,
  `historicos` smallint(6) DEFAULT NULL,
  `unidad_generadora` varchar(250) DEFAULT NULL,
  `interpretacion` text,
  `fecha_creacion` date DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `observaciones` text,
  `valor_min` double DEFAULT NULL,
  `valor_max` double DEFAULT NULL,
  `inverso` tinyint(1) NOT NULL,
  `archivado` date DEFAULT NULL,
  `control` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Index_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_indicador_dependencia
# ------------------------------------------------------------

CREATE TABLE `icasus_indicador_dependencia` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_calculado` int(11) unsigned NOT NULL,
  `id_operando` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_indicador_subunidad
# ------------------------------------------------------------

CREATE TABLE `icasus_indicador_subunidad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_indicador` int(10) unsigned NOT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `id_entidad` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_linea
# ------------------------------------------------------------

CREATE TABLE `icasus_linea` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_plan` int(10) unsigned NOT NULL,
  `indice` int(10) unsigned NOT NULL,
  `nombre` varchar(150) NOT NULL DEFAULT '',
  `ejecucion` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_medicion
# ------------------------------------------------------------

CREATE TABLE `icasus_medicion` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_indicador` int(10) unsigned NOT NULL,
  `etiqueta` varchar(50) NOT NULL DEFAULT '',
  `periodo_inicio` date DEFAULT NULL,
  `periodo_fin` date DEFAULT NULL,
  `grabacion_inicio` date DEFAULT NULL,
  `grabacion_fin` date DEFAULT NULL,
  `observaciones` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_normativa
# ------------------------------------------------------------

CREATE TABLE `icasus_normativa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carta` int(10) unsigned NOT NULL,
  `nombre` varchar(100) CHARACTER SET latin1 NOT NULL,
  `enlace` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_objetivo_estrategico
# ------------------------------------------------------------

CREATE TABLE `icasus_objetivo_estrategico` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_linea` int(10) unsigned NOT NULL,
  `indice` int(10) unsigned NOT NULL,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `ejecucion` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_objetivo_indicador
# ------------------------------------------------------------

CREATE TABLE `icasus_objetivo_indicador` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_objop` int(10) unsigned NOT NULL,
  `id_indicador` int(10) unsigned NOT NULL,
  `control` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_objetivo_operacional
# ------------------------------------------------------------

CREATE TABLE `icasus_objetivo_operacional` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_objest` int(10) unsigned NOT NULL,
  `id_responsable` int(10) unsigned NOT NULL,
  `indice` int(10) unsigned NOT NULL,
  `nombre` varchar(250) NOT NULL DEFAULT '',
  `ejecucion` double NOT NULL,
  `descendente` tinyint(1) NOT NULL,
  `peso` double NOT NULL DEFAULT '1',
  `observaciones` text,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_objetivo_unidad
# ------------------------------------------------------------

CREATE TABLE `icasus_objetivo_unidad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_objop` int(10) unsigned NOT NULL,
  `id_entidad` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_pagina
# ------------------------------------------------------------

CREATE TABLE `icasus_pagina` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL DEFAULT '',
  `contenido` text NOT NULL,
  `alias` varchar(50) NOT NULL DEFAULT '',
  `modified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_panel
# ------------------------------------------------------------

CREATE TABLE `icasus_panel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_cuadro` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL DEFAULT '',
  `id_paneltipo` tinyint(4) NOT NULL,
  `id_medicion` int(10) unsigned DEFAULT NULL,
  `orden` smallint(6) DEFAULT NULL,
  `ancho` tinyint(4) DEFAULT NULL,
  `periodicidad` varchar(25) DEFAULT NULL,
  `anyo_inicio` smallint(6) DEFAULT NULL,
  `anyo_fin` smallint(6) DEFAULT NULL,
  `anyos_atras` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_panel_indicador
# ------------------------------------------------------------

CREATE TABLE `icasus_panel_indicador` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_panel` int(11) unsigned NOT NULL,
  `id_indicador` int(10) unsigned NOT NULL,
  `id_entidad` int(11) unsigned NOT NULL,
  `mostrar_referencias` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_panel_tipo
# ------------------------------------------------------------

CREATE TABLE `icasus_panel_tipo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `ancho_pred` tinyint(4) NOT NULL,
  `clase_css` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_plan
# ------------------------------------------------------------

CREATE TABLE `icasus_plan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_entidad` int(11) NOT NULL,
  `anyo_inicio` int(11) NOT NULL,
  `duracion` int(11) NOT NULL,
  `mision` text,
  `vision` text,
  `valores` text,
  `fce` text,
  `titulo` varchar(100) DEFAULT NULL,
  `ejecucion` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_proceso
# ------------------------------------------------------------

CREATE TABLE `icasus_proceso` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_madre` int(11) unsigned DEFAULT '0',
  `nombre` varchar(250) DEFAULT NULL,
  `id_cuadro` int(11) unsigned DEFAULT '0',
  `id_entidad` int(11) unsigned DEFAULT NULL,
  `id_propietario` int(11) unsigned DEFAULT NULL,
  `actividades` text,
  `activo` tinyint(1) DEFAULT '1',
  `alcance` varchar(250) DEFAULT NULL,
  `clientes` varchar(250) DEFAULT NULL,
  `codigo` varchar(250) DEFAULT NULL,
  `documentacion` text,
  `equipo_de_proceso` text,
  `entradas` varchar(250) DEFAULT NULL,
  `fecha_revision` datetime DEFAULT NULL,
  `mediciones` varchar(250) DEFAULT NULL,
  `mision` text,
  `proveedores` varchar(250) DEFAULT NULL,
  `resultados_clave` text,
  `revision` varchar(5) DEFAULT NULL,
  `salidas` varchar(250) DEFAULT NULL,
  `registros` varchar(250) DEFAULT NULL,
  `variables_control` text,
  `observaciones` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_rol
# ------------------------------------------------------------

CREATE TABLE `icasus_rol` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `orden` int(11) NOT NULL,
  `objeto` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_servicio
# ------------------------------------------------------------

CREATE TABLE `icasus_servicio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carta` int(10) unsigned NOT NULL,
  `indice` int(10) unsigned NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_tipo_agregacion
# ------------------------------------------------------------

CREATE TABLE `icasus_tipo_agregacion` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `operador` varchar(50) DEFAULT NULL,
  `explicacion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_usuario
# ------------------------------------------------------------

CREATE TABLE `icasus_usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `clave` varchar(45) DEFAULT '',
  `nombre` varchar(45) NOT NULL DEFAULT '',
  `apellidos` varchar(75) NOT NULL DEFAULT '',
  `nif` varchar(10) NOT NULL DEFAULT '',
  `correo` varchar(75) NOT NULL DEFAULT '',
  `telefono` varchar(15) DEFAULT NULL,
  `mis_notas` text,
  `unidad_hominis` varchar(200) DEFAULT NULL,
  `puesto` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_usuario_entidad
# ------------------------------------------------------------

CREATE TABLE `icasus_usuario_entidad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned NOT NULL DEFAULT '0',
  `id_entidad` int(10) unsigned NOT NULL DEFAULT '0',
  `id_rol` int(11) NOT NULL,
  `principal` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_usuario` (`id_usuario`,`id_entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_valor
# ------------------------------------------------------------

CREATE TABLE `icasus_valor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_medicion` int(10) unsigned NOT NULL DEFAULT '0',
  `id_entidad` int(10) unsigned NOT NULL DEFAULT '0',
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `valor_parcial` double DEFAULT NULL,
  `fecha_recogida` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `observaciones` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


# Volcado de tabla icasus_valor_referencia
# ------------------------------------------------------------

CREATE TABLE `icasus_valor_referencia` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_indicador` int(10) unsigned DEFAULT NULL,
  `activo` tinyint(4) DEFAULT '1',
  `etiqueta` varchar(100) NOT NULL DEFAULT '',
  `grafica` tinyint(1) DEFAULT '1',
  `nombre` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_valor_referencia_medicion
# ------------------------------------------------------------

CREATE TABLE `icasus_valor_referencia_medicion` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_valor_referencia` int(10) unsigned NOT NULL,
  `id_medicion` int(10) unsigned NOT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



# Volcado de tabla icasus_visibilidad
# ------------------------------------------------------------

CREATE TABLE `icasus_visibilidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

