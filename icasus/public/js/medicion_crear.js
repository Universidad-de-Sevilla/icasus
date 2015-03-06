//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/medicion_crear.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Incluye el código JavaScript para el fichero medicion_crear.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {
    $('.subunidad').on('click', function () {
        var indicador = $(this).data('indicador');
        var entidad = $(this).val();
        $.ajax({
            url: "index.php?page=medicion_crear_ajax&ajax=true&id_indicador=" + indicador + "r&id_entidad=" + entidad
        });
    });
});