//------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/proceso_crear.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero proceso_crear.tpl
//------------------------------------------------------------------------------

$(document).ready(function () {
    //Navegación
    //Botón siguiente dirige a otros
    $('#btn_nxt_otros').on('click', function (e) {
        e.preventDefault();
        var validar = $('form').validator('validate');
        //Si no hay errores de validación avanzamos
        if (!validar.has('.has-error').length) {
            $('#tab_proceso').removeClass('active');
            $('#tab_proceso').addClass('disabled');
            $('#proceso').removeClass('active');
            $('#tab_otros').removeClass('disabled');
            $('#tab_otros').addClass('active');
            $('#otros').addClass('active');
        }
    });
    //Botón anterior dirige a proceso
    $('#btn_prev_proceso').on('click', function (e) {
        e.preventDefault();
        $('#tab_otros').removeClass('active');
        $('#tab_otros').addClass('disabled');
        $('#otros').removeClass('active');
        $('#tab_proceso').removeClass('disabled');
        $('#tab_proceso').addClass('active');
        $('#proceso').addClass('active');
    });
});