//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/indicador_subunidad_valor.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero indicador_subunidad_valor.tpl
//----------------------------------------------------------------------------

$(function () {
    var id_indicador = $('table').data('id_indicador');
    var id_entidad = $('table').data('id_entidad');
    var id_medicion = 'null';
    var id_subunidad = 'null';
//    var subunidad = 'null';
    var inicio = 'null';
    var fin = 'null';
    var activo = 'null';

    //Diálogo para activar una medición no asignada
    $('#page-wrapper').on('click', '.no_asignada', function () {
        var subunidad = $(this).parent().parent().data('subunidad');
        var id_medicion = $(this).parent().data('id_medicion');
        var id_subunidad = $(this).parent().parent().data('id_subunidad');
        var inicio = $("#inicio").val();
        var fin = $("#fin").val();
        if (inicio === 0) {
            fin = 0;
        }
        $('#nombre_subunidad').html(subunidad);
        $('#modal_asignar_una_medicion').modal('show');
        $('#btn_confirm_med').click(function () {
            var activo = 0;
            if ($('#activo').is(":checked")) {
                activo = 1;
            }
            var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin + "&activo=" + activo;
            $("#panel_valores").html("<h4 class='text-center'><i class='fa fa-spinner fa-pulse'></i></h4>");
            $.ajax({
                url: "index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=asignar_una_medicion" + parametros,
                success: function (datos) {
                    $("#mostrar_valores").html(datos);
                }
            });
        });
    });

    $('#page-wrapper').on('change', '.activar_uno', function () {
        var activar_uno = $(this);
        var id_subunidad = $(this).parent().parent().data('id_subunidad');
        var id_medicion = $(this).parent().data('id_medicion');
        var subunidad = $(this).parent().parent().data('subunidad');
        var inicio = $("#inicio").val();
        if (inicio === 0) {
            var fin = 0;
        } else {
            var fin = $("#fin").val();
        }
        var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin;
        //var parametros = "&id_subunidad="+id_subunidad+"&id_medicion="+id_medicion+"&inicio="+inicio+"&fin="+fin+"&id_entidad="+id_entidad+"&id_indicador="+id_indicador;
        if (activar_uno.is(':checked')) {
            var activo = 1;
            $('#msg_activacion_uno').html('activar');
        } else {
            var activo = 0;
            $('#msg_activacion_uno').html('desactivar');
        }
        parametros = parametros + "&activo=" + activo;
        $("#modal_activar_uno").dialog({
            autoOpen: true, modal: true, title: subunidad,
            buttons: [
                {
                    text: "Cancelar",
                    class: 'red',
                    style: 'color:white;',
                    click: function () {
                        $(this).dialog("close");
                        if (activo === 1) {
                            activar_uno.removeAttr("checked");
                        } else {
                            activar_uno.attr("checked", "checked");
                        }
                    }
                },
                {
                    text: "Confirmar",
                    class: 'green',
                    style: 'color:white;',
                    click: function () {
                        $(this).dialog("close");
                        $("#mostrar_valores").html("<div style='padding:30px'><b>Cargando datos ...</b></div>");
                        $.ajax({
                            url: "index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=activar_uno" + parametros,
                            success: function (datos) {
                                $("#mostrar_valores").html(datos);
                            }
                        });
                    }
                }
            ]
        });
    });

    $('#page-wrapper').on('click', '.activar_all', function () {
        var activar_all = $(this);
        var id_medicion = 'null';
        var id_subunidad = $(this).parent().parent().data('id_subunidad');
        var subunidad = $(this).parent().parent().data('subunidad');
        var inicio = $("#inicio").val();
        if (inicio === 0) {
            var fin = 0;
        } else {
            var fin = $("#fin").val();
        }
        var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin;
        $("#modal_activar_all").dialog({
            autoOpen: true, modal: true, title: subunidad,
            buttons: [
                {
                    text: "Cancelar",
                    class: 'red',
                    style: 'color:white;',
                    click: function () {
                        $(this).dialog("close");
                    }
                },
                {
                    text: "Confirmar",
                    class: 'green',
                    style: 'color:white;',
                    click: function () {
                        var activo_all = $("input[name='activo_all']:checked").val();
                        parametros = parametros + "&activo=" + activo_all;
                        $(this).dialog("close");
                        $("#mostrar_valores").html("<div style='padding:30px'><b>Cargando datos ...</b></div>");
                        $.ajax({
                            url: "index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=activar_all" + parametros,
                            success: function (datos) {
                                $("#mostrar_valores").html(datos);
                            }
                        });
                    }
                }
            ]
        });
    });
    $('#btn_mostrar').on('click', function () {
        var inicio = $("#inicio").val();
        if (inicio === 0) {
            var fin = 0;
        } else {
            var fin = $("#fin").val();
        }
        var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin + "&activo=" + activo;
        $("#panel_valores").html("<h4 class='text-center'><i class='fa fa-spinner fa-pulse'></i></h4>");
        $.ajax({
            url: "index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=mostrar_valores" + parametros,
            success: function (datos) {
                $("#mostrar_valores").html(datos);
            }
        });
    });
    //muestra los años de las mediciones
    $('#inicio').on('change', function () {
        $("#inicio option:selected").each(function () {
            elegido = $(this).val();
            if (elegido === 0) {
                $("#end_year").html(' ');
            }
            else
            {
                var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + elegido + "&fin=" + fin + "&activo=" + activo;
                $.ajax({
                    url: "index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=seleccionar_años" + parametros,
                    success: function (datos) {
                        $("#end_year").html(datos);
                    }
                });
            }
        });
    });

    $('#page-wrapper').on('keyup', '.actualizar_dato', function () {
        var actualizar_dato = $(this);
        var id_valor = $(this).data('id_valor');
        var valor = $(this).val();
        //alert(valor);
        var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin + "&activo=" + activo + "&id_valor=" + id_valor + "&valor=" + valor;
        $.ajax({
            url: "index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=actualizar_dato" + parametros,
            success: function (datos) {
                actualizar_dato.css("color", "green");
            }
        });
    });

});