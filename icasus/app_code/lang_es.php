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
 * MSG_[Nombre]--> Avisos/Notificaciones
 * ERR_[Nombre]--> Errores
 * FIELD_[Nombre]--> Campos de las tablas
 */

//---------------------------------------------------------------------------------
//TEXTOS: TXT_[Nombre]
//---------------------------------------------------------------------------------

define('TXT_ICASUS', 'icasus');
define('TXT_APP_DESCRIPCION', 'Indicadores de Calidad de los Servicios de la Universidad de Sevilla');
define('TXT_DEPARTAMENTOS', 'Departamentos');
define('TXT_BIBLIOTECAS', 'Bibliotecas');
define('TXT_CONTROL', 'Control');
define('TXT_OTRO_OFIMATICA', 'Microsoft Office o cualquier otro programa de ofimática.');
define('TXT_NO_ASIG', 'No asignado');
define('TXT_REG_EVENTOS', 'Registro de eventos');
define('TXT_NULO', 'NULO');
define('TXT_CONTENIDO', 'Contenido de');
define('TXT_RESPONSABLES_GRABAR', 'Responsables de grabación');
define('TXT_INTRO_TEXTO', 'Introduce texto');
define('TXT_REP_GRAFIC', 'Gráficas');
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

//Accesibilidad (atributo alt de las imágenes)
define('TXT_FOTO_PERFIL', 'Foto de perfil');
define('TXT_EXPORT_CSV', 'Exportar en CSV');
define('TXT_LEYENDA', 'Leyenda');

//Análisis de indicadores
define('TXT_ANALISIS', 'Análisis');
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
define('TXT_ARCHIVO_ABRIR_CSV', 'El archivo .csv generado puede abrirse con: ');
define('TXT_ARCHIVO_IMPORT_CSV', 'Importar archivo CSV');

//Clasificación
define('TXT_POR_MEDICION', 'Por medición');
define('TXT_POR_ANYO', 'Por año');

//Consulta
define('TXT_CONSULT', 'Consulta avanzada');
define('TXT_CONSULT_INFO', 'Para realizar la consulta busque e incluya los indicadores/datos que desee. Puede añadir hasta un máximo de 5 operandos a la consulta.');
define('TXT_CONSULT_PARAM', 'Parámetros de la consulta');
define('TXT_CONSULT_OPERAND', 'Indicador/dato operando');
define('TXT_CONSULT_OPER', 'Operador');
define('TXT_CONSULT_INCLUIR', 'Incluir/cambiar operando de la consulta');
define('TXT_CONSULT_QUITAR', 'Retirar último operando de la consulta');
define('TXT_CONSULT_RESUL', 'Resultados de la consulta');
define('TXT_CONSULT_BUSCAR', 'Buscar indicador/dato');

//Cuadros de Mando
define('TXT_CUADRO_MANDO', 'Cuadro de mando');
define('TXT_CUADROS_MANDO', 'Cuadros de mando');
define('TXT_CUADRO_LIST', 'Lista de cuadros de mando');
define('TXT_CUADROS_MANDO_PUBLIC', 'Cuadros de mando públicos');
define('TXT_CUADRO_CREAR', 'Crear cuadro de mando');
define('TXT_CUADRO_EDIT', 'Editar cuadro de mando');
define('TXT_CUADRO_BORRAR', 'Borrar cuadro de mando');
//Paneles de los Cuadros de Mando
define('TXT_PANEL_CREAR', 'Crear panel');
define('TXT_PANEL_BORRAR', 'Borrar panel');
define('TXT_PANEL_EDITAR', 'Editar panel');
define('TXT_PANEL_ANYOS_ATRAS', 'Años atrás');
define('TXT_PANEL_INDICS', 'Indicadores/datos del panel');

//Datos
define('TXT_DATO_TODOS', 'Todos los datos');
define('TXT_DATO_MEDICIONES', 'Mediciones del dato');
define('TXT_DATO_EDIT', 'Editar dato');
define('TXT_DATO_BORRAR', 'Borrar dato');
define('TXT_DATO_CREAR', 'Crear dato');
define('TXT_DATOS_LIST', 'Lista de datos');
define('TXT_DATOS_REBIUN', 'Datos Rebiun');
define('TXT_DATOS_REBIUN_RECOGIDA', 'Recogida de Datos Rebiun');
define('TXT_DATOS_EXPORT', 'Exportar datos');
define('TXT_DATOS_REBIUN_DET', 'Detalle datos Rebiun'); //2012
define('TXT_DATOS_REBIUN_SUMA', 'Suma datos Rebiun');
define('TXT_DATOS_REBIUN_PROMEDIO', 'Promedio datos Rebiun');
define('TXT_DATOS_REBIUN_DET_EXPORT_CSV', 'Exportar en CSV detalle datos Rebiun');
define('TXT_DATOS_REBIUN_SUMA_EXPORT_CSV', 'Exportar en CSV suma datos Rebiun');
define('TXT_DATOS_REBIUN_PROMEDIO_EXPORT_CSV', 'Exportar en CSV promedio datos Rebiun');

//Dimensiones
define('TXT_DIM_CREAR', 'Crear dimensión');
define('TXT_DIM_EDIT', 'Editar dimensión');
define('TXT_DIM_LIST', 'Lista de dimensiones');
define('TXT_DIM_REL', 'Relación de dimensiones');

//Entidades (Unidades)
define('TXT_UNID', 'Unidad');
define('TXT_UNID_ASIG_PRINCIPAL', 'Convertir en unidad principal: al iniciar sesión accederá directamente a la ficha de esta unidad (sólo se puede asignar una unidad como principal).');
define('TXT_UNID_PRINCIPAL', 'Unidad principal: al iniciar sesión accederá directamente a la ficha de esta unidad.');
define('TXT_UNID_SUP_INDIC', 'Indicadores de la unidad superior');
define('TXT_UNID_INDIC_SEG', 'Indicadores segregados en los que mide la unidad');
define('TXT_UNID_TODAS', 'Todas las unidades');
define('TXT_UNID_SEL', 'Seleccione o comience a teclear el nombre de la unidad a la que se copiará el indicador.');
define('TXT_SUBUNID', 'La subunidad');
define('TXT_SUBUNID_MEDS', 'tiene vinculada las siguientes mediciones con los correspondientes valores');
define('TXT_UNID_NUEVA', 'Nueva unidad');
define('TXT_UNID_PROC_LIST', 'Lista de procesos de la unidad con sus indicadores');
define('TXT_UNID_EDIT', 'Editar unidad');
define('TXT_UNIDS_MEDS_INDIC', 'Unidades con mediciones en el indicador');
define('TXT_UNIDS_UE01', 'Unidades UE01 con sus indicadores, valores y fecha');
define('TXT_ETIQUETA_MINI_DESCRIPCION', 'Indica como aparece el nombre de la unidad en las gráficas');
define('TXT_ORGANICA_DESCRIPCION', 'Sólo aparecen en los listados las unidades orgánicas');

//Indicadores
define('TXT_INDIC_TODOS', 'Todos los indicadores');
define('TXT_INDIC_SUBUNID', 'Relación de indicadores de subunidades');
define('TXT_INDIC_PROP', 'Indicadores propios de la unidad');
define('TXT_INDIC_MED', 'Mediciones del indicador');
define('TXT_INDIC_IR', 'Ir al indicador/dato');
define('TXT_INDIC_CREAR', 'Crear indicador');
define('TXT_INDIC_LIST', 'Lista de indicadores');
define('TXT_INDIC_EDIT', 'Editar indicador');
define('TXT_INDIC_BORRAR', 'Borrar indicador');
define('TXT_INDICS_COPIAR', 'Copiar indicadores');
define('TXT_INDICS_DIC', 'Diccionario de indicadores');
define('TXT_INDICS_MIO', 'Mis indicadores');
define('TXT_INDIC_DAT', 'Datos del indicador');
define('TXT_INDIC_GEN_INFO_WORD', 'Generar un informe en Word de este indicador');
define('TXT_INDIC_EXPORT_EXCEL', 'Exportar los datos del indicador a Excel');
define('TXT_INDIC_PUBLIC', 'Indicadores públicos');
define('TXT_INDIC_BUSCAR_BASE', 'Buscar indicador base');
define('TXT_INDIC_BUSCAR_COMPLEMENT', 'Buscar indicadores complementarios');
define('TXT_INDIC_SEG_DEPART', 'Seguimiento de indicadores de los departamentos');
define('TXT_INDIC_CONFIRM_ASIG_MED', 'Por favor, confirme si desea asignar esta medición.');
define('TXT_INDIC_ACT_MED', 'Indique si además quiere activarla: ');
define('TXT_INDIC_DAT_MED_NULA_AGRUPADOS', 'Indicadores y datos con mediciones nulas agrupados');
define('TXT_INDIC_DAT_MED_NULA', 'Indicadores y datos con mediciones nulas');
define('TXT_INDIC_DAT_ULTIMA_MOD', 'Indicadores y datos, última modificación');
define('TXT_INDIC_DAT_SIN_MED', 'Indicadores y datos sin mediciones');
define('TXT_INDIC_DAT_VAL_REF', 'Indicadores/datos: valores de referencia');
define('TXT_INDIC_DAT_DEPENDIENTES', 'Indicadores/datos dependientes');
define('TXT_INDIC_DAT_CALCULADO', 'Calculado automáticamente');

//Informes
define('TXT_INFORME_IC', 'Informe generado por ICASUS');
define('TXT_INFORME_REBIUN', 'Informe Rebiun'); //2012
define('TXT_INFORME_LIST', 'Lista de informes disponibles');
define('TXT_INFORMES_CONSTRUCTOR', 'Constructor de informes');
define('TXT_INFORME_SEL_INDIC', 'Seleccionar los indicadores que contendrá el informe:');
define('TXT_INFORME_SEL_ANYO', 'Seleccionar los años que se reflejarán en el informe:');
define('TXT_NUM_CONVOCATORIAS', 'Número de convocatorias');
define('TXT_PLAZO_CONVOCATORIAS', 'Plazo convocatorias');
define('TXT_INDICE_PARTICIPACION', 'Índice de participación');
define('TXT_INDICE_SATISFACCION', 'Índice de satisfacción general');
define('TXT_VOL_TRAMITACION', 'Volumen tramitación');
define('TXT_FIABILIDAD_TRAMIT_EXPED', 'Fiabilidad tramitación expedientes');
define('TXT_PRESTAMO_USER', 'Préstamo por Usuario potencial');

//Login
define('TXT_BIENVENIDO', 'Bienvenido a icasus');
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
define('TXT_MED_DES', 'Medición desagregada en las subunidades y cumplimentada por los responsables de las subunidades, o la persona delegada.');
define('TXT_MED_DES_CEN', 'Medición desagregada en las subunidades y cumplimentada de manera centralizada por el responsable de medición del indicador.');
define('TXT_MED_ESTA', 'esta medición.');
define('TXT_MED_BORRAR', 'Borrar medición');
define('TXT_MED_ACT_TODAS', 'Activar todas las mediciones.');
define('TXT_MED_DESACT_TODAS', ' Desactivar todas las mediciones.');
define('TXT_MED_ASIG', ' Asignar la medición.');
define('TXT_MED_GENERAR', 'Generar medición/es');
define('TXT_MED_CARGAR', 'Cargar medición/es');
define('TXT_MED_TABLA', 'Tabla de mediciones');
define('TXT_MED_ULTIMA', 'Última medición');
define('TXT_MEDS_BORRAR', 'Borrar mediciones');

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
define('TXT_MIS_NOTAS', 'Mis notas');
define('TXT_CERRAR_SESION', 'Cerrar sesión');
//Menú de Unidades
define('TXT_INICIO_DESCRIPCION', 'Mi icasus: listado de sus competencias/responsabilidades.');
define('TXT_PROCS_DESCRIPCION', 'Procesos: listado de procesos de la unidad e información sobre los mismos. ');
define('TXT_INDICS_DESCRIPCION', 'Indicadores: listado de indicadores de la unidad e información sobre los mismos.');
define('TXT_DATOS_DESCRIPCION', 'Datos: listado de datos de la unidad e información sobre los mismos.');
define('TXT_CUADRO_MANDO_DESCRIPCION', 'Cuadros de mando: paneles con información variada sobre indicadores y datos.');
define('TXT_CONSULTA_DESCRIPCION', 'Consulta: efectuar consultas y operaciones que muestran información sobre los indicadores y datos de la unidad.');
define('TXT_CONTROL_DESCRIPCION', 'Control: controle las mediciones y valores de los distintos indicadores y datos de la unidad.');

//Navegación
define('TXT_MOSTRANDO', 'Mostrando');
define('TXT_MOSTRAR_RESUL', 'Mostrar resultado');
define('TXT_MOSTAR_OCULTAR_NAV', 'Mostrar/Ocultar navegación');
define('TXT_REGS_TODOS', 'Todos los registros');
define('TXT_DESDE', 'desde');
define('TXT_VER', 'Ver');
define('TXT_SI', 'Si');
define('TXT_NO', 'No');
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
define('TXT_VOLVER', 'Volver al');
define('TXT_VOLVER_ARRIBA', 'Volver arriba');
define('TXT_VOLVER_INDICE', 'Volver al índice');
define('TXT_VOLVER_LIST', 'Volver al listado de');
define('TXT_VOLVER_CUADRO', 'Volver al Cuadro');
define('TXT_TOGGLED', 'Plegar/desplegar menú lateral');

//Páginas
define('TXT_PAG', 'Página');
define('TXT_PAG_CREAR', 'Crear página');
define('TXT_PAG_EDIT', 'Editar página');

//Procesos
define('TXT_PROCS', 'Procesos');
define('TXT_PROC_TODOS', 'Todos los procesos');
define('TXT_PROC_VER', 'Ver proceso');
define('TXT_PROC_MAP', 'Mapa de procesos');
define('TXT_PROC_MAP_EDIT', 'Agregar/editar mapa de procesos');
define('TXT_PROC_LIST', 'Lista de procesos');
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
define('TXT_ESTA', 'Está aquí');
define('TXT_CALCULO_TOTAL', 'Determina cómo se calcula el total entre todas las subunidades');
define('TXT_CALCULO_TOTAL_ANUAL', 'Determina cómo se calcula el total anual entre todos los periodos');
define('TXT_GRABAR', 'Grabar');
define('TXT_CANCEL', 'Cancelar');
define('TXT_EXAMINAR', 'Examinar...');
define('TXT_GEN_INFO', 'Generar informe');
define('TXT_NO_ARCHIVO_SEL', 'No se ha seleccionado ningún archivo.');
define('TXT_BTN_ACEPTAR', 'Aceptar');
define('TXT_BTN_GUARDAR', 'Guardar');
define('TXT_BTN_GRABAR_NOTA', 'Grabar nota');
define('TXT_SOLO_INDIC_CALC', 'Sólo si el valor del indicador/dato es calculado automáticamente (en función del valor de otros indicadores/datos). Deberá indicar una fórmula para el cálculo del mismo.');
define('TXT_FORMULA', "Indique la fórmula para el cálculo, la sintaxis para referirse a indicadores/datos es la siguiente: [ID del indicador/dato]. Ejemplo: [1]+[2], el resultado será la suma del valor de indicador/dato con ID=1 más el indicador/dato con ID=2. IMPORTANTE: La periodicidad debe ser la misma para todos los indicadores/datos implicados, de lo contrario no será posible el cálculo.");
define('TXT_FUENTE_INFO', 'Conceptos, ideas, normativas... por las cuales surge el indicador/dato.');
define('TXT_FUENTE_DAT', 'Documentos, aplicaciones u otras fuentes... de donde se obtienen los valores para el indicador/dato.');
define('TXT_BUSCAR', 'Buscar...');
define('TXT_VAL_INSERT', 'Introduzca un número (dentro del intervalo si existe), dejar en blanco para valor nulo.');
define('TXT_FECHA_REV_ACTUAL', 'Fecha de la revisión actual');
define('TXT_GRAFICO_AUMENTAR', '(Haga click sobre el gráfico para aumentarlo)');
define('TXT_INTERVALO', 'Sólo si se quieren limitar los valores de las mediciones a un intervalo (cerrado) de posibles valores. Por ejemplo, para resultados de encuestas. No es compatible con el cálculo automático.');

//Selecciones
define('TXT_SEL', 'Seleccionar');
define('TXT_SEL_UNO', 'Seleccionar uno');
define('TXT_ELEG_UNO', 'Elegir uno si procede');
define('TXT_SEL_RAIZ_COD_UNID', 'Seleccionar la raíz del código de unidad para el grupo que desee:');
define('TXT_SEL_RESP_GRABAR', 'Elegir nuevo responsable de grabación ...');

//Tiempo/Periodicidad
define('TXT_HISTORICO', 'Histórico anual');
define('TXT_RANGO_FECHAS', 'Rango de fechas');
define('TXT_BIENAL', 'Bienal');
define('TXT_ANUAL', 'Anual');
define('TXT_MENSUAL', 'Mensual');
define('TXT_TRIMESTRAL', 'Trimestral');
define('TXT_CUATRIMESTRAL', 'Cuatrimestral');
define('TXT_SEMESTRAL', 'Semestral');
define('TXT_2_ULT_ANYO', 'Dos últimos años');

//Tipos de Cálculo
define('TXT_CALC_AUTO', 'Este indicador/dato es calculado automáticamente');
define('TXT_INDEF', 'Indefinido');
define('TXT_SUMA', 'Suma');

//Tipos de Exportación
define('TXT_RTF', 'Rtf');
define('TXT_EXCEL', 'Excel');

//Tipos de Proceso
define('TXT_ESTRATEGICO', '1-Estratégico');
define('TXT_OPERATIVO', '2-Operativo');
define('TXT_APOYO', '3-Apoyo');

//Tipos de Representaciones Gráficas
define('TXT_GRAFIC_INDIC_VAL', 'Gráfica con los valores del indicador');
define('TXT_GRAFIC_VAL_MED', 'Gráfica completa con los valores medios del indicador');
define('TXT_BARRAS', 'Barras');
define('TXT_BARRAS_DESC', 'Puede mostrar varios grupos de indicadores/datos para una subunidad determinada en forma de barras.');
define('TXT_LINEAS', 'Líneas');
define('TXT_LINEAS_DESC', 'Muestra varios indicadores/datos para distintas subunidades como gráfica de líneas.');
define('TXT_TABLA', 'Tabla');
define('TXT_TABLA_MULTI', 'Tabla múltiple');
define('TXT_TABLA_MULTI_DESC', 'Tabla que muestra varios indicadores/datos y su evolución en los dos últimos años para una subunidad concreta.');
define('TXT_TABLA_DESC', 'Puede mostrar un indicador/dato con sus mediciones para una subunidad en forma de tabla de datos.');
define('TXT_TARTA', 'Tarta');
define('TXT_TARTA_DESC', 'Muestra como se reparte una medición de un indicador/dato entre las subunidades afectadas como gráfica de tarta.');
define('TXT_METRICA', 'Métrica');
define('TXT_METRICA_DESC', 'Muestra una medición puntual para una unidad y un indicador/dato en forma de dígitos.');

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
define('TXT_USERS_ASIG', 'Usuarios asignados actualmente');
define('TXT_USERS_DISP', 'Usuarios disponibles');
define('TXT_USERS_VINC', 'Vincular usuarios');
define('TXT_USERS_DESVINC', 'Desvincular usuarios');
define('TXT_USER_GESTION', 'Gestión de usuarios');
define('TXT_USER_NOTAS', 'Notas del usuario');
define('TXT_USER_REL', 'Relación de usuarios');
define('TXT_USER_CREAR', 'Crear usuario');
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
define('TXT_VAL_REF_EDIT', 'Editar valor de referencia');
define('TXT_VAL_REF_CREAR', 'Crear valor de referencia');
define('TXT_VAL_REF_BORRAR', 'Borrar valores de referencia');
define('TXT_VALS_DESACT', 'Desactivar valores');
define('TXT_VAL_LOGRADO', 'Meta alcanzada');
define('TXT_VAL_ACEPTABLE', 'Valor aceptable');
define('TXT_VAL_MEJORABLE', 'Valor mejorable');

//Visibilidad, permisos
define('TXT_TODOS', 'Todos');
define('TXT_PUBLICO', 'Público');
define('TXT_PRIVADO', 'Privado');

//-------------------------------------------------------------------------------------
//NOTIFICACIONES/AVISOS: MSG_[Nombre]
//-------------------------------------------------------------------------------------

define('MSG_NO_DEF', 'No se han definido.');
define('MSG_TOTAL_LINEAS', 'Total de líneas');
define('MSG_LINEAS_NO_REF_INDIC', 'líneas que no referenciaban a ningún indicador.');
define('MSG_EXITO_OP', 'Operación realizada con éxito.');
define('MSG_NO_MET_SOL', 'No existe el método solicitado.');
define('MSG_FALTAN_PARAM_MET', 'Faltan parámetros para ejecutar el método');
define('MSG_ERR', 'Por favor inténtelo de nuevo, si el problema persiste póngase en contacto con nosotros en la dirección: ');
define('MSG_GUARDAR_OK', 'Se han guardado los cambios correctamente.');
define('MSG_CAMPO_REQ', 'Campo obligatorio');
define('MSG_BUSCAR_NO_RESUL', 'No existen resultados para la búsqueda solicitada.');
define('MSG_BUSCAR_NO_TEXTO', 'No introdujo ningún texto para buscar.');
define('MSG_NO_SESION', 'Su sesión ha expirado.');

//Análisis y planes de acción
define('MSG_ANAPLAN_NO', 'Todavía no se ha registrado ningún análisis ni plan de acción para el indicador. Utilice el selector de la parte superior y los cuadros de texto para ello.');

//Archivos
define('MSG_ARCHIVO_BORRAR_CONFIRM', 'Por favor, confirme si desea borrar el archivo');
define('MSG_ARCHIVO_SUBIDA_OK', 'Se ha subido correctamente el archivo.');
define('MSG_ARCHIVO_RENOMBRAR', 'Recuerda que el nombre del archivo es el que se verá en la relación inferior, por ello renombra tu archivo antes de subirlo para que sea clarificador para los que vayan a descargarlo.');
define('MSG_ARCHIVO_NOMBRE', 'IMPORTANTE: los nombres de los archivos no deben contener caracteres como ñ, acentos o espacios en blanco.');
define('MSG_ARCHIVO_BORRADO', 'Se ha borrado el archivo.');
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
define('MSG_PANEL_BORRAR', 'Va a borrar del cuadro de mando este panel, ¿está seguro?');
define('MSG_PANEL_EDITADO', "Panel editado correctamente:");
define('MSG_PANEL_CREADO', "Se ha añadido al cuadro de mando el siguiente panel:");
define('MSG_PANEL_CONFIRM_EDITAR', 'Va a editar este panel, ¿está seguro?');

//Datos
define('MSG_DATOS_NO', 'No hay datos definidos para ninguna unidad.');
define('MSG_DATO_BORRADO', 'Se ha borrado el dato: ');
define('MSG_DATO_ACTUALIZADO', 'Se ha actualizado el dato');
define('MSG_DATO_CONFIRM_BORRAR', '¿Realmente quiere borrar este dato?');
define('MSG_DATO_CONFIRM_EDITAR', 'Va a editar este dato, ¿está seguro?');
define('MSG_DATO_CREADO', 'Se ha creado un nuevo dato');
define('MSG_DATO_EXPORT_OK', 'Los datos se han exportado correctamente: ');
define('MSG_DATO_NO_SUBUNID_ASIG', 'No se han asignado subunidades a este dato (corregir)');
define('MSG_DATO_PERIODICIDAD', 'IMPORTANTE: Cambió la periodicidad del dato. Por favor, revise las mediciones: borre aquellas que considere no válidas.');
define('MSG_DATO_NO_ASIG', 'No dispone de datos bajo su responsabilidad.');

//Dimensiones
define('MSG_DIM_CREADA', 'Se ha creado una dimensión.');
define('MSG_DIM_EDITADA', 'Se ha modificado una dimensión.');

//Entidades (Unidades)
define('MSG_UNID_NO_PROC', 'No hay procesos definidos para esta unidad.');
define('MSG_UNID_NO_MAPA', 'No existe un mapa de procesos definido para esta unidad.');
define('MSG_UNID_NO_ARCHIVOS', 'No se han subido archivos en esta unidad.');
define('MSG_UNID_USERS_BORRADOS', 'Se han eliminado de la unidad');
define('MSG_UNID_USERS_AGREGADOS', 'Se han agregado a la unidad');
define('MSG_UNID_CONFIRM_EDITAR', 'Va a editar esta unidad, ¿está seguro?');
define('MSG_UNID_EDITADA', 'La unidad se ha modificado con los datos que aparecen a continuación.');
define('MSG_UNID_NO_USERS', 'No se han vinculado usuarios a esta unidad.');
define('MSG_UNID_NO_DATOS', 'No hay datos definidos para esta unidad.');
define('MSG_UNID_NO_INDIC', 'No hay indicadores definidos para esta unidad.');
define('MSG_UNID_NO_CUADROS', 'No hay cuadros de mando definidos para esta unidad.');
define('MSG_UNID_NO_IND_NO_DAT', 'No hay indicadores ni datos definidos para esta unidad.');
define('MSG_UNID_SUBUNIDS_NO_INDIC', 'No hay indicadores definidos para las subunidades de esta unidad.');
define('MSG_UNID_SUP_NO_PROC', 'La unidad madre no tiene procesos.');
define('MSG_UNID_NO_SEG', 'Esta unidad no mide indicadores segregados.');
define('MSG_UNID_NO_SUBUNIDS', 'Esta unidad no tiene subunidades.');
define('MSG_UNID_CREADA', 'La unidad se ha creado correctamente con los datos que aparecen a continuación: ');
define('MSG_UNID_NO_ASIG', 'No tiene asignada ninguna unidad.');
define('MSG_UNIDS_NO_EXISTEN', 'Actualmente, no existen unidades orgánicas.');

//Indicadores
define('MSG_INDICS_NO', 'No hay indicadores definidos para ninguna unidad.');
define('MSG_INDIC_NO_UNID_SUP', 'No hay indicadores definidos en la unidad superior.');
define('MSG_INDIC_NO_SUBUNID_ASIG', 'No se han asignado unidad/subunidades a este indicador (corregir).');
define('MSG_INDIC_NO_VAL', 'No hay valores recogidos para este indicador/dato.');
define('MSG_INDIC_CREADO', 'Se ha creado un nuevo indicador.');
define('MSG_INDIC_NO_ENC', 'No se han encontrado indicadores/datos.');
define('MSG_INDIC_CONFIRM_BORRAR', '¿Realmente quiere borrar este indicador?');
define('MSG_INDIC_CONFIRM_EDITAR', 'Va a editar este indicador, ¿está seguro?');
define('MSG_INDIC_BORRADO', 'Se ha borrado el indicador: ');
define('MSG_INDIC_COPIADOS', 'Indicadores copiados.');
define('MSG_INDIC_ACTUALIZADO', 'Se han actualizado los datos del indicador.');
define('MSG_INDIC_NO_PUBLIC', 'Este indicador no está definido como público.');
define('MSG_INDIC_NO_VAL_REF', 'No se han definido valores de referencia para este indicador/dato.');
define('MSG_INDIC_NO_DATOS', 'Todavía no se han introducido datos en este indicador.');
define('MSG_INDIC_NO_MED', 'Todavía no se han definido mediciones para este indicador.');
define('MSG_INDIC_PERIODICIDAD', 'IMPORTANTE: Cambió la periodicidad del indicador. Por favor, revise las mediciones: borre aquellas que considere no válidas.');
define('MSG_INDIC_NO_ASIG', 'No dispone de indicadores bajo su responsabilidad.');

//Mediciones
define('MSG_MED_NO_TIPO', 'Todavía no se han establecido mediciones para este');
define('MSG_MED_NO_REBIUN', 'Todavía no se han generado las mediciones del año anterior para los datos Rebiun. Por favor, genere antes las mediciones.');
define('MSG_MED_NO_ASIG', 'No tiene asignada ninguna medición.');
define('MSG_MED_BORRADA', 'La/s medición/es se ha/n borrado con éxito.');
define('MSG_MED_CONFIRM_BORRAR', 'Confirme si desea borrar esta medición. Recuerde que se borrarán los valores y los valores de referencia recogidos para esta medición.');
define('MSG_MEDS_CONFIRM_BORRAR', 'Confirme si desea borrar las mediciones seleccionadas. Recuerde que se borrarán todos los valores y valores de referencia de las mediciones que sean eliminadas.');
define('MSG_MEDS_GRABADAS', 'Mediciones grabadas');
define('MSG_MED_ETIQUETA_NULA', 'La etiqueta no puede estar vacía. Puede restituir el valor anterior pulsando el icono "X" (cancelar).');
define('MSG_MED_VAL_NO_PERIODO', 'No se pueden grabar valores, esta fuera del periodo de grabación:');
define('MSG_MED_VAL_NULO', 'Está intentando introducir un valor vacío. Puede restituir el valor anterior pulsando el icono "X" (cancelar). Puede dejarlo en blanco (nulo) introduciendo tres guiones seguidos (---).');
define('MSG_MED_VAL_INTERVALO', 'Debe insertar un valor que este dentro del intervalo de valores permitidos por el indicador/dato:');
define('MSG_MED_VAL_NOMUM', 'Está intentando introducir un dato que no es reconocido como número.');
define('MSG_MEDS_INDIC_NO_UNID', 'Mediciones en la muestra, de indicadores que no pertenecen a la Unidad actual.');
define('MSG_MED_CREADA', 'Se ha agregado correctamente una nueva medición. Unidades afectadas: ');
define('MSG_MED_GENERAR', 'Esta acción, generará automáticamente todas las mediciones (si no existen), desde el año fijado (mínimo año del histórico) hasta el año actual. Tomará algo de tiempo en función del año seleccionado y la periodicidad del indicador/dato, ¿está seguro?');
define('MSG_MED_CARGAR', 'Esta acción, cargará la cantidad indicada de registros de las mediciones del indicador/dato. Tomará algo de tiempo en función del número de registros seleccionado, ¿está seguro?');
define('MSG_MED_GENERANDO', 'Generando mediciones... espere por favor.');
define('MSG_MED_CARGANDO', 'Cargando mediciones... espere por favor.');
define('MSG_MED_GENERADA', 'Se ha/n generado correctamente todas la/s medición/es.');
define('MSG_MED_EXISTE', 'Se ha/n generado sólo la/s medición/es no existente/s desde el año seleccionado.');
define('MSG_MEDS_NO_MARCADAS', 'No se ha marcado ninguna medición para borrar.');

//Páginas
define('MSG_PAG_NUEVA_OK', 'La página se ha creado correctamente.');
define('MSG_PAG_CONFIRM_EDITAR', 'Va a editar esta página, ¿está seguro?');
define('MSG_PAG_EDIT_OK', 'La página se ha modificado correctamente.');

//Procesos
define('MSG_PROCS_NO', 'No hay procesos definidos para ninguna unidad.');
define('MSG_PROC_NO_ASIG', 'No dispone de procesos en propiedad.');
define('MSG_PROC_BORRADO', 'Se ha borrado el proceso: ');
define('MSG_PROC_CONFIRM_EDITAR', 'Va a editar este proceso, ¿está seguro?');
define('MSG_PROC_CONFIRM_BORRAR', '¿Realmente quiere borrar este proceso?');
define('MSG_PROC_GRABAR', 'Se ha grabado un nuevo proceso para esta unidad.');
define('MSG_PROC_EDITADO', 'Se ha modificado el proceso correctamente.');
define('MSG_PROC_NO_INDIC', 'No se ha definido ningún indicador para este proceso.');
define('MSG_PROC_NO_ARCHIVO', 'No se han subido archivos para este proceso.');
define('MSG_PROC_MAPA', 'Para agregar/editar el mapa de procesos de su unidad, póngase en contacto con nosotros a través de la dirección: ');

//Usuarios
define('MSG_USER_BORRADO', 'Se ha borrado el usuario.');
define('MSG_USER_CREADO', 'Se ha creado un nuevo usuario en el sistema.');
define('MSG_USER_EDITADO', 'El usuario se ha modificado correctamente.');
define('MSG_USERS_CONFIRM_VINC', '¿Desea vincular a la unidad los usuarios marcados?');
define('MSG_USERS_CONFIRM_DESVINC', '¿Desea desvincular de la unidad los usuarios marcados?');

//valores
define('MSG_VAL_NO_ASIG', 'Todavía no se han asignado valores a esta medición.');
define('MSG_VAL_BORRADO', 'Se ha borrado un valor.');
define('MSG_VAL_EXPORT', 'Exportando valores para:');
define('MSG_VAL_GRABAR', 'El valor se ha grabado correctamente.');
define('MSG_VALS_CALCULADOS', 'Se han calculado/actualizado los valores correctamente.');
define('MSG_VALS_CONFIRM_DESACT', '¿Desea desactivar los valores marcados?');
define('MSG_VALS_REF_CONFIRM_BORRAR', '¿Desea borrar los valores de referencia marcados?');
define('MSG_VALS_REF_BORRADO', 'Se han borrado:');
define('MSG_VALS_REF_NO_MARCADOS', 'No se ha marcado ningún valor de referencia.');
define('MSG_VALS_DESACT', 'Se han desactivado:');

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
define('ERR_CONSULTA_EXE', 'Fallo en la consulta ejecución');
define('ERR_DIR', 'Error no se ha podido crear el directorio tipo objeto.');
define('ERR_SUBDIR', 'Error no se ha podido crear el subdirectorio objeto.');
define('ERR_NO_DIR_NAME', 'No se ha proporcionado un nombre de directorio.');
define('ERR_PARAM', 'Faltan parámetros para realizar esta acción.');
define('ERR_PARAM_INC', 'Parámetros incorrectos.');
define('ERR_FALTAN_PAR_IMPORT', 'Faltan parámetros para la importación.');
define('ERR_PARAM_PAG', 'Faltan parámetros para mostrar la página solicitada.');
define('ERR_FALTAN_PARAM_CONSULTA', 'Parámetros insuficientes para realizar la consulta.');
define('ERR_NO_AUT_MOD', 'No tiene permisos para acceder a este módulo de la aplicación.');
define('ERR_INFORM_INDIC', 'No se puede generar el informe del indicador por falta de parámetros.');
define('ERR_GUARDAR', 'Hubo un problema, no se han podido guardar los cambios.');

//Archivos
define('ERR_ARCHIVO_BORRAR', "Faltan datos para procesar la solicitud de borrado del archivo.");
define('ERR_ARCHIVO_NO', 'No existe el archivo con el identificador:');
define('ERR_ARCHIVO_GRABAR', 'Error no se han podido grabar los datos del archivo.');
define('ERR_ARCHIVO_SUBIR', 'No se ha podido subir el archivo, consulte al administrador del sistema.');
define('ERR_ARCHIVO_NO_SEL', 'No se ha especificado ningún archivo para subir.');

//Cuadros de Mando
define('ERR_CUAD_MANDO', 'El cuadro de mando no existe o no tiene permisos para consultarlo.');
define('ERR_CUAD_MANDO_PARAM', 'Parámetros insuficientes para mostrar el cuadro de mando.');
define('ERR_CUAD_MANDO_EDIT', 'El cuadro de mando no existe o no tiene permisos para editarlo.');

//Datos
define('ERR_DATO_CREAR', 'Faltan parámetros para crear un nuevo dato.');
define('ERR_DATO_BORRAR_MED', 'Tiene mediciones asociadas al dato, necesita borrar primero las mediciones.');
define('ERR_DATO_BORRAR_NO_AUT', 'No tiene permisos para borrar el dato.');
define('ERR_DATO_GRABAR', 'No se ha podido grabar el dato.');
define('ERR_DATO_MOSTRAR', 'No se puede mostrar el dato, el identificador no existe en la base de datos.');
define('ERR_DATO_IMPORT_NO_AUT', 'No tiene autorización para importar datos en esta unidad.');
define('ERR_DATO_EDIT_NO_AUT', 'No tiene permisos suficientes para editar datos de esta unidad.');
define('ERR_DATO_BORRAR_DEP', 'Este dato influye en el cálculo de otros indicadores/datos. Debe eliminar éstos primero.');

//Dimensiones
define('ERR_DIM_CREAR', 'No se ha podido crear la dimensión.');

//Entidades (Unidades)
define('ERR_UNID', 'No ha especificado la unidad.');
define('ERR_UNID_NO_SEL', 'No se ha especificado una unidad para asignar usuarios.');
define('ERR_UNID_LIST_INDIC', 'No ha especificado la unidad cuyos indicadores desea listar.');
define('ERR_UNID_EDIT', 'No se ha podido modificar la unidad');

//Gráficas
define('ERR_PARAM_GRAFIC', 'Faltan parámetros para mostrar la gráfica.');

//Indicadores
define('ERR_INDIC_BORRAR_MED', 'Tiene mediciones asociadas al indicador, necesita borrar primero las mediciones.');
define('ERR_INDIC_BORRAR_DEP', 'Este indicador influye en el cálculo de otros indicadores/datos. Debe eliminar éstos primero.');
define('ERR_INDIC_BORRAR_NO_AUT', 'No tiene permisos para borrar el indicador.');
define('ERR_INDIC_EDIT_NO_AUT', 'No tiene permisos suficientes para editar indicadores/datos de esta unidad');
define('ERR_INDIC_GRABAR', 'No se ha podido grabar el indicador.');
define('ERR_INDIC_MOSTRAR', 'No se puede mostrar el indicador, el identificador no existe en la base de datos.');

//Mediciones
define('ERR_MED_CREAR', 'Faltan datos para procesar la petición de generar mediciones.');
define('ERR_MED_AUT', 'No tiene permisos suficientes para agregar mediciones a este');
define('ERR_MED_RESP', 'No tiene permisos suficientes para editar responsables en esta medición');
define('ERR_MED_TIPO_NO_BD', 'solicitado no existe en la base de datos');
define('ERR_MED_NO_VAL', 'No existen valores pendientes ni recogidos para esta medición.');
define('ERR_MED_GRABAR', 'Ha ocurrido un error al grabar la medición, inténtelo de nuevo o contacte con los administradores de icasus.');
define('ERR_MED_BORRAR', 'No se puede borrar la medicion ya que influye en el cálculo de otros indicadores/datos. Borre éstos primero');

//Procesos
define('ERR_PROC_BORRAR', 'Tiene indicadores asociados al proceso, necesita borrar primero los indicadores.');
define('ERR_PROC_BORRAR_NO_AUT', 'No tiene persimos para borrar el proceso.');
define('ERR_PROC_GRABAR', 'Ha ocurrido un error al grabar el proceso.');

//Usuarios
define('ERR_LOGIN', 'Usuario o clave incorrecta.');
define('ERR_LOGIN_SSO', 'El usuario pertenece al colectivo que tiene permiso para utilizar esta herramienta pero no se ha podido dar de alta en la herramienta. Contactar con icasus@us.es');
define('ERR_LOGIN_SSO_AUT', 'La relacion de este usuario con la Universidad no es la definida para utilizar esta herramienta. Contactar con icasus@us.es');
define('ERR_USER_EDIT_NO_AUT', 'No tiene permiso para editar a este usuario.');

//Valores
define('ERR_VAL_GRABAR', 'Se ha producido un error, no se ha grabado el valor.');
define('ERR_VAL_REF_BORRAR', 'No se puede borrar un valor de referencia con valores asignados a alguna medición.');

//-----------------------------------------------------------------------------------
//CAMPOS DE LAS TABLAS: FIELD_[Nombre]
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
define('FIELD_FECHA_HORA', 'Fecha/Hora');
define('FIELD_WEB', 'Sitio web');
define('FIELD_FUENTE', 'Fuente');
define('FIELD_PERIODO', 'Periodo');
define('FIELD_VISIBILIDAD', 'Visibilidad');
define('FIELD_UMBRAL', 'Umbral');
define('FIELD_LIMITE', 'Límite');
define('FIELD_META', 'Meta');
define('FIELD_CREAC', 'Creación');
define('FIELD_MOD', 'Modificación');
define('FIELD_FECHA_REV', 'Fecha de revisión');
define('FIELD_FECHA_OBTENCION', 'Fecha de obtención');
define('FIELD_FECHA_RECOGIDA', 'Fecha recogida');
define('FIELD_AGREG', 'Agregado');
define('FIELD_INTERP', 'Interpretación');
define('FIELD_STANDARD', 'Estándar');
define('FIELD_INFORM', 'Informe');
define('FIELD_NIVEL_DES', 'Nivel de desagregación');
define('FIELD_INICIO_PERIODO', 'Inicio del periodo');
define('FIELD_FIN_PERIODO', 'Fin del periodo');
define('FIELD_INICIO_GRABACION', 'Inicio de grabación');
define('FIELD_FIN_GRABACION', 'Fin de grabación');
define('FIELD_MEDIDOR', 'Medidor');
define('FIELD_ETIQUETA', 'Etiqueta');
define('FIELD_ETIQUETA_MINI', 'Etiqueta mini');
define('FIELD_PENDIENTES', 'Pendientes');
define('FIELD_EVENTO', 'Evento');
define('FIELD_CAMBIO_A', 'Cambio a:');
define('FIELD_ALIAS', 'Alias');
define('FIELD_ORDEN', 'Orden');
define('FIELD_ANCHO', 'Ancho');
define('FIELD_ANYO', 'Año');
define('FIELD_TOTAL', 'Total');
define('FIELD_MISION', 'Misión');
define('FIELD_RESULTS_CLAVE', 'Resultados Clave');
define('FIELD_ENTRADAS_PROV', 'Entradas/Proveedores');
define('FIELD_SALIDAS_CLIENTS', 'Salidas/Clientes');
define('FIELD_ACTIVIDADES', 'Actividades');
define('FIELD_VARS_CONTROL', 'Variables de control');
define('FIELD_DOCUMENTACION', 'Documentación');
define('FIELD_REGISTROS', 'Registros');
define('FIELD_DET', 'Detalle');
define('FIELD_OBSERV', 'Observaciones');
define('FIELD_ACTIVO', 'Activo');
define('FIELD_VERSION', 'Versión');
define('FIELD_STATUS', 'Status');

//Archivos
define('FIELD_ARCHIVO', 'Archivo');

//Cuadros de Mando
define('FIELD_NOMBRE_CUADRO', 'Nombre del cuadro de mando');
define('FIELD_COMENTARIOS', 'Comentarios');

//Datos
define('FIELD_DATO', 'Dato');
define('FIELD_RESP_DATO', 'Responsable del dato');
define('FIELD_FUENTE_DAT', 'Fuente de datos');
define('FIELD_DATOS', 'Datos');

//Entidades (Unidades)
define('FIELD_UNID', 'Unidad');
define('FIELD_UNID_RPT', 'Unidad RPT');
define('FIELD_UNID_SUP', 'Unidad superior');
define('FIELD_UNID_GEN', 'Unidad generadora');
define('FIELD_UNID_DEST', 'Unidad de destino');
define('FIELD_SUBUNID', 'Subunidad');
define('FIELD_SUBUNIDS', 'Subunidades');
define('FIELD_SUBUNID_AFECT', 'Unidad/Subunidades afectadas');
define('FIELD_UNIDS', 'Unidades');
define('FIELD_ORGANICA', 'Orgánica');
define('FIELD_ANOTACION', 'Anotaciones');

//Gráficas
define('FIELD_VISIB_GRAFIC', 'Visible en gráfica');

//Indicadores
define('FIELD_INDIC', 'Indicador');
define('FIELD_INDIC_BASE', 'Indicador/dato base');
define('FIELD_INDIC_COMPLEMENT', 'Indicadores/datos complementarios');
define('FIELD_INDICS', 'Indicadores');
define('FIELD_FORM', 'Formulación');
define('FIELD_FORMULA', 'Fórmula de cálculo');
define('FIELD_FUENTE_INFO', 'Fuente de Información');
define('FIELD_PERIOD', 'Periodicidad');
define('FIELD_RESP', 'Responsable');
define('FIELD_RESP_SEG', 'Responsable de Seguimiento');
define('FIELD_RESP_GRABAR', 'Responsable de Grabación');
define('FIELD_MET', 'Método de comprobación (evidencia)');
define('FIELD_EFQM', 'Criterios EFQM');
define('FIELD_HISTORICO', 'Histórico');
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

//Procesos
define('FIELD_PROC', 'Proceso');
define('FIELD_PROC_MADRE', 'Proceso madre');
define('FIELD_TIPO_PROC', 'Tipo de proceso');
define('FIELD_SUBPROCS', 'Subprocesos');
define('FIELD_EQUIP_PROC', 'Equipo de proceso');

//Usuarios
define('FIELD_LOGIN', 'Login');
define('FIELD_USER', 'Usuario');
define('FIELD_CLAVE', 'Clave de acceso');
define('FIELD_REP_CLAVE', 'Repetir clave de acceso');
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
