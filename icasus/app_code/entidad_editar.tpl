<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h2 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-pencil fa-fw"></i> {$_nombre_pagina}
        </h2>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Nombre página -->

<!-- Barra de botones -->
<div class="row">
    <div class="col-lg-12">
        <div class="btn-toolbar" role="toolbar" aria-label="">
            <div class="btn-group" role="group" aria-label="">
                <a class="btn btn-default btn-danger" href="index.php?page=entidad_datos&id_entidad={$entidad->id}" title="{$smarty.const.TXT_UNID_VOLVER}">
                    <i class="fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_UNID_VOLVER}</a>
            </div>
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<!-- /Barra de botones -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-th-list fa-fw"></i> {$smarty.const.TXT_UNID_PARAM}</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <form method='post' action='index.php?page=entidad_editar&id_entidad={$entidad->id}' 
                      data-toggle="validator" class="form-horizontal">
                    <div class="form-group has-feedback">
                        <label for="codigo" class="col-sm-2 control-label">{$smarty.const.FIELD_COD} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input title="{$smarty.const.TXT_CODIGO}" type='text' name='codigo' id='codigo' 
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
                    <div class="form-group">
                        <label for="id_padre" class="col-sm-2 control-label">{$smarty.const.FIELD_UNID_SUP}</label>
                        <div class="col-sm-8">
                            <select class="form-control chosen-select" name='id_padre' id='id_padre'>
                                {foreach from=$entidades item=padre}
                                    <option value="{$padre->id}" {if $entidad->id_madre == $padre->id}selected{/if}>{$padre->nombre}
                                    </option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="web" class="col-sm-2 control-label">{$smarty.const.FIELD_WEB}</label>
                        <div class="col-sm-8">
                            <input type='url' name='web' id='web' class="form-control" value='{$entidad->web}' placeholder="URL"/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-default btn-danger" title="{$smarty.const.TXT_CANCEL}" onclick="location.href = 'index.php?page=entidad_datos&id_entidad={$entidad->id}';">
                                <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                            </button>
                            <button type="reset" class="btn btn-default btn-warning" title="{$smarty.const.TXT_RESET}">
                                <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                            </button>
                            <button title="{$smarty.const.TXT_GRABAR}" type="submit" class="btn btn-default btn-success">
                                <i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_GRABAR}
                            </button>
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