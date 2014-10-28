
    <div class="section">
        <h1 style="color: #999999; font-weight: normal;">ICASUS - APLICACIÓN DE GESTIÓN DE CALIDAD DE LOS SERVICIOS DE LA UNIVERSIDAD DE SEVILLA</h1>
        <h1 style="color: #999999; font-weight: normal;">VERSI&Oacute;N: {$smarty.const.IC_VERSION} - FECHA DE REVISI&Oacute;N: {$smarty.const.IC_FECHA_REVISION}</h1>
    </div>

{literal}
    <script type="text/javascript" src="theme/danpin/scripts/DataTables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="theme/danpin/scripts/adminica/adminica_datatables.js"></script>
    <script type="text/javascript">
        $(".validate_form").validate();
        /*
         $('.dataTables_filter').find('input').css('color','maroon');
         $('.fg-toolbar').css({'text-shadow':'0','color':'maroon','background':'white','border':'0'});
         */
    </script>
{/literal}
<div id="loading_overlay">
    <div class="loading_message round_bottom">
        <img src="theme/danpin/images/loading.gif" alt="loading" />
    </div>
</div>