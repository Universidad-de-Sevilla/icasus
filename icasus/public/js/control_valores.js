/* 
 * Código JavaScript para el control de valores asociado al fichero control_valores.tpl
 */

$(".borrar").on('click', function (evento) {
    var boton_borrar;
    boton_borrar = $(this);
    id_valor = boton_borrar.data('id_valor');
    $('#nombre_unid').html(boton_borrar.data('nombre_unid'));
    $('#nombre_val').html(boton_borrar.data('nombre_val'));
    $("#dialogo_borrar_control").dialog({
        title: "Desactivar Valor",
        autoOpen: true, modal: true,
        buttons: [
            {
                text: "Confirmar",
                "class": 'green',
                click: function () {
                    $(this).dialog("close");
                    $.ajax({
                        url: "index.php?page=control&modulo=desactivar_valor&ajax=true&id_valor=" + id_valor,
                        success: function () {
                            location.reload();
                        }
                    });
                }
            },
            {
                text: "Cancelar",
                "class": 'red text_only has_text',
                click: function () {
                    $(this).dialog("close");
                }
            }
        ]
    });
    evento.preventDefault();
});
