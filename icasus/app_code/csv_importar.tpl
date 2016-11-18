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
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" title="{$entidad->nombre}" href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}">
                    {$entidad->nombre|truncate:30} <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a title="{$smarty.const.FIELD_USER}: {$_usuario->login} - {$smarty.const.TXT_UNID}: {$entidad->nombre} - {$smarty.const.FIELD_ROL}: {$_rol}" href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}"><i class="fa fa-folder fa-fw"></i> {$entidad->nombre} / <i class="fa fa-user fa-fw"></i> {$_rol}</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.FIELD_PROCS}">({$num_procesos})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}" href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}">({$num_indicadores})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_DATOS_DESCRIPCION}" href='index.php?page=dato_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-database fa-fw"></i> {$smarty.const.FIELD_DATOS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_datos} {$smarty.const.FIELD_DATOS}">({$num_datos})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.FIELD_CUADROS_MANDO}
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}" href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
                            <i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-menu -->
            </li>
            <!-- /.dropdown -->
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-12">
        <form class="form-horizontal" id='importar_csv' enctype='multipart/form-data' action='index.php?page=csv_grabar' method='post' data-toggle="validator">
            <input type='hidden' name='id_entidad' value='{$entidad->id}'>
            <div class="form-group has-feedback">
                <label for="fichero" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.TXT_ARCHIVO_SEL_IMPORT}</label>
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
                    <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href = 'index.php?page=entidad_mostrar&id_entidad={$entidad->id}'>
                        <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                    </a>
                    <div class="pull-right">
                        <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                            <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                        </button>
                        <button title="{$smarty.const.TXT_ARCHIVOS_PROCESAR}" type="submit" class="btn btn-success">
                            <i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_ARCHIVOS_PROCESAR}
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->