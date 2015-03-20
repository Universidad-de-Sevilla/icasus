//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/indicador_editar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Incluye el código JavaScript para el fichero indicador_editar.tpl
//----------------------------------------------------------------------------


$(document).ready(function () {
    //$('#tab_editar_indicador').tabs({disabled: [1, 2]});
    //mostrar tipo de medición
    $('.medicion').on('click', function () {
        var valor = $(this).attr('value');
        if (valor === '1' || valor === '2')
        {
            $('#total').css('display', 'block');
            $('#div_unidad').css('display', 'block');
            $('#div_subunidades').css('display', 'block');
            $(".subunidad").attr("checked", "checked");
        }
        else if (valor === '0')
        {
            $('#total').css('display', 'none');
            $('#div_unidad').css('display', 'block');
            $('#div_subunidades').css('display', 'none');
            $(".subunidad").removeAttr("checked");
            $(".unidad").attr("checked", "checked");
        }
    });
    //validar formulario
    var validator = $('#formindicador').validate({
        rules: {
            codigo: {required: true},
            id_proceso: {required: true},
            nombre: {required: true},
            formulacion: {required: true},
            id_responsable: {required: true},
            id_responsable_medicion: {required: true},
            tipo_seleccion_responsable: {required: true}
        },
        ignore: ':hidden',
        messages: {
            codigo: 'Debe insertar un código',
            id_proceso: 'Debe seleccionar un proceso',
            nombre: 'Debe dar un nombre',
            formulacion: 'Debe indidr su formulación',
            id_responsable: 'Seleccionar un responsable',
            id_responsable_medicion: 'Seleccionar el responsable de medición',
            tipo_seleccion_responsable: 'Seleccionar el tipo de medición'
        }
    });
    //Cambiar de pestaña y botón de grabar
    $('button.green').on('click', function (e) {
        var estavalidado = $('#formindicador').valid();
        if (!estavalidado)
        {
            validator.focusInvalid();
        }
    });
    $('#tab_indicador').on('click', function (e) {
        $(this).attr('href', '#indicador');
        var actualTab = $('#tab_editar_indicador').tabs('option', 'selected');
        var estavalidado = $('#formindicador').valid();
        if (!estavalidado)
        {
            $(this).attr('href', '#');
            validator.focusInvalid();
        }
    });
    $('#tab_otros').on('click', function (e) {
        $(this).attr('href', '#otros');
        var actualTab = $('#tab_editar_indicador').tabs('option', 'selected');
        var estavalidado = $('#formindicador').valid();
        if (!estavalidado)
        {
            $(this).attr('href', '#');
            validator.focusInvalid();
        }
    });
    $('#tab_subunidades').on('click', function (e) {
        $(this).attr('href', '#subunidades');
        var actualTab = $('#tab_editar_indicador').tabs('option', 'selected');
        var estavalidado = $('#formindicador').valid();
        if (!estavalidado)
        {
            $(this).attr('href', '#');
            validator.focusInvalid();
        }
    });
});