<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-pencil fa-fw"></i> {$_nombre_pagina}
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
            <li><a title="{$smarty.const.TXT_CUADROS_MANDO}" href='index.php?page=cuadro_listar'>{$smarty.const.TXT_CUADROS_MANDO}</a></li>
            <li><a title="{$cuadro->nombre}" href='index.php?page=cuadro_mostrar&id={$cuadro->id}'>{$cuadro->nombre}</a></li>
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
                <span class="panel-title"><i class="fa fa-columns fa-fw"></i> {$smarty.const.TXT_PANEL_PARAM}</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <form action="index.php?page=panel_editar&id_panel={$id_panel}&id_cuadro={$cuadro->id}" id="panel_editar" name="panel_editar" method='post' 
                      data-toggle="validator" class="form-horizontal">
                    <div class="form-group has-feedback">
                        <label for="nombre" class="col-sm-2 control-label">{$smarty.const.FIELD_NOMBRE} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input type='text' class="form-control" name='nombre' id='nombre' placeholder="{$smarty.const.FIELD_NOMBRE}" value="{$panel->nombre}" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="orden" class="col-sm-2 control-label">{$smarty.const.FIELD_ORDEN} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input type="number" id='orden' name="orden" class="form-control" placeholder="{$smarty.const.FIELD_ORDEN}" min='1' value="{$panel->orden}" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="ancho" class="col-sm-2 control-label">{$smarty.const.FIELD_ANCHO} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input type="number" value="{$panel->ancho}" id='ancho' name="ancho" class="form-control" placeholder="{$smarty.const.FIELD_ANCHO}" min='2' max="12" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-8">
                            <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href='index.php?page=cuadro_mostrar&id={$cuadro->id}'>
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
                                    <h3 class="modal-title" id="myModalLabel"><i class="fa fa-pencil fa-fw"></i> {$smarty.const.TXT_PANEL_EDITAR}: {$panel->nombre}</h3>
                                </div>
                                <div class="modal-body">
                                    <p>{$smarty.const.MSG_PANEL_CONFIRM_EDITAR}</p>
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
            <!-- /.panel-body --> 
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->