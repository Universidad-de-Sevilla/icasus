{if $modulo==='mostrar'}
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
                                                        {if $activo_objops[$objop->id]}
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
                                                                <div id="{$linea->id}{$objest->id}{$objop->id}" class="panel-collapse collapse objop" role="tabpanel" aria-labelledby="" data-num_indic="{$objops_indicadores_correlacion[$objop->id]|@count + $objops_indicadores_control[$objop->id]|@count}">
                                                                    <div class="panel-group" id="accordion_indics" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">

                                                                        <!-- Indicadores de correlación -->
                                                                        {if $objops_indicadores_correlacion[$objop->id]}
                                                                            <div class="panel panel-default">
                                                                                <div class="panel-heading">
                                                                                    <span class="panel-title">
                                                                                        <div class="row">
                                                                                            <div class="col-md-10">
                                                                                                <i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-gear fa-fw"></sub> {$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_PROC})
                                                                                            </div>
                                                                                            <!-- /.col-md-10 -->
                                                                                            <div class="col-md-2">
                                                                                                <span title="{$objop->nombre}: {$objops_indicadores_correlacion[$objop->id]|@count} {$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_PROC})" class="badge">{$objops_indicadores_correlacion[$objop->id]|@count} {$smarty.const.FIELD_INDICS}</span>
                                                                                            </div>
                                                                                            <!-- /.col-md-2 -->
                                                                                        </div>
                                                                                        <!-- /.row -->
                                                                                    </span>
                                                                                </div>
                                                                                <!-- /.panel-heading -->
                                                                                <div class="panel-body">
                                                                                    <div id="carousel-correl-{$objop->id}" class="carousel slide" data-ride="carousel" data-interval="15000">
                                                                                        <!-- Wrapper for slides -->
                                                                                        <div class="carousel-inner" role="listbox">
                                                                                            {foreach $objops_indicadores_correlacion[$objop->id] as $ind_correl}
                                                                                                <div class="item {if $ind_correl@first}active{/if}">
                                                                                                    <div class="{$linea->id}{$objest->id}{$objop->id} highchart" 
                                                                                                         id="panel_{$objop->id}_{$ind_correl->id}" 
                                                                                                         data-id_indicador="{$ind_correl->id}" 
                                                                                                         data-nombre_indicador="{$ind_correl->nombre}"
                                                                                                         data-valor_min="{$ind_correl->valor_min}" 
                                                                                                         data-valor_max="{$ind_correl->valor_max}" 
                                                                                                         data-fecha_inicio="{$anyo - 1}-01-01" 
                                                                                                         data-fecha_fin="{($plan->anyo_inicio + $plan->duracion-1)}-12-31"
                                                                                                         {if $ind_correl->periodicidad=='Bienal'}
                                                                                                             data-periodicidad= "bienal" 
                                                                                                         {else}
                                                                                                             data-periodicidad= "anual"
                                                                                                         {/if}>
                                                                                                    </div>
                                                                                                    <div class="carousel-caption">
                                                                                                        <h3>
                                                                                                            <a href='index.php?page=indicador_mostrar&id_indicador={$ind_correl->id}&id_entidad={$ind_correl->id_entidad}' 
                                                                                                               title="{$ind_correl->nombre}: {$ind_correl->descripcion|replace:"\r\n":" "}"><i class="fa fa-dashboard fa-fw"></i></a>
                                                                                                        </h3>
                                                                                                        <p style="color: #337AB7;">{$smarty.const.TXT_GRAFICO_AUMENTAR}</p>
                                                                                                    </div>
                                                                                                </div>
                                                                                            {/foreach}
                                                                                        </div>
                                                                                        <!-- Controls -->
                                                                                        <a class="left carousel-control" title="{$smarty.const.TXT_ANT}" href="#carousel-correl-{$objop->id}" role="button" data-slide="prev">
                                                                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color: #337AB7;"></span>
                                                                                            <span class="sr-only">{$smarty.const.TXT_ANT}</span>
                                                                                        </a>
                                                                                        <a class="right carousel-control" title="{$smarty.const.TXT_SIG}" href="#carousel-correl-{$objop->id}" role="button" data-slide="next">
                                                                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color: #337AB7;"></span>
                                                                                            <span class="sr-only">{$smarty.const.TXT_SIG}</span>
                                                                                        </a>
                                                                                    </div>
                                                                                    <!-- /.carousel -->
                                                                                </div>
                                                                                <!-- /.panel-body -->
                                                                            </div>
                                                                            <!-- /.panel -->
                                                                        {else}
                                                                            <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                                                <i class="fa fa-info-circle fa-fw"></i> 
                                                                                {$smarty.const.MSG_OBJOP_NO_INDICS_CORREL}
                                                                            </div>
                                                                        {/if}
                                                                        <!-- /Indicadores de correlación -->

                                                                        <!-- Indicadores de control -->
                                                                        {if $objops_indicadores_control[$objop->id]}
                                                                            <div class="panel panel-default">
                                                                                <div class="panel-heading">
                                                                                    <span class="panel-title">
                                                                                        <div class="row">
                                                                                            <div class="col-md-10">
                                                                                                <i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-sliders fa-fw"></sub> {$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})
                                                                                            </div>
                                                                                            <!-- /.col-md-10 -->
                                                                                            <div class="col-md-2">
                                                                                                <span title="{$objop->nombre}: {$objops_indicadores_control[$objop->id]|@count} {$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})" class="badge">{$objops_indicadores_control[$objop->id]|@count} {$smarty.const.FIELD_INDICS}</span>
                                                                                            </div>
                                                                                            <!-- /.col-md-2 -->
                                                                                        </div>
                                                                                        <!-- /.row -->
                                                                                    </span>
                                                                                </div>
                                                                                <!-- /.panel-heading -->
                                                                                <div class="panel-body">
                                                                                    <div id="carousel-control-{$objop->id}" class="carousel slide" data-ride="carousel" data-interval="15000">
                                                                                        <!-- Wrapper for slides -->
                                                                                        <div class="carousel-inner" role="listbox">
                                                                                            {foreach $objops_indicadores_control[$objop->id] as $ind_ctl}
                                                                                                <div class="item {if $ind_ctl@first}active{/if}">
                                                                                                    <div class="{$linea->id}{$objest->id}{$objop->id} highchart" 
                                                                                                         id="panel_{$objop->id}_{$ind_ctl->id}" 
                                                                                                         data-id_indicador="{$ind_ctl->id}" 
                                                                                                         data-nombre_indicador="{$ind_ctl->nombre}"
                                                                                                         data-valor_min="{$ind_ctl->valor_min}" 
                                                                                                         data-valor_max="{$ind_ctl->valor_max}" 
                                                                                                         data-fecha_inicio="{$anyo - 1}-01-01" 
                                                                                                         data-fecha_fin="{($plan->anyo_inicio + $plan->duracion-1)}-12-31"
                                                                                                         {if $ind_ctl->periodicidad=='Bienal'}
                                                                                                             data-periodicidad= "bienal" 
                                                                                                         {else}
                                                                                                             data-periodicidad= "anual"
                                                                                                         {/if}>
                                                                                                    </div>
                                                                                                    <div class="carousel-caption">
                                                                                                        <h3>
                                                                                                            <a href='index.php?page=indicador_mostrar&id_indicador={$ind_ctl->id}&id_entidad={$ind_ctl->id_entidad}' 
                                                                                                               title="{$ind_ctl->nombre}: {$ind_ctl->descripcion|replace:"\r\n":" "}"><i class="fa fa-dashboard fa-fw"></i></a>
                                                                                                        </h3>
                                                                                                        <p style="color: #337AB7;">{$smarty.const.TXT_GRAFICO_AUMENTAR}</p>
                                                                                                    </div>
                                                                                                </div>
                                                                                            {/foreach}
                                                                                        </div>
                                                                                        <!-- Controls -->
                                                                                        <a class="left carousel-control" title="{$smarty.const.TXT_ANT}" href="#carousel-control-{$objop->id}" role="button" data-slide="prev">
                                                                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color: #337AB7;"></span>
                                                                                            <span class="sr-only">{$smarty.const.TXT_ANT}</span>
                                                                                        </a>
                                                                                        <a class="right carousel-control" title="{$smarty.const.TXT_SIG}" href="#carousel-control-{$objop->id}" role="button" data-slide="next">
                                                                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color: #337AB7;"></span>
                                                                                            <span class="sr-only">{$smarty.const.TXT_SIG}</span>
                                                                                        </a>
                                                                                    </div>
                                                                                    <!-- /.carousel -->
                                                                                </div>
                                                                                <!-- /.panel-body -->
                                                                            </div>
                                                                            <!-- /.panel -->
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
                                                        {/if}
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
                                                            <div id="{$linea->id}{$objest->id}{$objop->id}" class="panel-collapse collapse objop" role="tabpanel" aria-labelledby="" data-num_indic="{$objops_indicadores_correlacion[$objop->id]|@count + $objops_indicadores_control[$objop->id]|@count}">
                                                                <div class="panel-group" id="accordion_indics" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">

                                                                    <!-- Indicadores de correlación -->
                                                                    {if $objops_indicadores_correlacion[$objop->id]}
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading">
                                                                                <span class="panel-title">
                                                                                    <div class="row">
                                                                                        <div class="col-md-10">
                                                                                            <i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-gear fa-fw"></sub> {$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_PROC})
                                                                                        </div>
                                                                                        <!-- /.col-md-10 -->
                                                                                        <div class="col-md-2">
                                                                                            <span title="{$objop->nombre}: {$objops_indicadores_correlacion[$objop->id]|@count} {$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_PROC})" class="badge">{$objops_indicadores_correlacion[$objop->id]|@count} {$smarty.const.FIELD_INDICS}</span>
                                                                                        </div>
                                                                                        <!-- /.col-md-2 -->
                                                                                    </div>
                                                                                    <!-- /.row -->
                                                                                </span>
                                                                            </div>
                                                                            <!-- /.panel-heading -->
                                                                            <div class="panel-body">
                                                                                <div id="carousel-correl-{$objop->id}" class="carousel slide" data-ride="carousel" data-interval="15000">
                                                                                    <!-- Wrapper for slides -->
                                                                                    <div class="carousel-inner" role="listbox">
                                                                                        {foreach $objops_indicadores_correlacion[$objop->id] as $ind_correl}
                                                                                            <div class="item {if $ind_correl@first}active{/if}">
                                                                                                <div class="{$linea->id}{$objest->id}{$objop->id} highchart" 
                                                                                                     id="panel_{$objop->id}_{$ind_correl->id}" 
                                                                                                     data-id_indicador="{$ind_correl->id}" 
                                                                                                     data-nombre_indicador="{$ind_correl->nombre}"
                                                                                                     data-valor_min="{$ind_correl->valor_min}" 
                                                                                                     data-valor_max="{$ind_correl->valor_max}" 
                                                                                                     data-fecha_inicio="{$plan->anyo_inicio - 1}-01-01" 
                                                                                                     data-fecha_fin="{($plan->anyo_inicio + $plan->duracion-1)}-12-31"
                                                                                                     {if $ind_correl->periodicidad=='Bienal'}
                                                                                                         data-periodicidad= "bienal" 
                                                                                                     {else}
                                                                                                         data-periodicidad= "anual"
                                                                                                     {/if}>
                                                                                                </div>
                                                                                                <div class="carousel-caption">
                                                                                                    <h3>
                                                                                                        <a href='index.php?page=indicador_mostrar&id_indicador={$ind_correl->id}&id_entidad={$ind_correl->id_entidad}' 
                                                                                                           title="{$ind_correl->nombre}: {$ind_correl->descripcion|replace:"\r\n":" "}"><i class="fa fa-dashboard fa-fw"></i></a>
                                                                                                    </h3>
                                                                                                    <p style="color: #337AB7;">{$smarty.const.TXT_GRAFICO_AUMENTAR}</p>
                                                                                                </div>
                                                                                            </div>
                                                                                        {/foreach}
                                                                                    </div>
                                                                                    <!-- Controls -->
                                                                                    <a class="left carousel-control" title="{$smarty.const.TXT_ANT}" href="#carousel-correl-{$objop->id}" role="button" data-slide="prev">
                                                                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color: #337AB7;"></span>
                                                                                        <span class="sr-only">{$smarty.const.TXT_ANT}</span>
                                                                                    </a>
                                                                                    <a class="right carousel-control" title="{$smarty.const.TXT_SIG}" href="#carousel-correl-{$objop->id}" role="button" data-slide="next">
                                                                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color: #337AB7;"></span>
                                                                                        <span class="sr-only">{$smarty.const.TXT_SIG}</span>
                                                                                    </a>
                                                                                </div>
                                                                                <!-- /.carousel -->
                                                                            </div>
                                                                            <!-- /.panel-body -->
                                                                        </div>
                                                                        <!-- /.panel -->
                                                                    {else}
                                                                        <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                                            <i class="fa fa-info-circle fa-fw"></i> 
                                                                            {$smarty.const.MSG_OBJOP_NO_INDICS_CORREL}
                                                                        </div>
                                                                    {/if}
                                                                    <!-- /Indicadores de correlación -->

                                                                    <!-- Indicadores de control -->
                                                                    {if $objops_indicadores_control[$objop->id]}
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading">
                                                                                <span class="panel-title">
                                                                                    <div class="row">
                                                                                        <div class="col-md-10">
                                                                                            <i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-sliders fa-fw"></sub> {$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})
                                                                                        </div>
                                                                                        <!-- /.col-md-10 -->
                                                                                        <div class="col-md-2">
                                                                                            <span title="{$objop->nombre}: {$objops_indicadores_control[$objop->id]|@count} {$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})" class="badge">{$objops_indicadores_control[$objop->id]|@count} {$smarty.const.FIELD_INDICS}</span>
                                                                                        </div>
                                                                                        <!-- /.col-md-2 -->
                                                                                    </div>
                                                                                    <!-- /.row -->
                                                                                </span>
                                                                            </div>
                                                                            <!-- /.panel-heading -->
                                                                            <div class="panel-body">
                                                                                <div id="carousel-control-{$objop->id}" class="carousel slide" data-ride="carousel" data-interval="15000">
                                                                                    <!-- Wrapper for slides -->
                                                                                    <div class="carousel-inner" role="listbox">
                                                                                        {foreach $objops_indicadores_control[$objop->id] as $ind_ctl}
                                                                                            <div class="item {if $ind_ctl@first}active{/if}">
                                                                                                <div class="{$linea->id}{$objest->id}{$objop->id} highchart" 
                                                                                                     id="panel_{$objop->id}_{$ind_ctl->id}" 
                                                                                                     data-id_indicador="{$ind_ctl->id}" 
                                                                                                     data-nombre_indicador="{$ind_ctl->nombre}"
                                                                                                     data-valor_min="{$ind_ctl->valor_min}" 
                                                                                                     data-valor_max="{$ind_ctl->valor_max}" 
                                                                                                     data-fecha_inicio="{$plan->anyo_inicio - 1}-01-01" 
                                                                                                     data-fecha_fin="{($plan->anyo_inicio + $plan->duracion-1)}-12-31"
                                                                                                     {if $ind_ctl->periodicidad=='Bienal'}
                                                                                                         data-periodicidad= "bienal" 
                                                                                                     {else}
                                                                                                         data-periodicidad= "anual"
                                                                                                     {/if}>
                                                                                                </div>
                                                                                                <div class="carousel-caption">
                                                                                                    <h3>
                                                                                                        <a href='index.php?page=indicador_mostrar&id_indicador={$ind_ctl->id}&id_entidad={$ind_ctl->id_entidad}' 
                                                                                                           title="{$ind_ctl->nombre}: {$ind_ctl->descripcion|replace:"\r\n":" "}"><i class="fa fa-dashboard fa-fw"></i></a>
                                                                                                    </h3>
                                                                                                    <p style="color: #337AB7;">{$smarty.const.TXT_GRAFICO_AUMENTAR}</p>
                                                                                                </div>
                                                                                            </div>
                                                                                        {/foreach}
                                                                                    </div>
                                                                                    <!-- Controls -->
                                                                                    <a class="left carousel-control" title="{$smarty.const.TXT_ANT}" href="#carousel-control-{$objop->id}" role="button" data-slide="prev">
                                                                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color: #337AB7;"></span>
                                                                                        <span class="sr-only">{$smarty.const.TXT_ANT}</span>
                                                                                    </a>
                                                                                    <a class="right carousel-control" title="{$smarty.const.TXT_SIG}" href="#carousel-control-{$objop->id}" role="button" data-slide="next">
                                                                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color: #337AB7;"></span>
                                                                                        <span class="sr-only">{$smarty.const.TXT_SIG}</span>
                                                                                    </a>
                                                                                </div>
                                                                                <!-- /.carousel -->
                                                                            </div>
                                                                            <!-- /.panel-body -->
                                                                        </div>
                                                                        <!-- /.panel -->
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

    {literal}
        <script defer>
            $('.objop').on('show.bs.collapse', function () {
                var num_indic = $(this).data('num_indic');
                if (num_indic) {
                    $('#dialogo_cargando_paneles').modal('show');
                    var id = $(this).attr('id');
                    // Para cada contenedor de clase highchart vamos a pintar el gráfico
                    $('.' + id + '.highchart').each(function (index) {
                        var id_panel = $(this).attr('id');
                        var idIndicador = $(this).data("id_indicador");
                        var nomIndicador = $(this).data("nombre_indicador");
                        var periodicidad = $(this).data("periodicidad");
                        var valor_min = null;
                        var valor_max = null;
                        var tickInterval = null;
                        if ($.isNumeric($(this).data("valor_min"))) {
                            valor_min = $(this).data("valor_min");
                        }
                        if ($.isNumeric($(this).data("valor_max"))) {
                            valor_max = $(this).data("valor_max");
                        }
                        //Intervalo para las encuestas
                        if (valor_min === 1 && valor_max === 9) {
                            tickInterval = 1;
                        }
                        var fecha_inicio = $(this).data("fecha_inicio");
                        var fecha_fin = $(this).data("fecha_fin");
                        var fecha_inicio_es = (new Date(fecha_inicio)).toLocaleDateString();
                        var fecha_fin_es = (new Date(fecha_fin)).toLocaleDateString();
                        // Contenedor para los datos del gráfico
                        var chartSerie = new HighchartSerie();
                        if (periodicidad === "anual") {
                            chartSerie.categoryType = "año";
                        }
                        else if (periodicidad === "bienal") {
                            chartSerie.categoryType = "bienal";
                        }
                        else {
                            chartSerie.categoryType = "medicion";
                        }
                        var urlApi = "api_publica.php?metodo=get_valores_con_timestamp&id=" + idIndicador + "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin + "&periodicidad=" + periodicidad;
                        $.ajax({
                            url: urlApi,
                            type: "GET",
                            dataType: "json",
                            success: onDataReceived
                        });
                        function onDataReceived(datos) {
                            if (datos) {
                                datos.forEach(function (dato) {
                                    // Agrega los que no tienen etiqueta_mini (total y referencias)
                                    // descarta las mediciones de unidades (no sirven aquí)
                                    if (!dato.etiqueta_mini && (dato.valor !== null)) {
                                        chartSerie.add(dato);
                                    }
                                });
                                // Pide las series de datos a chartSerie
                                // A saber: Totales y Valores de referencia
                                var dataseries = chartSerie.getLinealSerie();
                                // Si no es anual ocultamos valores de referencia
                                if (chartSerie.categoryType !== "año" && chartSerie.categoryType !== "bienal") {
                                    dataseries.forEach(function (dataserie, index) {
                                        if (index !== 0) {
                                            dataserie.visible = false;
                                        }
                                    });
                                }
                            }
                            //Gráfico de línea
                            pintaGrafico({
                                chart: {
                                    renderTo: id_panel,
                                    events: {}
                                },
                                credits: {
                                    enabled: false
                                },
                                title: {
                                    text: nomIndicador,
                                    style: {"fontSize": "14px"}
                                },
                                subtitle: {
                                    text: 'Período: ' + fecha_inicio_es + ' al ' + fecha_fin_es
                                },
                                exporting: {
                                    filename: nomIndicador
                                },
                                xAxis: {
                                    type: 'category'
                                },
                                yAxis: {
                                    title: {
                                        text: 'Valores'
                                    },
                                    labels: {
                                        format: '{value:,.2f}'
                                    },
                                    min: valor_min,
                                    max: valor_max,
                                    tickInterval: tickInterval
                                },
                                plotOptions: {
                                    series: {
                                        dataLabels: {
                                            enabled: true,
                                            format: '{y:,.2f}'
                                        }
                                    }
                                },
                                tooltip: {
                                    pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: <b>{point.y:,.2f}</b><br/>'
                                },
                                series: dataseries
                            });

                            //Carga de los paneles completada
                            if (num_indic === index + 1) {
                                $('#dialogo_cargando_paneles').modal('hide');
                            }
                        }
                    });
                }
            });

            //Función que pinta nuestra gráfica
            function pintaGrafico(chartOptions) {
                $(document).ready(function () {
                    // Añadimos evento al hacer click en el gráfico
                    chartOptions.chart.events.click = function () {
                        hs.htmlExpand(document.getElementById(chartOptions.chart.renderTo), {
                            width: 9999,
                            height: 9999,
                            allowWidthReduction: true
                        }, {
                            chartOptions: chartOptions
                        });
                    };
                    var chart = new Highcharts.Chart(chartOptions);
                });
            }

            //Crea un nuevo gráfico con un popup de Highslide
            var i = 0; //Contador de popus
            hs.zIndexCounter = 2000; //z-index del popup
            hs.Expander.prototype.onAfterExpand = function () {
                if (this.custom.chartOptions) {
                    var chartOptions = this.custom.chartOptions;
                    chartOptions.chart.height = 600;
                    chartOptions.chart.renderTo = $('.highslide-body')[i];
                    chartOptions.chart.events.click = function () {
                    };
                    var hsChart = new Highcharts.Chart(chartOptions);
                    i++;
                }
            };

            //Ajuste de las gráficas al tamaño del carrousel
            $('.carousel').on('slide.bs.carousel', function () {
                setTimeout(function () {
                    $(window).trigger('resize');
                }, 1);
            });
        </script>
    {/literal}

{/if}

{if $modulo==='editar_resultado'}
    <a title="{$smarty.const.TXT_GRABAR}" class="btn btn-default btn-xs btn-circle grabar" data-id_plan='{$plan->id}' data-anyo='{$anyo}'>
        <i class="fa fa-floppy-o fa-fw"></i>
    </a>
    <a title="{$smarty.const.TXT_CANCEL}" class="btn btn-default btn-xs btn-circle cancelar" data-id_plan='{$plan->id}' data-anyo='{$anyo}'>
        <i class="fa fa-times fa-fw"></i>
    </a>
{/if}

{if $modulo==='cancelar_edicion'}
    <a title="{$smarty.const.TXT_EDIT}" class="btn btn-default btn-xs btn-circle editar" data-id_plan='{$plan->id}' data-anyo='{$anyo}'>
        <i class="fa fa-pencil fa-fw"></i>
    </a>
{/if}

{if $modulo==='cancelar_resultado'}
    <textarea class="form-control" placeholder="{$smarty.const.TXT_RESUL}" rows="4" readonly>{$resultado_anual}</textarea>
{/if}