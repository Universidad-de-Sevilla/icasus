//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/panel_nuevo.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Incluye el código JavaScript para el fichero panel_nuevo.tpl
//----------------------------------------------------------------------------

$(function () {
    $('.tipo').on('click', function () {
        var id_entidad = $('#id_entidad').val();
        var tipo = $(this).data('tipo');
        $('#datos_panel').removeClass('active');
        $('#footer_tabs').addClass('hidden');
        $.ajax({
            url: "index.php?page=" + tipo + "&ajax=true&modulo=inicio&id_entidad=" + id_entidad,
            success: function (datos) {
                $("#datos").html(datos);
            }
        });
    });
});
