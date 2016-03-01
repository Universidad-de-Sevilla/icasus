{if $modulo === 'mostrar'}
    <div class="form-horizontal">
        <div id="analisis" class="form-group">
            <label for="analisis" class="col-sm-2 control-label">{$smarty.const.TXT_ANALISIS} ({$anyo})</label>
            <div class="col-sm-6">
                <textarea  class="form-control" id="texto_analisis" placeholder="{$smarty.const.TXT_ANALISIS}" rows="5" readonly>{$analisis_actual->analisis}</textarea>
            </div>
            {if $_control || $responsable}
                <div class="col-sm-2">
                    <a id="editar_analisis" title="{$smarty.const.TXT_EDIT}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}' ><i class="fa fa-pencil fa-fw"></i></a>
                </div>
            {/if}
        </div>
        <div id="plan" class="form-group">
            <label for="plan_accion" class="col-sm-2 control-label">{$smarty.const.TXT_PLAN_ACCION} ({$anyo})</label>
            <div class="col-sm-6">
                <textarea  class="form-control" id="texto_plan" placeholder="{$smarty.const.TXT_PLAN_ACCION}" rows="5" readonly>{$analisis_actual->plan_accion}</textarea>
            </div>
            {if $_control || $responsable}
                <div class="col-sm-2">
                    <a id="editar_plan" title="{$smarty.const.TXT_EDIT}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}' ><i class="fa fa-pencil fa-fw"></i></a>
                </div>
            {/if}
        </div>
    </div>
{/if}

{if $modulo === 'editar_analisis'}
    <label for="analisis" class="col-sm-2 control-label">{$smarty.const.TXT_ANALISIS} ({$anyo})</label>
    <div class="col-sm-6">
        <textarea  class="form-control" id="texto_analisis" placeholder="{$smarty.const.TXT_ANALISIS}" rows="5">{$analisis_actual->analisis}</textarea>
    </div>
    <div class="col-sm-2">
        <a id="grabar_analisis" title="{$smarty.const.TXT_GRABAR}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}'><i class="fa fa-floppy-o fa-fw"></i></a>
        <a id="cancelar_analisis" title="{$smarty.const.TXT_CANCEL}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}'><i class="fa fa-times fa-fw"></i></a>
    </div>
{/if}

{if $modulo === 'cancelar_analisis'}
    <label for="analisis" class="col-sm-2 control-label">{$smarty.const.TXT_ANALISIS} ({$anyo})</label>
    <div class="col-sm-6">
        <textarea  class="form-control" id="texto_analisis" placeholder="{$smarty.const.TXT_ANALISIS}" rows="5" readonly>{$analisis_actual->analisis}</textarea>
    </div>
    <div class="col-sm-2">
        <a id="editar_analisis" title="{$smarty.const.TXT_EDIT}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}' ><i class="fa fa-pencil fa-fw"></i></a>
    </div>
{/if}

{if $modulo === 'editar_plan'}
    <label for="plan_accion" class="col-sm-2 control-label">{$smarty.const.TXT_PLAN_ACCION} ({$anyo})</label>
    <div class="col-sm-6">
        <textarea  class="form-control" id="texto_plan" placeholder="{$smarty.const.TXT_PLAN_ACCION}" rows="5">{$analisis_actual->plan_accion}</textarea>
    </div>
    <div class="col-sm-2">
        <a id="grabar_plan" title="{$smarty.const.TXT_GRABAR}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}'><i class="fa fa-floppy-o fa-fw"></i></a>
        <a id="cancelar_plan" title="{$smarty.const.TXT_CANCEL}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}'><i class="fa fa-times fa-fw"></i></a>
    </div>
{/if}

{if $modulo === 'cancelar_plan'}
    <label for="plan_accion" class="col-sm-2 control-label">{$smarty.const.TXT_PLAN_ACCION} ({$anyo})</label>
    <div class="col-sm-6">
        <textarea  class="form-control" id="texto_plan" placeholder="{$smarty.const.TXT_PLAN_ACCION}" rows="5" readonly>{$analisis_actual->plan_accion}</textarea>
    </div>
    <div class="col-sm-2">
        <a id="editar_plan" title="{$smarty.const.TXT_EDIT}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}' ><i class="fa fa-pencil fa-fw"></i></a>
    </div>
{/if}