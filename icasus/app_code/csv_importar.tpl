<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-upload fa-fw"></i> {$_nombre_pagina}
        </h3>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Nombre página -->

<!-- Breadcrumbs -->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <i title="{$smarty.const.TXT_ESTA}" class="fa fa-map-marker fa-fw"></i>
            <li><a title="{$smarty.const.FIELD_UNIDS}" href='index.php?page=entidad_listar'>{$smarty.const.FIELD_UNIDS}</a></li>
            <li><a title="{$entidad->nombre}" href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}&principal=1">{$entidad->nombre|truncate:30}</a></li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-upload fa-fw"></i> {$smarty.const.TXT_ARCHIVOS_SUBIR}</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <form class="form-horizontal" id='importar_csv' enctype='multipart/form-data' action='index.php?page=csv_grabar' method='post' data-toggle="validator">
                    <input type='hidden' name='id_entidad' value='{$entidad->id}'>
                    <div class="form-group has-feedback">
                        <label for="fichero" class="col-sm-2 control-label">{$smarty.const.TXT_ARCHIVO_SEL_IMPORT} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input class="filestyle" data-buttonBefore="true" 
                                   data-placeholder="{$smarty.const.TXT_NO_ARCHIVO_SEL}" 
                                   data-iconName="fa fa-folder-open fa-fw" 
                                   data-buttonName="btn-primary" 
                                   data-buttonText="{$smarty.const.TXT_EXAMINAR}" 
                                   type='file' name='fichero_csv[]' id='fichero' 
                                   data-validar_csv="validar_csv" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>                     
                    <div class="form-group has-feedback">
                        <label for="fichero1" class="col-sm-2 control-label">{$smarty.const.TXT_ARCHIVO_SEL_IMPORT}</label>
                        <div class="col-sm-8">
                            <input class="filestyle" data-buttonBefore="true" 
                                   data-placeholder="{$smarty.const.TXT_NO_ARCHIVO_SEL}" 
                                   data-iconName="fa fa-folder-open fa-fw" 
                                   data-buttonName="btn-primary" 
                                   data-buttonText="{$smarty.const.TXT_EXAMINAR}" 
                                   type='file' name='fichero_csv[]' id='fichero1' 
                                   data-validar_csv="validar_csv"/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="fichero2" class="col-sm-2 control-label">{$smarty.const.TXT_ARCHIVO_SEL_IMPORT}</label>
                        <div class="col-sm-8">
                            <input class="filestyle" data-buttonBefore="true" 
                                   data-placeholder="{$smarty.const.TXT_NO_ARCHIVO_SEL}" 
                                   data-iconName="fa fa-folder-open fa-fw" 
                                   data-buttonName="btn-primary" 
                                   data-buttonText="{$smarty.const.TXT_EXAMINAR}" 
                                   type='file' name='fichero_csv[]' id='fichero2' 
                                   data-validar_csv="validar_csv"/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="fichero3" class="col-sm-2 control-label">{$smarty.const.TXT_ARCHIVO_SEL_IMPORT}</label>
                        <div class="col-sm-8">
                            <input class="filestyle" data-buttonBefore="true" 
                                   data-placeholder="{$smarty.const.TXT_NO_ARCHIVO_SEL}" 
                                   data-iconName="fa fa-folder-open fa-fw" 
                                   data-buttonName="btn-primary" 
                                   data-buttonText="{$smarty.const.TXT_EXAMINAR}" 
                                   type='file' name='fichero_csv[]' id='fichero3' 
                                   data-validar_csv="validar_csv"/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-8">
                            <button type="button" class="btn btn-default btn-danger" title="{$smarty.const.TXT_CANCEL}" onclick="location.href = 'index.php?page=entidad_datos&id_entidad={$entidad->id}';">
                                <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                            </button>
                            <div class="pull-right">
                                <button type="reset" class="btn btn-default btn-warning" title="{$smarty.const.TXT_RESET}">
                                    <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                                </button>
                                <button title="{$smarty.const.TXT_ARCHIVOS_PROCESAR}" type="submit" class="btn btn-default btn-success">
                                    <i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_ARCHIVOS_PROCESAR}
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!-- /.panel-body --> 
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->