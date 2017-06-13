<div class="table-responsive">
    <table id="tabla_normativas" class="table datatable table-striped table-hover">
        <thead>
            <tr>
                <th>{$smarty.const.FIELD_NOMBRE}</th>
                <th>URL</th>
                {if $_control}<th>{$smarty.const.FIELD_ACCIONES}</th>{/if}
            </tr>
        </thead>
        <tbody>
            {foreach from=$normativas item=normativa} 
                <tr>
                    <td id="norm_nombre_{$normativa->id}">{$normativa->nombre}</td>
                    <td>
                        <a id="norm_url_{$normativa->id}" title="{$normativa->nombre}" href="{$normativa->enlace}" target="_blank">{$normativa->enlace}</a>
                    </td>
                    {if $_control}
                        <td>
                            <a class="editar_normativa btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href='javascript:void(0)' data-toggle="modal" data-target="#editar_normativa" data-id_normativa="{$normativa->id}">
                                <i class="fa fa-pencil fa-fw"></i>
                            </a>
                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_NORMATIVA_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_normativa"
                               data-id_entidad="{$carta->id_entidad}" data-nombre="{$normativa->nombre}" data-id_normativa="{$normativa->id}">
                                <i class="fa fa-trash fa-fw"></i>
                            </a>
                        </td>
                    {/if}
                </tr>     
            {/foreach}
        </tbody>
    </table>
</div>

{literal}
    <script>
        $(document).ready(function () {
            var datatable = $('#tabla_normativas').DataTable({
                "pagingType": "full_numbers",
                "iDisplayLength": 25,
                fixedHeader: true,
                dom: "<'row'<'col-sm-2'B><'col-sm-5'l><'col-sm-5'f>>" +
                        "<'row'<'col-sm-12'tr>>" +
                        "<'row'<'col-sm-5'i><'col-sm-7'p>>",
                buttons: [
                    {extend: 'colvis', text: "<i title='Ver columnas' class='fa fa-columns fa-fw'></i> <i class='fa fa-caret-down'></i>"},
                    {
                        extend: 'collection',
                        text: "<i title='Exportar' class='fa fa-share-square-o fa-fw'></i> <i class='fa fa-caret-down'></i>",
                        buttons: [
                            {extend: 'csv', text: "<i title='Exportar a CSV' class='fa fa-file-text-o fa-fw'></i> Exportar a CSV"},
                            {extend: 'excel', text: "<i title='Exportar a Excel' class='fa fa-file-excel-o fa-fw'></i> Exportar a Excel"},
                            {extend: 'print', text: "<i title='Imprimir/PDF' class='fa fa-print fa-fw'></i> Imprimir/PDF"}
                        ]
                    }
                ]
            });

            //Reajustamos las cabeceras de las datatables al cambiar de pestaña
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                datatable.fixedHeader.adjust();
            });

            //Reajustamos las cabeceras de las datatables al hacer scroll
            $('.table-responsive').on('scroll', function () {
                datatable.fixedHeader.adjust();
            });

            //Barras de botones
            var botones_normativas = $('#botones_normativas').html();
            $('#tabla_normativas_filter').append(botones_normativas);
        });
    </script>
{/literal}