<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-book fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$_nombre_pagina}
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
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.TXT_PROCS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.TXT_PROCS}">({$num_procesos})</span>
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
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADROS_MANDO} <span title="{$smarty.const.FIELD_TOTAL}: {$num_cuadros} {$smarty.const.TXT_CUADROS_MANDO}">({$num_cuadros})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>   
                    {if $_control}
                        <li class="divider"></li>
                        <li>
                            <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}" href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
                                <i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}
                            </a>
                        </li>
                    {/if}
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
        <form action='index.php?page=plan_grabar' method='post' id='formplan' name='formplan' 
              data-toggle="validator" class="form-horizontal">
            <input type="hidden" name="id_entidad" value="{$entidad->id}">
            <input type="hidden" name="id_plan" value="{$plan->id}">
            <div class="form-group has-feedback">
                <label for="anyo_inicio" class="col-sm-2 control-label">{$smarty.const.FIELD_ANYO_INICIO} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                <div class="col-sm-8">
                    <input type='number' class="form-control" name='anyo_inicio' id='anyo_inicio' value="{$plan->anyo_inicio}" min="{$smarty.now|date_format:'%Y'}" placeholder="{$smarty.const.FIELD_ANYO_INICIO}" data-elementos='{$elementos|@json_encode}' data-validar_igual="validar_igual" data-validar_igual-error="{$smarty.const.ERR_PLAN_VAL_ANYO}" required/>
                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group has-feedback">
                <label for="duracion" class="col-sm-2 control-label">{$smarty.const.FIELD_DURACION} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                <div class="col-sm-8">
                    <input type='number' class="form-control" name='duracion' id='duracion' value="{$plan->duracion}" min="1" placeholder="{$smarty.const.FIELD_DURACION}" required/>
                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group">
                <label for="titulo" class="col-sm-2 control-label">{$smarty.const.FIELD_TITULO}</label>
                <div class="col-sm-8">
                    <input type='text' class="form-control" name='titulo' id='titulo' value="{$plan->titulo}" placeholder="{$smarty.const.FIELD_TITULO}"/>
                </div>
            </div>
            <div class="form-group">
                <label for="mision" class="col-sm-2 control-label">{$smarty.const.FIELD_MISION}</label>
                <div class="col-sm-8">
                    <textarea  class="form-control" name="mision" id="mision" placeholder="{$smarty.const.FIELD_MISION}">{$plan->mision}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="vision" class="col-sm-2 control-label">{$smarty.const.FIELD_VISION}</label>
                <div class="col-sm-8">
                    <textarea  class="form-control" name="vision" id="vision" placeholder="{$smarty.const.FIELD_VISION}">{$plan->vision}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="valores" class="col-sm-2 control-label">{$smarty.const.FIELD_VALORES}</label>
                <div class="col-sm-8">
                    <textarea  class="form-control" name="valores" id="valores" placeholder="{$smarty.const.FIELD_VALORES}">{$plan->valores}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="fce" class="col-sm-2 control-label">{$smarty.const.FIELD_FCE}</label>
                <div class="col-sm-8">
                    <textarea  class="form-control" name="fce" id="fce" placeholder="{$smarty.const.FIELD_FCE}">{$plan->fce}</textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href ='index.php?page=plan_mostrar&id_plan={$plan->id}&id_entidad={$plan->id_entidad}'>
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
                            <h3 class="modal-title" id="myModalLabel"><i class="fa fa-book fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_PLAN_EDIT}: {$plan->anyo_inicio} - {$plan->anyo_inicio + $plan->duracion}</h3>
                        </div>
                        <div class="modal-body">
                            <p>{$smarty.const.MSG_PLAN_CONFIRM_EDITAR}</p>
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