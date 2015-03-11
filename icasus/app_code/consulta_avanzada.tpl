<style>

    div.receptor {
        width: 85%;
        min-height: 20px;
        border: 1px dashed #cacaca;
        margin: 5px 20px;
        padding: 3px 5px;
        font-size: 10pt;
    }

    div.activo {
        border: 1px dashed maroon;
        background: #f2f2f2;
    }

    div.operador {
        margin: 5px 20px;
        padding: 3px 5px;
    }

    .pull-right {
        float: right;
    }

    .tabla_datos caption {
        font-size: 15px;
        text-align: left;
        color: #444;
        padding: 5px 5px;
        margin-bottom: 1px;
        border: 1px solid maroon;
    }

    .block > .section > ul.mediciones {
        list-style: none;
    }

    .block > .section > ul.mediciones > li {
        display: inline;
        margin: 10px;
        border: 0;
    }

    a.medicion{
        border: 1px solid #cacaca;
        padding: 3px 15px;
    }

    a.actual {
        background: #f2f2f2;
    }

</style>

<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_CONSULT_PARAM}</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class ="columns clearfix">
        <!-- El buscador de datos e indicadores -->
        <div class="col_50 no_border">
            <div class="block no_border">
                <div class="section">
                    <div id="dt1">
                        <table class="display datatable">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_NOMBRE}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $indicadores as $indicador}
                                    <tr class="gradeX">
                                        <td>{$indicador->codigo}</td>
                                        <td><a href="#" class="indicador" id_indicador="{$indicador->id}">{$indicador->nombre}</a></td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div><!-- #dt1 -->
                </div><!-- .section -->
            </div><!-- .block -->
        </div><!-- .col_50 -->

        <!-- El receptor de datos e indicadores que los mezcla con las operaciones -->
        <div class="col_50">
            <div class="block">
                <div class="section">

                    <div class="receptor" data-serie="0"> </div>

                    <div>
                        <select class="operador" data-serie="0">
                            {foreach $operaciones as $operacion}
                                <option value="{$operacion.0}">{$operacion.1}</option>
                            {/foreach}
                        </select>
                    </div>

                    <div class="receptor" data-serie="1"> </div>

                    <div>
                        <select class="operador" data-serie="1">
                            {foreach $operaciones as $operacion}
                                <option value="{$operacion.0}">{$operacion.1}</option>
                            {/foreach}
                        </select>
                    </div>

                    <div class="receptor" data-serie="2"> </div>

                    <div>
                        <select class="operador" data-serie="2">
                            {foreach $operaciones as $operacion}
                                <option value="{$operacion.0}">{$operacion.1}</option>
                            {/foreach}
                        </select>
                    </div>

                    <div class="receptor" data-serie="3"> </div>

                    <div>
                        <select class="operador" data-serie="3">
                            {foreach $operaciones as $operacion}
                                <option value="{$operacion.0}">{$operacion.1}</option>
                            {/foreach}
                        </select>
                    </div>

                    <div class="receptor" data-serie="4"> </div>

                    <button class="pull-right" id="btn_mostrar_resultado">{$smarty.const.TXT_MOSTRAR_RESUL}</button>

                </div><!-- .section -->
            </div><!-- .block -->
        </div><!-- .col_50 -->
    </div><!-- .columns .clearfix -->
</div><!-- .box .grid_16 --!>

<!-- La tabla con los resultados obtenidos y los datos de partida -->
<div class = "box grid_6 no_titlebar" id="tablas" style="margin-left: 0.9%; margin-right: 0.9%;">
    <div class="block">
        <div class="section tabla_datos" id="tablar">
        </div>
        {for $i = 0 to 4}
            <div class="section tabla_datos" id="tabla{$i}">
            </div>
        {/for}
    </div>
</div><!-- .box .grid_6 -->

<!-- La gráfica con los resultados obtenidos -->
<div class = "box grid_10 no_titlebar" style="margin-left: 0.9%; margin-right: 0.9%;">
    <div class="block">

        <div class="section">
            <ul class="mediciones">
                <li><a href="#" class="medicion actual">{$smarty.const.TXT_TODOS}</a></li>
                    {$anyo_actual = $smarty.now|date_format:'%Y'}
                    {for $anyo = $anyo_actual - 5 to $anyo_actual}
                    <li><a href="#" class="medicion">{$anyo}</a></li>
                    {/for}
            </ul>
        </div>

        <div class="section">
            <div id="grafica" style="width:100%;height:400px">
            </div>
        </div>

    </div>
</div><!-- .box .grid_10 -->

<script src="theme/danpin/scripts/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="js/consulta_avanzada.js" type="text/javascript"></script>
