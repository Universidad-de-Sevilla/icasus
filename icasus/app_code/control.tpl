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
                                            <a href="#tabla_sin_med" title="{$smarty.const.TXT_INDIC_DAT_SIN_MED}">{$smarty.const.TXT_INDIC_DAT_SIN_MED}</a><br>
                                            <a href="#tabla_val_ref" title="{$smarty.const.TXT_INDIC_DAT_VAL_REF}">{$smarty.const.TXT_INDIC_DAT_VAL_REF}</a>
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