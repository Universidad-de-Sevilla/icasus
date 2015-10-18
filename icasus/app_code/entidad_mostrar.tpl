{if ($entidad->madre->id!=0 AND $entidad->madre->id!=1)}
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.FIELD_UNID_SUP}: 
                <a title="{$entidad->madre->nombre}" href="index.php?page=entidad_mostrar&id_entidad={$entidad->madre->id}&principal=1" class="btn btn-default btn-info">{$entidad->madre->nombre}</a>
            </div> 
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}

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
    <!-- /.col-lg-3 col-md-6 -->
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
    <!-- /.col-lg-3 col-md-6 -->
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
    <!-- /.col-lg-3 col-md-6 -->
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
    <!-- /.col-lg-3 col-md-6 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <a title="{$smarty.const.TXT_CUADROS_MANDO}" class="btn btn-default btn-block" href='index.php?page=cuadro_listar'>
            <h4><i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADROS_MANDO}</h4>
        </a>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->