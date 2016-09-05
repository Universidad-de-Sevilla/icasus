<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="login-panel panel panel-default">
            <!-- Nombre página -->
            <div class="panel-heading">
                <div class="row" title="{$_nombre_pagina} {$smarty.const.TXT_ICASUS}">
                    <div class="col-sm-2">
                        <img class="img-circle img-responsive" src='images/logo_big.png' alt='{$smarty.const.TXT_UNIVERSIDAD}'>
                    </div>
                    <!-- /.col-sm-2 -->
                    <div class="col-sm-10">
                        <h1>{$_nombre_pagina} <b>{$smarty.const.TXT_ICASUS}</b></h1>
                    </div>
                    <!-- /.col-sm-10 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.panel-heading -->
            <!-- /Nombre página -->
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-justify">
                            <div class="alert alert-danger h3">
                                <i class="fa fa-warning fa-fw"></i> 
                                {$smarty.const.TXT_MANTENIMIENTO}
                            </div>
                        </div>
                    </div>
                    <!-- /.col-md-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.panel-body -->
            <div class="panel-footer">
                <div class="row text-center">
                    <div class="col-lg-12">
                        <span class="h4">{$smarty.const.TXT_ICASUS}</span> - {$smarty.const.TXT_APP_DESCRIPCION} - <a href="https://{$smarty.const.TXT_APP_WEB}">{$smarty.const.TXT_APP_WEB}</a>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row text-center">
                    <div class="col-lg-12">
                        <small>{$smarty.const.FIELD_VERSION}: {$smarty.const.IC_VERSION} - {$smarty.const.FIELD_FECHA_REV}: {$smarty.const.IC_FECHA_REVISION}</small>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.panel-footer -->
        </div>
        <!-- /.panel -->
    </div>
</div>