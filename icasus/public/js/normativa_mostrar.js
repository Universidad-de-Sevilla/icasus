//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/normativa_mostrar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Código javascript para normativa_mostrar.tpl
//----------------------------------------------------------------------------

//Barras de botones
$(document).ready(function () {
    var botones_ficha = $('#botones_ficha').html();
    $('#btn_ficha').addClass('dt-buttons btn-group pull-right').append(botones_ficha);
});