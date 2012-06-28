<div id="topbar" class="clearfix">
	
	<a href="index.php" class="logo"><span>iCasus</span></a>
	<!-- 
	<div class="user_box dark_box clearfix">
		 <img src="images/profile.jpg" width="55" alt="Profile Pic" />  
		<h2>A</h2>
		<h3><a href="#">Usuario</a></h3>
		<ul>
			<li><a href="#">Configuraci&oacute;n</a><span class="divider">|</span></li>
			<li><a href="login.php">Salir</a></li>
		</ul>
	</div><!-- #user_box -->
	
</div><!-- #topbar -->			

<div id="sidebar">
	<div class="cog">+</div>
	<a href="index.php" class="logo"><span>iCasus</span></a>
	
	<div class="user_box dark_box clearfix">
		<img src="../public/theme/danpin/images/profile.jpg" width="55" alt="Profile Pic" />  
		<h2>Bienvenido</h2>
		<h3><a href="#">Usuario</a></h3>
		<ul>
			<li><a href="#">Configuraci&oacute;n</a><span class="divider">|</span></li>
			<li><a href="login.php">Salir</a></li>
		</ul>
	</div><!-- #user_box -->

		<span>
			<a href="#"><strong>Navegaci&oacute;n</strong></a>
		</span>
		<ul class="side_accordion">
	      		<li><a href='index.php?page=inicio' accesskey='h'><img src='/icons/ff16/house.png' /> Inicio</a> 
				<!-- <li><a href='index.php?page=cuadromando_listar'><img src='/icons/ff16/table.png' /> Cuadros de Mando</a></li> -->
				<li><a href='index.php?page=entidad_listar'><img src='/icons/ff16/chart_organisation.png' /> Unidades</a></li>
				<li><a href='index.php?page=usuario_listar'><img src='/icons/ff16/user.png' /> Usuarios</a></li>
				<li><a href='index.php?page=pagina_mostrar&alias=indice'><img src='/icons/ff16/user_comment.png' /> Ayuda</a></li>
				<li><a href='index.php?page=nota_mostrar'><img src='/icons/ff16/note_edit.png' /> Mis notas</a></li>
	    </ul>
	<!-- <form>
		<div id="search_side" class="dark_box"><input class="" type="text" value="Buscador..." onClick="value=''"></div>
	</form>
	 -->
	
	

	{if isset($entidad)}
	<ul id="side_links" class="side_links" style="margin-bottom:0;">
		<span>
			<a href="#"><strong>Unidad actual</strong></a>
		</span>
		<li>
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
	</ul>	
	{/if}
	<ul id="side_links" class="side_links" style="margin-bottom:0;">
		<span>
				<a href="#"><strong>Enlaces externos</strong></a>
		</span>
		<li>
			<ul>
				<li><a href='http://www.us.es/'>Universidad de Sevilla</a></li>
				<li><a href='https://www.r2h2.us.es/excelencia'>Excelencia</a></li>
				<li><a href='http://www.r2h2.us.es/'>Recursos Humanos</a></li>
				<li><a href='http://buzonweb.us.es/'>Correo US</a></li>
				<li><a href='http://www.google.es/'>Google</a></li>
			</ul>
		</li>
	</ul>
</div><!-- #sidebar -->
