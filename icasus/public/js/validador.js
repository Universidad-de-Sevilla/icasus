//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/validador.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para validadores personalizados para el plugin 
// bootstrap-validator
//----------------------------------------------------------------------------

// Función que validad que un fichero tiene extensión .csv
$('#importar_csv').validator({
    custom: {
        'validar_csv': function ($el) {
            var validado = false;
            var regexp = /.+\.csv$/;
            if ($el.val().match(regexp) || !$el.val()) {
                validado = true;
            }
            return validado;
        }
    },
    errors: {
        validar_csv: 'El archivo no tiene la extensión .csv'
    }
});

// Función que valida que un fecha tiene el formato correcto
$('#proceso_crear').validator({
    custom: {
        'validar_fecha': function ($el) {
            var validado = false;
            var regexp = /(0[1-9]|[1-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/([0-9]{4})$/;
            if ($el.val().match(regexp) || !$el.val()) {
                validado = true;
            }
            return validado;
        }
    },
    errors: {
        validar_fecha: 'Introduzca una fecha en el formato correcto (dd/mm/aaaa).'
    }
});

// Función que valida que un fórmula tiene la sintaxis correcta
$('#indicador_crear').validator({
    custom: {
        'validar_formula': function ($el) {
            var validado = false;
            var regexp = /(\()*\[([0-9]+)\]((\+|-|\*|\/)(\[([0-9]+)\]|[0-9]+))*(\))*((\+|-|\*|\/)(\()*(\[([0-9]+)\]|[0-9]+)(\))*)*$/;
            if ($el.val().match(regexp) || !$el.val()) {
                validado = true;
            }
            return validado;
        }
    },
    errors: {
        validar_formula: 'La fórmula no tiene la sintaxis correcta. La sintaxis para referirse a indicadores/datos es la siguiente: [ID del indicador/dato]. Ejemplo: [1]+[2]'
    }
});