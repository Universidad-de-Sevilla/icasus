<!--
<form action='index.php?page=usuario_listar' method="post" class="mini" name="formfiltro">
  <label for='criterio'>Buscar:</label> 
  <input name='criterio' type='text' class='inp' value='{if $criterio}{$criterio}{/if}'/>
  <input type='submit' name='submit-buscar' value='Aceptar' />
</form>
-->

<div class="box grid_16 single_datatable">
    <div id="dt1" class="no_margin">
        <table class="display datatable"> 
            <thead>
                <tr>
                    <th>{$smarty.const.FIELD_NOMBRE}</th>
                    <th>{$smarty.const.FIELD_APEL}</th>
                    <th>{$smarty.const.FIELD_CORREO}</th>
                    <th>{$smarty.const.FIELD_TEL}</th>
                    <th>{$smarty.const.FIELD_UNID_DEST}</th>
                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$usuarios item=usuario}
                    <tr class="gradeX">
                        <td>{$usuario->nombre}</td>
                        <td>{$usuario->apellidos}</td>
                        <td><a href='mailto:{$usuario->correo}'>{$usuario->correo}</a></td>
                        <td>{$usuario->telefono}</td>
                        <td>{$usuario->unidad_hominis}</td>
                        <td>
                            <a title="{$smarty.const.FIELD_DET}" href='index.php?page=usuario_mostrar&id_usuario={$usuario->id}'>
                                <img src='/icons/ff16/magnifier.png' />
                            </a>
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>
