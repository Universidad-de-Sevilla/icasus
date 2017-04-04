//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/objop_mostrar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Código javascript para objop_mostrar.tpl
//----------------------------------------------------------------------------

//Barra de botones
$(document).ready(function () {
    var botones_ficha = $('#botones_ficha').html();
    $('#btn_ficha').addClass('dt-buttons btn-group pull-right').append(botones_ficha);
});

//Grados de ejecución
$('#page-wrapper').on('click', '.editar', function () {
    var id_objop = $(this).data('id_objop');
    var anyo = $(this).data('anyo');
    $("#page-wrapper #edicion_" + anyo).load("index.php?page=objop_ajax&ajax=true&modulo=editar_ejecucion&id_objop=" + id_objop + "&anyo=" + anyo);
    $("#page-wrapper #resultado_" + anyo).load("index.php?page=objop_ajax&ajax=true&modulo=editar_resultado&id_objop=" + id_objop + "&anyo=" + anyo);
});

//Validación
$('#page-wrapper').on('keyup', '.valor', function () {
    var actualizar_dato = $(this);
    var valor = $(this).val();
    valor = valor.replace(',', '.');
    if ($.isNumeric(valor) && valor >= 0 && valor <= 100) {
        actualizar_dato.css("border-color", "green");
    }
    else {
        actualizar_dato.css("border-color", "red");
    }
});

//Grabación de porcentajes
$('#page-wrapper').on('click', '.grabar', function () {
    var id_objop = $(this).data('id_objop');
    var anyo = $(this).data('anyo');
    var valor = $('#page-wrapper #valor_' + anyo).val();
    var resultado = $('#page-wrapper #resultado_' + anyo).children('textarea').val();
    valor = valor.replace(',', '.');
    if ($.isNumeric(valor) && valor >= 0 && valor <= 100) {
        $.ajax({
            type: "POST",
            data: {'valor': valor, 'resultado': resultado},
            url: "index.php?page=objop_ajax&ajax=true&modulo=grabar_ejecucion&id_objop=" + id_objop + "&anyo=" + anyo,
            success: function () {
                $("#page-wrapper #edicion_" + anyo).load("index.php?page=objop_ajax&ajax=true&modulo=cancelar_ejecucion&id_objop=" + id_objop + "&anyo=" + anyo);
                $("#page-wrapper #resultado_" + anyo).load("index.php?page=objop_ajax&ajax=true&modulo=cancelar_resultado&id_objop=" + id_objop + "&anyo=" + anyo);
                $("#page-wrapper #porcentaje_" + anyo).load("index.php?page=objop_ajax&ajax=true&modulo=actualizar_porcentaje&id_objop=" + id_objop + "&anyo=" + anyo);
                $("#page-wrapper #ejecucion_global").load("index.php?page=objop_ajax&ajax=true&modulo=actualizar_global&id_objop=" + id_objop + "&anyo=" + anyo);
            }
        });
    }
    else {
        $('#dialogo_valor_invalido').modal('show');
    }
});

//Cancelar edición
$('#page-wrapper').on('click', '.cancelar', function () {
    var id_objop = $(this).data('id_objop');
    var anyo = $(this).data('anyo');
    $("#page-wrapper #edicion_" + anyo).load("index.php?page=objop_ajax&ajax=true&modulo=cancelar_ejecucion&id_objop=" + id_objop + "&anyo=" + anyo);
    $("#page-wrapper #resultado_" + anyo).load("index.php?page=objop_ajax&ajax=true&modulo=cancelar_resultado&id_objop=" + id_objop + "&anyo=" + anyo);
});

//Activar/Desactivar objetivo manualmente
$(".activar").change(function () {
    var id_objop = $(this).data('id_objop');
    var anyo = $(this).data('anyo');
    var activo = 0;
    if ($(this).is(":checked")) {
        activo = 1;
    }
    $.get('index.php?page=objop_ajax&ajax=true&modulo=activar_objetivo', {id_objop: id_objop, anyo: anyo, activo: activo}, function () {
        $("#page-wrapper #ejecucion_global").load("index.php?page=objop_ajax&ajax=true&modulo=actualizar_global&id_objop=" + id_objop + "&anyo=" + anyo);
    });
});