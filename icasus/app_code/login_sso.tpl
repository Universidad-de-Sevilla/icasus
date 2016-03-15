<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <!-- Nombre página -->
        <div class="row">
            <div class="col-md-12">
                <h1 title="{$_nombre_pagina}" class="page-header">
                    <img src='images/logo_big.png' alt='{$smarty.const.TXT_UNIVERSIDAD}'>{$_nombre_pagina}
                </h1>
            </div>
            <!-- /.col-md-12 -->
        </div>
        <!-- /.row -->
        <!-- /Nombre página -->
        <div class="row">
            <div class="col-md-12">
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
                <button id="formlogin" title="{$smarty.const.TXT_LOGIN}" class="btn btn-success btn-block" type="button" onclick="location.href = 'index.php?page=login_sso&autenticar';">
                    <i class="fa fa-sign-in fa-fw"></i> {$smarty.const.TXT_LOGIN}
                </button>
            </div>
            <!-- /.col-md-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.col-md-8 -->
</div>
<!-- /.row -->