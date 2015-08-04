<div class="panel panel-login panel-red">
    <div class="panel-heading">
        <span class="panel-title"><i class="fa fa-star fa-fw"></i> {$_nombre_pagina}</span>
    </div>
    <!-- /.panel-heading -->
    <div class="panel-body">
        <div class="row">
            <div class="col-md-6">
                <div class="text-justify">
                    <img class="pull-right" src='images/cuadromando.png' alt='{$smarty.const.TXT_ICON_GRAF_LINEAL}'>
                    <p><b title="{$smarty.const.TXT_APP_DESCRIPCION}">{$smarty.const.TXT_ICASUS}</b> 
                        {$smarty.const.TXT_LOGIN_PARTE1}
                        <a title="{$smarty.const.TXT_UNIVERSIDAD}" target="_blank" href="http://www.us.es/">{$smarty.const.TXT_UNIVERSIDAD}</a>.
                    </p>
                    <p>{$smarty.const.TXT_LOGIN_PARTE2}</p>
                    <p><b title="{$smarty.const.TXT_APP_DESCRIPCION}">{$smarty.const.TXT_ICASUS}</b> 
                        {$smarty.const.TXT_LOGIN_PARTE3} <a title="{$smarty.const.TXT_AREA_REC_HUM}" target="_blank" href="http://recursoshumanos.us.es/">{$smarty.const.TXT_AREA_REC_HUM}</a> 
                        {$smarty.const.TXT_LOGIN_PARTE4} <a title="{$smarty.const.TXT_SOFT_LIBRE}" target="_blank" href="http://forja.rediris.es/projects/icasus/">{$smarty.const.TXT_SOFT_LIBRE}</a>.
                    </p>
                    <p>{$smarty.const.TXT_LOGIN_PARTE5} <a title="{$smarty.const.TXT_IC_MANUAL}" target="_blank" href="http://icasus.us.es/upload/ayuda/icasus_manual_breve.pdf">{$smarty.const.TXT_IC_MANUAL}</a>
                        {$smarty.const.TXT_LOGIN_PARTE6}
                    </p>
                </div>
            </div>
            <!-- /.col-md-6 -->
            <div class="col-md-6">
                <button id="formlogin" title="{$smarty.const.TXT_LOGIN}" class="btn btn-success btn-block btn-lg" type="button" onclick="javascript:location.href = 'index.php?page=login_sso&autenticar'">
                    <i class="fa fa-sign-in fa-fw"></i> {$smarty.const.TXT_LOGIN}
                </button>
            </div>
            <!-- /.col-md-6 -->
            <img class="pull-right login-sso" src='images/logo_big.png' alt='{$smarty.const.TXT_UNIVERSIDAD}'>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.panel-body -->
</div>
<!-- /.panel -->