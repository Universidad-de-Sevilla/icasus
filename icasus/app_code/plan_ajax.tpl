{if !$anyo}
    <div class="panel-group" id="accordion_lineas" role="tablist" aria-multiselectable="true">
        {foreach from=$lineas item=linea}
            <div class="panel panel-danger">
                <div class="panel-heading" role="tab">
                    <div class="row">
                        <div class="col-sm-8">
                            <h4 class="panel-title">
                                <a title="{$smarty.const.FIELD_LINEA}: {$linea->indice}. {$linea->nombre}" role="button" data-toggle="collapse" data-parent="#accordion_lineas" href="#{$linea->id}" aria-expanded="false" aria-controls="">
                                    <i class="fa fa-long-arrow-right fa-fw"></i> {$linea->indice}. {$linea->nombre}
                                </a>
                                <a class="panel-title pull-right" title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_linea={$linea->id}&id_entidad={$plan->id_entidad}">
                                    <i class="fa fa-folder fa-fw"></i>
                                </a> 
                            </h4>   
                        </div>
                        <!-- /.col-sm-8 -->
                        <div class="col-sm-4">
                            <div class="progress">
                                <div class="progress-bar {if $linea->ejecucion|round:"2" < 25}progress-bar-danger{else if $linea->ejecucion|round:"2" >= 25 && $linea->ejecucion|round:"2" < 75}progress-bar-warning{else if $linea->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$linea->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$linea->ejecucion|round:"2"}%">
                                    {$linea->ejecucion|round:"2"} %
                                </div>
                            </div>
                        </div>
                        <!-- /.col-sm-4 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.panel-heading -->
                <div id="{$linea->id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="">
                    <div class="panel-group" id="accordion_objests" role="tablist" aria-multiselectable="true">
                        {if $objests_lineas[$linea->id]}
                            {foreach from=$objests_lineas[$linea->id] item=objest}
                                <div class="panel panel-warning">
                                    <div class="panel-heading" role="tab">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <h4 class="panel-title">
                                                    <a title="{$smarty.const.FIELD_OBJ_EST}: {$linea->indice}.{$objest->indice}. {$objest->nombre}" role="button" data-toggle="collapse" data-parent="#accordion_objests" href="#{$linea->id}{$objest->id}" aria-expanded="false" aria-controls="">
                                                        <i class="fa fa-dot-circle-o fa-fw"></i> {$linea->indice}.{$objest->indice}. {$objest->nombre}
                                                    </a>
                                                    <a class="panel-title pull-right" title="{$smarty.const.TXT_FICHA}" href="index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$plan->id_entidad}">
                                                        <i class="fa fa-folder fa-fw"></i>
                                                    </a> 
                                                </h4>
                                            </div>
                                            <!-- /.col-sm-8 -->
                                            <div class="col-sm-4">
                                                <div class="progress">
                                                    <div class="progress-bar {if $objest->ejecucion|round:"2" < 25}progress-bar-danger{else if $objest->ejecucion|round:"2" >= 25 && $objest->ejecucion|round:"2" < 75}progress-bar-warning{else if $objest->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objest->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$objest->ejecucion|round:"2"}%">
                                                        {$objest->ejecucion|round:"2"} %
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.col-sm-4 -->
                                        </div>
                                        <!-- /.row -->
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div id="{$linea->id}{$objest->id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="">
                                        {if $objops_objests[$objest->id]}
                                            <div class="list-group">
                                                {foreach from=$objops_objests[$objest->id] item=objop}
                                                    <a href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$plan->id_entidad}" title="{$smarty.const.FIELD_OBJ_OP}: {$linea->indice}.{$objest->indice}.{$objop->indice}. {$objop->nombre}" class="list-group-item list-group-item-success">
                                                        <div class="row">
                                                            <div class="col-sm-8">
                                                                <i class="fa fa-bullseye fa-fw"></i> {$linea->indice}.{$objest->indice}.{$objop->indice}. {$objop->nombre}
                                                            </div>
                                                            <!-- /.col-sm-8 -->
                                                            <div class="col-sm-4">
                                                                <div class="progress">
                                                                    <div class="progress-bar {if $objop->ejecucion|round:"2" < 25}progress-bar-danger{else if $objop->ejecucion|round:"2" >= 25 && $objop->ejecucion|round:"2" < 75}progress-bar-warning{else if $objop->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objop->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$objop->ejecucion|round:"2"}%">
                                                                        {$objop->ejecucion|round:"2"} %
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- /.col-sm-4 -->
                                                        </div>
                                                        <!-- /.row -->
                                                    </a>
                                                {/foreach}
                                            </div>
                                        {else}
                                            <div class="alert alert-info alert-dismissible">
                                                <i class="fa fa-info-circle fa-fw"></i> 
                                                {$smarty.const.MSG_OBJEST_NO_OBJOP}
                                            </div> 
                                        {/if}
                                    </div>
                                    <!-- /.panel-collapse -->
                                </div>
                                <!-- /.panel -->
                            {/foreach}
                        {else}
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i> 
                                {$smarty.const.MSG_LINEA_NO_OBJEST}
                            </div> 
                        {/if}
                    </div> 
                </div>
                <!-- /.panel-collapse -->
            </div>
            <!-- /.panel -->
        {/foreach}
    </div>
{else}
    <div class="panel-group" id="accordion_lineas" role="tablist" aria-multiselectable="true">
        {foreach from=$lineas item=linea}
            <div class="panel panel-danger">
                <div class="panel-heading" role="tab">
                    <div class="row">
                        <div class="col-sm-8">
                            <h4 class="panel-title">
                                <a title="{$smarty.const.FIELD_LINEA}: {$linea->indice}. {$linea->nombre}" role="button" data-toggle="collapse" data-parent="#accordion_lineas" href="#{$linea->id}" aria-expanded="false" aria-controls="">
                                    <i class="fa fa-long-arrow-right fa-fw"></i> {$linea->indice}. {$linea->nombre}
                                </a>
                                <a class="panel-title pull-right" title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_linea={$linea->id}&id_entidad={$plan->id_entidad}">
                                    <i class="fa fa-folder fa-fw"></i>
                                </a> 
                            </h4>   
                        </div>
                        <!-- /.col-sm-8 -->
                        <div class="col-sm-4">
                            <div class="progress">
                                <div class="progress-bar {if $ejecucion_lineas[$linea->id]|round:"2" < 25}progress-bar-danger{else if $ejecucion_lineas[$linea->id]|round:"2" >= 25 && $ejecucion_lineas[$linea->id]|round:"2" < 75}progress-bar-warning{else if $ejecucion_lineas[$linea->id]|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$ejecucion_lineas[$linea->id]|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$ejecucion_lineas[$linea->id]|round:"2"}%">
                                    {$ejecucion_lineas[$linea->id]|round:"2"} %
                                </div>
                            </div>
                        </div>
                        <!-- /.col-sm-4 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.panel-heading -->
                <div id="{$linea->id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="">
                    <div class="panel-group" id="accordion_objests" role="tablist" aria-multiselectable="true">
                        {if $objests_lineas[$linea->id]}
                            {foreach from=$objests_lineas[$linea->id] item=objest}
                                <div class="panel panel-warning">
                                    <div class="panel-heading" role="tab">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <h4 class="panel-title">
                                                    <a title="{$smarty.const.FIELD_OBJ_EST}: {$linea->indice}.{$objest->indice}. {$objest->nombre}" role="button" data-toggle="collapse" data-parent="#accordion_objests" href="#{$linea->id}{$objest->id}" aria-expanded="false" aria-controls="">
                                                        <i class="fa fa-dot-circle-o fa-fw"></i> {$linea->indice}.{$objest->indice}. {$objest->nombre}
                                                    </a>
                                                    <a class="panel-title pull-right" title="{$smarty.const.TXT_FICHA}" href="index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$plan->id_entidad}">
                                                        <i class="fa fa-folder fa-fw"></i>
                                                    </a> 
                                                </h4>
                                            </div>
                                            <!-- /.col-sm-8 -->
                                            <div class="col-sm-4">
                                                <div class="progress">
                                                    <div class="progress-bar {if $ejecucion_objests[$objest->id]|round:"2" < 25}progress-bar-danger{else if $ejecucion_objests[$objest->id]|round:"2" >= 25 && $ejecucion_objests[$objest->id]|round:"2" < 75}progress-bar-warning{else if $ejecucion_objests[$objest->id]|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$ejecucion_objests[$objest->id]|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$ejecucion_objests[$objest->id]|round:"2"}%">
                                                        {$ejecucion_objests[$objest->id]|round:"2"} %
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.col-sm-4 -->
                                        </div>
                                        <!-- /.row -->
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div id="{$linea->id}{$objest->id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="">
                                        {if $objops_objests[$objest->id]}
                                            <div class="list-group">
                                                {foreach from=$objops_objests[$objest->id] item=objop}
                                                    <a href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$plan->id_entidad}" title="{$smarty.const.FIELD_OBJ_OP}: {$linea->indice}.{$objest->indice}.{$objop->indice}. {$objop->nombre}" class="list-group-item list-group-item-success">
                                                        <div class="row">
                                                            <div class="col-sm-8">
                                                                <i class="fa fa-bullseye fa-fw"></i> {$linea->indice}.{$objest->indice}.{$objop->indice}. {$objop->nombre}
                                                            </div>
                                                            <!-- /.col-sm-8 -->
                                                            <div class="col-sm-4">
                                                                <div class="progress">
                                                                    <div class="progress-bar {if $ejecucion_objops[$objop->id]|round:"2" < 25}progress-bar-danger{else if $ejecucion_objops[$objop->id]|round:"2" >= 25 && $ejecucion_objops[$objop->id]|round:"2" < 75}progress-bar-warning{else if $ejecucion_objops[$objop->id]|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$ejecucion_objops[$objop->id]|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$ejecucion_objops[$objop->id]|round:"2"}%">
                                                                        {$ejecucion_objops[$objop->id]|round:"2"} %
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- /.col-sm-4 -->
                                                        </div>
                                                        <!-- /.row -->
                                                    </a>
                                                {/foreach}
                                            </div>
                                        {else}
                                            <div class="alert alert-info alert-dismissible">
                                                <i class="fa fa-info-circle fa-fw"></i> 
                                                {$smarty.const.MSG_OBJEST_NO_OBJOP}
                                            </div> 
                                        {/if}
                                    </div>
                                    <!-- /.panel-collapse -->
                                </div>
                                <!-- /.panel -->
                            {/foreach}
                        {else}
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i> 
                                {$smarty.const.MSG_LINEA_NO_OBJEST}
                            </div> 
                        {/if}
                    </div> 
                </div>
                <!-- /.panel-collapse -->
            </div>
            <!-- /.panel -->
        {/foreach}
    </div>
{/if}