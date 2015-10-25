<!DOCTYPE html>
<html lang="es-ES">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="application-name" content="{$smarty.const.TXT_ICASUS}">
        <meta name="description" content="{$smarty.const.TXT_APP_DESCRIPCION}">
        <meta name="author" content="Juan Antonio Ruíz Rivas">
        <meta name="author" content="Juan Jesús Martín Corredera">
        <meta name="author" content="Joaquín Valonero Zaera">

        <title>{$_nombre_pagina} - {$smarty.const.TXT_ICASUS}</title>

        <!-- Favicon -->
        <link rel=icon href=favicon.ico sizes="32x32 48x48" type="image/vnd.microsoft.icon">

        <!-- Bootstrap Core CSS -->
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Chosen CSS -->
        <link href="lib/chosen/chosen.min.css" rel="stylesheet">
        <link href="lib/chosen/chosen-bootstrap.css" rel="stylesheet">

        <!-- Bootstrap DatePicker -->
        <link href="lib/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet">

        <!-- Bootstrap Toggle -->
        <link href="lib/bootstrap-toggle/css/bootstrap-toggle.min.css" rel="stylesheet">

        <!-- Datatables -->
        <link href="lib/dataTables/css/dataTables.bootstrap.css" rel="stylesheet">

        <!-- Highslide -->
        <link rel="stylesheet" type="text/css" href="lib/highslide/highslide.css"/>
        <script type='text/javascript' src="lib/highslide/js/highslide-full.min.js"></script>
        <script type='text/javascript' src="lib/highslide/js/highslide.config.js"></script>

        <!-- Custom CSS -->
        <link href="css/estilo.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body {if !isset($_usuario)} class="login-page"{/if}>

        {if isset($_usuario)}
            {* Si se ha iniciado sesión *}
            <div id="wrapper">

                <!-- Navigation -->
                <nav id="top" class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">{$smarty.const.TXT_MOSTAR_OCULTAR_NAV}</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" title="{$smarty.const.TXT_APP_DESCRIPCION}" href="index.php">
                            <img class="logo pull-left" alt="{$smarty.const.TXT_UNIVERSIDAD}" src="images/logo.png">
                            {$smarty.const.TXT_ICASUS}
                        </a>
                    </div>
                    <!-- /.navbar-header -->

                    <ul class="nav navbar-top-links navbar-right">
                        <li>
                            <span id="fecha" title="{$smarty.const.FIELD_FECHA}: {$smarty.now|date_format:'%d-%m-%Y'}"><i class="fa fa-calendar fa-fw"></i> {$smarty.now|date_format:'%d-%m-%Y'}</span>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" title="{$_usuario->login}" data-toggle="dropdown" href="#">
                                <i class="fa fa-user fa-fw"></i> {$_usuario->login} <i class="fa fa-caret-down"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$_usuario->id}'><i class="fa fa-user fa-fw"></i> {$smarty.const.TXT_USER_PERFIL}</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a title="{$smarty.const.TXT_CERRAR_SESION}" href="index.php?page={$smarty.const.IC_TIPO_LOGIN}&logout=true"><i class="fa fa-sign-out fa-fw"></i> {$smarty.const.TXT_CERRAR_SESION}</a>
                                </li>
                            </ul>
                            <!-- /.dropdown-user -->
                        </li>
                        <!-- /.dropdown -->
                    </ul>
                    <!-- /.navbar-top-links -->

                    <div class="navbar-default sidebar" role="navigation" >
                        <div class="sidebar-nav navbar-collapse">
                            <ul class="nav" id="side-menu">
                                <li class="sidebar-search">
                                    <div class="input-group">
                                        <input class="form-control" placeholder="{$smarty.const.TXT_BUSCAR}" type="text">
                                        <span class="input-group-btn">
                                            <button title="{$smarty.const.TXT_BUSCAR}" class="btn btn-primary" type="button">
                                                <i class="fa fa-search fa-fw"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <!-- /input-group -->
                                </li>
                                <li>
                                    <a title="{$smarty.const.TXT_INICIO}" href='index.php?page=inicio' accesskey='h'>
                                        <span class="fa-stack fa-lg"><i class="fa fa-home fa-stack-1x"></i></span>{$smarty.const.TXT_INICIO}</a>      
                                </li>
                                <li>
                                    <a title="{$smarty.const.TXT_CUADROS_MANDO}" href='index.php?page=cuadro_listar'>
                                        <span class="fa-stack fa-lg"><i class="fa fa-th fa-stack-1x"></i></span>{$smarty.const.TXT_CUADROS_MANDO}</a>
                                </li>
                                <li>
                                    <a title="{$smarty.const.FIELD_UNIDS}" href='index.php?page=entidad_listar'>
                                        <span class="fa-stack fa-lg"><i class="fa fa-sitemap fa-stack-1x"></i></span>{$smarty.const.FIELD_UNIDS}</a>
                                </li>
                                <li>
                                    <a title="{$smarty.const.TXT_USERS}" href='index.php?page=usuario_listar'>
                                        <span class="fa-stack fa-lg"><i class="fa fa-users fa-stack-1x"></i></span>{$smarty.const.TXT_USERS}</a>
                                </li>
                                <li>
                                    <a title="{$smarty.const.TXT_AYUDA}" href='index.php?page=pagina_mostrar&alias=indice'>
                                        <span class="fa-stack fa-lg"><i class="fa fa-question-circle fa-stack-1x"></i></span>{$smarty.const.TXT_AYUDA}</a>
                                </li>
                            </ul>
                        </div>
                        <!-- /.sidebar-collapse -->
                    </div>
                    <!-- /.navbar-default-sidebar -->

                </nav> 
                <!-- /Navigation -->

                <!-- Page Content -->
                <div id="page-wrapper">
                    <div class="container-fluid">

                        <!-- Notificaciones -->
                        {if isset($smarty.get.error)}
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="alert alert-danger alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="{$smarty.const.TXT_CERRAR}">
                                            <span aria-hidden="true">&times;</span></button>
                                        <i class="fa fa-exclamation-circle fa-fw"></i> 
                                        {$smarty.get.error}
                                    </div>
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                            <!-- /.row -->
                        {/if}
                        {if isset($error)}
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="alert alert-danger alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="{$smarty.const.TXT_CERRAR}">
                                            <span aria-hidden="true">&times;</span></button>
                                        <i class="fa fa-exclamation-circle fa-fw"></i>  
                                        {$error}
                                    </div>
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                            <!-- /.row -->
                        {/if}
                        {if isset($smarty.get.aviso)}
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="alert alert-warning alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="{$smarty.const.TXT_CERRAR}">
                                            <span aria-hidden="true">&times;</span></button>
                                        <i class="fa fa-exclamation-triangle fa-fw"></i>
                                        {$smarty.get.aviso}
                                    </div>
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                            <!-- /.row -->
                        {/if}
                        {if isset($aviso)}
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="alert alert-warning alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="{$smarty.const.TXT_CERRAR}">
                                            <span aria-hidden="true">&times;</span></button>
                                        <i class="fa fa-exclamation-triangle fa-fw"></i> 
                                        {$aviso}
                                    </div>
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                            <!-- /.row -->
                        {/if}           
                        {if isset($smarty.get.exito)}
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="alert alert-success alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="{$smarty.const.TXT_CERRAR}">
                                            <span aria-hidden="true">&times;</span></button>
                                        <i class="fa fa-check fa-fw"></i>
                                        {$smarty.get.exito}
                                    </div>
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                            <!-- /.row -->
                        {/if}
                        {if isset($exito)}
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="alert alert-success alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="{$smarty.const.TXT_CERRAR}">
                                            <span aria-hidden="true">&times;</span></button>
                                        <i class="fa fa-check fa-fw"></i> 
                                        {$exito}
                                    </div>
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                            <!-- /.row -->
                        {/if}
                        <!-- /Notificaciones -->

                        {* El cuerpo del template va aqui *}
                        {include file=$plantilla}

                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /#page-wrapper -->

                <!-- Footer -->
                <footer class="text-center footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <span class="h4">{$smarty.const.TXT_ICASUS}</span> - {$smarty.const.TXT_APP_DESCRIPCION}
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <!-- /.row -->
                        <div class="row">
                            <div class="col-lg-12">
                                <small>{$smarty.const.FIELD_VERSION}: {$smarty.const.IC_VERSION} - {$smarty.const.FIELD_FECHA_REV}: {$smarty.const.IC_FECHA_REVISION}</small>
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </footer>
                <!-- /Footer -->

                <!-- Back to Top -->
                <a title="{$smarty.const.TXT_VOLVER_ARRIBA}" id="top-link-block" href="#top" class="btn btn-default hidden"  
                   {literal}
                       onclick="$('html,body').animate({scrollTop: 0}, 'slow');
                               return false;"
                   {/literal}>
                    <i class="fa fa-chevron-up"></i>
                </a>
                <!-- /Back to Top -->

            </div>
            <!-- /#wrapper -->
        {else}
            {* Si no hay sesión iniciada *}
            <div class="container-fluid">
                {* El cuerpo del template va aqui *}
                {include file=$plantilla}
            </div>
            <!-- /.container-fluid -->  
        {/if}

        <!-- jQuery -->
        <script src="lib/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="lib/bootstrap/js/bootstrap.min.js"></script>

        <!-- Bootstrap Validator -->
        <script src="lib/bootstrap-validator/validator.min.js"></script>

        <!-- Bootstrap DatePicker -->
        <script src="lib/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script src="lib/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js"></script>

        <!-- Bootstrap Toggle -->
        <script src="lib/bootstrap-toggle/js/bootstrap-toggle.min.js"></script>

        <!-- Bootstrap FileStyle -->
        <script src="lib/bootstrap-filestyle/bootstrap-filestyle.min.js"></script>

        <!-- Chosen Plugin JavaScript -->
        <script src="lib/chosen/chosen.jquery.min.js"></script>

        <!-- Map Responsive Plugin JavaScript -->
        <script src="lib/jquery-rwdImageMaps/jquery.rwdImageMaps.min.js"></script>

        <!-- Datatables -->
        <script src="lib/dataTables/js/jquery.dataTables.min.js"></script>
        <script src="lib/dataTables/js/dataTables.bootstrap.js"></script>

        <!-- Highcharts -->
        <script src="lib/highcharts/highcharts.js"></script>
        <script src="lib/highcharts/exporting.js"></script>
        <script src="lib/highcharts/Conjunto.js"></script>
        <script src="lib/highcharts/HighchartSerie.js"></script>

        <!-- Custom JavaScript -->
        <script src="js/index.js"></script>

        <!-- Validaciones personalizadas -->
        <script src="js/validador.js"></script>

        <!-- Configuration Script -->
        {if isset($_javascript)}
            {foreach from=$_javascript item=script} 
                <script type='text/javascript' src="js/{$script}.js"></script>
            {/foreach}
        {/if}

    </body>

</html>