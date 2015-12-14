//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/valor_referencia_crear.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero valor_referencia_crear.tpl
//----------------------------------------------------------------------------

//carga inicial
$(document).ready(function () {
    var id;
    //Editar valores de referencia
    $("a.dialog_button").click(function () {
        var tag = $(this).attr('id');
        var ids = tag.split('-');
        id = ids[2];
        $('#e-etiqueta').attr('value', $('#l-etiqueta-' + id).attr('value'));
        $('#e-nombre').attr('value', $('#l-nombre-' + id).attr('value'));
        if ($('#l-grafica-' + id).is(':checked')) {
            $('#e-grafica').bootstrapToggle('on');
        }
        if ($('#l-activo-' + id).is(':checked')) {
            $('#e-activo').bootstrapToggle('on');
        }
    });
    //Captura los valores de los campos y los envia con el formulario
    $("#valor_editar").click(function () {
        var id_indicador = $('[name=e-id_indicador]').val();
        var etiqueta = $('[name=e-etiqueta]').val();
        var nombre = $('[name=e-nombre]').val();
        var grafica = 0;
        var activo = 0;
        if ($("input:checkbox[name=e-grafica]").is(':checked')) {
            grafica = 1;
        }
        if ($('input:checkbox[name=e-activo]').is(':checked')) {
            activo = 1;
        }
        if (!(etiqueta === '') && !(nombre === '')) {
            $.ajax({
                type: 'post',
                url: 'index.php?page=valor_referencia_ajax&ajax=true&modulo=editar',
                data: {'id_valor': id, 'id_indicador': id_indicador, 'etiqueta': etiqueta, 'nombre': nombre, 'grafica': grafica, 'activo': activo},
                success: function () {
                    location.reload();
                }
            });
        }
    });

    //Visibilidad en gráficas
    $(".grafica").change(function () {
        var tag = $(this).attr('id');
        var ids = tag.split('-');
        var id = ids[2];
        var grafica = 0;
        if ($(this).is(":checked")) {
            grafica = 1;
        }
        $.post('index.php?page=valor_referencia_ajax&ajax=true&modulo=grafica', {'id_valor': id, 'grafica': grafica}, function () {
        });
    });

    //Activación
    $(".activo").change(function () {
        var tag = $(this).attr('id');
        var ids = tag.split('-');
        var id = ids[2];
        var activo = 0;
        if ($(this).is(":checked")) {
            activo = 1;
        }
        $.post('index.php?page=valor_referencia_ajax&ajax=true&modulo=activar', {'id_valor': id, 'activo': activo}, function () {
        });
    });

    //Crear nuevo valor de referencia
    $('#valor_nuevo_crear').click(function () {
        var id_indicador = $('[name=c-id_indicador]').val();
        var etiqueta = $('[name=c-etiqueta]').val();
        var nombre = $('[name=c-nombre]').val();
        var grafica = 0;
        var activo = 0;
        if ($("input:checkbox[name=c-grafica]").is(':checked')) {
            grafica = 1;
        }
        if ($('input:checkbox[name=c-activo]').is(':checked')) {
            activo = 1;
        }
        if (!(etiqueta === '') && !(nombre === '')) {
            $.post('index.php?page=valor_referencia_ajax&ajax=true&modulo=crear', {id_indicador: id_indicador, etiqueta: etiqueta, nombre: nombre, grafica: grafica, activo: activo}, function () {
                location.reload();
            });
        }
    });
});