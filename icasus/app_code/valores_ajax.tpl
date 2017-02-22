{if $modulo == 'seleccionar_años'}
    <label for="fin">{$smarty.const.FIELD_FIN_PERIODO}</label>            
    <select class="form-control" name="fin" id="fin">
        {foreach from=$years item=year}
            {if $year->periodo_inicio|truncate:4:'' >= $year_inicio}
                <option value="{$year->periodo_fin|truncate:4:''}">
                    {$year->periodo_fin|truncate:4:''}
                </option>
            {/if}
        {/foreach}
    </select>

    {*Recargamos script chosen-select*}
    <script defer>
        $(function () {
            $('#fin').chosen({
                disable_search_threshold: 10,
                no_results_text: "Oops, no se encuentran registros coincidentes"
            });
        });
    </script>

{else if $modulo == 'mostrar_valores' OR $modulo == 'asignar_una_medicion' OR $modulo == 'activar_all' OR $modulo == 'activar_uno'}
    <!-- Valores de subunidades-mediciones -->
    <div class="row">
        <div class="col-lg-12" id="mostrar_valores">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <span class="panel-title"><i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_TABLA}</span>
                </div>
                <!-- /.panel-heading -->
                <div id="panel_valores" class="panel-body">
                    {include file="valores_mostrar.tpl"}
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <!-- /Valores de subunidades-mediciones -->

    {*Recargamos script, datatables y boostrap-toggle tras petición ajax*}
    <script defer>
        $(function () {
            //Tablas de valores
            $('#tabla_valores').DataTable({
                "bPaginate": false,
                "bSort": false,
                scrollY: "400px",
                scrollX: true,
                scrollCollapse: true,
                paging: false,
                fixedColumns: {
                    leftColumns: 2
                },
                dom: "<'row'<'col-sm-12'>>" +
                        "<'row'<'col-sm-12'tr>>" +
                        "<'row'<'col-sm-12'>>"
            });
            $(':checkbox').bootstrapToggle();
        });
    </script>
{/if}