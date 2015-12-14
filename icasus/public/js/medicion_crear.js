//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/medicion_crear.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Incluye el código JavaScript para el fichero medicion_crear.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {
    //Navegación
    //Botón siguiente dirige a valores de referencia
    $('#btn_nxt_vref').on('click', function (e) {
        e.preventDefault();
        var validar = $('form').validator('validate');
        //Retiramos validación de páginas posteriores
        $('#div_subunidades').removeClass('has-error');
        //Si no hay errores de validación avanzamos
        if (!validar.has('.has-error').length) {
            $('#tab_medicion').removeClass('active');
            $('#tab_medicion').addClass('disabled');
            $('#medicion').removeClass('active');
            $('#tab_vref').removeClass('disabled');
            $('#tab_vref').addClass('active');
            $('#vref').addClass('active');
        }
    });
    //Botón anterior dirige a medicion
    $('#btn_prev_medicion').on('click', function (e) {
        e.preventDefault();
        $('#tab_vref').removeClass('active');
        $('#tab_vref').addClass('disabled');
        $('#vref').removeClass('active');
        $('#tab_medicion').removeClass('disabled');
        $('#tab_medicion').addClass('active');
        $('#medicion').addClass('active');
    });
    //Botón siguiente dirige a subunidades
    $('#btn_nxt_subunidades').on('click', function (e) {
        e.preventDefault();
        $('#tab_vref').removeClass('active');
        $('#tab_vref').addClass('disabled');
        $('#vref').removeClass('active');
        $('#tab_subunidades').removeClass('disabled');
        $('#tab_subunidades').addClass('active');
        $('#subunidades').addClass('active');
    });
    //Botón anterior dirige a vref
    $('#btn_prev_vref').on('click', function (e) {
        e.preventDefault();
        $('#tab_subunidades').removeClass('active');
        $('#tab_subunidades').addClass('disabled');
        $('#subunidades').removeClass('active');
        $('#tab_vref').removeClass('disabled');
        $('#tab_vref').addClass('active');
        $('#vref').addClass('active');
    });

    //Actualización de unidades afectadas
    $('.subunidad').on('click', function () {
        var indicador = $(this).data('indicador');
        var entidad = $(this).val();
        $.ajax({
            url: "index.php?page=medicion_crear_ajax&ajax=true&id_indicador=" + indicador + "&id_entidad=" + entidad
        });
    });
});