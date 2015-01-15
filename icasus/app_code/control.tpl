{if $modulo == 'inicio'}
    <div style="opacity: 1;" class="box grid_16 no_titlebar">
        <div class="toggle_container">
            <div style="opacity: 1;" class="block">
                <form>
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_FECHA}</label>
                        <div>
                            {html_select_date id="Year" prefix="" class="required" year_empty=$smarty.const.TXT_SEL
					display_months=FALSE display_days=FALSE start_year=($smarty.now|date_format:"%Y")-10
					end_year=$smarty.now|date_format:"%Y"}
                            <div class="required_tag"></div>
                        </div>
                    </fieldset> 
                </form>
            </div>
        </div>
    </div>
    <div class="box grid_16 single_datatable">
        <div id="dt1" class="no_margin">
                {include file="control_valores.tpl"}
        </div><!-- #dt1 .no_margin -->
    </div><!-- .box grid16 single_datatable -->	
    {literal}
        <script>
            var id_entidad = {/literal}{$id_entidad}{literal};
            $('#Year').on('change', function () {
                var fecha = $('#Year').val();
                if (fecha===''){fecha=new Date().getFullYear();}
                $.ajax({
                    url: "index.php?page=control&ajax=true&modulo=filtrOnlyear&id_entidad=" + id_entidad + "&fecha=" + fecha,
                    success: function (datos) {
                        $("#dt1").html(datos);
                    }
                });
            });
        </script>
    {/literal}
{/if}

{if $modulo == 'filtrOnlyear'}
    <script src="theme/danpin/scripts/DataTables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="theme/danpin/scripts/adminica/adminica_datatables.js" type="text/javascript"></script>
    {include file="control_valores.tpl"}
{/if}
<script src="js/control_valores.js" type="text/javascript"></script>