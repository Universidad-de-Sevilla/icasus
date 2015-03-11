//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/dato_editar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Incluye el código JavaScript para el fichero dato_editar.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {
    //mostrar tipo de medición
    $('.medicion').on('click', function () {
        var valor = $(this).attr('value');
        if (valor === '1' || valor === '2')
        {
            $('#total').css('display', 'block');
            $('#div_unidad').css('display', 'inline');
            $('#div_subunidades').css('display', 'inline');
            $(".subunidad").attr("checked", "checked");
        }
        else if (valor === '0')
        {
            $('#total').css('display', 'none');
            $('#div_unidad').css('display', 'inline');
            $('#div_subunidades').css('display', 'none');
            $(".subunidad").removeAttr("checked");
            $(".unidad").attr("checked", "checked");
        }
    });
    //validar formulario
    var validator = $('#formdato').validate({
        rules: {
            codigo: {required: true},
            id_responsable: {required: true},
            nombre: {required: true}
        },
        ignore: ':hidden',
        messages: {
            codigo: 'Debe insertar un código',
            id_responsable: 'Debe seleccionar un responsable',
            nombre: 'Debe dar un nombre'
        }
    });
    //Cambiar de pestaña y botón de grabar
    $('button.green').on('click', function (e) {
        var estavalidado = $('#formdato').valid();
        if (!estavalidado)
        {
            validator.focusInvalid();
        }
    });
    $('#tab_datos').on('click', function (e) {
        $(this).attr('href', '#dato');
        var actualTab = $('#tab_crear_dato').tabs('option', 'selected');
        var estavalidado = $('#formdato').valid();
        if (!estavalidado)
        {
            $(this).attr('href', '#');
            validator.focusInvalid();
        }
    });
    $('#tab_otras').on('click', function (e) {
        $(this).attr('href', '#otras');
        var actualTab = $('#tab_crear_dato').tabs('option', 'selected');
        var estavalidado = $('#formdato').valid();
        if (!estavalidado)
        {
            $(this).attr('href', '#');
            validator.focusInvalid();
        }
    });
    $('#tab_subunidades').on('click', function (e) {
        $(this).attr('href', '#subunidades');
        var actualTab = $('#tab_crear_dato').tabs('option', 'selected');
        var estavalidado = $('#formdato').valid();
        if (!estavalidado)
        {
            $(this).attr('href', '#');
            validator.focusInvalid();
        }
    });
});
