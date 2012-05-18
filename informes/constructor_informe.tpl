{literal}
<script>
//mostrar y esconder bloques html
function open_close(id)
{
        if (document.getElementById(id).style.display == 'none')
        {
                document.getElementById(id).style.display = ''; 
        	if (id == 'dpto')
		{
	        	document.getElementById('biblioteca').style.display = 'none'; 
		}
		else
		{
	        	document.getElementById('dpto').style.display = 'none'; 
		}
	} 
        else
        { 
                document.getElementById(id).style.display = 'none';
        }
}
</script>
{/literal}

<form action="index.php?page=informes/cuadromando_departamento_excel" method="post" onsubmit="valida_constructor()">
<p><b>Seleccionar la raíz del código de unidad para el grupo que desee:</b><br />
<input type="radio" name="unidad" value="UE01" onclick="open_close('dpto')"> Departamentos<br />
<input type="radio" name="unidad" value="UN03" onclick="open_close('biblioteca')"> Bibliotecas</p> 

<p id="dpto" style="display:none"><b>Seleccionar los indicadores que contendré el informe:</b><br />
<input type="checkbox" name="indicador[]" value="AOG-I1">Número de convocatorias<br />
<input type="checkbox" name="indicador[]" value="AOG-I2">Plazo convocatorias<br />
<input type="checkbox" name="indicador[]" value="MS-I1">Índice de participación<br />
<input type="checkbox" name="indicador[]" value="MS-I2">Índice de satisfacción general<br />
<input type="checkbox" name="indicador[]" value="GE-I1">Volumen tramitación<br />
<input type="checkbox" name="indicador[]" value="GE-I2">Fiabilidad tramitación expedientes<br />
</p>

<p id="biblioteca" style="display:none"><b>Seleccionar los indicadores que contendré el informe:</b><br />
<input type="checkbox" name="indicador[]" value="FCPR-I01">Préstamo por usuario potencial<br />
</p>

<p><b>Seleccionar los años que se reflejarán en el informe:</b><br />
<input type="checkbox" name="periodo[]" value="2009">2009<br />
<input type="checkbox" name="periodo[]" value="2010">2010<br />
<input type="checkbox" name="periodo[]" value="2011">2011<br />
<input type="checkbox" name="periodo[]" value="2012">2012<br />
</p>
<p><input type="submit" value="Generar informe"></p>
</form>
