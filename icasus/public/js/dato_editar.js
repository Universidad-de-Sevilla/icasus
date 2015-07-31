//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/dato_editar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Incluye el código JavaScript para el fichero dato_editar.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {
    //mostrar selección de agregación temporal
    $('#periodicidad').on('click', function () {
        var valor = $(this).attr('value');
        if (valor === 'Bienal' || valor === 'Anual')
        {
            $('#total_anual').css('display', 'none');
        }
        else
        {

            $('#total_anual').css('display', 'block');
        }
    });
    //mostrar tipo de medición
    $('.medicion').on('click', function () {
        var valor = $(this).attr('value');
        if (valor === '1' || valor === '2')
        {
            $('#total').css('display', 'block');
            $('#div_unidad').css('display', 'none');
            $('#div_subunidades').css('display', 'inline');
            $(".subunidad").attr("checked", "checked");
            $(".unidad").removeAttr("checked");
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
    var anyo = new Date().getFullYear();
    var validator = $('#formdato').validate({
        rules: {
            codigo: {required: true},
            id_responsable: {required: true},
            id_responsable_medicion: {required: true},
            historicos: {
                required: true,
                min: 2008,
                max: anyo
            },
            tipo_seleccion_responsable: {required: true},
            nombre: {required: true},
            'subunidades[]': {required: true}
        },
        ignore: ':hidden',
        messages: {
            codigo: 'Debe insertar un código',
            id_responsable: 'Debe seleccionar un responsable',
            id_responsable_medicion: 'Seleccionar el responsable de medición',
            historicos: {
                required: 'Debe indicar un año de inicio para el Histórico del Dato',
                min: 'El Histórico debe ser igual o posterior al año 2008',
                max: 'El Histórico debe ser igual o anterior al año actual'
            },
            nombre: 'Debe dar un nombre',
            tipo_seleccion_responsable: 'Seleccionar el tipo de medición',
            'subunidades[]': 'Debe seleccionar al menos una Unidad'
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
