{if $modulo == 'inicio'}
    <!-- Nombre página -->
    <div class="row">
        <div class="col-lg-12">
            <h3 title="{$_nombre_pagina}" class="page-header">
                <i class="fa fa-sliders fa-fw"></i> {$_nombre_pagina}
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
                    <span class="panel-title"><i class="fa fa-calendar fa-fw"></i> {$smarty.const.FIELD_PERIODO}</span>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <tbody>
                                <tr>
                                    <th>{$smarty.const.FIELD_ANYO}</th>
                                    <td>
                                        <div id="periodo" data-id_entidad="{$entidad->id}">
                                            {html_select_date id="Year" prefix="" year_empty=$smarty.const.TXT_SEL
                                            display_months=FALSE display_days=FALSE start_year=($smarty.now|date_format:"%Y")-10
                                            end_year=$smarty.now|date_format:"%Y" time='' reverse_years=TRUE}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.TXT_CONTROL}</th>
                                    <td>
                                        <div>
                                            <a href="#tabla_agrupados" title="{$smarty.const.TXT_INDIC_DAT_MED_NULA_AGRUPADOS}">{$smarty.const.TXT_INDIC_DAT_MED_NULA_AGRUPADOS}</a><br>
                                            <a href="#tabla_nulos" title="{$smarty.const.TXT_INDIC_DAT_MED_NULA}">{$smarty.const.TXT_INDIC_DAT_MED_NULA}</a><br>
                                            <a href="#tabla_modificados" title="{$smarty.const.TXT_INDIC_DAT_ULTIMA_MOD}">{$smarty.const.TXT_INDIC_DAT_ULTIMA_MOD}</a><br>
                                            <a href="#tabla_sin_med" title="{$smarty.const.TXT_INDIC_DAT_SIN_MED}">{$smarty.const.TXT_INDIC_DAT_SIN_MED}</a>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.panel-body -->        
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div id="dt1" class="no_margin">
                {include file="control_valores.tpl"}
            </div><!-- #dt1 .no_margin -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}

{if $modulo == 'filtrOnlyear'}
    {include file="control_valores.tpl"}
{/if}