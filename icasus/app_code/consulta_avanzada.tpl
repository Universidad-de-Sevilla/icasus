<style>

div.receptor {
  border: 1px dashed silver;
  margin: 5px 20px;
  padding: 3px 5px;
  font-size: 10pt;
}

div.operador {
  margin: 5px 20px;
  padding: 3px 5px;
}

.pull-right {
  float: right;
}

</style>

<div class="box grid_16 single_datatable">
  <h2 class="box_head grad_grey_dark">Parámetros de la consulta</h2>
  <a href="#" class="grabber"></a>
  <a href="#" class="toggle"></a>

  <div class ="columns clearfix">
  <!-- El buscador de datos e indicadores -->
  <div class="col_50 no_border">
  <div class="block no_border">
  <div class="section">
   	<div id="dt1">
      <table class="display datatable"> 
      <thead> 
       <tr>  
        <th>Código</th>
        <th>Nombre</th>
       </tr> 
      </thead> 
        <tbody>
            <tr class="gradeX">
              <td>R 1.2</td>
              <td>Libros adquiridos</td>
            </tr>
            <tr class="gradeX">
              <td>R 1.3</td>
              <td>Revistas adquiridas</td>
            </tr>
        </tbody>
      </table>
    </div>
  </div>
  </div>
  </div>

  <!-- El receptor de datos e indicadores que los mezcla con las operaciones -->
  <div class="col_50">
  <div class="block"
  <div class="section">
    <div class="receptor">
      <span>Libros adquiridos para que la gente los lea con cariño</span> 
      <span>
        <select><option>Arquitectura</option></select>
        <select><option>2008</option><option>2009</option></select>
      </span>
    </div>
    <div class="operador">
      <select><option>Seleccione una operación ...</option><option> = Cotejar</option><option> + Sumar </option><option> / Dividir </option><option> % Porcentaje </option></select>
    </div>

    <div class="receptor">
      <span>Personal investigador total</span> 
      <span>
        <select><option>Arquitectura</option></select>
        <select><option>2008</option><option>2009</option></select>
      </span>
    </div>
    <div class="operador">
      <select><option>Seleccione una operación ...</option><option> = Cotejar</option><option> + Sumar </option><option> / Dividir </option><option> % Porcentaje </option></select>
    </div>
    
    <div class="receptor">
      &nbsp;
    </div>
    <div class="operador">
      <select><option>Seleccione una operación ...</option><option> = Cotejar</option><option> + Sumar </option><option> / Dividir </option><option> % Porcentaje </option></select>
    </div>
    <button class="pull-right">Mostrar resultado</button>
  </div> 
  </div>
  </div>
  </div>

</div>


  <!-- La tabla con los resultados obtenidos y los datos de partida -->
  <div class = "box grid_8 no_titlebar">

    <div class="block">
      <div class="section">
      <h2>Resultado de la consulta</h2>
      <table class="static">
        <thead>
          <tr> <th>Periodo</th> <th>Valor</th> </tr>
        </thead>
        <tbody>
          <tr> <td>2008</td> <td>130.53</td> </tr>
          <tr> <td>2009</td> <td>133.59</td> </tr>
          <tr> <td>2010</td> <td>103.35</td> </tr>
        </tbody>
      </table>
      </div>
    </div>
          
    <div class="block">
      <div class="section">
      <h2>Libros adquiridos</h2>
      <table class="static">
        <thead>
          <tr> <th>Periodo</th> <th>Valor</th> </tr>
        </thead>
        <tbody>
          <tr> <td>2008</td> <td>10335</td> </tr>
          <tr> <td>2009</td> <td>13395</td> </tr>
          <tr> <td>2010</td> <td>13053</td> </tr>
        </tbody>
      </table>
      </div>
    </div>
          
    <div class="block">
      <div class="section">
      <h2>Personal investigador</h2>
      <table class="static">
        <thead>
          <tr> <th>Periodo</th> <th>Valor</th> </tr>
        </thead>
        <tbody>
          <tr> <td>2008</td> <td>10335</td> </tr>
          <tr> <td>2009</td> <td>13395</td> </tr>
          <tr> <td>2010</td> <td>13053</td> </tr>
        </tbody>
      </table>
      </div>
    </div>
          
  </div>

  <!-- La gráfica con los resultados obtenidos -->
  <div class = "box grid_8 no_titlebar">
    <div class="block">
      <div class="section">
        <div id="placeholder" style="width:600px;height:300px">
          <img src="" alt="Imagen provisional para boceto" />
        </div>
      </div>
    </div>
  </div>
  
</div>
