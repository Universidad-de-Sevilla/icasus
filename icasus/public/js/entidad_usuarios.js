//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/entidad_usuarios.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero entidad_usuarios.js
//----------------------------------------------------------------------------

//Edición de roles de los usuarios
$(document).ready(function () {
    $('.rol_usuario').on('change', function () {
        var id_rol = $(this).val();
        var id_entidad = $(this).data('id_entidad');
        var id_usuario = $(this).data('id_usuario');
        $.get("index.php?page=entidad_usuarios&ajax=true", {id_entidad: id_entidad, id_usuario: id_usuario, id_rol: id_rol}, function () {
        });
    });
});