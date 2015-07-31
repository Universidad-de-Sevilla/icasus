//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/Conjunto.js
// Desarrolladores: Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------

/** 
 * Conjunto:
 *
 * Lista en la que no se pueden repetir elementos.
 * No tiene porque estar ordenado.
 *
 * Funciones:
 * + void function Conjunto()
 * + void function add(element)
 * + boolean function remove(element)
 * + integer function position(element)
 * + element function get(integer)
 * + array<element> function getAll()
 * + array<element> function set(element, element)
 * + void function show()
 *
 */

function Conjunto() {
    this.data = [];

    this.add = function (element) {
        if (this.data.indexOf(element) < 0) {
            this.data.push(element);
            return true;
        } else {
            return false;
        }
    };

    this.remove = function (element) {
        var pos = this.data.indexOf(element);
        if (pos > -1) {
            this.data.splice(pos, 1);
            return true;
        } else {
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
    };

    this.set = function (older, newer) {
        var pos = this.data.indexOf(older);
        if (pos > -1) {
            this.data.splice(pos, 1, newer);
            return true;
        } else {
            return false;
        }
    };

    this.show = function () {
        console.log(this.data);
    };
}