{if $modulo==='editar_ejecucion'}
    <input type="number" step="0.01" min="0" max="100">
    <a id="grabar_ejecucion" title="{$smarty.const.TXT_GRABAR}" class="btn btn-default btn-xs btn-circle" data-id_objop='{$objop->id}' data-anyo='{$anyo}'><i class="fa fa-floppy-o fa-fw"></i></a>
    <a id="cancelar_ejecucion" title="{$smarty.const.TXT_CANCEL}" class="btn btn-default btn-xs btn-circle" data-id_objop='{$objop->id}' data-anyo='{$anyo}'><i class="fa fa-times fa-fw"></i></a>
{/if}