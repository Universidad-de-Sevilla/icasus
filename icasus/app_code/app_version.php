<?php

define('IC_VERSION', "2.15.2");
define('IC_FECHA_REVISION', "06/05/2015");

// 2.15.2 - 06/05/2015 - Muestra ordenada y correctamente las periodicidades de Indicadores/Datos tanto en su creación como en su edición.
// 2.15.1 - 06/05/2015 - Añade la columna identificador en los listados de Indicadores/Datos también indica si son calculados y su fórmula.
// 2.15.0 - 04/05/2015 - Sustituye la función agregar medición por generar mediciones de manera automática (primera versión: no tiene en cuenta Indicadores/Datos calculados). 
// 2.14.4 - 30/04/2015 - Se guardan en una tabla las dependencias de aquellos indicadores/datos cuyo cálculo depende de otros. Esto facilitará posteriormente el cálculo automático. 
// 2.14.3 - 23/04/2015 - Se ocultan las opciones de edición en las mediciones para los indicadores/datos calculados.
// 2.14.2 - 23/04/2015 - Muestra el aviso de cálculo automático en la cabecera de los indicadores/datos y también en sus mediciones. 
// 2.14.1 - 20/04/2015 - Corregido: en la edición de mediciones no se actualizaba el título de la página al cambiar la etiqueta de una medición.
// 2.14.0 - 17/04/2015 - Revisión mejorada de los permisos de la aplicación (incluye superadmin, herencia...).
// 2.13.29 - 14/04/2015 - Cuadro de mando datos Rebiun mejorado (buscador...).
// 2.13.28 - 10/04/2015 - Añadido scroll horizontal a la tabla de edición de valores. Cambios en fichas de procesos.
// 2.13.27 - 09/04/2015 - Cuadro de mando de datos Rebiun.
// 2.13.26 - 08/04/2015 - Corrige fallo por el cual no se mostraba el status en las mediciones al querer editar un valor.
// 2.13.25 - 01/04/2015 - Añadidos iconos a los listados. Pequeños cambios generales de interfaz.
// 2.13.24 - 01/04/2015 - Corregidos títulos de las páginas (muestran su nombre y el del dato/indicador): medicion_responsable y valor_referencia_crear.
// 2.13.23 - 01/04/2015 - Columna de Acciones en el listado de Datos.
// 2.13.22 - 27/03/2015 - Añadido campo observaciones a los datos.
// 2.13.21 - 27/03/2015 - Columna de Acciones en el listado de Indicadores.
// 2.13.20 - 27/03/2015 - Corregido fallo por el cual, si habia error de permisos no se tenia en cuenta si estábamos en un dato cuando editábamos valores y el responsable de medición.
// 2.13.19 - 26/03/2015 - No se accede a la opcion responsable de medicion en los indicadores a menos que se tenga control del mismo. También se recoge el id_entidad en las ediciones.
// 2.13.18 - 26/03/2015 - Añadido campo observaciones a los indicadores.
// 2.13.17 - 26/03/2015 - Añadida la columna Acciones al listado de procesos.
// 2.13.16 - 26/03/2015 - Añadido campo observaciones a los procesos. Corregido fallo al grabar no se recogia el id_entidad.
// 2.13.15 - 24/03/2015 - Tamaño fijo para la columna de acciones de las unidades.
// 2.13.14 - 24/03/2015 - Controla que no se pinten gráficas si existen mediciones sin valores.
// 2.13.13 - 24/03/2015 - Cambios en la interfaz de responsable de medición.
// 2.13.12 - 24/03/2015 - Corregido problema versión servidor php arrays en medicion_listar.php. Pequeños cambios de interfaz.
// 2.13.11 - 23/03/2015 - Muestra periodicidad en los listados de indicadores y datos.
// 2.13.10 - 23/03/2015 - Cambios en la interfaz de dato_mostrar, se muestra la opción de crear datos para los usuarios con privilegios,...
// 2.13.9 - 23/03/2015 - Quitado campo identificador del listado de datos.
// 2.13.8 - 23/03/2015 - Corregido fallo, ahora se muestra el menu de unidad en la gestión de valores de referencia de un indicador/dato.
// 2.13.7 - 23/03/2015 - Cambios en la interfaz de indicador_mostrar, se muestra la opción de crear indicadores para los usuarios con priviliegios,...
// 2.13.6 - 23/03/2015 - Corregido fallo, ahora se muestra el menu de unidad en la gestión de archivos de un proceso.
// 2.13.5 - 23/03/2015 - Cambios en la interfaz de proceso_mostrar (opción crear proceso).
// 2.13.4 - 23/03/2015 - Cambios en la interfaz del listado de procesos.
// 2.13.3 - 23/03/2015 - Cambios en la interfaz del listado de cuadros de mando.
// 2.13.2 - 23/03/2015 - Añadidas las columnas tipo de proceso y proceso madre al listado de procesos.
// 2.13.1 - 23/03/2015 - Sustituido el campo Acciones en las tablas por iconos en vez de texto.
// 2.13.0 - 23/03/2015 - Control del Status de los Valores mediante códigos de colores.
// 2.12.4 - 20/03/2015 - Colores fijos para los indicadores de los cuadros de mando.
// 2.12.3 - 19/03/2015 - Revisado el acceso a ciertas funciones según los permisos.
// 2.12.2 - 19/03/2015 - Fallos en la gestión de archivos de un proceso corregidos. Ahora funciona bien.
// 2.12.1 - 18/03/2015 - Corregido problema al grabar valores nulos y actualización automática del gráfico de tarta en las mediciones.
// 2.12.0 - 18/03/2015 - Borrado de Valores de Referencia.
// 2.11.0 - 16/03/2015 - Control mejorado.
// 2.10.7 - 16/03/2015 - Corrige error al grabar los datos de indicadores y datos (tipo agregación)
// 2.10.6 - 12/03/2015 - Permisos revisados en la edición de valores de una medición.
// 2.10.5 - 11/03/2015 - Revisiones código Javascript y PHP.
// 2.10.4 - 05/03/2015 - Código Javascript separado de código html.
// 2.10.3 - 03/03/2015 - Gráficos de tarta en edición de mediciones.
// 2.10.2 - 02/03/2015 - Colores especifícos para cada valor de referencia en gráficas.
// 2.10.1 - 26/02/2015 - Gráficos 3D.
// 2.10.0 - 26/02/2015 - Gráficos cuadros de mando con Highcharts.  
// 2.9.9 - 10/02/2015 - Corregido problema en las mediciones: ahora se muestran todos los valores de referencia
// 2.9.8 - 06/02/2015 - Añadido campo observaciones a las mediciones.
// 2.9.7 - 03/02/2015 - Formato de fecha español en los gráficos.
// 2.9.6 - 29/01/2015 - Varios añadidos: borrado de cuadros de mando, paneles, avence de mediciones mejorado, actualización de Highcharts...
// 2.9.5 - 25/01/2015 - Edición de paneles, cambios en interfaz y avance de mediciones.
// 2.9.4 - 23/01/2015 - Adaptaciones, correcciones de algunos gráficos con Highcharts.
// 2.9.3 - 22/01/2015 - Adaptaciones, correcciones de algunos gráficos con Highcharts.
// 2.9.2 - 15/01/2015 - Cambios en la interfaz de Ficha Unidad. Muestra rol de los usuarios cuando se vayan a desasignar de una Unidad.
// 2.9.1 - 22/12/2014 - Control de indicadores/datos sin mediciones. Cambios en la interfaz.
// 2.9.0 - 22/12/2014 - Mejoras en la usabilidad de la aplicación.
// 2.8.7 - 02/12/2014 - Filtrados todos los campos de las peticiones GET y POST con las funciones que proporciona PHP 
// 2.8.6 - 14/11/2014 - Todas las cadenas de textos pasadas a constantes 
// 2.8.5 - 04/11/2014 - Refactorizadas todas las clases PHP a nombres con mayúsculas
// 2.8.4 - 28/10/2014 - Nueva plantilla autocontenida
// 2.8.3 - 27/10/2014 - Corrige errores y muestra versión en pie. Corrige errores en edición de datos e indicadores (#787 y #2725)
// 2.8.2 - 15/10/2014 - Muestra correctamente el tipo de agregación (cálculo del total) de indicadores y datos
// 2.8.1 - 17/09/2014 - Agrupa las gráficas en mediciones_mostrar
// 2.8.0 - 31/07/2014 - Implementa Highchart para representar los gráficos con javascript, corrige errores en valores de referencia y permisos
// 2.7.4 - 06/06/2014 - Corrige error al mostrar valores de referencia en gráficas, atenua su color para distinguirlos de indicadores
// 2.7.3 - 04/06/2014 - Permite crear valores de referencia en datos, corrige error id_unidad en url
// 2.7.2 - 26/05/2014 - Permite rellenar campo 'Históricos' en datos, redondeo a dos decimales en salida, operador % funcionando en consulta avanzada
// 2.7.1 - 29/04/2014 - Corrige un fallo grave al tomar los operadores de agregado de los indicadores que forman parte de indicadores calculados
// 2.7.0 - 28/04/2014 - Los totales de los indicadores calculados se calculan ahora desde los datos de origen
// 2.6.6 - 01/04/2014 - Tablas con múltiples indicadores y pantalla inicio con mediciones pendientes
// 2.6.5 - 06/03/2014 - Nuevo campo etiqueta_mini agregado a consultas API y cambio en color de fondo de dataTables
// 2.6.4 - 24/02/2014 - Falso cálculo de mediana y algún errorcillo suelto
// 2.6.3 - 18/11/2013 - Valores de referencia en cuadros de mando
// 2.6.2 - 15/11/2013 - Valores de referencia en gráficos de indicador y mediciones
// 2.6.1 - 11/11/2013 - Faltaban los gráficos de la ficha de dato y de la de medición
// 2.6.0 - 11/11/2013 - Los gráficos de los indicadores van con flot y se pintan mediciones anuales e intraanuales si las hay
// 2.5.6 - Creación de paneles de barra mejorada
// 2.5.5 - Cambio de los paneles de barra para que muestren subunidades, cambios en permisos sobre mediciones
// 2.5.4 - Mejoras sustanciales en series temporales cuadros de mando
// 2.5.3 - Error: no grababa equipo_de_proceso en ficha de procesos
// 2.5.2 - Error: no grababa variable_control en ficha de procesos
// 2.5.1 - Corregido error en tratamiento fichero CSV
// 2.5.0 - Importación de datos desde ficheros CSV
