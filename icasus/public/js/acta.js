function objetoAjax(){
    var xmlhttp=false;
    try {
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
           xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            xmlhttp = false;          }    }

    if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
        xmlhttp = new XMLHttpRequest();
    }   
    return xmlhttp;
}
//activacion de las pestañas del menu
function activarTAB(tab)
{
var tabs = ["acta", "convocatoria", "asunto", "asistente", "acuerdo", "tarea", "nota"];       
    for (i = 0;i<tabs.length;i++)
    {
        if ( tabs[i] != tab)
        {document.getElementById(tabs[i]).className = tabs[i];}
        else
        {document.getElementById(tabs[i]).className = tabs[i]+'-s';}
    }
}
//ejecuta y muestra los resultados en una ventana
function mostrarDIV(php,cadena,cajon)
{
	var ajax;
	ajax=objetoAjax();
	ajax.open("POST", "grupo/"+php,true);
	ajax.onreadystatechange=function() 
	{
		if (ajax.readyState==4) 
			{	
				document.getElementById(cajon).innerHTML = ajax.responseText;
					tinyMCE.init({
					mode:"exact",
					elements: "notas",
					theme : "advanced",
					theme_advanced_buttons1 :
				"mymenubutton,bold,italic,underline,separator,strikethrough,justifyleft,justifycenter,justifyright,justifyfull,bullist,numlist,undo,redo",
					theme_advanced_buttons2 : "",
					theme_advanced_buttons3 : "",
					theme_advanced_toolbar_location : "top",
					theme_advanced_toolbar_align : "left",
					content_css : "http://localhost/icasus/js/tiny_mce/themes/advanced/skins/default/editorstyles.css"
					});
			}	
		}
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send(cadena);
}
//marca las asistencias al acta
function marcar_asistencia(id_usuario,id_acta,asistencia)
{ 
	var ajax;
	ajax=objetoAjax();
	ajax.open("POST", "grupo/asistentes_marcar.php",true);
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	ajax.send("&id_usuario="+id_usuario+"&id_acta="+id_acta+"&asistencia="+asistencia);
}

