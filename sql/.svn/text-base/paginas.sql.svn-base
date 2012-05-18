CREATE TABLE  `icasus`.`paginas` (
  `id` int(11) NOT NULL auto_increment,
  `titulo` varchar(250) NOT NULL,
  `contenido` text NOT NULL,
  `alias` varchar(50) NOT NULL,
  `modified` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

CREATE TABLE  `icasus`.`tags` (
  `id` int(11) NOT NULL auto_increment,
  `tag` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

CREATE TABLE  `icasus`.`paginas_tags` (
  `pagina_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY  (`tag_id`,`pagina_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

CREATE TABLE  `icasus`.`comentarios` (
  `id` int(11) NOT NULL auto_increment,
  `texto` text NOT NULL,
  `id_usuario` int(11) default NULL,
  `created` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

