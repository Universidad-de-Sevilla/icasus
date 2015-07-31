<?php
	 /**
	  *
	  * TODAVIA NO ESTÁ PREPARADO PARA LINDOGATITO
	 *
	 * function obtenerPregunta()
	 * 
	 * Obtiene una pregunta en formato html, si la pregunta pertenece a un grupo nuevo tambien imprime el nombre del grupo
	 *
	 * @param array $registro Fila de datos con la pregunta y sus parametros
	 * @return string Código html de la pregunta
	 *
	 */
	function obtenerPregunta($registro,$contador,$id_objeto_hijo=null)
	{
		$pregunta = '';

		if ($this->grupo_actual <> $registro['nombre'])
		{
			$this->grupo_actual = $registro['nombre'];
			$pregunta .= "<tr><th colspan='2'>" . utf8_encode($this->grupo_actual) . "</th></tr>\n";
		}
		
		$tr_class = ($contador%2 == 0)?'par':'impar';
		$pregunta .= "<tr class='$tr_class'>\n";
		// Cada tipo de pregunta tiene que ser marcada y mostrada de una forma diferente
		// - Gradiente: marca "ra" y mostrada como conjunto de "input radio"
		// - Abierta: marca "tx" y mostrada como "text"
		// - Opción múltiple abierta: marcas "ch" + "in" y mostrada como conjunto de "checbox" más "input"
		// - Opción múltiple cerrada: marca "ch" y mostrada como conjunto de "checbox"
		// -
		switch ($registro['tipo'])	
		{
			case 'gradiente':
				$opciones = split(',',$registro['opciones']);
				
				$pregunta .= '<td>' . utf8_encode($registro['texto']) . '</td><td>';
				foreach ($opciones as $opcion)
				{	
					$pregunta .= "&nbsp; &nbsp; $opcion<input type='radio' name='ra" . $registro['id_pregunta_encuesta']; 
					$pregunta .= $id_objeto_hijo?"_$id_objeto_hijo":""; // Por si hay hermanos
					$pregunta .= "' value='$opcion' />";
				}
				break;

			case 'abierta':
				$pregunta .= "<td colspan='2'>" . utf8_encode($registro['texto']) . '<br />';
				$pregunta .= "<textarea cols='95' rows='6' name='tx" . $registro['id_pregunta_encuesta'];
				$pregunta .= $id_objeto_hijo?"_$id_objeto_hijo":""; // Por si hay hermanos
			   	$pregunta .= "'></textarea>";
				break;

			case 'opcion multiple abierta':
				$opciones = $this->obtener_opciones($registro['id_pregunta_encuesta']);
				$pregunta .= "<td colspan='2'>" .utf8_encode($registro['texto']) . '<br />';
				foreach ($opciones as $opcion => $valor)
				{
					$pregunta .= "<input type='checkbox' name='ch" . $registro['id_pregunta_encuesta'];
					$pregunta .= $id_objeto_hijo?"_$id_objeto_hijo":""; // Por si hay hermanos
					$pregunta .= "[]' value='" . $valor . "' />&nbsp;";
					$pregunta .= utf8_encode($opcion) . "<br />\n";
				}
				$pregunta .= "Otros/as <input type='input' name='in" . $registro['id_pregunta_encuesta'];
				$pregunta .= $id_objeto_hijo?"_$id_objeto_hijo":""; // Por si hay hermanos
				$pregunta .= "' /><br />\n";
				break;

			case 'opcion multiple cerrada':
				$opciones = $this->obtener_opciones($registro['id_pregunta_encuesta']);
				$pregunta .= "<td colspan='2'>" .utf8_encode($registro['texto']) . '<br />';
				foreach ($opciones as $opcion => $valor)
				{
					$pregunta .= "<input type='checkbox' name='ch" . $registro['id_pregunta_encuesta'];
					$pregunta .= $id_objeto_hijo?"_$id_objeto_hijo":""; // Por si hay hermanos
					$pregunta .= "[]' value='" . $valor . "' />&nbsp;";
					$pregunta .= utf8_encode($opcion) . "<br />\n";
				}
				break;

			case 'opcion unica abierta':
				break;
			
			case 'opcion unica cerrada':
				break;
			
			case 'dato';
				break;
		}
		$pregunta .= "</td></tr>\n";
		return $pregunta;
	}

