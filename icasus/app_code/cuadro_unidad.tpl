{literal}
<script>
	var id_entidad ={/literal}{$smarty.get.id_entidad}{literal};
  $(document).ready(function(){
		$(".bar").click(function(){
		var id_proceso = $(this).attr('id');
		var tipo = $(this).attr('tipo');
		//alert(id_proceso+'--'+tipo);
		$.ajax({
			url: "index.php?page=cuadro_unidad_ajax&ajax=true&id_entidad="+id_entidad+"&id_proceso="+id_proceso+"&modulo="+tipo,
			success: function(datos)
			{
		    $('#contenedor_'+tipo+'_'+id_proceso).html(datos);
		  }
		 })
		});
	});
</script>
{/literal} 
<h3>Indicadores propios de la Unidad</h3>
	<div class="clearfix full_size accordion_box">
		<div class="box grid_16">
			{if $procesos_propios}
				<ul class="block content_accordion ">
				{foreach from=$procesos_propios item=item}
					<li>
					<a href="#" class="handle"></a>
					<h3 class="bar"  tipo="propio" id="{$item->id}"><a href="javascript:void(0)">Proceso: {$item->nombre}</a></h3>
					<div class="content" id="contenedor_propio_{$item->id}">	</div>
					</li>
				{/foreach}
				</ul>
			{else}
				Esta Unidad no tiene definido procesos.
			{/if}
		</div>
	</div>

<h3>Indicadores segregados en los que mide la Unidad</h3>
	<div class="clearfix full_size accordion_box">
		<div class="box grid_16">
			{if $procesos_indicadores_segregados}
				<ul class="block content_accordion ">
					{foreach from=$procesos_indicadores_segregados item=item}
					  <li>
					    <a href="#" class="handle"></a>
					    <h3 class="bar" tipo="segregado" id="{$item.id_proceso}"><a href="javascript:void(0)">Proceso: {$item.nombre_proceso} ({$item.nombre_entidad})</a></h3>
					    <div class="content" id="contenedor_segregado_{$item.id_proceso}"> </div>
						</li>
					{/foreach}
				</ul>
			{else}
				Esta Unidad no mide indicadores segregados
			{/if}
		</div>
	</div>

<h3>Indicadores de la unidad superior ({$entidad_superior->nombre})</h3>
  <div class="clearfix full_size accordion_box">
    <div class="box grid_16">
				{if $procesos_indicadores_superior}
        <ul class="block content_accordion ">
          {foreach from=$procesos_indicadores_superior item=item}
            <li>
              <a href="#" class="handle"></a>
              <h3 class="bar"  tipo="superior" id="{$item->id}"><a href="javascript:void(0)">Proceso: {$item->nombre}</a></h3>
              <div class="content" id="contenedor_superior_{$item->id}"> </div>
            </li>
          {/foreach}
        </ul>
      {else}
        La unidad madre no tiene procesos.
      {/if}
    </div>
  </div>
