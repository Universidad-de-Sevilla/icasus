<p><a href="index.php?page=cuadro_crear" title="Crear nuevo cuadro de mando">
  <img	src="/icons/ff16/table_add.png" alt="icono" /> Crear nuevo cuadro de mando</a>
</p>

{if $cuadros|count > 0}

   <div class="box grid_16 single_datatable">
      <div id="dt1" class="no_margin">
        <table class="display datatable"> 
        <thead>
          <tr><th>Nombre</th><th>Indicadores</th><!--<th>Acciones</th>--></tr>
        </thead>
        <tbody>
          {foreach from=$cuadros item=cuadro}
            <tr>
              <td><a href="index.php?page=cuadro_mostrar&id={$cuadro->id}">{$cuadro->nombre}</a></td> 
              <td>{$cuadro->comentarios}</td>
            </tr>
          {/foreach}
        </tbody>	
        </table>
      </div><!-- #dt1 .no_margin -->
   </div><!-- .box grid16 single_datatable -->

{else}
  <h3>No has definido ningún cuadro de mando todavía. <a href="index.php?page=cuadro_crear" title="Crear nuevo cuadro de mando">¿A que esperas?</a></h3>
{/if}
