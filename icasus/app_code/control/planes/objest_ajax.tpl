{if $modulo==='editar_resultado'}
    <a title="{$smarty.const.TXT_GRABAR}" class="btn btn-default btn-xs btn-circle grabar" data-id_objest='{$objest->id}' data-anyo='{$anyo}'>
        <i class="fa fa-floppy-o fa-fw"></i>
    </a>
    <a title="{$smarty.const.TXT_CANCEL}" class="btn btn-default btn-xs btn-circle cancelar" data-id_objest='{$objest->id}' data-anyo='{$anyo}'>
        <i class="fa fa-times fa-fw"></i>
    </a>
{/if}

{if $modulo==='cancelar_edicion'}
    <a title="{$smarty.const.TXT_EDIT}" class="btn btn-default btn-xs btn-circle editar" data-id_objest='{$objest->id}' data-anyo='{$anyo}'>
        <i class="fa fa-pencil fa-fw"></i>
    </a>
{/if}

{if $modulo==='cancelar_resultado'}
    <textarea class="form-control" placeholder="{$smarty.const.TXT_RESUL}" readonly>{$resultado_anual}</textarea>
{/if}