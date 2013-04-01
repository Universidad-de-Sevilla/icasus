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

  <h3>No ha definido ningún cuadro de mando todavía</h3>
    <div class="box grid_4">
      <div class="block" style="height:200px;">
        <h2>Titulo h2</h2>
        <div class="section">
        <p>Hola soy un grid 6</p>
        </div>
      </div>
    </div>
    <div class="box grid_4">
      <div class="block" style="height:200px;">
        <h2>Titulo h2</h2>
        <div class="section">
          <p>Hola soy un grid 10</p>
        </div>
      </div>
    </div>
    <div class="box grid_4">
      <div class="block" style="height:200px;">
        <h2>Titulo h2</h2>
        <div class="section">
        <p>Hola soy un grid 6</p>
        </div>
      </div>
    </div>
    <div class="box grid_4">
      <div class="block" style="height:200px;">
        <h2>Titulo h2</h2>
        <div class="section">
          <p>Hola soy un grid 10</p>
        </div>
      </div>
    </div>
    <div class="box grid_1">
      <div class="block" style="height:200px;">
        <h2>Titulo h2</h2>
        <div class="section">
        <p>Hola soy un grid 6</p>
        </div>
      </div>
    </div>
    <div class="box grid_2">
      <div class="block" style="height:200px;">
        <h2>Titulo h2</h2>
        <div class="section">
          <p>Hola soy un grid 10</p>
        </div>
      </div>
    </div>
    <div class="box grid_3">
      <div class="block" style="height:200px;">
        <h2>Titulo h2</h2>
        <div class="section">
        <p>Hola soy un grid 6</p>
        </div>
      </div>
    </div>
    <div class="box grid_4">
      <div class="block" style="height:200px;">
        <h2>Titulo h2</h2>
        <div class="section">
          <p>Hola soy un grid 10</p>
        </div>
      </div>
    </div>
    <div class="box grid_5">
      <div class="block" style="height:200px;">
        <h2>Titulo h2</h2>
        <div class="section">
          <p>Hola soy un grid 10</p>
        </div>
      </div>
    </div>
    <div class="box grid_6">
      <div class="block" style="height:200px;">
        <h2>Titulo h2</h2>
        <div class="section">
        <p>Hola soy un grid 6</p>
        </div>
      </div>
    </div>
    <div class="box grid_7">
      <div class="block" style="height:200px;">
        <h2>Titulo h2</h2>
        <div class="section">
          <p>Hola soy un grid 10</p>
        </div>
      </div>
    </div>

{/if}
