{if $okanuncio}
{$okanuncio}
<div style="border:1px solid #07a; padding:10px;margin-top:20px">

{if $lineacreada}
<p><b><u>N&uacute;mero:</u></b><br>
{$lineacreada->idorden} </p>
<p><b><u>T&iacute;tulo:</u></b><br>
{$lineacreada->titulo}</p>
<p><b><u>Descripci&oacute;n</u></b><br>
{$lineacreada->descripcion}</p>
{/if}
  
{if $lineamodificada }
<p><b><u>N&uacute;mero:</u></b><br>
{$lineamodificada->idorden} </p>
<p><b><u>T&iacute;tulo:</u></b><br>
{$lineamodificada->titulo}</p>
<p><b><u>Descripci&oacute;n</u></b><br>
{$lineamodificada->descripcion}</p>
{/if}

{if $objetivocreado}
<p><b><u>N&uacute;mero:</u></b><br>
{$objetivocreado->idorden} </p>
<p><b><u>T&iacute;tulo:</u></b><br>
{$objetivocreado->titulo}</p>
<p><b><u>Descripci&oacute;n:</u></b><br>
{$objetivocreado->descripcion}</p>
{/if}

{if $objetivomodificado}
<p><b><u>N&uacute;mero:</u></b><br>
{$objetivomodificado->idorden} </p>
<p><b><u>T&iacute;tulo:</u></b><br>
{$objetivomodificado->titulo}</p>
<p><b><u>Descripci&oacute;n:</u></b><br>
{$objetivomodificado->descripcion}</p>
{/if}

{if $accioncreada}  </p>
<p><b><u>N&uacute;mero:</u></b><br>
  {$accioncreada->idorden} </p>
<p><b><u>T&iacute;tulo:</u></b><br>{$accioncreada->titulo}</p>
<p><b><u>Descripci&oacute;n</u></b><br>
  {$accioncreada->descripcion}</p>
<p><b><u>Plazo:</u></b><br>
  {$accioncreada->plazo}</p>
  <p><b><u>Responsable:</u></b><br>
  {$accioncreada->responsable}</p>
  <p><b><u>Meta:</u></b><br>
  {$accioncreada->meta}</p>
  <p><b><u>Fecha:</u></b><br>
  {$accioncreada->fecha|date_format:'%d-%m-%Y'}</p>
<p>{/if}
  {if $accionmodificada}  </p>
<p><b><u>N&uacute;mero:</u></b><br>
  {$accionmodificada->idorden} </p>
<p><b><u>T&iacute;tulo:</u></b><br>
  {$accionmodificada->titulo}</p>
<p><b><u>Descripci&oacute;n:</u></b><br>
  {$accionmodificada->descripcion}</p>
<p><b><u>Plazo:</u></b><br>
  {$accionmodificada->plazo}</p>
  <p><b><u>Responsable:</u></b><br>
  {$accionmodificada->responsable}</p>
  <p><b><u>Meta:</u></b><br>
  {$accionmodificada->meta}</p>
  <p><b><u>Fecha:</u></b><br>
  {$accionmodificada->fecha|date_format:'%d-%m-%Y'}</p>

{/if}
</div>
{/if}
