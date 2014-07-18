//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/highchartStruct.js
// Desarrolladores: Fran A.R. Vivas (@pacobo)
//--------------------------------------------------------------------------
// Estructuras para acomodar los datos que devuelve la API de icasus a los 
// requisitos de la librería Highchart
//
// No obstante algunas funciones como Set pueden ser utiles en otros contextos
//--------------------------------------------------------------------------

/** Set copiado de "Estructuras de Datos en Javascript"
*
* Definición: Lista en la que no se pueden repetir elementos.
* No tiene porque estar ordenado.
*
* Funciones:
* + void function add (element)
* + boolean function remove (element)
* + integer function position (element)
* + element function get (integer)
* + array<element> function getAll ()
* + array<element> function set (element, element)
* + void function show()
*
*/

function Set(){
	this.data = [];

	this.add = function (elem) {
		if(this.data.indexOf(elem) < 0){
			this.data.push(elem);
			return true;
		}else{
			return false;
		}
	};

	this.remove = function (elem) {
		var pos = this.data.indexOf(elem);
		if (pos > -1) {
			this.data.splice(pos,1);
			return true;
		}else{
			return false;
		}
	};

	this.position = function (elem) {
		return this.data.indexOf(elem);
	};

	this.get = function (position) {
		return this.data[position];
	};

	this.getAll = function () {
		return this.data;
	}

	this.set = function (older, newer) {
		var pos = this.data.indexOf(older);
		if (pos > -1) {
			this.data.splice(pos, 1, newer);
			return true;
		}else{
			return false;
		}
	};

	this.show = function () {
		console.log(this.data);
	};
};

/** Estructura para la organización de las series
* 
* Interface:
* + void function constructor ()
* + void function add (elemento de la Base de Datos)
* + array function getBarSerie()
* + array function getLinealSerie()
* 
* Used objects:
* + SerieObject:
  {
	name: string
	visible: boolean
	selected: boolean
	data: array <DataObject>
  }
* + DataObject:
  {
    id: string
    name: string
    y: integer
    x: integer
  }
*/

function highchartSerie(){
	this.serie = [];
	this.categories = new Set();

	this.add = function(elem){
		this.categories.add(elem.etiqueta_mini);
		var data = {
			id:elem.etiqueta_mini?elem.etiqueta_mini:elem.unidad,
			name:elem.etiqueta_mini?elem.etiqueta_mini:elem.unidad,
			y:parseFloat(elem.valor)
		};
		if(this.serie[elem.medicion]){
			this.serie[elem.medicion].push(data);
		}else{
			this.serie[elem.medicion] = [data];
		}
	};

	this.getBarSerie = function(){
		var ser = [];
		this.categories.data.sort();
		for(medicion in this.serie){
			for(m in this.serie[medicion]){
				this.serie[medicion][m].x = this.categories.position(this.serie[medicion][m].id);
			}
			ser.push({
				name: medicion,
				data: this.serie[medicion],
				visible: false
			});
		}
		return ser;
	};
	
	this.getLinealSerie = function(){
		var ser = [];
		for(unidad in this.serie){
			
		}
	};
};
