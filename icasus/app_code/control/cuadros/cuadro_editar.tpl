<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-th fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$_nombre_pagina}
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
                        <a title="{$smarty.const.TXT_PLANES_DESCRIPCION}" href='index.php?page=plan_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-book fa-fw"></i> {$smarty.const.FIELD_PLANES} <span title="{$smarty.const.FIELD_TOTAL}: {$num_planes} {$smarty.const.FIELD_PLANES}">({$num_planes})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.FIELD_PROCS}">({$num_procesos})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}" href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}">({$num_indicadores})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.FIELD_CUADROS_MANDO} <span title="{$smarty.const.FIELD_TOTAL}: {$num_cuadros} {$smarty.const.FIELD_CUADROS_MANDO}">({$num_cuadros})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
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
            <li><a title="{$smarty.const.FIELD_CUADROS_MANDO}" href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_CUADROS_MANDO}</a></li>
            <li><a title="{$cuadro->nombre}" href='index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}'>{$cuadro->nombre}</a></li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-12">
        <form action='index.php?page=cuadro_grabar' method='post' id='formcuadro' name='formcuadro' 
              data-toggle="validator" class="form-horizontal">
            <input type="hidden" name="id_cuadro" value="{$cuadro->id}" />
            <input type="hidden" name="id_entidad" value="{$entidad->id}">
            <div class="form-group has-feedback">
                <label for="nombre" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_NOMBRE}</label>
                <div class="col-sm-8">
                    <input type='text' class="form-control" name='nombre' id='nombre' value="{$cuadro->nombre}" placeholder="{$smarty.const.FIELD_NOMBRE}" required/>
                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group">
                <label for="comentarios" class="col-sm-2 control-label">{$smarty.const.FIELD_COMENTARIOS}</label>
                <div class="col-sm-8">
                    <textarea  class="form-control" name="comentarios" id="comentarios" placeholder="{$smarty.const.FIELD_COMENTARIOS}">{$cuadro->comentarios}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="privado" class="col-sm-2 control-label">{$smarty.const.FIELD_VISIBILIDAD}</label>
                <div class="col-sm-8">
                    <input  type="checkbox" id="privado" name="privado" class="form-control" 
                            data-toggle="toggle" data-on="{$smarty.const.TXT_PRIVADO}"
                            data-onstyle="danger" data-offstyle="success" data-size="small"
                            data-off="{$smarty.const.TXT_PUBLICO}" {if $cuadro->privado == 1}checked{/if}/>         
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href='index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}'>
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
                            <h3 class="modal-title" id="myModalLabel"><i class="fa fa-th fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_CUADRO_EDIT}: {$cuadro->nombre}</h3>
                        </div>
                        <div class="modal-body">
                            <p>{$smarty.const.MSG_CUADRO_CONFIRM_EDITAR}</p>
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