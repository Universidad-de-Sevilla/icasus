<p><a href="index.php?page=cuadro_crear" title="Crear nuevo cuadro de mando">
  <img	src="/icons/ff16/table_add.png" alt="icono" /> Crear nuevo cuadro de mando</a>
</p>

{if $cuadros_propios|count > 0}

   <div class="box grid_16 single_datatable">
    <h2 class="box_head grad_grey_dark">Tus cuadros de mando</h2>
      <div id="dt1" class="no_margin">
        <table class="display datatable"> 
        <thead>
          <tr><th>Nombre</th><th>Visibilidad</th><th>Comentario</th><!--<th>Acciones</th>--></tr>
        </thead>
        <tbody>
          {foreach from=$cuadros_propios item=cuadro}
            <tr>
              <td><a href="index.php?page=cuadro_mostrar&id={$cuadro->id}">{$cuadro->nombre}</a></td> 
              <td>{if $cuadro->privado == 0}Público{else}Privado{/if}</td>
              <td width="70%">{$cuadro->comentarios}</td>
            </tr>
          {/foreach}
        </tbody>	
        </table>
      </div><!-- #dt1 .no_margin -->
   </div><!-- .box grid16 single_datatable -->

{else}
  <h3>No has definido ningún cuadro de mando propio todavía. <a href="index.php?page=cuadro_crear" title="Crear nuevo cuadro de mando">¿A que esperas?</a></h3>
{/if}

{if $cuadros_publicos|count > 0}

   <div class="box grid_16 single_datatable">
    <h2 class="box_head grad_grey_dark">Cuadros de mando públicos</h2>
      <div id="dt1" class="no_margin">
        <table class="display datatable"> 
        <thead>
          <tr><th>Nombre</th><th>Visibilidad</th><th>Comentario</th><!--<th>Acciones</th>--></tr>
        </thead>
        <tbody>
          {foreach from=$cuadros_publicos item=cuadro}
            <tr>
              <td><a href="index.php?page=cuadro_mostrar&id={$cuadro->id}">{$cuadro->nombre}</a></td> 
              <td>{if $cuadro->privado == 0}Público{else}Privado{/if}</td>
              <td width="70%">{$cuadro->comentarios}</td>
            </tr>
          {/foreach}
        </tbody>	
        </table>
      </div><!-- #dt1 .no_margin -->
   </div><!-- .box grid16 single_datatable -->

{else}
  <h3>No existe ningún cuadro de mando público todavía. <a href="index.php?page=cuadro_crear" title="Crear nuevo cuadro de mando">¿A que esperas?</a></h3>
{/if}
