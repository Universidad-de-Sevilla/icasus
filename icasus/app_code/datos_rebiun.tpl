<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-folder-open fa-fw"></i> {$_nombre_pagina}
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
            <li><a title="{$smarty.const.FIELD_DATOS}" href='index.php?page=dato_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_DATOS}</a></li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <!-- Selección de subunidades -->
    <div class="col-md-4">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-sitemap fa-fw"></i> {$smarty.const.FIELD_SUBUNIDS}</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <!-- Nav tabs -->
                <ul class="nav nav-pills nav-stacked" role="tablist">
                    {foreach $entidades as $entidad}
                        <li id="tab_{$entidad->etiqueta|replace:' ':'_'}" role="presentation" {if $entidad@first}class="active"{/if}>
                            <a href="#{$entidad->etiqueta|replace:' ':'_'}" title="{$entidad->etiqueta}" aria-controls="{$entidad->etiqueta}" role="tab" data-toggle="tab">{$entidad->etiqueta}</a>
                        </li> 
                    {/foreach}
                </ul>
                <!-- /Nav tabs -->
            </div>
            <!-- /.panel-body --> 
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-md-4 -->
    <!-- /Selección de subunidades -->

    <div class="col-md-8">
        <!-- Tab panes -->
        <div class="tab-content">
            {foreach $entidades as $entidad}

                <!-- Tab subunidades -->
                <div id="{$entidad->etiqueta|replace:' ':'_'}" role="tabpanel" class="tab-pane {if $entidad@first}active{/if}">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <span class="panel-title"><i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VALS_SUBUNID} ({$entidad->etiqueta})</span>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <tbody>
                                        {foreach $entidad->valores as $valor}
                                            <tr>
                                                <td>
                                                    <input type="input" name="valor" id="valor" class="entrada_valor number" 
                                                           value="{$valor->valor_parcial}"
                                                           data-id_valor = "{$valor->id}"
                                                           data-id_entidad = "{$entidad->id}"
                                                           data-id_usuario = "{$id_usuario}"/>
                                                </td>
                                                <td class="text-justify">
                                                    <p><b>{$valor->indicador->nombre}</b> ({$valor->medicion->etiqueta})</p>
                                                    <p><small>{$valor->indicador->descripcion}</small></p>   
                                                </td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>   
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /Tab subunidades -->

            {/foreach}
        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-md-8 -->
</div>