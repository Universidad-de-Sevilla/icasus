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
                <span class="panel-title"><i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADRO_PARAM}</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <form action='index.php?page=cuadro_grabar' method='post' id='formcuadro' name='formcuadro' 
                      data-toggle="validator" class="form-horizontal">
                    <input type="hidden" name="id" value="{$cuadro->id}" />
                    <div class="form-group has-feedback">
                        <label for="nombre" class="col-sm-2 control-label">{$smarty.const.FIELD_NOMBRE_CUADRO} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input type='text' class="form-control" name='nombre' id='nombre' value="{$cuadro->nombre}" placeholder="{$smarty.const.FIELD_NOMBRE_CUADRO}" required/>
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
                            <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href ='index.php?page=cuadro_listar'>
                                <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                            </a>
                            <div class="pull-right">
                                <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                                    <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                                </button>
                                <button title="{$smarty.const.TXT_GRABAR}" type="submit" class="btn btn-success">
                                    <i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_GRABAR}
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