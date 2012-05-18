//Ejecuta el ajax
function objetoAjax(){
    var xmlhttp=false;
    try {
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
           xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            xmlhttp = false;
          }
    }

    if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
        xmlhttp = new XMLHttpRequest();
    }
    return xmlhttp;
}
//Suma una visita a una entrada
function suma_visitas(id){
  ajax=objetoAjax();
  ajax.open("GET", "foro/ajax_suma_visita.php?id="+id,true);
  ajax.send(null)
}

//valida la publicacion de comentarios
function publicar(id){
	if (document.getElementById(id).value  == '')
	{ 
		alert('El comentario esta vacio');
		return false;
	}
        confirm('Quiere publicar este comentario');
}

//valida la publicacion de entradas
function publicar_entrada(id){
	var ide='nuevo'+id;
	var asunto='asunto'+id;
	var texto='texto'+id;
	if (document.getElementById(texto).value  == '' || document.getElementById(asunto).value  == '')
        {
                alert('Debe completar el Asunto y el Texto');
                return false;
        }
        confirm('Quiere publicar esta entrada');
	document.getElementById(ide).style.display='none';
	
}
//sistema de visibilidad y de ocultacion de los iconos cuando se abren los
//formularios para enviar las entradas.
function id_nueva(){
document.getElementById('nuevotop').style.display='inline';
document.getElementById('cerrar').style.display='inline';
document.getElementById('publicar').style.display='inline';
document.getElementById('nueva').style.display='none';
document.getElementById('nuevabottom').style.display='none';
document.getElementById('asunto').focus();
}
function id_cerrar(){
document.getElementById('nuevotop').style.display='none';
document.getElementById('nueva').style.display='inline';
document.getElementById('nuevabottom').style.display='inline';
document.getElementById('cerrar').style.display='none';
document.getElementById('publicar').style.display='none';
}

function id_nuevabottom(){
document.getElementById('nuevobottom').style.display='inline';
document.getElementById('cerrarbottom').style.display='inline';
document.getElementById('publicarbottom').style.display='inline';
document.getElementById('nuevabottom').style.display='none';
document.getElementById('nueva').style.display='none';
document.getElementById('asuntobottom').focus();
}

function id_cerrarbottom(){
document.getElementById('nuevobottom').style.display='none';
document.getElementById('nuevabottom').style.display='inline';
document.getElementById('nueva').style.display='inline';
document.getElementById('cerrarbottom').style.display='none';
document.getElementById('publicarbottom').style.display='none';
}
