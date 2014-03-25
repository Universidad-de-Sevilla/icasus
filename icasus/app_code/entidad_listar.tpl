<h3>Unidades del usuario</h3>
	{if $entidades_usuario }
		<div class="box grid_16">
			<div class="block">	
			  <table class="static">
			      <thead><tr><th>C&oacute;digo</th><th>Unidad</th><th>Acciones</th></tr></thead>
			      <tbody>
			      {foreach from=$entidades_usuario item=entidad}
			         <tr>
			          <td>{$entidad->entidad->codigo}</td>
			          <td><a href='index.php?page=entidad_datos&id_entidad={$entidad->entidad->id}'>{$entidad->entidad->nombre}</a></td>
			          <td>
                  <a href='index.php?page=cuadro_unidad&id_entidad={$entidad->entidad->id}'> Cuadro resumen</a> - 
                  <a href='index.php?page=consulta_avanzada&id_entidad={$entidad->entidad->id}'> Consultas</a> -
                  <a href='index.php?page=proceso_listar&id_entidad={$entidad->entidad->id}'> Procesos</a> -
                  <a href='index.php?page=indicador_listar&id_entidad={$entidad->entidad->id}'>Indicadores</a> - 
                  <a href='index.php?page=dato_listar&id_entidad={$entidad->entidad->id}'>Datos</a>
                  <!--
                  <a href="index.php?page=plan_estrategico/plan_listar&id_entidad={$entidad->entidad->id}&entidad={$entidad->entidad->nombre|htmlentities}">Planificaci&oacute;n</a> -
                  <a href='index.php?page=grupo/acta_listar&id_entidad={$entidad->entidad->id}' title="Ver las actas de este equipo">Actas</a> 
                  -->
			        </td>
			        </tr>
			      {/foreach}
			  </tbody></table>
		  </div>
		</div>
	{else}
		  <div class="alert alert_blue">No tiene asignada ninguna unidad</div>
	{/if}
	
		<h3>Todas las unidades</h3>
  <!--
	<div class="box grid_16">
		<div class="block">	
			<form action='index.php?page=entidad_listar' method="post" class="mini" name="formlogin">
			<input name='id_entidad' type='hidden' value='{$entidad->id}'/>
			<label for='criterio'>B&uacute;squeda:</label> 
			<input name='criterio' type='text' class='inp' value='{if isset($criterio)}{$criterio}{/if}'/>
			</form>
		</div>
	</div>		
  -->
	{if isset($entidades)}
    <div class="box grid_16 single_datatable">
      <div id="dt1" class="no_margin">
        <table class="display datatable"> 
          <thead><tr><th>C&oacute;digo</th><th>Entidad</th><th>Acciones</th></tr></thead>
          <tbody>
          {foreach from=$entidades item=entidad}
             <tr class="gradeX">
              <td>{$entidad->codigo}</td>
              <td><a href='index.php?page=entidad_datos&id_entidad={$entidad->id}'>{$entidad->nombre}</a></td>
              <td>
                <a href='index.php?page=cuadro_unidad&id_entidad={$entidad->id}'> Cuadro resumen</a> - 
                <a href='index.php?page=consulta_avanzada&id_entidad={$entidad->id}'> Consultas</a> -
                <a href='index.php?page=proceso_listar&id_entidad={$entidad->id}'> Procesos</a> -
                <a href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>Indicadores</a> - 
                <a href='index.php?page=dato_listar&id_entidad={$entidad->id}'>Datos</a>
              </td>
             </tr>
          {/foreach}
          </tbody>
        </table>
			</div>
		</div>		  
	{/if}
