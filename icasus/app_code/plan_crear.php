<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: plan_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista las Lineas del Plan Estrategico
//---------------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $operario;
global $nombre_pagina;
global $plantilla;


$smarty-> assign('plan',true);

//$id_entidad=$_GET['id_entidad'];
$tarea=$_GET['tarea'];

//Crear una linea nueva
if ($tarea == 'linea')
{
        if (isset($_POST["crearlinea"]) && $_POST["crearlinea"]=='crearlinea')
        {
        $id_entidad = sanitize($_GET['id_entidad'],2);
        $orden = sanitize($_POST["orden"],2);
        $estado = sanitize($_POST["estado"],2);
        $titulo = sanitize($_POST["titulo"],2);
        $descripcion = sanitize($_POST["descripcion"],2);
        $fechac=date('Y-m-d');
echo $orden.$estado.$titulo.$descripcion.$fechac.$id_entidad;
        //crear un objeto o instanciar la clase
        
        $linea = new linea();
        $linea->id_entidad=$id_entidad;
        $linea->idorden=$orden;
        $linea->estado=$estado;
        $linea->titulo=$titulo;
        $linea->descripcion=$descripcion;
        $linea->fechac=$fechac;
        $linea->fecham='0000-00-00';
        $linea->expediente='0';
        $adodb->execute("SET NAMES utf8");
        $linea->save();
        //leo el registro que acabo de insertar
        $linea->load('$id=$adodb->insert_id()');

        //lo paso a smarty
        $smarty->assign('lineacreada',$linea);
        $smarty->assign('okanuncio','Se ha insertado correctamente la Linea Estrat&eacute;gica');
//$smarty->assign('clinea',false);

//       $plantilla='okanuncio.tpl'; 
/*        }
        else
        {
//                $plantilla='plan_crear.tpl');
$smarty->assign('clinea',true);

       */ }
$smarty->assign('clinea',true);


}


//Crear un objetivo nuevo
if ($tarea == 'objetivo')
{

$smarty->assign('cobjetivo',true);

}


//Crear una accion nueva
if ($tarea == 'accion')
{

$smarty->assign('caccion',true);
}




//listado de las lineas
$listado=$adodb->getall('SELECT * FROM linea WHERE id_entidad='.$id_entidad);
$smarty->assign('linea',$listado);

//listado de los objetivos
$listado=$adodb->getall('SELECT * FROM objetivo WHERE id_entidad='.$id_entidad);
$smarty->assign('objetivo',$listado);

//listado de las acciones
$listado=$adodb->getall("SELECT linea.idorden AS lineaorden , objetivo.idorden AS objetivoorden, accion.idorden AS accionorden ,accion.titulo ,accion.fechac , accion.fecham , objetivo.id
FROM (accion LEFT JOIN objetivo ON accion.idobjetivo = objetivo.id) LEFT JOIN linea ON objetivo.idlinea = linea.id
WHERE (((accion.estado)=1)) AND accion.id_entidad='$id_entidad'  ORDER BY idlinea");
$smarty->assign('accion',$listado);



$plantilla = 'plan_crear.tpl';
?>

