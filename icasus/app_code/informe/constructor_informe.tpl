{literal}
<script>
//mostrar y esconder bloques html
function open_close(id)
{
        if (document.getElementById(id).style.display === 'none')
        {
                document.getElementById(id).style.display = '';
            if (id === 'dpto')
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

<form action="index.php?page=informes/cuadromando_departamento_excel" method="post" onsubmit="valida_constructor();">
<p><b>{$smarty.const.TXT_SEL_RAIZ_COD_UNID}</b><br />
<input type="radio" name="unidad" value="UE01" onclick="open_close('dpto');"> {$smarty.const.TXT_DEPARTAMENTOS}<br />
<input type="radio" name="unidad" value="UN03" onclick="open_close('biblioteca');"> {$smarty.const.TXT_BIBLIOTECAS}</p>

<p id="dpto" style="display:none"><b>{$smarty.const.TXT_INFORME_SEL_INDIC}</b><br />
<input type="checkbox" name="indicador[]" value="AOG-I1">{$smarty.const.TXT_NUM_CONVOCATORIAS}<br />
<input type="checkbox" name="indicador[]" value="AOG-I2">{$smarty.const.TXT_PLAZO_CONVOCATORIAS}<br />
<input type="checkbox" name="indicador[]" value="MS-I1">{$smarty.const.TXT_INDICE_PARTICIPACION}<br />
<input type="checkbox" name="indicador[]" value="MS-I2">{$smarty.const.TXT_INDICE_SATISFACCION}<br />
<input type="checkbox" name="indicador[]" value="GE-I1">{$smarty.const.TXT_VOL_TRAMITACION}<br />
<input type="checkbox" name="indicador[]" value="GE-I2">{$smarty.const.TXT_FIABILIDAD_TRAMIT_EXPED}<br />
</p>

<p id="biblioteca" style="display:none"><b>{$smarty.const.TXT_INFORME_SEL_INDIC}</b><br />
<input type="checkbox" name="indicador[]" value="FCPR-I01">{$smarty.const.TXT_PRESTAMO_USER}<br />
</p>

<p><b>{$smarty.const.TXT_INFORME_SEL_ANYO}</b><br />
{$anyo_actual = $smarty.now|date_format:'%Y'}
{for $anyo = $anyo_actual - 4 to $anyo_actual}
    <input type="checkbox" name="periodo[]" value="{$anyo}">{$anyo}<br />
{/for}
</p>
<p><input type="submit" value="{$smarty.const.TXT_GEN_INFO}"></p>
</form>
