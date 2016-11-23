//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/medicion_responsable.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero medicion_responsable.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {
    $('select.identificador').change(function () {
        var id_usuario = this.value;
        var id_indsub = $(this).attr('id');
        if (id_usuario !== 0)
        {
            $.post("index.php?page=medicion_responsable_ajax&modulo=grabar&ajax=true", {id: id_indsub, id_usuario: id_usuario}, function () {
                location.reload();
            });
        }
    });
});