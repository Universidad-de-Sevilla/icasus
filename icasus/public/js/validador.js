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