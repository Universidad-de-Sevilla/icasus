//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/objop_mostrar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Código javascript para objop_mostrar.tpl
//----------------------------------------------------------------------------

//Barra de botones
$(document).ready(function () {
    var botones_ficha = $('#botones_ficha').html();
    $('#btn_ficha').addClass('dt-buttons btn-group pull-right').append(botones_ficha);
});

//Grados de ejecución
$('#page-wrapper').on('click', '.editar', function () {
    var id_objop = $(this).data('id_objop');
    var anyo = $(this).data('anyo');
    $("#page-wrapper #edicion_" + anyo).load("index.php?page=objop_ajax&ajax=true&modulo=editar_ejecucion&id_objop=" + id_objop + "&anyo=" + anyo);
});