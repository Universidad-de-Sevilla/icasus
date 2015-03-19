<?php

define('IC_VERSION', "2.12.3");
define('IC_FECHA_REVISION', "19/03/2015");

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
