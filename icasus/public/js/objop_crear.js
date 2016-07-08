//------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/objop_crear.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero objop_crear.tpl
//------------------------------------------------------------------------------

$(document).ready(function () {
    //Navegación
    //Botón siguiente dirige a indicadores
    $('#btn_nxt_indicadores').on('click', function (e) {
        e.preventDefault();
        var validar = $('form').validator('validate');
        //Retiramos validación de páginas posteriores
        $('#div_unidad').removeClass('has-error');
        $('#div_subunidades').removeClass('has-error');
        //Si no hay errores de validación avanzamos
        if (!validar.has('.has-error').length) {
            $('#tab_objop').removeClass('active');
            $('#tab_objop').addClass('disabled');
            $('#objop').removeClass('active');
            $('#tab_indicadores').removeClass('disabled');
            $('#tab_indicadores').addClass('active');
            $('#indicadores').addClass('active');
        }
    });
    //Botón anterior dirige a objetivo operacional
    $('#btn_prev_objop').on('click', function (e) {
        e.preventDefault();
        $('#tab_indicadores').removeClass('active');
        $('#tab_indicadores').addClass('disabled');
        $('#indicadores').removeClass('active');
        $('#tab_objop').removeClass('disabled');
        $('#tab_objop').addClass('active');
        $('#objop').addClass('active');
    });
    //Botón siguiente dirige a subunidades
    $('#btn_nxt_subunidades').on('click', function (e) {
        e.preventDefault();
        $('#tab_indicadores').removeClass('active');
        $('#tab_indicadores').addClass('disabled');
        $('#indicadores').removeClass('active');
        $('#tab_subunidades').removeClass('disabled');
        $('#tab_subunidades').addClass('active');
        $('#subunidades').addClass('active');
    });
    //Botón anterior dirige a indicadores
    $('#btn_prev_indicadores').on('click', function (e) {
        e.preventDefault();
        $('#tab_subunidades').removeClass('active');
        $('#tab_subunidades').addClass('disabled');
        $('#subunidades').removeClass('active');
        $('#tab_indicadores').removeClass('disabled');
        $('#tab_indicadores').addClass('active');
        $('#indicadores').addClass('active');
    });

    //mostrar tipo de objetivo operacional
    $('.tipo_objop').on('click', function () {
        var valor = $(this).attr('value');
        //Propio
        if (valor === '0')
        {
            $('#div_unidad').removeClass('hidden');
            $('#div_subunidades').addClass('hidden');
            $(".subunidad").removeAttr("checked");
            $(".unidad").prop("checked", 'true');
        }
        //Descendente
        if (valor === '1')
        {
            $('#div_unidad').addClass('hidden');
            $('#div_subunidades').removeClass('hidden');
            $(".unidad").removeAttr("checked");
            $(".subunidad").prop("checked", 'true');
        }
    });

    $('#marcar_todos').on('click', function () {
        $(".subunidad").prop("checked", 'true');
    });

    $('#desmarcar_todos').on('click', function () {
        $(".subunidad").removeAttr("checked");
    });
});