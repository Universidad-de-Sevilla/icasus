//------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: datos_rebiun.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero datos_rebiun.tpl
//------------------------------------------------------------------------------

$(document).ready(function () {
    $('.entrada_valor').on('input', function () {
        var entrada = $(this);
        var id_valor = entrada.data('id_valor');
        var id_entidad = entrada.data('id_entidad');
        var id_usuario = entrada.data('id_usuario');
        var valor_parcial = entrada.val();
        $.ajax({
            type: "GET",
            data: {ajax: true, valor_parcial: valor_parcial, id_valor: id_valor, id_entidad: id_entidad, id_usuario: id_usuario},
            url: "index.php?page=datos_rebiun_grabar&ajax=true"
        });
    });
});