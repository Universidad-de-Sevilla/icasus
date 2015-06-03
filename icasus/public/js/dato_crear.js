//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/dato_crear.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Incluye el código JavaScript para el fichero dato_crear.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {
    //desactivar inicialmente las tabs 1 y 2
    $('#tab_crear_dato').tabs({disabled: [1, 2]});
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
    var validator = $('#formdato').validate({
        rules: {
            codigo: {required: true},
            id_responsable: {required: true},
            id_responsable_medicion: {required: true},
            nombre: {required: true},
            historicos: {
                required: true,
                min: 2008
            },
            tipo_seleccion_responsable: {required: true}
        },
        ignore: ':hidden',
        messages: {
            codigo: 'Debe insertar un código',
            id_responsable: 'Debe seleccionar un responsable',
            id_responsable_medicion: 'Seleccionar el responsable de medición',
            nombre: 'Debe dar un nombre',
            historicos: {
                required: 'Debe indicar un año de inicio para el Histórico del Dato',
                min: 'El Histórico debe ser igual o posterior al año 2008'
            },
            tipo_seleccion_responsable: 'Seleccionar el tipo de medición'
        }
    });
    //Boton previo
    $('button.btnPrev').on('click', function () {
        var actualTab = $('#tab_crear_dato').tabs('option', 'selected');
        $('#tab_crear_dato').tabs('enable', actualTab - 1).tabs('select', actualTab - 1).tabs('disable', actualTab);
    });
    //Boton next
    $('button.btnNext').on('click', function () {
        var actualTab = $('#tab_crear_dato').tabs('option', 'selected');
        var estaValidado = $('#formdato').valid();
        if (estaValidado === true)
        {
            $('#tab_crear_dato').tabs('enable', actualTab + 1).tabs('select', actualTab + 1).tabs('disable', actualTab);
        }
        else
        {
            validator.focusInvalid();
        }
        return false;
    });
});