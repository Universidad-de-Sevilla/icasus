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
    var botones_ficha = $('#botones_ficha').html();
    var botones_indics = $('#botones_indics').html();
    var botones_archivo = $('#botones_archivo').html();
    $('#btn_ficha').addClass('dt-buttons btn-group pull-right').append(botones_ficha);
    $('#tabla_indics_filter, #tabla_indicadores_archivados_filter').append(botones_indics);
    $('#tabla_archivos_filter').append(botones_archivo);
});