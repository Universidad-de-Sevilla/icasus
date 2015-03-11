//------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: datos_rebiun.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero datos_rebiun.tpl
//------------------------------------------------------------------------------

$(document).ready(function () {
    $('.entrada_valor').on('keyup', function () {
        var entrada = $(this);
        var id_valor = entrada.data('id_valor');
        var id_entidad = entrada.data('id_entidad');
        var id_usuario = entrada.data('id_usuario');
        var valor_parcial = entrada.val();
        $.ajax({
            type: "GET",
            data: {ajax: true, valor_parcial: valor_parcial, id_valor: id_valor, id_entidad: id_entidad, id_usuario: id_usuario},
            url: "index.php?page=datos_rebiun_grabar&ajax=true",
            success: function (resultado) {
                if (resultado === valor_parcial)
                {
                    entrada.css("color", "#02A202");
                    entrada.css("border", "1px solid #02A202");
                    console.log("OK");
                }
                else
                {
                    entrada.css("color", "red");
                    entrada.css("border", "1px solid red");
                }
                console.log(id_valor + "-" + id_entidad + "-" + id_usuario + "-" + valor_parcial);
                console.log(resultado);
            }
        });
    });
});

