<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: lang_es.php
// Desarrolladores:Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
/* Este fichero contiene constantes para todos los textos de la aplicación Icasus en español:
 * Clasificación:
 * TXT_[Nombre]--> Textos en general
 * FIELD_[Nombre]--> Campos de las tablas
 * MSG_[Nombre]--> Avisos/Notificaciones
 * ERR_[Nombre]--> Errores
 */

//---------------------------------------------------------------------------------
//TEXTOS: TXT_[Nombre]
//---------------------------------------------------------------------------------

define('TXT_ICASUS', 'icasus');
define('TXT_APP_WEB', 'icasus3.us.es');
define('TXT_APP_DESCRIPCION', 'Indicadores de Calidad de los Servicios de la Universidad de Sevilla');
define('TXT_DEPARTAMENTOS', 'Departamentos');
define('TXT_BIBLIOTECAS', 'Bibliotecas');
define('TXT_DEFINICION', 'Definición');
define('TXT_CONTROL', 'Control');
define('TXT_NO_ASIG', 'No asignado');
define('TXT_CONTENIDO', 'Contenido de');
define('TXT_INTRO_TEXTO', 'Introduce texto');
define('TXT_REP_GRAFIC', 'Gráficas');
define('TXT_ASCENDENTE', 'Ascendente');
define('TXT_DESCENDENTE', 'Descendente');
define('TXT_DEPENDE', 'Su cálculo depende de los siguientes indicadores/datos:');
define('TXT_INFLUYE', 'Influye en el cálculo de los siguientes indicadores/datos:');
define('TXT_ENVIAR_CORREO', 'Enviar E-mail');
define('TXT_LLAMAR_TLF', 'Llamar al teléfono');
define('TXT_INVITADO', 'Invitado');
define('TXT_MANTENIMIENTO', 'Estamos realizando tareas de mantenimiento. Los servicios estarán disponibles lo antes posible, rogamos disculpen las molestias.');
define('TXT_BUSCAR_RESUL', 'Resultados de la búsqueda: ');
define('TXT_RESUMEN', 'Resumen');
define('TXT_RESET', 'Reset');
define('TXT_RESUL', 'Resultado');
define('TXT_FICHA', 'Ficha');

//Análisis de indicadores
define('TXT_ANALISIS', 'Análisis');
define('TXT_ANALISIS_DESC', 'Análisis: para el año seleccionado comente los resultados obtenidos en años anteriores.');
define('TXT_PLAN_ACCION', 'Plan de acción');
define('TXT_TABLA_ANAPLAN', 'Análisis y Planes de acción / Año');

//Archivos
define('TXT_ARCHIVOS', 'Archivos');
define('TXT_ARCHIVO_SUBIR', 'Subir archivo');
define('TXT_ARCHIVO_ACTUALIZAR_DATOS', 'Actualizar datos del archivo');
define('TXT_ARCHIVO_BORRAR', 'Borrar archivo');
define('TXT_ARCHIVOS_GESTION', 'Gestión de archivos');
define('TXT_ARCHIVO_SEL_IMPORT', 'Elija un archivo para importar');
define('TXT_ARCHIVO_PROCESAR', 'Procesa archivo');
define('TXT_ARCHIVOS_PROCESAR', 'Procesar archivos');
define('TXT_ARCHIVO_DESCARGA', 'Descargar archivo');
define('TXT_ARCHIVO_IMPORT_CSV', 'Importar archivo CSV');

//Clasificación
define('TXT_POR_MEDICION', 'Por medición');
define('TXT_POR_ANYO', 'Por año');

//Consulta
define('TXT_CONSULT', 'Consulta avanzada');
define('TXT_CONSULT_INFO', 'Para realizar la consulta busque e incluya los indicadores/datos que desee. Puede añadir hasta un máximo de 5 operandos a la consulta.');
define('TXT_CONSULT_PARAM', 'Parámetros de la consulta');
define('TXT_CONSULT_OPERAND', 'Indicador operando');
define('TXT_CONSULT_OPER', 'Operador');
define('TXT_CONSULT_INCLUIR', 'Incluir/cambiar operando de la consulta');
define('TXT_CONSULT_QUITAR', 'Retirar último operando de la consulta');
define('TXT_CONSULT_RESUL', 'Resultados de la consulta');
define('TXT_CONSULT_BUSCAR', 'Buscar indicador');

//Cuadros de Mando
define('TXT_CUADRO_CREAR', 'Crear cuadro de mando');
define('TXT_CUADRO_EDIT', 'Editar cuadro de mando');
define('TXT_CUADRO_BORRAR', 'Borrar cuadro de mando');
//Paneles de los Cuadros de Mando
define('TXT_PANEL_CREAR', 'Crear panel');
define('TXT_PANEL_TIPO', 'Tipo de panel');
define('TXT_PANEL_BORRAR', 'Borrar panel');
define('TXT_PANEL_EDITAR', 'Editar panel');
define('TXT_PANEL_NORMAL', 'Normal');
define('TXT_PANEL_GRANDE', 'Grande');
define('TXT_PANEL_DATOS', 'Datos del panel');
define('TXT_PANEL_VENTANA', 'Ventana de tiempo');
define('TXT_PANEL_VENTANA_DESC', 'Establece una ventana temporal para el panel. - Variable: periodo variable, finaliza en el año actual y comienza en un número fijo de años hacia atrás. - Fija: periodo fijo, con un año de inicio y otro de fin. ');
define('TXT_PANEL_VENTANA_FIJA', 'Fija');
define('TXT_PANEL_VENTANA_VAR', 'Variable');
define('TXT_PANEL_INDICS', 'Indicadores del panel');
define('TXT_PANEL_INCLUIR', 'Añadir indicador al panel');

//Datos;
define('TXT_DATOS_REBIUN', 'Datos Rebiun');
define('TXT_DATOS_REBIUN_RECOGIDA', 'Recogida de Datos Rebiun');

//Entidades (Unidades)
define('TXT_UNID', 'Unidad');
define('TXT_UNID_ASIG_PRINCIPAL', 'Convertir en unidad principal: al iniciar sesión accederá directamente a la ficha de esta unidad (sólo se puede asignar una unidad como principal).');
define('TXT_UNID_PRINCIPAL', 'Unidad principal: al iniciar sesión accederá directamente a la ficha de esta unidad.');
define('TXT_UNID_EDIT', 'Editar unidad');
define('TXT_UNIDS_MEDS_INDIC', 'Unidades con mediciones en el indicador');
define('TXT_ETIQUETA_MINI_DESCRIPCION', 'Indica como aparece el nombre de la unidad en las gráficas');
define('TXT_ORGANICA_DESCRIPCION', 'Sólo aparecen en los listados las unidades orgánicas');

//Indicadores
define('TXT_INDIC_IR', 'Ir al indicador/dato');
define('TXT_INDIC_CREAR', 'Crear indicador');
define('TXT_INDIC_EDIT', 'Editar indicador');
define('TXT_INDIC_BORRAR', 'Borrar indicador');
define('TXT_INDIC_NO_PROC', 'Sin proceso asociado');
define('TXT_INDIC_ARCHIVAR', 'Archivar indicador');
define('TXT_INDIC_ARCHIVADO', 'Indicador archivado: este indicador ya no está en uso.');
define('TXT_INDIC_ARCHIVADOS', 'Indicadores archivados');
define('TXT_INDIC_RESTAURAR', 'Restaurar indicador');
define('TXT_INDICS_MIO', 'Mis indicadores');
define('TXT_INDIC_DAT', 'Datos del indicador');
define('TXT_INDIC_CONFIRM_ASIG_MED', 'Por favor, confirme si desea asignar esta medición.');
define('TXT_INDIC_ACT_MED', 'Indique si además quiere activarla: ');
define('TXT_INDIC_DAT_DEPENDIENTES', 'Indicadores/datos dependientes');
define('TXT_INDIC_DAT_CALCULADO', 'Calculado automáticamente');
//Control
define('TXT_INDIC_DAT_MED_NULA_AGRUPADOS', 'Mediciones nulas');
define('TXT_INDIC_DAT_MED_NULA', 'Medición nula/Subunidad');
define('TXT_INDIC_DAT_ULTIMA_MOD', 'Última modificación');
define('TXT_INDIC_DAT_SIN_MED', 'Sin mediciones');

//Login
define('TXT_BIENVENIDO', 'Bienvenido a');
define('TXT_LOGIN', 'Iniciar sesión');
define('TXT_LOGIN_PARTE1', 'es una aplicación web para la gestión de la calidad en la');
define('TXT_LOGIN_PARTE2', 'Para acceder al sistema es necesario ser miembro activo de alguno de los grupos de calidad de la Universidad de Sevilla y solicitar autorización de acceso al responsable de su grupo de calidad.');
define('TXT_LOGIN_PARTE3', 'ha sido desarrollado por el');
define('TXT_LOGIN_PARTE4', 'y puede utilizarse como');
define('TXT_LOGIN_PARTE5', 'Puede bajar una primera versión del');
define('TXT_LOGIN_PARTE6', 'en formato .PDF (revisión disponible: 26 mayo 2010).');
define('TXT_AREA_REC_HUM', 'Área de Recursos Humanos de la Universidad de Sevilla');
define('TXT_SOFT_LIBRE', 'Software Libre');
define('TXT_IC_MANUAL', 'Manual de referencia rápida de Icasus');

//Mediciones
define('TXT_MED_UNICA', 'Medición única en la unidad actual.');
define('TXT_MED_VER', 'Ver/Editar medición');
define('TXT_MED_AGRED', 'Medición agregada en subunidades y cumplimentada por los responsables de las subunidades, o la persona delegada.');
define('TXT_MED_AGRED_CEN', 'Medición agregada en subunidades y cumplimentada de manera centralizada por el responsable de medición del indicador.');
define('TXT_MED_BORRAR', 'Borrar medición');
define('TXT_MED_ACT_TODAS', 'Activar todas las mediciones.');
define('TXT_MED_DESACT_TODAS', ' Desactivar todas las mediciones.');
define('TXT_MED_ASIG', ' Asignar la medición.');
define('TXT_MED_CREAR', 'Crear medición/es');
define('TXT_MED_CARGAR', 'Cargar medición/es');
define('TXT_MED_TABLA', 'Tabla de mediciones');
define('TXT_MED_ULTIMA', 'Última medición');
define('TXT_MEDS_BORRAR', 'Borrar mediciones');
define('TXT_MED_RESP_SEL', 'Elegir nuevo responsable de medición ...');

//Menú Principal
define('TXT_INICIO', 'Mi icasus');
define('TXT_UNIDS_US', 'Unidades US');
define('TXT_PROCS_US', 'Procesos US');
define('TXT_INDICS_US', 'Indicadores US');
define('TXT_DATOS_US', 'Datos US');
define('TXT_CUADROS_MANDO_US', 'Cuadros de mando US');
define('TXT_USERS_US', 'Usuarios US');
define('TXT_USERS', 'Usuarios');
define('TXT_AYUDA', 'Ayuda');
define('TXT_UNIVERSIDAD', 'Universidad de Sevilla');
//Menú de Usuario
define('TXT_USER_PERFIL', 'Perfil de usuario');
define('TXT_CERRAR_SESION', 'Cerrar sesión');
//Menú de Unidades
define('TXT_INICIO_DESCRIPCION', 'Mi icasus: listado de sus competencias/responsabilidades.');
define('TXT_PLANES_DESCRIPCION', 'Planes estratégicos: listado de planes estratégicos de la unidad y gestión de los mismos.');
define('TXT_PROCS_DESCRIPCION', 'Procesos: listado de procesos de la unidad y gestión de los mismos. ');
define('TXT_INDICS_DESCRIPCION', 'Indicadores: listado de indicadores de la unidad y gestión de los mismos.');
define('TXT_CUADRO_MANDO_DESCRIPCION', 'Cuadros de mando: listado de cuadros de mando de la unidad y gestión de los mismos.');
define('TXT_CONSULTA_DESCRIPCION', 'Consulta: efectuar consultas y operaciones que muestran información sobre los indicadores y datos de la unidad.');
define('TXT_CONTROL_DESCRIPCION', 'Control: controle las mediciones y valores de los distintos indicadores y datos de la unidad bajo su responsabilidad.');

//Navegación
define('TXT_MOSTRANDO', 'Mostrando');
define('TXT_MOSTRAR_RESUL', 'Mostrar resultado');
define('TXT_MOSTAR_OCULTAR_NAV', 'Mostrar/Ocultar navegación');
define('TXT_REGS_TODOS', 'Todos los registros');
define('TXT_DESDE', 'desde');
define('TXT_VER', 'Ver');
define('TXT_SI', 'Si');
define('TXT_NO', 'No');
define('TXT_PASO', 'Paso');
define('TXT_PRIMER', 'Primer/a');
define('TXT_ULTIMO', 'Último/a');
define('TXT_SIG', 'Siguiente');
define('TXT_ANT', 'Anterior');
define('TXT_DE', 'de');
define('TXT_EDIT', 'Editar');
define('TXT_BORRAR', 'Borrar');
define('TXT_DESACT', 'Desactivar');
define('TXT_CERRAR', 'Cerrar');
define('TXT_MARCAR', 'Marcar todos');
define('TXT_DESMARCAR', 'Desmarcar todos');
define('TXT_SEL', 'Seleccionar');
define('TXT_SEL_TODOS', 'Seleccionar todos');
define('TXT_DESEL_TODOS', 'Deseleccionar todos');
define('TXT_SEL_UNO', 'Seleccionar uno');
define('TXT_ELEG_UNO', 'Elegir uno si procede');
define('TXT_VOLVER_ARRIBA', 'Volver arriba');
define('TXT_VOLVER_INDICE', 'Volver al índice');

//Páginas
define('TXT_PAG', 'Página');
define('TXT_PAG_CREAR', 'Crear página');
define('TXT_PAG_EDIT', 'Editar página');

//Planes Estratégicos
define('TXT_PLANES_US', 'Planes estratégicos US');
define('TXT_PLAN_CREAR', 'Crear plan estratégico');
define('TXT_PLAN_EDIT', 'Editar plan estratégico');
define('TXT_PLAN_BORRAR', 'Borrar plan estratégico');

//Líneas Estratégicas
define('TXT_LINEA_CREAR', 'Crear línea estratégica');
define('TXT_LINEA_EDIT', 'Editar línea estratégica');
define('TXT_LINEA_BORRAR', 'Borrar línea estratégica');

//Objetivos Estratégicos
define('TXT_OBJEST_CREAR', 'Crear objetivo estratégico');
define('TXT_OBJEST_EDIT', 'Editar objetivo estratégico');
define('TXT_OBJEST_BORRAR', 'Borrar objetivo estratégico');

//Objetivos Operacionales
define('TXT_OBJOP_CREAR', 'Crear objetivo operacional');
define('TXT_OBJOP_EDIT', 'Editar objetivo operacional');
define('TXT_OBJOP_BORRAR', 'Borrar objetivo operacional');
define('TXT_OBJOP_TIPO', 'Tipo de objetivo operacional');
define('TXT_OBJOP_PROPIO', 'Propio');
define('TXT_OBJOP_DESC', 'Descendente');

//Procesos
define('TXT_PROC_VER', 'Ver proceso');
define('TXT_PROC_MAP', 'Mapa de procesos');
define('TXT_PROC_CUADRO', 'Sin cuadro de mando asociado (opcional: seleccione un cuadro del desplegable).');
define('TXT_PROC_MAP_EDIT', 'Agregar/editar mapa de procesos');
define('TXT_PROC_ES_MADRE', 'Es un proceso madre');
define('TXT_PROC_VERSION', 'Número de la versión actual de la ficha del proceso');
define('TXT_PROC_EDIT', 'Editar proceso');
define('TXT_PROC_CREAR', 'Crear proceso');
define('TXT_PROC_BORRAR', 'Borrar proceso');
define('TXT_PROC_FLUJO', 'Flujograma');

//Propiedades
define('TXT_OTRAS_PROP', 'Otras propiedades');

//Propiedades HTML: Titles, placeholders, values de botones...
define('TXT_CODIGO', 'Único, fácil de recordar, en mayúsculas y sin espacios');
define('TXT_PESO', 'El peso [0.01,1] indica la importancia del objetivo operacional dentro del objetivo estratégico al que pertenece. Influye por tanto en el grado de ejecución de éste.');
define('TXT_ESTA', 'Está aquí');
define('TXT_CALCULO_TOTAL', 'Determina cómo se calcula el total entre todas las subunidades');
define('TXT_CALCULO_TOTAL_ANUAL', 'Determina cómo se calcula el total anual entre todos los periodos');
define('TXT_GRABAR', 'Grabar');
define('TXT_CANCEL', 'Cancelar');
define('TXT_EXAMINAR', 'Examinar...');
define('TXT_NO_ARCHIVO_SEL', 'No se ha seleccionado ningún archivo.');
define('TXT_BTN_ACEPTAR', 'Aceptar');
define('TXT_BTN_GUARDAR', 'Guardar');
define('TXT_SOLO_INDIC_CALC', 'Sólo si el valor del indicador/dato es calculado automáticamente (en función del valor de otros indicadores/datos). Deberá indicar una fórmula para el cálculo del mismo.');
define('TXT_FORMULA', "Indique la fórmula para el cálculo, la sintaxis para referirse a indicadores/datos es la siguiente: [ID del indicador/dato]. Ejemplo: [1]+[2], el resultado será la suma del valor de indicador/dato con ID=1 más el indicador/dato con ID=2. IMPORTANTE: La periodicidad debe ser la misma para todos los indicadores/datos implicados, de lo contrario no será posible el cálculo.");
define('TXT_FUENTE_INFO', 'Conceptos, ideas, normativas... por las cuales surge el indicador/dato.');
define('TXT_FUENTE_DAT', 'Documentos, aplicaciones u otras fuentes... de donde se obtienen los valores para el indicador/dato.');
define('TXT_BUSCAR', 'Buscar...');
define('TXT_VAL_INSERT', 'Introduzca un número (dentro del intervalo si existe), dejar en blanco para valor nulo.');
define('TXT_FECHA_REV_ACTUAL', 'Fecha de la revisión actual');
define('TXT_GRAFICO_AUMENTAR', '(Haga click sobre el gráfico para aumentarlo)');
define('TXT_INTERVALO', 'Sólo si se quieren limitar los valores de las mediciones a un intervalo (cerrado) de posibles valores. Por ejemplo, para resultados de encuestas. No es compatible con el cálculo automático.');
define('TXT_ESTIMACION', 'Una estimación ascendente implica una evolución positiva cuanto más altos sean los valores de las mediciones, la estimación descendente implica lo contrario.');

//Tiempo/Periodicidad
define('TXT_HISTORICO', 'Histórico');
define('TXT_BIENAL', 'Bienal');
define('TXT_ANUAL', 'Anual');
define('TXT_INTRANUAL', 'Intranual');
define('TXT_MENSUAL', 'Mensual');
define('TXT_TRIMESTRAL', 'Trimestral');
define('TXT_CUATRIMESTRAL', 'Cuatrimestral');
define('TXT_SEMESTRAL', 'Semestral');
define('TXT_DOS_ULT_ANYO', 'Dos últimos años');
//Tipos de Cálculo
define('TXT_CALC_AUTO', 'Este indicador/dato es calculado automáticamente');

//Tipos de Proceso
define('TXT_ESTRATEGICO', '1-Estratégico');
define('TXT_OPERATIVO', '2-Operativo');
define('TXT_APOYO', '3-Apoyo');
define('TXT_INDEF', 'Indefinido');

//Tipos de Representaciones Gráficas: paneles
define('TXT_LINEAS', 'Líneas');
define('TXT_LINEAS_DESC', 'Muestra varios indicadores/datos para distintas unidades como gráfica de líneas.');
define('TXT_BARRAS', 'Barras');
define('TXT_BARRAS_DESC', 'Muestra varios indicadores/datos para distintas unidades como gráfica de barras.');
define('TXT_MIXTO', 'Mixto');
define('TXT_MIXTO_DESC', 'Muestra un indicador/dato base como gráfica de barras y el resto de indicadores/datos complementarios como gráficas de líneas.');
define('TXT_TABLA', 'Tabla');
define('TXT_TABLA_DESC', 'Tabla que muestra varios indicadores/datos y su evolución total o de una unidad concreta para un período dado.');
define('TXT_TARTA', 'Tarta');
define('TXT_TARTA_DESC', 'Muestra como se reparte una medición de un indicador/dato entre las unidades afectadas como gráfica de tarta.');

//Usuarios
define('TXT_USERS_ASIGNAR', 'Asignar usuarios marcados');
define('TXT_USERS_DESASIGNAR', 'Desasignar usuarios marcados');
define('TXT_USERS_ALTA', 'Alta de usuarios');
define('TXT_USERS_BAJA', 'Baja de usuarios');
define('TXT_USER_UNIDS', 'Mis unidades');
define('TXT_USER_PROCS', 'Mis procesos');
define('TXT_USER_INDIC', 'Mis indicadores');
define('TXT_USER_DATO', 'Mis datos');
define('TXT_USER_CUADROS', 'Mis cuadros de mando');
define('TXT_USER_OBJOPS', 'Mis objetivos operacionales');
define('TXT_USERS_ASIG', 'Usuarios asignados actualmente');
define('TXT_USERS_DISP', 'Usuarios disponibles');
define('TXT_USERS_VINC', 'Vincular usuarios');
define('TXT_USERS_DESVINC', 'Desvincular usuarios');
define('TXT_USER_GESTION', 'Gestión de usuarios');
define('TXT_USER_EDIT', 'Editar usuario');

//Valores
define('TXT_VALS', 'Valores');
define('TXT_VAL_EDIT', 'Editar valores');
define('TXT_VAL_AGREGAR', 'Agregar valor');
define('TXT_VALS_SUBUNID', 'Valores por subunidad');
define('TXT_VAL_IMPORT', 'Importar valores');
define('TXT_VAL_CALCULAR', 'Calcular');
define('TXT_VAL_CALC_DESCRIPCION', 'En indicadores/datos calculados actualiza los valores recalculando');
define('TXT_VAL_ACTIVO', 'Activo');
define('TXT_VAL_INACTIVO', 'Inactivo');
define('TXT_VAL_REF', 'Valores de referencia');
define('TXT_VAL_TABLA', 'Tabla de valores');
//Valores de referencia
define('TXT_VAL_REF_CREAR', 'Crear valor de referencia');
define('TXT_VAL_REF_EDIT', 'Editar valor de referencia');
define('TXT_VAL_REF_BORRAR', 'Borrar valores de referencia');
define('TXT_VALS_DESACT', 'Desactivar valores');
define('TXT_VAL_REF_NOMBRE', 'Los nombres "Meta" y/o "Límite" activarán el control por colores del status en las mediciones.');
define('TXT_VAL_REF_ETIQ', 'La etiqueta indica el nombre con el que aparecerá el valor de referencia en las gráficas y en las mediciones.');
//Status
define('TXT_VAL_LOGRADO', 'Valor óptimo');
define('TXT_VAL_ACEPTABLE', 'Valor aceptable');
define('TXT_VAL_MEJORABLE', 'Valor mejorable');

//Visibilidad, permisos
define('TXT_TODOS', 'Todos');
define('TXT_PUBLICO', 'Público');
define('TXT_PRIVADO', 'Privado');

//-----------------------------------------------------------------------------------
//CAMPOS: FIELD_[Nombre]
//-----------------------------------------------------------------------------------

define('FIELD_ID', 'ID');
define('FIELD_ACCIONES', 'Acciones');
define('FIELD_TITULO', 'Título');
define('FIELD_DESC', 'Descripción');
define('FIELD_VISIB', 'Visible');
define('FIELD_COD', 'Código');
define('FIELD_NOMBRE', 'Nombre');
define('FIELD_PROPIETARIO', 'Propietario');
define('FIELD_FECHA', 'Fecha');
define('FIELD_WEB', 'Sitio web');
define('FIELD_FUENTE', 'Fuente');
define('FIELD_PERIODO', 'Período');
define('FIELD_VISIBILIDAD', 'Visibilidad');
define('FIELD_LIMITE', 'Límite');
define('FIELD_META', 'Meta');
define('FIELD_CREAC', 'Creación');
define('FIELD_ARCHIVADO', 'Archivado');
define('FIELD_FECHA_REV', 'Fecha de revisión');
define('FIELD_FECHA_RECOGIDA', 'Fecha recogida');
define('FIELD_AGREG', 'Agregado');
define('FIELD_INTERP', 'Interpretación');
define('FIELD_INICIO_PERIODO', 'Inicio del período');
define('FIELD_FIN_PERIODO', 'Fin del período');
define('FIELD_INICIO_GRABACION', 'Inicio de grabación');
define('FIELD_FIN_GRABACION', 'Fin de grabación');
define('FIELD_ETIQUETA', 'Etiqueta');
define('FIELD_ETIQUETA_MINI', 'Etiqueta mini');
define('FIELD_CAMBIO_A', 'Cambio a:');
define('FIELD_ALIAS', 'Alias');
define('FIELD_ORDEN', 'Orden');
define('FIELD_ANCHO', 'Ancho');
define('FIELD_ANYO', 'Año');
define('FIELD_TOTAL', 'Total');
define('FIELD_REGISTROS', 'Registros');
define('FIELD_OBSERV', 'Observaciones');
define('FIELD_ACTIVO', 'Activo');
define('FIELD_VERSION', 'Versión');
define('FIELD_COMENTARIOS', 'Comentarios');

//Archivos
define('FIELD_ARCHIVO', 'Archivo');

//Cuadros de Mando
define('FIELD_CUADRO_MANDO', 'Cuadro de mando');
define('FIELD_CUADROS_MANDO', 'Cuadros de mando');
//Paneles de los Cuadros de Mando
define('FIELD_ANYOS_ATRAS', 'Años atrás');
define('FIELD_ANYO_FIN', 'Año de fin');

//Datos
define('FIELD_DATO', 'Dato');
define('FIELD_FUENTE_DAT', 'Fuente de datos');
define('FIELD_DATOS', 'Datos');

//Entidades (Unidades)
define('FIELD_UNID', 'Unidad');
define('FIELD_UNID_SUP', 'Unidad superior');
define('FIELD_UNID_GEN', 'Unidad generadora');
define('FIELD_SUBUNID', 'Subunidad');
define('FIELD_SUBUNIDS', 'Subunidades');
define('FIELD_UNIDS', 'Unidades');
define('FIELD_ORGANICA', 'Orgánica');
define('FIELD_ANOTACION', 'Anotaciones');

//Indicadores
define('FIELD_INDIC', 'Indicador');
define('FIELD_INDIC_TIPO', 'Tipo de indicador');
define('FIELD_INDIC_BASE', 'Indicador base');
define('FIELD_INDIC_COMPLEMENT', 'Indicadores complementarios');
define('FIELD_INDICS', 'Indicadores');
define('FIELD_FORM', 'Formulación');
define('FIELD_FORMULA', 'Fórmula de cálculo');
define('FIELD_FUENTE_INFO', 'Fuente de Información');
define('FIELD_PERIOD', 'Periodicidad');
define('FIELD_RESP', 'Responsable');
define('FIELD_RESP_SEG', 'Responsable de Seguimiento');
define('FIELD_MET', 'Método de comprobación (evidencia)');
define('FIELD_EFQM', 'Criterios EFQM');
define('FIELD_HISTORICO', 'Histórico');
define('FIELD_ESTIMACION', 'Estimación');
define('FIELD_CALCULO', 'Cálculo');
define('FIELD_CALC_TOTAL', 'Cálculo del total entre subunidades');
define('FIELD_CALC_TOTAL_ANUAL', 'Cálculo del total anual');
define('FIELD_INTERVALO', 'Intervalo de valores [Vmin, Vmax]');
define('FIELD_VALOR_MIN', 'Valor mínimo');
define('FIELD_VALOR_MAX', 'Valor máximo');

//Mediciones
define('FIELD_MED', 'Medición');
define('FIELD_MEDICIONES', 'Mediciones');
define('FIELD_RESP_MED', 'Responsable de medición');
define('FIELD_TIP_MED', 'Tipo de medición');

//Páginas
define('FIELD_PAG_CONTENIDO', 'Contenido de la página (HTML)');

//Planes
define('FIELD_PLAN', 'Plan estratégico');
define('FIELD_PLANES', 'Planes estratégicos');
define('FIELD_ANYO_INICIO', 'Año de inicio');
define('FIELD_DURACION', 'Duración (años)');
define('FIELD_MISION', 'Misión');
define('FIELD_VISION', 'Visión');
define('FIELD_VALORES', 'Valores');
define('FIELD_FCE', 'Factores clave del éxito');
define('FIELD_EJECUCION', 'Ejecución');

//Líneas
define('FIELD_LINEA', 'Línea estratégica');
define('FIELD_LINEAS', 'Líneas estratégicas');
define('FIELD_INDICE', 'Número');

//Objetivos
define('FIELD_OBJ_EST', 'Objetivo estratégico');
define('FIELD_OBJ_OP', 'Objetivo operacional');
define('FIELD_OBJS_EST', 'Objetivos estratégicos');
define('FIELD_OBJS_OP', 'Objetivos operacionales');
define('FIELD_PESO', 'Peso');

//Procesos
define('FIELD_PROC', 'Proceso');
define('FIELD_PROCS', 'Procesos');
define('FIELD_PROC_MADRE', 'Proceso madre');
define('FIELD_TIPO_PROC', 'Tipo de proceso');
define('FIELD_SUBPROCS', 'Subprocesos');
define('FIELD_EQUIP_PROC', 'Equipo de proceso');
define('FIELD_RESULTS_CLAVE', 'Resultados Clave');
define('FIELD_ENTRADAS_PROV', 'Entradas/Proveedores');
define('FIELD_SALIDAS_CLIENTS', 'Salidas/Clientes');
define('FIELD_ACTIVIDADES', 'Actividades');
define('FIELD_VARS_CONTROL', 'Variables de control');
define('FIELD_DOCUMENTACION', 'Documentación');

//Usuarios
define('FIELD_LOGIN', 'Login');
define('FIELD_USER', 'Usuario');
define('FIELD_CLAVE', 'Clave de acceso');
define('FIELD_APEL', 'Apellidos');
define('FIELD_TEL', 'Teléfono');
define('FIELD_CORREO', 'E-mail');
define('FIELD_DNI', 'DNI o NIE (con letra)');
define('FIELD_USER_GRABA', 'Usuario que graba');
define('FIELD_ROL', 'Rol');
define('FIELD_PUESTO', 'Puesto de trabajo');

//Valores
define('FIELD_VAL', 'Valor');
define('FIELD_VAL_REF', 'Valor de referencia');
define('FIELD_VISIB_GRAFIC', 'Visible en gráfica');

//-------------------------------------------------------------------------------------
//NOTIFICACIONES/AVISOS: MSG_[Nombre]
//-------------------------------------------------------------------------------------

define('MSG_NO_DEF', 'No se han definido.');
define('MSG_TOTAL_LINEAS', 'Total de líneas');
define('MSG_LINEAS_NO_REF_INDIC', 'líneas que no referenciaban a ningún indicador.');
define('MSG_NO_MET_SOL', 'No existe el método solicitado.');
define('MSG_ERR', 'Por favor inténtelo de nuevo, si el problema persiste póngase en contacto con nosotros en la dirección: ');
define('MSG_CAMPO_REQ', 'Campo obligatorio');
define('MSG_BUSCAR_NO_RESUL', 'No existen resultados para la búsqueda solicitada.');
define('MSG_BUSCAR_NO_TEXTO', 'No introdujo ningún texto para buscar.');
define('MSG_NO_SESION', 'Su sesión ha expirado.');

//Análisis y planes de acción
define('MSG_ANAPLAN_NO', 'Todavía no se ha registrado ningún análisis ni plan de acción para el indicador. Utilice el selector de la parte superior y los cuadros de texto para ello.');

//Archivos
define('MSG_ARCHIVO_BORRAR_CONFIRM', 'Por favor, confirme si desea borrar el archivo');
define('MSG_ARCHIVO_SUBIDA_OK', 'Se ha subido correctamente el archivo.');
define('MSG_ARCHIVO_BORRADO', 'Se ha eliminado con éxito el archivo.');
define('MSG_ARCHIVOS_PROCESADOS', 'Archivos procesados');

//Consulta avanzada
define('MSG_NO_CAL', 'No se puede calcular con los parámetros actuales.');
define('MSG_NO_OPERANDOS', 'Todavía no se han añadido indicadores/datos a la consulta.');

//Cuadros de Mando
define('MSG_CUADRO_MANDO_BORRADO', 'Se ha eliminado el cuadro de mando:');
define('MSG_CUADRO_MANDO_CONFIRM_BORRAR', '¿Desea borrar el cuadro de mando?');
define('MSG_CUADRO_MANDO_NO_PROPIO', 'No tiene ningún cuadro de mando propio todavía. Cree un nuevo cuadro de mando.');
define('MSG_CUADRO_MANDO_NO_PUBLIC', 'No existe ningún cuadro de mando público todavía. Cree un nuevo cuadro de mando.');
define('MSG_CUADRO_MANDO_BORRAR', 'No se puede borrar un cuadro de mando que contenga paneles. Bórrelos primero.');
define('MSG_CUADRO_CREADO', 'Se ha creado un nuevo cuadro de mando.');
define('MSG_CUADRO_EDITADO', 'Se ha editado correctamente el cuadro de mando.');
define('MSG_CUADRO_CONFIRM_EDITAR', 'Va a editar este cuadro de mando, ¿está seguro?');
//Paneles de los Cuadros de Mando
define('MSG_PANEL_NO_VAL', 'No hay valores recogidos para los indicadores/datos de este panel.');
define('MSG_PANEL_INDIC_UNID', 'Seleccione la unidad del indicador/dato para la que desea ver sus valores:');
define('MSG_PANEL_BORRAR', 'Va a borrar del cuadro de mando este panel, ¿está seguro?');
define('MSG_PANEL_BORRADO', 'Se ha eliminado con éxito el panel seleccionado.');
define('MSG_PANEL_CARGANDO', 'Cargando paneles, por favor espere.');
define('MSG_PANEL_EDITADO', "Panel editado correctamente:");
define('MSG_PANEL_CREADO', "Se ha añadido al cuadro de mando el siguiente panel:");
define('MSG_PANEL_CONFIRM_EDITAR', 'Va a editar este panel, ¿está seguro?');

//Datos
define('MSG_DATOS_NO', 'No hay indicadores (datos) activos.');
define('MSG_DATOS_NO_ARCHIVADOS', 'No hay datos archivados para ninguna unidad.');
define('MSG_DATO_BORRADO', 'Se ha borrado el dato: ');
define('MSG_DATO_ARCHIVADO', 'Se ha archivado el dato: ');
define('MSG_DATO_RESTAURADO', 'Se ha restaurado el dato: ');
define('MSG_DATO_ACTUALIZADO', 'Se ha actualizado el dato');
define('MSG_DATO_CONFIRM_BORRAR', '¿Realmente quiere borrar este dato?');
define('MSG_DATO_CONFIRM_ARCHIVAR', 'El dato quedará archivado pero no se eliminará, ¿realmente desea archivar este dato?');
define('MSG_DATO_CONFIRM_RESTAURAR', '¿Realmente quiere restaurar este dato?');
define('MSG_DATO_CONFIRM_EDITAR', 'Va a editar este dato, ¿está seguro?');
define('MSG_DATO_CREADO', 'Se ha creado un nuevo dato');
define('MSG_DATO_EXPORT_OK', 'Los datos se han exportado correctamente: ');
define('MSG_DATO_NO_SUBUNID_ASIG', 'No se han asignado subunidades a este dato (corregir)');
define('MSG_DATO_PERIODICIDAD', 'IMPORTANTE: Cambió la periodicidad del dato. Por favor, revise las mediciones: borre aquellas que considere no válidas.');
define('MSG_DATO_NO_ASIG', 'No dispone de datos bajo su responsabilidad.');

//Entidades (Unidades)
define('MSG_UNID_NO_PROC', 'No hay procesos definidos para esta unidad.');
define('MSG_UNID_NO_MAPA', 'No existe un mapa de procesos definido para esta unidad.');
define('MSG_UNID_NO_ARCHIVOS', 'No se han subido archivos en esta unidad.');
define('MSG_UNID_USERS_BORRADOS', 'Se han eliminado de la unidad');
define('MSG_UNID_USERS_AGREGADOS', 'Se han agregado a la unidad');
define('MSG_UNID_CONFIRM_EDITAR', 'Va a editar esta unidad, ¿está seguro?');
define('MSG_UNID_EDITADA', 'La unidad se ha modificado con los datos que aparecen a continuación.');
define('MSG_UNID_NO_USERS', 'No se han vinculado usuarios a esta unidad.');
define('MSG_UNID_NO_INDIC', 'No hay indicadores activos en esta unidad.');
define('MSG_UNID_NO_INDIC_PROC', 'No hay indicadores (proceso) activos en esta unidad.');
define('MSG_UNID_NO_INDIC_CONTROL', 'No hay indicadores (control) activos en esta unidad.');
define('MSG_UNID_NO_DATOS', 'No hay indicadores (datos) activos en esta unidad.');
define('MSG_UNID_NO_INDIC_ARCHIVADOS', 'No hay indicadores archivados en esta unidad.');
define('MSG_UNID_NO_DATO_ARCHIVADOS', 'No hay datos archivados en esta unidad.');
define('MSG_UNID_NO_CUADROS', 'No hay cuadros de mando definidos para esta unidad.');
define('MSG_UNID_NO_PLANES', 'No hay planes estratégicos definidos para esta unidad.');
define('MSG_UNID_NO_IND_NO_DAT', 'No hay indicadores ni datos definidos para esta unidad.');
define('MSG_UNID_NO_SUBUNIDS', 'Esta unidad no tiene subunidades.');
define('MSG_UNID_NO_ASIG', 'No tiene asignada ninguna unidad.');
define('MSG_UNIDS_NO_EXISTEN', 'Actualmente, no existen unidades orgánicas.');

//Indicadores
define('MSG_INDICS_NO', 'No hay indicadores activos.');
define('MSG_INDICS_NO_PROC', 'No hay indicadores (proceso) activos.');
define('MSG_INDICS_NO_CONTROL', 'No hay indicadores (control) activos.');
define('MSG_INDICS_NO_ARCHIVADOS', 'No hay indicadores archivados.');
define('MSG_INDIC_NO_SUBUNID_ASIG', 'No se han asignado unidad/subunidades a este indicador (corregir).');
define('MSG_INDIC_NO_VAL', 'No hay valores recogidos para este indicador.');
define('MSG_INDIC_CREADO', 'Se ha creado un nuevo indicador.');
define('MSG_INDIC_NO_ENC', 'No se han encontrado indicadores/datos.');
define('MSG_INDIC_CONFIRM_ARCHIVAR', 'El indicador quedará archivado pero no se eliminará, ¿realmente desea archivar este indicador?');
define('MSG_INDIC_CONFIRM_BORRAR', '¿Realmente quiere borrar este indicador?');
define('MSG_INDIC_CONFIRM_RESTAURAR', '¿Realmente quiere restaurar este indicador?');
define('MSG_INDIC_CONFIRM_EDITAR', 'Va a editar este indicador, ¿está seguro?');
define('MSG_INDIC_BORRADO', 'Se ha borrado el indicador: ');
define('MSG_INDIC_ARCHIVADO', 'Se ha archivado el indicador: ');
define('MSG_INDIC_RESTAURADO', 'Se ha restaurado el indicador: ');
define('MSG_INDIC_ACTUALIZADO', 'Se han actualizado los datos del indicador.');
define('MSG_INDIC_NO_VAL_REF', 'No se han definido valores de referencia para este indicador/dato.');
define('MSG_INDIC_NO_MED', 'Todavía no se han creado mediciones para este indicador.');
define('MSG_INDIC_PERIODICIDAD', 'IMPORTANTE: Cambió la periodicidad del indicador. Por favor, revise las mediciones: borre aquellas que considere no válidas.');
define('MSG_INDIC_NO_ASIG', 'No dispone de indicadores bajo su responsabilidad.');

//Mediciones
define('MSG_MED_NO_REBIUN', 'No se han generado las mediciones del año anterior para los datos Rebiun. Por favor, genere antes las mediciones.');
define('MSG_MED_NO_ASIG', 'No tiene asignada ninguna medición.');
define('MSG_MED_BORRADA', 'La/s medición/es se ha/n borrado con éxito.');
define('MSG_MED_CONFIRM_BORRAR', 'Confirme si desea borrar esta medición. Recuerde que se borrarán los valores y los valores de referencia recogidos para esta medición.');
define('MSG_MEDS_CONFIRM_BORRAR', 'Confirme si desea borrar las mediciones seleccionadas. Recuerde que se borrarán todos los valores y valores de referencia de las mediciones que sean eliminadas.');
define('MSG_MEDS_GRABADAS', 'Mediciones grabadas');
define('MSG_MED_ETIQUETA_NULA', 'La etiqueta no puede estar vacía. Puede restituir el valor anterior pulsando el icono "X" (cancelar).');
define('MSG_MED_VAL_NO_PERIODO', 'No se pueden grabar valores, esta fuera del periodo de grabación:');
define('MSG_MED_VAL_NULO', 'Está intentando introducir un valor vacío. Puede restituir el valor anterior pulsando el icono "X" (cancelar). Puede dejarlo en blanco (nulo) introduciendo tres guiones seguidos (---).');
define('MSG_MED_VAL_INTERVALO', 'Debe insertar un valor que esté dentro del intervalo de valores permitidos por el indicador/dato:');
define('MSG_MED_VAL_NOMUM', 'Está intentando introducir un dato que no es reconocido como número.');
define('MSG_MEDS_INDIC_NO_UNID', 'Mediciones en la muestra, de indicadores que no pertenecen a la Unidad actual.');
define('MSG_MED_CREADA', 'Se ha agregado correctamente una nueva medición. Unidades afectadas: ');
define('MSG_MED_CREAR', 'Esta acción, creará automáticamente todas las mediciones (si no existen), desde el año fijado (mínimo año del histórico) hasta el año actual. Tomará algo de tiempo en función del año seleccionado y la periodicidad del indicador/dato, ¿está seguro?');
define('MSG_MED_CARGAR', 'Esta acción, cargará la cantidad indicada de registros de las mediciones del indicador/dato. Tomará algo de tiempo en función del número de registros seleccionado, ¿está seguro?');
define('MSG_MED_GENERANDO', 'Generando mediciones... espere por favor.');
define('MSG_MED_CARGANDO', 'Cargando mediciones... espere por favor.');
define('MSG_MED_GENERADA', 'Se ha/n generado correctamente todas la/s medición/es.');
define('MSG_MED_EXISTE', 'Se ha/n generado sólo la/s medición/es no existente/s desde el año seleccionado.');
define('MSG_MEDS_NO_MARCADAS', 'No se ha marcado ninguna medición para borrar.');
define('MSG_MED_RESP_ARCHIVADO', 'No se pueden editar responsables de medición en indicadores/datos archivados. Restaure primero el indicador/dato.');

//Páginas
define('MSG_PAG_NUEVA_OK', 'La página se ha creado correctamente.');
define('MSG_PAG_CONFIRM_EDITAR', 'Va a editar esta página, ¿está seguro?');
define('MSG_PAG_EDIT_OK', 'La página se ha modificado correctamente.');

//Planes
define('MSG_PLANES_NO', 'No hay planes estratégicos definidos para ninguna unidad.');
define('MSG_PLAN_CONFIRM_BORRAR', '¿Realmente quiere borrar este plan?');
define('MSG_PLAN_CREADO', 'Se ha creado un nuevo plan estratégico para esta unidad.');
define('MSG_PLAN_EDITADO', 'Se ha editado el plan correctamente.');
define('MSG_PLAN_CONFIRM_EDITAR', 'Va a editar este plan, ¿está seguro?');
define('MSG_PLAN_BORRADO', 'Se ha eliminado el plan estratégico:');
define('MSG_PLAN_BORRAR', 'No tiene permisos para borrar el plan o éste todavía contiene líneas estratégicas. Bórrelas primero.');
define('MSG_PLAN_NO_LINEAS', 'No hay líneas estratégicas definidas para este plan.');
define('MSG_PLAN_NO_OBJEST', 'No hay objetivos estratégicos definidos para las líneas estratégicas del plan.');
define('MSG_PLAN_NO_OBJOP', 'No hay objetivos operacionales definidos para los objetivos estratégicos de las líneas estratégicas del plan.');
define('MSG_PLAN_NO_ARCHIVOS', 'No se han subido archivos para este plan estratégico.');

//Líneas
define('MSG_LINEA_CONFIRM_BORRAR', '¿Realmente quiere borrar esta línea?');
define('MSG_LINEA_CREADA', 'Se ha creado una nueva línea estratégica para este plan.');
define('MSG_LINEA_EDITADA', 'Se ha editado la línea correctamente.');
define('MSG_LINEA_CONFIRM_EDITAR', 'Va a editar esta línea, ¿está seguro?');
define('MSG_LINEA_BORRADA', 'Se ha eliminado la línea estratégica:');
define('MSG_LINEA_BORRAR', 'No tiene permisos para borrar la línea o ésta todavía contiene objetivos estratégicos. Bórrelos primero.');
define('MSG_LINEA_NO_OBJEST', 'No hay objetivos estratégicos definidos para esta línea estratégica del plan.');
define('MSG_LINEA_NO_OBJOP', 'No hay objetivos operacionales definidos para los objetivos estratégicos de esta línea estratégica del plan.');

//Objetivos Estratégicos
define('MSG_OBJEST_CONFIRM_BORRAR', '¿Realmente quiere borrar este objetivo estratégico?');
define('MSG_OBJEST_CREADO', 'Se ha creado un nuevo objetivo estratégico para esta línea del plan:');
define('MSG_OBJEST_EDITADO', 'Se ha editado el objetivo estratégico correctamente.');
define('MSG_OBJEST_CONFIRM_EDITAR', 'Va a editar este objetivo estratégico, ¿está seguro?');
define('MSG_OBJEST_BORRADO', 'Se ha eliminado el objetivo estratégico:');
define('MSG_OBJEST_BORRAR', 'No tiene permisos para borrar el objetivo estratégico o éste todavía contiene objetivos operacionales. Bórrelos primero.');
define('MSG_OBJEST_NO_OBJOP', 'No hay objetivos operacionales definidos para este objetivo estratégico de esta línea estratégica del plan.');

//Objetivos Operacionales
define('MSG_OBJOP_CONFIRM_BORRAR', '¿Realmente quiere borrar este objetivo operacional?');
define('MSG_OBJOP_CREADO', 'Se ha creado un nuevo objetivo operacional para el actual objetivo estratégico:');
define('MSG_OBJOP_EDITADO', 'Se ha editado el objetivo operacional correctamente.');
define('MSG_OBJOP_CONFIRM_EDITAR', 'Va a editar este objetivo operacional, ¿está seguro?');
define('MSG_OBJOP_BORRADO', 'Se ha eliminado el objetivo operacional:');
define('MSG_OBJOP_BORRAR', 'No tiene permisos para borrar el objetivo operacional.');
define('MSG_OBJOP_NO_INDICS_CORREL', 'No se han definido los indicadores de correlación para este objetivo operacional.');
define('MSG_OBJOP_NO_INDICS_CONTROL', 'No se han definido los indicadores de control para este objetivo operacional.');
define('MSG_OBJOP_VALOR_EJ', 'Debe introducir un valor para la ejecución entre 0 y 100 (%).');
define('MSG_OBJOP_NO_SUBUNID_ASIG', 'No se han asignado unidad/subunidades a este objetivo operacional (corregir).');
define('MSG_OBJOP_NO_ASIG', 'No dispone de objetivos operacionales bajo su responsabilidad.');

//Procesos
define('MSG_PROCS_NO', 'No hay procesos definidos para ninguna unidad.');
define('MSG_PROC_NO_ASIG', 'No dispone de procesos en propiedad.');
define('MSG_PROC_NO_SUBPROCS', 'Este proceso no tiene subprocesos.');
define('MSG_PROC_NO_FLUJO', 'Este proceso no tiene flujograma. Suba el archivo de imagen correspondiente y defina su descripción como flujograma.');
define('MSG_PROC_BORRADO', 'Se ha borrado el proceso: ');
define('MSG_PROC_CONFIRM_EDITAR', 'Va a editar este proceso, ¿está seguro?');
define('MSG_PROC_CONFIRM_BORRAR', '¿Realmente quiere borrar este proceso?');
define('MSG_PROC_GRABAR', 'Se ha grabado un nuevo proceso para esta unidad.');
define('MSG_PROC_EDITADO', 'Se ha modificado el proceso correctamente.');
define('MSG_PROC_NO_INDIC', 'No se ha definido ningún indicador para este proceso.');
define('MSG_PROC_NO_INDIC_ARCHIVADOS', 'No hay indicadores archivados en este proceso.');
define('MSG_PROC_NO_ARCHIVOS', 'No se han subido archivos para este proceso.');
define('MSG_PROC_MAPA', 'Para agregar/editar el mapa de procesos de su unidad, póngase en contacto con nosotros a través de la dirección: ');

//Usuarios
define('MSG_USER_CREADO', 'Se ha creado un nuevo usuario en el sistema.');
define('MSG_USER_EDITADO', 'El usuario se ha modificado correctamente.');
define('MSG_USER_CONFIRM_EDITAR', 'Va a editar este usuario, ¿está seguro?');
define('MSG_USERS_CONFIRM_VINC', '¿Desea vincular a la unidad los usuarios marcados?');
define('MSG_USERS_CONFIRM_DESVINC', '¿Desea desvincular de la unidad los usuarios marcados?');

//Valores
define('MSG_VAL_NO_ASIG', 'Todavía no se han asignado valores a esta medición.');
define('MSG_VALS_CALCULADOS', 'Se han calculado/actualizado los valores correctamente.');
define('MSG_VALS_CONFIRM_DESACT', '¿Desea desactivar los valores marcados?');
define('MSG_VAL_REF_NO_VALIDO', 'Valor de referencia incorrecto para la estimación actual');
define('MSG_VALS_REF_CONFIRM_BORRAR', '¿Desea borrar los valores de referencia marcados?');
define('MSG_VAL_REF_CREADO', 'Se ha añadido correctamente el valor de referencia:');
define('MSG_VAL_REF_EDITADO', 'Se ha editado correctamente el valor de referencia:');
define('MSG_VALS_REF_BORRADO', 'Se han borrado:');
define('MSG_VALS_REF_NO_MARCADOS', 'No se ha marcado ningún valor de referencia.');
define('MSG_VALS_REF_STATUS', 'Cree valores de referencia con el nombre "Meta" y/o "Límite" para activar el control del status por colores en las mediciones.');
define('MSG_VALS_DESACT', 'Se han desactivado:');
define('MSG_VALS_NO_MARCADOS', 'No se ha seleccionado ningún valor para desactivar.');
define('MSG_VAL_ARCHIVADO', 'No se pueden editar valores en indicadores archivados. Restaure primero el indicador.');

//Control
define('MSG_CONTROL_INFO', 'El control de indicadores/datos se muestra por años. Seleccione un año en el desplegable para visualizar los resultados. Sólo aparecerán los indicadores/datos bajo su responsabilidad o todos si también es responsable de la Unidad.');
define('MSG_CONTROL_NO_RESPONSABLE', 'Usted no es responsable de esta unidad y tampoco de ningún indicador/dato de la misma.');
define('MSG_CONTROL_CARGA', 'Cargando datos de control, por favor espere.');
define('MSG_CONTROL_NO_MED_NULO', 'No se ha encontrado indicadores/datos con mediciones nulas para el año seleccionado, o no existen mediciones para este año.');
define('MSG_CONTROL_NO_VAL', 'No existen mediciones o no se han grabado valores durante el año seleccionado.');
define('MSG_CONTROL_NO_MED', 'No se han creado mediciones para el año seleccionado.');
define('MSG_CONTROL_MED', 'No existen indicadores/datos sin mediciones para el año seleccionado.');

//----------------------------------------------------------------------------------
//ERRORES: ERR_[Nombre]
//----------------------------------------------------------------------------------

define('ERR', 'Error');
define('ERR_PERMISOS', 'No tiene permisos para relizar esta acción.');
define('ERR_404', 'Error 404: no encontramos la página que ha solicitado:');
define('ERR_AUT', 'No está autorizado para realizar esta operación.');
define('ERR_OP_BD', 'No ha podido realizarse la operación por un error en la base de datos.');
define('ERR_CON_BD', 'Error de conexión a la base de datos.');
define('ERR_CONSULTA_OP', 'Fallo en la consulta getOperador.');
define('ERR_CONSULTA_EXE', 'Fallo en la ejecución de la consulta');
define('ERR_DIR', 'Error no se ha podido crear el directorio tipo objeto.');
define('ERR_SUBDIR', 'Error no se ha podido crear el subdirectorio objeto.');
define('ERR_NO_DIR_NAME', 'No se ha proporcionado un nombre de directorio.');
define('ERR_PARAM', 'Faltan parámetros para realizar esta acción.');
define('ERR_GUARDAR', 'Hubo un problema, no se han podido guardar los cambios.');

//Archivos
define('ERR_ARCHIVO_BORRAR', "Faltan datos para procesar la solicitud de borrado del archivo.");
define('ERR_ARCHIVO_NO', 'No existe el archivo con el identificador:');
define('ERR_ARCHIVO_GRABAR', 'Error no se han podido grabar los datos del archivo.');
define('ERR_ARCHIVO_SUBIR', 'No se ha podido subir el archivo, consulte al administrador del sistema.');
define('ERR_ARCHIVO_NO_SEL', 'No se ha especificado ningún archivo para subir.');

//Cuadros de Mando
define('ERR_CUAD_MANDO', 'El cuadro de mando no existe o no tiene permisos para consultarlo.');
define('ERR_CUAD_MANDO_EDIT', 'El cuadro de mando no existe o no tiene permisos para editarlo.');
//Paneles
define('ERR_PANEL_VAL_ORDEN', 'Ya existe un panel con el mismo orden en este cuadro de mando.');

//Datos
define('ERR_DATO_ARCHIVAR_DEP', 'Este dato influye en el cálculo de otros indicadores/datos. Debe archivar éstos primero.');
define('ERR_DATO_BORRAR_MED', 'Tiene mediciones asociadas al dato, necesita borrar primero las mediciones.');
define('ERR_DATO_BORRAR_OBJOP', 'No se puede borrar el dato, está asociado al menos con un objetivo operacional de un plan estratégico.');
define('ERR_DATO_BORRAR_PANEL', 'No se puede borrar el dato, está asociado al menos con un panel de los cuadros de mando. Debe quitarse antes del panel.');
define('ERR_DATO_GRABAR', 'No se ha podido grabar el dato.');
define('ERR_DATO_MOSTRAR', 'No se puede mostrar el dato, el identificador no existe en la base de datos.');
define('ERR_DATO_BORRAR_DEP', 'Este dato influye en el cálculo de otros indicadores/datos. Debe eliminar éstos primero.');

//Entidades (Unidades)
define('ERR_UNID_MOSTRAR', 'No se puede mostrar la unidad, el identificador no existe en la base de datos.');
define('ERR_UNID_EDIT', 'No se ha podido modificar la unidad.');

//Indicadores
define('ERR_INDIC_BORRAR_MED', 'Tiene mediciones asociadas al indicador, necesita borrar primero las mediciones.');
define('ERR_INDIC_BORRAR_DEP', 'Este indicador influye en el cálculo de otros indicadores/datos. Debe eliminar éstos primero.');
define('ERR_INDIC_ARCHIVAR_DEP', 'Este indicador influye en el cálculo de otros indicadores/datos. Debe archivar éstos primero.');
define('ERR_INDIC_BORRAR_OBJOP', 'No se puede borrar el indicador, está asociado al menos con un objetivo operacional de un plan estratégico.');
define('ERR_INDIC_BORRAR_PANEL', 'No se puede borrar el indicador, está asociado al menos con un panel de los cuadros de mando. Debe quitarse antes del panel.');
define('ERR_INDIC_GRABAR', 'No se ha podido grabar el indicador.');
define('ERR_INDIC_MOSTRAR', 'No se puede mostrar el indicador, el identificador no existe en la base de datos.');

//Mediciones
define('ERR_MED_MOSTRAR', 'No se puede mostrar la medicion, el identificador no existe en la base de datos.');
define('ERR_MED_TIPO_NO_BD', 'solicitado no existe en la base de datos');
define('ERR_MED_NO_VAL', 'No existen valores pendientes ni recogidos para esta medición.');
define('ERR_MED_GRABAR', 'Ha ocurrido un error al grabar la medición, inténtelo de nuevo o contacte con los administradores de icasus.');
define('ERR_MED_BORRAR', 'No se puede borrar la medicion ya que influye en el cálculo de otros indicadores. Borre éstos primero');
define('ERR_MED_RESP', 'No tiene permisos suficientes para editar responsables.');

//Planes
define('ERR_PLAN_MOSTRAR', 'No se puede mostrar el plan, el identificador no existe en la base de datos.');
define('ERR_PLAN_EDIT', 'El plan estratégico no existe o no tiene permisos para editarlo.');
define('ERR_PLAN_VAL_ANYO', 'Ya existe un plan con el mismo año de inicio.');

//Líneas
define('ERR_LINEA_MOSTRAR', 'No se puede mostrar la línea, el identificador no existe en la base de datos.');
define('ERR_LINEA_EDIT', 'La línea estratégica no existe o no tiene permisos para editarla.');
define('ERR_LINEA_VAL_INDICE', 'Ya existe una línea con el mismo índice para este plan.');

//Objeticos Estratégicos
define('ERR_OBJEST_MOSTRAR', 'No se puede mostrar el objetivo estratégico, el identificador no existe en la base de datos.');
define('ERR_OBJEST_EDIT', 'El objetivo estratégico no existe o no tiene permisos para editarlo.');
define('ERR_OBJEST_VAL_INDICE', 'Ya existe un objetivo estratégico con el mismo índice para esta línea del plan.');

//Objeticos Operacionales
define('ERR_OBJOP_MOSTRAR', 'No se puede mostrar el objetivo operacional, el identificador no existe en la base de datos.');
define('ERR_OBJOP_EDIT', 'El objetivo operacional no existe o no tiene permisos para editarlo.');
define('ERR_OBJOP_VAL_INDICE', 'Ya existe un objetivo operacional con el mismo índice para este objetivo estratégico de esta línea del plan.');

//Procesos
define('ERR_PROC_MOSTRAR', 'No se puede mostrar el proceso, el identificador no existe en la base de datos.');
define('ERR_PROC_BORRAR', 'Tiene indicadores asociados al proceso, necesita borrar primero los indicadores.');
define('ERR_PROC_GRABAR', 'Ha ocurrido un error al grabar el proceso.');

//Usuarios
define('ERR_USER_MOSTRAR', 'No se puede mostrar el usuario, el identificador no existe en la base de datos.');
define('ERR_LOGIN', 'Usuario o clave incorrecta.');
define('ERR_LOGIN_SSO', 'El usuario pertenece al colectivo que tiene permiso para utilizar esta herramienta pero no se ha podido dar de alta en la herramienta. Contactar con icasus@us.es');
define('ERR_LOGIN_SSO_AUT', 'La relacion de este usuario con la Universidad no es la definida para utilizar esta herramienta. Contactar con icasus@us.es');

//Valores
define('ERR_VAL_REF_BORRAR', 'No se puede borrar un valor de referencia con valores asignados a alguna medición.');
define('ERR_VAL_EDIT', 'No tiene permisos suficientes para editar valores.');
