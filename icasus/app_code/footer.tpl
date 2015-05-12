<footer style="position: absolute;left:25%">
        <h1 style="color: #999999; font-weight: normal;">{$smarty.const.TXT_FOOTER}</h1>
        <h1 style="color: #999999; font-weight: normal;">{$smarty.const.FIELD_VERSION}: {$smarty.const.IC_VERSION} - {$smarty.const.FIELD_FECHA_REV}: {$smarty.const.IC_FECHA_REVISION}</h1>
</footer>

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