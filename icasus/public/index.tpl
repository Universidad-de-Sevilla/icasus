<!doctype html public "✰">
<!--[if lt IE 7]> <html lang="en-us" class="no-js ie6"> <![endif]-->
<!--[if IE 7]>    <html lang="en-us" class="no-js ie7"> <![endif]-->
<!--[if IE 8]>    <html lang="en-us" class="no-js ie8"> <![endif]-->
<!--[if IE 9]>    <html lang="en-us" class="no-js ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html lang="es-es" class="no-js"> 
    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>{$_nombre_pagina} - {$smarty.const.TXT_ICASUS} - {$smarty.const.TXT_UNIVERSIDAD}</title>
        <meta name="description" content="Gestión de Indicadores de Calidad">
        <link rel=icon href=favicon.ico sizes="32x32 48x48" type="image/vnd.microsoft.icon">

        <!-- iPhone, iPad and Android specific settings -->	
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <link rel="apple-touch-icon" href="theme/danpin/images/iOS_icon.png">
        <link rel="apple-touch-startup-image" href="theme/danpin/images/iOS_startup.png">

        <!-- Styles -->
        <link rel="stylesheet" type="text/css" href="theme/danpin/styles/reset.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/fancybox/jquery.fancybox-1.3.4.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/tinyeditor/style.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/slidernav/slidernav.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/syntax_highlighter/styles/shCore.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/syntax_highlighter/styles/shThemeDefault.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/uitotop/css/ui.totop.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/fullcalendar/fullcalendar.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/isotope/isotope.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/elfinder/css/elfinder.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/tiptip/tipTip.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/uniform/css/uniform.aristo.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/multiselect/css/ui.multiselect.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/selectbox/jquery.selectBox.css">
        <!--<link rel="stylesheet" type="text/css" href="theme/danpin/scripts/colorpicker/css/colorpicker.css">-->
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/uistars/jquery.ui.stars.min.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/scripts/themeroller/Aristo.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/styles/text.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/styles/grid.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/styles/main.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/styles/theme/theme_base.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/styles/graficas.css">

        <!-- Style Switcher  
        The following stylesheet links are used by the styleswitcher to allow for dynamically changing how Adminica looks and acts.
        Styleswitcher documentation: http://style-switcher.webfactoryltd.com/documentation/
        
        switcher1.php : layout - fluid by default.								(eg. styles/theme/switcher1.php?default=layout_fixed.css)
        switcher2.php : header and sidebar positioning - sidebar by default.	(eg. styles/theme/switcher1.php?default=header_top.css)
        switcher3.php : colour skin - black/grey by default.					(eg. styles/theme/switcher1.php?default=theme_red.css)
        switcher4.php : background image - dark boxes by default.				(eg. styles/theme/switcher1.php?default=bg_honeycomb.css)
        switcher5.php : controls the theme - dark by default.					(eg. styles/theme/switcher1.php?default=theme_light.css)
        -->

        <link rel="stylesheet" type="text/css" href="theme/danpin/styles/theme/switcher.css" media="screen">
        <!--
<link rel="stylesheet" type="text/css" href="theme/danpin/styles/theme/switcher1.php?default=layout_fixed.css" media="screen" > -->
        <link rel="stylesheet" type="text/css" href="theme/danpin/styles/theme/switcher2.php?default=switcher.css" media="screen" >
        <link rel="stylesheet" type="text/css" href="theme/danpin/styles/theme/switcher3.php?default=theme_red.css" media="screen" >
        <link rel="stylesheet" type="text/css" href="theme/danpin/styles/theme/switcher4.php?default=bg_hemerocallis.css" media="screen" >
        <link rel="stylesheet" type="text/css" href="theme/danpin/styles/theme/switcher5.php?default=switcher.css" media="screen" >
        <link rel="stylesheet" type="text/css" href="theme/danpin/styles/colours.css">
        <link rel="stylesheet" type="text/css" href="theme/danpin/styles/ie.css">

        <!-- Scripts -->

        <!-- Load JQuery -->		
        <script src="theme/danpin/scripts/jquery/jquery171.min.js" type="text/javascript"></script>

        <!-- Load JQuery UI -->
        <script src="theme/danpin/scripts/jquery/jquery-ui1817.min.js" type="text/javascript"></script>

        <!-- Global -->
        <script src="theme/danpin/scripts/touchPunch/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
        <script src="theme/danpin/scripts/uitotop/js/jquery.ui.totop.js" type="text/javascript"></script>

        <!-- Forms -->
        <script src="theme/danpin/scripts/uniform/jquery.uniform.min.js"></script>
        <script src="theme/danpin/scripts/autogrow/jquery.autogrowtextarea.js"></script>
        <script src="theme/danpin/scripts/multiselect/js/ui.multiselect.js"></script>
        <script src="theme/danpin/scripts/selectbox/jquery.selectBox.min.js"></script>
        <script src="theme/danpin/scripts/timepicker/jquery.timepicker.js"></script>
        <script src="theme/danpin/scripts/colorpicker/js/colorpicker.js"></script>
        <script src="theme/danpin/scripts/uistars/jquery.ui.stars.min.js"></script>
        <script src="theme/danpin/scripts/tiptip/jquery.tipTip.minified.js"></script>
        <script src="theme/danpin/scripts/validation/jquery.validate.min.js" type="text/javascript"></script>		

        <!-- Configuration Script -->
        <script type="text/javascript" src="theme/danpin/scripts/adminica/adminica_ui.js"></script>
        <script type="text/javascript" src="theme/danpin/scripts/adminica/adminica_forms.js"></script>
        <script type="text/javascript" src="theme/danpin/scripts/adminica/adminica_mobile.js"></script>
        {if isset($_javascript)}
            {foreach from=$_javascript item=script} 
                <script type='text/javascript' src="js/{$script}.js"></script>
            {/foreach}
        {/if}
    </head>
    <body>
        <div id="wrapper">	
            {if isset($_usuario)}
                {include file='menu.tpl'}
            {/if}
            <div id="main_container" class="main_container container_16 clearfix">
                <div id="nav_top" class="clearfix round_top">

                    <script type="text/javascript">
                        var currentPage = 6 - 1; // This is only used in php to tell the nav what the current page is
                        $('#nav_top > ul > li').eq(currentPage).addClass("current");
                        $('#nav_top > ul > li').addClass("icon_only").children("a").children("span").parent().parent().removeClass("icon_only");
                    </script>

                    <div id="mobile_nav">
                        <!-- <div class="main"></div> -->
                        <div class="side"></div>
                    </div>

                </div><!-- #nav_top -->
                <div class="flat_area grid_16">

                    {if isset($entidad)}
                        <h2 style="text-align: center"> {$smarty.const.TXT_UNID}: {$entidad->nombre}</h2>
                        <h2 style="text-align: center">
                            <a href='index.php?page=entidad_datos&id_entidad={$entidad->id}'><img 
                                    src='/icons/ff16/chart_organisation.png' alt='{$smarty.const.TXT_ICON}' /> {$smarty.const.TXT_UNID_FICHA}</a>&nbsp;&nbsp;
                            <a href='index.php?page=proceso_listar&id_entidad={$entidad->id}'><img 
                                    src='/icons/ff16/cog.png' />
                                {$smarty.const.TXT_PROCS}</a>&nbsp;&nbsp;
                            <a href='index.php?page=indicador_listar&id_entidad={$entidad->id}'><img 
                                    src='/icons/ff16/chart_curve.png' />
                                {$smarty.const.FIELD_INDICS}</a>&nbsp;&nbsp;
                            <a href='index.php?page=dato_listar&id_entidad={$entidad->id}'><img 
                                    src='/icons/ff16/chart_bar.png' />
                                {$smarty.const.FIELD_DATOS}</a>&nbsp;&nbsp;
                            <a href='index.php?page=consulta_avanzada&id_entidad={$entidad->id}'><img 
                                    src='/icons/ff16/book.png' />
                                {$smarty.const.TXT_CONSULT}</a>&nbsp;&nbsp;
                            <a href='index.php?page=cuadro_unidad&id_entidad={$entidad->id}'><img 
                                    src='/icons/ff16/table_go.png' />
                                {$smarty.const.TXT_CUAD_RES}</a>
                                {if $_control} 
                                &nbsp;&nbsp;<a href='index.php?page=control&modulo=inicio&id_entidad={$entidad->id}'><img 
                                        src='/icons/ff16/eye.png' /> 
                                    {$smarty.const.TXT_CONTROL}</a>
                                {/if}
                        </h2>
                        <br>
                    {/if}

                    <div>
                        <h2>{$_nombre_pagina}</h2>
                    </div>

                    {if isset($smarty.get.error)}
                        <div class="alert dissmisible alert_red">
                            <img height="24" width="24" src="theme/danpin/images/icons/small/white/alarm_bell.png"> 
                            {$smarty.get.error}
                        </div>
                    {/if}
                    {if isset($error)}
                        <div class="alert dissmisible alert_red">
                            <img height="24" width="24" src="theme/danpin/images/icons/small/white/alarm_bell.png"> 
                            {$error}
                        </div>
                    {/if}
                    {if isset($smarty.get.aviso)}
                        <div class="alert dissmisible alert_blue">
                            <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png"> 
                            {$smarty.get.aviso}
                        </div>
                    {/if}
                    {if isset($aviso)}
                        <div class="alert dissmisible alert_blue">
                            <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png"> 
                            {$aviso}
                        </div>
                    {/if}

                    {* el cuerpo del template va aqui *}
                    {include file=$plantilla}

                    {*footer*}
                    {include file='footer.tpl'}
                </div>
            </div>
        </div>
    </body>
</html>