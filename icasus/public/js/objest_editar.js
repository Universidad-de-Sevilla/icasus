//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/objest_editar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Código javascript para objest_editar.tpl
//----------------------------------------------------------------------------

//Cambios del índice de las líneas
$(document).ready(function () {
    $('#id_linea').change(function () {
        var indice = $(this).find(':selected').data('indice');
        var elementos = $('#indice').data('elementos_linea');
        $('.input-group-addon').html(indice + '.');
        $('#indice').data('elementos', elementos[indice]);
    });
});