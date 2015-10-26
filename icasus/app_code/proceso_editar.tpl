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
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" href='index.php?page=cuadro_listar'>
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
            <li><a title="{$smarty.const.TXT_PROCS}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>{$smarty.const.TXT_PROCS}</a></li>
            <li><a title="{$proceso->nombre}" href='index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$entidad->id}'>{$proceso->nombre|truncate:30}</a></li>
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
                <span class="panel-title"><i class="fa fa-gear fa-fw"></i> {$smarty.const.TXT_PROC_PARAM}</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <form id="proceso_editar" method="post" action="index.php?page=proceso_editar&id_entidad={$entidad->id}&id_proceso={$proceso->id}" data-toggle="validator" class="form-horizontal">
                    <!-- Nav tabs -->
                    <ul class="nav nav-pills" role="tablist">
                        <li id="tab_proceso" role="presentation" class="active" ><a href="#proceso" title="{$smarty.const.FIELD_PROC}" aria-controls="{$smarty.const.FIELD_PROC}" role="tab" data-toggle="tab">{$smarty.const.FIELD_PROC}</a></li>
                        <li id="tab_otros" role="presentation" ><a href="#otros" title="{$smarty.const.TXT_OTRAS_PROP}" aria-controls="{$smarty.const.TXT_OTRAS_PROP}" role="tab" data-toggle="tab">{$smarty.const.TXT_OTRAS_PROP}</a></li>
                    </ul>
                    <!-- /Nav tabs -->
                    <!-- Tab panes -->
                    <div class="tab-content">

                        <!-- Tab proceso -->
                        <div role="tabpanel" class="tab-pane active" id="proceso">
                            <br>
                            <div class="form-group has-feedback">
                                <label for="codigo" class="col-sm-2 control-label">{$smarty.const.FIELD_COD} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                <div class="col-sm-8">
                                    <input title="{$smarty.const.TXT_CODIGO}" type='text' name='codigo' id='codigo' 
                                           pattern="[A-Z]+[.]*[A-Z]*[0-9]*[.]*[0-9]*([-]*[A-Z]*[.]*[A-Z]*[0-9]*[.]*[0-9]*)*"
                                           class="form-control" value="{$proceso->codigo}" placeholder="{$smarty.const.FIELD_COD}" required/>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <label for="nombre" class="col-sm-2 control-label">{$smarty.const.FIELD_NOMBRE} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                <div class="col-sm-8">
                                    <input type='text' value="{$proceso->nombre}" class="form-control" name='nombre' id='nombre' placeholder="{$smarty.const.FIELD_NOMBRE}" required/>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <label for="revision" class="col-sm-2 control-label">{$smarty.const.FIELD_VERSION} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                <div class="col-sm-8">
                                    <input type='text' value="{$proceso->revision}" class="form-control" name='revision' id='revision' placeholder="{$smarty.const.TXT_PROC_VERSION}" required/>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <label for="fecha_revision" class="col-sm-2 control-label">{$smarty.const.FIELD_FECHA} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                <div class="col-sm-8">
                                    <div class="input-group date" data-provide="datepicker" data-date-language="es" data-date-autoclose="true">
                                        <div class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></div>
                                        <input type='text' value="{$proceso->fecha_revision|date_format:'%d/%m/%Y'}" class="form-control" name='fecha_revision' id='fecha_revision' placeholder="{$smarty.const.TXT_FECHA_REV_ACTUAL}" data-validar_fecha="validar_fecha" required/>
                                    </div>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="alcance" class="col-sm-2 control-label">{$smarty.const.FIELD_TIPO_PROC}</label>
                                <div class="col-sm-8">
                                    <select class="form-control chosen-select" name='alcance' id='alcance'>
                                        <option value="Indefinido" {if $proceso->alcance == 'Indefinido'} selected {/if}>{$smarty.const.TXT_INDEF}</option>
                                        <option value="Apoyo" {if $proceso->alcance == 'Apoyo'} selected {/if}>{$smarty.const.TXT_APOYO}</option>
                                        <option value="Operativo" {if $proceso->alcance == 'Operativo'} selected {/if}>{$smarty.const.TXT_OPERATIVO}</option>
                                        <option value="Directivo/Gestion" {if $proceso->alcance == 'Directivo/Gestion'} selected {/if}>{$smarty.const.TXT_DIR_GES}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="madre" class="col-sm-2 control-label">{$smarty.const.FIELD_PROC_MADRE}</label>
                                <div class="col-sm-8">
                                    <select class="form-control chosen-select" name='madre' id='madre'>
                                        <option value="0">{$smarty.const.TXT_PROC_ES_MADRE}</option>
                                        {foreach from=$procesos_madre item=proceso_madre}
                                            <option value="{$proceso_madre->id}" {if $proceso_madre->id == $proceso->id_madre} selected {/if}>
                                                {$proceso_madre->codigo} - {$proceso_madre->nombre}
                                            </option>
                                        {/foreach} 
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="id_propietario" class="col-sm-2 control-label">{$smarty.const.FIELD_PROPIETARIO}</label>
                                <div class="col-sm-8">
                                    <select class="form-control chosen-select" name='id_propietario' id='id_propietario'>
                                        {foreach from=$usuarios_entidad item=usuario_entidad}
                                            <option value="{$usuario_entidad->usuario->id}" {if $proceso->id_propietario == $usuario_entidad->usuario->id} selected {/if}>{$usuario_entidad->usuario->nombre} {$usuario_entidad->usuario->apellidos} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
                                            </option>
                                        {/foreach}  
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mision" class="col-sm-2 control-label">{$smarty.const.FIELD_MISION}</label>
                                <div class="col-sm-8">
                                    <textarea  class="form-control" id="mision" name="mision" placeholder="{$smarty.const.FIELD_MISION}">{$proceso->mision}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="equipo_de_proceso" class="col-sm-2 control-label">{$smarty.const.FIELD_EQUIP_PROC}</label>
                                <div class="col-sm-8">
                                    <textarea  class="form-control" id="equipo_de_proceso" name="equipo_de_proceso" placeholder="{$smarty.const.FIELD_EQUIP_PROC}">{$proceso->equipo_de_proceso}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="resultados_clave" class="col-sm-2 control-label">{$smarty.const.FIELD_RESULTS_CLAVE}</label>
                                <div class="col-sm-8">
                                    <textarea  class="form-control" id="resultados_clave" name="resultados_clave" placeholder="{$smarty.const.FIELD_RESULTS_CLAVE}">{$proceso->resultados_clave}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href = 'index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
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
                        </div>
                        <!-- /Tab proceso --> 

                        <!-- Tab otros -->
                        <div role="tabpanel" class="tab-pane" id="otros">
                            <br>
                            <div class="form-group">
                                <label for="entradas" class="col-sm-2 control-label">{$smarty.const.FIELD_ENTRADAS_PROV}</label>
                                <div class="col-sm-8">
                                    <textarea  class="form-control" id="entradas" name="entradas" placeholder="{$smarty.const.FIELD_ENTRADAS_PROV}">{$proceso->entradas}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="salidas" class="col-sm-2 control-label">{$smarty.const.FIELD_SALIDAS_CLIENTS}</label>
                                <div class="col-sm-8">
                                    <textarea  class="form-control" id="salidas" name="salidas" placeholder="{$smarty.const.FIELD_SALIDAS_CLIENTS}">{$proceso->salidas}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="actividades" class="col-sm-2 control-label">{$smarty.const.FIELD_ACTIVIDADES}</label>
                                <div class="col-sm-8">
                                    <textarea  class="form-control" id="actividades" name="actividades" placeholder="{$smarty.const.FIELD_ACTIVIDADES}">{$proceso->actividades}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="variables_control" class="col-sm-2 control-label">{$smarty.const.FIELD_VARS_CONTROL}</label>
                                <div class="col-sm-8">
                                    <textarea  class="form-control" id="variables_control" name="variables_control" placeholder="{$smarty.const.FIELD_VARS_CONTROL}">{$proceso->variables_control}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="documentacion" class="col-sm-2 control-label">{$smarty.const.FIELD_DOCUMENTACION}</label>
                                <div class="col-sm-8">
                                    <textarea  class="form-control" id="documentacion" name="documentacion" placeholder="{$smarty.const.FIELD_DOCUMENTACION}">{$proceso->documentacion}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mediciones" class="col-sm-2 control-label">{$smarty.const.FIELD_MEDICIONES}</label>
                                <div class="col-sm-8">
                                    <textarea  class="form-control" id="mediciones" name="mediciones" placeholder="{$smarty.const.FIELD_MEDICIONES}">{$proceso->mediciones}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="registros" class="col-sm-2 control-label">{$smarty.const.FIELD_REGISTROS}</label>
                                <div class="col-sm-8">
                                    <textarea  class="form-control" name="registros" id="registros" placeholder="{$smarty.const.FIELD_REGISTROS}">{$proceso->registros}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="observaciones" class="col-sm-2 control-label">{$smarty.const.FIELD_OBSERV}</label>
                                <div class="col-sm-8">
                                    <textarea  class="form-control" name="observaciones" id="observaciones" placeholder="{$smarty.const.FIELD_OBSERV}">{$proceso->observaciones}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href = 'index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
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
                        </div>
                        <!-- /Tab otros -->

                    </div>
                    <!-- /Tab panes -->

                    <!-- Diálogo Confirmar Edición -->
                    <div class="modal fade" id="dialogo_confirmar_edicion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h3 class="modal-title" id="myModalLabel"><i class="fa fa-pencil fa-fw"></i> {$smarty.const.TXT_PROC_EDIT}: {$proceso->nombre}</h3>
                                </div>
                                <div class="modal-body">
                                    <p>{$smarty.const.MSG_PROC_CONFIRM_EDITAR}</p>
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