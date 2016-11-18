//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/objop_editar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Código javascript para objop_editar.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {
    //mostrar tipo de objetivo operacional
    $('.tipo_objop').on('click', function () {
        var valor = $(this).attr('value');
        //Propio
        if (valor === '0')
        {
            $('#div_subunidades').addClass('hidden');
            $('#lista_unidades').prop('disabled', false);
            $('#lista_unidades').trigger('chosen:updated');
            $(".subunidad").prop("disabled", true);
            $('#div_unidad').removeClass('hidden');

        }
        //Descendente
        if (valor === '1')
        {
            $('#div_unidad').addClass('hidden');
            $('#lista_unidades').prop('disabled', true);
            $('#div_subunidades').removeClass('hidden');
            $(".subunidad").prop("disabled", false);
        }
        $('.subunidad').trigger('change');
    });

    $('#marcar_todos').on('click', function () {
        $(".subunidad").prop("checked", true);
        $('.subunidad').trigger('change');
    });

    $('#desmarcar_todos').on('click', function () {
        $(".subunidad").prop("checked", false);
        $('.subunidad').trigger('change');
    });

    $('.subunidad').click(function () {
        $('.subunidad').trigger('change');
    });

    //Cambios del índice de los objetivos estratégicos
    $('#id_objest').change(function () {
        var indice = $(this).find(':selected').data('indice');
        var posicion = $(this).find(':selected').data('posicion');
        var elementos = $('#indice').data('elementos_objest');
        $('.input-group-addon').html(indice + '.');
        $('#indice').data('elementos', elementos[posicion]);
    });
});