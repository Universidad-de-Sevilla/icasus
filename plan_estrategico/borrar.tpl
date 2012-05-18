<div style="border:1px solid #07a; padding:0 0 0 5px;margin-top:20px" >
<h4>Va a eliminar los siguientes elementos del Plan Estrategico:</h4></div>
{if $linealistado}
<p><b>Lineas:</b><br>
        <ul><li>{$linea.titulo}.</li></ul></p>
        <p><b>Objetivos:</b><br>
        {foreach from=$objetivo item=obj }
                <ul><li>{$obj.titulo|htmlentities}.</li></ul>
        {/foreach}</p>
        <p><b>Acciones:</b><br>
        {foreach from=$accion item=acc}
                <ul><li>{$acc.acciontitulo|htmlentities}.</li></ul>
        {/foreach}</p>
	<form action="" method="post">
	<input name="borrar" type="submit" value="Eliminar" onclick="javascript:return confirm('Eliminar los elementos');">
        <input name="borrarlinea" type="hidden" value="borrarlinea" />
	</form>
{/if}

{if $objetivolistado}
        <p><b>Objetivos:</b><br>
        {foreach from=$objetivo item=obj }
                <ul><li>{$obj.titulo|htmlentities}.</li></ul>
        {/foreach}</p>
        <p><b>Acciones:</b><br>
        {foreach from=$accion item=acc}
                <ul><li>{$acc.titulo|htmlentities}.</li></ul>
        {/foreach}</p>
	<form action="" method="post" >
        <input name="borrarobjetivo" type="hidden" value="borrarobjetivo" />
        <input name="borrar" type="submit" value="Eliminar" onclick="javascript:return confirm('Eliminar los elementos');">
        </form>
{/if}
{if $accionlistado}
	<p><b>Acciones:</b><br>
        {foreach from=$accion item=acc}
                <ul><li>{$acc.titulo|htmlentities}.</li></ul>
        {/foreach}</p>
	<form action="" method="post" >
	<input name="borraraccion" type="hidden" value="borraraccion" />
        <input name="borrar" type="submit" value="Eliminar" onclick="javascript:return confirm('Eliminar los elementos');">
        </form>

{/if}
