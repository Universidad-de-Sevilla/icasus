{literal}
    <script>
        var id_entidad ={/literal}{$smarty.get.id_entidad}{literal};
        $(document).ready(function () {
            $(".bar").click(function () {
                var id_proceso = $(this).attr('id');
                var tipo = $(this).attr('tipo');
                //alert(id_proceso+'--'+tipo);
                $.ajax({
                    url: "index.php?page=cuadro_unidad_ajax&ajax=true&id_entidad=" + id_entidad + "&id_proceso=" + id_proceso + "&modulo=" + tipo,
                    success: function (datos)
                    {
                        $('#contenedor_' + tipo + '_' + id_proceso).html(datos);
                    }
                });
            });
        });
    </script>
{/literal} 

<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_INDIC_PROP}</h2> 
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class="block" style="margin-top: 10px">
        <div class="clearfix full_size accordion_box">
            <div class="box grid_16">
                {if $procesos_propios}
                    <ul class="block content_accordion ">
                        {foreach from=$procesos_propios item=item}
                            <li>  
                                <h3 class="bar"  tipo="propio" id="{$item->id}">
                                    <a href="javascript:void(0)">{$smarty.const.FIELD_PROC}: {$item->nombre}</a>
                                    <a href="javascript:void(0)" class="grabber"></a>
                                </h3>
                                <div class="content" id="contenedor_propio_{$item->id}"></div>
                            </li>
                        {/foreach}
                    </ul>
                {else}
                    <div class="alert alert_blue">
                        <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
                        {$smarty.const.MSG_UNID_NO_PROC}
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_UNID_INDIC_SEG}</h2> 
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class="block" style="margin-top: 10px">
        <div class="clearfix full_size accordion_box">
            <div class="box grid_16">
                {if $procesos_indicadores_segregados}
                    <ul class="block content_accordion ">
                        {foreach from=$procesos_indicadores_segregados item=item}
                            <li>
                                <h3 class="bar" tipo="segregado" id="{$item.id_proceso}">
                                    <a href="javascript:void(0)">{$smarty.const.FIELD_PROC}: {$item.nombre_proceso} ({$item.nombre_entidad})</a>
                                    <a href="javascript:void(0)" class="grabber"></a>
                                </h3>
                                <div class="content" id="contenedor_segregado_{$item.id_proceso}"></div>
                            </li>
                        {/foreach}
                    </ul>
                {else}
                    <div class="alert alert_blue">
                        <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
                        {$smarty.const.MSG_UNID_NO_SEG}
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_UNID_SUP_INDIC} ({$entidad_superior->nombre})</h2> 
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class="block" style="margin-top: 10px">     
        <div class="clearfix full_size accordion_box">
            <div class="box grid_16">
                {if $procesos_indicadores_superior}
                    <ul class="block content_accordion ">
                        {foreach from=$procesos_indicadores_superior item=item}
                            <li>
                                <h3 class="bar"  tipo="superior" id="{$item->id}">
                                    <a href="javascript:void(0)">{$smarty.const.FIELD_PROC}: {$item->nombre}</a>
                                    <a href="javascript:void(0)" class="grabber"></a>
                                </h3>
                                <div class="content" id="contenedor_superior_{$item->id}"></div>
                            </li>
                        {/foreach}
                    </ul>
                {else}
                    <div class="alert alert_blue">
                        <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
                        {$smarty.const.MSG_UNID_SUP_NO_PROC}
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>
