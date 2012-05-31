<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Icasus :: {$_nombre_pagina|htmlentities}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="generator" content="vim">
<meta name="authors" content="Juan Antonio Ruiz Rivas <juanan@us.es> <http://wikijuanan.com/> , Jesús Martín Corredera <jjmc@us.es>">
<meta name="keywords" content="excelencia, calidad, efqm, plan estratégico, indicadores, cuadro de mando integral">
<meta name="description" content="gestion de la calidad">
<link rel="stylesheet" type="text/css" href="theme/usevilla/main.css">
<!--[if IE]><link rel="stylesheet" href="theme/usevilla/ie.css" type="text/css" media="screen, projection" /><![endif]--> 


{if isset($_javascript)}
  {foreach from=$_javascript item=script} 
    <script type='text/javascript' src="js/{$script}.js"></script>
  {/foreach}
{/if}

</head>

<body>
<div id="wrap">

	<div id="cabecera">
		<div id="logo"><a href="http://www.us.es/"><img src="theme/usevilla/logo.jpg" xalign="left" /></a></div>
		<p class="subtitulo">ICASUS :: Gesti&oacute;n de calidad en la Universidad de Sevilla</p>
		<h1>{$_nombre_pagina}</h1>
	
	{if isset($_usuario)}
		<div id='operario'>
			{if isset($barra_indicadores)}
				<select name='combo_indicadores' id='combo_indicadores' 
					onchange='var url=document.getElementById(this.id).value; window.location = url '>
					<option value='#'>Indicadores de esta unidad</option>
					{foreach from=$barra_indicadores item=i}
					<option value='index.php?page=indicador_datos&id_entidad={$entidad.id_entidad}&id_indicador={$i.id_indicador}'>{$i.nombre}</option>
					{/foreach}
				</select>
				
			{/if}
			&nbsp;
			<a href='javascript:window.history.back();'><img src='/icons/ff16/arrow_undo.png' /> Volver</a>  
			&nbsp;
			<a href='index.php?page=entidad_listar' accesskey='u'><img 
			src='/icons/ff16/chart_organisation.png' /> Unidades</a> 
			&nbsp;
			<a href='index.php?page=usuario_datos&id_usuario={$_usuario->id}&id_entidad=0'><img 
			src='/icons/ff16/user.png' />{$_usuario->login}</a> 
			&nbsp;
			<a href='index.php?page=login'><img src='/icons/ff16/page_white_go.png' /> 
			Salir</a>
		</div>
	{/if}
	</div><!-- #cabecera -->

	<div id='principal'>
		
		<div id="menu">
			{if isset($_usuario)}{include file='menu.tpl'}{/if}
		</div><!-- #menu -->

		<div id="contenido">
    {if isset($smarty.get.error)}
      <p class="error">{$smarty.get.error}</p>
    {/if}
    {if isset($error)}
      <p class="error">{$error}</p>
    {/if}
