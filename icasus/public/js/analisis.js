//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/analisis.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero analisis.tpl
//----------------------------------------------------------------------------

//Selección del análisis y el plan por años
$('#anyo').change(function () {
    var anyo = $(this).val();
    var id_indicador = $(this).data('id_indicador');
    $("#analisis_plan").load("index.php?page=analisis_ajax&ajax=true&modulo=mostrar&id_indicador=" + id_indicador + "&anyo=" + anyo);
});

//Gestión de Análisis
$('#page-wrapper').on('click', '#editar_analisis', function () {
    var id_indicador = $(this).data('id_indicador');
    var anyo = $(this).data('anyo');
    $("#page-wrapper #analisis").load("index.php?page=analisis_ajax&ajax=true&modulo=editar_analisis&id_indicador=" + id_indicador + "&anyo=" + anyo);
});

$('#page-wrapper').on('click', '#grabar_analisis', function () {
    var id_indicador = $(this).data('id_indicador');
    var anyo = $(this).data('anyo');
    var texto = $('#page-wrapper #texto_analisis').val();
    $.ajax({
        url: "index.php?page=analisis_ajax&ajax=true&modulo=grabar_analisis&id_indicador=" + id_indicador + "&anyo=" + anyo + "&texto=" + texto,
        success: function () {
            $("#page-wrapper #analisis").load("index.php?page=analisis_ajax&ajax=true&modulo=cancelar_analisis&id_indicador=" + id_indicador + "&anyo=" + anyo);
        }
    });
});

$('#page-wrapper').on('click', '#cancelar_analisis', function () {
    var id_indicador = $(this).data('id_indicador');
    var anyo = $(this).data('anyo');
    $("#page-wrapper #analisis").load("index.php?page=analisis_ajax&ajax=true&modulo=cancelar_analisis&id_indicador=" + id_indicador + "&anyo=" + anyo);
});

//Gestión de Planes de acción
$('#page-wrapper').on('click', '#editar_plan', function () {
    var id_indicador = $(this).data('id_indicador');
    var anyo = $(this).data('anyo');
    $("#page-wrapper #plan").load("index.php?page=analisis_ajax&ajax=true&modulo=editar_plan&id_indicador=" + id_indicador + "&anyo=" + anyo);
});

$('#page-wrapper').on('click', '#grabar_plan', function () {
    var id_indicador = $(this).data('id_indicador');
    var anyo = $(this).data('anyo');
    var texto = $('#page-wrapper #texto_plan').val();
    $.ajax({
        url: "index.php?page=analisis_ajax&ajax=true&modulo=grabar_plan&id_indicador=" + id_indicador + "&anyo=" + anyo + "&texto=" + texto,
        success: function () {
            $("#page-wrapper #plan").load("index.php?page=analisis_ajax&ajax=true&modulo=cancelar_plan&id_indicador=" + id_indicador + "&anyo=" + anyo);
        }
    });
});

$('#page-wrapper').on('click', '#cancelar_plan', function () {
    var id_indicador = $(this).data('id_indicador');
    var anyo = $(this).data('anyo');
    $("#page-wrapper #plan").load("index.php?page=analisis_ajax&ajax=true&modulo=cancelar_plan&id_indicador=" + id_indicador + "&anyo=" + anyo);
});