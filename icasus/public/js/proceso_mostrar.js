//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/proceso_mostrar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Código javascript para proceso_mostrar.tpl
//----------------------------------------------------------------------------

//Barra de botones
$(document).ready(function () {
    var botones = $('#botones').html();
    $('#btn_ficha').addClass('dt-buttons btn-group pull-right').append(botones);
});
