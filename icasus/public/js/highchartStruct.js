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

// Un Set define una colección de elementos únicos que no tienen porqué
// estar ordenados

function Set(){
	this.data= [];

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
* SerieObject:
  {
	name:
	visible:
	selected:
	data
  }
*/

function highchartSerie(){
	this.serie = [];
	this.categories = new Set();

	this.add = function(elem){
		this.categories.add(elem.etiqueta_mini);
		var data = {
			id:elem.etiqueta_mini,
			name:elem.etiqueta_mini,
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
};
