//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/index.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero index.tpl
//----------------------------------------------------------------------------

//MetisMenu
//$(function () {
//    $('#side-menu').metisMenu();
//});

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function () {
    $(window).bind("load resize", function () {
        topOffset = 50;
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
        } else {
            $('div.navbar-collapse').removeClass('collapse');
        }

        height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
        height = height - topOffset;
        if (height < 1)
            height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
        }
    });

    var url = window.location;
    var element = $('ul.nav a').filter(function () {
        return this.href == url || url.href.indexOf(this.href) == 0;
    }).addClass('active').parent().parent().addClass('in').parent();
    if (element.is('li')) {
        element.addClass('active');
    }
});

//Menu toggle
$("#menu-toggle").click(function (e) {
    e.preventDefault();
    $("#page-wrapper").toggleClass("toggled");
    $(".sidebar").toggleClass("toggled");
    $(".fa-stack").toggleClass("fa-lg");
    $("#links").toggleClass("toggled");
    $(".texto-menu").toggleClass("toggled");

    var icono = $("#toggle-icon");
    if (icono.hasClass('fa-chevron-right')) {
        icono.removeClass('fa-chevron-right');
        icono.addClass('fa-chevron-left');
        $("#menu-toggle").addClass('pull-right');
    }
    else {
        icono.removeClass('fa-chevron-left');
        $("#menu-toggle").removeClass('pull-right');
        icono.addClass('fa-chevron-right');
    }
});

//Collapsible panels
jQuery(function ($) {
    $('.panel-heading i.clickable').on("click", function (e) {
        if ($(this).hasClass('panel-collapsed')) {
            // expand the panel
            $(this).parents('.panel').find('.panel-body').slideDown();
            $(this).removeClass('panel-collapsed');
            $(this).removeClass('fa-chevron-down').addClass('fa-chevron-up');
        }
        else {
            // collapse the panel
            $(this).parents('.panel').find('.panel-body').slideUp();
            $(this).addClass('panel-collapsed');
            $(this).removeClass('fa-chevron-up').addClass('fa-chevron-down');
        }
    });
});

// Back to Top
// Only enable if the document has a long scroll bar
// Note the window height + offset
if (($(window).height() + 100) < $(document).height()) {
    $('#top-link-block').removeClass('hidden').affix({
        // how far to scroll down before link "slides" into view
        offset: {top: 100}
    });
}

//Datatables
$(document).ready(function () {
    $('.datatable').DataTable({
        "pagingType": "full_numbers"
    });
});

//Map Responsive
$(document).ready(function () {
    $('img[usemap]').rwdImageMaps();
});

//Chosen selects (añade búsqueda a los html select)
$(".chosen-select").chosen({
    disable_search_threshold: 10,
    no_results_text: "Oops, no se encuentran registros coincidentes"
});