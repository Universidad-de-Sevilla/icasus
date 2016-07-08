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

    //Cambios del índice de los objetivos estratégicos
    $('#id_objest').change(function () {
        var indice = $(this).find(':selected').data('indice');
        var posicion = $(this).find(':selected').data('posicion');
        var elementos = $('#indice').data('elementos_objest');
        $('.input-group-addon').html(indice + '.');
        $('#indice').data('elementos', elementos[posicion]);
    });
});