<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-map-o fa-fw"></i> {$_nombre_pagina}
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
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-12">
        {if $cartas}
            <div class="table-responsive">
                <table class="table datatable table-striped table-hover">
                    <thead>
                        <tr>
                            <th class="hidden"></th>
                            <th>{$smarty.const.FIELD_FECHA}</th>
                            <th>{$smarty.const.FIELD_UNID}</th>
                            <th>{$smarty.const.FIELD_ACCIONES}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$cartas item=carta}
                            <tr>
                                <td class="hidden"></td>
                                <td>
                                    <a title="{$carta->fecha|date_format:'%d/%m/%Y'}" href="index.php?page=carta_mostrar&id_carta={$carta->id}&id_entidad={$carta->id_entidad}">{$carta->fecha|date_format:'%d/%m/%Y'}</a>
                                </td>
                                <td><a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$carta->id_entidad}'>{$carta->entidad->etiqueta}</a></td>
                                <td>
                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=carta_mostrar&id_carta={$carta->id}&id_entidad={$carta->id_entidad}">
                                        <i class="fa fa-folder fa-fw"></i>
                                    </a>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_CARTAS_NO}
            </div>
        {/if}     
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->