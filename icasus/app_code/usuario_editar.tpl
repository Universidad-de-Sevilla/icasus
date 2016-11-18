<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-user fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$_nombre_pagina}
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
            <li><a title="{$smarty.const.TXT_USERS}" href='index.php?page=usuario_listar'>{$smarty.const.TXT_USERS}</a></li>
            <li><a title="{$persona->nombre} {$persona->apellidos}" href='index.php?page=usuario_mostrar&id_usuario={$persona->id}'>{$persona->nombre} {$persona->apellidos|truncate:30}</a></li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-12">
        <form action='index.php?page=usuario_grabar' method='post' id='formusuario' name='formusuario' 
              data-toggle="validator" class="form-horizontal">
            <input type="hidden" name="id_usuario" value="{$persona->id}">
            <div class="form-group">
                <label for="login" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_LOGIN}</label>
                <div class="col-sm-8">
                    <input type='text' class="form-control" id='login' value="{$persona->login}" placeholder="{$smarty.const.FIELD_LOGIN}" readonly>
                </div>
            </div>
            <div class="form-group has-feedback">
                <label for="nombre" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_NOMBRE}</label>
                <div class="col-sm-8">
                    <input type='text' class="form-control" name='nombre' id='nombre' value="{$persona->nombre}" placeholder="{$smarty.const.FIELD_NOMBRE}" required>
                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group has-feedback">
                <label for="apellidos" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_APEL}</label>
                <div class="col-sm-8">
                    <input type='text' class="form-control" name='apellidos' id='apellidos' value="{$persona->apellidos}" placeholder="{$smarty.const.FIELD_APEL}" required>
                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group has-feedback">
                <label for="correo" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_CORREO}</label>
                <div class="col-sm-8">
                    <input type='email' class="form-control" name='correo' id='correo' value="{$persona->correo}" placeholder="{$smarty.const.FIELD_CORREO}" required>
                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group has-feedback">
                <label for="telefono" class="col-sm-2 control-label">{$smarty.const.FIELD_TEL}</label>
                <div class="col-sm-8">
                    <input type='tel' class="form-control" id='telefono' name="telefono" value="{$persona->telefono}" placeholder="{$smarty.const.FIELD_TEL}">
                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group">
                <label for="puesto" class="col-sm-2 control-label">{$smarty.const.FIELD_PUESTO}</label>
                <div class="col-sm-8">
                    <input type='text' class="form-control" id='puesto' name="puesto" value="{$persona->puesto}" placeholder="{$smarty.const.FIELD_PUESTO}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href='index.php?page=usuario_mostrar&id_usuario={$persona->id}'>
                        <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                    </a>
                    <div class="pull-right">
                        <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                            <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                        </button>
                        <button title="{$smarty.const.TXT_GRABAR}" type="button" class="btn btn-success" data-toggle="modal" data-target="#dialogo_confirmar_edicion">
                            <i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_GRABAR}
                        </button>
                    </div>
                </div>
            </div>

            <!-- Diálogo Confirmar Edición -->
            <div class="modal fade" id="dialogo_confirmar_edicion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h3 class="modal-title" id="myModalLabel"><i class="fa fa-user fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_USER_EDIT}: {$persona->nombre} {$persona->apellidos}</h3>
                        </div>
                        <div class="modal-body">
                            <p>{$smarty.const.MSG_USER_CONFIRM_EDITAR}</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                            <button type="submit" title="{$smarty.const.TXT_SI}" class="btn btn-success" name="editar" id="editar"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Diálogo Confirmar Edición -->

        </form>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->