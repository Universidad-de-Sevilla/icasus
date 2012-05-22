<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://forja.rediris.es/projects/icasus/)
// Archivo: proceso_editar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Modifica procesos existentes
//--------------------------------------------------------------------------------------------------- 

global $smarty;                   
global $basedatos;                
global $plantilla;                

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))          
{
        header('Location:index.php?page=proceso_listar');           
}

// Para empezar a hablar necesitamos el id del proceso              
if (isset($_REQUEST['id_proceso']) && isset($_REQUEST['id_entidad']))
{
        $id_proceso = sanitize($_REQUEST['id_proceso'],16);         
        $id_entidad = sanitize($_REQUEST['id_entidad'],16);         
        $entidad = new entidad($basedatos);
        $datos_entidad = $entidad->obtener_datos($id_entidad);      
        $smarty->assign('_nombre_pagina',$entidad->datos['nombre']);

        // Si vienen todos los datos necesarios del formulario grabamos
        if (isset($_POST['nombre']) && isset($_POST['codigo']))     
        {
                $proceso = new proceso();
                $proceso->load("id_proceso = $id_proceso");         
                $proceso->id_madre = sanitize($_POST['madre'],2);   
                $proceso->codigo = sanitize($_POST['codigo'],2);    
                $proceso->nombre = sanitize($_POST['nombre'],2);    
                $proceso->alcance = sanitize($_POST['alcance'],2);        
                $proceso->id_propietario = isset($_POST['id_propietario'])?sanitize($_POST['id_propietario'],16):null;
                
                if ($proceso->save())
                {
                        header("Location: index.php?page=proceso_listar&id_entidad=$id_entidad");
                }
                else
                {
                        $smarty->assign('error', $proceso->error); 
                        $smarty->assign('_nombre_pagina','Error');
                        $plantilla = 'error.tpl';
                }
        }
        // Si no vienen datos mostramos el formulario
        else
{
                $proceso = new proceso();
                $proceso->load_joined("id_proceso = $id_proceso");
                $smarty->assign('proceso', $proceso);
                $smarty->assign('entidad', $datos_entidad);
                $smarty->assign('usuarios', $entidad->listar_usuarios($id_entidad));
                $smarty->assign('process',$proceso->find('id_entidad='.$id_entidad));
                //print_r($proceso->find('id_entidad='.$id_entidad));
                $plantilla = "proceso_editar.tpl";
        }
}
else
{
        $error = 'Faltan parametros para editar un proceso';
        $smarty->assign('error', $error);
        $smarty->assign('_nombre_pagina' , 'Error');
        $plantilla = 'error.tpl';
}
?>

