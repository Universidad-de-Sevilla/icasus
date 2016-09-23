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
 * 
 * Clase para la organización de las series.
 * 
 * Funciones:
 * + void function HighchartSerie()
 * + void function add(elem,esunidad)
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
    //Seleccionamos un color en función del nombre de la serie
    var color = function (unidad, nomIndicador, index) {
        //Los límites en rojo
        if (unidad.indexOf('mite') !== -1) {
            return '#FF0000';
        }
        //Las metas en verde
        else if (unidad.indexOf('eta') !== -1) {
            return '#00FF00';
        }
        //Los valores rebiun en negro
        else if (unidad.indexOf('ebiun') !== -1) {
            return '#000000';
        }
        //Indicador en cuadros de mando: colores al azar
        else if (nomIndicador !== '') {
            var colors = ['#7CB5EC', '#880736', '#BF921D', '#F77205', '#900787'];
            var color = colors[index];
            if (index > 4) {
                //Generamos un color al azar
                color = '#' + (function lol(m, s, c) {
                    return s[m.floor(m.random() * s.length)] +
                            (c && lol(m, s, c - 1));
                })(Math, '0123456789ABCDEF', 4);
                //Evitamos blanco, colores de valores de referencia y por defecto(colors)
                while (color === '#FFFFFF'
                        || color === '#FF0000'
                        || color === '#00FF00'
                        || color === '#000000'
                        || colors.indexOf(color) !== -1) {
                    color = '#' + (function lol(m, s, c) {
                        return s[m.floor(m.random() * s.length)] +
                                (c && lol(m, s, c - 1));
                    })(Math, '0123456789ABCDEF', 4);
                }
            }
            return color;
        }
    };

    this.add = function (elem, esunidad) {
        //Valor por defecto para esunidad
        esunidad = typeof esunidad !== 'undefined' ? esunidad : false;
        var medicionOunidad;
        var category;
        // Escoge la información que usaremos como eje de las x
        if (this.categoryType === "año") {
            category = new Date(parseInt(elem.periodo_fin)).getFullYear();
        }
        else if (this.categoryType === "medicion" || this.categoryType === "bienal") {
            category = elem.medicion;
        }
        else if (this.categoryType === "unidad") {
            category = elem.etiqueta_mini;
        }
        else {
            category = elem.etiqueta_mini;
        }

        if (esunidad) {
            medicionOunidad = elem.unidad;
        }
        else {
            medicionOunidad = elem.etiqueta_mini ? elem.medicion : elem.unidad;
        }
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
    this.getBarSerie = function (nomIndicador) {
        var serieHighchart = [];
        //Valor por defecto para el nombre del indicador/dato que sólo se muestra en los 
        //paneles de los cuadros de mando
        nomIndicador = typeof nomIndicador !== 'undefined' ? (' - ' + nomIndicador) : '';
        this.categories.data.sort();
        for (medicion in this.serie) {
            var arrayMedicion = this.serie[medicion];
            for (m in arrayMedicion) {
                arrayMedicion[m].x = this.categories.position(arrayMedicion[m].id);
            }
            serieHighchart.push({
                type: 'column',
                name: medicion + nomIndicador,
                data: arrayMedicion,
                visible: false
            });
        }
        return serieHighchart;
    };

    //Devuelve una serie Highchart para un gráfico de líneas
    this.getLinealSerie = function (nomIndicador, index) {
        var serieHighchart = [];
        //Valor por defecto para el nombre del indicador/dato que sólo se muestra en los 
        //paneles de los cuadros de mando
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
            //Colores para valores de referencia e indicadores de cuadros de mando
            if (unidad.indexOf('mite') !== -1
                    || unidad.indexOf('eta') !== -1
                    || unidad.indexOf('ebiun') !== -1
                    || nomIndicador !== '') {
                serieHighchart.push({
                    type: 'line',
                    name: unidad + nomIndicador,
                    data: arrayUnidad,
                    color: color(unidad, nomIndicador, index)
                });
            }
            //Colores para el resto de las series
            else {
                serieHighchart.push({
                    type: 'line',
                    name: unidad + nomIndicador,
                    data: arrayUnidad
                });
            }
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
}