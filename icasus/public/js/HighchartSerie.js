//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/HighchartSerie.js
// Desarrolladores: Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Clase para acomodar los datos que devuelve la API de Icasus a los 
// requisitos de la librería Highcharts
//--------------------------------------------------------------------------

/**
 * HighchartSerie:
 * Clase para la organización de las series
 * 
 * Interface:
 * + void function constructor ()
 * + void function add (elemento de la Base de Datos)
 * + array function getBarSerie()
 * + array function getPieSerie()
 * + array function getLinealSerie()
 * 
 * Used objects:
 * 
 * Contiene la información de un elemento de una serie en Highcharts
 * + SerieObject:
 * {
 * name: string
 * visible: boolean
 * selected: boolean
 * data: array <DataObject>
 * }
 * 
 * Representa a un punto dentro de una serie en Highcharts
 * + DataObject:
 * {
 * id: string
 * name: string
 * y: integer
 * x: integer
 * }
 */

function HighchartSerie() {
    this.serie = [];
    this.categories = new Conjunto();
    this.categoryType = "unidad";

    this.add = function (elem) {
        var category;
        // Escoge la información que usaremos como eje de las x
        if (this.categoryType === "año") {
            category = new Date(parseInt(elem.periodo_fin)).getFullYear();
        }
        else if (this.categoryType === "medicion") {
            category = elem.medicion;
        }
        else if (this.categoryType === "unidad") {
            category = elem.etiqueta_mini;
        }
        else {
            category = elem.etiqueta_mini;
        }

        var medicionOunidad = elem.etiqueta_mini ? elem.medicion : elem.unidad;

        var data = {
            id: category,
            name: category,
            y: parseFloat(elem.valor)//?parseFloat(elem.valor):null //para no mostrar los 0, descomentar
        };
        this.categories.add(category);

        // Si ya existe una serie con el nombre medicionOunidad 
        // agregamos el dato a la serie
        // si no creamos la serie y agregamos el dato
        if (this.serie[medicionOunidad]) {
            this.serie[medicionOunidad].push(data);
        } else {
            this.serie[medicionOunidad] = [data];
        }
    };

    //Devuelve una serie Highchart para un gráfico de barras
    this.getBarSerie = function () {
        var serieHighchart = [];
        this.categories.data.sort();
        for (medicion in this.serie) {
            var arrayMedicion = this.serie[medicion];
            for (m in arrayMedicion) {
                arrayMedicion[m].x = this.categories.position(arrayMedicion[m].id);
            }
            serieHighchart.push({
                type: 'column',
                name: medicion,
                data: arrayMedicion,
                visible: false
            });
        }
        return serieHighchart;
    };

    //Devuelve una serie Highchart para un gráfico de tarta
    this.getPieSerie = function () {
        var serieHighchart = [];
        this.categories.data.sort();
        for (medicion in this.serie) {
            var arrayMedicion = this.serie[medicion];
            for (m in arrayMedicion) {
                arrayMedicion[m].x = this.categories.position(arrayMedicion[m].id);
            }
            serieHighchart.push({
                type: 'pie',
                name: medicion,
                data: arrayMedicion,
                showInLegend: true
            });
        }
        return serieHighchart;
    };

    //Devuelve una serie Highchart para un gráfico de líneas
    this.getLinealSerie = function (nomIndicador) {
        var serieHighchart = [];
        //Valor por defecto para el nombre del indicador/dato que sólo se muestra en los 
        //paneles de línea de los cuadros de mando
        nomIndicador = typeof nomIndicador !== 'undefined' ? (' - ' + nomIndicador) : '';
        this.categories.data.sort();
        for (unidad in this.serie) {
            var arrayUnidad = this.serie[unidad];
            for (u in arrayUnidad) {
                arrayUnidad[u].x = this.categories.position(arrayUnidad[u].id);
            }
            arrayUnidad.sort(function (a, b) {
                return a.x - b.x;
            });
            serieHighchart.push({
                type: 'line',
                name: unidad + nomIndicador,
                data: arrayUnidad
            });
        }
        return serieHighchart;
    };
}


