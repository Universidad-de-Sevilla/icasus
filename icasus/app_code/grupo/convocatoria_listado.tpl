<table width="95%" style = "margin:20px;border:1px dotted #07a">
  <tr><th width="15%">Lugar</th><td width="85%" >{$acta->lugar}{$lugar}</td></tr>
  <tr><th>Fecha inicio</th><td>{$fecha|date_format:"%d-%m-%Y"}{$acta->fecha|date_format:"%d-%m-%Y"}</td></tr>
  <tr><th>Hora inicio</th><td>{$fecha|date_format:"%H:%M"}{$acta->fecha|date_format:"%H:%M"}</td></tr>
  <tr><th>Fecha fin</th><td>{$fin|date_format:"%d-%m-%Y"}{$acta->fin|date_format:"%d-%m-%Y"}</td></tr>
  <tr><th>Hora fin</th><td>{$fin|date_format:"%H:%M"}{$acta->fin|date_format:"%H:%M"}</td></tr>
</table>

