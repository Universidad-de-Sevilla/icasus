{if $anyo}
    <ul class="list-group" style="margin: 0;">
        <li class="list-group-item list-group-item-info">
            <div class="row">
                <div class="col-sm-8 h4">
                    {$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {($plan->anyo_inicio + $plan->duracion-1)}
                </div>
                <!-- /.col-sm-8 -->
                <div class="col-sm-4">
                    <div class="progress">
                        <div class="progress-bar {if $ejecucion_plan|round:"2" < 25}progress-bar-danger{else if $ejecucion_plan|round:"2" >= 25 && $ejecucion_plan|round:"2" < 75}progress-bar-warning{else if $ejecucion_plan|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$ejecucion_plan|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width: {$ejecucion_plan|round:"2"}%;">
                            {$ejecucion_plan|round:"2"} %
                        </div>
                    </div>
                </div>
                <!-- /.col-sm-4 -->
            </div>
            <!-- /.row -->
        </li>
    </ul>
    <div class="panel-group" id="accordion_lineas" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">
        {foreach from=$lineas item=linea}
            <div class="panel panel-danger" style="margin-top: 0;">
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
                                <div class="progress-bar {if $ejecucion_lineas[$linea->id]|round:"2" < 25}progress-bar-danger{else if $ejecucion_lineas[$linea->id]|round:"2" >= 25 && $ejecucion_lineas[$linea->id]|round:"2" < 75}progress-bar-warning{else if $ejecucion_lineas[$linea->id]|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$ejecucion_lineas[$linea->id]|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width: {$ejecucion_lineas[$linea->id]|round:"2"}%;">
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
                    <div class="panel-group" id="accordion_objests" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">
                        {if $objests_lineas[$linea->id]}
                            {foreach from=$objests_lineas[$linea->id] item=objest}
                                <div class="panel panel-warning" style="margin-top: 0;">
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
                                                    <div class="progress-bar {if $ejecucion_objests[$objest->id]|round:"2" < 25}progress-bar-danger{else if $ejecucion_objests[$objest->id]|round:"2" >= 25 && $ejecucion_objests[$objest->id]|round:"2" < 75}progress-bar-warning{else if $ejecucion_objests[$objest->id]|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$ejecucion_objests[$objest->id]|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width: {$ejecucion_objests[$objest->id]|round:"2"}%;">
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
                                        <div class="panel-group" id="accordion_objops" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">
                                            {if $objops_objests[$objest->id]}
                                                {foreach from=$objops_objests[$objest->id] item=objop}
                                                    <div class="panel panel-success" style="margin-top: 0;">
                                                        <div class="panel-heading" role="tab">
                                                            <div class="row">
                                                                <div class="col-sm-8">
                                                                    <h4 class="panel-title">
                                                                        <a title="{$smarty.const.FIELD_OBJ_OP}: {$linea->indice}.{$objest->indice}.{$objop->indice}. {$objop->nombre}" role="button" data-toggle="collapse" data-parent="#accordion_objops" href="#{$linea->id}{$objest->id}{$objop->id}" aria-expanded="false" aria-controls="">
                                                                            <i class="fa fa-bullseye fa-fw"></i> {$linea->indice}.{$objest->indice}.{$objop->indice}. {$objop->nombre}
                                                                        </a>
                                                                        <a class="panel-title pull-right" title="{$smarty.const.TXT_FICHA}" href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$plan->id_entidad}">
                                                                            <i class="fa fa-folder fa-fw"></i>
                                                                        </a> 
                                                                    </h4>
                                                                </div>
                                                                <!-- /.col-sm-8 -->
                                                                <div class="col-sm-4">
                                                                    <div class="progress">
                                                                        <div class="progress-bar {if $ejecucion_objops[$objop->id]|round:"2" < 25}progress-bar-danger{else if $ejecucion_objops[$objop->id]|round:"2" >= 25 && $ejecucion_objops[$objop->id]|round:"2" < 75}progress-bar-warning{else if $ejecucion_objops[$objop->id]|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$ejecucion_objops[$objop->id]|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width: {$ejecucion_objops[$objop->id]|round:"2"}%;">
                                                                            {$ejecucion_objops[$objop->id]|round:"2"} %
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- /.col-sm-4 -->
                                                            </div>
                                                            <!-- /.row -->
                                                        </div>
                                                        <!-- /.panel-heading -->
                                                        <div id="{$linea->id}{$objest->id}{$objop->id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="">
                                                            <div class="panel-group" id="accordion_indics" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">
                                                                <!-- Indicadores de correlación -->
                                                                {if $objops_indicadores_correlacion[$objop->id]}
                                                                    <div class="list-group" style="margin: 0;">
                                                                        <a href="#" class="list-group-item disabled">
                                                                            <i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-gear fa-fw"></sub> {$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_PROC})
                                                                        </a>
                                                                        {foreach $objops_indicadores_correlacion[$objop->id] as $ind_correl}
                                                                            <a class="list-group-item" href='index.php?page=indicador_mostrar&id_indicador={$ind_correl->id}&id_entidad={$ind_correl->id_entidad}' 
                                                                               title="{$ind_correl->nombre}: {$ind_correl->descripcion|replace:"\r\n":" "}">
                                                                                {$ind_correl->nombre}
                                                                            </a>
                                                                        {/foreach}
                                                                    </div>
                                                                {else}
                                                                    <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                                        <i class="fa fa-info-circle fa-fw"></i> 
                                                                        {$smarty.const.MSG_OBJOP_NO_INDICS_CORREL}
                                                                    </div>
                                                                {/if}
                                                                <!-- /Indicadores de correlación -->
                                                                <!-- Indicadores de control -->
                                                                {if $objops_indicadores_control[$objop->id]}
                                                                    <div class="list-group" style="margin: 0;">
                                                                        <a href="#" class="list-group-item disabled">
                                                                            <i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-sliders fa-fw"></sub> {$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})
                                                                        </a>
                                                                        {foreach $objops_indicadores_control[$objop->id] as $ind_ctl}
                                                                            <a class="list-group-item" href='index.php?page=indicador_mostrar&id_indicador={$ind_ctl->id}&id_entidad={$ind_ctl->id_entidad}' 
                                                                               title="{$ind_ctl->nombre}: {$ind_ctl->descripcion|replace:"\r\n":" "}">
                                                                                {$ind_ctl->nombre}
                                                                            </a>
                                                                        {/foreach}
                                                                    </div>
                                                                {else}
                                                                    <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                                        <i class="fa fa-info-circle fa-fw"></i> 
                                                                        {$smarty.const.MSG_OBJOP_NO_INDICS_CONTROL}
                                                                    </div>
                                                                {/if}
                                                                <!-- /Indicadores de control -->
                                                            </div>
                                                        </div>
                                                        <!-- /.panel-collapse -->
                                                    </div>
                                                    <!-- /.panel -->
                                                {/foreach}
                                            {else}
                                                <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                    <i class="fa fa-info-circle fa-fw"></i> 
                                                    {$smarty.const.MSG_OBJEST_NO_OBJOP}
                                                </div> 
                                            {/if}
                                        </div>
                                    </div>
                                    <!-- /.panel-collapse -->
                                </div>
                                <!-- /.panel -->
                            {/foreach}
                        {else}
                            <div class="alert alert-info alert-dismissible" style="margin: 0;">
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
    <ul class="list-group" style="margin: 0;">
        <li class="list-group-item list-group-item-info">
            <div class="row">
                <div class="col-sm-8 h4">
                    {$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {($plan->anyo_inicio + $plan->duracion-1)}
                </div>
                <!-- /.col-sm-8 -->
                <div class="col-sm-4">
                    <div class="progress">
                        <div class="progress-bar {if $plan->ejecucion|round:"2" < 25}progress-bar-danger{else if $plan->ejecucion|round:"2" >= 25 && $plan->ejecucion|round:"2" < 75}progress-bar-warning{else if $plan->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$plan->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width: {$plan->ejecucion|round:"2"}%;">
                            {$plan->ejecucion|round:"2"} %
                        </div>
                    </div>
                </div>
                <!-- /.col-sm-4 -->
            </div>
            <!-- /.row -->
        </li>
    </ul>
    <div class="panel-group" id="accordion_lineas" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">
        {foreach from=$lineas item=linea}
            <div class="panel panel-danger" style="margin-top: 0;">
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
                                <div class="progress-bar {if $linea->ejecucion|round:"2" < 25}progress-bar-danger{else if $linea->ejecucion|round:"2" >= 25 && $linea->ejecucion|round:"2" < 75}progress-bar-warning{else if $linea->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$linea->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width: {$linea->ejecucion|round:"2"}%;">
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
                    <div class="panel-group" id="accordion_objests" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">
                        {if $objests_lineas[$linea->id]}
                            {foreach from=$objests_lineas[$linea->id] item=objest}
                                <div class="panel panel-warning" style="margin-top: 0;">
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
                                                    <div class="progress-bar {if $objest->ejecucion|round:"2" < 25}progress-bar-danger{else if $objest->ejecucion|round:"2" >= 25 && $objest->ejecucion|round:"2" < 75}progress-bar-warning{else if $objest->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objest->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width: {$objest->ejecucion|round:"2"}%;">
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
                                        <div class="panel-group" id="accordion_objops" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">
                                            {if $objops_objests[$objest->id]}
                                                {foreach from=$objops_objests[$objest->id] item=objop}
                                                    <div class="panel panel-success" style="margin-top: 0;">
                                                        <div class="panel-heading" role="tab">
                                                            <div class="row">
                                                                <div class="col-sm-8">
                                                                    <h4 class="panel-title">
                                                                        <a title="{$smarty.const.FIELD_OBJ_OP}: {$linea->indice}.{$objest->indice}.{$objop->indice}. {$objop->nombre}" role="button" data-toggle="collapse" data-parent="#accordion_objops" href="#{$linea->id}{$objest->id}{$objop->id}" aria-expanded="false" aria-controls="">
                                                                            <i class="fa fa-bullseye fa-fw"></i> {$linea->indice}.{$objest->indice}.{$objop->indice}. {$objop->nombre}
                                                                        </a>
                                                                        <a class="panel-title pull-right" title="{$smarty.const.TXT_FICHA}" href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$plan->id_entidad}">
                                                                            <i class="fa fa-folder fa-fw"></i>
                                                                        </a> 
                                                                    </h4>
                                                                </div>
                                                                <!-- /.col-sm-8 -->
                                                                <div class="col-sm-4">
                                                                    <div class="progress">
                                                                        <div class="progress-bar {if $objop->ejecucion|round:"2" < 25}progress-bar-danger{else if $objop->ejecucion|round:"2" >= 25 && $objop->ejecucion|round:"2" < 75}progress-bar-warning{else if $objop->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objop->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width: {$objop->ejecucion|round:"2"}%;">
                                                                            {$objop->ejecucion|round:"2"} %
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- /.col-sm-4 -->
                                                            </div>
                                                            <!-- /.row -->
                                                        </div>
                                                        <!-- /.panel-heading -->
                                                        <div id="{$linea->id}{$objest->id}{$objop->id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="">
                                                            <div class="panel-group" id="accordion_indics" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">
                                                                <!-- Indicadores de correlación -->
                                                                {if $objops_indicadores_correlacion[$objop->id]}
                                                                    <div class="list-group" style="margin: 0;">
                                                                        <a href="#" class="list-group-item disabled">
                                                                            <i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-gear fa-fw"></sub> {$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_PROC})
                                                                        </a>
                                                                        {foreach $objops_indicadores_correlacion[$objop->id] as $ind_correl}
                                                                            <a class="list-group-item" href='index.php?page=indicador_mostrar&id_indicador={$ind_correl->id}&id_entidad={$ind_correl->id_entidad}' 
                                                                               title="{$ind_correl->nombre}: {$ind_correl->descripcion|replace:"\r\n":" "}">
                                                                                {$ind_correl->nombre}
                                                                            </a>
                                                                        {/foreach}
                                                                    </div>
                                                                {else}
                                                                    <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                                        <i class="fa fa-info-circle fa-fw"></i> 
                                                                        {$smarty.const.MSG_OBJOP_NO_INDICS_CORREL}
                                                                    </div>
                                                                {/if}
                                                                <!-- /Indicadores de correlación -->
                                                                <!-- Indicadores de control -->
                                                                {if $objops_indicadores_control[$objop->id]}
                                                                    <div class="list-group" style="margin: 0;">
                                                                        <a href="#" class="list-group-item disabled">
                                                                            <i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-sliders fa-fw"></sub> {$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})
                                                                        </a>
                                                                        {foreach $objops_indicadores_control[$objop->id] as $ind_ctl}
                                                                            <a class="list-group-item" href='index.php?page=indicador_mostrar&id_indicador={$ind_ctl->id}&id_entidad={$ind_ctl->id_entidad}' 
                                                                               title="{$ind_ctl->nombre}: {$ind_ctl->descripcion|replace:"\r\n":" "}">
                                                                                {$ind_ctl->nombre}
                                                                            </a>
                                                                        {/foreach}
                                                                    </div>
                                                                {else}
                                                                    <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                                        <i class="fa fa-info-circle fa-fw"></i> 
                                                                        {$smarty.const.MSG_OBJOP_NO_INDICS_CONTROL}
                                                                    </div>
                                                                {/if}
                                                                <!-- /Indicadores de control -->
                                                            </div>
                                                        </div>
                                                        <!-- /.panel-collapse -->
                                                    </div>
                                                    <!-- /.panel -->
                                                {/foreach}
                                            {else}
                                                <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                    <i class="fa fa-info-circle fa-fw"></i> 
                                                    {$smarty.const.MSG_OBJEST_NO_OBJOP}
                                                </div>
                                            {/if}
                                        </div>
                                    </div>
                                    <!-- /.panel-collapse -->
                                </div>
                                <!-- /.panel -->
                            {/foreach}
                        {else}
                            <div class="alert alert-info alert-dismissible" style="margin: 0;">
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