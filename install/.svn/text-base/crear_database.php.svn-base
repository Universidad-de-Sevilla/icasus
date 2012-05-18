<?php

// Version: 0.4.1
if (isset($_POST['database'] && isset($_POST['usuario'] && isset($_POST['password'] && isset($_POST['servidor'])
{
	$database = $_POST['database']; 
	$usuario = $_POST['usuario']; 
	$password = $_POST['password']; 
	$servidor = $_POST['servidor']; 
	
	$adodb = NewADOConnection('mysql://'.I.':'.IC_DB_CLAVE.'@'.IC_DB_HOST.'/'.IC_DB_DATABASE);
}
else 
{
	header('install/instalar.php');
}	


$db->Execute("USE $database;");

$db->Execute("CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL auto_increment,
  `texto` text NOT NULL,
  `id_usuario` int(11) default NULL,
  `created` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;");

$db->Execute("CREATE TABLE `dimension` (
  `id_dimension` int(11) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY  (`id_dimension`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;");

$db->Execute("CREATE TABLE `entidad` (
  `id_entidad` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(75) NOT NULL default '',
  `web` varchar(250) default NULL,
  PRIMARY KEY  (`id_entidad`),
  KEY `Index_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `entidad` VALUES (1,'AdministraciÃ³n Icasus','http://icasus.forja.rediris.es/');");

$db->Execute("CREATE TABLE `indicador` (
  `id_indicador` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(100) NOT NULL default '',
  `descripcion` text NOT NULL,
  `formulacion` text NOT NULL,
  `umbral` varchar(50) NOT NULL default '0',
  `id_entidad` int(10) unsigned NOT NULL default '0',
  `id_responsable` int(10) unsigned default '0',
  `periodicidad` varchar(50) NOT NULL default '',
  `fuente` varchar(100) NOT NULL default '',
  `objetivo` varchar(50) default NULL,
  `id_dimension` int(11) default NULL,
  `id_proceso` int(11) default NULL,
  `codigo` varchar(10) default NULL,
  PRIMARY KEY  (`id_indicador`),
  KEY `Index_nombre` (`nombre`),
  KEY `Index_entidad` (`id_entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;");

$db->Execute("CREATE TABLE `paginas` (
  `id` int(11) NOT NULL auto_increment,
  `titulo` varchar(250) NOT NULL,
  `contenido` text NOT NULL,
  `alias` varchar(50) NOT NULL,
  `modified` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;");

$db->Execute("CREATE TABLE `paginas_tags` (
  `pagina_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY  (`tag_id`,`pagina_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;");

$db->Execute("CREATE TABLE `permiso` (
  `id_usuario` int(11) NOT NULL,
  `page` varchar(100) NOT NULL,
  `id_objeto` int(11) NOT NULL,
  PRIMARY KEY  USING BTREE (`id_usuario`,`page`,`id_objeto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;");

$db->Execute("CREATE TABLE `proceso` (
  `id_proceso` int(11) NOT NULL auto_increment,
  `nombre` varchar(250) NOT NULL,
  `id_propietario` int(11) default NULL,
  `id_entidad` int(11) NOT NULL,
  `codigo` varchar(50) default NULL,
  PRIMARY KEY  (`id_proceso`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;");

$db->Execute("CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL auto_increment,
  `nombre` varchar(250) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY  (`id_rol`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;");

$db->Execute("CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `tag` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;");

$db->Execute("CREATE TABLE `usuario` (
  `id_usuario` int(10) unsigned NOT NULL auto_increment,
  `login` varchar(15) NOT NULL default '',
  `clave` varchar(45) NOT NULL default '',
  `nombre` varchar(45) NOT NULL default '',
  `apellidos` varchar(75) NOT NULL default '',
  `nif` varchar(10) NOT NULL default '',
  `correo` varchar(45) NOT NULL default '',
  `telefono` varchar(15) default NULL,
  PRIMARY KEY  (`id_usuario`),
  KEY `Index_login` (`login`),
  KEY `Index_apellidos` (`apellidos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;");

$db->Execute("CREATE TABLE `usuario_entidad` (
  `id_usuario` int(10) unsigned NOT NULL default '0',
  `id_entidad` int(10) unsigned NOT NULL default '0',
  `id_rol` int(11) default NULL,
  PRIMARY KEY  (`id_usuario`,`id_entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;");

$db->Execute("CREATE TABLE `valor` (
  `id_valor` int(10) unsigned NOT NULL auto_increment,
  `id_indicador` int(10) unsigned NOT NULL default '0',
  `fecha_recogida` bigint(20) default NULL,
  `fecha_entrada` bigint(20) default NULL,
  `valor` char(50) NOT NULL default '0',
  `periodo` char(45) NOT NULL default '',
  `id_usuario` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id_valor`),
  KEY `Index_indicador` (`id_indicador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;");

?>
