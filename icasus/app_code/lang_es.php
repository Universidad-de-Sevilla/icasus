<?php

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

define('TXT_ICASUS', 'ICASUS');
define('TXT_BIENVENIDO', 'Bienvenido a Icasus');
define('TXT_UNIVERSIDAD', 'Universidad de Sevilla');
define('TXT_DEPARTAMENTOS', 'Departamentos');
define('TXT_BIBLIOTECAS', 'Bibliotecas');
define('TXT_FOOTER', 'ICASUS - APLICACIÓN DE GESTIÓN DE CALIDAD DE LOS SERVICIOS DE LA UNIVERSIDAD DE SEVILLA');
define('TXT_CONTROL', 'Control');
define('TXT_OTRO_OFIMATICA', 'Microsoft Office o cualquier otro programa de ofimática.');
define('TXT_NO_ASIG', 'No asignado');
define('TXT_REG_EVENTOS', 'Registro de eventos');
define('TXT_NULO', 'NULO');
define('TXT_CONTENIDO', 'Contenido de');
define('TXT_A_Q_ESPERAS', '¿A qué esperas?');
define('TXT_RESPONSABLES_GRABAR', 'Responsables de grabación');
define('TXT_INTRO_TEXTO', 'Introduce texto');
define('TXT_MANUAL', 'Manual');

//Accesibilidad (atributo alt de las imágenes)
define('TXT_FOTO_PERFIL', 'Foto de perfil');
define('TXT_REP_GRAFIC', 'Representación gráfica del indicador');
define('TXT_EXPORT_CSV', 'Exportar en CSV');
define('TXT_ICON', 'Icono');
define('TXT_ICON_GRAF_LINEAL', 'Icono gráfica lineal');
define('TXT_LEYENDA', 'Leyenda');
define('TXT_ACT_DESACT', 'Activar y desactivar');

//Archivos
define('TXT_ARCHIVOS_PROC', 'Archivos del proceso: ');
define('TXT_ARCHIVO_SUBIR_NUEVO', 'Subir nuevo archivo');
define('TXT_ARCHIVO_SUBIR', 'Subir archivo');
define('TXT_ARCHIVOS_SUBIR', 'Subir archivos');
define('TXT_ARCHIVO_ACTUALIZAR_DATOS', 'Actualizar datos del archivo');
define('TXT_ARCHIVO_ACTUALIZAR', 'Actualizar archivo');
define('TXT_ARCHIVO_NUEVO', 'Nuevo archivo');
define('TXT_ARCHIVO_BORRAR', 'Borrar archivo');
define('TXT_ARCHIVOS', 'Archivos');
define('TXT_ARCHIVO_SEL_IMPORT', 'Elija un archivo para importar');
define('TXT_ARCHIVO_PROCESAR', 'Procesa archivo');
define('TXT_ARCHIVOS_PROCESAR', 'Procesar archivos');
define('TXT_ARCHIVO_DESCARGA', 'Descargar archivo');
define('TXT_ARCHIVO_ABRIR_CSV', 'El archivo .csv generado puede abrirse con: ');
define('TXT_ARCHIVO_IMPORT_CSV', 'Importar archivo CSV');

//Clasificación
define('TXT_POR_MEDICION', 'Por medición');
define('TXT_POR_ANYOS', 'Por años');

//Consulta
define('TXT_CONSULT', 'Consulta');
define('TXT_CONSULT_PARAM', 'Parámetros de la consulta');
define('TXT_CONSULT_AVAN', 'Consulta Avanzada de Indicadores y Datos');

//Cuadros de Mando
define('TXT_CUADRO_MANDO', 'Cuadro de Mando');
define('TXT_CUADROS_MANDO_PUBLIC', 'Cuadros de Mando públicos');
define('TXT_CUADRO_NUEVO', 'Nuevo Cuadro de Mando');
define('TXT_CUADRO_MANDO_PROPIOS', 'Tus Cuadros de Mando');
define('TXT_CUADRO_EDIT', 'Editar Cuadro de Mando');
//Paneles de los Cuadros de Mando
define('TXT_PANEL_NUEVO', 'Nuevo Panel');
define('TXT_PANEL_AGREGAR', 'Agregar Panel');
define('TXT_PANELES_INFO', 'Información sobre los Paneles');

//Datos
define('TXT_DATO_MEDICIONES', 'Mediciones del Dato');
define('TXT_DATO', 'Dato');
define('TXT_DATO_EDIT', 'Editar Dato');
define('TXT_DATO_FICHA', 'Ficha del Dato');
define('TXT_DATO_NUEVO', 'Nuevo Dato');
define('TXT_DATO_PARAM', 'Parámetros del Dato');
define('TXT_DATO_CREAR', 'Crear Dato');
define('TXT_DATOS_LIST', 'Lista de Datos');
define('TXT_DATOS_REBIUN', 'Datos Rebiun');
define('TXT_DATOS_REBIUN_RECOGIDA', 'Recogida Datos Rebiun');
define('TXT_DATOS_EXPORT', 'Exportar Datos');
define('TXT_DATOS_OTROS', 'Otros Datos');
define('TXT_DATOS_REBIUN_DET', 'Detalle Datos Rebiun'); //2012
define('TXT_DATOS_REBIUN_SUMA', 'Suma Datos Rebiun');
define('TXT_DATOS_REBIUN_PROMEDIO', 'Promedio Datos Rebiun');
define('TXT_DATOS_REBIUN_DET_EXPORT_CSV', 'Exportar en CSV detalle Datos Rebiun');
define('TXT_DATOS_REBIUN_SUMA_EXPORT_CSV', 'Exportar en CSV suma Datos Rebiun');
define('TXT_DATOS_REBIUN_PROMEDIO_EXPORT_CSV', 'Exportar en CSV promedio Datos Rebiun');

//Dimensiones
define('TXT_DIM_CREAR', 'Crear Dimensión');
define('TXT_DIM_EDIT', 'Editar Dimensión');
define('TXT_DIM_LIST', 'Lista de Dimensiones');
define('TXT_DIM_REL', 'Relación de Dimensiones');

//Entidades (Unidades)
define('TXT_UNID', 'Unidad');
define('TXT_UNID_SUP_INDIC', 'Indicadores de la Unidad Superior');
define('TXT_UNID_INDIC_SEG', 'Indicadores segregados en los que mide la Unidad');
define('TXT_UNID_TODAS', 'Todas las Unidades');
define('TXT_UNID_SEL', 'Seleccione o comience a teclear el nombre de la Unidad a la que se copiará el Indicador.');
define('TXT_SUBUNID', 'La Subunidad');
define('TXT_SUBUNID_MEDS', 'tiene vinculada las siguientes Mediciones con los correspondientes valores');
define('TXT_UNID_NUEVA', 'Nueva Unidad');
define('TXT_UNID_FICHA', 'Ficha de Unidad');
define('TXT_UNID_LIST', 'Lista de Unidades');
define('TXT_UNID_PROC_LIST', 'Lista de procesos de la Unidad con sus Indicadores');
define('TXT_UNID_EDIT', 'Editar Unidad');
define('TXT_UNIDS_MEDS_INDIC', 'Unidades con Mediciones en el Indicador');
define('TXT_UNIDS_UE01', 'Unidades UE01 con sus Indicadores, Valores y Fecha');

//Indicadores
define('TXT_INDIC_SUBUNID', 'Relación de Indicadores de Subunidades');
define('TXT_INDIC_PROP', 'Indicadores propios de la Unidad');
define('TXT_INDIC_MED', 'Mediciones del Indicador');
define('TXT_INDIC_PARAM', 'Parámetros del Indicador');
define('TXT_INDIC_NUEVO', 'Nuevo Indicador');
define('TXT_INDIC_IR', 'Ir al Indicador');
define('TXT_INDIC_VOLVER', 'Volver al Indicador');
define('TXT_INDIC_MOSTRAR', 'Mostrar Ficha del Indicador');
define('TXT_INDIC_FICHA', 'Ficha del Indicador');
define('TXT_INDIC_CREAR', 'Crear Indicador');
define('TXT_INDIC_LIST', 'Lista de Indicadores');
define('TXT_INDIC_EDIT', 'Editar Indicador');
define('TXT_INDIC_BORRAR', 'Borrar Indicador');
define('TXT_INDICS_COPIAR', 'Copiar Indicadores');
define('TXT_INDICS_DIC', 'Diccionario de Indicadores');
define('TXT_INDICS_MIO', 'Mis Indicadores');
define('TXT_INDIC_DAT', 'Datos del Indicador');
define('TXT_INDIC_GEN_INFO_WORD', 'Generar un informe en Word de este Indicador');
define('TXT_INDIC_EXPORT_EXCEL', 'Exportar los datos del Indicador a Excel');
define('TXT_INDIC_PUBLIC', 'Indicadores públicos');
define('TXT_INDIC_ACARGO', 'Indicadores a su cargo');
define('TXT_INDIC_BUSCAR_BASE', 'Buscar Indicador Base');
define('TXT_INDIC_BUSCAR_COMPLEMENT', 'Buscar Indicadores Complementarios');
define('TXT_INDIC_SEG_DEPART', 'Seguimiento de Indicadores de los Departamentos');
define('TXT_INDIC_CONFIRM_ASIG_MED', 'Por favor, confirme si desea asignar esta Medición.');
define('TXT_INDIC_ACT_MED', 'Marque la casilla si además quiere activarla');
define('TXT_INDIC_SUBUNID_VAL', 'Valores de las subunidades para');
define('TXT_INDIC_DAT_MED_NULA', 'Indicadores y Datos con Mediciones nulas');
define('TXT_INDIC_DAT_SIN_MED', 'Indicadores y Datos sin Mediciones');

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
define('TXT_LOGIN', 'Iniciar sesión');
define('TXT_LOGIN_PARTE1', 'es una aplicación web para la gestión de la calidad en la');
define('TXT_LOGIN_PARTE2', 'Para acceder al sistema es necesario ser miembro activo de alguno de los grupos de calidad de la Universidad de Sevilla y solicitar autorización de acceso al responsable de su grupo de calidad.');
define('TXT_LOGIN_PARTE3', 'Icasus ha sido desarrollado por el');
define('TXT_LOGIN_PARTE4', 'y puede utilizarse como');
define('TXT_LOGIN_PARTE5', 'Puede bajar una primera versión del');
define('TXT_LOGIN_PARTE6', 'en formato PDF. Revisión disponible: 26 mayo 2010');
define('TXT_AREA_REC_HUM', 'Área de Recursos Humanos de la Universidad de Sevilla');
define('TXT_SOFT_LIBRE', 'Software Libre');
define('TXT_IC_MANUAL', 'Manual de referencia rápida de Icasus');
define('TXT_CERRAR_SESION', 'Cerrar sesión');

//Mediciones
define('TXT_MED_UNICA', 'Medición única en la Unidad actual');
define('TXT_MED_DES', 'Medición desagregada en las Subunidades y cumplimentada por los responsables de las Subunidades, o la persona delegada.');
define('TXT_MED_DES_CEN', 'Medición desagregada en las Subunidades y cumplimentada de manera centralizada por el responsable de medición del Indicador.');
define('TXT_MED_ESTA', 'esta Medición');
define('TXT_MED_ACARGO', 'Mediciones a su cargo');
define('TXT_MED_VOLVER', 'Volver a las Mediciones');
define('TXT_MED_MOSTRAR', 'Mostrar Mediciones');
define('TXT_MED_BORRAR', 'Borrar Medición');
define('TXT_MED_ACT_TODAS', 'Activar todas las Mediciones.');
define('TXT_MED_DESACT_TODAS', ' Desactivar todas las Mediciones.');
define('TXT_MED_PROGRAM', 'Programar Medición');
define('TXT_MED_VALORES', 'Valor o conjunto de valores de la Medición actual');
define('TXT_MED_DATOS', 'Datos de la Medición');
define('TXT_MED_GESTION', 'Gestión de Mediciones');
define('TXT_MED_AGREGAR', 'Agregar Medición');

//Menú Principal
define('TXT_INICIO', 'Inicio');
define('TXT_CUADROS_MANDO', 'Cuadros de Mando');
define('TXT_USERS', 'Usuarios');
define('TXT_AYUDA', 'Ayuda');
define('TXT_MIS_NOTAS', 'Mis notas');
//Menú de Unidades
define('TXT_CUAD_RES', 'Cuadro Resumen');

//Mostrar
define('TXT_MOSTRAR', 'Mostrar');
define('TXT_MOSTRAR_RESUL', 'Mostrar resultado');

//Navegación
define('TXT_VER', 'Ver');
define('TXT_SI', 'Si');
define('TXT_NO', 'No');
define('TXT_SIG', 'Siguiente');
define('TXT_ANT', 'Anterior');
define('TXT_EDIT', 'Editar');
define('TXT_BORRAR', 'Borrar');

//Páginas
define('TXT_PAG', 'Página');
define('TXT_PAG_NUEVA', 'Nueva Página');
define('TXT_PAG_AYUDA_NUEVA', 'Nueva Página de Ayuda');
define('TXT_PAG_EDIT', 'Editar Página');

//Procesos
define('TXT_PROCS', 'Procesos');
define('TXT_PROC_PARAM', 'Parámetros del Proceso');
define('TXT_PROC_VOLVER', 'Volver al Proceso');
define('TXT_PROC_FICHA', 'Ficha del Proceso');
define('TXT_PROC_NUEVO', 'Nuevo Proceso');
define('TXT_PROC_LIST', 'Lista de Procesos');
define('TXT_PROC_ES_MADRE', 'Es un Proceso Madre');
define('TXT_PROC_VERSION', 'Número de la versión actual de la ficha de Proceso');
define('TXT_PROC_EDIT', 'Editar Proceso');
define('TXT_PROC_CREAR', 'Crear Proceso');
define('TXT_PROC_BORRAR', 'Borrar Proceso');
define('TXT_PROC_INDICS', 'Indicadores asociados al Proceso');
define('TXT_PROC_FLUJO', 'Flujograma del Proceso');
define('TXT_PROC_ARCHIVOS', 'Archivos asociados al Proceso');

//Propiedades
define('TXT_EDIT_PROP', 'Editar propiedades');
define('TXT_OTRAS_PROP', 'Otras propiedades');

//Propiedades HTML: Titles, placeholders, values de botones...
define('TXT_CODIGO', 'Único, fácil de recordar y sin espacios');
define('TXT_BORRAR_CONFIRM', 'Confirmar borrado');
define('TXT_GRABAR', 'Grabar');
define('TXT_CANCEL', 'Cancelar');
define('TXT_GEN_INFO', 'Generar informe');
define('TXT_BTN_ENVIAR', 'Enviar');
define('TXT_BTN_Aceptar', 'Aceptar');
define('TXT_BTN_GUARDAR', 'Guardar');
define('TXT_BTN_GRABAR_NOTA', 'Grabar nota');
define('TXT_SOLO_INDIC_CALC', 'Sólo si es un indicador calculado');
define('TXT_BUSCAR', 'Buscar...');
define('TXT_INDICAR_COD', 'Indique un código estandarizado y único');
define('TXT_FECHA_REV_ACTUAL', 'Fecha de la revisión actual');

//Selecciones
define('TXT_SEL', 'Seleccionar...');
define('TXT_SEL_UNO', 'Seleccionar uno...');
define('TXT_ELEG_UNO', 'Elegir uno si procede');
define('TXT_SEL_RAIZ_COD_UNID', 'Seleccionar la raíz del código de unidad para el grupo que desee:');
define('TXT_SEL_RESP_GRABAR', 'Elegir nuevo responsable de grabación ...');
define('TXT_CONFIRM', 'Por favor, confirme que desea');

//Tiempo
define('TXT_HISTORICO', 'Histórico anual');
define('TXT_RANGO_FECHAS', 'Rango de fechas');
define('TXT_ANUAL', 'Anual');
define('TXT_MENSUAL', 'Mensual');
define('TXT_TRIMESTRAL', 'Trimestral');
define('TXT_CUATRIMESTRAL', 'Cuatrimestral');
define('TXT_SEMESTRAL', 'Semestral');
define('TXT_2_ULT_ANYO', 'Dos últimos años');

//Tipos de Cálculo
define('TXT_INDEF', 'Indefinido');
define('TXT_PROMED', 'Promedio');
define('TXT_SUMA', 'Suma');

//Tipos de Exportación
define('TXT_RTF', 'Rtf');
define('TXT_EXCEL', 'Excel');

//Tipos de Proceso
define('TXT_APOYO', 'Apoyo');
define('TXT_OPERATIVO', 'Operativo/Clave');
define('TXT_DIR_GES', 'Directivo/Estratégico/Gestión');

//Tipos de Representaciones Gráficas
define('TXT_GRAFIC_INDIC_VAL', 'Gráfica con los valores del indicador');
define('TXT_GRAFIC_VAL_MED', 'Gráfica completa con los valores medios del indicador');
define('TXT_BARRAS', 'Barras');
define('TXT_BARRAS_DESC', 'Puede mostrar varios grupos de indicadores para una subunidad determinada en forma de barras');
define('TXT_LINEAS', 'Líneas');
define('TXT_LINEAS_DESC', 'Muestra varios indicadores para distintas subunidades como gráfica de líneas.');
define('TXT_TABLA', 'Tabla');
define('TXT_TABLA_DESC', 'Puede mostrar un indicador con sus mediciones para una o más subunidades en forma de tabla de datos');
define('TXT_TARTA', 'Tarta');
define('TXT_TARTA_DESC', 'Muestra como se reparte una medición de un indicador entre las subunidades afectadas como gráfica de tarta');
define('TXT_METRICA', 'Métrica');
define('TXT_METRICA_DESC', 'Muestra una medición puntual para una unidad y un indicador en forma de dígitos.');

//Usuarios
define('TXT_USERS_ASIGNAR', 'Asignar Usuarios');
define('TXT_USERS_DESASIGNAR', 'Desasignar Usuarios marcados');
define('TXT_USERS_ALTA', 'Alta de Usuarios');
define('TXT_USERS_BAJA', 'Baja de Usuarios');
define('TXT_USER_UNIDS', 'Unidades del Usuario');
define('TXT_USERS_ASIG', 'Usuarios asignados actualmente');
define('TXT_USERS_DISP', 'Usuarios disponibles');
define('TXT_USERS_VINC', 'Vincular Usuarios');
define('TXT_USERS_DESVINC', 'Desvincular Usuarios');
define('TXT_USER_GESTION', 'Gestión de Usuarios');
define('TXT_USER_NOTAS', 'Notas del Usuario');
define('TXT_USER_REL', 'Relación de Usuarios');
define('TXT_USER_CREAR', 'Crear Usuario');
define('TXT_USER_EDIT', 'Editar Usuario');
define('TXT_USER_LIST', 'Lista de Usuarios');
define('TXT_USER_DAT', 'Datos del Usuario');

//Valores
define('TXT_VALS', 'Valores');
define('TXT_VAL_EDIT', 'Edición de Valores');
define('TXT_VAL_AGREGAR', 'Agregar Valor');
define('TXT_VALS_EDIT', 'Editar Valores');
define('TXT_VAL_IMPORT', 'Importar Valores');
define('TXT_VAL_REF', 'Valores de Referencia');
define('TXT_VAL_REC', 'Valores recogidos');
define('TXT_VAL_TABLA', 'Tabla de Valores');
define('TXT_VAL_REF_EDIT', 'Editar Valor de Referencia');
define('TXT_VAL_REF_CREAR', 'Crear nuevos Valores de Referencia');
define('TXT_VAL_REF_NUEVO', 'Nueva Referencia');
define('TXT_VALS_DESACT', 'Desactivar Valores');

//Visibilidad, permisos
define('TXT_TODOS', 'Todos');
define('TXT_PUBLICO', 'Público');
define('TXT_PRIVADO', 'Privado');

//Volver
define('TXT_VOLVER', 'Volver al');
define('TXT_VOLVER_INDICE', 'Volver al índice');
define('TXT_VOLVER_LIST', 'Volver al listado');

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
define('MSG_NO_SESION', 'Debe iniciar sesión.');
define('MSG_GUARDAR_OK', 'Se han guardado los cambios correctamente.');
define('MSG_FIELD_REQ', '(Campo requerido)');

//Archivos
define('MSG_ARCHIVO_BORRAR_CONFIRM', 'Por favor, confirme si desea borrar el archivo');
define('MSG_ARCHIVO_SUBIDA_OK', 'Se ha subido correctamente el archivo.');
define('MSG_ARCHIVO_RENOMBRAR', 'Recuerda que el nombre del archivo es el que se verá en la relación inferior, por ello renombra tu archivo antes de subirlo para que sea clarificador para los que vayan a descargarlo.');
define('MSG_ARCHIVO_NOMBRE', 'IMPORTANTE: los nombres de los archivos no deben contener caracteres como ñ, acentos o espacios en blanco.');
define('MSG_ARCHIVO_BORRADO', 'Se ha borrado el archivo.');
define('MSG_ARCHIVOS_PROCESADOS', 'Archivos procesados');

//Cuadros de Mando
define('MSG_CUADRO_MANDO_BORRADO', 'Se ha eliminado un Cuadro de Mando.');
define('MSG_CUADRO_MANDO_NO_DEF', 'No has definido ningún Cuadro de Mando propio todavía.');
define('MSG_CUADRO_MANDO_NO_PUBLIC', 'No existe ningún Cuadro de Mando público todavía.');
//Paneles de los Cuadros de Mando
define('MSG_PANEL_BORRAR', 'Va a borrar del Cuadro de Mando el siguiente Panel:');

//Datos
define('MSG_DATO_BORRADO', 'Se ha borrado el Dato: ');
define('MSG_DATO_ACTUALIZADO', 'Se ha actualizado el Dato');
define('MSG_DATO_CREADO', 'Se ha creado un nuevo Dato');
define('MSG_DATO_EXPORT_OK', 'Los Datos se han exportado correctamente: ');
define('MSG_DATO_NO_VAL_REF', 'Es un Dato y éstos no tienen asociados valores de referencia.');
define('MSG_DATO_NO_SUBUNID_ASIG', 'No se han asignado subunidades a este Dato (corregir)');

//Dimensiones
define('MSG_DIM_CREADA', 'Se ha creado una Dimensión.');
define('MSG_DIM_EDITADA', 'Se ha modificado una Dimensión.');

//Entidades (Unidades)
define('MSG_UNID_NO_PROC', 'No hay procesos definidos para esta Unidad.');
define('MSG_UNID_USERS_BORRADOS', 'Se han eliminado de la Unidad');
define('MSG_UNID_USERS_AGREGADOS', 'Se han agregado a la Unidad');
define('MSG_UNID_EDITADA', 'La Unidad se ha modificado con los Datos que aparecen a continuación.');
define('MSG_UNID_NO_USERS', 'No se han vinculado Usuarios a esta Unidad.');
define('MSG_UNID_NO_DATOS', 'No hay Datos definidos para esta Unidad.');
define('MSG_UNID_NO_INDIC', 'No hay Indicadores definidos para esta Unidad.');
define('MSG_UNID_SUBUNIDS_NO_INDIC', 'No hay indicadores definidos para las Subunidades de esta Unidad.');
define('MSG_UNID_SUP_NO_PROC', 'La Unidad madre no tiene Procesos.');
define('MSG_UNID_NO_SEG', 'Esta Unidad no mide Indicadores segregados.');
define('MSG_UNID_NO_SUBUNIDS', 'Esta Unidad no tiene Subunidades.');
define('MSG_UNID_CREADA', 'La Unidad se ha creado correctamente con los datos que aparecen a continuación: ');
define('MSG_UNID_NO_ASIG', 'No tiene asignada ninguna Unidad.');

//Indicadores
define('MSG_INDIC_NO_UNID_SUP', 'No hay Indicadores definidos en la Unidad superior.');
define('MSG_INDIC_NO_SUBUNID_ASIG', 'No se han asignado Subunidades a este Indicador (corregir)');
define('MSG_INDIC_NO_VAL', 'No hay Valores recogidos para este Indicador.');
define('MSG_INDIC_CREADO', 'Se ha creado un nuevo Indicador.');
define('MSG_INDIC_NO_ENC', 'No se han encontrado Indicadores.');
define('MSG_INDIC_BORRADO', 'Se ha borrado el Indicador.');
define('MSG_INDIC_COPIADOS', 'Indicadores copiados.');
define('MSG_INDIC_ACTUALIZADO', 'Se han actualizado los Datos del Indicador.');
define('MSG_INDIC_NO_PUBLIC', 'Este Indicador no está definido como público.');
define('MSG_INDIC_NO_VAL_REF', 'No se han definido Valores de referencia para este Indicador.');
define('MSG_INDIC_NO_DATOS', 'Todavía no se han introducido Datos en este Indicador.');
define('MSG_INDIC_NO_MED', 'Todavía no se han definido Mediciones para este Indicador.');

//Mediciones
define('MSG_MED_NO_TIPO', 'Todavía no se han establecido Mediciones para este');
define('MSG_MED_NO_ASIG', 'No tiene asignada ninguna Medición.');
define('MSG_MED_BORRADA', 'La Medición se ha borrado con éxito.');
define('MSG_MEDS_GRABADAS', 'Mediciones grabadas');
define('MSG_MEDS_INDIC_NO_UNID', 'Mediciones en la muestra, de Indicadores que no pertenecen a la Unidad actual.');
define('MSG_MED_CREADA', 'Se ha agregado correctamente una nueva Medición. Unidades afectadas: ');

//Páginas
define('MSG_PAG_NUEVA_OK', 'La Página se ha creado correctamente.');
define('MSG_PAG_EDIT_OK', 'La Página se ha modificado correctamente.');

//Procesos
define('MSG_PROC_BORRADO', 'Se ha borrado el Proceso.');
define('MSG_PROC_GRABAR', 'Se ha grabado un nuevo Proceso para esta Unidad.');
define('MSG_PROC_NO_INDIC', 'No se ha definido ningún Indicador para este Proceso.');
define('MSG_PROC_ARCHIVO_NO', 'No se han subido archivos para este Proceso.');

//Usuarios
define('MSG_USER_BORRADO', 'Se ha borrado el Usuario.');
define('MSG_USER_CREADO', 'Se ha creado un nuevo Usuario en el sistema.');
define('MSG_USER_EDITADO', 'El Usuario se ha modificado correctamente.');
define('MSG_USERS_CONFIRM_VINC', '¿Desea vincular a la Unidad los Usuarios marcados?');
define('MSG_USERS_CONFIRM_DESVINC', '¿Desea desvincular de la Unidad los Usuarios marcados?');

//Valores
define('MSG_VAL_BORRADO', 'Se ha borrado un Valor.');
define('MSG_VAL_EXPORT', 'Exportando Valores para:');
define('MSG_VAL_GRABAR', 'El Valor se ha grabado correctamente.');
define('MSG_VAL_DESACT', 'Desea desactivar el Valor (control) del siguiente Indicador:');
define('MSG_VALS_CONFIRM_DESACT', '¿Desea desactivar los Valores marcados?');
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
define('ERR_INFORM_INDIC', 'No se puede generar el Informe del Indicador por falta de parámetros.');
define('ERR_GUARDAR', 'Hubo un problema, no se han podido guardar los cambios.');

//Archivos
define('ERR_ARCHIVO_BORRAR', "Faltan datos para procesar la solicitud de borrado del archivo.");
define('ERR_ARCHIVO_NO', 'No existe el archivo con el identificador:');
define('ERR_ARCHIVO_GRABAR', 'Error no se han podido grabar los datos del archivo.');
define('ERR_ARCHIVO_SUBIR', 'No se ha podido subir el archivo, consulte al administrador del sistema.');
define('ERR_ARCHIVO_NO_SEL', 'No se ha especificado ningún archivo para subir.');

//Cuadros de Mando
define('ERR_CUAD_MANDO', 'El Cuadro de Mando no existe o no tiene permisos para consultarlo.');
define('ERR_CUAD_MANDO_PARAM', 'Parámetros insuficientes para mostrar el Cuadro de Mando.');
define('ERR_CUAD_MANDO_EDIT', 'El Cuadro de Mando no existe o no tiene permisos para editarlo.');

//Datos
define('ERR_DATO_CREAR', 'Faltan parámetros para crear un nuevo Dato.');
define('ERR_DATO_BORRAR_MED', 'Tiene Mediciones asociadas al Dato, necesita borrar primero las Mediciones.');
define('ERR_DATO_BORRAR_NO_AUT', 'No tiene permisos para borrar el Dato.');
define('ERR_DATO_GRABAR', 'No se ha podido grabar el Dato.');
define('ERR_DATO_MOSTRAR', 'No se puede mostrar el Dato, el identificador no existe en la base de datos.');
define('ERR_DATO_IMPORT_NO_AUT', 'No tiene autorización para importar Datos en esta Unidad.');
define('ERR_DATO_EDIT_NO_AUT', 'No tiene permisos suficientes para editar Datos de esta Unidad.');

//Dimensiones
define('ERR_DIM_CREAR', 'No se ha podido crear la Dimensión.');

//Entidades (Unidades)
define('ERR_UNID', 'No ha especificado la Unidad.');
define('ERR_UNID_NO_SEL', 'No se ha especificado una Unidad para asignar usuarios.');
define('ERR_UNID_LIST_INDIC', 'No ha especificado la Unidad cuyos Indicadores desea listar.');
define('ERR_UNID_EDIT', 'No se ha podido modificar la Unidad');

//Gráficas
define('ERR_PARAM_GRAFIC', 'Faltan parámetros para mostrar la gráfica.');

//Indicadores
define('ERR_INDIC_BORRAR_MED', 'Tiene Mediciones asociadas al Indicador, necesita borrar primero las Mediciones.');
define('ERR_INDIC_BORRAR_NO_AUT', 'No tiene permisos para borrar el Indicador.');
define('ERR_INDIC_EDIT_NO_AUT', 'No tiene permisos suficientes para editar Indicadores de esta Unidad');
define('ERR_INDIC_GRABAR', 'No se ha podido grabar el Indicador.');
define('ERR_INDIC_MOSTRAR', 'No se puede mostrar el Indicador, el identificador no existe en la base de datos.');

//Mediciones
define('ERR_MED_CREAR', 'Faltan datos para procesar la petición de creación de Medición.');
define('ERR_MED_AUT', 'No tiene permisos suficientes para agregar Mediciones a este');
define('ERR_MED_TIPO_NO_BD', 'solicitado no existe en la base de datos');
define('ERR_MED_NO_VAL', 'Error: no existen valores pendientes ni recogidos para esta Medición.');
define('ERR_MED_GRABAR', 'Ha ocurrido un error al grabar la Medición, inténtelo de nuevo o contacte con los administradores de Icasus.');

//Procesos
define('ERR_PROC_BORRAR', 'Tiene Indicadores asociados al Proceso, necesita borrar primero los Indicadores.');
define('ERR_PROC_BORRAR_NO_AUT', 'No tiene persimos para borrar el Proceso.');
define('ERR_PROC_GRABAR', 'Ha ocurrido un error al grabar el Proceso.');

//Usuarios
define('ERR_LOGIN', 'Usuario o clave incorrecta.');
define('ERR_LOGIN_SSO', 'El Usuario pertenece al colectivo que tiene permiso para utilizar esta herramienta pero no se ha podido dar de alta en la herramienta. Contactar con icasus@us.es');
define('ERR_LOGIN_SSO_AUT', 'La relacion de este Usuario con la Universidad no es la definida para utilizar esta herramienta. Contactar con icasus@us.es');
define('ERR_USER_EDIT_NO_AUT', 'No tiene permiso para editar a este Usuario.');

//Valores
define('ERR_VAL_GRABAR', 'Se ha producido un error, no se ha grabado el Valor.');

//-----------------------------------------------------------------------------------
//CAMPOS DE LAS TABLAS: FIELD_[Nombre]
//-----------------------------------------------------------------------------------

define('FIELD_ID', 'Identificador');
define('FIELD_ACCIONES', 'Acciones');
define('FIELD_TITULO', 'Título');
define('FIELD_DESC', 'Descripción');
define('FIELD_VISIB', 'Visible');
define('FIELD_COD', 'Código');
define('FIELD_NOMBRE', 'Nombre');
define('FIELD_PROPIETARIO', 'Propietario');
define('FIELD_FECHA', 'Fecha');
define('FIELD_FECHA_HORA', 'Fecha/Hora');
define('FIELD_CALCULO', 'Cálculo');
define('FIELD_WEB', 'Sitio web');
define('FIELD_FUENTE', 'Fuente');
define('FIELD_HISTORICO', 'Histórico');
define('FIELD_PERIODO', 'Periodo');
define('FIELD_VISIBILIDAD', 'Visibilidad');
define('FIELD_CALC_TOTAL', 'Cálculo del total');
define('FIELD_UMBRAL', 'Umbral');
define('FIELD_OBJ', 'Objetivo');
define('FIELD_OBJP', 'Objetivo Pactado');
define('FIELD_OBJC', 'Objetivo Carta de Servicio');
define('FIELD_CREAC', 'Creación');
define('FIELD_MOD', 'Modificación');
define('FIELD_FECHA_INIC', 'Fecha inicio');
define('FIELD_FECHA_FIN', 'Fecha fin');
define('FIELD_FECHA_REV', 'Fecha de revisión');
define('FIELD_FECHA_OBTENCION', 'Fecha de obtención');
define('FIELD_FECHA_RECOGIDA', 'Fecha recogida');
define('FIELD_AGREG', 'Agregado');
define('FIELD_MET', 'Método de comprobación/evidencia');
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
define('FIELD_PENDIENTES', 'Pendientes');
define('FIELD_EVENTO', 'Evento');
define('FIELD_OBJETO', 'Objeto');
define('FIELD_CAMBIO_A', 'Cambio a:');
define('FIELD_ALIAS', 'Alias');
define('FIELD_ORDEN', 'Orden');
define('FIELD_ANCHO', 'Ancho');
define('FIELD_ANYOS', 'Años');
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

//Archivos
define('FIELD_ARCHIVO', 'Archivo');

//Cuadros de Mando
define('FIELD_NOMBRE_CUADRO', 'Nombre del Cuadro de Mando');
define('FIELD_COMENTARIOS', 'Comentarios');

//Datos
define('FIELD_RESP_DATO', 'Responsable del dato');
define('FIELD_FUENTE_DAT', 'Fuente de datos');
define('FIELD_DATOS', 'Datos');
define('FIELD_DAT_REL', 'Datos relacionados');

//Entidades (Unidades)
define('FIELD_UNID', 'Unidad');
define('FIELD_UNID_RPT', 'Unidad RPT');
define('FIELD_UNID_SUP', 'Unidad superior');
define('FIELD_UNID_GEN', 'Unidad generadora');
define('FIELD_UNID_DEST', 'Unidad de destino');
define('FIELD_SUBUNID', 'Subunidad');
define('FIELD_SUBUNIDS', 'Subunidades');
define('FIELD_SUBUNID_AFECT', 'Subunidades afectadas');
define('FIELD_UNIDS', 'Unidades');

//Gráficas
define('FIELD_VISIB_GRAFIC', 'Visible en gráfica');

//Indicadores
define('FIELD_INDIC', 'Indicador');
define('FIELD_INDIC_DAT_REL', 'Indicadores/datos relacionados');
define('FIELD_INDIC_REL', 'Indicadores relacionados');
define('FIELD_INDIC_BASE', 'Indicador base');
define('FIELD_INDIC_COMPLEMENT', 'Indicadores complementarios');
define('FIELD_INDICS', 'Indicadores');
define('FIELD_FORM', 'Formulación');
define('FIELD_FUENTE_INFO', 'Fuente de información');
define('FIELD_PERIOD', 'Periodicidad');
define('FIELD_RESP', 'Responsable');
define('FIELD_RESP_SEG', 'Responsable de seguimiento');
define('FIELD_RESP_GRABAR', 'Responsable de grabación');
define('FIELD_EFQM', 'Criterios EFQM');

//Mediciones
define('FIELD_MED', 'Medición');
define('FIELD_MEDICIONES', 'Mediciones');
define('FIELD_RESP_MED', 'Responsable de Medición');
define('FIELD_TIP_MED', 'Tipo de Medición');

//Páginas
define('FIELD_PAG_CONTENIDO', 'Contenido de la página');

//Procesos
define('FIELD_PROC', 'Proceso');
define('FIELD_PROC_MADRE', 'Proceso Madre');
define('FIELD_TIPO_PROC', 'Tipo de Proceso');
define('FIELD_SUBPROCS', 'Subprocesos');
define('FIELD_SUBPROC', 'Subproceso');
define('FIELD_EQUIP_PROC', 'Equipo de Proceso');

//Usuarios
define('FIELD_LOGIN', 'Login');
define('FIELD_USER', 'Usuario');
define('FIELD_CLAVE', 'Clave de acceso');
define('FIELD_REP_CLAVE', 'Repetir clave de acceso');
define('FIELD_APEL', 'Apellidos');
define('FIELD_TEL', 'Teléfono');
define('FIELD_CORREO', 'Correo electrónico');
define('FIELD_DNI', 'DNI o NIE (con letra)');
define('FIELD_USER_GRABA', 'Usuario que graba');
define('FIELD_ROL', 'Rol');
define('FIELD_PUESTO', 'Puesto de trabajo');

//Valores
define('FIELD_VAL', 'Valor');
define('FIELD_VAL_REF', 'Valor de referencia');
