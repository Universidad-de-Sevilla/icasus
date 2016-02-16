<?php

define('IC_VERSION', "3.6.5");
define('IC_FECHA_REVISION', "16/02/2016");

// 3.6.5 - 16/02/2016 - Generación de mediciones mejorada con la posibilidad de seleccionar el año de inicio.
// 3.6.4 - 11/02/2016 - Se permite borrar varias mediciones de una sola vez. Pequeños cambios en las interfaces de medicion_listar y valor_referencia_crear.
// 3.6.3 - 11/02/2016 - Se pueden borrar mediciones en indicadores/datos que influyen en el cálculo de otros, sólo si esas mediciones no existen en el indicador/dato dependiente.
// 3.6.2 - 10/02/2016 - Añadidas acciones típicas sobre indicadores al listado de indicadores de un proceso.
// 3.6.1 - 10/02/2016 - Añadida la posibilidad de crear indicadores para un proceso directamente desde su ficha.
// 3.6.0 - 09/02/2016 - Añadido botoń para actualizar valores en las mediciones de indicadores/datos calculados. Corregido problema con valores inactivos que permitián editarse, retirado tipo agregación manual en indicadores/datos calcualdos. Pequeños cambios de estilo en las interfaces de las mediciones.
// 3.5.2 - 08/02/2016 - Corregido, ahora también se actualizan los valores para indicadores/datos calculados también desde la página de edición de valores.
// 3.5.1 - 05/02/2016 - Corregidos permisos de cuadros de mando para que se tengan en cuenta los responsables de unidad.
// 3.5.0 - 05/02/2016 - Paneles de líneas y tablas de los cuadros de mando actualizables automáticamente mostrando una serie de años atrás desde la fecha actual y la posibilidad de editar este valor. Posibilidad de exportar datos de tablas_simples. Cambiado el mínimo del ancho de paneles a 3 para evitar conflictos con las datatables. Corregido fallo en los paneles tabla_multi cuando no existían las mediciones. Pequeños cambios de estilo.
// 3.4.9 - 03/02/2016 - Eliminada la tabla de series_tipo (no necesaria con los nuevos gráficos) y sus relaciones en la BD. Se ha modificado también el código de la api_publica para adaptarlo a los cambios.
// 3.4.8 - 29/01/2016 - Sólo los administradores de icasus pueden editar la sección de ayuda. Corregido fallo de comprobación de administrador en usuario_mostrar.
// 3.4.7 - 29/01/2016 - Cambios menores en las interfaces para mejorar la usabilidad.
// 3.4.6 - 29/01/2016 - Corregido el código de las clases entidad y pequeños cambios de interfaz.
// 3.4.5 - 28/01/2016 - Se incluye la unidad a la que pertenecen los procesos,indicadores/datos y cuadros de mando en mi Icasus. Corrección de errores en la página de control.
// 3.4.4 - 27/01/2016 - Incluida la categoría sobre la que se navega también en los botones de avances de todos los menús de navegación de la aplicación.
// 3.4.3 - 27/01/2016 - Mejorado listado de cuadros de una unidad incluyendo la gestión de cuadros de usuario.
// 3.4.2 - 27/01/2016 - Mejorado listado de datos de una unidad incluyendo la gestión de datos de usuario.
// 3.4.1 - 27/01/2016 - Mejorado listado de indicadores de una unidad incluyendo la gestión de indicadores de usuario.
// 3.4.0 - 27/01/2016 - Añadida gestión de mapas de procesos de las unidades, mejorado su listado, corregidos errores y otros cambios menores...
// 3.3.4 - 25/01/2016 - Avances en el resto de categorías de Icasus e indicador numérico de la posición.
// 3.3.3 - 22/01/2016 - Cuadros de mando integrados con las unidades de Icasus.
// 3.2.3 - 18/01/2016 - Gestión de la entidad principal de los usuarios permitiendo que éstos la modifiquen desde la propia aplicación.
// 3.1.3 - 15/01/2016 - Avance entre unidades. Enlaces externos a pestañas, otras correcciones...
// 3.1.2 - 12/01/2016 - Corregido error en la asignación de usuarios a una Unidad. Se indica ahora con un icono estrellado cual es la unidad principal del usuario.
// 3.1.1 - 11/01/2016 - Consultas avanzadas con Highcharts.
// 3.0.1 - 11/12/2015 - Cambios generales de estilo, presentación y navegación.
// 3.0.0 - 30/11/2015 - Migración a Bootstrap de la capa de presentación.
// 2.24.3 - 30/07/2015 - Correcciones en las gráficas y en las mediciones de Indicadores/Datos para calcular y mostrar correctamente el total cuando es una mediana.
// 2.24.2 - 27/07/2015 - Quitada la Unidad madre del cálculo agregado (no se puede asignar como subunidad en Indicadores/Datos de este tipo) sólo pueden asignarse subunidades. La Unidad madre en Indicadores/Datos agregados sólo aparece en la edición de mediciones para el caso de un cálculo con mediana.
// 2.24.1 - 19/07/2015 - Se han cambiado la fecha de fin de grabación por defecto cuando se generan las mediciones de Indicadores/Datos. 
// 2.24.0 - 13/07/2015 - Se controla que sólo se puedan grabar valores en una medición dentro de su plazo de grabación.
// 2.23.3 - 09/07/2015 - Corregido fallo: ya no se muestra el texto de aumentar gráfico en paneles métrica ya que no lo son.
// 2.23.2 - 08/07/2015 - La edición de las fechas de grabación de Indicadores/Datos sólo es editable por los responsables de Unidad.
// 2.23.1 - 08/07/2015 - Unidades con nombres de etiquetas en las fichas y en los formularios de crear/editar Indicadores/Datos.
// 2.23.0 - 08/07/2015 - Calculo totalmente automático para Indicadores/Datos calculados que se miden de forma distribuida.
// 2.22.0 - 07/07/2015 - Calculo totalmente automático para Indicadores/Datos calculados que se miden de forma centralizada.
// 2.21.1 - 01/07/2015 - Añadido placeholder explicativo para el caso de los Indicadores/Datos calculados.
// 2.21.0 - 01/07/2015 - Se añade una fila al final de la tabla de valores de una medicion que indica el total calculado de la misma en mediciones no centralizadas.
// 2.20.1 - 29/06/2015 - Correcciones a Highslide: gráficos se abren en mayor tamaño vertical, los gráficos de barras se pintan con los totales al ampliarse y se pueden abrir varias ventanas.
// 2.20.0 - 24/06/2015 - Añade popup de los gráficos a pantalla completa al hacer click sobre los mismos usando la librería Highslide. Se deshabilita el 3d de los gráficos pues es un recurso estético y da problemas con Highslide. Ahora también, los gráficos se descargan con su nombre por defecto.
// 2.19.3 - 24/06/2015 - Traducción del plugin exporting.js de Highcharts al español.
// 2.19.2 - 23/06/2015 - Correcciones en las páginas de ayuda (ya se pueden editar). Revisión del contenido y añadido de una leyenda para los iconos.
// 2.19.1 - 23/06/2015 - Muestra ordenados los listados de subunidades en las fichas de Indicadores/Datos. Borrado de ficheros innecesarios.
// 2.19.0 - 19/06/2015 - Muestra en la ficha de un Indicador/Dato los Indicadores/Datos en cuyo cálculo influye (si los hubiere).
// 2.18.2 - 18/06/2015 - Se valida que el Histórico de Indicadores/Datos no sea mayor al año actual.
// 2.18.1 - 18/06/2015 - Correcciones en criterios EFQM (movidos a la lógica de Indicadores), ahora se muestran correctamente y se borran los criterios asociados a un Indicador cuando éste también se elimina.
// 2.18.0 - 17/06/2015 - Establece valores mínimos y máximos para las mediciones de un Indicador/Dato y si existen dichos valores no se pueden asignar valores fuera de dicho intervalo.
// 2.17.0 - 11/06/2015 - Se ha añadido un campo para indicar como se calculará el total anual en Indicadores/Datos con periodicidades inferiores al año. 
// 2.16.0 - 08/06/2015 - Se ha añadido la periodicidad bienal.
// 2.15.24 - 08/06/2015 - Ahora se eliminan o crean valores para las subunidades en las mediciones de un Indicador/Dato cuando éstas se cambian.
// 2.15.23 - 05/06/2015 - Cuando cambiamos la Periodicidad de un Indicador/Dato se generan las Mediciones para ese año en función de la nueva Periodicidad establecida.
// 2.15.22 - 05/06/2015 - Cambios en la interfaz: se visualiza el rol del Usuario cuando estamos trabajando con una Unidad.
// 2.15.21 - 03/06/2015 - Se corrige fallo de validación del Histórico en los Datos. Se lanza un aviso cuando se cambia la Periodicidad de un Indicador/Dato para que el usuario quede al tanto y ajuste las Mediciones.
// 2.15.20 - 03/06/2015 - Se corrigen fallos  a la hora de mostrar un color asociado al valor de una medición y sólo se asignan colores para valores no agregados.
// 2.15.19 - 29/05/2015 - Activa o desactiva las subunidades en las mediciones de un Indicador/Dato cuando se cambian.
// 2.15.18 - 28/05/2015 - Se valida que el Histórico de los Indicadores/Datos comience en 2008 o después.
// 2.15.17 - 28/05/2015 - Se valida en la creación/edición de Indicadores/Datos que al menos se vincule una Unidad al Indicador/Dato.
// 2.15.16 - 27/05/2015 - Muestra el identificador(ID) en las fichas de Indicadores y Datos pues es necesario para el cálculo.
// 2.15.15 - 27/05/2015 - Cuando se borra un Indicador/Dato se borran también las Unidades vinculadas al mismo.
// 2.15.14 - 26/05/2015 - Movido a la Lógica de Indicadores/Datos el borrado de mediciones y corregidos errores de código. Además, cuando se borra un Indicador/Dato no se puede si existen otros que dependan de el. Permite borrar calculados siempre y cuando otros Indicadores/Datos no dependan de él.
// 2.15.13 - 26/05/2015 - Cuando se crea un Indicador/Dato también se generan automáticamente sus mediciones a partir de su Histórico.
// 2.15.12 - 25/05/2015 - Se han retirado algunos campos de las fichas de Indicadores/Datos y se ha corregido error por el cual no se mostraba el valor de la Unidad Generadora en la edición de Indicadores.
// 2.15.11 - 25/05/2015 - Añadido el campo Histórico y Responsable de Medición a los listados de Indicadores/Datos (corregido enlace a Usuarios en el listado de Datos).
// 2.15.10 - 22/05/2015 - Se generan las Mediciones de Indicadores/Datos a partir de su Histórico y hasta el año actual inclusive.
// 2.15.9 - 21/05/2015 - En Indicadores/Datos calculados además de indicarse que es calculado, se incluye un listado de enlaces a los Indicadores/Datos que influyen en su cálculo.
// 2.15.8 - 20/05/2015 - Añadido el campo Fuente de Información a la creación/edición de Datos que estaba pendiente. Añadidos placeholders a los campos Fuente de Información y Fuente de Datos en la creación/edición de Indicadores/Datos.
// 2.15.7 - 20/05/2015 - Se han movido los campos Histórico y Cálculo a la primera pestaña de creación/edición de Indicadores/Datos. Se valida la existencia del Histórico y se añade la validación del responsable en la creación/edición de Datos que estaba pendiente.
// 2.15.6 - 20/05/2015 - Se ha quitado el campo Indicadores/Datos relacionados no es necesario ya que éstos se ven en el cálculo del Indicador/Dato si lo hubiere.
// 2.15.5 - 19/05/2015 - La generación de mediciones también genera mediciones para los Indicadores/Datos cuyo cálculo dependa del mismo.
// 2.15.4 - 07/05/2015 - Al editar el tipo de agregación de un indicador/dato ya se guarda correctamente y se modifican las mediciones (según la periodicidad) creando valores para las subunidades.
// 2.15.3 - 06/05/2015 - Muestra todos los tipos de agregación de manera correcta en la creación/edición de Indicadores/Datos y requiere un tipo de medición para evitar errores de validación.
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
