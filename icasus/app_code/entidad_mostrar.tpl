<div class="row">
    <div class="col-lg-3 col-md-6">
        <a title="{$smarty.const.TXT_UNID_FICHA}" href="index.php?page=entidad_datos&id_entidad={$entidad->id}">
            <div class="panel panel-ficha-unidad">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-folder fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">&nbsp;</div>
                            <div class="h4">{$smarty.const.TXT_UNID_FICHA}</div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </div>
    <div class="col-lg-3 col-md-6">
        <a title="{$smarty.const.TXT_PROCS}" href="index.php?page=proceso_listar&id_entidad={$entidad->id}">
            <div class="panel panel-procesos">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-gears fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">{$num_procesos}</div>
                            <div class="h4">{$smarty.const.TXT_PROCS}</div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </div>
    <div class="col-lg-3 col-md-6">
        <a title="{$smarty.const.FIELD_INDICS}" href="index.php?page=indicador_listar&id_entidad={$entidad->id}">
            <div class="panel panel-indicadores">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-dashboard fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">{$num_indicadores}</div>
                            <div class="h4">{$smarty.const.FIELD_INDICS}</div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </div>
    <div class="col-lg-3 col-md-6">
        <a title="{$smarty.const.FIELD_DATOS}" href="index.php?page=dato_listar&id_entidad={$entidad->id}">
            <div class="panel panel-datos">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-database fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">{$num_datos}</div>
                            <div class="h4">{$smarty.const.FIELD_DATOS}</div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </div>
</div>

<div class="row">
    <div class="col-lg-3 col-md-6">
        <a title="{$smarty.const.TXT_CONSULT}" href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
            <div class="panel panel-consulta">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-commenting fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">&nbsp;</div>
                            <div class="h4">{$smarty.const.TXT_CONSULT}</div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </div>
    <div class="col-lg-3 col-md-6">
        <a title="{$smarty.const.TXT_CUAD_RES}" href="index.php?page=cuadro_unidad&id_entidad={$entidad->id}">
        <div class="panel panel-cuadro-res">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-th-list fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">&nbsp;</div>
                        <div class="h4">{$smarty.const.TXT_CUAD_RES}</div>
                    </div>
                </div>
            </div>
        </div>
        </a>
    </div>
    {if $_control}
        <div class="col-lg-3 col-md-6">
            <a title="{$smarty.const.TXT_CONTROL}" href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
                <div class="panel panel-control">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-sliders fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">&nbsp;</div>
                                <div class="h4">{$smarty.const.TXT_CONTROL}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    {/if}
</div>