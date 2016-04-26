<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-sitemap fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$_nombre_pagina}
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
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADROS_MANDO}
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
        <form method='post' action='index.php?page=entidad_editar&id_entidad={$entidad->id}' 
              data-toggle="validator" class="form-horizontal">
            <div class="form-group has-feedback">
                <label for="codigo" class="col-sm-2 control-label">{$smarty.const.FIELD_COD} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                <div class="col-sm-8">
                    <input title="{$smarty.const.TXT_CODIGO}" data-toggle="tooltip" data-placement="left" type='text' name='codigo' id='codigo' 
                           pattern="[A-Z]+[.]*[A-Z]*[0-9]*[.]*[0-9]*([-]*[A-Z]*[.]*[A-Z]*[0-9]*[.]*[0-9]*)*"
                           class="form-control" value='{$entidad->codigo}' placeholder="{$smarty.const.FIELD_COD}" required/>
                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group has-feedback">
                <label for="nombre" class="col-sm-2 control-label">{$smarty.const.FIELD_NOMBRE} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                <div class="col-sm-8">
                    <input type='text' class="form-control" name='nombre' id='nombre' value='{$entidad->nombre}' placeholder="{$smarty.const.FIELD_NOMBRE}" required/>
                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group has-feedback">
                <label for="etiqueta" class="col-sm-2 control-label">{$smarty.const.FIELD_ETIQUETA} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                <div class="col-sm-8">
                    <input type='text' class="form-control" name='etiqueta' id='etiqueta' value='{$entidad->etiqueta}' placeholder="{$smarty.const.FIELD_ETIQUETA}" required/>
                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group has-feedback">
                <label for="etiqueta_mini" class="col-sm-2 control-label">{$smarty.const.FIELD_ETIQUETA_MINI} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                <div class="col-sm-8">
                    <input title="{$smarty.const.TXT_ETIQUETA_MINI_DESCRIPCION}" data-toggle="tooltip" data-placement="left" type='text' maxlength="12" class="form-control" name='etiqueta_mini' id='etiqueta_mini' value='{$entidad->etiqueta_mini}' placeholder="{$smarty.const.FIELD_ETIQUETA_MINI}" required/>
                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            {if $entidad->id_madre!=0}
                <div class="form-group">
                    <label for="id_padre" class="col-sm-2 control-label">{$smarty.const.FIELD_UNID_SUP}</label>
                    <div class="col-sm-8">
                        <select class="form-control chosen-select" name='id_padre' id='id_padre'>
                            {foreach from=$entidades item=padre}
                                {if $padre->id != $entidad->id}
                                    <option value="{$padre->id}" {if $entidad->id_madre == $padre->id}selected{/if}>{$padre->nombre}
                                    </option>
                                {/if}
                            {/foreach}
                        </select>
                    </div>
                </div>
            {else}
                <input type="hidden" name="id_padre" value="{$entidad->id_madre}" />
            {/if}
            <div class="form-group has-feedback">
                <label for="web" class="col-sm-2 control-label">{$smarty.const.FIELD_WEB}</label>
                <div class="col-sm-8">
                    <input type='url' name='web' id='web' class="form-control" value='{$entidad->web}' placeholder="URL"/>
                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="form-group">
                <label for="organica" class="col-sm-2 control-label">{$smarty.const.FIELD_ORGANICA}</label>
                <div title="{$smarty.const.TXT_ORGANICA_DESCRIPCION}" data-toggle="tooltip" data-placement="left" class="col-sm-8">
                    <div></div>
                    <input  type="checkbox" id="organica" name="organica" class="form-control" 
                            data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                            data-onstyle="success" data-offstyle="danger" data-size="small"
                            data-off="{$smarty.const.TXT_NO}" value="1" {if $entidad->es_organica}checked{/if} />       
                </div>
            </div>
            <div class="form-group">
                <label for="anotaciones" class="col-sm-2 control-label">{$smarty.const.FIELD_ANOTACION}</label>
                <div class="col-sm-8">
                    <textarea  class="form-control" id="anotaciones" name="anotaciones" placeholder="{$smarty.const.FIELD_ANOTACION}">{$entidad->anotaciones}</textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href ='index.php?page=entidad_mostrar&id_entidad={$entidad->id}'>
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
                            <h3 class="modal-title" id="myModalLabel"><i class="fa fa-sitemap fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_UNID_EDIT}: {$entidad->nombre}</h3>
                        </div>
                        <div class="modal-body">
                            <p>{$smarty.const.MSG_UNID_CONFIRM_EDITAR}</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                            <button type="submit" title="{$smarty.const.TXT_SI}" class="btn btn-success" name="editar" id="editar"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Diálogo Confirmar Edición -->

    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->