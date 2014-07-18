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

	this.add = function (element) {
		if(this.data.indexOf(element) < 0){
			this.data.push(element);
			return true;
		}else{
			return false;
		}
	};

	this.remove = function (element) {
		var pos = this.data.indexOf(element);
		if (pos > -1) {
			this.data.splice(pos,1);
			return true;
		}else{
			return false;
		}
	};

	this.position = function (element) {
		return this.data.indexOf(element);
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
		var etiquetaOmedicion = elem.etiqueta_mini?elem.etiqueta_mini:elem.medicion;
		var etiquetaOunidad = elem.etiqueta_mini?elem.etiqueta_mini:elem.unidad;
		var data = {
			id:etiquetaOmedicion,
			name:etiquetaOmedicion,
			y:parseFloat(elem.valor)//?parseFloat(elem.valor):null //para no mostrar los 0, descomentar
		};
		this.categories.add(etiquetaOmedicion);
		if(this.serie[etiquetaOunidad]){
			this.serie[etiquetaOunidad].push(data);
		}else{
			this.serie[etiquetaOunidad] = [data];
		}
	};

	this.getBarSerie = function(){
		var serieHighchart = [];
		this.categories.data.sort();
		for(medicion in this.serie){
			var arrayMedicion = this.serie[medicion];
			for(m in arrayMedicion){
				arrayMedicion[m].x = this.categories.position(arrayMedicion[m].id);
			}
			serieHighchart.push({
				name: medicion,
				data: arrayMedicion,
				visible: false
			});
		}
		return serieHighchart;
	};
	
	this.getLinealSerie = function(){
		var ser = [];
		this.categories.data.sort();
		for(unidad in this.serie){
			var arrayUnidad = this.serie[unidad];
			for(u in arrayUnidad){
				arrayUnidad[u].x = this.categories.position(arrayUnidad[u].id);
			}
			ser.push({
				name: unidad,
				data: arrayUnidad,
			});
		}
		return ser;
	};
};
