<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="login-panel panel panel-default">
            <!-- Nombre página -->
            <div class="panel-heading">
                <div class="row" title="{$_nombre_pagina}">
                    <div class="col-sm-2">
                        <img class="img-circle img-responsive" src='images/logo_big.png' alt='{$smarty.const.TXT_UNIVERSIDAD}'>
                    </div>
                    <!-- /.col-sm-2 -->
                    <div class="col-sm-10">
                        <h1>{$_nombre_pagina}</h1>
                    </div>
                    <!-- /.col-sm-10 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.panel-heading -->
            <!-- /Nombre página -->
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="text-justify">
                            <p>
                                <b title="{$smarty.const.TXT_APP_DESCRIPCION}">{$smarty.const.TXT_ICASUS}</b> 
                                {$smarty.const.TXT_LOGIN_PARTE1}
                                <a title="{$smarty.const.TXT_UNIVERSIDAD}" target="_blank" href="http://www.us.es/">{$smarty.const.TXT_UNIVERSIDAD}</a>.
                            </p>
                            <p>{$smarty.const.TXT_LOGIN_PARTE2}</p>
                            <p>
                                <b title="{$smarty.const.TXT_APP_DESCRIPCION}">{$smarty.const.TXT_ICASUS}</b> 
                                {$smarty.const.TXT_LOGIN_PARTE3} <a title="{$smarty.const.TXT_AREA_REC_HUM}" target="_blank" href="http://recursoshumanos.us.es/">{$smarty.const.TXT_AREA_REC_HUM}</a> 
                                {$smarty.const.TXT_LOGIN_PARTE4} <a title="{$smarty.const.TXT_SOFT_LIBRE}" target="_blank" href="https://github.com/Universidad-de-Sevilla/icasus">{$smarty.const.TXT_SOFT_LIBRE}</a>.
                            </p>
                            <p>
                                {$smarty.const.TXT_LOGIN_PARTE5} <a title="{$smarty.const.TXT_IC_MANUAL}" target="_blank" href="docs/icasus_manual_breve.pdf">{$smarty.const.TXT_IC_MANUAL}</a>
                                {$smarty.const.TXT_LOGIN_PARTE6}
                            </p>
                        </div>
                    </div>
                    <!-- /.col-md-6 -->
                    <div class="col-md-6">
                        <form role="form" method="post" action="index.php?page=login_basico" id="formlogin">
                            <input type="hidden" name="autenticar" value="true" />       
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="{$smarty.const.FIELD_USER}" name="login" id="login" type="text" autofocus required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="{$smarty.const.FIELD_CLAVE}" name="clave" id="clave" type="password" value="" required>
                                </div>
                                <button title="{$smarty.const.TXT_LOGIN}" class="btn btn-success btn-block" type="submit"><i class="fa fa-sign-in fa-fw"></i> {$smarty.const.TXT_LOGIN}</button>
                            </fieldset>
                        </form>
                    </div>
                    <!-- /.col-md-6 -->
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