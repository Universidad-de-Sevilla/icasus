{if $modulo==='editar_ejecucion'}
    <input id="valor_{$anyo}" type="text" class="valor" placeholder="{$smarty.const.FIELD_VAL} %">
    <a title="{$smarty.const.TXT_GRABAR}" class="btn btn-default btn-xs btn-circle grabar" data-id_objop='{$objop->id}' data-anyo='{$anyo}'>
        <i class="fa fa-floppy-o fa-fw"></i>
    </a>
    <a title="{$smarty.const.TXT_CANCEL}" class="btn btn-default btn-xs btn-circle cancelar" data-id_objop='{$objop->id}' data-anyo='{$anyo}'>
        <i class="fa fa-times fa-fw"></i>
    </a>
{/if}

{if $modulo==='editar_resultado'}
    <textarea class="form-control" placeholder="{$smarty.const.TXT_RESUL}" rows="4">{$resultado_anual}</textarea>
{/if}

{if $modulo==='actualizar_porcentaje'}
    <div class="progress">
        <div class="progress-bar {if $ejecucion_anual|round:"2" < 25}progress-bar-danger{else if $ejecucion_anual|round:"2" >= 25 && $ejecucion_anual|round:"2" < 75}progress-bar-warning{else if $ejecucion_anual|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$ejecucion_anual|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$ejecucion_anual|round:"2"}%">
            {$ejecucion_anual|round:"2"} %
        </div>
    </div>
{/if}

{if $modulo==='actualizar_global'}
    <div class="progress">
        <div class="progress-bar {if $objop->ejecucion|round:"2" < 25}progress-bar-danger{else if $objop->ejecucion|round:"2" >= 25 && $objop->ejecucion|round:"2" < 75}progress-bar-warning{else if $objop->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objop->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$objop->ejecucion|round:"2"}%">
            {$objop->ejecucion|round:"2"} %
        </div>
    </div>
{/if}

{if $modulo==='actualizar_duracion'}
    {if $objop_anyos}
        {foreach $objop_anyos as $anyo}
            {if $anyo@first}
                {$anyo}{$escrito=true}
            {else if $anyo_anterior+1 == $anyo and !$anyo@last}
                {$escrito=false}
            {else if $anyo_anterior+1 != $anyo and !$escrito}
                - {$anyo_anterior}, {$anyo}
                {$escrito=true}
            {else if $anyo_anterior+1 != $anyo}
                , {$anyo}
                {$escrito=true}
            {else if $anyo@last && $objop_anyos|@count>1}
                - {$anyo}
            {/if}
            {$anyo_anterior=$anyo}
        {/foreach}
    {else}
        ---
    {/if}
{/if}

{if $modulo==='cancelar_ejecucion'}
    <a title="{$smarty.const.TXT_EDIT}" class="btn btn-default btn-xs btn-circle editar" data-id_objop='{$objop->id}' data-anyo='{$anyo}'>
        <i class="fa fa-pencil fa-fw"></i>
    </a>
{/if}

{if $modulo==='cancelar_resultado'}
    <textarea class="form-control" placeholder="{$smarty.const.TXT_RESUL}" rows="4" readonly>{$resultado_anual}</textarea>
{/if}