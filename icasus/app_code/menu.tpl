<ul>
	<li>
		<h3>Navegaci&oacute;n</h3>
		<ul>
			<li><a href='index.php?page=cuadromando_listar'><img src='/icons/ff16/table.png' /> Cuadros de Mando</a></li>
			<li><a href='index.php?page=entidad_listar'><img src='/icons/ff16/chart_organisation.png' /> Unidades</a></li>
			<li><a href='index.php?page=usuario_listar'><img src='/icons/ff16/user.png' /> Usuarios</a></li>
			<li><a href='index.php?page=pagina_mostrar&alias=indice'><img src='/icons/ff16/user_comment.png' /> Ayuda</a></li>
			<li><a href='index.php?page=nota_mostrar'><img src='/icons/ff16/note_edit.png' /> Mis notas</a></li>
    </ul>
	</li>


	{if isset($entidad)}
		<li>
			<h3>Unidad actual</h3>
			<ul>
				<li><a href='index.php?page=cuadromando_entidad&id_entidad={$entidad->id}'><img 
					src='/icons/ff16/table_go.png' />
					Cuadro resumen</a></li>
				<li><a href='index.php?page=proceso_listar&id_entidad={$entidad->id}'><img 
					src='/icons/ff16/cog.png' />
					Listar procesos</a></li>
				<li><a href='index.php?page=indicador_listar&id_entidad={$entidad->id}'><img 
					src='/icons/ff16/chart_curve.png' />
					Listar indicadores</a></li>
				<li><a href='index.php?page=indicador_crear&id_entidad={$entidad->id}'><img 
					src='/icons/ff16/chart_curve_add.png' />
					Crear indicador</a></li>
				<li><a href='index.php?page=entidad_datos&id_entidad={$entidad->id}'><img 
					src='/icons/ff16/chart_organisation.png' alt='icono' /> Ver unidad</a></li>
			</ul>
		</li>	
	{/if}
	
	<li>
		<h3>Enlaces externos</h3>
		<ul>
			<li><a href='http://www.us.es/'>Universidad de Sevilla</a></li>
			<li><a href='https://www.r2h2.us.es/excelencia'>Excelencia</a></li>
			<li><a href='http://www.r2h2.us.es/'>Recursos Humanos</a></li>
			<li><a href='http://buzonweb.us.es/'>Correo US</a></li>
			<li><a href='http://www.google.es/'>Google</a></li>
		</ul>
	</li>
</ul>
