//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/panel_nuevo.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Incluye el código JavaScript para el fichero panel_nuevo.tpl
//----------------------------------------------------------------------------

$(function () {
    $('#panel_nuevo').validate();
    $('#tab_crear_panel').tabs({selected: 5});
    $('.tipo').on('click', function () {
        var id_entidad = $('#id_entidad').val();
        var tipo = $(this).data('tipo');
        $('#footer_tabs').hide();
        /*
         if (tipo != 'panel_informacion')
         {
         $('#footer_tabs').show();
         }
         else
         {
         $('#footer_tabs').hide();
         }
         */
        $.ajax({
            url: "index.php?page=" + tipo + "&ajax=true&modulo=inicio&id_entidad=" + id_entidad,
            success: function (datos) {
                $("#datos").html(datos);
            }
        });
    });
});
